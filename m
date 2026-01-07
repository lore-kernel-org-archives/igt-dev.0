Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CACF6BFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 08:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE28010E06D;
	Wed,  7 Jan 2026 08:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htARaDe0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619D010E06D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767774658; x=1799310658;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cHkNiVgrWjcYKdjU2bbi/HG/nwWTu/Uw2qEnGOC6Xdk=;
 b=htARaDe0AjwA02uU0qUbc1LBHVqBx627VYMmfpTPoGLo1oN4UbTnEQx+
 iq0edGEr0AjDHNVAaNtVqgqtLqUb6gBi/z/UXGncR47AQxDNJyBAJMlWi
 kNAYXa7KXCLdKELIHSQw5lNNqX+ATx1E87UPVwLYeYhM6axakrUW+vJ8u
 lrC3sVbiYX6bFBs0IN/kv5NoWQZbmFXg3NonsNQOUgpD9VckruePdJGbT
 qfBaw9Edjtm8JOXzB0sAQDtshfMVfECSeEPdNDtO2CrFkGqdTCEDouWQU
 JV7zcNNGtlIQmaR591NFRuKCi55oIClEYSWd5eUCtl83Jumb/hnNI971v w==;
X-CSE-ConnectionGUID: H4Rjr73PRGiXD37GtU3aEQ==
X-CSE-MsgGUID: S1mN4lxMTAOVxUriDg1cJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72771827"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="72771827"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 00:30:57 -0800
X-CSE-ConnectionGUID: b4hs1Oc/Q+SGI5geMiveHw==
X-CSE-MsgGUID: /0B4iorKSfyeVeg/pLdE/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202772430"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 00:30:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 00:30:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 00:30:56 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 00:30:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0kfxhyH7qWcT38c6cixnoRD0541BfkVeJRHPdwdOXSPf4UykJ+vwT6vo//axV4idVdlNT4AdF7A7+2fO2InlW3yU9IFcgwwV/+8laeOh8CoAQ5EdjnSugRS9BfeY6SIDI8rOC3xnL23frVme7OVcBty0Wd5kjAWmSySpWegdZmQL1INJGFdJk1KGCOV08zAQiaRO0GDAZc7gFtnTjyeexF0o8X8XCnzsC97mUa1+Dzr4zRXp5+g0Ykf41cJaagyvHD/+o3iIGoB0sITfiwdfefdnmmKRFSaJcybR0mg/YWhrjcpQndhZ139u+5gfqtz+dISVeOaGNn1Q1pSEpTYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBLM9qkZxcdvbO+CaIKcyoJk2+gVTFvu/Ks7hmCBamM=;
 b=R8nKy43BcOPqPdR0mKcemtMIclPDzIavw6BONJYIOtBue6hORIM2T8qUorCDwQmGw+y1cBYKlk1ljX9HmO2fDxYLvQvpr3msV7ucZlY6/8sKCzwnIjbVEZhgstXtinLd3ZFK24HBToiKHbbmeAE4X8+RpW+1aCv2cRp0sbw/UI8dtm62cjRl6I167U+8vIwYUPDYEFvSrBk8bHPjgqll41dYC5amYpeQYp9AQl8ouo4CJ8TYoMXXLRC4uX4Dv+nZPZtJGBQ2hh0tdKiMnLxfL1a9B1BwflO39F+Ia8fCVu/+SNp4JLasJN6i8TGCpCD7azYjY6z7aNKvfkxo6mM9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 08:30:47 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 08:30:47 +0000
Message-ID: <fe275fc6-a8d7-4726-a7ad-fffda461ff69@intel.com>
Date: Wed, 7 Jan 2026 14:00:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Update BMG display blocklist
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260107082901.594598-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260107082901.594598-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 672ca74a-be05-4b51-c027-08de4dc70e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qkd1dy9Hd0oydG1zU3RJNlNtSDBUb0RaMU51T25ncHJINVc3OEVVMnUzenFC?=
 =?utf-8?B?R1VZMEd1ZGRJcHhGQ093emtIeEtqWks2cW1nU0ZRVUNtd2FVdXNaVXBBblEz?=
 =?utf-8?B?Z0QzcWtVWXJaZ1dpbDBDeG9sYTNUS2FONzMyMkFjQnprckp5cEtCYVB2Tnhw?=
 =?utf-8?B?aHJnamNSb3JId0VHUVVvbjZrNEpXV2tpME40UHB5NnNVOTV2cDU1L05mQ3FD?=
 =?utf-8?B?Z0t3NnA1VWpoNG80QjRYU0hzS0xtWlQraUdVQ28yRkIzSnh4V1gxOFBVbGxN?=
 =?utf-8?B?MVhXMjhwanlneWwyeGx5c0JCWGJJc3o3S3pMWERGMmtGL1VrbjRsb0RTZDh1?=
 =?utf-8?B?SDVVWjZVa01IVktDbXJKVW40Z1BTdWhYM2VqbmhiK1lBMFBBV3JMdHV0dXZ2?=
 =?utf-8?B?c3FyeG1UWHZTZnBWVEhHMUhPOE14eUcvZGQzdnk0V24rTTNoQWp0Qitlckw2?=
 =?utf-8?B?UDZvamVMQjlSSDUva0J2ZVJwZkZOT0YwSWlKd2FKeTlNdUduOGdjcmZJWFM0?=
 =?utf-8?B?SS9sbzhWd0lSYUxWaHZtSWZIdExVNGpnRWJkZFMrbGdGYm5kM2xnTmpKYzBV?=
 =?utf-8?B?Z2ZOZGJGRVpRbDNGU2N5RHliWXhueDJ1KzNnSUl3SHdDb240eFYzYWd4WitM?=
 =?utf-8?B?NEtpSzRBUTMxNVpaUWJLR0UrN3hOanl4aWpLblVLUGRYK1RqTC96MnRlVFpK?=
 =?utf-8?B?Q1V5NkJUNXRtbThyZFdQTjFwN3I4UXc1b2hTMU45b2V6bUhpRVFRZlBpaXZr?=
 =?utf-8?B?WlVTNHMwUmlZejVzSzZZMlI2ODgzejMwUEZBZlYrZE1ORFdtWmozd2x2VmMv?=
 =?utf-8?B?d3h4MEdPQlBCZWlHUThkODM3b3pUNVE0U2VYVHpVRVVSUXhla2x0RW5RTnFm?=
 =?utf-8?B?WVo4SmJoM1YrYXhtUVp3QTNYa2Y4Z2JzSG1xVzZ1QlNBdGUybGRyTVdMd3V3?=
 =?utf-8?B?UWRTY05RQzdjY2FCemJGYjhGbDJLMzJmejRHMitRbzV2Y1FRMlZnSGp1YjFN?=
 =?utf-8?B?d2hUWnFsckp2YXJnWWhDb0svTWlLdHlLSjFMNGxFQ1Qzd0MvZCtwTnlxWjJF?=
 =?utf-8?B?WVhEeGpYWnl5QkpNZnRDd0owQUJjcDZoNjMyMitYZzNNNFpwRCt0L05hYzh5?=
 =?utf-8?B?WXVEMHkwTHBHSTljclYrWmhLQis0alVoMDFDNFozR1NoR2tiTkNzZVNON25J?=
 =?utf-8?B?WkozVVBPNmZYbGk3bFlZeHdMUTdLVGd3R2RsaWtPOUMvSGJmVkpwMm1HY01R?=
 =?utf-8?B?YTdscE9SamgzMmJxYWdQZUNpcVBnOEdmMFZLS0d4WVpmbEUwaTAvT2VuUmU4?=
 =?utf-8?B?blRkYVB6Y3JhWjdxbzlMSWkzNVp5RytJYWZJQ1VNWksxSXhBSXpUUW5HT1hp?=
 =?utf-8?B?UTZ5S0w0R3Z2VnJoYVlIMnQ3VHlPNTA1S2s1RUJHRUdnNW50R3p2N0pHQ2ZN?=
 =?utf-8?B?VGRkMDIrZTBRUVNSakpIRVZNVnAzZER4Mjh1cWY4eXZhQ24yNVVpU0JiaWF5?=
 =?utf-8?B?MldydE82ZHlFUFd5d3haSVQ1WmlzUytxdTVuTFBZd2t6c1lrWjFmbzEwZDJx?=
 =?utf-8?B?dzdRTStuV2lONVhIUklISVRnU2NVelBQQnVuaTV2cUhINXlZeVhiWUFhallZ?=
 =?utf-8?B?bU5mcVgvK0I4cGZBT0ZRUURPSXR1OWw1MytpSUxOMjdvNE5CY2NWUENEK1ls?=
 =?utf-8?B?TEIyVTA2NTUrdEVWNkN2SnhORHF2WW9laGRjejVSajdSZnRpcHcwaE9XcDFn?=
 =?utf-8?B?WVpyUC9pN0dyMmVtR2NWYkhyanN1T29YTWNmNWlaZGFSMklacEp2OGh0RWhj?=
 =?utf-8?B?aFlSTE02bHhDd3Y5TWtub2VVbEdjSFVUWjRFbUNXM25FU1FZUFM2ZFZJd1h2?=
 =?utf-8?B?RUhyVWFOSDI4WlFwNVIwejNFaFhTdTlwS1BFVG43dmFtMDdSQ3JvQjBNYnJu?=
 =?utf-8?Q?hvv6zzMUyVg4vqSjNQ8xKZkCjl8fqAOh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STl3MzIvMklVUUttd0tMZUtmako4d2Iybm9seEMvUFBTcm9EY2Rtb3BaejBh?=
 =?utf-8?B?RVB6c1JJaEQwK1JGa2FUNzlXMm9YUElGTTRLRXJ4d0ZrL2ZYakdBRU1BSWxL?=
 =?utf-8?B?alFtWS9mVUZ2cGV3Nzh6WXozd1ZRNTJsK0gwYzg0eit0UndESmdYclVhWjZy?=
 =?utf-8?B?bHlvSGZMaHkxS1AxVTViTlRBRmd3WmpWYjhnOGdPd2hlK1B3MThvbk5JckRC?=
 =?utf-8?B?dTBuNjdYWGx1NFdRUkQyVXJWTmdPelR1VVhnbEF3dTFlWkRWdkJqdS9Xdity?=
 =?utf-8?B?UVJSQk1XREREQWF6STZSSHRGMmxyT2IyekdSa0kzaWR1VkJqa0FSUjBlOFl0?=
 =?utf-8?B?RTQzMmlncTkyN2tJNkZHZENjN2FudTJSaU1jclBVRGlMN2s1cE54YlNLYnAx?=
 =?utf-8?B?dzBSYmlHTlRyT1JrZmV0K054S1lDc3ZaN0wwdnZQMUZJK3d4Q2ZidXBVOTVJ?=
 =?utf-8?B?RzJjNEdZdFlvMkwzWS9ZTWJxUzd0WG9DMmplbEQ2WWgwS25Rb24xTWRFMEI1?=
 =?utf-8?B?QVU4d0pLTWpRdmVGRnlwei9CL0QraEhhQzFtY3JFRmZsYnFObkZ6ekR1TmxE?=
 =?utf-8?B?Sk9QNG85NHhmanFZTi9nK2t5amhTbmF1SzdubGRoVkZZUzBCOXRRSDNiRGdr?=
 =?utf-8?B?Y2hibUZXVFJyT1dDbjZha2VlcSsxSjFreTl1bDJkTmhtNlBXQWtlMzMrVTNC?=
 =?utf-8?B?b2dIRG1oYkJ3cVg1Unp3SjcyTGRKd1N0NXBRc2tXeGU5eHJmbitiN1ZEelJC?=
 =?utf-8?B?T3l2Sk1lYVVWUEtzMWVyUGpXNzU4cTVBWFh3OTNPempTVTJDQVBENXlCdU1w?=
 =?utf-8?B?TTFWYnMwejVsWENyZ1lxSmoyNndsczR3Sm8xMFhKMWpXY2xNVGgwTTdrYkVD?=
 =?utf-8?B?NmM4ODJpbFpuOWRJOVI3UVJqcVdOUmRKY3RjYWQwaldsd0tjRXhTa1p6MjB3?=
 =?utf-8?B?d2xreHZ5NEZXZ0k3M0hsNmZHREZHMWQyL2FUYnBjM0JTMFZWdjhGcU5YL1Bq?=
 =?utf-8?B?ZlhVSDlqMUZJUWl5UldMa0ZlNnhUQXF6SE5BTmV4Qy9vN1JSTGpTTVB3SkdM?=
 =?utf-8?B?Wi9teTUrcFpya1lrTWVhM0NFYTNrYXllRTkwb3dmc0N4a0RYZVhuWGJQTERV?=
 =?utf-8?B?WWZTOVN6M25zcXNzcWdGcVdES25MVkRGQTRtQ2oyelpxRjFtb2RYejk5bVBY?=
 =?utf-8?B?d3VvUCtCVXhhUy9yQmxJcS96dU9ORGorTTkzZVBvd3lpemsxeWVROUtuc1oy?=
 =?utf-8?B?SHdvNWE0Z09uQWZwRW1tbWN1Vkw5K3dUY3V5eFd2WFcwb3VhRWI3K2RzVmNq?=
 =?utf-8?B?c0dyMy9NTThCRlNUQlc1eHRjODVrMm5HSkwyYTZJcGlzcEZPbnMzN3JTaW9W?=
 =?utf-8?B?MmoyNmhaSnZqLzJoMzZiZUd0bE51N0tFSHBmNG5wd2dSMThKQjA3a3BXQU13?=
 =?utf-8?B?UjFJZ0YvaFRVdlY4YjFsMGllNldtV1kxOHh5aTdzKzFhcE0weHZaTUIxOXpa?=
 =?utf-8?B?MlJ3VmpxSW8yODhvL0FEY01zZ1VMTzRVQThVRWg4RjlYU1VBTmd0US8zekFq?=
 =?utf-8?B?RkEyZUt5QmJ2d29jdS9QOGhMREhhZWVGbG1wQmViOUNES2ErMFlHNGRleEhi?=
 =?utf-8?B?cEx2bG5abUxMMXpJRi80K1psL3dZMmVtLzZGaXIvVHhWelF3QXFzTVp0dml4?=
 =?utf-8?B?UTRZbXk0Vy9LNW5HbzhaYUZaZ3ZIVkQwajBkcndsUEFrMmpqQ3BKelFTZUwy?=
 =?utf-8?B?RXNxT1BlbUs4S3M4c05KQnZRSDB6SGlvdW5FWjZGYmhCV2d1V3JyaG5MSGc0?=
 =?utf-8?B?djZpM1FnMDRxRkZxKzNTRTRPbXZGRjltSHdWZWYyT3o4OWpWL0UycjhYMGZJ?=
 =?utf-8?B?UEVBWWxQU2oxckg1Ui9wd1FTQzRFd3pwQ2tBTlZETHZkMXNaZmJRaGlPTGFO?=
 =?utf-8?B?K3RoKzlCdDlMdW1rRHU3elozRnVpYmx2WEx5NFJ4aVJXSEQrc3BqcUNsRVRO?=
 =?utf-8?B?c1E0M05uQVc4ckxKNnFHQ1QzNUtFRGRjTTFLei8vMU45a04wam9KYUxDZllm?=
 =?utf-8?B?dzByejg0dTdsNUFsMUdRSmVwK0srcnl2RHRBTDU0aDZCTEN2cE1VY2VTMW5r?=
 =?utf-8?B?MzQ5ckJkcG9mdWw5Qnk3dVl4OEtRMG9OemtiWG9uc0dqOXFBQmdQV2UwdW9m?=
 =?utf-8?B?d2phelhiK1N6YTZBODJQTFpKblR4bW0xM0F3OCs5QVozMUl3a3V2MFFGWXQ3?=
 =?utf-8?B?ajhOVm51SUMzM0U1bkNUVUkxQXlEcTdIenF2NXd2QVY0N0FrelhYUTdXc3ZG?=
 =?utf-8?B?elE2TjMzKzl6Zkw1aHVrZ3dkc3A4SVM2emQ0VnAyRGlJelFwWm5RaHdjK2NW?=
 =?utf-8?Q?qixbpkZUsmR6EpCs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 672ca74a-be05-4b51-c027-08de4dc70e83
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 08:30:47.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/+EZyEIDMK48tD9QBTVO5ZN3aS/W4kSw10A0uRwPm7+/Ni65+hHSH7DiFTWfIYQVo7x7CaejaKQh8kIpMrRcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
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

On 07-01-2026 01:59 pm, Kunal Joshi wrote:
> blocklist sharpness tests for BMG as
Start with capital letter "B"

With this fixed, patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> content adaptive sharpness capability is
> limited to DISPLAY_VER >= 20
>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 5a03dc9de..361da761e 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -150,6 +150,7 @@ igt@kms_setmode@invalid-clone-exclusive-crtc
>   # Valid skip :- For display ver < 20
>   ##########################################
>   igt@kms_frontbuffer_tracking@plane-fbc-rte
> +igt@.*sharpness_filter.*
>   #########################################
>   # Valid skip :- Unsupported for platform with Wa_16023588340
>   #########################################


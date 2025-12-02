Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49485D116F5
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 21:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E904B10E6DF;
	Tue,  2 Dec 2025 21:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsW4H0tD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8CB10E6DF
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 21:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764711192; x=1796247192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pgFaMgFmJEomTHKDBC9rG9+WB+x3xJjHMgiE/Fe7/y8=;
 b=YsW4H0tDZEnnnA7+HcucmtOG4jpYJd9W7GOAm+SqOdK2nP8y62Tgl6Em
 LAa5H5xNZ5hCy05wB8K4mNDiG+0Zae53EZlLwFUXGmMalifXmDg/Pffjp
 Ki4iuKOO5PZrxiHuQXaVKLo9dHO6jFeloWkxTLfPs5lVGlQTSwerbhghw
 uJ/EQWmFVjU2k+xBxtlVcy8PoWaf95BHotXiUp6UUm26i63MBXc6+76CQ
 hP2JLKOKRM/+e5bitsmy/uGNr2y7C6HH0MJ38Rdm69+zkao2a1uHsRKmm
 H2QZknTlmGC5iBO7cs+BMIB1z6rufQwRMgQrglM716H7BLtXlOudbhxVj A==;
X-CSE-ConnectionGUID: QAFBYGyNTBOa1RD/jdAHCQ==
X-CSE-MsgGUID: mE+HfslyShiI6PDnWyJ9Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70547116"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="70547116"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:33:11 -0800
X-CSE-ConnectionGUID: uMkAjnraRoCBoeLocwpENQ==
X-CSE-MsgGUID: 3L7LJPP8SxWRBrHqy+aU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194589266"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:33:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:33:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:33:10 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:33:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTLIH0s0orgZHqlNrJCMK2AaLbhDQ28LFjs9tUgScMFVGGo/BPb55MOhujapU1vb3LIr/lfIGfQMhIfBxMf+cCuNzbYAtHenQDFxCya2AEa9ZNjL+1amnNyxIEvRIUQwOdwPMkecOoh0p07VlC2anQsLaXnlmsOxEhZ9vutp9AukTUtZFYKz1fZG6Abdc+klcLMD+cSGEz6Dz2r0Sg7nNAUucNejX5t3YugBFH37LjL8H1Pk7xLTktmD1bb4qI0r6BZqcqosG0+Y6WEOnxZ4urjlwWuSyZva4HXupJqgN9EI8Ex35j/u9p6Pmsk7kgUGhJMKDuDskUXYqRzfrUNCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIm825Bk+wv/CcvNGqBIlvvB30Ri76hySOnp3MZG7Ew=;
 b=n8ndW8jvby238TjWeU8sfJYegAHrOiUnXbPw4u9N+xgglbrSJWSZYNo3+jMEJz8t+e7xhYchYtwDg6tWEF3PxZkiTho3gwithaBThi4MeWyd/9kXYMe8kB73gdwZBK9KnDS5etFZTPUmlauPyxAifS+6zrs4E1kDRtXxhP8i9QjAdRKgvtXH40pXa343eIGlwdOh2hg128YI2DWpOPnl1GZ29Mv3sjyrO/kGPQttERs+R35h+AZDla+hjLrp7v3JD2jAYlvQ8QUW/vXYl4oRSOH7n/ZlRQ1JdtMubWYDAV/iSVo6FDsLDTHWwGau6Q1puCOm4tvIyJSlkvFMmZasXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS4PPFFAE6AEB4B.namprd11.prod.outlook.com (2603:10b6:f:fc02::61) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:33:02 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:33:02 +0000
Date: Tue, 2 Dec 2025 13:32:56 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/5] tests/intel/xe_oa: Drop
 oa-unit-exclusive-stream-exec-q
Message-ID: <aS9bCONHSv1pBSV0@soc-5CG1426VCC.clients.intel.com>
References: <20251126035012.12967-1-ashutosh.dixit@intel.com>
 <20251126035012.12967-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251126035012.12967-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:303:b9::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS4PPFFAE6AEB4B:EE_
X-MS-Office365-Filtering-Correlation-Id: 69206463-5cc2-46f8-9348-08de31ea5f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVFkeXN3dDRmWkRwYWEzWWpWaC9CbnozZTR0SXF2ZEVERmNHNlRZUGl4bW5D?=
 =?utf-8?B?QTFDQXJiS3p1UGd5QktxUFYxMVFwRi9wRjF0bGpIVlZoeUxmL2kvYTJVMzFq?=
 =?utf-8?B?L0R4V1J3bGFrdXMzU3lTdnhsTUdKVkQ3VE95OHN2RVVJQUtXMmVqcURiU0dh?=
 =?utf-8?B?VlhyNWs2d3RQNE9OZFpqdmZ3Z1BjS1g0dnlIS0J1bkQxY2FaR0ZtY1dTb0FC?=
 =?utf-8?B?UjYyb25IZFRmcnhmV010N1B0dFdOZEc0U0h1Q3MzeStPOVFna3ljdnRaY240?=
 =?utf-8?B?Z2J6RzlvSTVsYXFCUTRxdlJoeWdyNmpjSlhkZ25HMW5PZkpEY3orQnc1OHF3?=
 =?utf-8?B?eGkzM0hYbmFJUVJ3QkFaMGxPdHVIVmkvaFFzTGo1cHMwTFJlcEZ3SlNQdXJy?=
 =?utf-8?B?dXk1SlIxL0xVUHJqSzVuMHFMbzhZMHErbWcvWGNTdnh4K1pPeFliZHNBei83?=
 =?utf-8?B?dm1CZmZJUUpsWDBTWEVtVXRBRGFCMXpVZkkwYmpuYUZlNVdSUkNHWjNWUWFh?=
 =?utf-8?B?ZUhFckx3aHRIcUNsSjV4ekgza21pV2VBNlFxa0lsMWhTWFhPdm84bEJzREhQ?=
 =?utf-8?B?QURNQWJkd3B5R1Q1UUM0UERRRTA2OWxuRkVzSnFpdDUwRU56NmREbThhZlkr?=
 =?utf-8?B?dGxwbEZCRloxWXpldS91MDluck05c0JBT0xoVUJzWm5aUkVCbW8rVUhLN3Y4?=
 =?utf-8?B?c3I5a0d6U25HcDVBRW55SVdYeTcvT203WjYxK1dFbDJqRmluMWRiQlI5OTdH?=
 =?utf-8?B?bWNMNHVmeEJ5S1lDL2RxY3h4QzAxVjBzZzJxQ3NYUlJrOVNSdzJ3T0M1bmNP?=
 =?utf-8?B?ZktDUGtjM3IySmVzUlprVURlbUZHNGNKanNkZGdHN1RwSlZ6RnhWdE5YbEJq?=
 =?utf-8?B?Zk1oZ0dDd1BueDEraFFRMy9aM1pYN3IwWEtPb1h3bzYzRXRZWFd1R0lZWGF1?=
 =?utf-8?B?MXFFay9nTUxtYVFiQ01nSjkzOVNucks5NDh1WDBUa2d1Z3BkY3JLK0sveC82?=
 =?utf-8?B?aWsySXI1bVpLck82b3JUcjN1T0FmdWpOcUoxemtLUWtFdW84RFB5YVI4Ulgz?=
 =?utf-8?B?WkJ5Z3c0TTQwMlBydVhUYzRqd1pvWXk1WEVPZHlhTDdkMHhSR0djRmNEQjRG?=
 =?utf-8?B?V3pZeDVVcUEvMEZ2VHBjS2M5a0VLWG11aHZaVVhPblNLaTAzYVRMbHh5Nm1j?=
 =?utf-8?B?QzBKL08zblJhSW1RNTFFK3RWdmVLSDZVZWFtd3VoVHNqU25vU2tvVWZGdDRY?=
 =?utf-8?B?TWEwS3F1VVAveFhLOUswcFdGcTg0QXZ5OC9CTFNKTSt4bEFVT3RNOGJ5VEpo?=
 =?utf-8?B?MUphV3dON3MrSTBUcy9HWndScTNzbHFUVmYvTzVCb09BVW0vRjRKU2JBeWti?=
 =?utf-8?B?bkFYcTF0TjFOaWhLZmdJbVIxRWwyZTdGa2NZb0JUaytESlIrZFdGWDFqR2xy?=
 =?utf-8?B?ZUpsaXF2MjZmcXBCb3RaVnlVR2VJWU1qSkE5ZmE1WGdxOWNpYlNUR2ptclhW?=
 =?utf-8?B?RUNtRlp3TjBoYitqWXdla1h2VFowZjg3OFU4b3ZGQ0pVWUtpUWc1WWh6aUZv?=
 =?utf-8?B?cVZOcmVOWTUyQVZSL094S3NJSmxra1VxTFQ0bGVuRmdEb2dlblIwWUZnc0xy?=
 =?utf-8?B?Tm1UVGVDWXlYcjJYUkJudmU0c29oQWRSUkwwMmxpSVpFUXJabDZ3TzZOVHpZ?=
 =?utf-8?B?aU96TEVLQ1Qxa2VhdnpzQzNVWlhKZG1LbUg2NXpFMDU0ektacG1UUjZ5SG1t?=
 =?utf-8?B?UUltZEtWZExNajh1MVFucWxaUXJjVXU4aExKUit5UXo1NDk3MnhNd1dkUXI0?=
 =?utf-8?B?dUVWRzNyQjJCRjlXbDFuMzMyYmVCdEN0OVh1YWxwVkpjOU9HVllVR0paMFVH?=
 =?utf-8?B?eSt3RDFUY3lNck1MZUs3NElIdjloZDVSakppa0F3UHA4bXpJZlYweXd4bmRU?=
 =?utf-8?Q?x5ox1xsWoaN4lK9ctBB0BTNVfLE41uBM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGNWZFlqWGc1cGJuUm1VbHhTMVB2aDVrMVVwdm1ZVjU2QVJUUkRudnRFVjVy?=
 =?utf-8?B?Zk96bjRzSCs0NUxjNzQ5TFRpZjJlOG8ybUlHNll6aXJyeTB2SnZWMk42SXQz?=
 =?utf-8?B?dXlXRU9ZUFh3MVN0NU91enY5Rng4K2lZOENSNm9CdHhuRmJHNm5mZ0lld0tp?=
 =?utf-8?B?bitmd0hMLzdhdlEydUJSdm9EU2NwQXo1d1ZsUHV1MVZxUnQwQTFSTGhPYUhG?=
 =?utf-8?B?TVhXQWlkYUtLbXZ6Qk8rTDNVS2l0ZGtSTVdwQjM5NE80WUg4N0hzMTZsOTNW?=
 =?utf-8?B?SzJXUWhwc3UvaTg4RHV5dHArNUpSbm9nQTVaandqVHAxaW1IRE92NWpTVVJJ?=
 =?utf-8?B?Rmdsc3UzUGZsUEVQa0JDZktSOEVpYTRRUXpCV0dHcW1SQXR3ZWc0aVp0MnVE?=
 =?utf-8?B?S25ORlRFRFFuMzYxRmdha0VKWWZNM01XWUNGZW1PV2IvUjBOeWdxUXJMc1lV?=
 =?utf-8?B?R2lSRy9xSzFyellIWGtLQm1FTk5wbmFmOXp3MXV6d3E0YUY3OGhSZ1FKWEFR?=
 =?utf-8?B?Z3dNVEJQN2JnVTZ4M2FZV0c4Z2RQYzdIK1c2TW1ZVDNXQmtkeFpMNVpQV2NH?=
 =?utf-8?B?SnlKa3lxWVdJT0E0U3JWMmkwanZCYUd0ZklIakZqY3NKOWxrcUZEWC9kMm5K?=
 =?utf-8?B?SnB3bEE3WFNoSC9OTjJFK0V1T3RzdTQ1bHRUWTA1cUo4aFpRRHNPZXBrSE1q?=
 =?utf-8?B?L1RicjhNeXlwanBaTWVxdllsMGVPYjV6QitYS0VNRzVDOEFxZ0VoallHcm1S?=
 =?utf-8?B?UFNoNGVIdVErcnhibUZObzBqYmdMcVpOelV2TTBJZW9ScUZETm91VFllL0hL?=
 =?utf-8?B?dVFQa1JmbEs3eGMxL0FSMlNIUmkrOTdIeTFXeUJiNEtBQ2MzU3NSdzZvdmht?=
 =?utf-8?B?OW5YZlNiTVk3M01TSGRuS2NZWitrMkhWbDhLSis2YWl4OWdNNGVoMTlhS0xJ?=
 =?utf-8?B?cmJHUWF2eWJvNk1kcnlJVzFVT3hsZjY5MXVBUVhCbldGT0RZWFh0Zm9CYWpt?=
 =?utf-8?B?akpJTUZCZCsveklWOW42d3hkWDNCV20vOHJWRisxR1crZU13NVVPRXdhVUwr?=
 =?utf-8?B?NWE1ejhKV01GUmVNY0hMS1pERitmTExRdXFyaGVhV0Q3K2N2N2tXM1dTMzJj?=
 =?utf-8?B?cDd4QkdLakthZUNSdVYvbG53eDRadSt2ZVB3RVRyMFhXQ2ZJWDR4bGw5Z3lx?=
 =?utf-8?B?V2tyUjAxb1d6VDV3c3BObHhqUUFCSzRIZGJEMVVEMW55VkYxaEhjSFhPM3Iy?=
 =?utf-8?B?b2hKeHBtT2VYV2J5Qng5VnYvcW9kelhveHAzQU1SdVlKSTN4a3lJQ3Z4Y3E1?=
 =?utf-8?B?bzM1UjN0elVzWlQ4SGY3NlpkMFliZlhzazVsbFMxdlpGNmJSczJ2d09BNzFG?=
 =?utf-8?B?d0hReFl6TFZBQ2s1TnhOd1RoZ0lXclRQUVgvUVd6Yi9QTTBmaS9tOGFrRFhN?=
 =?utf-8?B?S29GZldLaTU4QmNhRStRSXVpd24wcFBHd3FGWW8yUDV6bWQ5S2pyN2tGRDRH?=
 =?utf-8?B?ajRxQkZaRTJQejlweHVwSWVPRUoxS2E3NTdjRWJESUJnQ0dhc3pYY0FDMzF2?=
 =?utf-8?B?Tk9iZTVycWN6eTd1eStqemdWNnVkL1QrMTNFdEhLK2hUaFVxb1IrZW13MVZN?=
 =?utf-8?B?Smgzc09aTEkyZG1TYjFTOXFTT2N3eDlxQ2FlNGMyQUdxeDNKUGRmVjFoZVRT?=
 =?utf-8?B?djhVQWgzVGZvTTlsRDBOZ04vM1FMQVRZRmVENXVhY2pWeEtpZXFiVS83R3lG?=
 =?utf-8?B?Rjk4WmQ4cXplMEhhZE9lamxoZkt4K1l1RzdocmpjVzZiSWhDZFBIWG54RTIw?=
 =?utf-8?B?ckMvSlVvK0xXdmRzbk91SkUyNFJoVEUzR0VuSjllR1pvbkJxY3VOWTlranl1?=
 =?utf-8?B?TWFNRGF3aUw2MkFNS05nWm90RDU2bHNmOFBRWjc5NFlEZzJpMnl2dDJ2cHlt?=
 =?utf-8?B?U1RjNXQzcWxqZ01JelU5ZTA2MmJYRlJ4ZDJyRHlTRzJiMS9xSy9OVFUvM1Av?=
 =?utf-8?B?TjgvMDFYT09SelFray9idFhmbnEwNXBOb1JjVHhOdForYnMxNUFZTlZiOE5W?=
 =?utf-8?B?ai9RYWU2RkZTMkVaSnZIamJBOGtiNXA0bmprQ1ZyTm9vOWxaMHh6Wi9ybFRO?=
 =?utf-8?B?dm1rdkdaWTk5Wjd6V292L1lQRVQvUXM4Z2E0bnpMMHRSbCtXYzFkNjZ3T3hB?=
 =?utf-8?Q?Z7JRHNSc8LTsXM+qdXXtwkY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69206463-5cc2-46f8-9348-08de31ea5f00
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:33:02.0883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgU5QmaUwa6gywx/Wczv2Bg9VR/u5PWru1FT2pBfuIYMGLshwi/ihtlxEbL35PXcBQ8UE0TMYGK1nkXFOok0EdC22V26m+Ml3vfZQLtl2Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFAE6AEB4B
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

On Tue, Nov 25, 2025 at 07:50:08PM -0800, Ashutosh Dixit wrote:
>In the kernel we have restricted exec_queue's to be specified only for the
>OAG unit. Therefore the "oa-unit-exclusive-stream-exec-q" IGT test needs to
>be modified. However, the main purpose of the "oa-unit-exclusive-stream"
>tests is to ensure that only a single OA stream can be opened on an OA
>unit. For this an exec_queue is not needed, just the sampling mode is
>sufficient. Therefore, discontinue oa-unit-exclusive-stream-exec-q test. It
>can be added back later if it is determined that it is really needed.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 70 +++++++--------------------------------------
> 1 file changed, 10 insertions(+), 60 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 0c9e693f7d..9302d1c83a 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4254,111 +4254,64 @@ test_sysctl_defaults(void)
> }
>
> /**
>- * SUBTEST: oa-unit-exclusive-stream-sample-oa
>- * Description: Check that only a single stream can be opened on an OA unit (with sampling)
>- *
>- * SUBTEST: oa-unit-exclusive-stream-exec-q
>- * Description: Check that only a single stream can be opened on an OA unit (for OAR/OAC)
>+ * SUBTEST: oa-unit-exclusive-stream
>+ * Description: Check that only a single stream can be opened on an OA unit
> */
> /*
>  * Test if OA buffer streams can be independently opened on OA unit. Once a user
>  * opens a stream, that oa unit is exclusive to the user, other users get -EBUSY on
>  * trying to open a stream.
>  */
>-static void
>-test_oa_unit_exclusive_stream(bool exponent)
>+static void test_oa_unit_exclusive_stream(void)
> {
> 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>-	const struct drm_xe_engine_class_instance *hwe;
> 	const struct drm_xe_oa_unit *oau;
> 	uint64_t properties[] = {
> 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(0),
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, 0,
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
> 	};
> 	struct intel_xe_oa_open_prop param = {
> 		.num_properties = ARRAY_SIZE(properties) / 2,
> 		.properties_ptr = to_user_pointer(properties),
> 	};
>-	uint32_t *exec_q = calloc(qoa->num_oa_units, sizeof(u32));
> 	uint32_t *perf_fd = calloc(qoa->num_oa_units, sizeof(u32));
>-	u32 vm = xe_vm_create(drm_fd, 0, 0);
> 	struct intel_xe_perf_metric_set *test_set;
> 	uint32_t i;
>
>-	/* for each oa unit, open one random perf stream with sample OA */
>+	/* for each oa unit, open one stream with sample OA */
> 	for (i = 0; i < qoa->num_oa_units; i++) {
> 		oau = oa_unit_by_id(drm_fd, i);
>-		hwe = oa_unit_engine(oau);
>-
>-		if (!hwe)
>-			continue;
> 		test_set = oa_unit_metric_set(oau);
>
>-		igt_debug("opening OA buffer with c:i %d:%d\n",
>-			  hwe->engine_class, hwe->engine_instance);
>-		exec_q[i] = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
>-		if (!exponent) {
>-			properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
>-			properties[11] = exec_q[i];
>-		}
>+		igt_debug("Opening OA stream on OA unit id:type %d:%d\n", i, oau->oa_unit_type);
>
> 		properties[1] = oau->oa_unit_id;
> 		properties[5] = test_set->perf_oa_metrics_set;
> 		properties[7] = __ff(test_set->perf_oa_format);
>-		properties[9] = hwe->engine_instance;
> 		perf_fd[i] = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
> 		igt_assert(perf_fd[i] >= 0);
> 	}
>
>-	/* Xe KMD holds reference to the exec_q's so they shouldn't be really destroyed */
>-	for (i = 0; i < qoa->num_oa_units; i++)
>-		if (exec_q[i])
>-			xe_exec_queue_destroy(drm_fd, exec_q[i]);
>-
> 	/* for each oa unit make sure no other streams can be opened */
> 	for (i = 0; i < qoa->num_oa_units; i++) {
>-		int err;
>-
> 		oau = oa_unit_by_id(drm_fd, i);
>-		hwe = oa_unit_engine(oau);
>-
>-		if (!hwe)
>-			continue;
> 		test_set = oa_unit_metric_set(oau);
>
>-		igt_debug("try with exp with c:i %d:%d\n",
>-			  hwe->engine_class, hwe->engine_instance);
>+		igt_debug("Try on OA unit id:type %d:%d\n", i, oau->oa_unit_type);
>+
> 		/* case 1: concurrent access to OAG should fail */
> 		properties[1] = oau->oa_unit_id;
> 		properties[5] = test_set->perf_oa_metrics_set;
> 		properties[7] = __ff(test_set->perf_oa_format);
>-		properties[9] = hwe->engine_instance;
>-		properties[10] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
>-		properties[11] = oa_exponent_default;
> 		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EBUSY);
>-
>-		/* case 2: concurrent access to non-OAG unit should fail */
>-		igt_debug("try with exec_q with c:i %d:%d\n",
>-			  hwe->engine_class, hwe->engine_instance);
>-		exec_q[i] = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
>-		properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
>-		properties[11] = exec_q[i];
>-		errno = 0;
>-		err = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
>-		igt_assert_lt(err, 0);
>-		igt_assert(errno == EBUSY || errno == ENODEV);
> 	}
>
>-	for (i = 0; i < qoa->num_oa_units; i++) {
>+	for (i = 0; i < qoa->num_oa_units; i++)
> 		if (perf_fd[i])
> 			close(perf_fd[i]);
>-		if (exec_q[i])
>-			xe_exec_queue_destroy(drm_fd, exec_q[i]);
>-	}
> }
>
> /**
>@@ -5151,11 +5104,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 	}
>
> 	igt_subtest_group {
>-		igt_subtest("oa-unit-exclusive-stream-sample-oa")
>-			test_oa_unit_exclusive_stream(true);
>-
>-		igt_subtest("oa-unit-exclusive-stream-exec-q")
>-			test_oa_unit_exclusive_stream(false);
>+		igt_subtest("oa-unit-exclusive-stream")
>+			test_oa_unit_exclusive_stream();
>
> 		igt_subtest("oa-unit-concurrent-oa-buffer-read") {
> 			igt_require(!igt_run_in_simulation());
>-- 
>2.48.1
>

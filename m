Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E967C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 16:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F4F10E662;
	Wed, 21 Aug 2024 16:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AM6jOnX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F0910E662
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724258833; x=1755794833;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=vKeC8YEq79bgUdNrJ03JnVKKm9FYYPrfF6KtD4Lt7Fg=;
 b=AM6jOnX7pg//kDTwopjqW9a6E2du6xwSEfOzKajTTIycyxZoh8rF4vlV
 OfXOG3KMZxLDtLYAqF8oWN07RAbxuVlClcnfEHOHGaNMLZFNLWn4MQ+q6
 AO9Q33C+jKXrHHgzTRFjD1Lf2eK9Mu/qaGE+f4e1O3oXsIKliKr0Rpe7V
 MZF9Llv1sgl6i/c0pHiKlrGHpSHFAONqcFpVa3AAq1YZd0Qh/wl0q1CY3
 6CwcS81xQFnkLzzazwTDwSmZxfioeszeMTVLfU/7eLzB1WShXHE71UIy9
 1CeeWyj46rU5AVcjEZSdWmgWtIqEzIzuOQndEO/NBwd1uxcBTywnYcax7 Q==;
X-CSE-ConnectionGUID: CHY+4tJGS5GxQGmpZ62mKA==
X-CSE-MsgGUID: PqT8xjz+T5q37hyNIqYXqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22514051"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22514051"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 09:47:12 -0700
X-CSE-ConnectionGUID: L9dTmxKqQzGJ2JYQrbgBmA==
X-CSE-MsgGUID: RQIZCwjUTSaMzVYsAUzoJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="60859568"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 09:47:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 09:47:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 09:47:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 09:47:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 09:47:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/DaAt6MgShD6v+uBqR9SGHxXK5HYj9q3NDvM/wajnz7kXyT2vRinbytnAJzYPQMXyTMW9ZKoko7BmFvozcr8jpZYlRVMUIjUvR/cRo5oLh+W1NPG6GO1y6h7OtPuB3wtt+I40LaypD9DGR3VbVnP9tmDpPRMDpsQdKyrGj8WVCF3AcCouSafmft30l4qtxixOKk9/i+9GohrxKXkW0/6VPN60ywEUhzXzF3opl3becI7PD7zmKLY6J/Cvd2uf3b5+8qY3qJjymjEkZRp9MncHmriFqOpAyzEHDUkg7STTSY3zDJ3JLDofBZzcZF950v3dsrKn+PALO8ZG/pT0ftxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owt3qT059PSsH1RhgAoDLVD5aZx/gQl53q5GunvyI5Q=;
 b=oIMys6deMxdLHze92DpCoM5PjNXM+i5j2p/VJWI5RS8oYxvPOfdoHmXJ+TrSeBGgSiSHPgrMe6XBrOQUtPcFOi0VGUTcqQjyCLzFbchfsK/76T38wo+LrD4Dsq04pESjNF7fucwu+mYXo5XzBGw4TPTgETfv/cbZCQFET6GYRRGyx4pJCG6FGTfLUPIaYOo4mGyl8dCdM40rbeSOLnCj0pBMRNvmsedYhqpdLbh0j9vH8bvjZE0vCjXlWwJuxDgJl0MTH1nIGIh2W4mAyc9vdcBZ2dcB5JL3EilDt7R4xr7wbQ7r75YzeC09nEU+3ng5kBNUZHDaCuiP0NDzCE+i5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 16:47:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 16:47:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240820232928.458248-3-lucas.demarchi@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-3-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 2/6] tools/intel-gfx-fw-info: Annotate abstract
 method
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Aug 2024 13:47:05 -0300
Message-ID: <172425882598.2071.10778605548011648055@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0332.namprd04.prod.outlook.com
 (2603:10b6:303:8a::7) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: f36157b0-292f-469a-1ff8-08dcc200e56f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzdDb3k1emU1WFd6bjJwZzBmY05ySm5RaWlwQXp3bjJZMmp1RllxeGh2OE00?=
 =?utf-8?B?T3pPVmpRT1JVWS9vZkVocjl3YTRIMnlYYWUxdXZLUk1zNGJsOGNGdE1OZ08z?=
 =?utf-8?B?MXhIZDN1Zk1HOGNCeS9oOEh0L3J0dmNKRU1xTy90dHFyQy9PKzB1Qy9qZlhq?=
 =?utf-8?B?aTNGWUlHV2lJem9mL2RJQ3NPSVdQbGdsYVJFdVNrbUk1WTlrWHN4UDZXTHRK?=
 =?utf-8?B?SVBGMUZBaWphbU9VZSszRU9uaXhJVGUxSjMxQmwyaWg1L0hDVk8xTmFxaDNo?=
 =?utf-8?B?OXQveHNUWkY1SU5jaStLRWVIMXY2eFRzRHlka3Y1RENESHFJb29nUlFWYThq?=
 =?utf-8?B?QTZ3UWxKSCtnUmw2UU1oRkRrZVJkcEVXUHhLaEZmSGNYdGpJN2l2UDlBdERH?=
 =?utf-8?B?TVBQeHlBMU5lMEQ1RnNnU0diTzRkRzZ4Vy9oNXZQUndHQVQ3YkllWm9maVp2?=
 =?utf-8?B?bU10NDExRmxHd3dWeVZ4S0Nza1poSXpVSE1WWGtGb3BDR1o0TTZkaDRXbTdV?=
 =?utf-8?B?dDVLTUpIMXEvdFZXaDlOL2p4WTl4NXFmbVlHOTBONVpwelUyWXZTcXE4aGov?=
 =?utf-8?B?NHVPN3BXbUxsVlZJb01UMmw4V01LUG9rQzV5bktyLytYU0hEUXhGNGUyMW5X?=
 =?utf-8?B?MUxGczdQdGVMcXR4NUpjSDgxYzRXRStCMFRtZk0yTzhyVHd4R1lnb2hONVJG?=
 =?utf-8?B?L3dsQTlXc21IM3BEaU5OeENTQ0ZPL2FsVGNLSTEvWitiWUJ5b2tKYm81RWR1?=
 =?utf-8?B?RUliQzJDZExWN0lUQzc3U3A1OUk5eUFiTXliMk15MmpxaDVuUFJXckZHWi9a?=
 =?utf-8?B?Tzl2ejBhZ05oVXFvRVlmaTJlRnJwTEd5Y014OGNPR2hhVTU1ZjZWYS8vayts?=
 =?utf-8?B?Z1hlZmtsMkR4b3lVeFprUmZKZkl3TE4yeHVibTQySXJFOTZ2Y0lEdEFncU5x?=
 =?utf-8?B?ZWlyYVJFTmNkWEVzWEtQejQ5SFJpdTVwLzNpdHNjUDJVdXAvUjMydjF6bFBC?=
 =?utf-8?B?RkNnYjNQbFBYMzVrbHVWcXRwWjI1VFVLNEpINFZmWkN0Nnlkdm1LU3lWUE0w?=
 =?utf-8?B?dDcwNG1OelFGb0hPS3hxK0JPWTY5THJrYUttenhCL05teSs0SE95Z0pDZ2Rj?=
 =?utf-8?B?UXZreXloOUtaWkQ1Q1VCV0FNSVRpTDNCcVBCNUVDQXhvYVoySUtyaVlWR2xF?=
 =?utf-8?B?Q2FtWFdFMnZyUlRkRkhJT2l5VVgwZ256UVZveUdjdzJ6eFhPNEUrVS9iTDZV?=
 =?utf-8?B?RmlGeWwrNVhKbUE5c1JsOXRNeURMZEYyL1ZvM1ZwWVVDVXpUMzJ1ck5NeHJt?=
 =?utf-8?B?QmRvV2pUSGtxYTdZZFpQeHVTZWZhM0x3eDBDaUsxTnpxNHpEYVU2cjNxZFd2?=
 =?utf-8?B?aVRQeEZhM09yR3pNZ3M0OXpHU0JRTnVTT0pZQXNseW4wdjNnTktadm8wUy9X?=
 =?utf-8?B?N3Y0V2FNaW4zdkhlSzVTdGZlTlBkdmE3ZzlycytrYVZjcUdqbUxzMkRTUlpP?=
 =?utf-8?B?V1loWFJvN3pLY2VtL3VkOTVEVjFyS3ZQMXlJQ3l2VklKV3h0SWFBd3Z5YzRp?=
 =?utf-8?B?TTh5TmJCeUVzRHliNnRmbzNKMDBVUDlZblBCazdaa2d0aHpqM3RWQnpRTE42?=
 =?utf-8?B?SlFZdUdRanRsbEtjaXJwSUNQVnpJbnA3UlFzZnZMQTBIVVlOQ1F6QS9RZmpV?=
 =?utf-8?B?YzlLTDBEZmxrNG1tWUY2clRsZ2hGdEZnU0VXbC9UU3dwM0IzY3NsQWNPL09m?=
 =?utf-8?B?OVR3MDhGb1pSbVNlL04xODVoMHVOTEhlc25GbFQvK3NXRCtmOENOamF1VERy?=
 =?utf-8?B?RFJGUTlEUDZDT2o3L2kyZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V29naFlBekJNczdCRGh6S01rKzgrWVNTTDdXaUVVMElJMEVnMytkYVVSVnJE?=
 =?utf-8?B?eldBcFRJaHM0Y0xwOFV4UzYvbkwrMzROUzJWYzVvZFhUNyt3ZXZkMHFMeDBG?=
 =?utf-8?B?SDhUOGhCSW9rSTJhbmRYVFdmMVc5dVo4SUhCQisvQWRycllLcjNRTGE0Tk9x?=
 =?utf-8?B?U1lzTHo5azBBWnUzdC9nQ1VsYmFsbGEwTkdJNHUxQnVuYjJ0d01tWFl2ZlJn?=
 =?utf-8?B?Vm9td0l3YVVrYTY0TDMzekUxdFNuRnRHQWhwMTVQb0htN0UwWkxaMlo3WmZz?=
 =?utf-8?B?dk5lcEVwUGlNZHU3RFZCdm1yR1pONTAvMzd1T1VTNzJxV1RoaklwTXFTaTlR?=
 =?utf-8?B?NTlxOTNKTGtic1c5bWl2WUFQcnNrUTFoR2JoT1NTRk9odlRseU03c2tDa0JM?=
 =?utf-8?B?VU5VZ2t2ei9OMko5aTRQQ2hGbkNCYmpUU2VmdVBrcDFFSnRxdFFDdDNNeEdR?=
 =?utf-8?B?Q2xVZkI4N0ZSMkdxN0NLM21mZ2F4eU82Nkd5NE1RSDY2MDZySXNqTVZWbUo2?=
 =?utf-8?B?aS94MG1SMWRLQzJrNnplWndvWU5yQjh5THJBWUpFWTMyTFI1THZ1WmpWRUFO?=
 =?utf-8?B?amNDdW1kTkRvamRQVGxMNmFpVGV6V1Y5Yi93UENlS0RXbWtrTXZTendTT0RQ?=
 =?utf-8?B?OVdMSGpFWjgvQW5BTTJzdmQ4Z2M3cG0zbFBYUlMyUUhzRUpjWjVvcWI4azVy?=
 =?utf-8?B?eUJsZU5QcmJvdXhOZUU2cXpUeVRZMnB2eS94SnorSW9mb0R6dWhORisyWTFB?=
 =?utf-8?B?cUVwYksvNVl2KzZ3REM4ZXhLUG4yWFpTOWp1SDBrSElvNEZKVkEzQzNwQ0Jv?=
 =?utf-8?B?bmQxTkc1OGcxQndNNUhxNExOakltdjIrOEZKU0diMWRxSXk5YW4raktWc1BT?=
 =?utf-8?B?RkJWSk5GWDFvdXBKU1BlRE5BNkMwVXl0ZGM2NFZWbXBZSERZRGE3NFJILzJJ?=
 =?utf-8?B?aUo2WWJMamVNY1Y3SjZvQWpJZVQ5ZmFIME9uMkwxRkhOelNnYWJrcjJ3OHpN?=
 =?utf-8?B?SzMvTVJTVk9TY2FIdjF3ajAwN0pXYXdIU2RYaFE3c2ljWU4xYVpBMjd5Q1pY?=
 =?utf-8?B?Q2pRckY2TVNPNGdUa0RjeUpWUU1LNkZSRFJ6NDh6NkIvNzFaYnRMRkwwdDMz?=
 =?utf-8?B?MVJnK0F1Q0xUM1lURUR1UEpmT2x4YWQ2S3QzWVkrYVlpNm5OVlZ4bEhBdW50?=
 =?utf-8?B?UG5MSkN2d3N2NmVKd015NTgvK2d6OEVEcDhpTUVlckZXVzNrb3BVd2N5MmxB?=
 =?utf-8?B?U2JJVFNmUDZOZlUrZno3YndBSHNFbnRxZVdJRDJGaEg3K2Rwbkw4WE9rUlE1?=
 =?utf-8?B?U3gzS0FzaVNPdFpXVWVwbUFBZXdRWDFWSTZQbWJHWmdPWUF0VkU5YW9Ga1Fl?=
 =?utf-8?B?NmgyajdDUWJNNmdTNlpsWEg4c05STldJMFZjMmdRNGo5VzhWQlNqb1p1TEJh?=
 =?utf-8?B?ajE4L3VVY3A3ajl6ZzhrazJoYlZhZGJOdDA2QlR3L05jUUpsUXhKemVXODh3?=
 =?utf-8?B?WEpMUkpHOEIzUkp0QVo5RVVwb2R2RUhhV3FoYTNDNUNTamtJMjFGRCt3Z2FK?=
 =?utf-8?B?K2hrbEo1UTk5MHJvMzVBT2FLRG5RZ3dQQ1A0U3RFQ1pOMTBaZU8rbFRmWmhF?=
 =?utf-8?B?cEt5K2RmMnVxcCtYcHVRWVZjWHNPNzFBbFovZVVheEV5V0RqMzdEK1FTUEUw?=
 =?utf-8?B?Kys4YnBHOFRTNCs4eVFRTXQ1STJZWW8rNFZFNEh2MXJuWFhLbFhQb2RPR2Fa?=
 =?utf-8?B?ZEdVOWtZYThLL2VjMVkyM0I0T3NEdGd1NjB3eWJQZTNjM21nMmI2MkQ5SmlY?=
 =?utf-8?B?dzYrTWxtb0dabGVLRk1EeFFnRk9pa3QrZG4rMTdFSWZZaEN4b3ovbVE4UEVz?=
 =?utf-8?B?ZkdYU0lvZkh3TDh0MVUrbFNuZHFFMGpzVklKV2JOSlg4R3IwTnhaQ28vLzZP?=
 =?utf-8?B?ZEpiWndKT011Z25WK1FwRnZpK0FtTlhsaTQ3Ty9STEN1TVltOURTdXhZd2dC?=
 =?utf-8?B?dUhiREVpTU9nekRBQTNSeVRTbCtEMlJ2ZDNoNEYzVmRlUUx1YTY2SGxicjdT?=
 =?utf-8?B?NzIyeW91eXd4eTBkL0J4NnZDOXdneTJMSXZLb0FMN3RTTklzbW9OQWdUZDZq?=
 =?utf-8?B?Y0hHNmlKN2l4WW5GUUhzenE3VWs1M01EQUwzcHVlM1Rwd0w5QmsrVlBuRW92?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f36157b0-292f-469a-1ff8-08dcc200e56f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 16:47:08.5939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4ctDMajLIuwTijFx+ZBCHPeHGwJHNoBtgxIBCVGU1Y4s2w3uK2e2cKxRX3bVEbA44l0MRFQDOiVXOZI0QzDEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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

Quoting Lucas De Marchi (2024-08-20 20:29:24-03:00)
>Make the FW an abstract class and annotate the decode() method.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> tools/intel-gfx-fw-info | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>index 35555aab5..3105144b7 100755
>--- a/tools/intel-gfx-fw-info
>+++ b/tools/intel-gfx-fw-info
>@@ -4,6 +4,7 @@
> #
> # Copyright (C) 2023 Intel Corporation
>=20
>+import abc
> import argparse
> import logging
> import hashlib
>@@ -103,10 +104,14 @@ def FIELD_GET(mask: int, value: int) -> int:
>     return (value & mask) >> ffs(mask)
>=20
>=20
>-class Fw:
>+class Fw(abc.ABC):
>     def __init__(self, fw):
>         self.fw =3D fw
>=20
>+    @abc.abstractmethod
>+    def decode(self):
>+        raise NotImplementedError()
>+
>=20
> class FwCss(Fw):
>     def decode(self):
>--=20
>2.43.0
>

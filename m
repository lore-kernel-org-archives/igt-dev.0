Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3372CD2CDFE
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 01:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF44D10E9ED;
	Fri,  5 Dec 2025 01:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEVQqssz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29EF10E9ED
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 01:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764897133; x=1796433133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qLXWANe/E1Q8lHcwWSUXTgY2CUFxTGS+y3pEoKOijoE=;
 b=jEVQqssz1kDxwQbo7fsDDRb2QiU6jlp4bPIffUmnmh3re9KDpPX8q/e4
 aAM1p3fvmNOLJmc+0ZvK8WsSRxpT9Huyp1gFIKsvuglXVSnb3/0kcKBqC
 vVP5HYp4LWVv+FTo/99NFOAzTIJHnwIxseNNiUuv7uS5H06dKrTIw6f+W
 hXVfbSQyDKsrTeTXJMDP3f8srCG7DCGH1s6jnewNKowJHgYZmOnRQjvWz
 HuAsaGNrHe62jarclZz24oTyKMrlwB/ijaf0UypvTZsOIjfmImU85/LtQ
 VK8svBVrqBoFFKfduhvdLWVPlxqsDcsDJkoq/9wuzojNh4lDORlcE6XBT g==;
X-CSE-ConnectionGUID: VUejzPofQOueMdEYVSrAcA==
X-CSE-MsgGUID: IylmGr4WSTihsb6MuV8bOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="89580545"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="89580545"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 17:12:13 -0800
X-CSE-ConnectionGUID: z09X87cfRxqwpEBggwEmag==
X-CSE-MsgGUID: zWdMYGVMR7mxAcuE4sgnuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194209541"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 17:12:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:12:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 17:12:11 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:12:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAme/lRawHAPXYR23VBbgFsjzycee5ugDLIjY2YRHKVOgCSvuCEAHJupcJJkCyGRFsDEoo8ph3faOyLHX1VYHh0Li9p9m9aaV4EfSanGYar6mbQ6J/6eQgT6VDLv6GQHS5669aMcITWBoyyY9bVF+DJQ1nxHOVwDlrIbMYwZR8K8KtHzmPDE7/Qu+AFK3AcocRBQuSEarLgA/bOu/AdIwQTJawDu8lpcHkWk9mac8uJ+M8HZtYZ3A3kGuUMmRS68mHKphH9ZnD5RWv4ykKxOZM3LPZPRrRasf6GECbLrRNqKY6ulasX0JUUhx6pGAWo4v5Ja3o3uo/WmmiSb6inHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omgCNTpM/gP4ZUjKsvB077aXljeogThb6Easpc6oyAg=;
 b=klQ1HCTgC9gNv3Uw+Pozs6zes4lKFks5eq4tRMn914v9ubENQXkeCQ96ExGxHMhk6/BnEeZuubuAOxkvGtwJX89EtugbxvuKDeF2Pih4733BAi/DK5Z/75L4AqkBqAO9WsggeQwSMSETyT18zi8eYdmxK29F7Bk/+sTu4FrQFTyS8c1SqHNUsTxo0HOPqFPOMtZaUtSNsfPzdrEsVnNYb7YJ1CAgeC27Wy4OUxERgUd7Z6mAyKgv2FiHEtBo/4NvCf1sxWoBm+iRLSVb6mWWip1f7cc3cfUuGaRrwPT1qE0BeXIVQRf3w/xemkeD5xeoS0AZOnagrJrL/Y3k/ZLTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Fri, 5 Dec
 2025 01:12:01 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 01:12:01 +0000
Date: Thu, 4 Dec 2025 17:11:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/4] drm-uapi/xe: Sync with
 DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition
Message-ID: <aTIxXnBjmxGzvj0d@soc-5CG1426VCC.clients.intel.com>
References: <20251205000528.720706-1-ashutosh.dixit@intel.com>
 <20251205000528.720706-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251205000528.720706-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0314.namprd04.prod.outlook.com
 (2603:10b6:303:82::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: c62a4479-cfcf-4ccd-82f2-08de339b4b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2FiWlhjR3pyK2hhc2hWMlRoL3pJV2dublZLOUR0VUhOZXlEai9sWEZnN2Iw?=
 =?utf-8?B?R2RiaEkwaDJkYnI5RWpqVDZjNDdrSGtaUm4rOTdNZGVhTnFaUFBDY1lmZDJM?=
 =?utf-8?B?TmR1aEtibzQwTUE1OEJiTEdTYmhSQjFZT0hwa1dnQkdZakE5WHdnR3FKbHJ5?=
 =?utf-8?B?cW9CT2ZyYzRMZnVyOTJFbVptRk1UY2YzQ2k0QWRud2twUGZ2L2IwU21OTlZX?=
 =?utf-8?B?Z2IvQjl2WWcxSnRWdjdwMllGckJwd0hBUWxCSHQxTVNYQi9XQ1JiTHhpVWMr?=
 =?utf-8?B?ZE5uTUFPYVRkUzQwb1BmWmttWjJ1SUZ5Q2N6QlRiVTNpWldYQ1hTU2VaL3FG?=
 =?utf-8?B?ZTliT2wwY3U0MjB0eGJFS0k3cmU1RnFWRmlxQnBDK3o2OVJPVWt1OE5ETG1O?=
 =?utf-8?B?bjFkVHI4eXRVRS9JTExCaFZTUnoxb2QybU9OZ1p5bkFqd29FRTJtL3hua2Jo?=
 =?utf-8?B?aEo3VTRBY2xxYk9EbUFEZ2tzeWJNS1FoVTNhdzFIMFVzS1JsalgvUndkaWMv?=
 =?utf-8?B?UXFyVkwzdkZONVNrN0FLQzFudlBSYmVtV0lMbktHZzFjYklrZHdoMldSZW40?=
 =?utf-8?B?dC9BQzZrUjRYeUtXK3luNXQ4YzlSN2ZnVS9pQm9rck1jU05JN0t2dWFlUHdz?=
 =?utf-8?B?OENsTGxDNnhySzZMcml3eTViMDZZbWNsenRWbmVJNXNuaHFlcjA4UGttOGJM?=
 =?utf-8?B?L09yUkVFTjRGY2J1aXkvbGJVWkhpaU5DWnZUSzFDN3BvWjU3eXM0SllBcThj?=
 =?utf-8?B?TS9MUTFVanpUZDk0SGMyOFBYV1R5Uy9iN25nZ0k0cFpUc0NGa0QxV1FGT0kz?=
 =?utf-8?B?Z2RnZjNtb0ozWVRCSTFXbDB1NENiUWs5VTBzSjFDdnVwNi9WNXhwamM1VW5u?=
 =?utf-8?B?UmltemN2cjg2ZjdpOHdyUHlvSHNsVGFmVExGamMvdFpoTXJsS0VBc2hRbndP?=
 =?utf-8?B?NmV3T3lacFVQcjQvTG4vcjc3SmRQWVFwWHM0cnordnlZbjR4U2NrRTNrS2hE?=
 =?utf-8?B?SCs3N3JMc0hmanU0YVZLRitzWnp1WmdwNWdBVE55WmMyMDRqTU9EYlVyZnhO?=
 =?utf-8?B?Z240WTJiUGNnS3M3WExhZUo1aHdWaWpWQ1pwQk5jUjhmb0pTUDNJWFJBaXcr?=
 =?utf-8?B?YXd0bkdrSHNNc3ZkY3Fob0QrOTZGRjVOc1c0UVVvZlNBeTdVY1k5aHhtSEQ1?=
 =?utf-8?B?bUVUNHpFQ3pJOEZtT3VPRVBrWExoUDVLOEZMbWYwcU41aEJwRW9KRXUxMkxB?=
 =?utf-8?B?ZzBNYzluSm5lQUFuNHZWb1A0U0JNTTUwWitFU2Q2Z1BnMzh2V2tjcHplUFpm?=
 =?utf-8?B?NzlFOUhMVXNBVVNLWnpXbVdSSTZLN1dJcmdEcW1jWE5yWTlBNitzZGxIQmpP?=
 =?utf-8?B?bDhRdHB6OVRLYkE0ZWx5SXlwKzNiMGhXRVd1L3VrT2g3c25LL0JxcXhmZWVX?=
 =?utf-8?B?YUh1OGNoWHZBQzlUTnJqdHVtMW9Id21FZUdTUml2LzdYOENsTFBzWm5VdHVR?=
 =?utf-8?B?dnQ0M05uZW1GVUdjSHh0eGF1cEZJVDVwNkM0cmRZTE0wSWlXQkUzcDdQaE5Y?=
 =?utf-8?B?WHhWQlZ6MitNU3VnM2I1Z2JBY3ZvNGZoZkdlbmp2ZVA4bUNPTjVvTGxKUmRC?=
 =?utf-8?B?RzhEQnp2S0ZHRG9GY3dKQjA2eGFnU0JHeE9teTgxQTNKRVhJOEtPNnUySE5z?=
 =?utf-8?B?Q1E5VXF1QnpLNUZ5UU5xYmVyNXNZNTYyR01VUGZ4cnhCVXhvY09EQTZIWFRp?=
 =?utf-8?B?Y2t4ODA2THBpU3lSdDFra1pvTitzMkVIeTR6SjNDRW9lUGY3ZFVXcUgyZDQ1?=
 =?utf-8?B?SGZDV2p3TXk4RE5qejNScmVYb0xOaGRKWUJCbmNzY2Z5Q1NuSys2WEZZMTJn?=
 =?utf-8?B?NnNkMDZvc0cwZnFrYjhZQTl6bWhEZWJ2Z08xR0IrZ0dQUFJ3VEtESTlBcFlm?=
 =?utf-8?Q?ensmldq8kQgEIZDFBmcZPQ87Pu7DG0Bp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjE0ams1Y05xZ3pJeFJGZXNFWmRGcEZwd0daUHVVTVQrUmdmNkVkcmpyU0JL?=
 =?utf-8?B?alk3NlVkdk9xYWVhQjBMTG1ZaFZKM2J1b1RBaTkvUVNYTDdWbktvR21uSGFN?=
 =?utf-8?B?N1FDUHZjZWdxRnBxMkpocmlXVWFvZFlSbjRQUWRINC9mR0FGWENvZW93K0V6?=
 =?utf-8?B?bmQ5OXdlKzlpVG50aWkrcWJMUXhpSVpPY3Q3VVBqZDRaYmdBQjNhU2lVRDdG?=
 =?utf-8?B?Z0FyaVBjTzJuQ3hWemRud09QZ3VCTFBQVkdtaHNRcENZTDdTRXBpWDFpZjJL?=
 =?utf-8?B?YVZVZWk4ZlVHWWE3UGhFVzNlQ3VHcFZUKzVSMHlJT0lJOU4rcXVSbUR5cFhS?=
 =?utf-8?B?ZFJFbkJWQUF0Q3duSHJ1NUwwRFpRSnN4Znl5RzhKZms2cFBBTEZKMWIxOVFN?=
 =?utf-8?B?em5zQndoUGt1YjdGMisycFJya2lrOEVSWFpkM2lMTExlQW5IS2ZuYW1CSHBR?=
 =?utf-8?B?Tzk4R0VXQzFDUzNJWnY4aVNFcE5UR3o1TlJTYTd0bis4dEJDdlRqY0tNM3NT?=
 =?utf-8?B?b1JnLzdLN2Zta2RkT2N0ZkQyeTN6UTF5VFd5YmJsVjVjZU51TWZOSW9wWVZJ?=
 =?utf-8?B?M1pKcFljWmpBUnNLSXBiSHhOWnBrV2g0MldGTkVqd2txNjB3YjBOdCsrNFBP?=
 =?utf-8?B?V2xoSVNNV01aSm9Oa0d3QmJWKzFyOHN5VmxaNHFDUXVtdWd1YUJ4VUtJeHpQ?=
 =?utf-8?B?bUx3MzB0eDRTbkN2NjJhOFROMDlDMy9wNm9DMWtyREh2bS9tL2xKNGpnZng5?=
 =?utf-8?B?akhZcWt1UE80N1BPbGlld0ZCTmR4N2FWOVk0cWVRMFhqR1JLdWpVak5sRE1S?=
 =?utf-8?B?T21qeHBENGd2N0JCYmQ5dmtwazBvbTRPQTVCRnI5QWRNWml2TUVYNHQ0Nzln?=
 =?utf-8?B?MVcraTg3TjFxSXlFalpySmJEL2hBRXkzMlp1Ry9YUUEweUNHbEZ5OG03Wkw5?=
 =?utf-8?B?aGE1M3BDNkQzeWxDMy9TTnNJbGhxVE5FbWk0ZExDNndwamlsUkdQTFVBY1Zw?=
 =?utf-8?B?SzdvcEtMdmNaTU4yNC9mREZNOU9NbSt4dXE2R3d5VWh0VnJUL3l2M2dwZkZI?=
 =?utf-8?B?SjIreERld01XWXhjdXlSOFdqd3hJb2lzMHB5ZTJEMUFhankxTXdDbzV5OCtE?=
 =?utf-8?B?SDRIakxadVJwWFR5bTVkOGZ1T0xWcDF1aDNlSjlSOFZzM0h4ODNZbkMwWHo4?=
 =?utf-8?B?SWRpaHdmWmF3dWFDcDhSL0Z4Q0UxbVdxdkJQc1RwT3JadzJqRE03RkVsWWFR?=
 =?utf-8?B?cXZLUFFZQS8xb093cTRrNzZKWCtHc1B6ckZYbmRsRVZYQU9CL2pheUZja1Iw?=
 =?utf-8?B?emNpcjlaNGRzdkVWM21OcEc0WmljWGQvd2I3YXpUUzdXSU9ubXRKMks5c21l?=
 =?utf-8?B?dXduTlFuQ2d5eW1hdmxURklyQ240c1Z6MjE4TEs2M1JHRm1DWVc2YktJVHhC?=
 =?utf-8?B?WGFMREVtTWRTclAvaGVodWc5MklNMG9zNWhMTDZ6VGhFWXFHcEtBbHd5aTFJ?=
 =?utf-8?B?N3NIZlZFcU90QklORVRMQmhVbHhyME8yR090Z2hoN0JyV0J3dmM1WCtPVGVX?=
 =?utf-8?B?bHhxdGRQUEl4S2lpelFPRWRNZEVmYXV4cVhIR09iRFBtaldkcnVnUDlDY3pp?=
 =?utf-8?B?UW5DTzZjaFVOK3BZVXhKTHRzZWV6bjdQb0luSkd4WVN3RDNFM0JZQmdXUE5V?=
 =?utf-8?B?S0FLV3JqR01BOXdZNnB0UTJxdExVb0ZqV24zYVZjVjAzU0doME5idVZ4K3Jj?=
 =?utf-8?B?RDdHQ2VJOTlxalRES1RQdGx5RUtMRHlYNlh3anFmUm5nQkpuUWtrR2FDN0tG?=
 =?utf-8?B?VnZ0VXZhVUhnYk5SQnBzYjNsai96QmtvNWdsQnJRcEFjU3VCTHBoOG1GSVpC?=
 =?utf-8?B?MHUydEwrT21aaUFuV0ZnT3p5bWpxSjBibUgzaDBBSGJyOE13S1B3WWhFNklP?=
 =?utf-8?B?QUVYMEcrbEhUYU5JK1JuSS9HVktScTQ2RXdJQUZvNkVlS2V3eVl6SDJEeE83?=
 =?utf-8?B?aExlUlpkS2lwblZpbmt6Zmlhdm9RbHVIK1crN2R1U3Mvc1prQTMxUDArM2dE?=
 =?utf-8?B?Nys0WFlFcVhBMzZhNkZyMGlGRmJJTU1qWUgwMXpRUmlYLzV6b0tPUTVTaVpZ?=
 =?utf-8?B?cXJKajNhTWszQy8vUDhUd2Q5MnFMS2o1TFlrd041NlpvWVFReWVEcXBlYm1z?=
 =?utf-8?Q?86NzPLLi//zuvpTt39lhxyU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c62a4479-cfcf-4ccd-82f2-08de339b4b4c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 01:12:01.1061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSH7M9rr+/u9Np1Gbx86ubGShmvxYrUAIHCM70nI8mAVGcmbJj99EKnFJCjTx37ValgF/QNfs8oi0+GdgesQQFREGS/jQUKEn6nzeR4+TRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
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

On Thu, Dec 04, 2025 at 04:05:25PM -0800, Ashutosh Dixit wrote:
>Align with kernel commit 16e076b03658 ("drm/xe/oa/uapi: Add gt_id to struct
>drm_xe_oa_unit") to bring in DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Is the intention also to bring non-OA changes in this commit? Then you 
may want to change the commit message to sync header file or something.

Thanks,
Umesh

>---
> include/drm-uapi/xe_drm.h | 55 ++++++++++++++++++++++++++++++++++++---
> 1 file changed, 51 insertions(+), 4 deletions(-)
>
>diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>index 89ab549354..62e3221f59 100644
>--- a/include/drm-uapi/xe_drm.h
>+++ b/include/drm-uapi/xe_drm.h
>@@ -210,8 +210,12 @@ struct drm_xe_ext_set_property {
> 	/** @pad: MBZ */
> 	__u32 pad;
>
>-	/** @value: property value */
>-	__u64 value;
>+	union {
>+		/** @value: property value */
>+		__u64 value;
>+		/** @ptr: pointer to user value */
>+		__u64 ptr;
>+	};
>
> 	/** @reserved: Reserved */
> 	__u64 reserved[2];
>@@ -403,6 +407,9 @@ struct drm_xe_query_mem_regions {
>  *      has low latency hint support
>  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
>  *      device has CPU address mirroring support
>+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>+ *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>+ *      This is exposed only on Xe2+.
>  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>  *    required by this device, typically SZ_4K or SZ_64K
>  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>@@ -421,6 +428,7 @@ struct drm_xe_query_config {
> 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>@@ -771,7 +779,11 @@ struct drm_xe_device_query {
>  *    until the object is either bound to a virtual memory region via
>  *    VM_BIND or accessed by the CPU. As a result, no backing memory is
>  *    reserved at the time of GEM object creation.
>- *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
>+ *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - Indicates that the GEM object is
>+ *    intended for scanout via the display engine. When set, kernel ensures
>+ *    that the allocation is placed in a memory region compatible with the
>+ *    display engine requirements. This may impose restrictions on tiling,
>+ *    alignment, and memory placement to guarantee proper display functionality.
>  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
>  *    possible placement, ensure that the corresponding VRAM allocation
>  *    will always use the CPU accessible part of VRAM. This is important
>@@ -787,6 +799,17 @@ struct drm_xe_device_query {
>  *    need to use VRAM for display surfaces, therefore the kernel requires
>  *    setting this flag for such objects, otherwise an error is thrown on
>  *    small-bar systems.
>+ *  - %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION - Allows userspace to
>+ *    hint that compression (CCS) should be disabled for the buffer being
>+ *    created. This can avoid unnecessary memory operations and CCS state
>+ *    management.
>+ *    On pre-Xe2 platforms, this flag is currently rejected as compression
>+ *    control is not supported via PAT index. On Xe2+ platforms, compression
>+ *    is controlled via PAT entries. If this flag is set, the driver will reject
>+ *    any VM bind that requests a PAT index enabling compression for this BO.
>+ *    Note: On dGPU platforms, there is currently no change in behavior with
>+ *    this flag, but future improvements may leverage it. The current benefit is
>+ *    primarily applicable to iGPU platforms.
>  *
>  * @cpu_caching supports the following values:
>  *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
>@@ -833,6 +856,7 @@ struct drm_xe_gem_create {
> #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
> #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
> #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>+#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
> 	/**
> 	 * @flags: Flags, currently a mask of memory instances of where BO can
> 	 * be placed
>@@ -1013,6 +1037,20 @@ struct drm_xe_vm_destroy {
>  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
>  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>  *    handle MBZ, and the BO offset MBZ.
>+ *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
>+ *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
>+ *    CPU address space range is unmapped (typically with munmap(2) or brk(2)).
>+ *    The madvise values set with &DRM_IOCTL_XE_MADVISE are reset to the values
>+ *    that were present immediately after the &DRM_IOCTL_XE_VM_BIND.
>+ *    The reset GPU virtual address range is the intersection of the range bound
>+ *    using &DRM_IOCTL_XE_VM_BIND and the virtual CPU address space range
>+ *    unmapped.
>+ *    This functionality is present to mimic the behaviour of CPU address space
>+ *    madvises set using madvise(2), which are typically reset on unmap.
>+ *    Note: free(3) may or may not call munmap(2) and/or brk(2), and may thus
>+ *    not invoke autoreset. Neither will stack variables going out of scope.
>+ *    Therefore it's recommended to always explicitly reset the madvises when
>+ *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
>  *
>  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
>  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
>@@ -1119,6 +1157,7 @@ struct drm_xe_vm_bind_op {
> #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
> #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
>+#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
> 	/** @flags: Bind flags */
> 	__u32 flags;
>
>@@ -1273,6 +1312,7 @@ struct drm_xe_exec_queue_create {
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>+#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
>@@ -1657,12 +1697,19 @@ struct drm_xe_oa_unit {
> #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
> #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
> #define DRM_XE_OA_CAPS_OAM		(1 << 4)
>+#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
>
> 	/** @oa_timestamp_freq: OA timestamp freq */
> 	__u64 oa_timestamp_freq;
>
>+	/** @gt_id: gt id for this OA unit */
>+	__u16 gt_id;
>+
>+	/** @reserved1: MBZ */
>+	__u16 reserved1[3];
>+
> 	/** @reserved: MBZ */
>-	__u64 reserved[4];
>+	__u64 reserved[3];
>
> 	/** @num_engines: number of engines in @eci array */
> 	__u64 num_engines;
>-- 
>2.48.1
>

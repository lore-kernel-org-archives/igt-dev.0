Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B071CEACEF
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 01:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378E210EB9E;
	Sat, 15 Nov 2025 01:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTw0wOGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D368910EB9E
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 01:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763169506; x=1794705506;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hojko53Pud4Ob+ISRGCN8HYu6CwbotO145aDJ/te2cM=;
 b=DTw0wOGXfZAVr5YVSvbECvil4FHGblQl0x3tDBy2Cw2kBzDwzbM1HCD2
 SaMNBh7BGP+W0GeCxXhFTirmevXpYDA1bSafhQVHYn/xCedABPpYjvFLm
 hCOxTvrDUqOqpUCu7zBqNmiR03m6uggW/rtK+Z9jgUVr1vAYGpLelytwr
 tlKQHwtqM2fDEmaUMbF4rxmgWUvPEC43N1gr2CIrf3SvCymqVFF+BR75k
 SmX0uvoJQgd0NH8NzdgxHP33kspYE2sy7y/9O6PDUUnEPnniIWbw5KwOx
 s9E2P+yZU42q9f+XzOUI8KiXK8TSF8gTzQhxe/EXQWP4CWHpso35+OeWn A==;
X-CSE-ConnectionGUID: 4CsC52rUTzWNLXpmMeeNDA==
X-CSE-MsgGUID: oUY8Ar3fQnuafo+KQvAV1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="64474542"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="64474542"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:18:25 -0800
X-CSE-ConnectionGUID: 94tbIxN3TrKwdDSQDwrNpQ==
X-CSE-MsgGUID: fbaGQzG2QouEN0RIOGreHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="189181610"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:18:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:18:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 17:18:25 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:18:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkbQdWv5+p+798VWifH7cqCd55OrQnl30sS5nQ1qIaN58GcDB1YnPZ66Lu7Ph8SQG03MR4cb88UmmAODZngY0rHF83//QDlemhncg7SlD62gt3x5HYQS0jtdn03S5kz2BXmWfiiP61czbXEMFcnQ0m5gBUNoAuVypl0ehjTeb1vA7ubZqKPYdN1BO0jR4acE8az70O4wIxMH9DIZSDN3s+J6T8uiRm6mYGX6R+U2O/jokvKzMD16nQUkYXaru2VMLWCH+bKz21AkEo2I3jd5l2Dsg5xkL+0uqiXtMPGPg8VKyX49yRv/FevN3HdUP71vEvQWPkG0kYWYAoUq/IY3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hojko53Pud4Ob+ISRGCN8HYu6CwbotO145aDJ/te2cM=;
 b=CqQY0PvaBHkdi4KgWKEwy+TOiYPcFYFCb4AQ5tPRd+hlrpS5aFyGy4Uz/VwqrhzplC6kVFzJ+1qU0RFJXZHTSDYAoN0HX2hpzGEwP/LD5KvfU+rvnzWkB3UoRvA+arP9k84rNEIKJlkhOrKighAJhety75XrukOnf1GOT6fuqqRMAB4SJ9YJnU2uq9V8Vz6lQbFYWYmhORBYzXTzbgA6OWdG0S+pGeiYlUJxUPbdiGnNzW0ATGq83u9y7kDRlDLEuWF7P05eFptl5E/wHhYN8fl8bt54t24jXFe2pjOQvqwy3pr71g0OJXJnDHRtyEZiniK536+bqIFbMtyI4Dbs5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by DM4PR11MB6213.namprd11.prod.outlook.com (2603:10b6:8:ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 01:18:22 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:18:22 +0000
From: "Wang, X" <x.wang@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tools/intel_gpu_frequency: Fix help and version
 options
Thread-Topic: [PATCH i-g-t] tools/intel_gpu_frequency: Fix help and version
 options
Thread-Index: AQHcVZws3+kkEcPMx0u89mi/8DWNO7Ty5Ugw
Date: Sat, 15 Nov 2025 01:18:22 +0000
Message-ID: <SA3PR11MB8046A88E38045F87B45B40E186CBA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251114192308.133691-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251114192308.133691-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|DM4PR11MB6213:EE_
x-ms-office365-filtering-correlation-id: a30d48d8-bfe4-481e-a646-08de23e4de49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?STV2ZDh1bFF5eWpQYWE1RFBueHZEYVRMeVMzbGFrZTNYQXlDTTNjdlNUTXhs?=
 =?utf-8?B?TTBYKzlNZTZ0NElFa20zYUJ1WTVxMURUaXFLZE5Kc2ZaaHlYd0RlaXU3eG9j?=
 =?utf-8?B?QXFzRHkzbWV2MHltZ0VoY1hXOW5nSk9HQzY5SFE1TDVJUWNBVEJMbDh0alU4?=
 =?utf-8?B?YmNFQ3JwN2VPdW1ISzM4Yk9zZWs0bldYM2xtSVN6OTc0SE5KbXc5dFI1Smti?=
 =?utf-8?B?cnRmdHluNjdBdkhrZklHd3p0Nzk4NE1rR3piYkdPT3JIRUJIeXdGcE1IdHNo?=
 =?utf-8?B?V2lyY2dHQkFYWi9vdkJvdHFvMDNGam4vQWd1RHZrM3pUTW1Gam4zakxsalNH?=
 =?utf-8?B?RmV1bVJTdUxacm5ITEM0ZGoxbmV0MG1EVUcyMHdORGQrWVdCUGxsSk1ROUpM?=
 =?utf-8?B?ZERHaXYydG80UEZ5bnZWWVNoRnVoNUE3UGNqSm10cnJja0Vaa29ZZGlBSjE2?=
 =?utf-8?B?U3FmbXVCQ2pYODZMYi81cG1Kd201RCtudDdzS1JRZk9XTTcxRjEzWnd2a1Vn?=
 =?utf-8?B?R3BiM25ydk9NNjhmdGgzMllXcVVuSFlLWk5kQWduTERhV3UvT0F2UlV3UTM4?=
 =?utf-8?B?dGVpNVlNaERsdkhKWk03djVEdWZ6YUFkSTZkRjVzZWkybExtSzB6SU1JNzJB?=
 =?utf-8?B?Q0NZbU5mT3VxMXVPTDlOakpyUmpLVWMvbW1GR0NlNDU3d1hMWTFsTTBVOFJG?=
 =?utf-8?B?TlBJdXZod0tUd29wOFI5NFM5OU04cmF0cXBOa0FURnliWW5qeW81a0hpOG44?=
 =?utf-8?B?Vmc4aEljaStyR0R2b1FqTWJmWWU5Y3BXQXBZN3B1eURUVWNpL2kzNFArTmhj?=
 =?utf-8?B?M1ZvODlzRDA5NVE1bmRZUkI1M2FIY25sN05JRlNtLzNldWMzc1RmWS92ZUgr?=
 =?utf-8?B?NzJ4dnB2eUFRb3FwVVZCMHZxcDNhMG91TmNNNGo4NmhmdXdIcWtjYTJFL1Fj?=
 =?utf-8?B?b3YrblQyUWpuMUVxMlFCd29IT1RLa2hSZDFsOFYzb201b0Nnc25RQ3VMOGdo?=
 =?utf-8?B?cjFFYXlvS1ZOZVphdjQxVW52blIrVmYxNDM3R2tNZUk0d3cza0ROL3VaSkRy?=
 =?utf-8?B?V2tsVlBYdStlUU81TlNjWEl4TUV5YnkvNnNOWDBqZm5yV3pXOWNqNy9CZThu?=
 =?utf-8?B?TkhNMlpvSStoeTRhTUNvZ1BMRUtIY0QzN2JZakQ5L2dpNWx4S09YQWdyWXVm?=
 =?utf-8?B?VWd3WFhkMUZzTlVKSGdyZWpZOXN5QkJpeFNFbXdJYnZnZ2JnSFQ1WUdDNnRt?=
 =?utf-8?B?dDZzT3JFUHlsT1Blb2ZVaisvbU5reGR5a1c2M3M0NnJWeURwWGswS3FsMG1V?=
 =?utf-8?B?SDM0RG5BTnFaTzQzb3czaFhURW9EcTczVXFrS3dMRVlaUUZlMk9XdFM4Wk42?=
 =?utf-8?B?RGJFOHJWRDZBZGVITi9jaUdVTEZOTm5sT1ZaamJlbVJ5Y3BYc3lwV1FpU1dS?=
 =?utf-8?B?RDhXQ0ZOelNpcXFabkE2d3VtZWZBd3R1VzNoRUNRWDdaRUpBU29oTlRhTi9L?=
 =?utf-8?B?a3k1U1BNdWlnQXFlRkFMcjd6bk9iSXlLZEFmUWo4czlZbUw1UGdDTDdXSGl4?=
 =?utf-8?B?czRsdEJXNEtiM1czL29KRCtwUGh2aE5VeWRIWE9NbGFzVnIrVkdHbkdoWTJq?=
 =?utf-8?B?eWE2VTh5VGdLeS9XV0paTzJLMzIyb25tdjNrd2xBeGZsRVpRWjJXTkZSMm9x?=
 =?utf-8?B?RzU1SzREKzdlcCs1MDBzd3J0c3JiSTZna2IzdlM2NTNNLzM2ZXc3YWlVM1ht?=
 =?utf-8?B?STd1eHVCR1g1ck5YYk5PbG1JV3RNVytXVVpORHY2OGp5aWhJQnpIK1JLb3dI?=
 =?utf-8?B?dDIvZ0VpWG9DQnVyOGZVY2JRWXRicGFwSFNqOUFsU0E5QUZhbENJOHNJejI2?=
 =?utf-8?B?RTRGTjVTTzQwWDRDVjdINjk1VHh4My94djRJaGE0aC9NYStjaGsrcmxIazRP?=
 =?utf-8?B?UHpUc2p6ZEE4cmJqcGE2Z0g1L1RDVXc5UU8ralJYZTh3Ujhzb3JuOG5LZ0VL?=
 =?utf-8?B?VFNyVmh3RExnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXYzdi9YL0lINEpraUd6N3lKd2JNMjd5d2Q2bXNGR2trV3pjMlhsTDdlVjd3?=
 =?utf-8?B?em9uaWVacVE2eFh5RmFhaFlSVFl2eHhCNWhnZVBFMVc4WEZPNFF4bFcrcVkx?=
 =?utf-8?B?Qm5kUlN4WG1tK1RsMUlvZkNzRnM2M1lQNjA0dVBCdUxXQThINFk0ZmdJaDl2?=
 =?utf-8?B?RVA3aXNvOHljNVBVVkdFUTZZaWVYVXEwakYzNDIvYUc4OUhzTktwYUx3dzdp?=
 =?utf-8?B?bjBuVDRxcS9RRUc5U3dnYkZtWDV1WTBmQlhOM2QrMmdrZm8zZkltUGZpVGJV?=
 =?utf-8?B?ZG8yVlZkMDRQcXF3eVlkektOditiKzNHRWRiQ05xbzJ2ZHpBK2oyQUVBTjNH?=
 =?utf-8?B?alFLWmNYelJnTDVHTGpWUitIclVhZHJMeXlDdEVSUzdHM1RZTUN6aEVnMXVF?=
 =?utf-8?B?TTdXVG1BandySTVCSVdDMzRYVWZtQlBmWUw4K2NvZklpMkgrZjU0RC9acWZS?=
 =?utf-8?B?ZzZkMHJ3ZmxaenFqa0lvSXlRbVZJQTdyVXpMbjhaZnk1WTU3aU1VNUhlOHU4?=
 =?utf-8?B?VzcvT3VaWm1weFpzSzE0SVpudWU5RjRWenI5cW1HSytMUDBsQ2RMM01Ha2E5?=
 =?utf-8?B?Ty95ZnQ3NnFENEk5V1BVT3F4Z0xZa1l2WUFaZ1NZanlIbk9ZMDdQOUl1UnBB?=
 =?utf-8?B?WE9wSzJtK1FJbDkwQUhpZ3pVcWoySEs0dmhTb0U3NlNiSU1Ob0Exc3A5R1dK?=
 =?utf-8?B?NVJhTkdZMVNVN1Fma3NveXVmb201SjlBaUtDUk1ETzh0K1BMUEFvWG9uVktR?=
 =?utf-8?B?eTNwRkliajRGVFpYRmI4ZHBhNXBIaDdtU3JhcCtMVVRSMG1lRk5sVXdvUHdj?=
 =?utf-8?B?V0hFUS8rM2V5K0NxUlcraEJPUjlYcERpMmtWUGluSERGdHZKU0JSOUcwelND?=
 =?utf-8?B?ZEo2L1JFQnFBQk9xTTBmN29yUDZ4TFlocUhaTHJZVkdYYXYxSHZQZHpIMWFu?=
 =?utf-8?B?Z2sycEg4VkVGb0s1RUQzRU50cndoNnN5MnM0MGRaQnEzVXVWQldqZ0lsbHpr?=
 =?utf-8?B?QkJpb1EyejRDY0JSTTF4cVJldEhqU0tnNkd0ZUs0dElHMHpwcDJEdkZRcmpx?=
 =?utf-8?B?RzdjQ2RMQW9mYUY1S1hzREtibUF2ZHJ1MzE3MzVVM2F3MkM1ZlBoeTJ5VGNh?=
 =?utf-8?B?TGYwbHB6QWhjOGlmZGpQQkZsTVR0SmJUdnNrclY0N1o2V1ptTExqbFI0Z1Ja?=
 =?utf-8?B?ZklmcDgxNUR6UUFBMmp6MU9NSzN2N3FScGVOQStoN0dQSStGdkN5STZySFRn?=
 =?utf-8?B?T0V1SzJJT2x4TkxUMjMxQ0tjNjdlZm54Wnl4TEphdFd4OWE3akttR2w0RUVL?=
 =?utf-8?B?SnJLNzhKMVBqMW1PZ0ZweHREeW9xVGUzWG05cE1DdEFUeEptd002OEdxSTNM?=
 =?utf-8?B?MUhVRjdGQWEvS1hyNnFJbXhCZ2xBRW1aZGMralF1VndwVFErRFY1ZUlDU2hy?=
 =?utf-8?B?QjFETXVtTjhaU1Rqd1IzZTJicjNOYVNYa0JjV0JWQ0xRUGlhcnpDSWJPSW9m?=
 =?utf-8?B?aXVQNUxzcng3T1pRZzVlc0M0S1diek9WVkU4WUd0QUxnZVdpVDFoVytCZVRI?=
 =?utf-8?B?NUR1QnBmemVZbGd2OVFiQXFSVVk4bVhDYldBMTFnNFZDckdwamgxTWZITHU3?=
 =?utf-8?B?RzNTdU9TaWJwNUFmdkRCaC9tWlYrZEYvRWZ1QSt0cm9HcVpMdzdUQXpMcEdq?=
 =?utf-8?B?REtMM2tEZms4YzFDelRWZlRoNURLNU1VUm14MTRWSW9mc0V1ZEk5OU5rbnZp?=
 =?utf-8?B?Q1lVVDlmaFhxeXRzcG40L1AxUWt2MXo2M2J6M1hYK0E4VEVMeVNScWVyOS9L?=
 =?utf-8?B?czJZYVJJcWpSMW10bVRpWEpoeG42Zy9oazlHSkZBTHZBenFZekdxTWhOZWpH?=
 =?utf-8?B?eEJLZnd2d296NVJpQkIwYWw4L1lrRThHcXFxWmY1Mkw3YzdSc2g3RklIWVBY?=
 =?utf-8?B?cDJCWUJOL1JON0pnRkdDMlV3enNuT1F1NjNuaTR3Kyt4YlY0NW9TbzhRTGxr?=
 =?utf-8?B?Y1hjVTJSRjE0aUdLaDVySVZnVWxlV01xRnZVa0xYczhwYnY4SldGZ1h5d0g1?=
 =?utf-8?B?alFobmZSM1ZUTGRUZ3VSb1BCcnZYUGZmdWJNeFVoVDB3MU1xQkF0bENlS1Nz?=
 =?utf-8?Q?+CJs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30d48d8-bfe4-481e-a646-08de23e4de49
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2025 01:18:22.1462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mUYfGzkLQQ4brg8UnD2v5+r8QyPQwMCZe4/vXqGCP+tVTeienuNZAQ0sWjTKm07o/dy8lmHJKT/69QLi3mPNAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6213
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

SSB0cmllZCB0aGlzIHBhdGNoIGFuZCBjb25maXJtZWQgdGhlIGlzc3VlIGhhcyBiZWVuIGZpeGVk
Lg0KVGhlIGNvZGUgaXRzZWxmIGxvb2tzIGEgYml0IHN0cmFuZ2UsIGJ1dCBJIGNhbid0IGZpbmQg
YSBiZXR0ZXIgc29sdXRpb24uDQoNClJldmlld2VkLWJ5OiBYaW4gV2FuZyA8eC53YW5nQGludGVs
LmNvbT4NCg0KLSBYaW4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0
LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEthbWlsDQo+IEtvbmllY3pueQ0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDE0LCAyMDI1IDEx
OjIzDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS2FtaWwgS29u
aWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFU
Q0ggaS1nLXRdIHRvb2xzL2ludGVsX2dwdV9mcmVxdWVuY3k6IEZpeCBoZWxwIGFuZCB2ZXJzaW9u
IG9wdGlvbnMNCj4gDQo+IFVzaW5nIGVpdGhlciBoZWxwIG9yIHZlcnNpb24gb3B0aW9uIHdpdGhv
dXQgcm9vdCBwZXJtaXNzaW9ucyBjYXVzZSBub3cgYSBmYWlsDQo+IGFuZCBzdGFjayBkdW1wLiBG
aXggdGhpcyBhbmQgcGFyc2UgdGhvc2UgdHdvIGVhcmx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
S2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIHRvb2xzL2ludGVsX2dwdV9mcmVxdWVuY3kuYyB8IDQyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2ludGVsX2dwdV9mcmVxdWVu
Y3kuYyBiL3Rvb2xzL2ludGVsX2dwdV9mcmVxdWVuY3kuYyBpbmRleA0KPiBkZTBjNmRkYmEuLjhj
M2M5MTMxMyAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvaW50ZWxfZ3B1X2ZyZXF1ZW5jeS5jDQo+ICsr
KyBiL3Rvb2xzL2ludGVsX2dwdV9mcmVxdWVuY3kuYw0KPiBAQCAtMTE4LDcgKzExOCw3IEBAIHN0
YXRpYyBpbnQgZ2V0X2ZyZXF1ZW5jeShzdHJ1Y3QgZnJlcV9pbmZvICpmcmVxX2luZm8pICB9DQo+
IA0KPiAgc3RhdGljIHZvaWQgX19hdHRyaWJ1dGVfXygobm9yZXR1cm4pKQ0KPiAtdXNhZ2UoY29u
c3QgY2hhciAqcHJvZykNCj4gK3VzYWdlKGNvbnN0IGNoYXIgKnByb2csIGludCBlcnIpDQo+ICB7
DQo+ICAJcHJpbnRmKCIlcyBBIHByb2dyYW0gdG8gbWFuaXB1bGF0ZSBJbnRlbCBHUFUgZnJlcXVl
bmNpZXMuXG5cbiIsDQo+IHByb2cpOw0KPiAgCXByaW50ZigiVXNhZ2U6ICVzIFstZV0gWy0tbWlu
IHwgLS1tYXhdIFstLWdldF0gWy0tc2V0DQo+IGZyZXF1ZW5jeV9taHpdXG5cbiIsIHByb2cpOyBA
QCAtMTM5LDcgKzEzOSw3IEBAIHVzYWdlKGNvbnN0IGNoYXIgKnByb2cpDQo+ICAJcHJpbnRmKCIg
ICBpbnRlbF9ncHVfZnJlcXVlbmN5IC0tY3VzdG9tIG1heD03NTBcdFNldCB0aGUgbWF4DQo+IGZy
ZXF1ZW5jeSB0byA3NTBNSHpcbiIpOw0KPiAgCXByaW50ZigiXG4iKTsNCj4gIAlwcmludGYoIlJl
cG9ydCBidWdzIHRvIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS0N
Cj4gdG9vbHMvLS9pc3N1ZXNcbiIpOw0KPiAtCWV4aXQoRVhJVF9GQUlMVVJFKTsNCj4gKwlleGl0
KGVycik7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQNCj4gQEAgLTE0OSw2ICsxNDksMzEgQEAg
dmVyc2lvbihjb25zdCBjaGFyICpwcm9nKQ0KPiAgCXByaW50ZigiQ29weXJpZ2h0IMKpIDIwMTUs
MjAxOCBJbnRlbCBDb3Jwb3JhdGlvblxuIik7ICB9DQo+IA0KPiArc3RhdGljIHZvaWQNCj4gK3Bh
cnNlX3ZlcnNpb25fb3JfaGVscChpbnQgYXJnYywgY2hhciAqYXJndltdKSB7DQo+ICsJY2hhciAq
czsNCj4gKwlpbnQgYzsNCj4gKw0KPiArCWlmIChhcmdjID09IDEpIC8qIE5vIGFyZ3MgKi8NCj4g
KwkJcmV0dXJuOw0KPiArDQo+ICsJcyA9IGFyZ3ZbMV07DQo+ICsJYyA9ICpzKys7DQo+ICsJaWYg
KGMgPT0gJy0nKQ0KPiArCQljID0gKnMrKzsNCj4gKwlpZiAoYyA9PSAnLScpDQo+ICsJCWMgPSAq
cysrOw0KPiArDQo+ICsJaWYgKGMgPT0gJ3YnKSB7DQo+ICsJCXZlcnNpb24oYXJndlswXSk7DQo+
ICsJCWV4aXQoRVhJVF9TVUNDRVNTKTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoYyA9PSAnaCcpDQo+
ICsJCXVzYWdlKGFyZ3ZbMF0sIEVYSVRfU1VDQ0VTUyk7DQo+ICt9DQo+ICsNCj4gIC8qIFJldHVy
bnMgcmVhZCBvciB3cml0ZSBvcGVyYXRpb24gKi8NCj4gIHN0YXRpYyBib29sDQo+ICBwYXJzZShp
bnQgYXJnYywgY2hhciAqYXJndltdLCBib29sICphY3RfdXBvbiwgc2l6ZV90IGFjdF91cG9uX24s
IGludA0KPiAqbmV3X2ZyZXEpIEBAIC0xOTIsNyArMjE3LDcgQEAgcGFyc2UoaW50IGFyZ2MsIGNo
YXIgKmFyZ3ZbXSwgYm9vbA0KPiAqYWN0X3Vwb24sIHNpemVfdCBhY3RfdXBvbl9uLCBpbnQgKm5l
d19mcmVxKQ0KPiAgCQkJYnJlYWs7DQo+ICAJCWNhc2UgJ3MnOg0KPiAgCQkJaWYgKCFvcHRhcmcp
DQo+IC0JCQkJdXNhZ2UoYXJndlswXSk7DQo+ICsJCQkJdXNhZ2UoYXJndlswXSwgRVhJVF9GQUlM
VVJFKTsNCj4gDQo+ICAJCQlpZiAod3JpdGUgPT0gdHJ1ZSkgew0KPiAgCQkJCWZwcmludGYoc3Rk
ZXJyLCAiT25seSBvbmUgd3JpdGUgbWF5IGJlDQo+IHNwZWNpZmllZCBhdCBhIHRpbWVcbiIpOyBA
QCAtMjA3LDcgKzIzMiw3IEBAIHBhcnNlKGludCBhcmdjLCBjaGFyICphcmd2W10sDQo+IGJvb2wg
KmFjdF91cG9uLCBzaXplX3QgYWN0X3Vwb25fbiwgaW50ICpuZXdfZnJlcSkNCj4gIAkJCWJyZWFr
Ow0KPiAgCQljYXNlICdjJzoNCj4gIAkJCWlmICghb3B0YXJnKQ0KPiAtCQkJCXVzYWdlKGFyZ3Zb
MF0pOw0KPiArCQkJCXVzYWdlKGFyZ3ZbMF0sIEVYSVRfRkFJTFVSRSk7DQo+IA0KPiAgCQkJaWYg
KHdyaXRlID09IHRydWUpIHsNCj4gIAkJCQlmcHJpbnRmKHN0ZGVyciwgIk9ubHkgb25lIHdyaXRl
IG1heSBiZQ0KPiBzcGVjaWZpZWQgYXQgYSB0aW1lXG4iKTsgQEAgLTI2NCwxMiArMjg5LDkgQEAg
cGFyc2UoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSwNCj4gYm9vbCAqYWN0X3Vwb24sIHNpemVfdCBh
Y3RfdXBvbl9uLCBpbnQgKm5ld19mcmVxKQ0KPiAgCQkJYWN0X3Vwb25bTUFYXSA9IHRydWU7DQo+
ICAJCQl3cml0ZSA9IHRydWU7DQo+ICAJCQlicmVhazsNCj4gLQkJY2FzZSAndic6DQo+IC0JCQl2
ZXJzaW9uKGFyZ3ZbMF0pOw0KPiAtCQkJZXhpdCgwKTsNCj4gLQkJY2FzZSAnaCc6DQo+ICAJCWRl
ZmF1bHQ6DQo+IC0JCQl1c2FnZShhcmd2WzBdKTsNCj4gKwkJCWZwcmludGYoc3RkZXJyLCAiRXJy
b3I6IHVua25vd24gb3B0aW9uXG4iKTsNCj4gKwkJCXVzYWdlKGFyZ3ZbMF0sIEVYSVRfRkFJTFVS
RSk7DQo+ICAJCX0NCj4gIAl9DQo+IA0KPiBAQCAtMjgzLDYgKzMwNSw4IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICphcmd2W10pDQo+ICAJYm9vbCB3cml0ZSwgZmFpbCwgdGFyZ2V0c1tNQVgr
MV0gPSB7ZmFsc2V9Ow0KPiAgCWludCBpLCBmZCwgdHJ5ID0gMSwgc2V0X2ZyZXFbTUFYKzFdID0g
ezB9Ow0KPiANCj4gKwlwYXJzZV92ZXJzaW9uX29yX2hlbHAoYXJnYywgYXJndik7DQo+ICsNCj4g
IAlmZCA9IF9fZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7DQo+ICAJZGV2aWQgPSBpbnRl
bF9nZXRfZHJtX2RldmlkKGZkKTsNCj4gIAlkZXZpY2UgPSBpZ3RfZGV2aWNlX2dldF9jYXJkX2lu
ZGV4KGZkKTsNCj4gLS0NCj4gMi41MS4yDQoNCg==

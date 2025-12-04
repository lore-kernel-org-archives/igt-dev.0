Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426C1D2A536
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 20:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448610E21A;
	Thu,  4 Dec 2025 20:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Unvbs4LX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCF910E21A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 20:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764881199; x=1796417199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=I+E0PvVbOZ5r8cogECLBNjhyZxNny7UFOQvJ+Wh/se8=;
 b=Unvbs4LXV/ukHxfrKd6uEvdpJHsispvQDMLCeNsLwWb+tbiB7bNmS/5S
 SeA8W0y8ZwwNGh01JKFrsYKmd7PvvzxL0kpRP2b4IDonJi05d3mARux0h
 AgjC9NL0RHjlVyA0/yXUFpLOFJK9k73358rs57TZr5dus0Wzsvdp5HJE8
 T3ZDTJxQB/BMk1Uzs8KvJI903rs/iq4RsIOyuVbljThYJ/dNJdMevAygb
 bJq27EE3JR2d3iKnJb6tCA9d7kNfrNS0BX/kS1+5FFPUwVQRJydYDI+KR
 UtO6EqrXr8/saKsf4UzhWGhwZTr9hKaz+pOIuI8R2CscLN1G1oZaHQeO0 w==;
X-CSE-ConnectionGUID: pht8KckHQwyRyw5i7qPwjg==
X-CSE-MsgGUID: 2mphT9gfQvmhcVC0OB10Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66987543"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66987543"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:46:39 -0800
X-CSE-ConnectionGUID: 0XgOtTTcQ/+Oxh6OS9m0rw==
X-CSE-MsgGUID: 2+weCRdgTn+labTWR2C5FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="232423839"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:46:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:46:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 12:46:38 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:46:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3aaDj3nRf5+uJ3UmqifbI2XddjEmjxYboCf6tJVTNeZxEOQLpvo8+5rUisMMnlNlY7hcQqx6GsnT48zIjl1bBfN687E0e9hL23pdjPATfRtzU7ixfnE/GN0safgPctiIbCPX3bq1FNOTFmAIVTtHSB3Y2NSrlP3Tk6kGr83FFXrCA3zffwlKi24h7ajdkWGM3XxoGeTyI1lw2qEdlPCbmGrXL+rOrU1vY+OFTwA1O/jSlb94OSII4t6+YRNeX/+12/bloJIMQke/IqOP+swor8CA2dwsPx7Csd5g6Zz8wcU5TI0clqxo7wRw3vVDKyVTvi9BOocCzUW5uyEcEBrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+E0PvVbOZ5r8cogECLBNjhyZxNny7UFOQvJ+Wh/se8=;
 b=ZY/1FRZQbYAkh2yEF1NAidSCXOpnwVB4f8sS6JhrRCpQg12OVLZkMTYMV9DxPogkP19xEOPci6UpDZNdiZYh1qLIJON8b/D2fnawrJNb9OgroF+8FTLeCJc0ysuuLrdq8lr22kGAXeA+7WthRgO0hvAEqK69jHYK0KhhmUujV74OoI4Fo91s3dcdsqrlyQUyqTB2p+xVXRA+7IMDtBzldAdjJT5JlDrji7f1uNKlxNuhsiNfcAR0yXgOhw/NJoYcwtltU5A6DaV7CMeTkk83Wf4FcgisIb9oM7PruDcSvBGp6ynyzOooF13sszRpXtLDSU+6hdv6jqHzIWDZNJNOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 20:46:33 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 20:46:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 06/19] tests/intel/xe_exec_multi_queue: Add close-fd
 tests
Thread-Topic: [PATCH v2 06/19] tests/intel/xe_exec_multi_queue: Add close-fd
 tests
Thread-Index: AQHcWpsDiHfk8uRK0U+zDVJyjEEFRLUSCO2A
Date: Thu, 4 Dec 2025 20:46:33 +0000
Message-ID: <a5b65ddfad85919a0c11b136e4a6b069440eb4fb.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-27-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-27-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB7002:EE_
x-ms-office365-filtering-correlation-id: 9c72e949-e36a-4fde-a4aa-08de337635db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YUpHRmtpTUxuczhJWTU1aTFpeVlwRDd2TWVtYWw4WXE1UWxrWnkxdlFrekhX?=
 =?utf-8?B?emwxUTRzNFZybXo3VEdjejIvTUhIYm1CNUJDbFpnc29IZnIyc3NZUHVKaUNj?=
 =?utf-8?B?Ukt0STlNSEVNcEdadkpmbHBFckk3ZTBtN3ovM0xab29JblFsd1NuMGJkNCtl?=
 =?utf-8?B?SDJpZGthQWYxNnMyRFBaa0ZEWUxTT25JMm9tTmgyeElncjFxck44VVovY3Bm?=
 =?utf-8?B?d1JiakJkTExVZi9HV082Z0thRENydVI2VW5hZ3E2aHFjemppQ2lJT01wS1lq?=
 =?utf-8?B?QVdRM0RLMkM5UlhMbjVzNFMzWEMxaG5wM3kvNXZpYmZscFkzNHlLUkkwSS9y?=
 =?utf-8?B?M1lZeWd2bEhrOXZCcVdTQkFiVGN6SmltRzFacFVkTFhMcEVReCtmdjVBUXpU?=
 =?utf-8?B?all6ejZvSFNqbFBIZCtudEJSV0U0cnJpUDRSRDhZNDNMbklzeW1SRVQzWGFx?=
 =?utf-8?B?YldzcnZ0RHlpU25pYlk3c2k4c204aXVSRi9MOE1SNmpPTThUMmMvUUpVdEdX?=
 =?utf-8?B?MjE3UEIwcVdzMzlOQTRreVYwTzdsWUt5N09GYVU4TGlVaUp3a2xpK3Rva0gr?=
 =?utf-8?B?TlcvRjNSQVFybEFCY2FyT2hFODQ5bms5azlmYTlHSUJEM1hOTStYL2JhQnVq?=
 =?utf-8?B?REFwMC9ESmdrVlFJaHNBTGVGbFRXeVgxblRmVDJxc0llUmpBSzJQb0NkNUtF?=
 =?utf-8?B?SncvY1RCWHFxaWVHM3lrZjJzRGdZd0xJeEkwMi9pM0RUZDFPWU81ZGUxTkVa?=
 =?utf-8?B?NEdLMUpTaU4rVWgweFR6Qko2cndZSVFpVUpaelg5UjVUek0zWVFCWDJ3SXVi?=
 =?utf-8?B?V2NDTzFaK0JvZlBQd01ZeGdPSFQwR041QUlmYlhVaGlXOVpycUtWV2l2V3dW?=
 =?utf-8?B?d29iNDNldWdHdGVkNjJHRWI3eE5qNWtvWFVEVFZ2STE1L0FJbVBFeHBFTHk4?=
 =?utf-8?B?VmlobWo5aWo5T1pOeStxZCt6alM3NFpldXF2VHMyZG1rU1lxVlM3U0tIOSsv?=
 =?utf-8?B?MXFXMk9ZMzhNbmdNaDh3ZllxODJaU3dLTDJQY1VLeWpQK0tSWGJlZmliTDF4?=
 =?utf-8?B?SUJpMlVRZ25VTGVodVdtbHJGRGJZRHpBNWdmSXUwVWFMZGtOV3hTRE5hQzVP?=
 =?utf-8?B?ZzhJck5BVFpBdVUyM29wQVVDQUNJNVVOVHdoakVjSWVkQTgxeTZWVTFla3oy?=
 =?utf-8?B?ejlEbFlhdWpkQkxWVXZrNjJoeHd4YUJ2eHV2L1Q0R1J5K3RneVUvb2x2WjZt?=
 =?utf-8?B?bTFmZFY3bXFiaElrRGcvTVZJNEFsV0ZRMWEvTEU5dWR6cG1jR3k4QlB3WkFj?=
 =?utf-8?B?VzN0Tm9WQkFtMDBGQWI0dnYvckwrNmlCcEl3VGlFL2tDUU1UTUp5dlpyblpS?=
 =?utf-8?B?UmZkUEFaMEZzVWJHRyttNFAwMWlBcmZGNmZQdlhqKzlUVzI3b3dPTnJVZCtO?=
 =?utf-8?B?bkNuZzRCMG14Z3Z3RlNVdjAyR1FIbjhRTW0xdW5zUHJLTHZXZ2hWUTE0NVU2?=
 =?utf-8?B?UXQ0eXlkekZOMytIYkVSWThUK2RoQVlNQlZQK2E2S1R4djY0VEZ2UVNvZ25u?=
 =?utf-8?B?WFJEdUxRSENBTG1UQUVYajZ0WElIQ05TdmM4bVNVSzVJaVladEZTRElydFRy?=
 =?utf-8?B?MnZ5TjhTRVRNSXA3b3dVL3Q0MEpMcDl2T1ByN1E0Zk9scW03T3NkNk9xblRr?=
 =?utf-8?B?L21DaW1TdnF0RytiMm1Za0kyblhqMWE2VWl4S0toUmNEMmo0NEFLT21XN2M5?=
 =?utf-8?B?dDJMeE5za2ZlUHp4Unk5U2V2T2NtUHdPVVVubjdoVHJDUkJKa0xGaG5qdldk?=
 =?utf-8?B?NHBuOEp2KzBHNDJ6bHFKZ1pvS1htQnB6WXQvanZOWklsMmhkNlY2N3lsZE83?=
 =?utf-8?B?N3JpS2JwUFNnT09jNHJJamNKblhhYTBoa3l2a2V3eTlqbEVHN3Z4eituL0Js?=
 =?utf-8?B?UmFJOFZZYmxNRzFDRUd6TkxUYlR6WUxVdk43MGN4ZmVSTmNzaWFTMi9NWnBx?=
 =?utf-8?B?OXdhOWJaY3IrSm53cEZIdlMzdnJZN0d4OGZKM3ViL3BOYlIzVVFtOEQ3R3dE?=
 =?utf-8?Q?7zx+bt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2V5RlQwaWxwckhTTjNxMGxmVWZKY0Rtejl2d1VlVDBRVStMekhDTGJvU3gw?=
 =?utf-8?B?Q1g4dFNRU05JS0tDVmZIdDZIdXFEdmxPTU1yV2VYTERaYWpITUh1WnZINHlT?=
 =?utf-8?B?L2tNVEFncFAwd2VhV2RNZVFwaGkrcUpYT0xyU21kaU5ZZlJBUExWMWpwT0Nj?=
 =?utf-8?B?SUVJVmNOczJBUkRxNkN6R0psdjYxVENBL0NYZ0dHQ0gzODFuNlhaajg3N1ly?=
 =?utf-8?B?OWI5c0g4RFZtdUd5emQ0QXBpdGF1ekdnempVWEdEMGViZjF2VWhiVnFkTDEz?=
 =?utf-8?B?Z2hxRGlYaUNQbXRQd2dEclVvMzIwQ1BQQkliNEpzSVdRNnF4dzhqSkdmaVdm?=
 =?utf-8?B?bG13VGlIMUZWSEx5Mkd6V2d0Uit1MitBVzk3TUg5bEgxam5mNkRDSFFSTnJt?=
 =?utf-8?B?ODd2OTNucXRNamlRUWRrTG5WcDJPNlhKRzEyRWR0cVgyeUNRUXhkc2o3ejZE?=
 =?utf-8?B?NUNzcjhhV3BpdHNVdDF6NVY4MGN4Znp4MXV6TldYNFc1RXBwRHBRSm5aSHBy?=
 =?utf-8?B?eEtzRlFEQWg2aTJ6WVZiN2x2RFBtbm1sT2c3b3l3WDBVSldMSUYwWjB5WkJC?=
 =?utf-8?B?cDR3R1BRQ2xyMk1lMU9jcXVjeEtwYUl0aDJHc3ZmRWQ0dDhqTEsyekFpeXRm?=
 =?utf-8?B?R3ZwYnBQamFhRHdVaGRxeXpPRWVrM0dGd2Ywckxoc1dNOGsybFRGMkNncHFT?=
 =?utf-8?B?VE9leG5wTTM0UVJHYlVVQUlHcHpkeHhYbUxtb0NGenZ0U0kvbEJmQUVOV05M?=
 =?utf-8?B?c3c0eVRRTnZKMHNUWEJGckVlRmhXYnlQajh1Q2ZzSEZKbEtjNVdPSGFaZFhF?=
 =?utf-8?B?QThhdkxwZ3J0MlpySXdrNGsxNDJQVy9CeTFzWk56ZmlnV0ZWcmdwSHY2bkJ5?=
 =?utf-8?B?RStBcGp4dVZvRTQrT1hkYjBaUDFMdVNGOUVoN0VKd0YxZ0xoTHI0MjdYcTNv?=
 =?utf-8?B?U0xLdEkrR1pCQm5MRVRFaUxCNnFPUW1ZdlRQd3hsa2VHNDQ2WEpQZFlDUVN5?=
 =?utf-8?B?aHRiMWpPNlljYUVmTFVTRWp0MlJ2Y0VIblpLUFVyWS9HaG9LUnBuUkw2a1R4?=
 =?utf-8?B?YmR4cTNsbFZlbUxrZkZOYUlxZU9ycjJyV0E2UStpbGRxVWQydEtvNGtCQ1JH?=
 =?utf-8?B?VTF0aXF6dVRaOXdaQ09hVTN4d3RUcWFaeEpYdlRhOXhteDhYbEF6djNHT1ZD?=
 =?utf-8?B?VjNJTExPa1J2UEpMRWNOR0kxU3RGL2Q4Nk40Q2Z0d3NCL2JyRTNHRzhGOFRz?=
 =?utf-8?B?N2h6YVk3OVYwcFo1dlhES0NOWExYNDI3UHBqbjBaelB0bWpzY3RsTEozaWZJ?=
 =?utf-8?B?YXZ0Z2ZRQjFvS0g3a2xuK0dtNU5hTUVWWXdRSzh6cUdJcWpFakRVVThoVVlk?=
 =?utf-8?B?ZGZFbS9DMlhxMU51RkNnU1phMDhiMHZabmFrUVBXQjBZcmI2blk5Yk1WaTE4?=
 =?utf-8?B?d2NuTHpjNTdESGVyZWR2WS9tampSclpMQjFwZmxnMmgxQWV3b3pBR3RUM3Zi?=
 =?utf-8?B?QWU0WVkzbFVxeG9CRmR3ZXhOZkNFVWZaU3ptVWNUTjRjN1E0TnpxanlaNjJq?=
 =?utf-8?B?Nm1heWFtRDBYbDd2NHYxeWM3cjUvVnQrVGpFNncxZ3FQVmxDNW0xL2hDRk9U?=
 =?utf-8?B?ZE5mbXBGV2czVXFtQlA2TUFQR0JvdC83MEdtZjJWWjVzTjB3c2NDUkNzMjN5?=
 =?utf-8?B?bCtNRkIwVVYyMVZRL1o3UlhyanBrUUJFUnVNMmltVFB2YndWYUovbFFBejNz?=
 =?utf-8?B?VkRrZXBzQ0tUZmU2WERadzA5aCtzZkhNK2dRRVNyODVDYkxaYlRJYnpzbTZZ?=
 =?utf-8?B?aTR5VFc1L1daalppb0luYnpKSDhRWm9ob0pVYmJFK0pVYWR5TmxyMjRtQVFL?=
 =?utf-8?B?U3Eyai9DczBpenJzMGFFdjRCR0JGZmlZT2Q4cnhHMjJ0d3I2QlVJZ3lrUW9D?=
 =?utf-8?B?azRhdEZjNnBNZUJMcjd2U09nMlgxSmJnZkw0VC9lOUw1eTVudDJMY0JaWmM4?=
 =?utf-8?B?U29UdFI1RFYrczl4MkxScGNDa3RRNW5MQ0FoeVA3a2JEdE1VZUNtYk1ZcG5p?=
 =?utf-8?B?R2V0cVlrQWdZeVY5RDlxZzZkWjJ1MVZHSEFDOEE4SEQ1amFSSVFrb2w2U2J1?=
 =?utf-8?B?TTFaUkdIYmlxQ1pJUWxuaTRzNlR0OHh6a3FJS1FXdTl2ajZaNDduZWdNV2FW?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BFDCDB9865CE543B8E672CE47A12D07@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c72e949-e36a-4fde-a4aa-08de337635db
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 20:46:33.5740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f8KxvYk8CYLa6d7wiZiZSnK1IEHwIHrCXiF2wJ6S3pJqvjA4XdAv8kHhfZun4neYjQjLWW1EZZ8DU2RX5guA7zlerxMj71RCno41W9pyZ+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFZhbGlkYXRlIGNsb3NpbmcgdGhlIGZpbGUgaGFuZGxlIHdpdGhvdXQgZGVz
dHJveWluZyBleGVjIHF1ZXVlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdh
bmF0aGFwdXJhCj4gPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgoKUmV2aWV3
ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+IC0tLQo+
IMKgdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jIHwgMTUgKysrKysrKysrKysrKy0t
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gYi90ZXN0
cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBpbmRleCAzYmJjZjc5NzUuLmRmNjA4MzVk
NiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiArKysg
Yi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBAQCAtMjcsNiArMjcsNyBAQAo+
IMKgCj4gwqAjZGVmaW5lIFVTRVJQVFLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAoMHgxIDw8IDApCj4gwqAjZGVmaW5lIFBSSU9SSVRZwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgKDB4MSA8PCAxKQo+ICsjZGVmaW5lIENMT1NFX0ZEwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgKDB4MSA8PCAyKQo+IMKgCj4gwqAjZGVmaW5lIE1BWF9JTlNU
QU5DRSA5Cj4gwqAKPiBAQCAtMjMzLDYgKzIzNCw5IEBAIHRlc3RfbGVnYWN5X21vZGUoaW50IGZk
LCBzdHJ1Y3QKPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksIGludCBudW1fcGxh
Y2UKPiDCoMKgwqDCoMKgwqDCoMKgfSAqZGF0YTsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IGksIGI7
Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBpZiAoZmxhZ3MgJiBDTE9TRV9GRCkKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsKPiAr
Cj4gwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnQobl9leGVjX3F1ZXVlcyA8PSBNQVhfTl9FWEVD
X1FVRVVFUyk7Cj4gwqDCoMKgwqDCoMKgwqDCoHZtID0geGVfdm1fY3JlYXRlKGZkLCAwLCAwKTsK
PiDCoMKgwqDCoMKgwqDCoMKgYm9fc2l6ZSA9IHhlX2JiX3NpemUoZmQsIHNpemVvZigqZGF0YSkg
KiBuX2V4ZWNzKTsKPiBAQCAtMzIxLDcgKzMyNSw4IEBAIHRlc3RfbGVnYWN5X21vZGUoaW50IGZk
LCBzdHJ1Y3QKPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksIGludCBudW1fcGxh
Y2UKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgbl9leGVjX3F1ZXVlczsg
aSsrKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzeW5jb2JqX2Rlc3Ryb3ko
ZmQsIHN5bmNvYmpzW2ldKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZXhl
Y19xdWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVlc1tpXSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmICghKGZsYWdzICYgQ0xPU0VfRkQpKQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBl
eGVjX3F1ZXVlc1tpXSk7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKg
wqBpZiAoYm8pIHsKPiBAQCAtMzMyLDcgKzMzNywxMSBAQCB0ZXN0X2xlZ2FjeV9tb2RlKGludCBm
ZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLCBpbnQgbnVtX3Bs
YWNlCj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBzeW5jb2JqX2Rl
c3Ryb3koZmQsIGJpbmRfc3luY29iaik7Cj4gLcKgwqDCoMKgwqDCoMKgeGVfdm1fZGVzdHJveShm
ZCwgdm0pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIShmbGFncyAmIENMT1NFX0ZEKSkKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfdm1fZGVzdHJveShmZCwgdm0pOwo+ICvC
oMKgwqDCoMKgwqDCoGVsc2UKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2Ns
b3NlX2RyaXZlcihmZCk7Cj4gwqB9Cj4gwqAKPiDCoC8qKgo+IEBAIC0zNjUsNiArMzc0LDcgQEAg
dGVzdF9sZWdhY3lfbW9kZShpbnQgZmQsIHN0cnVjdAo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5z
dGFuY2UgKmVjaSwgaW50IG51bV9wbGFjZQo+IMKgICogQGJhc2ljOsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
YmFzaWMKPiDCoCAqIEB1c2VycHRyOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1c2VycHRyCj4gwqAgKiBAcHJpb3Jp
dHk6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBwcmlvcml0eQo+ICsgKiBAY2xvc2UtZmQ6wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbG9zZSBm
ZCB3aXRob3V0Cj4gZGVzdHJveWluZyBleGVjIHF1ZXVlcwo+IMKgICovCj4gwqBzdGF0aWMgdm9p
ZAo+IMKgdGVzdF9leGVjKGludCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFu
Y2UgKmVjaSwgaW50Cj4gbnVtX3BsYWNlbWVudCwKPiBAQCAtMzgzLDYgKzM5Myw3IEBAIGlndF9t
YWluCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJiYXNpYyIsIDAgfSwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInVzZXJwdHIiLCBVU0VSUFRSIH0sCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJwcmlvcml0eSIsIFBSSU9SSVRZIH0s
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgImNsb3NlLWZkIiwgQ0xPU0VfRkQg
fSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgTlVMTCB9LAo+IMKgwqDCoMKg
wqDCoMKgwqB9Owo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgZmQsIGd0LCBjbGFzczsKCg==

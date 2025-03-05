Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0723EC19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 16:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309E210E7F3;
	Wed,  5 Mar 2025 16:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oK63+jLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6D510E7E5;
 Wed,  5 Mar 2025 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741191173; x=1772727173;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rg1M1ZZI7eUqEtllmLevZ964VyVYlqj59F8q6c6l9qM=;
 b=oK63+jLm/9HS9OMOJGe+liQS8ZJGlwQBWtib7E5sBd/Q/3FRXPnxn9ES
 PPAHjaAhI8tXKB7xZs4U1UL5te6YT9ufPito9wWidjy8/IzDNB/m00PFi
 BNVlrupWgx4UHgXkXGbAKyNoBO6xWuSNrDL+3HiEhWvYa9peGFiyzT3E5
 MhTOTob0st5XZ0G60QUJymC8s/DUQuFaTFomkbJ97fZMkh1EdR9cTvT/y
 vfs5/1FvEYugyluDh+cWpI8pRcMPo+E2SGkluSHOs4ombbTTHzNcYNzau
 yofh/1brBycEPgCQHGXZMmkJ5cYLBKOA2gAp4QzqWuUwJPL+OMabUIfw4 w==;
X-CSE-ConnectionGUID: 12bDF06eToSi2hLTldoeMQ==
X-CSE-MsgGUID: s3NbW7ndQmuhZlf0F7Ct+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53559292"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="53559292"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:12:51 -0800
X-CSE-ConnectionGUID: DsrEwkspTm2DuBYiRorgLw==
X-CSE-MsgGUID: kz8Jhd1KSYy09S8dfEEIIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="119235349"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:12:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 08:12:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 08:12:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 08:12:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txhd3wxLCn1eqz4mLrb3WoXuJzatkK9Xytu6AKUrwZBweXp9LCOjM9eyBFkSSYrcFr9IAUiHSPidfC3EEw+QdQXwhHrqbmnPNFZWU6JIavbDGMvJslktMrjRBrgME2a5mkX13vCIBfU0I47BUrEnZdUcb59hlYUadL2wMPWbG6+61ZEE0+qHJrOnpsYzXVj1n333SiiMTdaJ2lnDitq/UgL1mvg1lN+qnGjGTJjiUiVIqC5lDxbIc01J6nvijIvo3DvD9AXdIDdkWR4yziAhXmTe+A/q/9aIJbSRQU3HeBYqQwHlzLLH15P0OYKEHXK2X+wGe7XUt+TnIoj05yyj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg1M1ZZI7eUqEtllmLevZ964VyVYlqj59F8q6c6l9qM=;
 b=Ccd1pHYKaztDy3HOSlpcMdStG30leNn87vXB39GLs8yZe9SozEnPd7OlnQpV+e6026t2Wk0ryP0Ijx0rqZqE+d9xk8glPZThh8Oq7Mq+ep9z+bJ/+b6qDslOl89DT38L0DE1J49XvEdQW0JoZqRcvfMEP/vzic9Ieqr1aydN4SGb6rK/qv8UDeVLsIrx2xl1DIqVU+aboe0as0kyBaRuiZXdWzD47dqGXDS6nWGx88LJJwtZXqLNDrV0d0vbA/OrK6mla2EBAshss++K6+qOJSKmVL7VKNbB+szUCsJFkFT9gUEoQFkINBYpmwJIFCxYqeFFr5dPlK4Dij9Stvdz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by LV8PR11MB8698.namprd11.prod.outlook.com (2603:10b6:408:205::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 16:12:46 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::2554:e827:dbde:714%6]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 16:12:46 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIEludGVncmF0ZSBr?=
 =?utf-8?Q?memleak_scans_in_igt=5Frunner_(rev5)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgSW50ZWdyYXRlIGttZW1s?=
 =?utf-8?Q?eak_scans_in_igt=5Frunner_(rev5)?=
Thread-Index: AQHbjaBMRWwsoOWetEGWOZVuursLBrNkKa0AgACNaOA=
Date: Wed, 5 Mar 2025 16:12:46 +0000
Message-ID: <PH8PR11MB6753C56FF3BC5BAD45796607F2CB2@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
 <174115973234.43.3968612023355278653@d1c082ef0712>
 <3a204d60-598f-4c2f-95f0-85dea8ef2e08@linux.intel.com>
In-Reply-To: <3a204d60-598f-4c2f-95f0-85dea8ef2e08@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|LV8PR11MB8698:EE_
x-ms-office365-filtering-correlation-id: 1ee59f81-ec21-4fb7-a29a-08dd5c009163
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?UUhjNnE1N1RvQXdqVGM4TFdNM2VqRng4dzE0MEdxYmlpdS8zdWNkNFJGMGIz?=
 =?utf-8?B?ekJYUmt5OVJnUUtManBpdE9xeUdhYVhtSkdDKzh2cjNhTGxJVFVYYnZnSmdP?=
 =?utf-8?B?SW9NcnlSM1d3OUxZeTNlNDhabnhEVGlsRUh5ZUZTZ2RpYTd1K3J4MkRIRHpS?=
 =?utf-8?B?ZUNSbms1MXdudnNzUkNwOVNmWTlERW56aVJHdkx5R3d4TzdGME1BRVg2R2cr?=
 =?utf-8?B?d2hMYmI3SzhNTTBwVEJPUlY4UnVTRGlPb1NvM2ZibzFkbEtIYXA4Z0dJWTFs?=
 =?utf-8?B?dTE3QTkvWHVYeTdaWE9sQU1VU1FBSHNTdDIvcWpkd2llL21aZm50VC9FUWhh?=
 =?utf-8?B?bVBmSDBBYWNwN2I2TDIxUEg5TktnV01jNTJPL1E5Nldid2pXdWdDZmhmb0xo?=
 =?utf-8?B?QlpHZTV4OVBRRmpiVDE4eEMxY1JCUDFDTnZOc25scTJETkh2QUJRNk03MHVv?=
 =?utf-8?B?K3FpZzdoY3Y0aytKWnIzOTFFYXpYVk5ETWRBajdJd1Urb0xrV043M1FIUVov?=
 =?utf-8?B?akY3Nnh4aFFpU3dPcW5icGh4TmJMSXg4WEhHTUdKSWpKSmJYb0lrR1lOb1RK?=
 =?utf-8?B?cWpQbThCb2swK3Q2WmFjbTRwN21zK0RDL1gvK0c5SlRieHZwMG9MSzNTRWVR?=
 =?utf-8?B?LzVNb0Y4eUhvSnBoanRDRkR4amc0cTBJZ0FJNThrYUF5KzNlWXJiVmF1dEJL?=
 =?utf-8?B?MkRTaHJBSzNhVzBiK2hvWUt3L0tzOG01WGp5cUR2MzU2WmZRdzBIaEdMUGdl?=
 =?utf-8?B?UnlYMmZHc0QyTmN3ajJzcWNXOHY0c2ZmZnEyd1ZkRDIwdzhqVWN4T3ZrVVNN?=
 =?utf-8?B?MmIzRGdaQTd4ZWUyWVBROGFuc0VkdVhkWmlLeFptSFhsaEFaRDJYUGc3Mk03?=
 =?utf-8?B?Wm4wUjBsQUYzS2pFK3kxTVROU0d4UFBGNzdWU2U2bDBKK1Mxa3dGTXFaaTFW?=
 =?utf-8?B?ZDBLaVFKWVdObCt5ZHRnVmxJYjIzTkNvcjN4VDNxSTBrUlptOHBBbmpRWXhx?=
 =?utf-8?B?SDVuTE5IS1l3K0JBejdhRjl3b0xxdnN4QXFmdGM0RHhBZ1UzNkV6TlpkRm5D?=
 =?utf-8?B?akY2bWxGZTNzMWRqVEpIQWxmRzJ3QlVGN3A4SkdkRUJ5andKcDg1UEg1QWZn?=
 =?utf-8?B?NkpwbGtlL1RhRWFJNUdBNEZBWDRqNWFZcEo0SjhVRDRkZGIvNFhTcWhXenk0?=
 =?utf-8?B?dUJ3V2d4VFZhUUNLd01JdllHN2xHWGFFVk1YMm9ZSFN4VFg4MFFHY1dtVTht?=
 =?utf-8?B?RnNya29hTVhmK2Qvb2JYYzlicHFTRnBzVytHKzM1N09ud2FrbklYR2ZHcWdN?=
 =?utf-8?B?NlVUUWwyNEJ2R05IeWZxblBWMVc5YTdZS3BUMG43NFJRZnpJWlBMSGI5dWxE?=
 =?utf-8?B?U2k0ZnBnME9iTEhyc292bmxPTk1lb1VDUE1HU05RS1B2bVpnMHNvTGo3c0tI?=
 =?utf-8?B?NHR5ck9VdlhOdHpqYmlLcmlQaldwU1ppODhrLzVoTFFib08yL05CZmljTkZ0?=
 =?utf-8?B?aG5oS0UrcmNLWnhLWjcwMXpycnF6RE5vMnZoTXNoWWc0NkxDd0dkbTZLLzVX?=
 =?utf-8?B?b0dDTEdJaUFHSUYyVThIUXZzUHZoYU40cE5zdk1HWVc4bFJBNmJuN1NNYjB0?=
 =?utf-8?B?MndLTDVSVUViNG5lMXo5SlJQTytXUmYxTWhmMzdhTHFzaTMzZnVVajNvaGdv?=
 =?utf-8?B?SUtSOHpXTTBJcUtIcTV0VFk1R1R4ZTJmV1R6QWlBdU50TGRhQ2NydTN1RDhC?=
 =?utf-8?B?OGd4bXZYRTdRaGx1N2lBNFJMK2tBUlkvZFJYZXpGNFhjVit5amxhdlRCclR3?=
 =?utf-8?B?cHBDNzJ0TFF1czVDRFdwaGpFTm5SRmsvOGdxbVJWYk55NTdlNzJYQVRTcnhW?=
 =?utf-8?B?b1JwUjRidlVhWHJHVDFhcWxUUVBFZnkxdnl2MjlwNmdFdlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MC9aSDRYQ1J2OWVwdXUySFpMRUc4V3ZhbzNXSjlzcnNuZGorM3FTZkxGR0ly?=
 =?utf-8?B?UW8ybUVmTXNRQVhPUlZmcUM0OW9RQ2FMcnNiZmx1cXVMV2R3dkNjWkJFRUdI?=
 =?utf-8?B?cnRFOTFVYzFYcTNwZmlUaC8wUjN6VjR0dHhYa2hHOUhLVldUUVV5TjRScVhl?=
 =?utf-8?B?S0NRajlZUDlCck0zTjY4RXV4MWdzYkt3bGgxM2NGaFNJVUJRZXF5T0o2VVcr?=
 =?utf-8?B?dEw2MExZeDdNdnpiQjlUMmxsWGtxdUFOZE1BZm5sRjkxTEFIM2pDOGxjVm9q?=
 =?utf-8?B?ZXJ2dWpvaTlaT3QrM3dBaWdzVXV3VmVyVkZzaVA4TmZsdFZLVE9uZmRRd0wv?=
 =?utf-8?B?aVJKV09VaUtxU1RkMGpMcVZ6aWxCNll6S3V0cllBVG1BMzh5VTJEdmhYMXlH?=
 =?utf-8?B?WGJoMk9XdlRyQWpiWUlVemNpR3lTY3dJZWU1cVk4b05HNklPY3hieFpWQmNU?=
 =?utf-8?B?WmlrbmlhVkVHeEtxeDlISFUxdFd3dnpCWi85YW9pb2FWU1RvSmVGM2FWcTNH?=
 =?utf-8?B?Y21NYUhxYyt2TkhlMkREMG5lU2dpcnRLaHlhaXJhdzdWRnFmS21vYmhvRWNv?=
 =?utf-8?B?eDZuSmRka2N2Z3pMOEFhSlVrTTRadG56OXBZMHlKajVQNVozT0JqLy9OUURu?=
 =?utf-8?B?RW9obVhpTGtLMjZOSjYxMU1MeVZzTmxpa3V1b1NFYlpFT0VzWTF6ZWdCY1Av?=
 =?utf-8?B?bWJtZFZFL0JiQTZPQ01aYXRxTWdjSit0dkVCQ0I4c1lvYzEvNk0zR2JWdjlm?=
 =?utf-8?B?Q1Q2U0d3ajhldWNDSk5EbXZ4THFNS3pCN3hIaGVudjRSZE5jZ2Nxc3hCaDR6?=
 =?utf-8?B?S1dPZXVxdXFhK1FNNW5yc1Q4RjNUYlYzR01nYjJyQkVBb29va2hYdFBKbklt?=
 =?utf-8?B?WWlXYmxyalRkaHBobEJ0QWtQZFpxQXEzaGF3K0pXZU54RXQzcWJzeE8zejVp?=
 =?utf-8?B?Qk41MDl1dW52OTBobDREUXVNT3BaYnFqR3NPK2ZWSExlcU5DVGRKOGpGT2xD?=
 =?utf-8?B?ZEFVS2lnQ3NGY2dFaFYzWlB3ZXpGdGwwY1J3eTlnSDJNU3A3dHFEaitZQUxC?=
 =?utf-8?B?eG5nb0lJdHUwb2JOcmI0MkIrTXNrQkhvYVNqSzJ6QzJiVENtTmcwSlY0V1Nk?=
 =?utf-8?B?cXA1RHY0eXp2aE8rMnBpN1R5RlU4VlhCaHFNRGlDajFXMm90U3ExSTJHdjRu?=
 =?utf-8?B?cGpVcGhrVm5pdlBNck5kTU5ON25CU28zUWw3NmhDWW5heGdOQVdTZEdPTTRJ?=
 =?utf-8?B?K1FVVTB5OHlOVW54VkFITDdKK1NTTDN5akxQbUhiVVRTMisxbVZQVlpTMWRh?=
 =?utf-8?B?MUxMQmU4Z1JrZUx1VWdlR2ZPM3Q1SW1KTFB4WkVDRzN2SG1UWjcwT1JLS3R5?=
 =?utf-8?B?NnFORHB5K2Z3TmFHc0RES3YwTjhMNnFIdkR2a1IwY05haEVmRUFlOFRBM2I2?=
 =?utf-8?B?Nko0dDgyRUhDVWFTYTAxSTQ0bnlEd0w3V0QvS0d5c2xhalZ1ZlpVT0M3QWpv?=
 =?utf-8?B?dllDeHMwREl5V3IrS21vV0g0dXg2RTlhYTlHbFhyaVNMS2ZiWkVJc04ybjVq?=
 =?utf-8?B?SUpIcDFsRXVxQllWMmFycG41Z0JDWU01QVE0K1hEUDd4Rm9MUXNFNVVQNEkv?=
 =?utf-8?B?dHdMM3BrOGhHQ1crakVEb0xuSFRzT3JZWGVvSFdsMnNxcXRQMTdLdk5hMTJT?=
 =?utf-8?B?Q3RaamlPdXhSVDJZbGN1TFhqWUttL3BQOTNkOG1wclRjR0orK0FUWHBQUnRO?=
 =?utf-8?B?RjdPUmRPamNiRHNHZW84VzlKMkNvYVJ4NjRvK0QybE00OHMrYmpXMTRZUFlM?=
 =?utf-8?B?ekE0QXB5cXBGdnFVYlV5THlwQitBLytNNlpDblppYXkxRzBKRzBndDRQSUND?=
 =?utf-8?B?d3h1RDdqMUVuK09NNzlkQkUwN1lMbC9yVi8rSE53RWxyUFZic20zeFUxTmlj?=
 =?utf-8?B?NFhYTHVWazNpOGliTk1PZ09VblRBU3BXY01KWGdjVzdlMmdDN0Y5M3cxSllG?=
 =?utf-8?B?WElJeGh2YXY0TjVWSXg2aXhiRjBJRWZGRGRWbFp0QzhHQzJIeThpR1RuWnh4?=
 =?utf-8?B?NWU4NTQrcERheHc4cERYbVFLWHU5TWgxNDVNRyttTk1aRWhaaWZCcUNKaUo2?=
 =?utf-8?B?c0pYa0E3SWFQMFNJS2R6T1NXZitYYkRRbUZoY25zT01RUnNNQ3p5aWZZNC9X?=
 =?utf-8?B?bFN2ZGRzajh4SVZmNHRpN2Jyc25ITU9qTy9RN2NDSlRPc3Z6QnhkU0c0Rmox?=
 =?utf-8?B?bWNBKzg5YTlDQmxveE1uaWYyYmJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee59f81-ec21-4fb7-a29a-08dd5c009163
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 16:12:46.5244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ZlE/+gqGHBwhgCSs1a8+xhwXvLTk0VbfgCOvZ4zrXmipqCTbQ1S7X71KkRTjGra9XVIZXAXJn7v5TA6lhcr8EKoaMY3rT1uoWJlBywv/NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8698
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQzOTk2LyAt
IFJlLXJlcG9ydGVkLg0KDQpYZS5DSS5GdWxsIC0gQWRkcmVzc2VkIGZhaWx1cmVzLCBYZSBjYW5u
b3QgYmUgcmUtcmVwb3J0ZWQuDQppOTE1LkNJLkZ1bGwgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtz
LA0KVGVqYXNyZWUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2kt
aW5mcmEgPGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBQZXRlciBTZW5uYSBUc2NodWRpbg0KU2VudDogV2VkbmVzZGF5LCBNYXJjaCA1LCAy
MDI1IDE6MTUgUE0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1jaS1p
bmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5GdWxs
OiBmYWlsdXJlIGZvciBJbnRlZ3JhdGUga21lbWxlYWsgc2NhbnMgaW4gaWd0X3J1bm5lciAocmV2
NSkNCg0KRGVhciBpOTE1LA0KDQpPbiAwNS4wMy4yMDI1IDA4OjI4LCBQYXRjaHdvcmsgd3JvdGU6
DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IEludGVncmF0ZSBrbWVtbGVh
ayBzY2FucyBpbiBpZ3RfcnVubmVyIChyZXY1KQ0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQzOTk2Lw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+
ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gQ0lfRFJNXzE2
MTk5X2Z1bGwgLT4gSUdUUFdfMTI2NzdfZnVsbCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+
IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWlu
ZyB3aXRoIElHVFBXXzEyNjc3X2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZp
ZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2Vz
IGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJ
R1RQV18xMjY3N19mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5m
cmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQg
dGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMg
aW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI2NzcvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBh
dGluZyBob3N0cyAoMTAgLT4gMTApDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiANCj4gICBObyBjaGFuZ2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCj4gDQo+IFBvc3NpYmxl
IG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUg
dW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzEy
Njc3X2Z1bGw6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxl
IHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAZ2VtX2V4ZWNfYmlnQHNpbmdsZToNCj4g
ICAgIC0gc2hhcmQtdGdsdTogICAgICAgICBOT1RSVU4gLT4gW0FCT1JUXVsxXQ0KPiAgICBbMV06
IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNjc3
L3NoYXJkLXRnbHUtMi9pZ3RADQo+IGdlbV9leGVjX2JpZ0BzaW5nbGUuaHRtbA0KDQpUaGlzIGlz
IHVucmVsYXRlZC4gUGxlYXNlIGZpeCBhbmQgcmUtcnVuLg0KDQpbLi4uXQ0KDQpUaGFuayB5b3Us
DQoNClBldGVyDQo=

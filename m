Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59516C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 06:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0331410E50A;
	Tue, 22 Apr 2025 06:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjlzZgPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D819C10E0C7
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 06:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745304395; x=1776840395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W7DDVpP6HqviMS5WPUZ49aSoi0Le3ka8RhF/Mp9SpYY=;
 b=AjlzZgPIoBdKAB6S6YdpMhLxmYWw5CIiYqphRdDxYTJTomVztsHMTYSD
 kVqtLnq/m8hgxjnGj/v5l6iEmQsMblKNv0azf4jujrm035aOL30QoKP9S
 AGZyNU3laFc3DHWvwy2AgU6z/wrX3l9aEgvgko+t1zE8JR2iyERkZQxss
 yB+AMzcmgTrtLNywlufIKqh/vpOu5yAkNhTU2oRJwFgtiskyg5NZIMS+C
 MOI29EBAZbpaKmy3VW91BDiVTMDpVVLvmydV4/V0Obieqkhcr9n2tMD96
 DRYz4YPwsG8hXy9F1yzcOq89zC0bczrYWn7F2Z7OWGF3ib5YunaT4j/hO Q==;
X-CSE-ConnectionGUID: uhnlHv7WTjm0mmdxIjE4Xw==
X-CSE-MsgGUID: CmNShsHmRl6jV8By/fekeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46736489"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46736489"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 23:46:34 -0700
X-CSE-ConnectionGUID: pwDkYL1jQ1+3S7csaH0Ogg==
X-CSE-MsgGUID: slvBW0pHQdaQMhps6rK4+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132805849"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 23:46:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 23:46:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 23:46:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 23:46:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqZ9/CiHgIS2I+8odC6KtG903dOo2kpkySarZUQi6BVV5c6nrn+KUe7VWQwg+Jenyh0oiAMNvv6+Es+DsOsgp6CRN2+lpq3vt4MCkrPKUr1vCkfYxO/pgQBvFkOYZzvmEl4DfbJRSWpE3nvmYu7xwHWxmGvz5H+cf1v2vatqOLphrFpudjEbMgO/owXoWWueH/qowJXpoxXV4XGl2wlFRlwdfhozbGqMjzeg3MoY9OC14GXkOO7hApAiP32g1U6OqufE7lv8pOcrxjtjjN45oQIx6463EgrHMWg7SAuVPOyFDY5TDL5nad/tYxL/jieE8VPLarEOuOxr5+vSLBxe2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7DDVpP6HqviMS5WPUZ49aSoi0Le3ka8RhF/Mp9SpYY=;
 b=kssHfE3YEeYLR86qFgKJ8tOSkcw/Si2WHC6cElLBHiZ2AEBeE0u+aZB4uxFhQd3VSfnNVVmvWBdPG59xFZJ7WXxEWcsU4Cq8d2y9AfGzggJFDb/lFVLXmqVZo/vHh0T1rWaBYC7HH2zJzaq/MZahrXPU7F9NTv9E/NRIRm+HwbVldmqfS9rtQ65zQ1AKY0BLUkuHMj6I4LDg9QJILnVTEIklOzmARt+at2AoPxliK0e41ebSfigFB5oKSTjnx7h77X7Uq+BhQLIXig995vrr16DtUxxq8bkpKQT6rxP8H5ZGCBSb9d7lHmIro3jzz8jteK/VlC9Rvy8JTD6zeZT6CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 06:45:48 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 06:45:48 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
Thread-Topic: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
Thread-Index: AQHbruHNSY+pEsb9A0eMYfPrHXaY6rOt4VjQgAFjeQCAAAEUAA==
Date: Tue, 22 Apr 2025 06:45:48 +0000
Message-ID: <SJ1PR11MB61299E8349C7C466FD6EF01BB9BB2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250416150348.2901159-1-santhosh.reddy.guddati@intel.com>
 <20250416150348.2901159-3-santhosh.reddy.guddati@intel.com>
 <SJ1PR11MB6129F2DC9DD92CB331437A98B9B82@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <643eaf00-5ff9-4587-82e7-2f6aa9372326@intel.com>
In-Reply-To: <643eaf00-5ff9-4587-82e7-2f6aa9372326@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA0PR11MB8397:EE_
x-ms-office365-filtering-correlation-id: f46cb127-2997-42f1-aa2f-08dd816950f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?eVgyTHZNSGpoMDBRb01ob3V4dUxyUjEyQnBsek90VENLc3ByOGJXK1VoeHdN?=
 =?utf-8?B?QXF3K0t6cGRzUFFVZ0Y1czVUSVFYckx6dWRjWXZMY01WNnVCdkFINTdOdWVB?=
 =?utf-8?B?VWR3SnBPaGhXeUxyWThxdkY5azUwenM5bHpmNjBXQlBYZU1ZY0lIY094VkJZ?=
 =?utf-8?B?OWxDeHR1UFJqcW9TeGxrTndpaFhwUW1YcmdHRGxLM0hQZGNLSktneEdmV3V0?=
 =?utf-8?B?ZGhUNFFOendIQWtadU5WYlBjOFV4NWpNbkJlVzMvQThKOVJVZVV1R0FkSjU4?=
 =?utf-8?B?ckJvTEZaWkhpbDAyYW1NdjRQelM5eUJXZHpJamNnMldkdUhHNWJwVGQ1QXZt?=
 =?utf-8?B?U0VhVzBqMXVxUEdYd3lEOWY3S1ZhbDQ5WTRPRlE1V2FKb3JBMzFrOG9Oamxv?=
 =?utf-8?B?K00rMmxFT2FKZlppS0RCaHd6elp6TFFqaWtxQWNtaVdJZUpUNXhuOFVGQzhv?=
 =?utf-8?B?U0ZuSW9aMENvYm9YK2hzU281RGVHZHJjYk5jVTh5bUprWUNSSlZtWVhBN1lK?=
 =?utf-8?B?WHp6N2t5Um1YWkFTbWVicCtYaXVMT1Rsb2tmM2ZhdlpJbzJXbVlZbklCdFNl?=
 =?utf-8?B?d3JSSTBFeWZMV1VLOHdZVHV6REJyODU0WVZKZytUSW5RK0tkQUhQOWRkRlBr?=
 =?utf-8?B?ZWxmMDZTQzdYTTB0MXZXWjZMUU9ySmRIRkp4cUkvMU81ZGpHa2JuSGNvaSs5?=
 =?utf-8?B?OSs5dTRhV09aQ2Fhdmh0eE8wamQ3b05aczZsSStMYS9EU1BCc1JVem44OXFt?=
 =?utf-8?B?MGlYcmpvNExxZUNZWCtHU04yZXhTVjRqYStZVDhPMzU3QmxacXVSdm5HM1pX?=
 =?utf-8?B?R2dPRVByZUpBYmdhdXRJQWw2OWx3UXBOU0tIenRjbVJuUEQ5TjR4K2Vyd1kv?=
 =?utf-8?B?YktIOU5kZWtXQVREVjd4dFpGVm9vMWhCS0hYcFcvaWh6TEMzekFmeld0aGZl?=
 =?utf-8?B?ZzFkVFNEb09aSXVuRHc4YWJicmYwVkd1Z0RmbkptUUJJUWxVZGpQZnFtbENH?=
 =?utf-8?B?L3JYSFlBbVVmL1hGUGhYVnpWZVdxL1AzV3hwbGxRaXNHVTNHenNpOURzRnNs?=
 =?utf-8?B?NTFyT1dTaXJrQjYxNE04V3pTSE9iWngzRnBpRStGcHp1MWJiUGFrZU5EeHFP?=
 =?utf-8?B?a2IxNzgveG1KanZFUmcwWkRBa010TGhJTGxPWHlScFd3QWM2dTBzMkJ4MXls?=
 =?utf-8?B?OHFxSDE3K3R2NjM1cWtkYWRPcU1US2hHYmxWQVlvV1N6Q2VOYXlISzFGNi9I?=
 =?utf-8?B?UE41S2FGUno0VGppejljb1RPOG11Y3NyTmxkNVhLRGxPYUljemptUmF6UWls?=
 =?utf-8?B?K1FpakVDaXZvSzBBSkgvbHpDdzJrMFpWOEIxT2hNdW5MM1J0aXZuRTJQeEFj?=
 =?utf-8?B?aE4zWitDWGpjQUFQMU9jbTNVYm5jTUxId2cyMWlidmRWcXBiRm82Mmg1dnNn?=
 =?utf-8?B?MEt0d0dmeVo0bzhNeXN6ek1OamFLM3JvMDFDVGpBaUlRZjRKR2lmS2ZVdVhj?=
 =?utf-8?B?Y1ZIQkR5ck1lamxJUVNBMEhtNml4Y0pzVS9rbGxwQzdpbUdyWjk5RWl2N2ph?=
 =?utf-8?B?OVNxTDdEb0k3L0l3eXQ3aExnTXpLZzNLSXlMTWp3TGdUdHU1RGk4NEJraDZs?=
 =?utf-8?B?WlBlYkQyb2xZUzFOWVRKdExmUy9LdlBwdXF4Snlxd21hKzVzVnE4VDdNdVJX?=
 =?utf-8?B?NFFVMlZFZzhjdTV0UnlKTWxaeGVKcDYxZEZIOHprQ1gvQzNMMjVwdWVrcnd6?=
 =?utf-8?B?MHhBVFMxODM3dXlHT0RhdElHMDFFa1JFMTNOOFR3TUtrWnlCV01vbUM4MGNx?=
 =?utf-8?B?SHducVA4ZDVDajRRNDNBbzBDc1JUTUlDVmtlUzVKQllZTFJNTE8xY0gxblpI?=
 =?utf-8?B?SE94Mmc0T3hvbXFVWlEwcm1WbzVFT0ZEa3RNQWJuUTBWU0tFSXhOS2dMZngw?=
 =?utf-8?Q?1RLotrdINKI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjVGVTEvcXlHdWJCbHdFS3VKY2VHSEhmZ3hTcFhWeW51bGQ3bi9jT3BxKzRU?=
 =?utf-8?B?MDIvbkF5NzduWWhHb3RodWk2ZmxIRDZUcC9ENGhwQk9qek9xbHZ4UkVVMHhS?=
 =?utf-8?B?TkJFZitsMzg0WDBXQkMrcFlDZk51cHVIOGJ2TTl0bEVhZERYcFRqNUFReC8y?=
 =?utf-8?B?cE52VG1CNnhvMTJFRzRUNE1oUWZsbEpucFJJN04yQ0tNbzFCdGdZL3l1SkN4?=
 =?utf-8?B?WVpqNEF3Z3JRWTZ6a1haTENwVE1yd3NhWGNIVnRRVXRvK25YN2VEdm80U3hW?=
 =?utf-8?B?anc0NzB2aHpnK3RRcWg4bjB1cWxSNTFhemlUZzFPZjlrRFNPQ2hKem91Q2ZZ?=
 =?utf-8?B?M2lwNnVwQ2FFc1FRTXlsd1lkMXYvaUdQT2QranVlZVdQMTRVTzZsR042cFlm?=
 =?utf-8?B?QmpnS0F0Q1piTHBnUXQwdUxjbUFSWHBKUWI4bGJsc3lEdnhGd2pHZE93UmVh?=
 =?utf-8?B?anFkbmFEazVxZGh6cDExaGZnSjJwWW9ESXcxUzNSRFFHMSs0UUZtZXAyL01u?=
 =?utf-8?B?b1lESjVkWS9MbGJ5a1VIV1dmUVh6c0RSTGd1YmhKUEI4YTh6R0lXMWFjWStK?=
 =?utf-8?B?eUdlMUM1cWhLVjlQWHRENStqZWdzdGxqT2xRMVlINWJoOEpOR01FOGlxZlJh?=
 =?utf-8?B?bCtGQ0JtZ2JnMVpXVTFUajBBQ0xFNnBCejFLQmhic0l6dUoybjRidXZ0OHVm?=
 =?utf-8?B?NnFoOUJsTTBPNUVuT3JQaDQ4UkQvYnBMai96Nk9wVWEzZW1QYnI5bWkzMHBZ?=
 =?utf-8?B?R0RHZ3RJWktjbDJGREhuTDJpek10VEowK2p6ZmhEenlJRFhlT0VDSmltUmZl?=
 =?utf-8?B?Ri9JaWFoSjJGTXJjY0Ntd1NnM0RNUzdLemJ3TXNRQ0NYUk5QM09DdXMxNFY2?=
 =?utf-8?B?SGltVEdWbHBqcWoyUXQ1Y1RNZ0dnbVNrNUNhT1AwVWw5aU44RTNaVHZJWldV?=
 =?utf-8?B?K1pmYXl6OUx1c1FiODNYa1lqajdjY1Z1Y2lwOHB5d3JXSmYrbkNtSG9qcWR2?=
 =?utf-8?B?SFVMaHE2cjgwVXFUYmcxUk1kdUZzcXhzVis4NFprN00rZzZUM20waEhKOXZL?=
 =?utf-8?B?N3RlVDVTSW5vU29UNWdzbjN0RlFzQXVBMEJGZDkvQmJIdXl5TENKaXA4djRI?=
 =?utf-8?B?ZTc0SkduMUhKeFBnMGtxSGhYT1RaTlQwS21Ud0Nid2g2MGNvS0hEWGdwcXFt?=
 =?utf-8?B?QnFwS0ZoaTFENUxBeEtSUkRjSVdPTjMwSHhKV1ZvWTlZeTJtc00xSjRneDZY?=
 =?utf-8?B?ODV0ckdTNnlheW9zbFhmSllSWWdmY3JyeVljL1JHbG1jTzlqM2RZM3BiYS9V?=
 =?utf-8?B?ck1yUVdwblp0c0doQjJhUEdJZnpjYXBpWHVzSnpqTHJkdlBiTUhLMHJET2o4?=
 =?utf-8?B?MXI5YzYrYzh5a3FXMmJVYXpjYm8rNk1QMWhhQk9JSHNra2hVTHZJM3p4QkFx?=
 =?utf-8?B?UjM0UkRBMmxBdU93QjA1UUk5dnRkaEVHZmcxRnpaL0VCeGUreHdON1B2bXNo?=
 =?utf-8?B?a1RXSGJNQzBFQlZ1alg2VjBDaUZ1NCt1SEp6WVEya212NW0yMGlVSUFNbUx2?=
 =?utf-8?B?MWxnSTJRZ2NoVitkVUxiMU9HYlZGbkhtU1B0dFFScHVnUTBxYlVHKzBSWXdl?=
 =?utf-8?B?U1AyWmZ5N0M0OHB0VVdQb0piTzJuL0dlMUg4RWVod3JjcSsydEorKzBVMFhI?=
 =?utf-8?B?cFN4UGdZcDQraEdrZlhMazh6N0VjcVVpZFRYeHA4KzVzOVFwajJiNVRGSWZ6?=
 =?utf-8?B?SUFFWm8zdWJFejdGVGdZdWxCYTVGY2VRT1d5dUg4TStPdkVhMkJxTWZ6RlZN?=
 =?utf-8?B?cElKNVQwM0dmWVZaZUg3ZGRlam4rbVQ4TFc4c3IvYnljSTJ1UUtPOS93WnZo?=
 =?utf-8?B?RzdoYXV1TE5TaUh0enZDY1k4MmZGNkxKdzJzZ0pWZ2JTTE1BWTVOYXlxK3cx?=
 =?utf-8?B?U205V2hEa0NRZXA5Q1RDYmtpMkpBN0tWQWRTVjE3emplUGgzb24wSGVtM0tV?=
 =?utf-8?B?ZGF1NHRkUUpqaFN5THAwZWhXK3JYN05kTWIxR2ZLU3p3MDRES2pBcTJDM0NO?=
 =?utf-8?B?WjQ4QlpQOHk3ZTVKQ2NIanZwMnVHS2RleEVTelpBWEZaeW9GaVo0UlRlMUVQ?=
 =?utf-8?B?YzE1WXhidS9ibkhlaUJ5VjJucXlseXRHSEJzcVVKSVVJcU0xWVBabjRjZ0Fy?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46cb127-2997-42f1-aa2f-08dd816950f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 06:45:48.5992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UkfmJFe7jlv/pV40NYf/tZsQiXnyJTADr5GlbOswqi+LaUbYTpPf7apSZe094gbiRONJ8UCggm5HxIChXjuFXPgxFDRQR3bHXLWfN6KvwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmVkZHkgR3VkZGF0aSwg
U2FudGhvc2ggPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBBcHJpbCAyMiwgMjAyNSAxMjowOSBQTQ0KPiBUbzogQm9yYWgsIENoYWl0YW55YSBLdW1h
ciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IGlndC0NCj4gZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogQiBTLCBLYXJ0aGlrIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+
OyBNdXJ0aHksIEFydW4gUg0KPiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggaS1nLXQgdjIgMi8yXSB0ZXN0cy9rbXNfYXN5bmNfZmxpcHM6IFVzZSB0aWxp
bmcgbW9kaWZpZXJzDQo+IA0KPiBIaSBDaGFpdGFueWEsDQo+IA0KPiBPbiAyMS0wNC0yMDI1IDE0
OjU3LCBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUmVkZHkgR3VkZGF0aSwgU2FudGhvc2gg
PHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXks
IEFwcmlsIDE2LCAyMDI1IDg6MzQgUE0NCj4gPj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4+IENjOiBCIFMsIEthcnRoaWsgPGthcnRoaWsuYi5zQGludGVsLmNvbT47IE11
cnRoeSwgQXJ1biBSDQo+ID4+IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT47IEJvcmFoLCBDaGFp
dGFueWEgS3VtYXINCj4gPj4gPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+OyBSZWRk
eSBHdWRkYXRpLCBTYW50aG9zaA0KPiA+PiA8c2FudGhvc2gucmVkZHkuZ3VkZGF0aUBpbnRlbC5j
b20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MiAyLzJdIHRlc3RzL2ttc19hc3luY19m
bGlwczogVXNlIHRpbGluZw0KPiA+PiBtb2RpZmllcnMNCj4gPj4NCj4gPj4gQXMgYXN5bmMgd2l0
aCBsaW5lYXIgbW9kaWZpZXJzIGlzIG5vdCBhIHByYWN0aWNhbCBhbmQgY29tbW9uIHVzZQ0KPiA+
PiBjYXNlLCBvdmVycmlkZSB0aGUgZGVmYXVsdCBtb2RpZmllciB3aXRoIHRpbGVkIGZvciBhbGwg
dGhlIGFzeW5jIGZsaXANCj4gPj4gc3VidGVzdHMNCj4gPj4NCj4gPj4gVjI6DQo+ID4+IG1vdmUg
aGFuZGxpbmcgdG8gZGVmYXVsdF9tb2RpZmllciAoS2FydGhpaykNCj4gPj4NCj4gPj4gU2lnbmVk
LW9mZi1ieTogU2FudGhvc2ggUmVkZHkgR3VkZGF0aQ0KPiA+PiA8c2FudGhvc2gucmVkZHkuZ3Vk
ZGF0aUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIHRlc3RzL2ttc19hc3luY19mbGlwcy5j
IHwgMyArKysNCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4+DQo+
ID4+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYyBiL3Rlc3RzL2ttc19hc3lu
Y19mbGlwcy5jIGluZGV4DQo+ID4+IGEzZGVmZTYwNC4uNTFhZmFlOGU5IDEwMDY0NA0KPiA+PiAt
LS0gYS90ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYw0KPiA+PiArKysgYi90ZXN0cy9rbXNfYXN5bmNf
ZmxpcHMuYw0KPiA+PiBAQCAtMTk0LDYgKzE5NCw5IEBAIHN0YXRpYyB2b2lkIHdhaXRfZmxpcF9l
dmVudChkYXRhX3QgKmRhdGEpICBzdGF0aWMNCj4gPj4gdWludDY0X3QgZGVmYXVsdF9tb2RpZmll
cihkYXRhX3QgKmRhdGEpICB7DQo+ID4+ICAgCWlmIChpZ3RfZGlzcGxheV9oYXNfZm9ybWF0X21v
ZCgmZGF0YS0+ZGlzcGxheSwNCj4gPj4gRFJNX0ZPUk1BVF9YUkdCODg4OCwNCj4gPj4gKwkJCQkg
ICAgICAgSTkxNV9GT1JNQVRfTU9EXzRfVElMRUQpKQ0KPiA+DQo+ID4gVGhpcyBpcyBzdGlsbCBj
aGVja2luZyBmb3Igc3luYyBmb3JtYXQgbW9kaWZpZXIgcGFpci4gV2UgcGVyaGFwcyBuZWVkIHRv
DQo+IGNoYW5nZSB0aGlzLg0KPiA+DQo+ID4gUmVnYXJkcw0KPiA+DQo+ID4gQ2hhaXRhbnlhDQo+
IA0KPiBZZXMsIHRoZSBjdXJyZW50IGNoYW5nZSBpcyB0byBpc29sYXRlIHRoZSB0aWxlZCB2cyBs
aW5lYXIgbW9kaWZpZXIgc3VidGVzdCAsIGFuZA0KPiBvbmNlIGJlbG93IElOX0ZPUk1BVFNfQVNZ
TkMgcGF0Y2ggaXMgbWVyZ2VkICx0aGlzIGNhbiBiZSBjaGFuZ2VkIGxhdGVyDQo+IHRvIHVzZSBh
c3luYyBmb3JtYXQgbW9kaWZpZXJzLg0KPiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy8xNDY4NTMvDQoNCkdvdCBpdCEgTGV0J3Mga2VlcCB0cmFjayBvZiB0aGlz
LiBJZiB0aGlzIHBhdGNoIGdldHMgbWVyZ2VkIGJlZm9yZSB0aGUgSU5fRk9STUFUX0FTWU5DIGNo
YW5nZXMsIHlvdSBjYW4NCnBlcmhhcHMgYWRkIHRoZSBjaGFuZ2UgImlndF9kaXNwbGF5X2hhc19h
c3luY19mb3JtYXRfbW9kIiBpbiB0aGF0IHNlcmllcy4NCg0KQnV0IGZvciBub3cuDQoNCg0KUmV2
aWV3ZWQtYnk6IENoYWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGlu
dGVsLmNvbT4NCg0KDQoNCj4gDQo+IFRoYW5rcywNCj4gU2FudGhvc2gNCj4gDQo+ID4NCj4gPj4g
KwkJcmV0dXJuIEk5MTVfRk9STUFUX01PRF80X1RJTEVEOw0KPiA+PiArCWVsc2UgaWYgKGlndF9k
aXNwbGF5X2hhc19mb3JtYXRfbW9kKCZkYXRhLT5kaXNwbGF5LA0KPiA+PiArRFJNX0ZPUk1BVF9Y
UkdCODg4OCwNCj4gPj4gICAJCQkJICAgICAgIEk5MTVfRk9STUFUX01PRF9YX1RJTEVEKSkNCj4g
Pj4gICAJCXJldHVybiBJOTE1X0ZPUk1BVF9NT0RfWF9USUxFRDsNCj4gPj4gICAJZWxzZQ0KPiA+
PiAtLQ0KPiA+PiAyLjM0LjENCj4gPg0KDQo=

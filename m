Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26EDEE4987
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 09:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874E110E991;
	Wed, 11 Sep 2024 09:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVLRrrED";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0106A10E991
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726048491; x=1757584491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0xvlAgDecqcbPERV4sV3SrR6ERYZ1DQhJmbvwCsL6Eo=;
 b=cVLRrrEDZOsX4wEHdTb9+Adxytc2MRJ35FlsPiu5WMzIT8QQMo5C9u4g
 mAnoK/ywLpsVuoo7HSoYcckR+9uCCGXJogQTctG662TCS6vWvybkX/HyA
 bEIfsQHl9ZjubYSXhJjHY8KKGO0PZh/RwrcE4YGs7Hym7Ebs7jq8+wvKK
 VB7WPvkrd6Ptuq6KI5LQcTwkqXMj96fLIah0sAdleRfO1d9g69iQFFR7P
 Vv5Nz1i9/+9LNSQsMguWhTwT8+Qysmk60QMkywTlm8zVVSmZbxMEMSS6k
 MPfEiohsdYQvhJHvK/3tiqbXVIrB8uZoAO5vIaxLWXsiY+7COyZS+UHYF A==;
X-CSE-ConnectionGUID: Dz3yhkvFST2XgylHp5Avpg==
X-CSE-MsgGUID: jZJr3SCtTg2DU5JPsfmutQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28614506"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="28614506"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 02:54:51 -0700
X-CSE-ConnectionGUID: U4PTbZVPSZGjv0Y0gPPfEw==
X-CSE-MsgGUID: cjr+rNfIQNGm+2ENyuFgjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67329302"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 02:54:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 02:54:50 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 02:54:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 02:54:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 02:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQF1e6MYfTHYULZ0jT7T9G94PBOlAdBX7/Z7MvDG1//zuMjz49SriivsaiyZSlzgntZrntXC887/O4XgLprNlxlWU9PLT0aPZiU1buEwQkqsrzEwB1VRU1MqxT9DqD/98dEnJX3ZnoDU5Om3KHZ3LDAIjJTCt6Ri+zS92xXQ7N+szRK/ikJM1FN9Vo/+tZLgvcT5aOcOpFRmzavJacbVjEfQ6kpGDmChrTaDCaddlepMH8Yvrfpj8GBof9iX55S+Yyo7jvthhB4feIvl8howoBGCZ5KZuUbjH6TJ2wsAO0ty2AJmsv5N738qNor5wlVeEVQCZHXAOo8duRjWeblSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xvlAgDecqcbPERV4sV3SrR6ERYZ1DQhJmbvwCsL6Eo=;
 b=A5HqF53DBoN6YjAn449qv2IpaRjzH4lFZqxqIJ5Zled49TY9RbT4t4nyCFn1QOCLK8OTxG55amMeNekOelV5aD/f0xA8pa+E9MyTVWWRB6bZeU6GC5ibc/aYPiDGfH457X4HAv7m2ThdPYCnbGpg11gBYQpACnDxMyqwZUFKv82KuP7xQYFMVGh25KMqi3fvcvwnmMVrDdqLCrnvbN63riGS8V8g7sFNO70LDLw4nMczjXU4H2O4L6u6c9HnvA2pnqKpMlnBvBOMPcr1neUMIegNpsfiHbLR+GdSfYWMJgDBTG43AFeNuw2fhYIcRhVrvOaGmDH5JGcWIh8WbhW1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by SA1PR11MB6943.namprd11.prod.outlook.com (2603:10b6:806:2bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 09:54:47 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 09:54:47 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t v2 4/5] test/intel/kms_pm_dc: Add
 psr_sink_error_check to PSR tests
Thread-Topic: [PATCH i-g-t v2 4/5] test/intel/kms_pm_dc: Add
 psr_sink_error_check to PSR tests
Thread-Index: AQHbBA6VEGwpuAOMvE6CH7zH34o5OLJSWPew
Date: Wed, 11 Sep 2024 09:54:47 +0000
Message-ID: <PH0PR11MB480602902BEBF03207F761A5E49B2@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240911054958.1023925-1-jouni.hogander@intel.com>
 <20240911054958.1023925-5-jouni.hogander@intel.com>
In-Reply-To: <20240911054958.1023925-5-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|SA1PR11MB6943:EE_
x-ms-office365-filtering-correlation-id: 33346780-d2a6-4111-9720-08dcd247c552
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YUZZL0tWRjJ5UGFvWDN0bW5EcmJ3M2QzTUxtWExOSHJEUks3VUo2ditKSDF6?=
 =?utf-8?B?WW53NXVLRzBjaFk5Uy9tczJxTFlCWDg4Yms0Qm9lUmg5REZqVk9DNHp1cEpy?=
 =?utf-8?B?UGxnMkoxY1VRdE8zVGEvaSt1RGRQdmMwMkdPTVFLYlljc2cyRkxlSjFrQzBC?=
 =?utf-8?B?TWdid2VlUWRXM3NrblVTTjBNTGtmeTg2UFdYeGhxeWhuU08zMTNtVDFOVXZq?=
 =?utf-8?B?dU52U3NIbzNTbG5ZVG5DYXAzOW5SaFlXNkE2NG9RcWJRWDVvR2prT2tLWHlr?=
 =?utf-8?B?ZmgzMDRLNWpRakdPT00rd3BCR29Ya2IzUWJ0WTFlOXptb2NQd3A3cjM2MzRD?=
 =?utf-8?B?SVltOTBQZ2RORytmRzkwRVYyRnYya0dOUjBNV1hxNzVvMWNpMmlsYXFjK1ZT?=
 =?utf-8?B?MDAycnFKdGdrV1JnWkFyTnNnR0R2QmlsSTdrUWM1bjEzUUtwRFgxL2FpV214?=
 =?utf-8?B?L0p2SmZyMG4yRUpyRHB0bXgxTFlLZmw1NEtZRGpOemVQNXJsckRRK2ZLZlhR?=
 =?utf-8?B?WVVmMkEwcUM4T3ZVZDI1eEhlYnBmclpTQnRYTThsTDVHYVJ2TE1qemptQnNk?=
 =?utf-8?B?ZTdaTXlrbTJOZ01BR2psYk9HM3RRL2JaUmxtdlJFZlRVZWJpQVZaYmJYNU1I?=
 =?utf-8?B?bzEyTGxUR0tlaDVyM2kwd09iczRNZldvbWQyRnAraU1XNzVyN0VTUDN3S2d2?=
 =?utf-8?B?aWVSd3Z1bTYrN2VGOUxUbGl4ckQxZ0V2aEptMDFFUG1CZW9vT0Q2OTJiRUFa?=
 =?utf-8?B?Vkt0NUdUWUNJYXVyeUJETGp2cnZ4RjBQK0FZVlIzSDEvWXFINXdMamN2TTUy?=
 =?utf-8?B?MjVtZmxSMXQzUzZrZjkvQk5QNVFjN3AySHBjVExNNmZzbGQ1VFl0STIyRStR?=
 =?utf-8?B?Ym04eWduQ2hUeTRVbnNLSlZCYTV4cGVlUGoxa2h2NkV6UTR2WGREellEak81?=
 =?utf-8?B?S1lwZ3RUR1ZiSUY4NE5Uczk1cXA4VnBDVXdObHZaR2x0dnBybzJkSm1uU2Fr?=
 =?utf-8?B?VUFYMVFpNTcxZVlkQldzcm80MVZpdzEvYUhoQU9UQ1hXT09Wb3pjSWxFZThZ?=
 =?utf-8?B?enc1Q0duMnVGVG9Pek12Z3NveHRYQTJaQWhqNGlBR3RBUmNmZ1ZzSVE0VzdX?=
 =?utf-8?B?V2hHa3Qyb0RhaHpkVzVxakNNVFliV0VPTDZ3NTI0anhCMXBPK091UVBhSXha?=
 =?utf-8?B?SmRXZWF2UVZLU2hJTmJuWnB0WFVZcStUY3lYcDJoZjh4MTRra2U4Wm8yZGE4?=
 =?utf-8?B?V1F0djNhY0huRkJXOHpXSmRCenJqc2VMQ2JaekNURmlYbWdGL3ZDdGNyY29S?=
 =?utf-8?B?bHY1Y3ZvL2I5aHNoaEpZS3d5TUVJRXd0aUpxaWF0dlB0a0QxZGtMZlA0YnpP?=
 =?utf-8?B?NG9TUmpGbkV2ZG94MkQ0VndEckl0N1JiUUVKRUJESUlKNjBvZ09yZFVIZXlP?=
 =?utf-8?B?bld6eVgxNlllWkRUaUFjRkJrZ2hRbmF2L0lMZ242Z1UvSnJ4bXdkTjdET3RC?=
 =?utf-8?B?c3JobGM4d1RPbWhsQ2NxdlVYRDhsa3J2Z0pndG5GcDFYMWpjK1dDOXRLTjRW?=
 =?utf-8?B?YUYzRkZaVmZmZVdrMGtIVWtjblZoTmxqMTdrMWlWL0RidjdHZ3JQY1RjVkdp?=
 =?utf-8?B?RWZqRHpiZkNOUk9LZUd1cWV3c0hVckxrQnlDcmNXZ3J1N0x4R3A0dW1yVjBB?=
 =?utf-8?B?NW85dVc5aEhpSDB2SmIwOUV1RmZzWlhSYlZqU2lKdHZyQUpOYzB6T2daWmNP?=
 =?utf-8?B?aTVlZjBuRy8yS1M4Z2l6VGtBdW4xaHozaW11UUs2MTJCRHBmUTJsRzVNME42?=
 =?utf-8?B?V2xLZVNVaDZqNjMzUUtzaC9CWk5aWjlHS2ozZ3NPeTM3cGc1L3FQV3hPelFE?=
 =?utf-8?B?VWJCc1pvM25zdTE5MUFGRzlsbEFXMzhIK255Z0g1WURFZEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnRmbVdMMENoS2p5MlpmY0czN2lMaUNtVnVOWVZKcWJneU5WZ3YvY0RMbjZC?=
 =?utf-8?B?MDFHTFhvMXdWN1owd1FMaE5lYy95MytWZXdpVkQvT0dFRGJkcnZWS3A1Y2Vm?=
 =?utf-8?B?VUgrS3hWMWl6ZnVUVWw1TUtlM3RnTmFjYkhoZmx6aElwTWpyMENveFQ3aGtR?=
 =?utf-8?B?M2NxamFFUGQyQWtpYnNZZmkwUEtUc243MW05NFVDZmxHRzZFaHBHc2wrSVFC?=
 =?utf-8?B?cURYY2huRldIbG9lSEdrSWRXTnR5QkJCeU5JUHM4cnJjUXJpcTJHVTJtYTJG?=
 =?utf-8?B?NE13V3doYThPQ00vMnpDb2t1QnBjRkpLZElnQ3NoVEY5WksyVW1BT3J5WnJP?=
 =?utf-8?B?NUxjMzE5NDhXa042YmY4MzFidlN4c3cvelBycTJjdXd5YjlHejRrWlFYWnVq?=
 =?utf-8?B?RUUySVhXUFJwaUJEVHhYZU9xYVo0OWZDaE4zYVBhaVZUb3NrNFZPUDA5Yzdu?=
 =?utf-8?B?NksxM2M0Q0QvM3NpOXhnMy83QjB5eW04cFcvczRnUkcrZkVhVFlBVStDSXNK?=
 =?utf-8?B?ZE1mWkp3R1c2TkRBbFF3MldvTHpHNXhhSkFHY0hqd0xrRnRHY29PTHQxM0VK?=
 =?utf-8?B?ZEYyZGQ4UXBnczExNFF0R3FYaEVKeHpLbFdWd2J2UElRejVpZkN6a1Y5M2Yr?=
 =?utf-8?B?VmNEOEd2QVJpdlZiTEV6YXJiRENPcTBWWENGY2h1a1p3MXlNeFk3a3Vpd3Mr?=
 =?utf-8?B?UnNEN0dySGNTMjlOaERUd2orMDBMVXNkRU42L21VYkJzYUZQczZTRkFzNEFE?=
 =?utf-8?B?bDN2THgxN0QrQzhMRSt5L20xdW05OFh5STEzd043bmZSUnM0dXBTc2JvNW5E?=
 =?utf-8?B?R3hiWGRyZVBsaHFnRmNvMjM3OFkrVE1qc2VvTU1lM0o3SnNySzRLbTJKWG5n?=
 =?utf-8?B?Smc3azkxcXYyd2dPcGp0VnpTc1B6b2h3SlE0RzVGM3NWRzRKaTRDV1VERW9h?=
 =?utf-8?B?VkNGQXNTVHBvYytZcTBXZ2UwRjIzNGFESTJvZDVYK3hsazJYVlFoZjRudUI0?=
 =?utf-8?B?NGhQOHJCSkdIV3NaRkZSTjNpZTdYVVY3RUdCMkFReEJuRS9sTmNISkhZcys5?=
 =?utf-8?B?WUk5L0hKdjhLK0NVS1hLSWE3ajVyMmRIM2w0a0d3QlFGcC9QaVorekpVclRK?=
 =?utf-8?B?OWlNSjB0SW9UMmxXU2FUZisrVldXRWNKZFYvZjM5NDAzd1Boc1RpMUpzTSsr?=
 =?utf-8?B?Q2FHTWt3QlVhQ2Rseko1bTdkanVFd3plQVdqbU1oYlJrZ0J6NjJXaDZOUnZ6?=
 =?utf-8?B?Q1lVSWloV2VPOEZCai81KzY5R3VGbzY3QUZHRkFrbW42WnRjZFAyZGVoZTAy?=
 =?utf-8?B?SVYyVWtuQS9XNWF5U1FBUm9ZTURScUorbUxiMlExNE9YYVVDc2d1a29rQUNW?=
 =?utf-8?B?azFCMDJiWkZLZks5VVV1SVVHa3VYN2F0bC84eUh6cFkxRlNFZExJS0l0Y2ZV?=
 =?utf-8?B?ZVhTRnVTWi9KeTNmUCtCM0QwZU1rUExEVmZqR3I0Znd3ZVZHR2RYL05xTjhB?=
 =?utf-8?B?ZWpFaUZvaTh1Zk5nOTVUdEtVYVM2QjlZRXV6Yi9ZL2U3T2hKalY5SDVFS3pS?=
 =?utf-8?B?SEo4OHlEUzg4anpxRnZDWkw1T2VTY1pEaloxYzd4dDg1OFhUeElnZUNoS3Rt?=
 =?utf-8?B?VXJKVmVoWk5DNGR2ZVlQbWg4R3RXaXJqR1NQQmQ1V2dzTCtwZjRSWEJYd25Q?=
 =?utf-8?B?SVJBOFRRazFzZGlSaTgvZDVPQ3pwMmZtOGFWSzdab21TV200YzYvNjNwLzQ0?=
 =?utf-8?B?U3loRFczSTJndTN3MEkvV2I1bm1rSmp4TXZYc1FJOU5XTjJmaE02b203YzND?=
 =?utf-8?B?a3dhcVJtOWJsemtqRklFcHdodmhhN0tQaXhTY2JSRXQydGxFWnFwWDgrbDhz?=
 =?utf-8?B?YVJhdFREZGNIeXYzM1VmQ1liS1ZyNHQ4ZUtiakUzbXE1aXV1UmRDYkltT1RX?=
 =?utf-8?B?NVpoNmtWYmtncTRiUmVxazhaY2crRFJqNDdsU1V0TzA5RWZSbTRWN1BzRFAw?=
 =?utf-8?B?dTRnZDgvbXpaeXMxbStWQ0FEMUxGei9YS3VIOUR5WGVSYVJkQ0lDNGxwZDN6?=
 =?utf-8?B?dlV6dnJ6L24xLy9veXNJR25mZmVFZXJqRHNCL1JRTTR0ZVZ1VG5mRkNHZ0NY?=
 =?utf-8?B?Zmg4RnFmd2ZLZmZBWk1Edytqejl3enlNSWVIVWpOMGYxM1h2QmFVZjM3TkRt?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33346780-d2a6-4111-9720-08dcd247c552
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 09:54:47.4661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0Kgjdy2+lV7xgkmb69FhMyu9loUxZcEmFKv0pyFgF+6EQb7lM96A3KHCjz9AkwGxl5aX9ImwJZzv4sJaRZfY1+JnktlA3LzZXg/9E3tK5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6943
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSm91bmkgSMO2Z2FuZGVy
DQpTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxMSwgMjAyNCAxMToyMCBBTQ0KVG86IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTmFsYWRhbGEsIFJhbWFuYWlkdSA8cmFtYW5h
aWR1Lm5hbGFkYWxhQGludGVsLmNvbT47IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIGktZy10IHYyIDQvNV0gdGVzdC9pbnRlbC9rbXNf
cG1fZGM6IEFkZCBwc3Jfc2lua19lcnJvcl9jaGVjayB0byBQU1IgdGVzdHMNCg0KQ3VycmVudGx5
IHdlIGFyZSBpZ25vcmluZyBwb3NzaWJsZSBlcnJvcnMgZGV0ZWN0ZWQgYnkgdGhlIHNpbmsgaW4g
b3VyIHRlc3RjYXNlcyB1c2luZyBQU1IuIEZpeCB0aGlzIGJ5IGFkZCBwc3Jfc2lua19lcnJvcl9j
aGVjayB0byBlYWNoIG9mIHRoZW0uDQoNClNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8
am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KDQpMR1RNOg0KUmV2aWV3ZWQtYnk6IE1vaGFtbWVk
IFRoYXNsZWVtIDxtb2hhbW1lZC50aGFzbGVlbUBpbnRlbC5jb20+DQotLS0NCiB0ZXN0cy9pbnRl
bC9rbXNfcG1fZGMuYyB8IDIgKysNCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoN
CmRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYyBiL3Rlc3RzL2ludGVsL2ttc19w
bV9kYy5jIGluZGV4IDA3YjE0MGNlNS4uYzg3ZTFkNDA4IDEwMDY0NA0KLS0tIGEvdGVzdHMvaW50
ZWwva21zX3BtX2RjLmMNCisrKyBiL3Rlc3RzL2ludGVsL2ttc19wbV9kYy5jDQpAQCAtNDA3LDYg
KzQwNyw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfZGNfc3RhdGVfcHNyKGRhdGFfdCAqZGF0YSwgaW50
IGRjX2ZsYWcpDQogCWlndF9yZXF1aXJlKCFwc3JfZGlzYWJsZWRfY2hlY2soZGF0YS0+ZGVidWdm
c19mZCkpOw0KIAlpZ3RfYXNzZXJ0KHBzcl93YWl0X2VudHJ5KGRhdGEtPmRlYnVnZnNfZmQsIGRh
dGEtPm9wX3Bzcl9tb2RlLCBOVUxMKSk7DQogCWNoZWNrX2RjX2NvdW50ZXIoZGF0YSwgZGNfZmxh
ZywgZGNfY291bnRlcl9iZWZvcmVfcHNyKTsNCisJcHNyX3NpbmtfZXJyb3JfY2hlY2soZGF0YS0+
ZGVidWdmc19mZCwgZGF0YS0+b3BfcHNyX21vZGUsIA0KK2RhdGEtPm91dHB1dCk7DQogCWNsZWFu
dXBfZGNfcHNyKGRhdGEpOw0KIH0NCiANCkBAIC02OTMsNiArNjk0LDcgQEAgc3RhdGljIHZvaWQg
dGVzdF9wa2djX3N0YXRlX3BzcihkYXRhX3QgKmRhdGEpDQogCWlndF93YWl0KChjdXJfdmFsdWUg
PSByZWFkX3BrZ2NfY291bnRlcihkYXRhLT5kZWJ1Z2ZzX3Jvb3RfZmQpKSA+IHByZXZfdmFsdWUs
DQogCQkgIHRpbWVvdXRfc2VjICogMTAwMCwgMTAwKTsNCiAJaWd0X2Fzc2VydF9mKGN1cl92YWx1
ZSA+IHByZXZfdmFsdWUsICJQS0dDMTAgaXMgbm90IGFjaGlldmVkLlxuIik7DQorCXBzcl9zaW5r
X2Vycm9yX2NoZWNrKGRhdGEtPmRlYnVnZnNfZmQsIGRhdGEtPm9wX3Bzcl9tb2RlLCANCitkYXRh
LT5vdXRwdXQpOw0KIAlwc3JfZHBtcyhkYXRhLCBEUk1fTU9ERV9EUE1TX09OKTsNCiAJY2xlYW51
cF9kY19wc3IoZGF0YSk7DQogfQ0KLS0NCjIuMzQuMQ0KDQo=

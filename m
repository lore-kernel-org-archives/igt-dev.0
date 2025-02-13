Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F40C021A0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 23:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6EE10E16F;
	Thu, 13 Feb 2025 23:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrR7+GTz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F02710E16F
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 23:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739489479; x=1771025479;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=BPaEuH+jjbD7n7O/MyfD3WGD4et48OkOv7z2qnTmWf8=;
 b=TrR7+GTzsj3UW2qhmH6KMDM979M3a5PVLE7WUzLLbhE8NXqFWOJ2bhot
 C0wAVJ6Rj2TZ672PCnR9dfEf29jqjSEieHSxKxVRULZhyB2mXqoDR2LVR
 yN+ldt6ZnDuuey6NdxtHat1ImjomURarkAm+hfYrVCH+C9GZOwQqp6ply
 gLTMZaZFKiY460UIuEZuxpHAg6tB/OZc4GcDxSEwIxX7KaqVL6GKfqPAy
 6Q2UVLG6rFDtaD0UvAC+WxsJxyjx3z6J+OPbDqfuqGsj3MNLCLVyzAZ8N
 H2tWkG/DZ1/q4PehhD8FXtsazgp/GqD7TjldVKRZSvXSQxuLIykfn14o7 A==;
X-CSE-ConnectionGUID: EM+DYjSMQFaqjk/Tc8po5g==
X-CSE-MsgGUID: 4EMrrKtJSzKFnDD9k0ZfSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40336635"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40336635"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 15:31:18 -0800
X-CSE-ConnectionGUID: eYhyLnUYTpiD6vXvsVQQLg==
X-CSE-MsgGUID: QHnLritJTXyfkIFf6BGo4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118225371"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 15:31:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 15:31:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 15:31:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 15:31:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMbbhlab6f+I61f/OqRRZuIpM9a61xUo0DF4ELYNEjiWZQ19PjVmBFX73WQ76NO1dPooF3SEp/+LzCDm0VHYQqPo/VDx3uWhsQYY1UQxrfybyTiIjU/Fv8eNMUF4p7EjktLf/8fKDYXFAF9A97tfGTUksrdlSvcFzBqdaVqrjR8VLIkUPzf5VguIXRdJnwPIdfjGaaKbl7OQP1lnn9+7ed9XaF3KH6vBiVZSb8CvWtncUDLdsl8hb+vmnWnh2xsIa2FZgLBYekMVPNYUfhKb/pJ2kZL0iyHLmPmDbUwTZjlReDJ0NhXxP4OtC1DnWU/T6Uh6UqCq+nOk5ki0VCmU9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPaEuH+jjbD7n7O/MyfD3WGD4et48OkOv7z2qnTmWf8=;
 b=l8fq+zNG9/tTLZy35sIgCQUyOwMP2cDubGQg0YeE3If8V0r3KjAlAmbPjPPGzrbtxRZjPY5laFvv9sQudhizMq/nRutIToJx7OWBgXCciLph8caL+LQ49EiKn0Rbx/RZKip0HA+ZtIrF9wA6hNYjgLzhdQQU2jLzAitM+MwaHvKJOVxhSutMh+N+QrUWPbVJbY6sUKyeeeCU1PWqg4rXVGD+Hv3lNLgjG0b/flOeWn6gfOSO8Bs6SSTc3/kIlkx/wDqBx24rBZ4ytbiz5IdF7UP9p9ahaMptMYXslVFr8nTOiz1Y3H3I5JKhrR3RXE4Kha9OpjM6WUXeQavjyBw/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.11; Thu, 13 Feb 2025 23:30:59 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 23:30:59 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v3 6/7] tests/intel/xe_pxp: Termination tests
Thread-Topic: [PATCH i-g-t v3 6/7] tests/intel/xe_pxp: Termination tests
Thread-Index: AQHbfa++DcOIRSdRlUqBcoQqqRLX4LNF40kA
Date: Thu, 13 Feb 2025 23:30:58 +0000
Message-ID: <4705946cc555615049c5af22fcdfe28c38d8f773.camel@intel.com>
References: <20250213003904.2059770-1-daniele.ceraolospurio@intel.com>
 <20250213003904.2059770-7-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250213003904.2059770-7-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4978:EE_
x-ms-office365-filtering-correlation-id: 853db77e-71b1-43ad-39e7-08dd4c8678b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VnVQUXU1K2FYZTdTOHVwNGM1ejlPZEdId1NPV1RhaU1pMno0ZnN4NUZuYnVP?=
 =?utf-8?B?Y3ZsUFFNRHBCRDZiL3BwTEZUVjJQTVRQbFdyZC8zaDhpZVltSmRQMXZhbXdQ?=
 =?utf-8?B?bWVrbnBtK2FaYkJnSG0ranN2VFVIczFHUWcvM1U5S1gzZlZNeGRCZm1nZ0V1?=
 =?utf-8?B?SWh2QTZZTVo3TEdKbE5JTHlhR2xKZWZxaXBnSW5zRHpSTWpvRGdFd2Z1YWhG?=
 =?utf-8?B?WElsaldqUkkrVWkzd3k2WGpOR2ltTmViWWxJVlJ0d3pwcFBSem1tbUZTcGZP?=
 =?utf-8?B?bi9JU3lRMXI0Vm5iS0dwRFpsV2dYSzFhRENjRmdIMVRWUU1CZmJIMDJLeXlt?=
 =?utf-8?B?VnB5d1RPQzdHd3FVUnA5N2hXYjczU0FGK0NTS0g1dUxsMXZKd2JWR0ovTm1k?=
 =?utf-8?B?WmVxM1ZqejVFQzAvaHRhUWJGem5OZWhHZWhUN1p1dHFpR3JKV3M3Z0N1Y0ha?=
 =?utf-8?B?M2pLRXNLTnNIN2s5enY5aXpmOTI2VFExMi9sS1VMTzlMZ25ndVpWRnVMY092?=
 =?utf-8?B?amtvdFI2c1ZOdExpbGlXTlM5SnNoZVdIV2E0VWwzZlIwWkdHc1F0aGJCSVd2?=
 =?utf-8?B?K052SWIzbDNNZENPenRkRjJ4eVhZeDdiaWx4YzVTNWJwQnZ4aXBBcmVDQ0Y3?=
 =?utf-8?B?elNwSGU1ZGZRSUhQR1JOUytPODFaSHBLd3p2eXoxSnlXTG1ZOG5FaGpYYTlQ?=
 =?utf-8?B?cTlwTDlCdW9OTnJoS1Q0aWNnUVNJczVIc2EzUXBkTUlCcHZ6OGczV0RTaXJq?=
 =?utf-8?B?YkIwS2tQdjNVN1dVRnQ4ZzRrQkNNeWc4U0tlV3VvcDBDZFVsTGh6b1FDbDJ4?=
 =?utf-8?B?Z1VxOXJDN1h2UEVuZ2kxenhkS2MzUVkyaU1waHNuZ0h6Vk9xYTlBbkhHeExy?=
 =?utf-8?B?QTN6QjM3YTlpZ2Rsay9jUEJTQ2lnSjZpLzZnRlp0cGphN29XT2dKZUJsUTRs?=
 =?utf-8?B?MHNiTFNrK08zUDA1Z2ZFUTdWcHJ4UzJhR1hnVzZib1QrQnJBZXg1KzNEOFlB?=
 =?utf-8?B?RzV2QW5KbCtuMjNoQlVlbjY5c05FOEhSenJHSWgxY2JRSXVReGVVb3E5OVoy?=
 =?utf-8?B?bDNHc09RVXkxelhMdTcwQkhEcnBDQnprbW1uUHdOR2w1ZTJhRGRxKytlWWpR?=
 =?utf-8?B?Njcwem11bUJobXF0VWFudFdvY3FkOWoxY05MdUFjVWRNeFJVdmV1YkxSTXk0?=
 =?utf-8?B?SWQ5WTZCSGNTelFURTNrQWxBSWIyZTVHR1k5YmRtblc4RmlGZDhrWDNIcS9G?=
 =?utf-8?B?dXluOUxTbkQ0WXhoSE9yS0p1Q09vejgzZ1ltaGhNTDN4RWZFUGU5L0ZTa3Ur?=
 =?utf-8?B?QTdtVkR6S2RVU3JhVDl2dVR5THZBUGVEeEl5cVZNblNWUVdyKzBXYlBsbjd0?=
 =?utf-8?B?RC9VRTJ0VUZ1R2ZxY2ZKbWE5MXJ1Vndja3N4bXFaMjNUZ1pqcW5LMUNPRDln?=
 =?utf-8?B?UTdEMVlPMGJ4NGZaaFdvSkR4cFVSY0EwaXhjZnU0QXRkUkVONitGNDZFdVF0?=
 =?utf-8?B?SUo1QktFRUV5WFNXckJVa0lUSzhpZXdyU0xhczVDcVU2VStmNzJQeDBVekJ1?=
 =?utf-8?B?ZkVEbDN1ektxc203Nm00elJYRk9lWWd0L3dyRm1OL2FDUUhuWmJEWXBTU2lp?=
 =?utf-8?B?QnZOa251NjNGT0JnWUQ4WnlsMGFWVkE4WW5LZU9HcGdUcDFRVUM5NDhVMTJo?=
 =?utf-8?B?OStXVUxWZG04d0hPVEwwVFpHWWpwT21wMzhoMkpKN0JxdGFyNEZXbjE2MFZP?=
 =?utf-8?B?bFJIVGtyaUZKa0NYUXNnNHpzVlB3YzVhMjgzZ3dCN252Ulk0THpWWWxhejFK?=
 =?utf-8?B?TW1GSUwrcHRZWllvTmRvOUxTUTBvZVhVS0RiL3lDdndneTZaVVEvRnBSbmJn?=
 =?utf-8?B?Vk50OWRlSnJoSys3ZWVxTjhMYjNMOElndWVoNnNLTHJSV05xaXpaamJFb0Fx?=
 =?utf-8?Q?HgLlqgPfWmNW1O1qnSaYMTfG4JXU6ZZ1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW9qNWtaZ011c0h6OVJPMSt4ZlJ1dW5IbGZxVXlhZlNDZ2lWc1lZUlVHZEx2?=
 =?utf-8?B?OGVCeCtndzNRN2JZcjYvSS9XK3pENXFBTTNRSlQ0V0MwYmc0M2lNN2sxdUhR?=
 =?utf-8?B?OEJINXVSK2N5aTIraEtzRVlQTG0zT3ZjTHpiSFJaOS9VTFlldVRlRkxLRWNH?=
 =?utf-8?B?MjlzNmxnWExYUm11cFpjNmpYcWl5UWFYV2NFcFZYdkk1QktLYkcrOEhXWWJ1?=
 =?utf-8?B?QmpLSmo4dkhUY0h5QjRYSlRkU2h4SXZRSU8yUjc5L2lzUUFYenh6TVF4ZjFk?=
 =?utf-8?B?WkFhVWl4b2JCemoxZlYzK2J2SWNYRHBXZ3A2dlUxbUZMenVWMWppWTQ1cWZH?=
 =?utf-8?B?bUlzM0phRmNVVVo0Rk54emRWVm14NGZmd1dmYXljaEFTNEh3MEh4QW9rNThK?=
 =?utf-8?B?bXdtZmVMSERMcEl4N0xyV29hU1F4QlowdW1WWlZIM0EzamhxRmkzNm14YWRE?=
 =?utf-8?B?cDU0cllhYUdWMUN4UDA2SDdoWWZQOVIrUXBxUHBER2tiQlZwQWVmQmZhVHFL?=
 =?utf-8?B?QTdkZzZOdndNU3dsT1l3MjFmN3BkSG5LR1Rhb0VJaW92NEJHYkhqUEJOcGRn?=
 =?utf-8?B?TForb21McGtjd2dLN1VnU204d0UxU2t1R1NQSnVUM0t2MC9FeDJqQ3VPbTdh?=
 =?utf-8?B?ZkpQNzA3SUxzR2liT3JLM0VoVjJHYlcrM0FyT1R1RTFkZEo3RXlmL1V0Y2V0?=
 =?utf-8?B?V3VIbG9mR1ZmZjBMSks2SzhKOFBLU1Q5U2pEMGxlU1NDVWZqNlFRRTRhZ3Va?=
 =?utf-8?B?eXpTcERXN0Zvdys5NTEvYVkwckZUb3JPaDYrNm9DbllsaHY5dGJvUkFtZ2x4?=
 =?utf-8?B?NW0vTWYvMG43eXd2NCsrVy8yQW9BanpQZldFMlJnd2JwNzBiREhYd3RNVTZs?=
 =?utf-8?B?RjdtUUI1bmJ6WVFJWkg3MzlTbnVhbWFuZXBSeURZUVdrM2x4ZjVKdkY5cVFF?=
 =?utf-8?B?Sy9uZUp3bm8rL2hVN3UwVEpvZkllLzdGc2F3aGVoMC9sY0ZvSGttQkZmWXV6?=
 =?utf-8?B?R1Q5YzdhSHQ3ZDVETWVNMnJOOGpKNXpaTUdzN21KYUVaazQ5RmRCd3Rld2FK?=
 =?utf-8?B?YzBSUUFZdWhqeW1qNTdpV3kwVFdScUFvQVRJNGNscEJ5eTdIeUFuWXR6L3ox?=
 =?utf-8?B?aHA4VXp3RjU5OUd2N213NkxPbFVTV29DRE1UMk01cE1Gb0JKOUtoUGM5YllZ?=
 =?utf-8?B?SHpVKzlES3d1bHZiVTVaOW5uK25hZ0dnd1JydEx1TCswNHA5b0xwQ2ZxVWYz?=
 =?utf-8?B?YTByUHUxdVUxdk5VM05IcUdoVnkzL3pyRHNrL25FM1NYL3NCMDR1UXpFbW9y?=
 =?utf-8?B?WHVoZktpOGVkWGNpVkhGQnZTaWd2eXdFenR1bVpLWDdjaldtbGZWazFPRkRX?=
 =?utf-8?B?Ykt1ckFZVkI1NUhIYkwwWm1lSmJmUFNadktuS2o1S3oyZUN2My8xZFI1TTVp?=
 =?utf-8?B?d0ZXZW5rc0V1TVNMR2Y0SitBNG5QbFZMTjVNSHFhQlNEcUhRQ0VsVFhoaEh1?=
 =?utf-8?B?U091WVdmOXMwYkJVUWljck5Id2ZFZ3BXcXkyM2ZFNS91Um01K1E4elh6eXBa?=
 =?utf-8?B?UFMzRWtvTkFONUE5UjdkeE91azR0bHo2Q3F3TGY5QkNpcFBiQy95M1MrRHVw?=
 =?utf-8?B?WDFJK0pwNVFTZ2FKb3F6MnRnVHhhRHg3clk4a0tXUkd6QjhiMDN3MmRwT2x1?=
 =?utf-8?B?TnRhUVBoZnB1NmRYR3V4M01WM1JGQ0pUNEp5dG80VzlGZVVlYkU4OHhIdTlE?=
 =?utf-8?B?VFdoSkE0bUpWMklJSXlESVZJdHhnQ3NLcW5jNlc1K0JQeTIzNWlhY3hsYllJ?=
 =?utf-8?B?cEJjRFJITXp2R0RDRGUzMDVWQWxuL1RCZGl1bXIyWkxwVEFOTjhwazVPQkR1?=
 =?utf-8?B?U1UwWjczL3IrQllYbkpMeU50c0l4MXUvOFhvVVZpT0RkQmRlYi9NMVhHU3pY?=
 =?utf-8?B?bjhyNW53Z0tCeWdSTE9VNmRnamRkdjgzNHNLblZSaHFaVnU4Zms3V0JnTjMv?=
 =?utf-8?B?WlNkVnVNSzhoVmk2TEQ4SHlTbnh6YjFibDhJa0lGVzBpb1lCYlEzM0lIWUFk?=
 =?utf-8?B?UGxXL1N6YVB2bjFablZBd21OSUE0Z0xJWW9KZmxHazRZSTY4cG1aRmFyTmRX?=
 =?utf-8?B?WS9hZFdQTitybWNFWi9EV0xqV1IvVUM0S240SkRwM2wvNHdlTGVTSCsyakpL?=
 =?utf-8?Q?/f+NUOBh/QH+7w8TVVcsTxo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6872DE4FEBB1F246BCC02CEF3ECFEADE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853db77e-71b1-43ad-39e7-08dd4c8678b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 23:30:59.0000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrrjf0f2VD+t3hu7pzaKjzMd9sHeVIMz9yo/JnMVVXxanHMeYUk3mAJwZOF2vmtrBVvoTlAUfZ3eJhpySo3zANA/zsGbrj0ynB+H2+4qjdQJNEXlFag8wYqwGsu43d/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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

VGhhbmtzIGZvciB0aGUgdHdlYWtzIC8gcmVmYWN0b3JzIGZyb20gbGFzdCByZXZpZXcgLSBhbGwg
bG9va3MgZ29vZCBub3c6CgpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRl
cmVzLmFsZXhpc0BpbnRlbC5jb20+CgoKT24gV2VkLCAyMDI1LTAyLTEyIGF0IDE2OjM5IC0wODAw
LCBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSB3cm90ZToKPiBUaGVyZSBhcmUgc2V2ZXJhbCBldmVu
dHMgdGhhdCBjYW4gY2F1c2UgdGhlIFBYUCBrZXkgdG8gYmUgaW52YWxpZGF0ZWQKPiBhbmQgdHJp
Z2dlciBhIFBYUCB0ZXJtaW5hdGlvbiAoc3VzcGVuZCwgUFhQIHRlcm1pbmF0aW9uIGlycSkuIEFm
dGVyIGEKPiB0ZXJtaW5hdGlvbiwgd2UgZXhwZWN0IHRoZSBrZXkgdG8gYmUgZGlmZmVyZW50IGFu
ZCB0aGUgcmF3IGVuY3J5cHRlZAo+IGRhdGEgdG8gY2hhbmdlIGZvciB0aGUgc2FtZSBzb3VyY2Ug
ZGF0YS4KPiBBZGRpdGlvbmFsbHksIGFsbCBQWFAgb2JqZWN0cyBhcmUgaW52YWxpZGF0ZWQgZHVy
aW5nIGEgdGVybWluYXRpb24gYW5kCj4gY2FuIG5vIGxvbmdlciBiZSB1c2VkIGluIHN1Ym1pc3Np
b24gb3Iga2VwdCBtYXBwZWQgdG8gVk1zOyB3ZSB0aGVyZWZvcmUKPiBuZWVkIHRvIHRlc3QgYm90
aCB0aGUgZXhlY3V0aW9uIGFuZCBiaW5kIGlvY3RscyB0byBtYWtlIHN1cmUgdGhleSB3b3JrCj4g
YXMgZXhwZWN0ZWQgYWZ0ZXIgYSB0ZXJtaW5hdGlvbi4KPiAKPiB2MjogbW92ZSBpZ3RfcmVxdWly
ZSBjYWxscyBpbnNpZGUgdGhlIHN1YnRlc3QKPiB2MzogYmxvY2sgcnBtIGZvciB0ZXN0cyB0cnlp
bmcgYSBkaWZmZXJlbnQgdHlwZSBvZiB0ZXJtaW5hdGlvbiwgcmV3b3JrCj4gaW52YWxpZCBiaW5k
IHRlc3QgdG8gdHJ5IGEgbmV3IHZtIGFzIHdlbGwgKEFsYW4pCj4gCj4gU2lnbmVkLW9mZi1ieTog
RGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4K
PiBDYzogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+Cj4g
CmFsYW46c25pcAoKPiArc3RhdGljIHZvaWQgcHhwX3ZtX2JpbmRfc3luYyhpbnQgZmQsIHVpbnQz
Ml90IHZtLCB1aW50MzJfdCBibywgdWludDY0X3QgYWRkciwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQ2NF90IHNpemUsIHVpbnQz
Ml90IG9wKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV94ZV9zeW5jIHN5bmMgPSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC50eXBlID0gRFJNX1hFX1NZTkNfVFlQ
RV9TWU5DT0JKLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuZmxhZ3MgPSBEUk1f
WEVfU1lOQ19GTEFHX1NJR05BTCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmhh
bmRsZSA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKSwKPiArwqDCoMKgwqDCoMKgwqB9Owo+ICsKPiAr
wqDCoMKgwqDCoMKgwqBfX3hlX3ZtX2JpbmRfYXNzZXJ0KGZkLCB2bSwgMCwgYm8sIDAsIGFkZHIs
IHNpemUsIG9wLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIERSTV9YRV9WTV9CSU5EX0ZMQUdfQ0hFQ0tfUFhQLCAmc3luYywgMSwgMCwgMCk7
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3luYy5o
YW5kbGUsIDEsIElOVDY0X01BWCwgMCwgTlVMTCkpOwo+ICvCoMKgwqDCoMKgwqDCoHN5bmNvYmpf
ZGVzdHJveShmZCwgc3luYy5oYW5kbGUpOwo+ICt9Cj4gKwo+ICsvKioKPiArICogU1VCVEVTVDog
cHhwLXN0YWxlLWJvLWJpbmQtcG9zdC10ZXJtaW5hdGlvbi1pcnEKPiArICogRGVzY3JpcHRpb246
IHZlcmlmeSB0aGF0IFZNIGJpbmQgb24gYSBzdGFsZSBCTyAoZHVlIHRvIGEgdGVybWluYXRpb24g
aXJxKSBpcyByZWplY3RlZC4KPiArICovCj4gKwo+ICsvKioKPiArICogU1VCVEVTVDogcHhwLXN0
YWxlLWJvLWJpbmQtcG9zdC1zdXNwZW5kCj4gKyAqIERlc2NyaXB0aW9uOiB2ZXJpZnkgdGhhdCBW
TSBiaW5kIG9uIGEgc3RhbGUgQk8gKGR1ZSB0byBhIHN1c3BlbmQvcmVzdW1lIGN5Y2xlKQo+ICsg
KsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlzIHJlamVjdGVkLgo+ICsgKi8KPiArCj4gKy8q
Kgo+ICsgKiBTVUJURVNUOiBweHAtc3RhbGUtYm8tYmluZC1wb3N0LXJwbQo+ICsgKiBEZXNjcmlw
dGlvbjogdmVyaWZ5IHRoYXQgVk0gYmluZCBvbiBhIHN0YWxlIEJPIChkdWUgdG8gYSBydW50aW1l
IHN1c3BlbmQvcmVzdW1lCj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3ljbGUpIGlz
IHJlamVjdGVkLgo+ICsgKi8KPiArCj4gK3N0YXRpYyB2b2lkIF9fdGVzdF9weHBfc3RhbGVfYm9f
YmluZChpbnQgZmQsIGVudW0gdGVybWluYXRpb25fdHlwZSB0eXBlLCBib29sIHB4cCkKPiArewo+
ICvCoMKgwqDCoMKgwqDCoHVpbnQzMl90IHZtLCBxOwo+ICvCoMKgwqDCoMKgwqDCoHVpbnQzMl90
IGJvOwo+ICvCoMKgwqDCoMKgwqDCoHVpbnQzMl90IGZsYWdzID0gcHhwID8gRFJNX1hFX1ZNX0JJ
TkRfRkxBR19DSEVDS19QWFAgOiAwOwo+ICvCoMKgwqDCoMKgwqDCoGludCByZXQ7Cj4gKwo+ICvC
oMKgwqDCoMKgwqDCoHZtID0geGVfdm1fY3JlYXRlKGZkLCAwLCAwKTsKPiArwqDCoMKgwqDCoMKg
wqBxID0gY3JlYXRlX3B4cF9yY3NfcXVldWUoZmQsIHZtKTsgLyogc3RhcnQgUFhQIHNlc3Npb24g
Ki8KPiArCj4gK8KgwqDCoMKgwqDCoMKgYm8gPSBweHBfYm9fY3JlYXRlKGZkLCAwLCA0MDk2LCBE
Uk1fWEVfUFhQX1RZUEVfSFdEUk0pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBtYXAgdGhlIEJP
IHRvIHRoZSBWTSB0byBtYWtlIHN1cmUgaXQgd29ya3MgKi8KPiArwqDCoMKgwqDCoMKgwqBweHBf
dm1fYmluZF9zeW5jKGZkLCB2bSwgYm8sIDAsIDQwOTYsIERSTV9YRV9WTV9CSU5EX09QX01BUCk7
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgcSk7Cj4gK8Kg
wqDCoMKgwqDCoMKgdHJpZ2dlcl90ZXJtaW5hdGlvbihmZCwgdHlwZSk7Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoC8qIG1hcCBvZiBhIHN0YWxlIFBYUCBCTyBtdXN0IGZhaWwgaWYgKGFuZCBvbmx5IGlm
KSB0aGUgQ0hFQ0tfUFhQIGZsYWcgaXMgc2V0ICovCj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gX194
ZV92bV9iaW5kKGZkLCB2bSwgMCwgYm8sIDAsIDAsIDQwOTYsIERSTV9YRV9WTV9CSU5EX09QX01B
UCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZmxhZ3MsIE5VTEwsIDAsIDAsIERFRkFVTFRfUEFUX0lOREVYLCAwKTsKPiArwqDCoMKgwqDCoMKg
wqBpZ3RfYXNzZXJ0X2VxKHJldCwgcHhwID8gLUVOT0VYRUMgOiAwKTsKPiArCj4gK8KgwqDCoMKg
wqDCoMKgLyogdW5tYXAgbXVzdCBhbHdheXMgd29yayAqLwo+ICvCoMKgwqDCoMKgwqDCoHB4cF92
bV9iaW5kX3N5bmMoZmQsIHZtLCBibywgMCwgMCwgRFJNX1hFX1ZNX0JJTkRfT1BfVU5NQVBfQUxM
KTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgeGVfdm1fZGVzdHJveShmZCwgdm0pOwo+IAphbGFuOiBU
aGUgcmV3b3JrIGluIHRoaXMgZnVuY3Rpb24gbWVhbnMgd2UgYXJlIG1vcmUgdGFyZ2V0dGVkIG9u
CmFkZHJlc3NpbmcgdGhlIGRpZmZlcmVudCBhc3BlY3RzIG9mIHRoZSBleHBlY3RlZCBVQVBJIGJl
aGF2aW9ycy4KTmljZSEgLSB0aGFua3MuCj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qIG1hcHBpbmcg
b24gYSBicmFuZCBuZXcgdm0gc2hvdWxkIGhhdmUgdGhlIHNhbWUgYmVoYXZpb3IgKi8KPiArwqDC
oMKgwqDCoMKgwqB2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKg
cmV0ID0gX194ZV92bV9iaW5kKGZkLCB2bSwgMCwgYm8sIDAsIDAsIDQwOTYsIERSTV9YRV9WTV9C
SU5EX09QX01BUCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZmxhZ3MsIE5VTEwsIDAsIDAsIERFRkFVTFRfUEFUX0lOREVYLCAwKTsKPiArwqDC
oMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2VxKHJldCwgcHhwID8gLUVOT0VYRUMgOiAwKTsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgZ2VtX2Nsb3NlKGZkLCBibyk7Cj4gK8KgwqDCoMKgwqDCoMKgeGVfdm1f
ZGVzdHJveShmZCwgdm0pOwo+ICt9Cj4gKwo+IAphbGFuOnNuaXAKPiDCoAo+ICtzdGF0aWMgdm9p
ZCB0ZXJtaW5hdGlvbl90ZXN0cyhpbnQgZmQsIGJvb2wgcHhwX3N1cHBvcnRlZCwgdWludDMyX3Qg
ZGV2aWQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGVudW0gdGVybWluYXRpb25fdHlwZSB0eXBlLCBjb25zdCBjaGFyICp0YWcpCj4g
K3sKPiArwqDCoMKgwqDCoMKgwqBpbnQgZndfaGFuZGxlOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBp
ZiAodHlwZSAhPSBQWFBfVEVSTUlOQVRJT05fUlBNKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC8qIGF2b2lkIHJwbSBlbnRyeSBmb3Igbm9uLXJwbSB0ZXN0cyAqLwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmd19oYW5kbGUgPSBpZ3RfZGVidWdmc19vcGVuKGZk
LCAiZm9yY2V3YWtlX2FsbCIsIE9fUkRPTkxZKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWd0X3JlcXVpcmUoZndfaGFuZGxlID49IDApOwo+ICvCoMKgwqDCoMKgwqDCoH0gZWxz
ZSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9zZXR1cF9ydW50aW1lX3Bt
KGZkKTsKPiArwqDCoMKgwqDCoMKgwqB9CmFsYW46IFRoaXMgaXMgYSBiZXR0ZXIgYXBwcm9hY2gg
aGVyZSAtIG5vdyB3ZSBjYW4gZ3VhcmFudGVlIGNvbnRyb2wKb3ZlciBpdCBiZWluZyBhIHJ1bnRp
bWUtcnBtIHRyaWdnZXJlZCB0ZWFyZG93biB2cyBvdGhlciB0cmlnZ2VyIHR5cGVzLgpUaGFua3Mg
Zm9yIHRoaXMgY2hhbmdlLgo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZ3Rfc3VidGVzdF9mKCJweHAt
dGVybWluYXRpb24ta2V5LXVwZGF0ZS1wb3N0LSVzIiwgdGFnKSB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlcXVpcmVfcHhwX3JlbmRlcihweHBfc3VwcG9ydGVkLCBkZXZpZCk7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRlc3RfcHhwX3RlYXJkb3duX2tleWNo
YW5nZShmZCwgdHlwZSk7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDCoMKgwqDCoGlndF9z
dWJ0ZXN0X2YoInB4cC1zdGFsZS1iby1iaW5kLXBvc3QtJXMiLCB0YWcpIHsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVxdWlyZV9weHAocHhwX3N1cHBvcnRlZCk7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRlc3RfcHhwX3N0YWxlX2JvX2JpbmQoZmQsIHR5cGUp
Owo+ICvCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqBpZ3Rfc3VidGVzdF9mKCJweHAt
c3RhbGUtYm8tZXhlYy1wb3N0LSVzIiwgdGFnKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJlcXVpcmVfcHhwKHB4cF9zdXBwb3J0ZWQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB0ZXN0X3B4cF9zdGFsZV9ib19leGVjKGZkLCB0eXBlKTsKPiArwqDCoMKgwqDC
oMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qIEFuIGFjdGl2ZSBQWFAgcXVldWUgaG9sZHMg
YW4gUlBNIHJlZiwgc28gd2UgY2FuJ3QgdGVzdCBSUE0gd2l0aCBpdCAqLwo+ICvCoMKgwqDCoMKg
wqDCoGlmICh0eXBlICE9IFBYUF9URVJNSU5BVElPTl9SUE0pIHsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3RfZigicHhwLXN0YWxlLXF1ZXVlLXBvc3QtJXMiLCB0
YWcpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
cXVpcmVfcHhwKHB4cF9zdXBwb3J0ZWQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdGVzdF9weHBfc3RhbGVfcXVldWVfZXhlY3V0aW9uKGZkLCB0eXBl
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgY2xvc2UoZndfaGFuZGxlKTsKPiArwqDCoMKgwqDCoMKgwqB9IGVs
c2Ugewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfcmVzdG9yZV9ydW50aW1l
X3BtKCk7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICt9Cj4gKwphbGFuOnNuaXAK

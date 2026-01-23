Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2136D6CFA7
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 12:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C0E10E2BF;
	Fri, 23 Jan 2026 12:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGWNzX2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097A210E2BF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769171714; x=1800707714;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=H2QftLFmeaAPZKdTfyyHjiX6/dIpaobaNBl2Po2PbO0=;
 b=bGWNzX2EKPLQLq+Tst1Epe9HYtcofZgZ8Gxsasln4ZyVl2wtlCJA23di
 He+HOJ9ZUf9SpZDZ17rlysf6eskMo7sih3xy+veLflICj6jWyC0JtKkik
 AUQdOMkNKcXkETeSi9aHMpRX3k8xXSPQLCGnsLKpGgZUcvELCvGwPT4QA
 nPj6wz+5Q71tg77IV1fb3VspXCvRhm+hbgrTN+oog1Ez0UwfsiZMfuwhe
 uF8HMrNt4B4rM1FiJdp0v/MvXec20UqeHxl6eacrPck6BCoyDeGu87wVM
 ee7b8TcHsuRg7u0MRsNxMZHfHXnjbA0ACVovJHXZUm1xWKaK5UDIWLVho A==;
X-CSE-ConnectionGUID: ZyxJ+JPBQNujg69x9wAVzg==
X-CSE-MsgGUID: bLRENtV6Soi107kxG+daig==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87842077"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208,217";a="87842077"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:35:13 -0800
X-CSE-ConnectionGUID: RPGV6mLNRJO7RPGIHs5w6w==
X-CSE-MsgGUID: ucMT/AZXSmylnGeS4uS4Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
 d="scan'208,217";a="206276020"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:35:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 04:35:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 04:35:11 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 04:35:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9Wfez96Yd1WolzIdEoABfo9WVBzGoPhGZB+OtW+HAcjF4+vumc8vgN2LdvzVFa7ir/EYf/aV38NBjrHiXMsHwzUNg0DTCtADGJUaqblqWzh8SZ36Fo4HRAgHoQtjkKWBVWXSP37SHpmuxQYQCfeKbwpFYFftdCCJOgutsYbJ+RVe6/s4sKMjO67U8hNQYyIO5nuuXsI1YAuWAtQ7YwAIiiB2hAwcCOTBxn/M2Z+YG8FawUQsQPCd3WQ67NYvHQluQUOD9UgzeeCkJhRNT8oz8sLumlFFPZaGBOg1TWpJDivvNMBMa7Uz+uaveco6SKRNDvHRHfjQVNCcxiLKcVHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sa+cyskhsUWn8kq82NjvO1i5twOLhUQICUOCkwKGlG0=;
 b=KGaAYw2XTQSFvKJwRl+/OG2jC1drjO0X33X9OvXNMtwwpCmJ1UiFBFYKFx/JENk0DutujVYm6OqgY5QEOQavZK+uX2SG2qH1Sm8o069d2WuAfGLEyEvt6XRdwqwSG+K7ESj4nxoQNdkOqsUWhp2N70xfV+5HPrioXfT77MPKhwgTHaiE1bgiVdHsTY2yEeccER053HRgMwsverT3x9OlXKUtczk2wnAGSkdVQrS+saLyouR3bujyzlDITi9rEpgX1U9CPkDQvmVPJgT12ZRrL4TKOn+aEK0F9eaVuVAynF6UF1zRN8J1NDj0uG8oxQLQqzW/V+UqluAl52iipaj44Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH3PPF632600ADB.namprd11.prod.outlook.com (2603:10b6:518:1::d27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:35:09 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:35:09 +0000
Content-Type: multipart/alternative;
 boundary="------------5b7dPZEPtAhIS3gh6vbzXAwg"
Message-ID: <126b57d8-9441-47e0-aa53-3e887a0e2210@intel.com>
Date: Fri, 23 Jan 2026 18:05:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 2/2] tests/intel/xe_pm_residency: Add subtest
 for ASPM Link state residency
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>
References: <20260121145747.1378494-1-karthik.poosa@intel.com>
 <20260121145747.1378494-3-karthik.poosa@intel.com>
 <20260122150007.r4btixs6doti3n2z@kamilkon-DESK.igk.intel.com>
 <3e0d1442-6464-4c7b-a275-2b18d8328775@intel.com>
 <20260123120703.uraxy7njgzi47uxh@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260123120703.uraxy7njgzi47uxh@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA5PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH3PPF632600ADB:EE_
X-MS-Office365-Filtering-Correlation-Id: 89226805-a31b-4a71-9070-08de5a7bd823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vko4UDdqYWxBelJmUERVR3BkU1JCS3VzbDF4RG9wMUdEVE05ODFmTFlaRGQ4?=
 =?utf-8?B?TDRzazhIZ0d2S09EbWZ4ZjRVRjRDaTRlYk9DRVJnUUNWajQ2MVBKOGRLUjVR?=
 =?utf-8?B?a2pTRmtVV081UUkrcCt6SGRTOUY1U01RZ0pIZlpSVVQ4OWwzWkpRN2h0ekZy?=
 =?utf-8?B?b29LYXJGQTZwWnZtendGUDBvNnJqL01yTnJUb1VjRUo5cWl6NzYwSUptaWVN?=
 =?utf-8?B?b1drV3RZb2NVZTBRUWl6cXUwZUJDd3VkQkJqQkZIRmJTRjU4a0lTZjdkZzlW?=
 =?utf-8?B?T1ZlN2pnaC9CZHZaMmFBZDdoLzVHNGhTTU5jOUZ3eDhnNkNNbVlFRlhNMHlY?=
 =?utf-8?B?VTlrVXlYZlkzWjV6Q0lNUmNKcUFVZXFiQnNVN1RRNzB6Tlg2ZmZlQXI4TGp0?=
 =?utf-8?B?UmxYMmwrb1QycmdDY2VFZE42MWhtcHJseDUrNFVSZGx5WVFYcTE1MkxzUzV1?=
 =?utf-8?B?ckhGNncwc0dGVGRUR3JYaVBJcThOcUxEMnYzVzBsQ2EvMytBUTk4R1Q1V2JC?=
 =?utf-8?B?a1VSOS9qOW0vN0VaN3JJUE5NbTN1MDJ6WHRRNWRyYXhrN3E0NDl1dSs5RVN2?=
 =?utf-8?B?VWVrSUE2TFpSSVlDZDNrajU3S20reHlWclo5R3R4NjB6ZjNnR0psWVhHYzcw?=
 =?utf-8?B?YlNJOXhqSFF5c01IcDRqcTNlWnVDdjdzOHkyNGhaeTN4QmsxVmhOODRTRHhT?=
 =?utf-8?B?ZEZwcFZobk8yWktCN1B5N29XK0F2eGYrNlQ0d1dJTlpHb0theFVNeFFNUHI0?=
 =?utf-8?B?NDVRMGJyVmxLalc0dldLWlhFaW1Obis2YThGTEdDRkZqSGtvUzB0Sk5jU0pX?=
 =?utf-8?B?WVVvYTBTdE1yMFNDeWxzei9IbHl5QmkxOTVGbU1KWHozaTdHUG9tbXI5eHow?=
 =?utf-8?B?dk5Fa0xkb3NYTlo5MmprZ3VHZExYRm1UbjNKTHk1QnUrdE5aS1Y1aHVCUk5S?=
 =?utf-8?B?aGdrVDVpbG8wTGdVdkMzd2Q3WlY2a04zaU90TW9PNDlsMkxhc0NNQmtCZVRp?=
 =?utf-8?B?WlpLQjZNc1Rpc08wU05NaXh0a0k0ajI5Sno4Y1B2QW0xSU5OaHhtL0d5OXND?=
 =?utf-8?B?VVB3N3JwVC9aN2oyM0NTZUpzYWdLME9GVnc0LzdDS25najJhdnp3c3FvTHVx?=
 =?utf-8?B?ZndUd2dpdS80ejNZZE0rbFJNektIYTM5dUVqQVdOWDBNaEpCWnJOR01xS3dk?=
 =?utf-8?B?M0tzeEtpUE9pWlQrV0t2eFJ4a0dCQlAxeWdHcllpWDdpR2pCSWFYdlBVTzc1?=
 =?utf-8?B?Mkk5VGdIdVlVYThJNWFsOFZjL0pJc2xSUncwNkhyY0hEb2tpNnFjSWU5UGNU?=
 =?utf-8?B?MEJ5N3R1bTROMWRnVjAxYTJVV0FHTFdDT3Zlcmx1UGVWSXdseUlvdVBTTWhH?=
 =?utf-8?B?TTFCb1c3c09UaFF0ZVNoMWF0WWI4WmNVMC9HSmlwVzQrMkI1UFBJeDFZMGE2?=
 =?utf-8?B?Qk5kUUV6L01DRGNaWHhlUjVDTTF3WENBVEFJYjNDN25yQlhvdzYvQVVIZFhi?=
 =?utf-8?B?ODQyR3k3amRIOXlBVlFObklBMDF1MkEwOUF2cElrRGFsMGVCUnJrc2ZRRW1s?=
 =?utf-8?B?WEhzTlBTaGtQR0JTQlRlYjI4TEhrMlFaaTVaaHFMWEF4MlYxK2JGVTFNanNM?=
 =?utf-8?B?eXF3aVIvNzhWT3JUaDRibzEwZHJPTWNJbTF4UENrRUFPVjRNdmltNkYxMWlT?=
 =?utf-8?B?cUxydzdHaldXZnJaOVN5VFF5SktpOVNDbEFrak5IdVBWak11RkpuYXBZRmJo?=
 =?utf-8?B?V21obXRDSVAyaldiSHhjT3JkbUNrQXF2ZldVYUs2dDg3R2hLV3ZTWEVWMnJI?=
 =?utf-8?B?cE9GbVpDRzM4OTRlY3BLNVBsUnE0UFEwWDd2QVB0MFJEdzlPUjJLckcxanJ3?=
 =?utf-8?B?Y0pmTXFlUms5aldPVndHVmJ5ZXR3VzRvbXovSFl1R1NBSm40dHhzbmszMXY1?=
 =?utf-8?B?aUVEc1RPZ004bGx6RFJnKzVRaXFKRUJjOElqOHlVVG84U01jNkRKdHRtZ3p0?=
 =?utf-8?B?Vk1TR1YyYW5wV2hPbStydzA0d1g4UWQyS2dHdlFiSmpsaHFoT1hHemMzeFMv?=
 =?utf-8?B?VEZCT1BRd1NiS3dzT29xMWdYcVQ1ZzhKcGdYV1lIMEtJeTVkblhCcWFJRFpI?=
 =?utf-8?Q?wnEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkhTVmxCN05oWnVoNmFkbjVGVzJ6OW5mUllEUG9SaDB1Q0ZSOVE4UTYwanlj?=
 =?utf-8?B?VW9FV1pxcWVjaUNidnhjK2dQMkJjeG1nR2daK2NRY24xT2xQWmNsdmdwbWNu?=
 =?utf-8?B?UGoxZWQ0TzF5Tjh3SGNqejV5eTZvb0FsSkNCQ3hUNTQ0b2lnOWVpSVovVmlj?=
 =?utf-8?B?ODhOUWhEUU1MbDRZVi9OVFhtYWNvOEs5WUxXNTY1Mjl6M1lycFFPTnA2Q1NX?=
 =?utf-8?B?em9ZV2JtU0VPdkRzanFHMGRuaHZNRFBBNHRGYUFySHBLbFJJTWdQNXdBL2l2?=
 =?utf-8?B?RXlMZ1ZUZlk2R25heGU4aFNJRXgzTElRbFNoeW9KMXRRYit5Mk9PZ2R5SEFI?=
 =?utf-8?B?Wmw2OGJFMXVLL3hNMzBlMnFLRFNkd1JYNy9QczF1STRlUk94Y1ZhZ1M5cUlU?=
 =?utf-8?B?WWNEZGVpRTlkUE9VZlFBa2FsS1BXZGxMakRBOS9KalhqZ2lSSlI2RlJOL3dO?=
 =?utf-8?B?alJGd1o2eEx1Sm0vdUQrK2hubGhRbnFITHpIRi9TZzdGNkpLM3NCMlNBVXlH?=
 =?utf-8?B?V01QTFplN1d4cWQ2cW5jRGJJU3FlbWN2WmV0VFF1bjlPclQybjV1aXYzS1Bj?=
 =?utf-8?B?ZTlQelJzdTNzQ1hYVHBwaDFmY3dyMXdBbVNmZEgxN0Z6alFBY0JRSmpENnBl?=
 =?utf-8?B?bzdlWnhpNEI5T2tFMjJWc21JdmZCYnlxaWdPT0VSUjYwa3NZM1pvRDZjMEMw?=
 =?utf-8?B?Qk9vSHN4TFYxc0JlTktTNDAwc0svVHl0a1ZBVzloa0tDZEpmMVp3eDIrZEYw?=
 =?utf-8?B?UEg3RnYrdm56M1BIUmYxZEpCbTJsZTFoTjRlaXR1ZHoxampGYjdzajFFdXE4?=
 =?utf-8?B?dy82NHhHTDhyNjJSV29QMWVWbkNIK2MvYWlyaE05MmdmR3A0eCtoa0paRTRr?=
 =?utf-8?B?QnQrTTg4aUVjUFBHVnlmdzMzOWhGSEliTjZ5dTVBOHJjZDQ4ZlR1b0Urd0Mr?=
 =?utf-8?B?VllnbVRMQzdUWHgvVEFrTnlJWnFCcGJnZy9SL1RmQWt1RmlOYzRVVVJVZU05?=
 =?utf-8?B?YlBDYjltc2d3bnIyeDRtclppUGYvL2gyZTBrem9UckRFRzRwZGpwckJsSXRs?=
 =?utf-8?B?dXpBZW9CYUZtYjFmWFp4YTBHaXhlWHNHem85aGpJMHJBK2x5a3RIS0U0SUI1?=
 =?utf-8?B?YnhaeXF4Vjd0TVVSSWg0TUphUWRjQW1tZHM5Zytra2VYc01VU1FGbHIreE5B?=
 =?utf-8?B?OFdJUFZlRER1c1BzaGRZTkxpVGxIbjJUbmZ0emNmcWxtcXRRcEU4eHhXTUFE?=
 =?utf-8?B?TG91TTMvMzl5bnhVMjA2Q0h3VzJjWFJmaHIxQnFVTERMQ1g4bW5PejM5akhl?=
 =?utf-8?B?TnNNOWcxOXhqZUNid1d4ME51S2pmZXR2cER5ZEplQ3JnVTZSSTJsUWVvay82?=
 =?utf-8?B?dUh4U1JqRXMrc0xucDVMdlhVb2c5SkNsckYwOFlvUm5KZDFsbmtBditkSEtD?=
 =?utf-8?B?YTd0ckRsQkJsVFE0ZzVOREcybmJnaGZQUHEySzJXMDJ2bXdSQW5pb1lwaTdk?=
 =?utf-8?B?MkIyczZsU3V2VWlnR3I2bFhPMjhGRGdqVXFtem5yQ3BVTEtzOTlqcGt4NGF4?=
 =?utf-8?B?bVk4WjRBWFBoS2IwSUhBRnFWVXF1MWhzYm5qL3FEUmVZVnIwR0JVT2l1M2VR?=
 =?utf-8?B?d2RmeG5RdFZhS25pWUxKcTRHZEsyMEpDckNYQUF1dHE1WEtLQkpyanRQMVhm?=
 =?utf-8?B?Zmt5eU9hTi93YnllZnNWcXRjdGFsck9yTkJINkpoUll0RUlzcW5Rb1ZEd2ds?=
 =?utf-8?B?SGhSRTJsVGVUTysxUURKY1loOW1EbzkxVmwrZWdSakJ3WHBqclR1NjN4Q3Q5?=
 =?utf-8?B?TThMN0NvU3ZEOThJZm5WRWh3YU90cXVRYTJoMmlxdHMwOHN2dzhzMCtxU3V6?=
 =?utf-8?B?WmtVZm5vZzU0MGJ3UzRnR3hjQmErMmpad1oveko2REM5OWcyL3NrcVhPak0z?=
 =?utf-8?B?aGxNRXpINUI1UGYrZ1NYcHAvMnNYSkpVdk9qTytzcXM2d3o5c3NQaFpPVmZl?=
 =?utf-8?B?djFnT1hod1R3bVJlemdCMG5uQit5NFRWemlYM091LzcvQzlUTDhGTlE2blFV?=
 =?utf-8?B?d1I4cWtYS3gwL3Q2dlJ6K3JENXpqSmpBOVM4Y2ViUmxGcVRya1d3YzhaNzgz?=
 =?utf-8?B?UUNQOVFvaHdjNzQ5aUZQMnNlakczdVBtS09MM1J5Z1pGZzZYUXcvMkUvMW1Y?=
 =?utf-8?B?ODNyQkpvcGZrZHN0Mk5kN3MreWJxMTVXUTV4ekV4NFVqcFdtaTJWdERVV0NK?=
 =?utf-8?B?RG9QU1Z3REJLRXFsS0tRQ0JkamxyNG51QnlxWVhCd1UwZ2pQUGZJM0x3dDJZ?=
 =?utf-8?B?UXVMMlhLVmtFOUxmczVROGkwR05OVDFEaHVhenFuajQ5N2hNU24rUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89226805-a31b-4a71-9070-08de5a7bd823
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:35:09.1252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqe92oAguHjE6ftaGm3n7uOTukVZp1Pqji2cUr1Ba+J93T4iBkaHrQygFoXa/6r8rJAZtSztqXVK6zJ5WJ15zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF632600ADB
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

--------------5b7dPZEPtAhIS3gh6vbzXAwg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 23-01-2026 17:37, Kamil Konieczny wrote:
> Hi,
> On 2026-01-23 at 16:04:11 +0530, Poosa, Karthik wrote:
>> On 22-01-2026 20:30, Kamil Konieczny wrote:
>>> Hi Karthik,
>>> On 2026-01-21 at 20:27:47 +0530, Karthik Poosa wrote:
>>>> Add subtest aspm_link_residency to verify PCIe ASPM.
>>>> Active State Power Management (ASPM) is a power management mechanism
>>>> for PCI Express (PCIe) devices that aims to save power while the devices
>>>> are in a fully active state.
>>>> This test uses link state counters from the debugfs
>>>> dgfx_pcie_link_residencies to verify this.
>>>>
>>>> v2:
>>>>    - Add dedicated function to get pcie endpoint upstream port. (Badal)
>>>>    - Read residency counter as unsigned long long int instead of
>>>>      unsigned long int.
>>>>    - Print residency counter before sleep also.
>>>>    - Don't assert if sysfs not corresponding to aspm_link_state
>>>>      is not present. (Badal)
>>>>    - Run workload before validation of aspm link residency. (Anshuman)
>>>>
>>>> v3:
>>>>    - Move igt_device_get_pci_usp to separate patch. (Kamil)
>>>>    - Move reading of residency to separate function. (Badal)
>>>>
>>>> v4:
>>>>    - Add description about PCIe ASPM in commit message and code. (Kamil)
>>>>    - Add a NULL check for the return value of igt_device_get_pci_usp().
>>>>    - Resolve compilation warnings about using variable as format string
>>>>      to sscanf.
>>>>
>>>> v5:
>>>>    - Use igt_device_get_pci_upstream_port() which is the renamed version
>>>>      of igt_device_get_pci_usp().
>>>>
>>>> v6:
>>>>    - Refactor and enhance readability. (Badal)
>>>>    - Move save and restore of link states to separate functions. (Badal)
>>>>
>>>> v7:
>>>>    - Skip aspm_link_residency on integrated platforms as it not supported.
>>>>
>>>> v8:
>>>>    - Address below review comments from Riana.
>>>>    - Use igt_sysfs_has_attr() instead of faccess().
>>>>    - Remove unnecessary spaces, debug logs, if checks.
>>>>    - Wrap line length to 100 chars.
>>>>    - Use spinner instead of mmap for workload.
>>>>
>>>> v9:
>>>>    - Address review comments from Kamil.
>>>>    - Simplify couple of igt_asserts.
>>>>    - Remove extra spaces.
>>>>
>>>> v10:
>>>>    - Add exit handler for aspm_link_residency test. (Riana)
>>>>    - Remove unused and unnecessary variables.
>>>>
>>>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>>>> Reviewed-by: Badal Nilawar<badal.nilawar@intel.com>
>>>> ---
>>>>    tests/intel/xe_pm_residency.c | 196 ++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 196 insertions(+)
>>>>
>>>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>>>> index d33a87b13..2d965ef7d 100644
>>>> --- a/tests/intel/xe_pm_residency.c
>>>> +++ b/tests/intel/xe_pm_residency.c
>>>> @@ -31,12 +31,36 @@
>>>>    const double tolerance = 0.1;
>>>>    int fw_handle = -1;
>>>> +int fd_pci_usp;
>>> int fd_pci_usp = -1;
>>>
>>>> +bool rpm_disabled;
>>>> +bool link_states_saved;
>>>>    enum test_type {
>>>>    	TEST_S2IDLE,
>>>>    	TEST_IDLE,
>>>>    };
>>>> +enum link_state_index {
>>>> +	LINK_STATE_ASPM,
>>>> +	LINK_STATE_ASPM_L1_1,
>>>> +	LINK_STATE_ASPM_L1_2,
>>>> +	LINK_STATE_PCIPM_L1_1,
>>>> +	LINK_STATE_PCIPM_L1_2,
>>>> +	MAX_LINK_STATES,
>>>> +};
>>>> +
>>>> +struct link_state_info {
>>>> +	const char *filename;
>>>> +	char state;
>>>> +	const char *parse_str;
>>>> +} link_state_sysfs[] = {
>>>> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
>>>> +	{ "l1_1_aspm", 0, "NULL"},
>>>> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
>>>> +	{ "l1_1_pcipm", 0, NULL},
>>>> +	{ "l1_2_pcipm", 0, NULL}, +}; + /** * SUBTEST: gt-c6-on-idle * Description: 
>>>> Validate GT C6 state on idle @@ -64,6 +88,10 @@ enum test_type { * 
>>>> SUBTEST: cpg-gt-toggle * Description: Toggle GT coarse power gating 
>>>> states by acquiring/releasing * forcewake. + * + * SUBTEST: 
>>>> aspm_link_residency + * Description: Check for PCIe ASPM (Active 
>>>> State Power Management) link states + * entry while device is in 
>>>> D0. */ IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>>> @@ -255,6 +283,21 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>>>>    	munmap(done, 4096);
>>>>    }
>>>> +static void do_spin(int fd, struct drm_xe_engine_class_instance *eci)
>>>> +{
>>>> +	igt_spin_t *spin;
>>>> +	uint64_t vm, ahnd;
>>>> +
>>>> +	igt_info("Running spinner on %s:%d\n",
>>>> +		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
>>>> +	vm = xe_vm_create(fd, 0, 0);
>>>> +	intel_allocator_init();
>>>> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>>>> +	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
>>>> +	igt_measured_usleep(USEC_PER_SEC);
>>>> +	igt_spin_free(fd, spin);
>>>> +}
>>>> +
>>>>    static void measure_power(struct igt_power *gpu, double *power)
>>>>    {
>>>>    	struct power_sample power_sample[2];
>>>> @@ -370,6 +413,143 @@ static void cpg_gt_toggle(int fd)
>>>>    		powergate_status(fd, gt, "down");
>>>>    }
>>>> +static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
>>>> +{
>>>> +	int fd_debugfs_dir = 0;
>>>> +	int ret = 0;
>>>> +	char *ptr = NULL;
>>>> +	char buf[1024] = {0};
>>>> +	uint64_t residency = 0;
>>>> +
>>>> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
>>>> +	igt_assert(fd_debugfs_dir >= 0);
>>>> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf,
>>>> +				      sizeof(buf));
>>>> +	igt_assert_f(ret >= 0, "Cannot read residency file dgfx_pcie_link_residencies, ret %d\n",
>>>> +		     ret);
>>>> +
>>>> +	ptr = strstr(buf, parse_str);
>>>> +	igt_assert_f(ptr, "Cannot find residency string %s\n", parse_str);
>>>> +	ret = sscanf(ptr + strlen(parse_str), "%lu", &residency);
>>>> +	igt_assert_f(ret > 0, "Couldn't read residency value, ret %d", ret);
>>>> +	igt_info("Link residency %"PRIu64"\n", residency);
>>>> +	close(fd_debugfs_dir);
>>>> +
>>>> +	return residency;
>>>> +}
>>>> +
>>>> +static void save_and_disable_link_states(void)
>>>> +{
>>>> +	int i = 0;
>>>> +	int ret = 0;
>>>> +	char path[256] = {0};
>>>> +
>>>> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
>>>> +		sprintf(path, "%s", link_state_sysfs[i].filename);
>>>> +		if (!igt_sysfs_has_attr(fd_pci_usp, path))
>>>> +			continue;
>>>> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
>>>> +		igt_assert_lt(0, ret);
>>>> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename,
>>>> +			  link_state_sysfs[i].state);
>>>> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
>>> Disable should be done in separate function, so there should be two:
>>>
>>> static void save_link_states(void)
>>> static void disable_link_states(void)
>> any reason for this Kamil, it will be unnecessary extra function.
> Because you mix here reading and setting. imho there could be
> a problem if setting first few succeeds but in middle fails.
ok
>
>
>>>> +		igt_assert_lt(0, ret);
>>>> +	}
>>>> +	link_states_saved = true;
>>>> +}
>>>> +
>>>> +static void restore_link_states(void)
>>>> +{
>>>> +	int i = 0;
>>>> +	int ret = 0;
>>>> +	char path[256] = {0};
>>>> +
>>>> +	if (link_states_saved && fd_pci_usp >= 0) {
>>>> +		/* Restore saved states of L1 sysfs entries. */
>>>> +		for (i = 0 ; i < MAX_LINK_STATES ; i++) {
>>>> +			sprintf(path, "%s", link_state_sysfs[i].filename);
>>>> +			if (!igt_sysfs_has_attr(fd_pci_usp, path))
>>>> +				continue;
>>>> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
>>>> +			igt_assert_lt(0, ret);
>>>> +			igt_debug("restored %s to %c\n", link_state_sysfs[i].filename,
>>>> +				  link_state_sysfs[i].state);
>>>> +		}
>>>> +		link_states_saved = false;
>>>> +	}
>>>> +}
>>>> +
>>>> +static void test_aspm_link_residency(int fd_xe, enum link_state_index aspm_link_state)
>>>> +{
>>>> +	struct pci_device *pci_dev;
>>>> +	char name[PATH_MAX];
>>>> +	int ret = 0;
>>>> +	uint64_t residency_pre = 0, residency_post = 0;
>>>> +
>>>> +	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
>>>> +
>>>> +	/* Get upstream port pci_dev */
>>>> +	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
>>>> +	igt_assert_f(pci_dev, "Couldn't get pci device of upstream port\n");
>>>> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
>>>> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
>>>> +
>>>> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
>>>> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>>>> +	fd_pci_usp = open(name, O_DIRECTORY);
>>>> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n",
>>>> +		     name, fd_pci_usp);
>>>> +
>>>> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
>>>> +	igt_assert(igt_setup_runtime_pm(fd_xe));
>>>> +	igt_disable_runtime_pm();
>>>> +	rpm_disabled = true;
>>>> +
>>>> +	/* Check if ASPM sysfs is present. */
>>>> +	igt_require_f(igt_sysfs_has_attr(fd_pci_usp, link_state_sysfs[aspm_link_state].filename),
>>>> +		      "%s is not present\n", link_state_sysfs[aspm_link_state].filename);
>>>> +	ret = igt_sysfs_scanf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c",
>>>> +			      &link_state_sysfs[aspm_link_state].state);
>>>> +	igt_assert_f((ret > 0), "Couldn't read residency for %s",
>>>> +		     link_state_sysfs[aspm_link_state].filename);
>>>> +
>>>> +	/* Save current state of all available link sysfs entries and disable all link states. */
>>>> +	save_and_disable_link_states();
>>>> +
>>>> +	/* Enable only the ASPM link state needed for test. */
>>>> +	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
>>>> +	ret = igt_sysfs_printf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c", '1');
>>>> +
>>>> +	/* Read link state residencies before and after idle wait time. */
>>>> +	residency_pre = get_link_state_residency(fd_xe,
>>>> +						 link_state_sysfs[aspm_link_state].parse_str);
>>>> +	igt_info("Waiting for link to enter idle....\n");
>>>> +	sleep(SLEEP_DURATION);
>>>> +	residency_post = get_link_state_residency(fd_xe,
>>>> +						  link_state_sysfs[aspm_link_state].parse_str);
>>>> +
>>>> +	restore_link_states();
>>>> +	igt_restore_runtime_pm();
>>>> +	rpm_disabled = false;
>>>> +	close(fd_pci_usp);
>>>> +	close(fd_xe);
>>>> +
>>>> +	igt_assert_f(residency_post > residency_pre,
>>>> +		     "ASPM entry failed, pre %"PRIu64", post %"PRIu64"\n", residency_pre,
>>>> +		     residency_post);
>>>> +}
>>>> +
>>>> +static void aspm_residency_exit_handler(int sig)
>>>> +{
>>>> +	restore_link_states();
>>>> +	if (rpm_disabled) {
>>>> +		igt_restore_runtime_pm();
>>>> +		rpm_disabled = false;
>>>> +	}
>>>> +	if (fd_pci_usp)
>>> 	if (fd_pci_usp != -1)
>>>
>>>> +		close(fd_pci_usp);
>>> Add:
>>> 	fd_pci_usp = -1;
>>>
>>>> +}
>>>> +
>>>>    int igt_main()
>>>>    {
>>>>    	uint32_t d3cold_allowed;
>>>> @@ -444,6 +624,22 @@ int igt_main()
>>>>    		cpg_gt_toggle(fd);
>>>>    	}
>>>> +	igt_describe("ASPM Link residency validation");
>>>> +	igt_subtest_with_dynamic("aspm_link_residency") {
>>> This should be igt_subtest():
>>>
>>> 	igt_subtest("aspm_link_residency") {
>>>
>>>> +		igt_require(xe_has_vram(fd));
>>>> +		xe_for_each_gt(fd, gt) {
>>>> +			xe_for_each_engine(fd, hwe) {
>>>> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
>>>> +					igt_dynamic_f("gt%u-engine-%s", gt,
>>>> +						      xe_engine_class_string(hwe->engine_class))
>>> What are you testing here? If you need to start and stop spinner
>>> please describe here why. If you really need it, it should be:
>> we want to run a basic workload before testing ASPM entry.
>>
>> So we are using spinner as workload here.
> ok, but why do you need any workload? It should also work without it?

Yes, it works even workload also.

This was suggested by Anshuman,

I believe this is intended to wake up the GPU and ensure the engines 
execute some workload before entering ASPM.

>
>>> 				if (gt == hwe->gt_id && !hwe->engine_instance)
>>> 						do_spin(fd, hwe);
>>>
>>>> +						do_spin(fd, hwe);
>>>> +				}
>>>> +			}
>>>> +		}
>>> Add newline.
>>>
>>>> +		igt_install_exit_handler(aspm_residency_exit_handler);
>>>> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
>>> Btw any igt_assert outside of dynamic sub-subtest here will result
>>> in SIGABORT, not a proper test fail.
>>>
>>> Add cleanup here:
>>> 		aspm_residency_exit_handler(0);
>> but installing exit handler already does this !
> It could become a problem when someone adds new test after this one.
>
> Regards,
> Kamil
>
>>>> +	}
>>>> +
>>>>    	igt_fixture() {
>>>>    		close(fd);
>>>>    	}
>>>> -- 
>>>> 2.25.1
>>>>
--------------5b7dPZEPtAhIS3gh6vbzXAwg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-01-2026 17:37, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260123120703.uraxy7njgzi47uxh@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi,
On 2026-01-23 at 16:04:11 +0530, Poosa, Karthik wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 22-01-2026 20:30, Kamil Konieczny wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi Karthik,
On 2026-01-21 at 20:27:47 +0530, Karthik Poosa wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Add subtest aspm_link_residency to verify PCIe ASPM.
Active State Power Management (ASPM) is a power management mechanism
for PCI Express (PCIe) devices that aims to save power while the devices
are in a fully active state.
This test uses link state counters from the debugfs
dgfx_pcie_link_residencies to verify this.

v2:
  - Add dedicated function to get pcie endpoint upstream port. (Badal)
  - Read residency counter as unsigned long long int instead of
    unsigned long int.
  - Print residency counter before sleep also.
  - Don't assert if sysfs not corresponding to aspm_link_state
    is not present. (Badal)
  - Run workload before validation of aspm link residency. (Anshuman)

v3:
  - Move igt_device_get_pci_usp to separate patch. (Kamil)
  - Move reading of residency to separate function. (Badal)

v4:
  - Add description about PCIe ASPM in commit message and code. (Kamil)
  - Add a NULL check for the return value of igt_device_get_pci_usp().
  - Resolve compilation warnings about using variable as format string
    to sscanf.

v5:
  - Use igt_device_get_pci_upstream_port() which is the renamed version
    of igt_device_get_pci_usp().

v6:
  - Refactor and enhance readability. (Badal)
  - Move save and restore of link states to separate functions. (Badal)

v7:
  - Skip aspm_link_residency on integrated platforms as it not supported.

v8:
  - Address below review comments from Riana.
  - Use igt_sysfs_has_attr() instead of faccess().
  - Remove unnecessary spaces, debug logs, if checks.
  - Wrap line length to 100 chars.
  - Use spinner instead of mmap for workload.

v9:
  - Address review comments from Kamil.
  - Simplify couple of igt_asserts.
  - Remove extra spaces.

v10:
  - Add exit handler for aspm_link_residency test. (Riana)
  - Remove unused and unnecessary variables.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Reviewed-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
---
  tests/intel/xe_pm_residency.c | 196 ++++++++++++++++++++++++++++++++++
  1 file changed, 196 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index d33a87b13..2d965ef7d 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -31,12 +31,36 @@
  const double tolerance = 0.1;
  int fw_handle = -1;
+int fd_pci_usp;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">int fd_pci_usp = -1;

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+bool rpm_disabled;
+bool link_states_saved;
  enum test_type {
  	TEST_S2IDLE,
  	TEST_IDLE,
  };
+enum link_state_index {
+	LINK_STATE_ASPM,
+	LINK_STATE_ASPM_L1_1,
+	LINK_STATE_ASPM_L1_2,
+	LINK_STATE_PCIPM_L1_1,
+	LINK_STATE_PCIPM_L1_2,
+	MAX_LINK_STATES,
+};
+
+struct link_state_info {
+	const char *filename;
+	char state;
+	const char *parse_str;
+} link_state_sysfs[] = {
+	{ &quot;l1_aspm&quot;, 0, &quot;PCIE LINK L1 RESIDENCY : &quot;},
+	{ &quot;l1_1_aspm&quot;, 0, &quot;NULL&quot;},
+	{ &quot;l1_2_aspm&quot;, 0, &quot;PCIE LINK L1.2 RESIDENCY : &quot;},
+	{ &quot;l1_1_pcipm&quot;, 0, NULL},
+	{ &quot;l1_2_pcipm<a class="moz-txt-link-rfc2396E" href="mailto:,0,NULL},+};+/***SUBTEST:gt-c6-on-idle*Description:ValidateGTC6stateonidle@@-64,6+88,10@@enumtest_type{*SUBTEST:cpg-gt-toggle*Description:ToggleGTcoarsepowergatingstatesbyacquiring/releasing*forcewake.+*+*SUBTEST:aspm_link_residency+*Description:CheckforPCIeASPM(ActiveStatePowerManagement)linkstates+*entrywhiledeviceisinD0.*/IGT_TEST_DESCRIPTION(">&quot;, 0, NULL},
+};
+
  /**
   * SUBTEST: gt-c6-on-idle
   * Description: Validate GT C6 state on idle
@@ -64,6 +88,10 @@ enum test_type {
   * SUBTEST: cpg-gt-toggle
   * Description: Toggle GT coarse power gating states by acquiring/releasing
   *		forcewake.
+ *
+ * SUBTEST: aspm_link_residency
+ * Description: Check for PCIe ASPM (Active State Power Management) link states
+ * entry while device is in D0.
   */
  IGT_TEST_DESCRIPTION(&quot;</a>Tests for gtidle properties&quot;);
@@ -255,6 +283,21 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
  	munmap(done, 4096);
  }
+static void do_spin(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	igt_spin_t *spin;
+	uint64_t vm, ahnd;
+
+	igt_info(&quot;Running spinner on %s:%d\n&quot;,
+		 xe_engine_class_string(eci-&gt;engine_class), eci-&gt;engine_instance);
+	vm = xe_vm_create(fd, 0, 0);
+	intel_allocator_init();
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
+	igt_measured_usleep(USEC_PER_SEC);
+	igt_spin_free(fd, spin);
+}
+
  static void measure_power(struct igt_power *gpu, double *power)
  {
  	struct power_sample power_sample[2];
@@ -370,6 +413,143 @@ static void cpg_gt_toggle(int fd)
  		powergate_status(fd, gt, &quot;down&quot;);
  }
+static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
+{
+	int fd_debugfs_dir = 0;
+	int ret = 0;
+	char *ptr = NULL;
+	char buf[1024] = {0};
+	uint64_t residency = 0;
+
+	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
+	igt_assert(fd_debugfs_dir &gt;= 0);
+	ret = igt_debugfs_simple_read(fd_debugfs_dir, &quot;dgfx_pcie_link_residencies&quot;, buf,
+				      sizeof(buf));
+	igt_assert_f(ret &gt;= 0, &quot;Cannot read residency file dgfx_pcie_link_residencies, ret %d\n&quot;,
+		     ret);
+
+	ptr = strstr(buf, parse_str);
+	igt_assert_f(ptr, &quot;Cannot find residency string %s\n&quot;, parse_str);
+	ret = sscanf(ptr + strlen(parse_str), &quot;%lu&quot;, &amp;residency);
+	igt_assert_f(ret &gt; 0, &quot;Couldn't read residency value, ret %d&quot;, ret);
+	igt_info(&quot;Link residency %&quot;PRIu64&quot;\n&quot;, residency);
+	close(fd_debugfs_dir);
+
+	return residency;
+}
+
+static void save_and_disable_link_states(void)
+{
+	int i = 0;
+	int ret = 0;
+	char path[256] = {0};
+
+	for (i = 0 ; i &lt; MAX_LINK_STATES ; i++) {
+		sprintf(path, &quot;%s&quot;, link_state_sysfs[i].filename);
+		if (!igt_sysfs_has_attr(fd_pci_usp, path))
+			continue;
+		ret = igt_sysfs_scanf(fd_pci_usp, path, &quot;%c&quot;, &amp;link_state_sysfs[i].state);
+		igt_assert_lt(0, ret);
+		igt_debug(&quot;saved %s = %c\n&quot;, link_state_sysfs[i].filename,
+			  link_state_sysfs[i].state);
+		ret = igt_sysfs_printf(fd_pci_usp, path, &quot;%c&quot;, '0');
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Disable should be done in separate function, so there should be two:

static void save_link_states(void)
static void disable_link_states(void)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">any reason for this Kamil, it will be unnecessary extra function.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Because you mix here reading and setting. imho there could be
a problem if setting first few succeeds but in middle fails.</pre>
    </blockquote>
    ok
    <blockquote type="cite" cite="mid:20260123120703.uraxy7njgzi47uxh@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+		igt_assert_lt(0, ret);
+	}
+	link_states_saved = true;
+}
+
+static void restore_link_states(void)
+{
+	int i = 0;
+	int ret = 0;
+	char path[256] = {0};
+
+	if (link_states_saved &amp;&amp; fd_pci_usp &gt;= 0) {
+		/* Restore saved states of L1 sysfs entries. */
+		for (i = 0 ; i &lt; MAX_LINK_STATES ; i++) {
+			sprintf(path, &quot;%s&quot;, link_state_sysfs[i].filename);
+			if (!igt_sysfs_has_attr(fd_pci_usp, path))
+				continue;
+			ret = igt_sysfs_printf(fd_pci_usp, path, &quot;%c&quot;, link_state_sysfs[i].state);
+			igt_assert_lt(0, ret);
+			igt_debug(&quot;restored %s to %c\n&quot;, link_state_sysfs[i].filename,
+				  link_state_sysfs[i].state);
+		}
+		link_states_saved = false;
+	}
+}
+
+static void test_aspm_link_residency(int fd_xe, enum link_state_index aspm_link_state)
+{
+	struct pci_device *pci_dev;
+	char name[PATH_MAX];
+	int ret = 0;
+	uint64_t residency_pre = 0, residency_post = 0;
+
+	igt_assert(aspm_link_state &lt;= LINK_STATE_ASPM_L1_2);
+
+	/* Get upstream port pci_dev */
+	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
+	igt_assert_f(pci_dev, &quot;Couldn't get pci device of upstream port\n&quot;);
+	igt_debug(&quot;Upstream port PCI device: %04x:%02x:%02x.%01x\n&quot;, pci_dev-&gt;domain,
+		  pci_dev-&gt;bus, pci_dev-&gt;dev, pci_dev-&gt;func);
+
+	snprintf(name, sizeof(name), &quot;/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link&quot;,
+		 pci_dev-&gt;domain, pci_dev-&gt;bus, pci_dev-&gt;dev, pci_dev-&gt;func);
+	fd_pci_usp = open(name, O_DIRECTORY);
+	igt_assert_f((fd_pci_usp &gt;= 0), &quot;Can't open link directory upstream port %s, ret %d\n&quot;,
+		     name, fd_pci_usp);
+
+	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
+	igt_assert(igt_setup_runtime_pm(fd_xe));
+	igt_disable_runtime_pm();
+	rpm_disabled = true;
+
+	/* Check if ASPM sysfs is present. */
+	igt_require_f(igt_sysfs_has_attr(fd_pci_usp, link_state_sysfs[aspm_link_state].filename),
+		      &quot;%s is not present\n&quot;, link_state_sysfs[aspm_link_state].filename);
+	ret = igt_sysfs_scanf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, &quot;%c&quot;,
+			      &amp;link_state_sysfs[aspm_link_state].state);
+	igt_assert_f((ret &gt; 0), &quot;Couldn't read residency for %s&quot;,
+		     link_state_sysfs[aspm_link_state].filename);
+
+	/* Save current state of all available link sysfs entries and disable all link states. */
+	save_and_disable_link_states();
+
+	/* Enable only the ASPM link state needed for test. */
+	igt_debug(&quot;Enabling %s\n&quot;, link_state_sysfs[aspm_link_state].filename);
+	ret = igt_sysfs_printf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, &quot;%c&quot;, '1');
+
+	/* Read link state residencies before and after idle wait time. */
+	residency_pre = get_link_state_residency(fd_xe,
+						 link_state_sysfs[aspm_link_state].parse_str);
+	igt_info(&quot;Waiting for link to enter idle....\n&quot;);
+	sleep(SLEEP_DURATION);
+	residency_post = get_link_state_residency(fd_xe,
+						  link_state_sysfs[aspm_link_state].parse_str);
+
+	restore_link_states();
+	igt_restore_runtime_pm();
+	rpm_disabled = false;
+	close(fd_pci_usp);
+	close(fd_xe);
+
+	igt_assert_f(residency_post &gt; residency_pre,
+		     &quot;ASPM entry failed, pre %&quot;PRIu64&quot;, post %&quot;PRIu64&quot;\n&quot;, residency_pre,
+		     residency_post);
+}
+
+static void aspm_residency_exit_handler(int sig)
+{
+	restore_link_states();
+	if (rpm_disabled) {
+		igt_restore_runtime_pm();
+		rpm_disabled = false;
+	}
+	if (fd_pci_usp)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">	if (fd_pci_usp != -1)

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+		close(fd_pci_usp);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Add:
	fd_pci_usp = -1;

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+}
+
  int igt_main()
  {
  	uint32_t d3cold_allowed;
@@ -444,6 +624,22 @@ int igt_main()
  		cpg_gt_toggle(fd);
  	}
+	igt_describe(&quot;ASPM Link residency validation&quot;);
+	igt_subtest_with_dynamic(&quot;aspm_link_residency&quot;) {
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This should be igt_subtest():

	igt_subtest(&quot;aspm_link_residency&quot;) {

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+		igt_require(xe_has_vram(fd));
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_engine(fd, hwe) {
+				if (gt == hwe-&gt;gt_id &amp;&amp; !hwe-&gt;engine_instance) {
+					igt_dynamic_f(&quot;gt%u-engine-%s&quot;, gt,
+						      xe_engine_class_string(hwe-&gt;engine_class))
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">What are you testing here? If you need to start and stop spinner
please describe here why. If you really need it, it should be:
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
we want to run a basic workload before testing ASPM entry.

So we are using spinner as workload here.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
ok, but why do you need any workload? It should also work without it?</pre>
    </blockquote>
    <p>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Yes,
        it works even workload also.<br>
        <br>
        This was suggested by Anshuman,<br>
        <br>
        I believe this is intended to wake up the GPU and ensure the
        engines execute some workload before entering ASPM.</div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
      </div>
    </p>
    <blockquote type="cite" cite="mid:20260123120703.uraxy7njgzi47uxh@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
				if (gt == hwe-&gt;gt_id &amp;&amp; !hwe-&gt;engine_instance)
						do_spin(fd, hwe);

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+						do_spin(fd, hwe);
+				}
+			}
+		}
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Add newline.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+		igt_install_exit_handler(aspm_residency_exit_handler);
+		test_aspm_link_residency(fd, LINK_STATE_ASPM);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Btw any igt_assert outside of dynamic sub-subtest here will result
in SIGABORT, not a proper test fail.

Add cleanup here:
		aspm_residency_exit_handler(0);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">but installing exit handler already does this !
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It could become a problem when someone adds new test after this one.

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+	}
+
  	igt_fixture() {
  		close(fd);
  	}
-- 
2.25.1

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------5b7dPZEPtAhIS3gh6vbzXAwg--

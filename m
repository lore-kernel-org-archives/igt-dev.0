Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55743D6E2CA
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 10:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69F110E3EE;
	Thu, 21 Nov 2024 10:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7L7m1gG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D162F10E3EE
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732184126; x=1763720126;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PRaxzBnd4hzk6FdyKQ8I5uzK/L6CAcc2WTFJzxcfLNg=;
 b=H7L7m1gGngsmaiuSmk6aL9boUoIWLdOsQzH/sltHeIc0uebVJRONw9To
 7muSs/4SN5mDQy3hJbXvQpaQg0O6OyTbr+SBYO511EwVR3OaNfnn0JoqW
 CM+3wsP9fSvchU6Offxp9VKtccycFwAQMlKdACHY4+2LwBXixxrArznTJ
 5RBC/gpBTP/FYqDS7+mQmm4BsXEIgzy+qaGIze/u4fPhyvn5bHaNGq5Ri
 tCtUSkchiOPUrtmSMvLsaQPqIGZnvzBa/3I6AwQq1VzG1y3BjrnF5/QjI
 RV2M4Hv6y7bEoKAUQpAyh6fUZlZ22reqAlEDhnoXEsdi6Hz0NttuPAU9g g==;
X-CSE-ConnectionGUID: uB11fiF8SqOSx2CkrqImBA==
X-CSE-MsgGUID: uOu9saRtSYGBnPS3qZoWpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="42927583"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="42927583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 02:15:25 -0800
X-CSE-ConnectionGUID: hqYQVVlHQtSygizfih0LoQ==
X-CSE-MsgGUID: vLc26VgMRRO4F3XjImek5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="121068338"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 02:15:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 02:15:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 02:15:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 02:15:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR4cGvAaYGk3LCJd9MFdT+ICNRUp/R0Y3jzeg8ZljL+28TGKuUNQXbeHSPMuDZx2uzbxdneHDXN9mQb0IOoVC0Ec5e7Fj8R69b3OB0cr19vm5wiOLZVdX7q7fDTUseYnIrOm18WzrsapmnEPcNitKVMJK9EpViZsMRI1EEy0EzuiHOrOxS6Bkl/lm3p+fz85npQQJ6JcCHik3/U/e0IJ3w5K/tAAf3B6l25NwXJLQBjAb4YHFKWDmwevrLyRhbCa2SteLgR1AS4NfMgMMrOrJwB2TD+4SzRWWeExYHQOuBJY7EWmusut77AfqwfTSM7lFTrkspuPwjRyTl3AcFfAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRaxzBnd4hzk6FdyKQ8I5uzK/L6CAcc2WTFJzxcfLNg=;
 b=ee9nv4t2uM2IcvIy6j79KDZxmUBwYEVvMjf8SJmU7/OlYT98GZm/JQFIm4A/YnmtsX7I4wzQtpveyU9AaiwUl3p8FCGKn/nfoa8e3HSTKFoAtX6+iU+16B+YwMoKd3I6rZeTdVo5IlWuYsBr697TY0G80QML1/PSL78dF1oj2cA/hL/yTr3UQzI2L5TjhVcc6cKxdcu+Fq9Y0C1n2NzAy2HAM7o6R5kPKTbeZ9zGyy4pfwGa9X2IWV7GeVpmPJsQOBifaiYEjhNB9T5sW4GXILp0FgZD4pMfZipFRzbReRYsk79BcTLrTb/DfaEQhuMKUIuvXxcgwQrAO96Z6zQP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 10:15:20 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 10:15:20 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_kms: Add 6k resolution support for a
 single CRTC
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_kms: Add 6k resolution support for a
 single CRTC
Thread-Index: AQHbNR7TsUg/35uqNE+noAfXpBVS6bK3Oi2AgApXa6A=
Date: Thu, 21 Nov 2024 10:15:20 +0000
Message-ID: <DM4PR11MB63128F07F129D36743A85E2290222@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241112163435.1351560-1-jeevan.b@intel.com>
 <20241112163435.1351560-2-jeevan.b@intel.com>
 <645a5544-7efb-4722-ab41-d3f15f39b0b3@intel.com>
In-Reply-To: <645a5544-7efb-4722-ab41-d3f15f39b0b3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB5820:EE_
x-ms-office365-filtering-correlation-id: e6e12e32-a5db-4291-e1fd-08dd0a156776
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZkczaU5OanAvNWlVTUlGM2RZb3lxSEw3cHQ3RHpobVgwNXE0TStMdTRabEE2?=
 =?utf-8?B?N2tncVpxWi9MTDBObHFuazBEWGdwMVU1Skd3L01nSWVNNjlxdHFZYmhKdi94?=
 =?utf-8?B?M2gyOTBjMnlITWtyYTAvaWxRU1BzYlQ1TW1idi9RUjl5dVJjZEYrbjE2ejJN?=
 =?utf-8?B?dndKZko1bDlQQXZsT2FUalhyeUxFZENqR0pmUHNSQ1N2ZEFNd3dlMDR4YzBk?=
 =?utf-8?B?ZlcyNmFDNWhnM21xMkFPN3NCV3NMY051U1dmTFF3b1I0ZjF2bHFOcDBybVMw?=
 =?utf-8?B?VWd1eE9TVUt2VC9Ga1VNNUh3aEd6alVmRDIzVU1ySnIzMi81K2Nob1J1WVBw?=
 =?utf-8?B?dlgzckFwQXZTRlJmWXgvdzBXSjZVL2sxR3RPcWZxNC93MG5KYnZhOHZVWUs0?=
 =?utf-8?B?SnpuelcxQ2YzeVRwaXcvTlEyWVNSMCszR1I4YmRISFNrMlVCMHlmY3BsaWE4?=
 =?utf-8?B?YU1JbU1QdEl4VFlMb0pvVTNBWC90cExZRE5yRi9HTXRRMnBIdG5DZzNuZVIv?=
 =?utf-8?B?TW5HT3JYQmwvZzd4T2dOUjFHSkZ4Z2pPa2ZsNitIQXlUR0VMR1ZDNTEraEU0?=
 =?utf-8?B?dUFFUVVWTjdweVMrbXEwS2xBNUNrM29SZGtOQWdQd2NHZGNZUGl4OHE2MzZl?=
 =?utf-8?B?cjlwN01yemVRTFNZMCsyY2gzZUVTa2ErYlR5UTJvemtpdXNaYnhCaG1vUnR5?=
 =?utf-8?B?NEVaemJzVllJL282MkVSemVGa1U3RVZ0SEpmU3N0R0E2T05qcHg0d2tSVkdC?=
 =?utf-8?B?dGJiY0puOXV2amV0RW42SE5HQzlWaEM5djhUb3NFbnVWNmF0UUc1dU9jU1FZ?=
 =?utf-8?B?b1RWME0xdWJIN0dyQUVpV1hCdW84ZCtodjhSclU5aHFoaDZwaHRkUGMzNmlC?=
 =?utf-8?B?N2ZiK2M1SHgraStlSEtSYTViRlRaRHE1TzFoS0h3c2JSNmVabmJudUpMcjNX?=
 =?utf-8?B?MXpaOUhMcVZrTjdnZFhRaGlZZUVNUEJhNCtlbzVoTjFCeDBlZjJBWm9UZDMx?=
 =?utf-8?B?b0hld3M0eHpodStxWm42U3MxbGp4bUtnL0ZKckhFVWgzVG5JaFlOekdTZXZ3?=
 =?utf-8?B?L2R0TXVhU1hLd0RpN0hzaFJ3TWluWWVldlRNUHdkWnA4NEhFb0xVQTR1YXlu?=
 =?utf-8?B?TWZsRVhCWVVvVzRxSnkvQnczdG9OMm93RmtCMWVXWFQ3RTd6NVlIZEJCWFNy?=
 =?utf-8?B?UnhOb0hRbjh3cGt2STRCTFhpaXVjYjBtZGVQL0VYSlppVEg4RlEzclZCYy9w?=
 =?utf-8?B?M3ZXQ0UzN0tLd3VKZGJuRVdKcW5IejVzWXNmRzNwWnl2ZkJicVJpUjhkSUZi?=
 =?utf-8?B?YXV6MXUwNndERjMvMmJVcngzY040blc0N0dFd2xIdFdoc2c4UWU4WWNieFhS?=
 =?utf-8?B?TE5oQ1NGRCt4cFF4NWJtU1hoSGJBS3ZvL296UHFwWi9mbmUyNlo3VEhTUEp2?=
 =?utf-8?B?TThwWnI4ZW5oR2czRHZxZUluMnpVRjdLTEhXdE1zK055ZW5Oa3hkZ0dGZGVL?=
 =?utf-8?B?ZE13cVgrT0JYMHMrejdTaFpFSkErNXdqMHZidE8xVnFoU1hwRlNrVC81Y3Bi?=
 =?utf-8?B?MW1FZTk4TTBWUDdEZ3lBcHZZQnkvVkkwRDRYbDBDMU1OYVdrQ2tYaVhValow?=
 =?utf-8?B?eFJodUV6eXhxVXRCWGJLU2NGYU9BRVFUY2NVT1doNXVrbmE3ckZqNDlRV0sz?=
 =?utf-8?B?b2VTNWh4QjRkcVFJU0tVTW94UUYyWDd3M0ZTM1g4V1ljSVFLOVk5MnZ0bFNJ?=
 =?utf-8?B?cXBQVHJ0MXZwcGxKZ3VrSVhDYnFIOXNUdnpmUVZ2SU92ejhNdkw2anJXYWd4?=
 =?utf-8?Q?XTQJwCsU87NJlur2jVCtOfswDmlsaVO0EdJhM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cE5mNWUvdDdVNFB5cFdpL0FLd2ZTdm0xdWJUSFJqN0ZKcStSWW5kazlDMU5P?=
 =?utf-8?B?TUV3c2xiMldBREJkV2t3d0hLMllYRFdUTnoweFl4K3hWKzdYTVp6aGdEaElT?=
 =?utf-8?B?USthVGxoSjVEV2ZUdExmRGIrQUc2V1hTZ01kT0IzcldsdlVJSGtIVklBQXND?=
 =?utf-8?B?ZFRKamVValdTc2hJanhaMkgrMS9obVJWZ0tEamhhTjRxRFdWeXdQelB6emZH?=
 =?utf-8?B?ZjJ2eXFZWnQ4c1FGWHhseU9jNWtpMFkxOTlrZldIQlRQcW12VkhJSnJaWWow?=
 =?utf-8?B?N0p1d2dwMlJ4ME1MUisybkQyM3lpSWNzNi82UVZWUzNhSmNJUTZLUnVKWjJ1?=
 =?utf-8?B?YXVxaTk5Z1p3TnJIenY5NVRXOTNReEFkU3hEaVkxQzJkUUNqS0RwcWNpNkps?=
 =?utf-8?B?ZjdkeFFMcG9EdFpUWWVKZEdpdm1zRDYrNDU2UWdsYlJJM2RCOXdpNENxaWFo?=
 =?utf-8?B?T21pTFNUQ09OVnB1UEluNFJwcitOUVJHSDQ0N3JpTjRyVzJ3QjljTjNlUnJF?=
 =?utf-8?B?U1d5Y2pEQWhUTzltck9hREUvVEswTkMvRXhKSWxjK0xFVTlqaHFiSHRBU1Ir?=
 =?utf-8?B?OXpnVTVOdWltaUlqRnhNL2VkMHpJRGVSK2ZQVm1mbzVBR2VyRjVDeE8yYkNm?=
 =?utf-8?B?aXZITHVXWGJiR1MzTitiOFg2Z2RVamlUSmpCdFowTWg5aHh6L3ZLK1F3akFH?=
 =?utf-8?B?QmJlTC84c3JCRFBhZkFGWlduOEJoV0J2QVAydjEwRjAwWmpBRjJ2REpLZmRT?=
 =?utf-8?B?bko0Y2g1c281UVB5eGxIaG9GbS9aRFk2VHkxcHUrVTV3N0RUbDJhRDRlcW1i?=
 =?utf-8?B?SDVPTE1tYWxqQnFyYXQ2Q0IvM09Ibm5pWXJSRUpMWS9hcWRsQUZ5YTFrUlZO?=
 =?utf-8?B?S280aDN1aTFndURNZ0o2NEJpK094MTVqRnM5SUV0d0ltMWxGYm12YWFkaXF0?=
 =?utf-8?B?Smd4QTRBN1lmWDR6MTZwWTd3Y3N4dlQ4Z2FNWmY5bWxXZ2E5TmlCVjdWZXor?=
 =?utf-8?B?NjhjQXhsdnpkdlZPeG55QjV3alVXRzRGQlpyQWpJejl3SEVFdm1QVjgyTzFF?=
 =?utf-8?B?WUVmbUpYVmRXcWQzM1RmTnBFUkdaYkp5VTlQMUMzZXZaczhHMFdzcnpNbjBz?=
 =?utf-8?B?UWU5VjNxWUZnYlgrbVQ5WTBLK25jekxBVlJLclpiNG1ZRU41SlJkNnBIUXVP?=
 =?utf-8?B?VWxwMmtFcG81VUJmYlVvMENORzQwNHh4ZnBvSTBjaVhyazNlYnRhNGptd2xx?=
 =?utf-8?B?R3lzcURWemdqQ3lsWU9XOFRCRFpXRXd3M0dkb0w0NDhFOXJZTU5sK0ExQTR2?=
 =?utf-8?B?MlFoY0FONHQ2M0Zxa0Y3VThoOUFPbk4vZUlUV0YxYlhlY2RyNjZhb2pCd015?=
 =?utf-8?B?S3l2TzVvd0taV2MyRUJQSGlQNFV0d3JJVytlQndBeXV6MklzV2dCenlUbDEy?=
 =?utf-8?B?OXUySzdrQXhBV2F4c0c5YkNZejA4MnNMOW5zQ1dKQTNlSjZReDd1OTN1TjA5?=
 =?utf-8?B?V1ZzT3l4UTRDQTZZMHY2alpld0x0ZktMV3dFWGMxQktDTTZJanJDZDR2R0J5?=
 =?utf-8?B?azhxeVY0S0FaTVdleklnZnFaS0h0NFRzRkJ4UDNZZmVQeit2T1NwanEwRkE5?=
 =?utf-8?B?RHA0Z2tSay9maU5CMHRsVC9jeC8xKzdaVmY0TjdJMkppZHFWem9QSDVuZUZI?=
 =?utf-8?B?Y3Q0cWF6RW5QUnc2UVhPbEVGcVptNXZud3R3NElxSGsrZUxoallGcHdPWFpi?=
 =?utf-8?B?Y3RMdXdZSlFlYkdZQzd5ci9iRkdobVd5YjhTb0J0aXlPU1hybXBXR2ZycFJB?=
 =?utf-8?B?WktRb29xRlpJeXlkY2xoa3VsVXMwM05Ya0VOeHFIcWxoV242Tjg1Y3JCeTlh?=
 =?utf-8?B?eXRZeW92dkVvNlV1ZFpIaUFUY2dveUllQ0kyR0lCdjRXUmgxMzgrQ0Y2NmQr?=
 =?utf-8?B?aW9VYU90SkxKQm05cHhiQ0dhRjE1L2wrL2w5MjBrUG1ndkc3UG1pRnEycE1C?=
 =?utf-8?B?TUtyWnd5WWFuVitpS0RMOFI4NVVrSlUvaFVKQTZpTWh0UTQ1Q1ZKc2pJSGg2?=
 =?utf-8?B?OWtuUWVCdyt2ZzluVmtjVFE2ZnV2TzQ2WjNqZTY4TFRpOWxjVW1UdHV2QlJ3?=
 =?utf-8?Q?QdlSeNZBl+vJPcOiNgHyebQks?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e12e32-a5db-4291-e1fd-08dd0a156776
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 10:15:20.2596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9tpLzGNWVkYCo21IQslTkOayuPxwkdT8nn/CJyIQis1n6bwC0c7+thkTasFaYhptxccTvNw30prAagHTNt4/2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5820
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGFybWEsIFN3YXRpMiA8c3dh
dGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTUsIDIwMjQg
MTo0NyBBTQ0KPiBUbzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRlbC5jb20+OyBpZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IDEvMl0gbGli
L2lndF9rbXM6IEFkZCA2ayByZXNvbHV0aW9uIHN1cHBvcnQgZm9yIGEgc2luZ2xlDQo+IENSVEMN
Cj4gDQo+IEhpIEplZXZhbiwNCj4gDQo+IE9uIDEyLTExLTIwMjQgMTA6MDQgcG0sIEplZXZhbiBC
IHdyb3RlOg0KPiA+IGluY3JlYXNlIGJpZ19qb2luZXIgbGltaXRhdGlvbiB0byA2ayBmcm9tIDVr
IGZvciBkaXNwbGF5IHZlcnNpb24NCj4gPiBncmVhdGVyIHRoYW4gMzAuDQo+ID4NCj4gPiBCc3Bl
YzogNjg4NTgNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gICBsaWIvaWd0X2ttcy5jIHwgMjIgKysrKysrKysrKysrKyst
LS0tLS0tLQ0KPiA+ICAgbGliL2lndF9rbXMuaCB8ICA1ICsrKy0tDQo+ID4gICAyIGZpbGVzIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5jIGluZGV4IDVkODA5NmExNy4uY2E3
ZjkwY2E4DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2lndF9rbXMuYw0KPiA+ICsrKyBiL2xp
Yi9pZ3Rfa21zLmMNCj4gPiBAQCAtNjMzMCw2ICs2MzMwLDcgQEAgaW50IGlndF9nZXRfbWF4X2Rv
dGNsb2NrKGludCBmZCkNCj4gPg0KPiA+ICAgLyoqDQo+ID4gICAgKiBpZ3RfYmlnam9pbmVyX3Bv
c3NpYmxlOg0KPiA+ICsgKiBAZmQ6IGRybSBmaWxlIGRlc2NyaXB0b3INCj4gPiAgICAqIEBtb2Rl
OiBsaWJkcm0gbW9kZQ0KPiA+ICAgICogQG1heF9kb3RjbG9jazogTWF4IHBpeGVsIGNsb2NrIGZy
ZXF1ZW5jeQ0KPiA+ICAgICoNCj4gPiBAQCAtNjMzOCwxMCArNjMzOSwxMyBAQCBpbnQgaWd0X2dl
dF9tYXhfZG90Y2xvY2soaW50IGZkKQ0KPiA+ICAgICoNCj4gPiAgICAqIFJldHVybnM6IFRydWUg
aWYgbW9kZSByZXF1aXJlcyBCaWdqb2luZXIsIGVsc2UgRmFsc2UuDQo+ID4gICAgKi8NCj4gPiAt
Ym9vbCBpZ3RfYmlnam9pbmVyX3Bvc3NpYmxlKGRybU1vZGVNb2RlSW5mbyAqbW9kZSwgaW50IG1h
eF9kb3RjbG9jaykNCj4gPiArYm9vbCBpZ3RfYmlnam9pbmVyX3Bvc3NpYmxlKGludCBmZCwgZHJt
TW9kZU1vZGVJbmZvICptb2RlLCBpbnQNCj4gPiArbWF4X2RvdGNsb2NrKQ0KPiA+ICAgew0KPiA+
IC0JcmV0dXJuIChtb2RlLT5oZGlzcGxheSA+IE1BWF9IRElTUExBWV9QRVJfUElQRSB8fA0KPiA+
IC0JCW1vZGUtPmNsb2NrID4gbWF4X2RvdGNsb2NrKTsNCj4gPiArCWludCBtYXhfaGRpc3BsYXks
IGRldl9pZDsNCj4gPiArCWRldl9pZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZmQpOw0KPiA+ICsJ
bWF4X2hkaXNwbGF5ID0gKGludGVsX2Rpc3BsYXlfdmVyKGRldl9pZCkgPj0gMzApID8NCj4gSERJ
U1BMQVlfNktfUEVSX1BJUEUgOg0KPiA+ICsNCj4gSERJU1BMQVlfNUtfUEVSX1BJUEU7DQo+ID4g
KwlyZXR1cm4gKG1vZGUtPmhkaXNwbGF5ID4gbWF4X2hkaXNwbGF5IHx8IG1vZGUtPmNsb2NrID4N
Cj4gPiArbWF4X2RvdGNsb2NrKTsNCj4gPiAgIH0NCj4gPg0KPiA+ICAgLyoqDQo+ID4gQEAgLTYz
NjIsMTAgKzYzNjYsMTAgQEAgYm9vbCBiaWdqb2luZXJfbW9kZV9mb3VuZChpbnQgZHJtX2ZkLA0K
PiBkcm1Nb2RlQ29ubmVjdG9yICpjb25uZWN0b3IsDQo+ID4gICAJYm9vbCBmb3VuZCA9IGZhbHNl
Ow0KPiA+DQo+ID4gICAJaWd0X3NvcnRfY29ubmVjdG9yX21vZGVzKGNvbm5lY3Rvciwgc29ydF9k
cm1fbW9kZXNfYnlfcmVzX2RzYyk7DQo+ID4gLQlmb3VuZCA9IGlndF9iaWdqb2luZXJfcG9zc2li
bGUoJmNvbm5lY3Rvci0+bW9kZXNbMF0sIG1heF9kb3RjbG9jayk7DQo+ID4gKwlmb3VuZCA9IGln
dF9iaWdqb2luZXJfcG9zc2libGUoZHJtX2ZkLCAmY29ubmVjdG9yLT5tb2Rlc1swXSwNCj4gPiAr
bWF4X2RvdGNsb2NrKTsNCj4gPiAgIAlpZiAoIWZvdW5kKSB7DQo+ID4gICAJCWlndF9zb3J0X2Nv
bm5lY3Rvcl9tb2Rlcyhjb25uZWN0b3IsDQo+IHNvcnRfZHJtX21vZGVzX2J5X2Nsa19kc2MpOw0K
PiA+IC0JCWZvdW5kID0gaWd0X2JpZ2pvaW5lcl9wb3NzaWJsZSgmY29ubmVjdG9yLT5tb2Rlc1sw
XSwNCj4gbWF4X2RvdGNsb2NrKTsNCj4gPiArCQlmb3VuZCA9IGlndF9iaWdqb2luZXJfcG9zc2li
bGUoZHJtX2ZkLCAmY29ubmVjdG9yLT5tb2Rlc1swXSwNCj4gPiArbWF4X2RvdGNsb2NrKTsNCj4g
PiAgIAl9DQo+ID4gICAJaWYgKGZvdW5kKQ0KPiA+ICAgCQkqbW9kZSA9IGNvbm5lY3Rvci0+bW9k
ZXNbMF07DQo+ID4gQEAgLTYzODQsNyArNjM4OCw3IEBAIGJvb2wgYmlnam9pbmVyX21vZGVfZm91
bmQoaW50IGRybV9mZCwNCj4gZHJtTW9kZUNvbm5lY3RvciAqY29ubmVjdG9yLA0KPiA+ICAgICov
DQo+ID4gICBib29sIGlndF91bHRyYWpvaW5lcl9wb3NzaWJsZShkcm1Nb2RlTW9kZUluZm8gKm1v
ZGUsIGludCBtYXhfZG90Y2xvY2spDQo+ID4gICB7DQo+ID4gLQlyZXR1cm4gKG1vZGUtPmhkaXNw
bGF5ID4gMiAqIE1BWF9IRElTUExBWV9QRVJfUElQRSB8fA0KPiA+ICsJcmV0dXJuIChtb2RlLT5o
ZGlzcGxheSA+IDIgKiBIRElTUExBWV81S19QRVJfUElQRSB8fA0KPiA+ICAgCQltb2RlLT5jbG9j
ayA+IDIgKiBtYXhfZG90Y2xvY2spOw0KPiANCj4gSXMgdGhlcmUgYW55IGNoYW5nZSBpbiB1bHRy
YSBqb2luZXIgY29uZGl0aW9uPw0KWWVzLCBKb2luZXIgd2FzIGVhcmxpZXIgc2V0IGZvciA1ayBm
cm9tIGxubCsgaXRzIDZrLiANCj4gDQo+ID4gICB9DQo+ID4NCj4gPiBAQCAtNjU0OSw3ICs2NTUz
LDggQEAgYm9vbCBpZ3RfY2hlY2tfYmlnam9pbmVyX3N1cHBvcnQoaWd0X2Rpc3BsYXlfdA0KPiAq
ZGlzcGxheSkNCj4gPiAgIAkgKiAgLSBjdXJyZW50ICYgcHJldmlvdXMgY3J0Y3MgYXJlIGNvbnNl
Y3V0aXZlDQo+ID4gICAJICovDQo+ID4gICAJZm9yIChpID0gMDsgaSA8IHBpcGVzX2luX3VzZTsg
aSsrKSB7DQo+ID4gLQkJaWYgKHBpcGVzW2ldLmZvcmNlX2pvaW5lciB8fCBpZ3RfYmlnam9pbmVy
X3Bvc3NpYmxlKHBpcGVzW2ldLm1vZGUsDQo+IG1heF9kb3RjbG9jaykpIHsNCj4gPiArCQlpZiAo
cGlwZXNbaV0uZm9yY2Vfam9pbmVyIHx8IGlndF9iaWdqb2luZXJfcG9zc2libGUoZGlzcGxheS0+
ZHJtX2ZkLA0KPiBwaXBlc1tpXS5tb2RlLA0KPiA+ICsJCSAgICBtYXhfZG90Y2xvY2spKSB7DQo+
ID4gICAJCQlpZ3RfaW5mbygicGlwZS0lcy0lczogKE1heCBkb3QtY2xvY2s6ICVkIEtIeiksIGZv
cmNlDQo+IGpvaW5lcjogJXNcbiIsDQo+ID4gICAJCQkJIGttc3Rlc3RfcGlwZV9uYW1lKHBpcGVz
W2ldLmlkeCksDQo+ID4gICAJCQkJIGlndF9vdXRwdXRfbmFtZShwaXBlc1tpXS5vdXRwdXQpLCBA
QCAtNjU3Niw3DQo+ICs2NTgxLDggQEAgYm9vbA0KPiA+IGlndF9jaGVja19iaWdqb2luZXJfc3Vw
cG9ydChpZ3RfZGlzcGxheV90ICpkaXNwbGF5KQ0KPiA+ICAgCQkJfQ0KPiA+ICAgCQl9DQo+ID4N
Cj4gPiAtCQlpZiAoKGkgPiAwKSAmJiAocGlwZXNbaSAtIDFdLmZvcmNlX2pvaW5lciB8fA0KPiBp
Z3RfYmlnam9pbmVyX3Bvc3NpYmxlKHBpcGVzW2kgLSAxXS5tb2RlLCBtYXhfZG90Y2xvY2spKSkg
ew0KPiA+ICsJCWlmICgoaSA+IDApICYmIChwaXBlc1tpIC0gMV0uZm9yY2Vfam9pbmVyIHx8DQo+
IGlndF9iaWdqb2luZXJfcG9zc2libGUoZGlzcGxheS0+ZHJtX2ZkLA0KPiA+ICsJCSAgICBwaXBl
c1tpIC0gMV0ubW9kZSwgbWF4X2RvdGNsb2NrKSkpIHsNCj4gPiAgIAkJCWlndF9pbmZvKCJwaXBl
LSVzLSVzOiAoTWF4IGRvdC1jbG9jazogJWQgS0h6KSwgZm9yY2UNCj4gam9pbmVyOiAlc1xuIiwN
Cj4gPiAgIAkJCQkga21zdGVzdF9waXBlX25hbWUocGlwZXNbaSAtIDFdLmlkeCksDQo+ID4gICAJ
CQkJIGlndF9vdXRwdXRfbmFtZShwaXBlc1tpIC0gMV0ub3V0cHV0KSwgZGlmZiAtLWdpdA0KPiA+
IGEvbGliL2lndF9rbXMuaCBiL2xpYi9pZ3Rfa21zLmggaW5kZXggYmQxNTRkMWMxLi5hMWQyYjg2
MzIgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2lndF9rbXMuaA0KPiA+ICsrKyBiL2xpYi9pZ3Rfa21z
LmgNCj4gPiBAQCAtMTQ2LDcgKzE0Niw4IEBAIGNvbnN0IGNoYXIgKmttc3Rlc3Rfc2NhbGluZ19m
aWx0ZXJfc3RyKGludCBmaWx0ZXIpOw0KPiA+ICAgY29uc3QgY2hhciAqa21zdGVzdF9kc2Nfb3V0
cHV0X2Zvcm1hdF9zdHIoaW50IG91dHB1dF9mb3JtYXQpOw0KPiA+DQo+ID4gICB2b2lkIGttc3Rl
c3RfZHVtcF9tb2RlKGRybU1vZGVNb2RlSW5mbyAqbW9kZSk7IC0jZGVmaW5lDQo+ID4gTUFYX0hE
SVNQTEFZX1BFUl9QSVBFIDUxMjANCj4gPiArI2RlZmluZSBIRElTUExBWV82S19QRVJfUElQRSA2
MTQ0DQo+ID4gKyNkZWZpbmUgSERJU1BMQVlfNUtfUEVSX1BJUEUgNTEyMA0KPiA+DQo+ID4gICBp
bnQga21zdGVzdF9nZXRfcGlwZV9mcm9tX2NydGNfaWQoaW50IGZkLCBpbnQgY3J0Y19pZCk7DQo+
ID4gICB2b2lkIGttc3Rlc3Rfc2V0X3Z0X2dyYXBoaWNzX21vZGUodm9pZCk7DQo+ID4gQEAgLTEy
MzgsNyArMTIzOSw3IEBAIHZvaWQgaWd0X3NvcnRfY29ubmVjdG9yX21vZGVzKGRybU1vZGVDb25u
ZWN0b3INCj4gKmNvbm5lY3RvciwNCj4gPiAgIGJvb2wgaWd0X21heF9icGNfY29uc3RyYWludChp
Z3RfZGlzcGxheV90ICpkaXNwbGF5LCBlbnVtIHBpcGUgcGlwZSwNCj4gPiAgIAkJaWd0X291dHB1
dF90ICpvdXRwdXQsIGludCBicGMpOw0KPiA+ICAgaW50IGlndF9nZXRfbWF4X2RvdGNsb2NrKGlu
dCBmZCk7DQo+ID4gLWJvb2wgaWd0X2JpZ2pvaW5lcl9wb3NzaWJsZShkcm1Nb2RlTW9kZUluZm8g
Km1vZGUsIGludCBtYXhfZG90Y2xvY2spOw0KPiA+ICtib29sIGlndF9iaWdqb2luZXJfcG9zc2li
bGUoaW50IGZkLCBkcm1Nb2RlTW9kZUluZm8gKm1vZGUsIGludA0KPiA+ICttYXhfZG90Y2xvY2sp
Ow0KPiA+ICAgYm9vbCBiaWdqb2luZXJfbW9kZV9mb3VuZChpbnQgZHJtX2ZkLCBkcm1Nb2RlQ29u
bmVjdG9yICpjb25uZWN0b3IsDQo+ID4gICAJCQkgIGludCBtYXhfZG90Y2xvY2ssIGRybU1vZGVN
b2RlSW5mbyAqbW9kZSk7DQo+ID4gICBib29sIGlndF91bHRyYWpvaW5lcl9wb3NzaWJsZShkcm1N
b2RlTW9kZUluZm8gKm1vZGUsIGludA0KPiA+IG1heF9kb3RjbG9jayk7DQo=

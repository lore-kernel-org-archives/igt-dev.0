Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE5BE77173
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 08:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C40910E665;
	Mon,  9 Dec 2024 08:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBls+Bcv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806C210E5A1;
 Mon,  9 Dec 2024 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733732690; x=1765268690;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GHzY5eqZo0ZO28EvO65komxa/wh4TlcYf7DKIfMEkHM=;
 b=KBls+BcvutkRBMyWSy5pF6sVMwxPEuOg4S4QB1py4ntFUNVBerDO2aRd
 jd7WX0WGoLAcI2f0tEEppWRVX/I0yPMBJpSWWgNWCh7RfgEuL5rd/Dsrq
 gtbfQyzHxo7c5nQjWzBZjB3Z5DQpDbccn9bLolKp24sM/m9+yjv9jChVA
 9bWgDKAruJynjCBNgFAP1Ox/desox8h7RerFnCaWV+wYt7EK6kG12/4jf
 OSnoyzQZrA2pO13E4AtLrS3TuqMPK2yfwVs3CUPaDJbsOxqKUduZSXqL3
 nYMZUJIxPiROX9iKOQ6pd/RJZ5LASoDK1cEfCTwGOSWZIqrT88B9JRPzp w==;
X-CSE-ConnectionGUID: Jbg6yva3SSiwei8wrKOYWA==
X-CSE-MsgGUID: SynksyyITbm1D8avQHFZRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33351290"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="33351290"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:24:49 -0800
X-CSE-ConnectionGUID: mJ8wtJEpSFOsUWopuzX93w==
X-CSE-MsgGUID: RS8tkOIpTjKwfqWMxs2XcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="99820425"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 00:24:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 00:24:48 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 00:24:48 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 00:24:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFhe24IajehurG9yTB6Z8nmBY5zSPXEZjMih5+B5HvyRCVb8ajP4TJzjtFe447GH6e8KkRQsazBfms0Q+AFcY2FO2xz33VkMDk8cTXMEDhG5JshIGUR6cFkXAFMyfls8r+rbEEvsc9KoA+KtMIOmOCCbXzh0SEs+wyM9bM3pGGVcj3P7HNpsI8wefZbWKvCHH1t3mPkweceT833UGzyXsc6/j7DRm/7fpLNkfZkoJVDohJn5pb4Fk1LVrdieB5KvB56WlxU5hlLwNSQ0VhbHxRcJg9kzUZnslJiEKTFk9BeymQ7wZj0hJw+nH6vUk8a62MboGbK32E/0EiMqHcJrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHzY5eqZo0ZO28EvO65komxa/wh4TlcYf7DKIfMEkHM=;
 b=pgW9mSLjaycLuekBg8/djGBj5UZd8mlAJsz2pDYH0rfrnb9MaiCBmIHqAMIWcrsIfjWAPXKk/kV3jZQr2iV3J/HknbOI8sFy28HXlWWvmqq8KPcAk45dEbPFYQKkhsonrjYOfiycTR+NCMsiKevvRx1+TKznep6M7DAL3nNkteOpqZKgTcXj+zDUm2WRjEKexB5EGj2pZSlqFaaXKKB1HHgtxy6lzuu6jb+xFO/OReLjGAIJqNx/yCEocucfg+0tk/WeMzfDZ9nHQiNtvjd3YOKwip4XxTk+921Ygz37DSLXXJ3Gs1tlz1zD6KraZGRzreOawo8Fs+1LoWMJI4xc8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 08:24:45 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%5]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 08:24:45 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL3hlX2V4ZWNf?=
 =?utf-8?Q?sip:_increase_timeout_margin_for_tests_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMveGVfZXhlY19zaXA6?=
 =?utf-8?Q?_increase_timeout_margin_for_tests_(rev2)?=
Thread-Index: AQHbR79SzI4RjBR3Xk+2DTe4gl9YR7Ldk3aAgAAElbA=
Date: Mon, 9 Dec 2024 08:24:45 +0000
Message-ID: <DM8PR11MB565537391E5530248DB8BCEDE03C2@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20241206-xe_exec_sip_eudebug_increase_timeout_for_devcoredump-v1-1-6736edd67447@intel.com>
 <173347647747.3262721.3363965532552159085@b555e5b46a47>
 <9f0fb410-f5ec-4ac7-a73e-43379f1bc974@intel.com>
In-Reply-To: <9f0fb410-f5ec-4ac7-a73e-43379f1bc974@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SJ1PR11MB6201:EE_
x-ms-office365-filtering-correlation-id: c19963c8-c1d5-4042-1c6c-08dd182af062
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NGhQWnN2S1V6VFhDZ3dNdW9oMG5STUF6cHQ5a1hjd0JFMU8yLytDWndrY0hZ?=
 =?utf-8?B?Q2VHS3FOV3dnUjEwWk43aFpTaE0zbkRNKzhWRkZJSlZab2VxUk1UVzBaRXZW?=
 =?utf-8?B?dko0WHVOTUhJYk55MERkZ3plWFFiS3hsTHMvcDk1cUZPMU1LSkhHMXNLT0oz?=
 =?utf-8?B?cmY3Tkk1NlhnbUg5S1lvcGdzZ0tFQUljQXd0Z3FENktmenM2YktkbFNOU3Ns?=
 =?utf-8?B?ZjhCMllNQ1hzK0x1bDJEQ3ZVaVlCa1pmT2xSZkwrS05BdzcyYiswRkJ1dTds?=
 =?utf-8?B?VkJZTC8zRHYyRjRTV096RGJ6enJUY1NYOGJ2Wk5OZUZGdzU5RWZSQjU0WXBI?=
 =?utf-8?B?L0VLYU02R2NaaUV2SXhVUnRxZll6ZzJ0VFBWTXIrbk5Zb2Znc1JuVWxaUVow?=
 =?utf-8?B?eXczZEdSQlVIVzZZV0pTR05RWGYwVUN0KzhiejhJNXZHVlpwWEhZekhiRm5x?=
 =?utf-8?B?ZzZsTmN1VFhhRWRabzRIbEFDYjJUaTkybHJRcjh4UURzZE10TlFwUFEvU1dG?=
 =?utf-8?B?TkNTeEVoTU91RE1OcUdBQjBHWWVtdWtsSjZnVmxzcWROSzU0YThPNUl0L2xQ?=
 =?utf-8?B?MzgwUUlTSEtweE1sTFY2LzBObU4yWis5V3BqcEhuZkE1Ykt3aGRpN0hZcWJK?=
 =?utf-8?B?QjZOMkoycmwrVmp3dHo3YmQveGYxSEVoT3Rja0RvbHE1YWtldWU3RzRxZHU4?=
 =?utf-8?B?ODVNbVF4QUExcXpEZ1U1VG05NTNEZ2hNaW5OSE9pMzF6V1Ywb0JqOW5YYytx?=
 =?utf-8?B?UnRlWVVqUzZYUitVSit3dVU2b1FMVXRhaldmWnJ2WmVVcnhlTGtNckltYmtS?=
 =?utf-8?B?cW1qTFFJUk9TM01UVU5WMExMUGtFOGYrTnlNR1R2aytFUno4NjU1NXJxblZB?=
 =?utf-8?B?ZTFIL3h5NURHalJiYmJPdU1BOFpOaEdRek1DV3B3b2FuZkNzdW51dytzM1VI?=
 =?utf-8?B?ajIzQzJhdmJHRVVXTENqTzdKYnZGRHhyNnNuMWZCTDZ5anMzalFVQWNPbTdp?=
 =?utf-8?B?bUlOMDFOdUZiWkVJTGMyKzc1aXNvS2NWb3ZKR09sSVNrNC9qTW4xQUNmTUEr?=
 =?utf-8?B?OE9ld1o1MlVqcnBWaDhKd0NMdmNxYVZSdjNRdGVSRkNiK3lKL1RFWGk0RCs3?=
 =?utf-8?B?dEYzNS9LbklWUEExOFZqQWZoMEVPd0E0UU13RkdmbVFNWE11dDNSNnhLdVJW?=
 =?utf-8?B?UE54bEdFWFhpeWg3eDVEQXBEdGdsNU4wSmJOOExsenFTUUlTd0VCQ3FTcnlI?=
 =?utf-8?B?UUpMMUxoMHlhUWNzZC9tb203TDFRUDlxZWRKZVlQTzNaMlBzZVBYaS9kbnRQ?=
 =?utf-8?B?UHlGMWRwSmd5UEFab1RDeTVqTS9aOGpSdHY3UUR1TExob0w2MHMrU1JlY2lQ?=
 =?utf-8?B?S1lnMDZpaHFpcU5sM1IyR2JTRE1YWnJMR3ptbk0rVlpleGlzUm9xNjFXMEtE?=
 =?utf-8?B?QW9pRmthZGtHZ09kWGFpSnp0Umt6NEdMK3IxTm10RENYR0xqNDFIRHlIR0dS?=
 =?utf-8?B?NFFKNlY2bTROVjRGdkRFcFZsckxuTEJ2cTJoalBGMVhkQ2t0ZGlxS3FJM24w?=
 =?utf-8?B?N3lxR0ovUWo5TXJtSktvWitqNUhPVXRSZVdKd0Q0R2hGWnovaUFtaU5ZbmlU?=
 =?utf-8?B?dVFrQThFdHJMR1RUajZUejFXUUlyYU9XRDZpY3FVc2paekV0a1k4NXlFSFAx?=
 =?utf-8?B?bnZQVndQYkhoUkpGWTc5RU0yRElXdVcxNWNVNWZBWGtEY1JUNzQwdlNzcUZz?=
 =?utf-8?B?TXVWc1JpVTJYU1VlZnM1T1BFRDRCakg3cVF1bk43cTR5WGlpTFo1RkNtWk5X?=
 =?utf-8?Q?kXDFopv6+bm9mmLmbOxmuvxgLBVP/mB/IYnUA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWJncHU5Ym8rWWROc3ZHNFkvS1VTT2NQK0FQWGl2dlBGUGZEV3o3K2dNNVZO?=
 =?utf-8?B?aTRBcUhJNFpDc3hMbURHR1VmNXNjdVV5WmlmQ0lJV0d2QXhGdUZid0dVeTJj?=
 =?utf-8?B?UnpNM2U3bWRGMTFCYkp1cHduQ3YvdFVpRC9uVitTWmU2WTJ5QnB4cmM0aHlP?=
 =?utf-8?B?UWhyc1VRd3hPSDA1bjkzNHNQYXhrMk5XRHpqbkhkaDVwVzNkM1o4TWdUd3I0?=
 =?utf-8?B?eFNWNzRjRm5kRzAvLzZTVzVxVmNTamtOQk9QdGxiQ0NUcDdtTEwrWFo4QzNP?=
 =?utf-8?B?c0VIU0xUbG82UGlHYkNaUFJ4djVQQzhmOUFhSmliYk54L2hKL0p0clJxNE1R?=
 =?utf-8?B?WERndE85MGVvYmxJWU94aVd2MkhDVkZJSm9yTjNHdFZTMDE5dk5ZdjhTYjFW?=
 =?utf-8?B?Q3IxMS9NZXU0Rzc3RGtkWjRuUGVYcUVXamliWWNLVEI4VVF5UkJ3TzEzbHVi?=
 =?utf-8?B?MDZlSXROZ0RjZ2hpVmRVdXhlVExINWJsQ0dmRVdNbXNuYndDUmhyaEJHemVh?=
 =?utf-8?B?U2E4NHdjc0hUa0w2Z2FWeVBXR3YvTy9KdDQyY1B1UW9SYVZJTGFCZnZQUlBR?=
 =?utf-8?B?OHByelY0THB4R2R6UVNYWmw1YWtydjZ6RVc1V2tjalZlWXNXM1pWTGxFbFVN?=
 =?utf-8?B?dC9saUhpbjlKbTl1OFBBWDVYUzlHeGNURVZPOWVYQ0trYndvVDl3RmlkR1FF?=
 =?utf-8?B?Vk5rOUlxNjFkNG5RbUMyR24vTnZiaEpWUDFJNUVnU0dwb3RUOUNoOUg4QmpH?=
 =?utf-8?B?WWxWRkh0NmszRFA0VGRiditicEwyYldZQWlXZzhsS3pmVkdyVWxmd1hpcjBr?=
 =?utf-8?B?MlRaUFJVYnNIREs0cHZvMGlYaFp4RkFBWnZROUg1dVlPWGxUNkdGcFBNSnBv?=
 =?utf-8?B?MHllWjZrUy92cjByWDlxUjVCejJJVnJQMHFUd2sxaDBvaG1zQ1FtVFJ4NTlO?=
 =?utf-8?B?VzZ6UkhtWHl5WnZPVFNVNHV2b0sydkNYTHNqVGhlc2UrSmFCZ1FWeE5BNVJN?=
 =?utf-8?B?SGJpaTQzMUsyVDhQWjB1aGJtSzFDN05pOUFFK0x0clo3Mi9BMlhMdm9WUW40?=
 =?utf-8?B?SmJ0cU1vWEJWUXNRN3hTS0Q5ZG5pQ1NLK3htQ0pqei9JVm1tRkRkK0k5QlZO?=
 =?utf-8?B?RmVLcWZHK29SYitGR0RQL2RKZzlrbGlEYndEak1iTi84Ukk1c0lUbnBrVkJ0?=
 =?utf-8?B?SkF4Nk9vYk9vN2kzVGJYUkNDaW5nNGEyY29uMkJQd1BxZm9YNks0a0RYbS80?=
 =?utf-8?B?VC83em5rWUZmMGh5c0RtMktjRFlyWDNUakNrWVhpOE50aVpCYlRocjI4STJ4?=
 =?utf-8?B?K0lvUHBoSDI2SUJMV1JiWUpmSHFORDlYMHdudU5hUWo5M1dOVmpodzlpa1Fl?=
 =?utf-8?B?eXk4cUhCRHQzNmdMZUZDMlpiclF4UE5ma3hzQitwemdJNzNTbERKNzltemZm?=
 =?utf-8?B?ZE5YWWNRQy9rTWhkOVZkQkJpQ3MxRDFIQUYxSzdubEZYejBmTktENUJDWUxn?=
 =?utf-8?B?akJEV2hnbHdkb3NjR3M0VkdGUitRZTFPUUR3Nlg2WWhNVUdDb3Z0NnhYR3hU?=
 =?utf-8?B?RlFlMEUxbzVzOFJQaWQyNGViSWZCRTJYaGJqY0lJN3ozZlhCMUg0VFRlQmRs?=
 =?utf-8?B?N0JqVVFLdzB3TkRFSy9tMXEzdk5KZXFSYUx1ck1uOEQyVVhqVUNGdTkySGt1?=
 =?utf-8?B?V25mdXduNXB1eW9DZEVKd2pJR0dtUlg5YVRpYzErSS9EYTBORDlySWtBQTJm?=
 =?utf-8?B?ZDBTN29RcUk0Zmw3dkNxVWRuZDhlRmpicW1RRThScjJmcmQxcDlPTjVZakxZ?=
 =?utf-8?B?QVBzeDJhNlBFQy9QcWkvVEwzellVeEgreStFU2VEOHVuWktKSVJaMkZpTE9n?=
 =?utf-8?B?UzFRNkZFZlo3Ny9GbUpEcTNnekpyZEpleWN5SnNnSDM3QzZZM2I4bDhXTFpx?=
 =?utf-8?B?YnBkblJHM014N3dsTE1SSzNRa2JiUE9RTnA1MXFkSElDc1krN1ZNS0c0K1d2?=
 =?utf-8?B?QS9hN29lYlZvSURreDNHSWdHQTdMZXF0RUdQUDFUSlM1K3N1WUlUbUZvR1Zi?=
 =?utf-8?B?Z1ZBdlhtT2lkUms3UUNyK3pxNmExWHF3UnZBRDRMUFJZWHZkYTNRbC9SekVp?=
 =?utf-8?Q?YsPUOYP58957bpmdS63bE2V+x?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19963c8-c1d5-4042-1c6c-08dd182af062
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 08:24:45.6615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcNGbLe7ho3Cwe5pa9Z7v6WGL9l7Frc7WHHNtwfJIOckrIU0yHxonLrBz9VATWvzRQq475rIJ+y8Kwq2/oWdeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSGFqZGEsDQo+
IEFuZHJ6ZWoNCj4gU2VudDogTW9uZGF5LCA5IERlY2VtYmVyIDIwMjQgMTAuMDgNCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBTdWJqZWN0OiBSZTog4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv
eGVfZXhlY19zaXA6IGluY3JlYXNlIHRpbWVvdXQgbWFyZ2luDQo+IGZvciB0ZXN0cyAocmV2MikN
Cj4gDQo+IA0KPiBXIGRuaXUgMDYuMTIuMjAyNCBvwqAxMDoxNCwgUGF0Y2h3b3JrIHBpc3plOg0K
PiA+IFByb2plY3QgTGlzdCAtIFBhdGNod29yayAqUGF0Y2ggRGV0YWlscyoNCj4gPiAqU2VyaWVz
OiogCXRlc3RzL3hlX2V4ZWNfc2lwOiBpbmNyZWFzZSB0aW1lb3V0IG1hcmdpbiBmb3IgdGVzdHMg
KHJldjIpDQo+ID4gKlVSTDoqIAlodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2Vy
aWVzLzEzOTg4OS8NCj4gPiAqU3RhdGU6KiAJZmFpbHVyZQ0KPiA+ICpEZXRhaWxzOioNCj4gPiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMjI2NC9pbmRl
eC5odG1sDQo+ID4NCj4gPg0KPiA+ICAgQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBYRUlHVF84
MTQxX0JBVCAtPiBYRUlHVFBXXzEyMjY0X0JBVA0KPiA+DQo+ID4NCj4gPiAgICAgU3VtbWFyeQ0K
PiA+DQo+ID4gKkZBSUxVUkUqDQo+ID4NCj4gPiBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21p
bmcgd2l0aCBYRUlHVFBXXzEyMjY0X0JBVCBhYnNvbHV0ZWx5DQo+IG5lZWQNCj4gPiB0byBiZSB2
ZXJpZmllZCBtYW51YWxseS4NCj4gPg0KPiA+IElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hh
bmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiA+IGludHJvZHVjZWQg
aW4gWEVJR1RQV18xMjI2NF9CQVQsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbQ0KPiA+IChJ
OTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbSB0byBkb2N1
bWVudCB0aGlzDQo+ID4gbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2Ug
cG9zaXRpdmVzIGluIENJLg0KPiA+DQo+ID4NCj4gPiAgICAgUGFydGljaXBhdGluZyBob3N0cyAo
OCAtPiA4KQ0KPiA+DQo+ID4gTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+ID4N
Cj4gPg0KPiA+ICAgICBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+ID4NCj4gPiBIZXJlIGFyZSB0aGUg
dW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluDQo+ID4gWEVJ
R1RQV18xMjI2NF9CQVQ6DQo+ID4NCj4gPg0KPiA+ICAgICAgIElHVCBjaGFuZ2VzDQo+ID4NCj4g
Pg0KPiA+ICAgICAgICAgUG9zc2libGUgcmVncmVzc2lvbnMNCj4gPg0KPiA+ICAgKiBpZ3RAa21z
X2ZsaXBAYmFzaWMtZmxpcC12cy1kcG1zQGEtZWRwMToNCj4gPiAgICAgICBvIGJhdC1sbmwtMTog
UEFTUw0KPiA+ICAgICAgICAgPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVs
LXhlL0lHVF84MTQxL2JhdC1sbmwtDQo+IDEvaWd0QGttc19mbGlwQGJhc2ljLWZsaXAtdnMtZHBt
c0BhLWVkcDEuaHRtbD4NCj4gPiAgICAgICAgIC0+IERNRVNHLVdBUk4NCj4gPiAgICAgICAgIDxo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMjI2NC9iYXQt
bG5sLQ0KPiAxL2lndEBrbXNfZmxpcEBiYXNpYy1mbGlwLXZzLWRwbXNAYS1lZHAxLmh0bWw+DQo+
ID4gICAgICAgICArMSBvdGhlciB0ZXN0IGRtZXNnLXdhcm4NClRoaXMgaXMgaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvaXNzdWVzLzM3MjkgDQoNCj4gPg0KPiAN
Cj4gQWxsIHJlZ3Jlc3Npb25zICh0aGlzIGFuZCBuZXh0IGVtYWlscykgcmVwb3J0ZWQgZm9yIHRo
aXMgcGF0Y2ggYXJlDQo+IG9idmlvdXNseSBub3QgcmVsYXRlZCAtIHRoZSBwYXRjaCB0b3VjaGVz
IG9ubHkgeGVfZXhlY19zaXBfZXVkZWJ1ZyB0ZXN0cy4NCj4gDQo+IA0KPiBSZWdhcmRzDQo+IA0K
PiBBbmRyemVqDQo+IA0KPiANCj4gPiAgKg0KPiA+DQo+ID4NCj4gPiAgICAgS25vd24gaXNzdWVz
DQo+ID4NCj4gPiBIZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiBYRUlHVFBXXzEyMjY0X0JB
VCB0aGF0IGNvbWUgZnJvbSBrbm93bg0KPiA+IGlzc3VlczoNCj4gPg0KPiA+DQo+ID4gICAgICAg
SUdUIGNoYW5nZXMNCj4gPg0KPiA+DQo+ID4gICAgICAgICBQb3NzaWJsZSBmaXhlcw0KPiA+DQo+
ID4gICAqIGlndEBrbXNfY3Vyc29yX2xlZ2FjeUBiYXNpYy1mbGlwLWJlZm9yZS1jdXJzb3ItdmFy
eWluZy1zaXplOg0KPiA+ICAgICAgIG8gYmF0LWxubC0xOiBETUVTRy1XQVJODQo+ID4gICAgICAg
ICA8aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUvSUdUXzgxNDEvYmF0
LWxubC0NCj4gMS9pZ3RAa21zX2N1cnNvcl9sZWdhY3lAYmFzaWMtZmxpcC1iZWZvcmUtY3Vyc29y
LXZhcnlpbmctc2l6ZS5odG1sPg0KPiA+ICAgICAgICAgLT4gUEFTUw0KPiA+ICAgICAgICAgPGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzEyMjY0L2JhdC1s
bmwtDQo+IDEvaWd0QGttc19jdXJzb3JfbGVnYWN5QGJhc2ljLWZsaXAtYmVmb3JlLWN1cnNvci12
YXJ5aW5nLXNpemUuaHRtbD4NCj4gPg0KPiA+DQo+ID4gICAgIEJ1aWxkIGNoYW5nZXMNCj4gPg0K
PiA+ICAgKiBJR1Q6IElHVF84MTQxIC0+IElHVFBXXzEyMjY0DQo+ID4gICAqIExpbnV4OiB4ZS0y
MzMxLWU1N2I0YjdjZDEzN2UwYWUwMGQyNjAxYjRiNTVhYjdmNTA0ZGE0MjIgLT4NCj4gPiAgICAg
eGUtMjMzMi0yZTkwMzUzZjA1OGYyNDg3Nzk4YWQ5MjM2ZjA5MjZkZjRlYTU0ZjAyDQo+ID4NCj4g
PiBJR1RQV18xMjI2NDogNjBhM2M2MmZlMmM4ODI5NTNkOWE5ZjFkYTZkNjZhM2MwYzljMWJhZiBA
DQo+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdp
dA0KPiA+IElHVF84MTQxOiBlNzc2ZjM5ZGE2YjM2NjZhMjgzNGY3ZTAyYTFlZWQ5YTg3ZjIxZDc0
IEANCj4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMu
Z2l0DQo+ID4geGUtMjMzMS1lNTdiNGI3Y2QxMzdlMGFlMDBkMjYwMWI0YjU1YWI3ZjUwNGRhNDIy
Og0KPiA+IGU1N2I0YjdjZDEzN2UwYWUwMGQyNjAxYjRiNTVhYjdmNTA0ZGE0MjINCj4gPiB4ZS0y
MzMyLTJlOTAzNTNmMDU4ZjI0ODc3OThhZDkyMzZmMDkyNmRmNGVhNTRmMDI6DQo+ID4gMmU5MDM1
M2YwNThmMjQ4Nzc5OGFkOTIzNmYwOTI2ZGY0ZWE1NGYwMg0KPiA+DQo=

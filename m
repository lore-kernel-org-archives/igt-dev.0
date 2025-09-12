Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A10CA101F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 16:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871D010E13A;
	Fri, 12 Sep 2025 16:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUBwYxbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F3110E13A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757693463; x=1789229463;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8OE1kjiAR9MeahsDV2XLUn6gLohMgMbp7x5zxhVfuhE=;
 b=IUBwYxbb/xPkcyN85ENyqcUaIaJW0HCueWziFoVPWT5yl9qox8UZ1fhm
 MrZDpIWy1fJHnrmVb99SQfilZnNNh6PJUXJisS9XT7heQj/2Rubx8qzVi
 nazIt828W2xf/7QK+M00YxuUoBnTA/DSBVJ+/2CI+SRtAfqjEBQbofG2s
 M2iWMgWA/Egiu1xwvRhRiDN58NVTHfORVqeoWnBohPsMxNzCvS34fHPgV
 ThRhc/yXyWe6NCmp0XeAy3eNMaa+X/+G+QnJ3AVzbqftU6KIescePKmKE
 AlNycCCYgUhJAC61efGHosY4uFCZiDXf/mb2RanVICwGhceWWwtyTVFtf w==;
X-CSE-ConnectionGUID: SX6edBA/S3KMF0pYFPfCxg==
X-CSE-MsgGUID: K72yXGlZSjas+1N06NMgYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="47610502"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="47610502"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 09:11:03 -0700
X-CSE-ConnectionGUID: uTmLBeZQR9CbhMLoXsbxHQ==
X-CSE-MsgGUID: UVvCjZnfS5aQSOjHg5x+dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173564162"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 09:11:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 09:11:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 09:11:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 09:11:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgpr/U0oFj6oo1KxT9Ci0FNsi5mSKBq2MPaB2JpPPcm/qipBHnJPYgjwOewhcLlndC7dqr06wrH1maSMRbVyBCrZey58AFIfXDNa9yrSgk+53lqbJbgXhv150yMZej7gJhVr2FLZWnnozwCoRGcywpw34cP/opaqTGtXlGkdPUU2DejZ/xGNM6AHzxegm3SeW4wl8QzaZulpBzQ8ec0rIRIHRGuU/tqdOIEqf2GikN0AtCjW5auojHjXFfAKIa+yk9etXN0JrAo1Mcnq0GtAIeSUlWDWhlhCgp/wji1g3257QOJ40m6Ua6G/QLSDlVT95jpoBRVcI5JogA42UNKj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OE1kjiAR9MeahsDV2XLUn6gLohMgMbp7x5zxhVfuhE=;
 b=BNx9hJOTwuM9tA65qQBbGoLaOWLtr1tH8leRtlvHCcx7tAKY3Dw2+TT81qfRuqFT2cLh3fxD1UoPGwsiSDxZRT6PgT0qYzyxB+QJRkZgn/BxlBJufbN3AV1REicXj8Pg5w+xWNPASeyNTuRzHyMT0P1TsKv8HBuV7pWAnI9wsEW7QW0YSVmic2eFyaIuDF0B6zRdjlVidTsbXBq3OE8uol7905oWBt7lKm0nE5LdoDhw6ROwsELICzR68rPF3VDerYqNeJI0e7YrL2aygMBOHtrzjdEcliNfOWNkJdDojjC7fVTO8rV2LaVCoQ1H0XJwSPZ3KA110ox82v1E8tcwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB7138.namprd11.prod.outlook.com (2603:10b6:806:2a1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 16:10:59 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 16:10:59 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] lib/xe/xe_spin: Write to start only once
Thread-Topic: [PATCH] lib/xe/xe_spin: Write to start only once
Thread-Index: AQHcI1/wcS6ZF/rwBkSW5ZSFjYyO+LSPsr+AgAAF1cA=
Date: Fri, 12 Sep 2025 16:10:59 +0000
Message-ID: <CH0PR11MB544486E6DD64333D9AC3AD67E508A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250911210618.298333-2-jonathan.cavitt@intel.com>
 <20250912154857.xgqidegnrdb4nuo4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250912154857.xgqidegnrdb4nuo4@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB7138:EE_
x-ms-office365-filtering-correlation-id: 66058584-9ab6-4ca7-ef59-08ddf216f64f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OUhwL1NTOUdWMkl0cDdHSlRzWkJHMVhzNENvWDdVZ3MvSUNFZmZLeWI1UnVN?=
 =?utf-8?B?bUNTQjQ3RUlHdm92ZHZCRnlObVcramsycHk1aytGOW5YZnVOSHAyNFB1eEY1?=
 =?utf-8?B?emkxMUlLdU15MmdBQ2pxK3BlY1hFTXlkL1JhN3hOL0gyN1JCNHFianZWdEhM?=
 =?utf-8?B?YmtpZkhWSVEyS0daK29kZ3dzRllUVFYzaEp2YWgwd25jMHNmRGs1czBWS3B3?=
 =?utf-8?B?b25oY2RIQVB1SFpZL0FhN29WMEIzT0VrcXQ2QUFzQkxMQ0ovK3loNmh4czUz?=
 =?utf-8?B?OEJVa08vUExkNEJHT1ZaVDAzRTY3d0FkQ1QrUDdJay9qbUZQdkt2MXhYdmFV?=
 =?utf-8?B?eW1jNm1HWXpuUnNveTdqNExDVVJ5MFlpckR2RHdYS1JLVENSK2dVRERTYXdF?=
 =?utf-8?B?UDRVakNhWXQvdnhVS2FYdk9hcjVMaVBpVkVyc3NwTzMwb0lXaWlFVTJYYlBG?=
 =?utf-8?B?czZBSStJa2J5ZEVCZFFYTzFiUXZ6NGZ2a0J1MHZoNlRrQzl1MnRKbVRyS0pz?=
 =?utf-8?B?TklvRTdvZ250RUd3Q2lTMjBBdnc4Q29zdjFrR3VUQ1g1T0J5b3ZDZFdJRUxO?=
 =?utf-8?B?L3k1OFJORmFqVjUzdTZDTUthYjlPWU5HbVR1d1Y0L3V0ZHpMVmJZNWpVald6?=
 =?utf-8?B?ZER5VFBaZ1dMK0t6R0twMnEwbkI0ZDcvNFUzU2NCQXlMemkwb0h1aWc2R21H?=
 =?utf-8?B?VURneGk5czFkV0poTGFTUG9NVm9tVUpqVW1DSUY4Nmk5R2RZbWswMm5LWmY0?=
 =?utf-8?B?ZUkyc2F1dzk2cVEwc3MrYlFYMEpLMG9TTWZUQ2pSbTdLWGZwV2VjMDY1dDNR?=
 =?utf-8?B?QzJYeXp4SGJsRlN5MHpieXZkeUMwQVFKZGgxWkEySEdkVlFFMkpOQ25mRm90?=
 =?utf-8?B?MnNpMTRGQndMdzgzdzNZTHUvdGpsV2ZoMkVlcHJBV05pMnBub0NQSUZ6V3hY?=
 =?utf-8?B?Uk13Nkl1VEFCWXprVFV5WldKVHpzRGk2Z29pcEpCVFdsUEJLeHVMZUtKTVhQ?=
 =?utf-8?B?eCs3VHpXbzZ0Kzk3SkFOVXBkNHE4dnNBWUZzR08vZTdBaFBjdVNtTC9CVENs?=
 =?utf-8?B?c3B0akhuNzJSck1kQmlxZnRPUFg0NnZoV0JzOGo3VEZ0d0xSMWgzV2lXc1px?=
 =?utf-8?B?eUNzdGYyb0RmN0dic3ZIQ2VjZzFmUVBvaStTYysyK2Mvc0E5Nk9UKzZ2LzR6?=
 =?utf-8?B?VmRHOXZvRWZYWHNESkRmb3VibDR0eUR4Vy8vWlFiNzJKc3FhSExoZ2dMMFU1?=
 =?utf-8?B?RVpKWEk3bVJSTjVlUWNqaThmU3lUNFdTOEV3UzVyKzhoSUJHQkxGL0wrMnVN?=
 =?utf-8?B?K3hsS3dKZWM0Sm1lN2ZsSk05TVJEcGJTKzBvME5VRXk4LzNTaldDL1Z0aFdt?=
 =?utf-8?B?UzFxMzlxVm9LZnFQZFpLT0hweDRwRTQ0dGY1RjJVakMyWVNZdExXZDFCOEZQ?=
 =?utf-8?B?bS83NW0rODY0dk84SmtyWlo1MXRSaWliM3laVERzZElKNUd1bWRWN1kvYjAy?=
 =?utf-8?B?bU1oZU9nVFpKQ1BMUklSZWkwTW5EMjY3eDUvQWtSeVlIeko2b1lRYU1Id1VY?=
 =?utf-8?B?Z0Fyc2hweVMySUx5c2ptbkJYeCtkUjZmNHNFaU16MllDVnpETnFoUFNoa2w4?=
 =?utf-8?B?T0MyQWhjUVNTcUdqL0c5YnFkdW5GM1V6eHFaeHV4bHJWcDZEK0hjaGxDOWE0?=
 =?utf-8?B?Z2srRTJyczBVWmUxZVpNR1pUQzJ4Q0tzLzljWmdibG1rWXBycGdtaXFlUjdn?=
 =?utf-8?B?MDRoUEd2UzFydEJjRVhBMHNEQlFlMm9pUXRpSXdlZm8vTGcwNzFiOXBvSmZI?=
 =?utf-8?B?NDE5N1doT2FMUDNNWFhkeHl1UEZTVTk4eVZPbVdMRUZKeC9uNFlGOGVRZzZR?=
 =?utf-8?B?RjhoZ21xL2hGMUorU0pJaHFrVHppaDhDaGR1d05rZ0phMnF2ZmwxcnBTdGx3?=
 =?utf-8?B?NXh0UWF2MkVyMHZBWk1kZG54U0dKU3NxY0ZqNys0NkZNczFaK0Z3UHN5MkFX?=
 =?utf-8?Q?hRm2lo4r00h71iAu6ELRqLWTozjvCI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2VsMVFLSVdDSEVSMVdTQWFvT0I4N2hiMDlGbFRkbWk3OVpLb3B2ai9oWnlp?=
 =?utf-8?B?Rnh0enp4ODdiS29qeWNER0huRHpjZlpsQk5kU09VQWRIVzBaTmNqSTdjVkZB?=
 =?utf-8?B?dTZKR1ZhMDNZbjY1emQyQTIrRHVYYXZIanU4QjlYMjI2SjQvZzNFaHVCZW0z?=
 =?utf-8?B?TVdZZ0lmVEdFdzdrYjVJS0c2SUpoRTZ6ZDZBTGtTNkQ3R0FaMDAwQnhEa2sv?=
 =?utf-8?B?K1lVUVdjWUFEZ21ZbjV1M0h3dTlUb3R3VC83NEg1VkdvbXhwRjluQ2xqeVcz?=
 =?utf-8?B?aGxUb3I1Qk9UNW5SbUNVOXZjK0E0cjRaYTU2M0kySEN6NnhXZU56YmNtTmxI?=
 =?utf-8?B?cU91NEdBNFFvZ0ZnNnR2dUZybjNFbDV4MSsyeWFjWDlObFJ1QTJIS2VEVXQ3?=
 =?utf-8?B?REgrN1FQcGNTOWFKbVlXRjlxWHNZYlJxVkVjNlRtelRJLzY3bzNFcnRPREtY?=
 =?utf-8?B?UEdTRUlLTnF5YVlOV3krQmsrZDkzQmNSVXQ3TlZUUzFFNnRrcG1IN2ZDMmZF?=
 =?utf-8?B?RUVxOHB2UWg2dkRuSHE2Vk1kZ1hjMmg0eGFWSVpWVWdxOHgzdVkwS1VETDg5?=
 =?utf-8?B?SDJGU3ZCZFZidytqcTM0VFc3NmN3NytEblZBd2UrYWdLTk1KaHp4RjROR2hR?=
 =?utf-8?B?K0crcDRvMmlabUpmWGRJYm53UGY2eEUvazZMVXk0QVFEVVd2V1JXc3ExbEQ5?=
 =?utf-8?B?SGtMbG9VUzEwOFZ2WEg1cFhqaDhsZ09UTm9OVlppb3dJSWFCbm9NTWxGNEI3?=
 =?utf-8?B?QXMyNncvdGQ2SUhKR2JicmNycDRtVkVZTmtHZldHRmEzS2pla21qa05ZTGRr?=
 =?utf-8?B?bzNOTG9DdDU2Um5KYktNQzFwWjk2VGo3Z2JibTRRdjFlQ25RVXh1c1EvdmtO?=
 =?utf-8?B?c3hFMG5SOWFGQlM2ZUFvTGIzbkVsNERBMjB2K0FOcU5pUDRnQ1J4L3FUUnJz?=
 =?utf-8?B?R2JibUM2b1hFQVZqS0M3aG8vamxnZHhFaGFFLytybnQ4RjhES3FZSmZXT3Zl?=
 =?utf-8?B?dWpDWmRtZG9nWmo0SzhsVmh6bTBMeFhSTTRXQlhTUHlFZWJJV2I1cnVsS3N5?=
 =?utf-8?B?ZERiSWtWZDE0Y3pCa3ZHcHhWNnhPc2xZd05GVkZKOFIzcFZQN0tYZWhNN05h?=
 =?utf-8?B?ck5NdTIrK1dIRjErNEkwWkVPb2pFek5wWG5pNWtCVUx1eG5JY3RoNW8zMW55?=
 =?utf-8?B?MGZKVjN0UDhyRU4zUlNwK1oxZHFJMXJ3Z25mWDczckhUT3JMNzlIQ09WZ2lq?=
 =?utf-8?B?djUvS016KzRuT09zT0dza2hReGZQUkRRc0NCUHR3ek1VWXBSRTVta2NGVUph?=
 =?utf-8?B?UUM2VHMycFNiMDVGb2NrYVBLSjBJOHdlZ2FGTDBFMzFtUXRSVlFCdmJCanlU?=
 =?utf-8?B?UUZDVW5BYlRPWnllWDJDZ3M3K2VKMmxUUGxJRXErMDhZNVFWNkVSdkhKSVlT?=
 =?utf-8?B?S094dStvdmVVM1NzTlNkamM1T3dqRmJKcGRpY0tZQ3Y4SlNRY25QSno5SHNq?=
 =?utf-8?B?T3FIQnpMQnVxMWMvRTlIM2VCdEVlSXVrMzVwTk5uQzJheTVVOGdmOXdONGd6?=
 =?utf-8?B?ek1SRWR1MTVQYkExRDBrV0tLTE5vODFQek1UZkl0R0l0SlpUZDVLWXpSbzFv?=
 =?utf-8?B?S3FFWHllbXl3bGtMelRoS3l0aEdSVUxOWGZVbU5uQTZZbEx5SjN3UnBZQTd2?=
 =?utf-8?B?OHlvbFVoN2pUK1hGc2VVVzlBa2NHSmh4STlWS0ExS216QTl1WitiY2VnVFd2?=
 =?utf-8?B?OXpSWVUvZDZsQlpneExNUldwWGl2V0c2RVdBU0RNeHovSEdudkdyTElkYVNH?=
 =?utf-8?B?MUlRdWxWbDFtWTdOOWxLVTJDVmZmRFZnQnFtTHRKVkV2VGtKYlYyOWNBazdr?=
 =?utf-8?B?S2tEVWZ2YjAxMjVCL0JDOGh3aGlwN0xNaWZOZlprcE8xc0U5OUV5a0p2SGtv?=
 =?utf-8?B?akltZVJEZHNhbTRUUHgyVDlUNHl6WWw1UzJVQSsweTNlOXRGbWQ4NzZwR2NK?=
 =?utf-8?B?NHZkaGFhbDNOQm9kcGVXc2hXeVVxQjZjUlhRdjdSOXJuTHI3My9YdjdPV3Yy?=
 =?utf-8?B?L1EwTnZ3ZFhEejhnVEJVNnh5QTl3Nkx6K0JYZ3phUjF0UWxyTGJPVlV3VGdl?=
 =?utf-8?B?N1ZlVVJ3b0dtVTRtN3hJcEhoczAyTXYrK2pkdXRNNzV0ZjdZVHAyUHdpN2w1?=
 =?utf-8?Q?CWTSVkU04Y+nVzfJBpDgPBE57luxhn2rSCsfNYi26EAe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66058584-9ab6-4ca7-ef59-08ddf216f64f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 16:10:59.1653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CfvLEsb67/kioZuRXA7hiuQzLxYlayCdU6Zt0mvx/ZlTwplM4ChKzMeeS3MYWLEsgtLxSF0HnWJQwThHY5YZT9o5WTfgZYZocUWiG8+xGeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7138
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxMiwg
MjAyNSA4OjQ5IEFNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVs
LmNvbT4NCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR3VwdGEsIHNhdXJhYmhn
IDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNv
bT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGxpYi94ZS94ZV9zcGluOiBXcml0ZSB0byBzdGFydCBv
bmx5IG9uY2UNCj4gDQo+IEhpIEpvbmF0aGFuLA0KPiBPbiAyMDI1LTA5LTExIGF0IDIxOjA2OjE5
ICswMDAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6DQo+ID4gUGFydCBvZiB0aGUgbG9vcCBpbml0
aWFsaXplZCBieSB4ZV9zcGluX2luaXQgd3JpdGVzIHRvIHRoZSBsb2NhdGlvbiBvZg0KPiA+IHNw
aW4tPnN0YXJ0LiAgVGhpcyBpcyBkb25lIHRvIHRyYWNrIHRoYXQgdGhlIHNwaW5uZXIgaGFzIHN0
YXJ0ZWQNCj4gPiBleGVjdXRpb24sIGFuZCB0aHVzIG9ubHkgbmVlZHMgdG8gYmUgcGVyZm9ybWVk
IG9uY2UuICBSZW1vdmUgdGhpcyB3cml0ZQ0KPiA+IGZyb20gdGhlIGxvb3Agc2VjdGlvbi4NCj4g
DQo+IE1ha2VzIHNlbnNlLCBpbWhvIHBsZWFzZSBjaGFuZ2UgbGFzdCBzZW50ZW5jZSwgYXMgJ3Jl
bW92ZScNCj4gY291bGQgYWxzbyBtZWFuIGEgY29tcGxldGUgcmVtb3ZhbC4gaW1obyBiZXR0ZXI6
DQo+IA0KPiBzL1JlbW92ZSB0aGlzIHdyaXRlIGZyb20gdGhlIGxvb3Agc2VjdGlvbi9Nb3ZlIHRo
aXMgd3JpdGUgYmVmb3JlIHRoZSBsb29wIHNlY3Rpb24vDQo+IA0KPiBUaGlzIGNvdWxkIGJlIGRv
bmUgYXQgbWVyZ2UgdGltZS4gV2l0aCB0aGlzOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEthbWlsIEtv
bmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCg0KVW5kZXJzdGFuZGFi
bGUuICBBbmQgdGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IQ0KDQotSm9uYXRoYW4gQ2F2aXR0DQoN
Cj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpv
bmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
bGliL3hlL3hlX3NwaW4uYyB8IDQgKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9saWIveGUveGVf
c3Bpbi5jIGIvbGliL3hlL3hlX3NwaW4uYw0KPiA+IGluZGV4IDI1Zjc1NTVlMjcuLjcyYjEzZWY0
MjQgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL3hlL3hlX3NwaW4uYw0KPiA+ICsrKyBiL2xpYi94ZS94
ZV9zcGluLmMNCj4gPiBAQCAtNjksMTMgKzY5LDEzIEBAIHZvaWQgeGVfc3Bpbl9pbml0KHN0cnVj
dCB4ZV9zcGluICpzcGluLCBzdHJ1Y3QgeGVfc3Bpbl9vcHRzICpvcHRzKQ0KPiA+ICAJCXNwaW4t
PmJhdGNoW2IrK10gPSBDU19HUFIoU1RBUlRfVFMpOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAtCWxv
b3BfYWRkciA9IG9wdHMtPmFkZHIgKyBiICogc2l6ZW9mKHVpbnQzMl90KTsNCj4gPiAtDQo+ID4g
IAlzcGluLT5iYXRjaFtiKytdID0gTUlfU1RPUkVfRFdPUkRfSU1NX0dFTjQ7DQo+ID4gIAlzcGlu
LT5iYXRjaFtiKytdID0gc3RhcnRfYWRkcjsNCj4gPiAgCXNwaW4tPmJhdGNoW2IrK10gPSBzdGFy
dF9hZGRyID4+IDMyOw0KPiA+ICAJc3Bpbi0+YmF0Y2hbYisrXSA9IDB4YzBmZmVlOw0KPiA+ICAN
Cj4gPiArCWxvb3BfYWRkciA9IG9wdHMtPmFkZHIgKyBiICogc2l6ZW9mKHVpbnQzMl90KTsNCj4g
PiArDQo+ID4gIAlpZiAob3B0cy0+cHJlZW1wdCkNCj4gPiAgCQlzcGluLT5iYXRjaFtiKytdID0g
TUlfQVJCX0NIRUNLOw0KPiA+ICANCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCj4gDQo=

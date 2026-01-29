Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B992D358F5
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 10:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39CC10E848;
	Thu, 29 Jan 2026 10:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgPnfvhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004CC10E844;
 Thu, 29 Jan 2026 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769682018; x=1801218018;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xchS1L5xFdaMKeM05WqUNneAuPzOaZOTGc/taf3C5vE=;
 b=UgPnfvhj7tNNI0IqyS/pUyuqOAbQ5Iidyl+96z+LeXn2QV4cL2ByHE2l
 IbvLyb2VCl8LAKi6x9sMRh3VMF+7AtnzrF+ZzU1AZTZTzJiRGQuD8GQ4W
 sE6pp+0BKCAw2p9cJ4ZWFaqp97HDzevXl/TkmuZp5+iBcafjGLTJktUTy
 nz+hoeCE1auT4MK4wzexSXujFgJbwKhrhvzdNA/dDqJEl+WCeS1RK9vKc
 6hzvQxhBKgOvnTk9+0byHYj/Q14Y+nIiACFyg+cOucjzzGswvepdkj/j6
 LWZaKvJ4u500POjT0j0Wu5fxIkB6I7zterICkwQLRG2MZFpSk6YoOOw8Z w==;
X-CSE-ConnectionGUID: 3T+QI+40SpupRzmeyQ61gA==
X-CSE-MsgGUID: HI7xYjphTi20o8IdbS6k2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70889466"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70889466"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:20:18 -0800
X-CSE-ConnectionGUID: g/u5MUhpQcSySnQEsmp98A==
X-CSE-MsgGUID: 9uRBWmeBTYmOdZoiaF7Qng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="239271212"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:20:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 02:20:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 02:20:16 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 02:20:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcpngQlGrH0aSkkozsfnc9ZN1kQ6Su+zK0BG1ZSD9bMsEGXwv0Q6QDxod5hzE+fiK0W9yTedGYFEtv+PQAVb6XIwC6ceD4qR2whgCORiDrfU0fhaWeHDtMU+3l95rORtcx6UiBDAdv6gRa65Oc0eX7NoRwJ0p4tQ2epWdPOt4Z1KBlDAj1q35hkffOvzKQpXVSPqVpA6p7npyNcNFle5cCqCSrfcFHOkKQ9rQ0VjGC9MwEcxaCvYVYWTkq3DLcI7wSkhr+dDBb3qRioGR68S+bwCGPHx5nWVGcXvs85xGzl6U3bRa6GYtdp8fscRk63IdvaEqZ5RP9cWhCocLmesDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xchS1L5xFdaMKeM05WqUNneAuPzOaZOTGc/taf3C5vE=;
 b=j5perWvpcgFQ3cF8xvzkJ6kqxWI9oEcdX7YHsu9aDvQWsC4rng4tQyG4hSOUvNLi6qCYduaMgwFnJ7/oOuk/V5ufYI2/C6+gvYDws8j8boz3mQkTZuP0oawyyDTHNdk3p8zm4Y/5TmOotZjJQxR09atnTeAsVo4Qzldt1eL8QXir2oLiiK/Yl7uyMhIdWpm93tYnREKaOdUHwdyX5uG5/Zf39r30wxeZvq0+Oq8EhyXM+VnngPdzpX4hcjDqKg0TpfJb/hng4ZbNeoiHif7XNaquLoE64cXymtHq4xXmg7Jl0s2b0IUNUNUkeYE4Ys/0QOCoZvR4y7WvsxIC6XLntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by DS0PR11MB7999.namprd11.prod.outlook.com (2603:10b6:8:123::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:20:13 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%6]) with mapi id 15.20.9520.011; Thu, 29 Jan 2026
 10:20:13 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwv?=
 =?utf-8?Q?kms=5Fjoiner:_Fix_var_usage?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC9rbXNf?=
 =?utf-8?Q?joiner:_Fix_var_usage?=
Thread-Index: AQHckC+OqhzS2A9DQUGDA5lsuX9AirVo8CSA
Date: Thu, 29 Jan 2026 10:20:13 +0000
Message-ID: <CH0PR11MB5491192CA51B2BA0AAEE9F83EF9EA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260127164018.63157-1-kamil.konieczny@linux.intel.com>
 <176953828942.197229.12111453565230579635@a3b018990fe9>
 <20260128082427.mooqiduqpwpmygqw@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260128082427.mooqiduqpwpmygqw@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|DS0PR11MB7999:EE_
x-ms-office365-filtering-correlation-id: ed568a83-654a-40a7-0258-08de5f1ffdae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?MzhSOFBWK3ZDTjhaYTV6UHBncm93MzRMK3RrR0F5aGsvUExBMlFuTUx4YzVN?=
 =?utf-8?B?NlhRcTBTRSthUnNZRko2cUZzRDVYVGUrK3owd1pTSlBnUmRZTTVwNlE2VktI?=
 =?utf-8?B?a1lTMDBScjVEZ1FWeGZOWVo3UUxNSjVKTnRLdVlZL2pzT0lRc2JCVWRZVm03?=
 =?utf-8?B?RTNDdlRzc0E2dW8ya0tEUGdGZnRxd1JFWTBGYjMzNFYvVFlTVnZSUGpqTmh2?=
 =?utf-8?B?VU5BSXA4MlRhVkRiM0tzbkZGUk5kS3BIa2NRdG83Ym9VZzZhdENHMHdqQjZE?=
 =?utf-8?B?RE1nUmxYMXByQnhBQ2dHL0VVYjNkcE0yb1NTQnpnR1JzejFEMzgrRzVBaDZr?=
 =?utf-8?B?MGdtTE0vWC8vV3UrWVhJSnlOVlFhQm9wdy9YbFBUZ3pZTDJZcW1ZTWMveCtD?=
 =?utf-8?B?enhKYVQ4MnRzcksrdWx6VDZneHRtR2JFdEZzNXhaYTF3NGlvYkJzU05sWFhl?=
 =?utf-8?B?UHJ2UFhoR0hRaVA4ZThPNlVxODg2dG5vNVB6cWFGWXpDeDlVMmp0Y1NHVHpS?=
 =?utf-8?B?akF3Qzl6RWFxc2pUR2VRV09OdHVZWldnQW9ZSTR6K2oxSVFZTG1QTWVXd3Ri?=
 =?utf-8?B?N2ZNSkExVldYeXJJRTlXeENoUkRBT0NrTXpzOTh3cjR3QktGTWJ3akpKb1VR?=
 =?utf-8?B?Qk1vWk9KNDRORE9BUStqb2JzNlA4MTZobXZJTjVFclRraTVXRGpZemZwcW40?=
 =?utf-8?B?dFZXYkRSeGhydDdUTWYrcmY0OVYrTFQ0NUJ5MUhZMXpYeXJua2gyWnlsbUpo?=
 =?utf-8?B?Z2VKZGFzNlVNTzVIWGp6TTJuVnJ5U1NMWjZ1bXg4SC9ZTDVuMU4zUCtMRloz?=
 =?utf-8?B?RjNyRU9WaEc5QU1TMHV0eVErYStpdko0SEQ0K2hGQ0xPOGdNN0R2MTF4d0hw?=
 =?utf-8?B?TC9HdDI2NmZUemY3c2FhTUJGbXlmTlpQTXFHMDJXZ0l6S2lTVll5cnZENEFy?=
 =?utf-8?B?UkJ5NkpmcjNDeER5SmlGSlZUVllocm9IbEhSMnJyZkQ0bEZSYXgvSWhETEts?=
 =?utf-8?B?VW94bDdlelhRT0VGNXdJVW4zSzBrT1JRVzdjakFPOGFmRjlYU2FEU0E4SFpz?=
 =?utf-8?B?b0lYQ3BQTlIySVVLcW5KZXMzKzdWUUcwbjNDTHNRV01YMmUwNUFnWEpkTXEw?=
 =?utf-8?B?ZWZFWlgvZk5wRHM1aVRhU2tTa1ArOC9kN0VoZ1lFRzJlVmhJaHFRamVzTnIy?=
 =?utf-8?B?S0NIcGROMVVXUWN4NmdJRWRxd0xzdmNrSzNHNnZOdnU5aUVhVzJoVFBQQzZs?=
 =?utf-8?B?eXNHSDMyYlpScmFEK0VocEI5U3B6R0pkTldwZFIzMExnOHpnVSs0YlBKbkcz?=
 =?utf-8?B?OThVU09DbVVpR3dFRHZicHVENUxaOWlnRzNkWnBpOE4zMFAybk11R1I3NWUz?=
 =?utf-8?B?NmQvUlVsUytQWjJXRkNLd29pQ3VOOXZxdms4RE1oVDhlSzUvU01KMUIrSnkv?=
 =?utf-8?B?ZUZGV2pUb1BKVzZoa1UwVE5IanA1M1BrcUd5clB5K2ZDRzFrTXh4TEZrZkRC?=
 =?utf-8?B?aWhQVmZkbEVxaUNSazRKMFM4U0xmZlljK0hQSS94czA2QWc2eUpzT1RraHEx?=
 =?utf-8?B?UXZlK3pNdEoyUUNYR01WaXU2S0tJM3hBbklmNEFJL2NHWTVTaDQ0bHU3QzNs?=
 =?utf-8?B?RmxLMXdXSGNUVnRtUHB4SVhpQm9VN1Y4bVNvNnVaTmdQMkVNRWt2SDZ2dHUx?=
 =?utf-8?B?dGZZa2JxMWFRZ2lTNlhML2dOMWJSSm41bTh3VzdsWGVBUWFFMFZGRlZ2Vk1u?=
 =?utf-8?B?NTkrNmVOOTRja3QvNy8xOVpIVFlsNkV2c25LcDZpckRDRTRDVFBsZm9HSUlC?=
 =?utf-8?B?cUswbC9oMXJST2lrOXdkWjF1eEtMeC9aQW5JdW9OT2IwZDVFL3JCcitaa1Iy?=
 =?utf-8?B?RjhPU21GREtybnp1TmYwcCt4eTk2bGJYTG9PaXU4UkVJZmN0Wk42NkplMTRn?=
 =?utf-8?B?bjhTNXhGdGg4M1Q4VTJaNE9rTlM1WEpRVVBjN011OWRUUkVJMHA4bGtvNGRU?=
 =?utf-8?B?VUhHZTQwZStqZTlQUlo2eUpIWWJqU042MHMxNjlXdXd0K0lxbHRSUDQvRkFV?=
 =?utf-8?B?SnRCOGJCcXoxQ3R3dEU2Sk1YTzNKTnUranVKaEpubzV4UDdyTjVhcEZib2lI?=
 =?utf-8?Q?LYv8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007)(38070700021)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3JXWHFPbGJPNElmMjNWT24yL0IvVVFwVFBZbTArM0ZuWTQ2YU95bWs5ZllI?=
 =?utf-8?B?V0Erb2xYN3pZbFF5K21UT3gwcnhWaVpsOFFwTEF6N3lNNzYwSHlTcXA3UWg2?=
 =?utf-8?B?amdlYzZUZXlhc3dOYjhRYlZPWkJIeUhxeWNPdkRHZG0zVzNBUHJtMVhIZ09x?=
 =?utf-8?B?Y3RiWE1BdWVpZGFKZWFqSVAzZFY4bDRpRXFKbW1wZHdIY3QrMTErL1BRdWYw?=
 =?utf-8?B?c2NRZE9FWFYvYjBmRTVPdUMzTlJCc3VUR21JQlV5M3VZNk8xZzgrZitYd2h4?=
 =?utf-8?B?MUgvSmhsU0ZUNE5IUkRCN2pPSWszdStKYkkyNlVXQk0yM2s3UW1KazkwaTV0?=
 =?utf-8?B?dTJEdkRKTWhFVGpTOURxY2pwaHlUdHVPVVFQMkRsVndacFhacWxVcUZna1lY?=
 =?utf-8?B?eFVMcGFDMzFVVkdteDU5ZHNXbVhmdytCM21JQUFKSkhqazZlK2JEU0xvV3RU?=
 =?utf-8?B?OFRYZ0ZFNWNPOVEvWWpZUE02bzU4M1RuR0U5NjlrYkFyME95RTBDWFkvMTd6?=
 =?utf-8?B?d0ZuM3Raa3MvWmJ3dXBQZnZjelRBbW5jZk1vQ0pwNmltL0JZdEZ6ajc3enVT?=
 =?utf-8?B?bGI2ZXp0ZjVHTXpaOGxsTTlVZXY1Sk9iRldVV2Nwb2JkcnE0eFZGYlU1OEQx?=
 =?utf-8?B?OE9qUjVjOHRFS242YWVyMVRGTGZVNTN2YVB2c1VERE0xSjV3TTRhbjVNTWJ3?=
 =?utf-8?B?MDUzbm1OdVkwYzRzeDRiN080Si9XWnMzOUhkbGVGU2VLazgzMkVIcm5WSm56?=
 =?utf-8?B?bmpkak5KTkR5SjRJaDhONVozQ1BlRWFieWxNQkFKSnF3S3Y2bUo4R2RnakIx?=
 =?utf-8?B?djhyTW84VTJFVlBBelN5dzVoQXYrdWxTR3FZV3BZZE41aktub1lxTGNSTmd4?=
 =?utf-8?B?eDZoOTB5WUplRmozOC9LOG9nZmJPOHh6TGVPT2RIZE81bTZUelJOQjJ4VURC?=
 =?utf-8?B?RjZzdlBsVUZWSnF5M0x4aTFwSE9QeUo2VS9UQlBTQWxRbHVvVVBOZ3U0aWZh?=
 =?utf-8?B?NG9SbTdKdi8yQ3hZOWtoQkpPUXdjSTliL1pBSjhkVmQxSXI1RWRZbE1MUVNh?=
 =?utf-8?B?L0F1ZklpSXlCVGUxaGFZblFVcWlJM3lEVkpHNVJYajFzdU1ySXlsYXVyNHJK?=
 =?utf-8?B?UWpNVU9naVVVVlZ0Ym1UUTQzRXcwaTNETlRVZzcrc2RyUGUzWnc2UlM1bDdT?=
 =?utf-8?B?U1B1OG0xRkF3VUxSVTBEeUVWQ1JobWd3TnVRd3NtQjFGTnVGS3EwK0h1alpU?=
 =?utf-8?B?QkZJWnY2RURkWEN0QktzTllUQzROTjBjSUwvUHF4bSt2dHNhMXJnbEgxTEU3?=
 =?utf-8?B?dlpaSjBxTktsVHltbU1uNzVtaWI2OXpRbGFDeVJVY2ZLcDZURENSWExrNSsy?=
 =?utf-8?B?TFVscnBoWVoyd3hwYnVZdDlFWU5vOE9NU3pPYUJSbm1ITjVEL3hnTzNGMEJJ?=
 =?utf-8?B?cWgvRWp4cmh5dXlRUTd1M2l1SFJiNFNGSVlFeGdaQ0YrMW8xVmg0bTNHM3R1?=
 =?utf-8?B?b3F1ZGNFNDhiVWMrODE0S2syY21UZFhqQ0RkUDIrbVdQU1BCS3VQSUN1cnBT?=
 =?utf-8?B?ZjNzMmJLbU1HOFdiN0JMdU1udXc2TUNoS0tKdGZsdjRhOVB6Q2lXNEtIVmEy?=
 =?utf-8?B?UG1HdWphc0M3OXBQK1VQY2c3cGpwN3R1Y3pqeDVZTFc4RXNJQWpEeXpZOXh3?=
 =?utf-8?B?VE9weC9tditFZ0QwQ0RsTVRVUDlFMXBzcUc1cjJFa2tMSWl3TzRDUmRmMmZm?=
 =?utf-8?B?Q2xoUG05Q0c3Q05IcUtTSC9iWGJjRDY0bmJidnlVQnJqMHVvQS9idUIyWU56?=
 =?utf-8?B?ZkVsQ0x3YmJzQ2FQdVVzWHFMOE5zS1Y5S0gzMit1MTZyczBDRU5tUDFGRjUv?=
 =?utf-8?B?SDJIL0FOUFJSYlU5d29VMWhSbmMraW9ERlc0UGJqbGtFdk93T1d6SGtUekx2?=
 =?utf-8?B?L3dGTnNRdlZPQVB0YnZvbUFZcEg2Q3FsT28wRkYyNlV6b0dKSWJLZVVId2VH?=
 =?utf-8?B?S2JxMUVYQUNnWUhpbWhralRMSEtnMzJZRk1yR0wrWmRteWxhN2VOYVAwYlBQ?=
 =?utf-8?B?RUlhTndrODRESzUzU3NjYnNvUUxpOWZNKy9XeUVxOGE5Tk9rRDlnM2VHK0ky?=
 =?utf-8?B?NlMyVlBsL2drYzVob3JudkNRVUZwNGhQSSt3QjZqZ29YcXN6UGxWQk5PMGc4?=
 =?utf-8?B?c0ZxQXo1MngrRWhYd3lxY3hlcGlEcXRWeUFhU01qZGpDeHFQcWFqenY0N3NI?=
 =?utf-8?B?OG1ZUndNSHZZR0szRmFvRDc5b1pqMENzNWllRUxiQ2NiSHpHNklNaE96aTNB?=
 =?utf-8?B?bEFyUUJYKzNKRkt3bmZseFhwMmxhVi9DMERqSWwvSk1nYTRmQnpFeUtJaHgz?=
 =?utf-8?Q?KV7GT3ZbPR04VWcOjhMKA1eJXGk+Pg2abeZ0hQ6aa3kL6?=
x-ms-exchange-antispam-messagedata-1: Jab7soWTkM6kmA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed568a83-654a-40a7-0258-08de5f1ffdae
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 10:20:13.7677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvClYmZIqNPBciGTjS0sWmnpUxXB2mNqZWj88NoDJyY12STTq0b3loPTt/c5mPlJoGl+wbtJ+lRwOC353vc2q/Ml6bJzQunxTr07MchLBOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7999
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTYwNzEzLw0K
aTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEthbWlsIEtvbmllY3pu
eQ0KU2VudDogMjggSmFudWFyeSAyMDI2IDEzOjU0DQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVj
dDogUmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwva21zX2pvaW5l
cjogRml4IHZhciB1c2FnZQ0KDQpIaSBpZ3QtZGV2LA0KT24gMjAyNi0wMS0yNyBhdCAxODoyNDo0
OSAtMDAwMCwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4g
U2VyaWVzOiB0ZXN0cy9pbnRlbC9rbXNfam9pbmVyOiBGaXggdmFyIHVzYWdlDQo+IFVSTCAgIDog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjA3MTMvDQo+IFN0YXRl
IDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5n
ZXMgZnJvbSBJR1RfODcyMCAtPiBJR1RQV18xNDQyOSANCj4gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0t
DQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNv
bWluZyB3aXRoIElHVFBXXzE0NDI5IGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVk
IG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBo
YXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdU
UFdfMTQ0MjksIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5l
dyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4N
Cj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xNDQyOS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhv
c3RzICg0MiAtPiA0MSkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAg
IEFkZGl0aW9uYWwgKDEpOiBiYXQtYWRscy02IA0KPiAgIE1pc3NpbmcgICAgKDIpOiBiYXQtZGcy
LTEzIGZpLXNuYi0yNTIwbSANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5
IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzE0NDI5Og0KPiANCj4gIyMjIElHVCBjaGFu
Z2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICog
aWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBndF9wbToNCj4gICAgIC0gYmF0LWRnMi0xNDogICAgICAg
ICBbUEFTU11bMV0gLT4gW0RNRVNHLUZBSUxdWzJdDQo+ICAgIFsxXTogaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODcyMC9iYXQtZGcyLTE0L2lndEBpOTE1X3Nl
bGZ0ZXN0QGxpdmVAZ3RfcG0uaHRtbA0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDI5L2JhdC1kZzItMTQvaWd0QGk5DQo+IDE1
X3NlbGZ0ZXN0QGxpdmVAZ3RfcG0uaHRtbA0KPiANCj4gICANCj4gIyMjIyBXYXJuaW5ncyAjIyMj
DQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZToNCj4gICAgIC0gYmF0LWRnMi0xNDog
ICAgICAgICBbRE1FU0ctRkFJTF1bM10gKFtpOTE1IzEyMDYxXSkgLT4gW0RNRVNHLUZBSUxdWzRd
DQo+ICAgIFszXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1Rf
ODcyMC9iYXQtZGcyLTE0L2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmUuaHRtbA0KPiAgICBbNF06IA0K
PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDI5L2Jh
dC1kZzItMTQvaWd0QGk5DQo+IDE1X3NlbGZ0ZXN0QGxpdmUuaHRtbA0KPiANCg0KVGhlc2UgYXJl
IHVucmVsYXRlZCwgcGxlYXNlIHVwZGF0ZSBhbmQgcnVuIGZ1bGwgaTkxNSB0ZXN0aW5nLg0KDQpS
ZWdhcmRzLA0KS2FtaWwNCg0KPiAgIA0KPiBLbm93biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+
IA0KPiAgIEhlcmUgYXJlIHRoZSBjaGFuZ2VzIGZvdW5kIGluIElHVFBXXzE0NDI5IHRoYXQgY29t
ZSBmcm9tIGtub3duIGlzc3VlczoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMj
IyMgSXNzdWVzIGhpdCAjIyMjDQo+IA0KPiAgICogaWd0QGdlbV9sbWVtX3N3YXBwaW5nQHBhcmFs
bGVsLXJhbmRvbS1lbmdpbmVzOg0KPiAgICAgLSBiYXQtYWRscy02OiAgICAgICAgIE5PVFJVTiAt
PiBbU0tJUF1bNV0gKFtpOTE1IzQ2MTNdKSArMyBvdGhlciB0ZXN0cyBza2lwDQo+ICAgIFs1XTog
DQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQ0Mjkv
YmF0LWFkbHMtNi9pZ3RAZ2UNCj4gbV9sbWVtX3N3YXBwaW5nQHBhcmFsbGVsLXJhbmRvbS1lbmdp
bmVzLmh0bWwNCj4gDQo+ICAgKiBpZ3RAZ2VtX3RpbGVkX3ByZWFkX2Jhc2ljOg0KPiAgICAgLSBi
YXQtYWRscy02OiAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bNl0gKFtpOTE1IzMyODJdKQ0KPiAg
ICBbNl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBX
XzE0NDI5L2JhdC1hZGxzLTYvaWd0QGdlDQo+IG1fdGlsZWRfcHJlYWRfYmFzaWMuaHRtbA0KPiAN
Cj4gICAqIGlndEBpbnRlbF9od21vbkBod21vbi1yZWFkOg0KPiAgICAgLSBiYXQtYWRscy02OiAg
ICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bN10gKFtpOTE1Izc3MDddKSArMSBvdGhlciB0ZXN0IHNr
aXANCj4gICAgWzddOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9JR1RQV18xNDQyOS9iYXQtYWRscy02L2lndEBpbg0KPiB0ZWxfaHdtb25AaHdtb24tcmVhZC5o
dG1sDQo+IA0KPiAgICogaWd0QGttc19jdXJzb3JfbGVnYWN5QGJhc2ljLWJ1c3ktZmxpcC1iZWZv
cmUtY3Vyc29yLWxlZ2FjeToNCj4gICAgIC0gYmF0LWFkbHMtNjogICAgICAgICBOT1RSVU4gLT4g
W1NLSVBdWzhdIChbaTkxNSM0MTAzXSkgKzEgb3RoZXIgdGVzdCBza2lwDQo+ICAgIFs4XTogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQ0MjkvYmF0
LWFkbHMtNi9pZ3RAa20NCj4gc19jdXJzb3JfbGVnYWN5QGJhc2ljLWJ1c3ktZmxpcC1iZWZvcmUt
Y3Vyc29yLWxlZ2FjeS5odG1sDQo+IA0KPiAgICogaWd0QGttc19kc2NAZHNjLWJhc2ljOg0KPiAg
ICAgLSBiYXQtYWRscy02OiAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bOV0gKFtpOTE1IzM1NTVd
IC8gW2k5MTUjMzg0MF0pDQo+ICAgIFs5XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9y
Zy90cmVlL2RybS10aXAvSUdUUFdfMTQ0MjkvYmF0LWFkbHMtNi9pZ3RAa20NCj4gc19kc2NAZHNj
LWJhc2ljLmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNpY0Bmb3Jj
ZS1sb2FkLWRldGVjdDoNCj4gICAgIC0gYmF0LWFkbHMtNjogICAgICAgICBOT1RSVU4gLT4gW1NL
SVBdWzEwXQ0KPiAgICBbMTBdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RQV18xNDQyOS9iYXQtYWRscy02L2lndEBrbQ0KPiBzX2ZvcmNlX2Nvbm5lY3Rv
cl9iYXNpY0Bmb3JjZS1sb2FkLWRldGVjdC5odG1sDQo+IA0KPiAgICogaWd0QGttc19wbV9iYWNr
bGlnaHRAYmFzaWMtYnJpZ2h0bmVzczoNCj4gICAgIC0gYmF0LWFkbHMtNjogICAgICAgICBOT1RS
VU4gLT4gW1NLSVBdWzExXSAoW2k5MTUjNTM1NF0pDQo+ICAgIFsxMV06IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDI5L2JhdC1hZGxzLTYvaWd0
QGttDQo+IHNfcG1fYmFja2xpZ2h0QGJhc2ljLWJyaWdodG5lc3MuaHRtbA0KPiANCj4gICAqIGln
dEBrbXNfcHNyQHBzci1wcmltYXJ5LW1tYXAtZ3R0Og0KPiAgICAgLSBiYXQtYWRscy02OiAgICAg
ICAgIE5PVFJVTiAtPiBbU0tJUF1bMTJdIChbaTkxNSMxMDcyXSAvIFtpOTE1Izk3MzJdKSArMyBv
dGhlciB0ZXN0cyBza2lwDQo+ICAgIFsxMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDI5L2JhdC1hZGxzLTYvaWd0QGttDQo+IHNfcHNyQHBz
ci1wcmltYXJ5LW1tYXAtZ3R0Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX3NldG1vZGVAYmFzaWMt
Y2xvbmUtc2luZ2xlLWNydGM6DQo+ICAgICAtIGJhdC1hZGxzLTY6ICAgICAgICAgTk9UUlVOIC0+
IFtTS0lQXVsxM10gKFtpOTE1IzM1NTVdKQ0KPiAgICBbMTNdOiANCj4gaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDQyOS9iYXQtYWRscy02L2lndEBrbQ0K
PiBzX3NldG1vZGVAYmFzaWMtY2xvbmUtc2luZ2xlLWNydGMuaHRtbA0KPiANCj4gICAqIGlndEBw
cmltZV92Z2VtQGJhc2ljLWZlbmNlLXJlYWQ6DQo+ICAgICAtIGJhdC1hZGxzLTY6ICAgICAgICAg
Tk9UUlVOIC0+IFtTS0lQXVsxNF0gKFtpOTE1IzMyOTFdKSArMiBvdGhlciB0ZXN0cyBza2lwDQo+
ICAgIFsxNF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lH
VFBXXzE0NDI5L2JhdC1hZGxzLTYvaWd0QHByDQo+IGltZV92Z2VtQGJhc2ljLWZlbmNlLXJlYWQu
aHRtbA0KPiANCj4gICANCj4gIyMjIyBQb3NzaWJsZSBmaXhlcyAjIyMjDQo+IA0KPiAgICogaWd0
QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kczoNCj4gICAgIC0gYmF0LWRnMi0xNDogICAg
ICAgICBbRE1FU0ctRkFJTF1bMTVdIChbaTkxNSMxMjA2MV0pIC0+IFtQQVNTXVsxNl0NCj4gICAg
WzE1XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODcyMC9i
YXQtZGcyLTE0L2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAd29ya2Fyb3VuZHMuaHRtbA0KPiAgICBb
MTZdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDI5
L2JhdC1kZzItMTQvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sDQo+ICAg
ICAtIGJhdC1tdGxwLTk6ICAgICAgICAgW0RNRVNHLUZBSUxdWzE3XSAoW2k5MTUjMTIwNjFdKSAt
PiBbUEFTU11bMThdICsxIG90aGVyIHRlc3QgcGFzcw0KPiAgICBbMTddOiBodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84NzIwL2JhdC1tdGxwLTkvaWd0QGk5MTVf
c2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sDQo+ICAgIFsxOF06IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDI5L2JhdC1tdGxwLTkvaWd0
QGk5DQo+IDE1X3NlbGZ0ZXN0QGxpdmVAd29ya2Fyb3VuZHMuaHRtbA0KPiANCj4gICANCj4gICBb
aTkxNSMxMDcyXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5l
bC8tL2lzc3Vlcy8xMDcyDQo+ICAgW2k5MTUjMTIwNjFdOiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzEyMDYxDQo+ICAgW2k5MTUjMzI4Ml06
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMv
MzI4Mg0KPiAgIFtpOTE1IzMyOTFdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2k5MTUva2VybmVsLy0vaXNzdWVzLzMyOTENCj4gICBbaTkxNSMzNTU1XTogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8zNTU1DQo+ICAgW2k5
MTUjMzg0MF06IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwv
LS9pc3N1ZXMvMzg0MA0KPiAgIFtpOTE1IzQxMDNdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzQxMDMNCj4gICBbaTkxNSM0NjEzXTogaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy80NjEz
DQo+ICAgW2k5MTUjNTM1NF06IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkx
NS9rZXJuZWwvLS9pc3N1ZXMvNTM1NA0KPiAgIFtpOTE1Izc3MDddOiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzc3MDcNCj4gICBbaTkxNSM5
NzMyXTogDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwv
LS9pc3N1ZXMvOTczMg0KPiANCj4gDQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0K
PiANCj4gICAqIENJOiBDSS0yMDE5MDUyOSAtPiBOb25lDQo+ICAgKiBJR1Q6IElHVF84NzIwIC0+
IElHVFBXXzE0NDI5DQo+ICAgKiBMaW51eDogQ0lfRFJNXzE3ODk0IC0+IENJX0RSTV8xNzg5NQ0K
PiANCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICBDSV9EUk1fMTc4OTQ6IDZkODhlMjFk
M2NjZGUzY2E5ODQzMDRjZGUwMjE3NDRkMGUzMjZlZTEgQCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNr
dG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBDSV9EUk1fMTc4OTU6IDBkOThhZTMwZGMzYTE0Nzlj
OWEyZDNlMzhiMzA2OGZhYTQ2ZTA0ZDAgQCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9n
ZngtY2kvbGludXgNCj4gICBJR1RQV18xNDQyOTogMDMxMGExZmVlZWJkNjQ5N2EwY2ZkMDE4NjM4
NWFjNzFmZmM0Nzc1MCBAIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdw
dS10b29scy5naXQNCj4gICBJR1RfODcyMDogYjM3YTRkNzAwODBhZmQ3NDI2Y2IyNDk3ODc1NDVk
Zjc1Zjc2MmRjMCBAIA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1n
cHUtdG9vbHMuZ2l0DQo+IA0KPiA9PSBMb2dzID09DQo+IA0KPiBGb3IgbW9yZSBkZXRhaWxzIHNl
ZTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQ0
MjkvaW5kZXguaHRtbA0K

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32627CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 15:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D763210E1FC;
	Thu, 18 Sep 2025 15:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDYYBmzM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C820710E1FC
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758210691; x=1789746691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3NQV8WQK5uKIy5+3LbKDW1cokOiXjpEcE6E26OnUiqM=;
 b=ZDYYBmzMNU+W6axLq6r1kqC/+3QLilsVr2s2r5YHpEutdwQ28F9MxOL2
 /nyfF1wVtV6+N3hpFepIFceXhAGl41F6p6FP3Zo+kp4dtLzXyfo3u70ue
 7p+lL4mRVvItWz+6ASdFR1d/wSlZh9fiiADZHQeuheyzrsy3Xewc1RwnK
 mxEyngMMa0vMd9mNPopL7K3CP6S8ce2DB5vDQJrFhj/IC+0dUtd/arn15
 WZ7i/5lzy7NTsaN51i7OZz/t25Gx59DKL2gQHbibjZDBLn169gUmPn1LS
 k/hbQozjSL98FGlvv4H7M3CJrbCE3t74iXdJA9j8RkDgOgc/wTvQJ61y0 Q==;
X-CSE-ConnectionGUID: YSPlfO9WTV6pXKpdnJwk0Q==
X-CSE-MsgGUID: WU+E6UwaT8miHmDi3kXHGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60492150"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60492150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 08:51:31 -0700
X-CSE-ConnectionGUID: rkkqpvHyTgyLje/Zhf7o0g==
X-CSE-MsgGUID: zy3VoKFWTemYKhjVP6Y2rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="206366230"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 08:51:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 08:51:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 08:51:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 08:51:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w564IkhDWxg3PKeusnSMxOIZFaLUIU0w5YrO0XQbQl60vRFPTDHc+tszbKhyd//Y8ZQ8H7Af/55j72q9hz6PRavJvwar9RK35pGrvgOxnHyczK4kzP75gLJ/WgoEZHd1RcDCBlHj+gdt/SR2U9Tt5y5eCZvTyoEVZqqxloUq5+3uHf42C7dGV4jTKAdLygAczvY7u7Ub1fh+5FIbxx41Ap5NmoS5Jld458BdHuQDHhrBwkVDDxrKc+30yeTgOz6QNXUGlZ3xh2MfDU0eUWQ0WdaPIkVtXFyg94V43fnWleNOiDxVoQM4eIaTKHzXqB/Iv0PVkEawJmWro2UGVYLC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NQV8WQK5uKIy5+3LbKDW1cokOiXjpEcE6E26OnUiqM=;
 b=eBNyggr5mGVdgjnteNIVqCt5XndrD/2leivlRMO4HxvVciIz53B9HHBwXl8yY88tCv9sR17IcASOewjgkjBKStuNVVlwcH7YOqgEg7UiJC5nAYSFtGXYj29/DEkHoN8MpQuNy1RFHvEObmp+8526nlsNFjq8jncr6gMv7dcg7ThbBPUjL+XsLSmJ9xAZyp2ExvkPnQKRtE1KECW+1rxUOngQqcV/jV/Ntklrwt+7w0si4oDS6JB6qpM1fxKXH4URXtjT9vZL4iIeLOtk4FRaElF5nmyg7vv041zkFmzY/SwUWeTd3y1LP+YimrkM5awCqEus2YezgYVSsPwuhl2kdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV3PR11MB8694.namprd11.prod.outlook.com (2603:10b6:408:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 15:51:21 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 15:51:21 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Thread-Index: AQHcJ+F10zzQHWbAB0egSbwS3BzC37SZFcCAgAACaUA=
Date: Thu, 18 Sep 2025 15:51:21 +0000
Message-ID: <DM4PR11MB6312F13CFE545457F89776619016A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250917144308.1355953-1-jeevan.b@intel.com>
 <20250917144308.1355953-3-jeevan.b@intel.com>
 <20250918154153.cop2oiparqg2tbph@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250918154153.cop2oiparqg2tbph@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV3PR11MB8694:EE_
x-ms-office365-filtering-correlation-id: 14bf981c-891c-4149-5b87-08ddf6cb36bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NkQyTmo3VUd4dXBQRXpIaUtuUi9FbzZuemIyaHpvSFNFV0YzWVZ3V081SXNL?=
 =?utf-8?B?ZzBQdHZTR3krVzBVbWNyeEZleUFhM3A1TWxMTFdEYkhGZERWeDdudy92QmZj?=
 =?utf-8?B?L0Q0ZllrcFJhU2ZMZFhMaVJUNzZJc29TTzF5M0IvN3dLSDdmTEtFRkw1Y1BT?=
 =?utf-8?B?TU5CamFzcVZ4ZFEvZC9WRkhaQzVjSDFtZUZCUFB2MEIzUnVoL2RwS0E0YXky?=
 =?utf-8?B?eTNnakJBNTlGNU9xQWFJQTF6NkNUK2JNY3VqaG43STRKQjdLSFFwdFQzSGtH?=
 =?utf-8?B?RHhHVjRoV1FOaHlxb0lsNWtCbWtGd1JaWHBqU3lOdmlRa2lRdVZnRkJ6Sm16?=
 =?utf-8?B?MGFmYVdDcEtSUFk5SmxaODI3bHdtMWxkc2dreUpNTVhsTDhZV3FZT0lVYmw5?=
 =?utf-8?B?TUFac1hJUjNzUlJndDl2d2xySXFVNmFyNDZCS1d3STlsbmMzbzRwTnVrV2Jy?=
 =?utf-8?B?ZEY5VzVYSE9oVEZNQzBtckhVMDhmYm02TDFwbjBEUHc5dnhiaEN1dmh5ZE1E?=
 =?utf-8?B?b0prT0RIL1JNQ3VWbUpudnROejAwREtRSVJEY1dveitwZkFVblhqbllvb1dl?=
 =?utf-8?B?R3Y5RmhNV1h0SmdhdzFQWkdhSjlqMGtzQmZPc0s4dzhHZTd3RTFXKzJiWFNQ?=
 =?utf-8?B?bTFkWDNZaWFVOWxyOG5sVlFZZU5JWis2cFFabUw3Q01uVmRDVjgzL3hrdS94?=
 =?utf-8?B?dGh6dkZVSTlzbE4wcFUrQzNiUzZVNXQ0TjdoUzBCckhEWGJMZDg4RC9rR0dt?=
 =?utf-8?B?VjI2OTJSaWRwTkxhVkdDNENBQW1QOE1jTjEvL3FWZEhUQ3ZBb0lhWWNUOWtQ?=
 =?utf-8?B?Z0NlM0FDdXBMa21GS01YUXZ1UkhIWTQrMng3SDdUb25BZE9Nb3lwbnpFVS9x?=
 =?utf-8?B?a0QyeCtMSHBSVHI3MGVMc0dXVEl4NytxOFFQa3ZlWkZEM2M5NDdBOVU5WUVr?=
 =?utf-8?B?SUFnYjVIZWl1bTdNL21rZG1BMWFyS0U1UHZwMThSTElCZlk2V2FCM3AzbVdy?=
 =?utf-8?B?dlRFaXowb1hJeFJGUVptSGRvQ1IxUFBaamY1UmI0THdwcFVTODkwOTJCajMv?=
 =?utf-8?B?TnhkNGQzQUZ0OWs5enh0WE11L1pxcHZVczBjQ1NTV3lzL2NHajVuU252cGN4?=
 =?utf-8?B?SzNJaVROb0drOU9tMTZ3a3V1eXZISFNKUHc1WDhFcTZ3R20vNVBBaTduUmpN?=
 =?utf-8?B?RlQvZi9HSmZ2TEV3dEtWNUJhemYwV21qUFAzOFdtbzErbkVBSTRFZ3pOZlpv?=
 =?utf-8?B?QjdESlJCRjNLZERZUVJpb09UdE5UcXFJczAwZUZidVFZYUR0YlZwWnNvOHlI?=
 =?utf-8?B?bFFNaW9XRk92RHhCVkMzNHNCVzExR3V5Y0swaFBsb2Y3c2tjM2x2aXErMGtV?=
 =?utf-8?B?WXJ1ZTRDWFNVaUpoMklHM3pmSWJUWjMxRG8ySTFpblFLL1pqeUxLRk95SGVL?=
 =?utf-8?B?OUdvUUg1UzE0TUNtU05rZ1c4MW1CMlBYYzlZNUE1b2svdDM4eFNPallMRVNm?=
 =?utf-8?B?ankreGNFaWpUakk0RDV5cDI4aXZJc3VNMXRJbzl4aUJHMk1NODR2YkFxT0oy?=
 =?utf-8?B?RWxRSmg4YytkRnFicmRWRTAwbG5idVd2dFM0R2hDdlJ3M2tZKy9pOW91V0Jx?=
 =?utf-8?B?S0lBNVZWT2EzVEQzeE12Mmp2SlhWeUJHNFRaZGw2Y2l6SXlkbmp1aTlLcUxW?=
 =?utf-8?B?RWtuRjU1TjNxaE5Pc0xya20yOE5hNUlna3NjeDhlMmRacmsvUk4vaTZHMnpX?=
 =?utf-8?B?OVdVVUk1dkhpMkk2MHkyZ3VEU3VZcUVRM0tjODFKRThOeUQrZ0J2U0tNREYv?=
 =?utf-8?B?YUVlcjVvdWJsQUMwa2NnK2sreHB2OVhwbXRyK3FlazhuWXRGSFBqbVFlY1ZF?=
 =?utf-8?B?M3N4d0d6ODMrSmF0bzE5c0gyRGVnNVJLL2syaHBobktyN1Jud1BMSndRa3Za?=
 =?utf-8?B?UlpGVVNiUGQvTXlydTJnclZlM0VLRWN2WmdNMEJDSjhJNW5FUWFaYk9FNzkz?=
 =?utf-8?Q?9ykfAsRnUuB8yr3p2DZi/UdKODk1H8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0wrVGZ0RGp6RXM4YzduVDR2d0RTVkxYNmlvWU1xcm5lNW9KL2JGNnduVDdT?=
 =?utf-8?B?TitWT1RMVXlUVzBKdXNBU29BMGhyVTB2RzlVZXQ2Q0xMaHU4NmZmdnRMZktw?=
 =?utf-8?B?bExMdERQdXMvRS96NmJxVkdKVktxaHhFK2MrdHgzN1U5NzVpb1EzcWJkbzEz?=
 =?utf-8?B?NHJPemNmZ3hLUVdHUHgwUjFQT0lvRkRNQTdUVlRwYlU0K0E3UG9TdWZCZjJY?=
 =?utf-8?B?UVZMT1BUb2FrK3BZMEprQ0J5RzI2Y3FDZmV5a2RJMVBaZ1lEV2VKNzNvUTlL?=
 =?utf-8?B?N2RuaXBUc09DY3Jaa1p1Smk1YzMzT2pWVUdiekcvbGpaUTBvMnF6Zyt0c0M0?=
 =?utf-8?B?aUViRXVRTnVtcEllL0c2c3ErUzFNbDcxM0pwTHFjME9TS3QvN1ZjemVTb1Nh?=
 =?utf-8?B?eUhESUxTUGd6UlVhdUdZMEdHYUZnVzh2d1hDY2JFaDN6a05DRGlERElkUTdF?=
 =?utf-8?B?Vm9NZGJkM25TYUtlWmhwOXZZM0c2YXI3eGZQM1lKWDVISkZaUmN1TVFIaVJJ?=
 =?utf-8?B?NDBDZnZoN3pDVkJFOWhDeXlodW9Pb2Z6TjlRZXhSSzN6QURSdTVObm1qWWxO?=
 =?utf-8?B?YTlyejNHRzhZYlI2VnJQY0EvdXlzZHdab2M4c0ZOZHdIczF6VU5pL0tBMEVa?=
 =?utf-8?B?R0tDb3R1K2tlYm5SQXRsMTRqcEZMTVcyZlZLUjFSK1dqWTJFUnhLMWZhZlJB?=
 =?utf-8?B?bmppc2F3MXlZT1lMU054M3lHRUVuWUR0UzYxei9neEE0eTZUa2lvTFQyMmlP?=
 =?utf-8?B?UVNiT0Z6WEVIZjUzQ282WW5Vai9wdGZzUDc5a0FaendDQnZrbGlVdVJNVDdM?=
 =?utf-8?B?Z1RWVk15L2FIdDk5S0FFSE5Hb3ZkUXBGQ3VBdERzUFM2VGdTb240UUlQSEEr?=
 =?utf-8?B?WU1kTFNtd3FHUThOSVlqRWw2QkRWcnRqbUJUSDhDV1N4SEpXMkh1ckx3Nm5P?=
 =?utf-8?B?SnpIOXBVYStvVGxHazc1aFBtSjBRN2I0dnRYN3NESjB2Rnczdk5BWTFJS3NV?=
 =?utf-8?B?emFXWmtzeTdwemtwSnllbWhEWURNU3NyOEZlTFBOSHRUNmVlNDVvN3VHZUtP?=
 =?utf-8?B?N3RsSkdIRGZSQUhqb3dycWVmci9MMzMxZzY3d3VoUk5ZM0FrRWc0cHEvVW5F?=
 =?utf-8?B?dHAvZ2VkTXlVa0dPRElrVXRjQ1FaVlNCVHBjOVRETDFMVTNVUlhGTHJNSFdC?=
 =?utf-8?B?dHJyNFR2QjBxVmRucmU5akwzYzNLNGI0a3A5Sm1oa0ZoVWZOaDRTY1F3WmVi?=
 =?utf-8?B?bURBZmZJbXVERmVCUXRxWXpkTXV5Wktvb0dmbTI4bHIxbDVQY3B6YSs4eXdi?=
 =?utf-8?B?QWZJV3dnbkc0aEZEa2VkSWhSNFJzczZpcllaTE02c0txVFlkalJwcUlYZWRR?=
 =?utf-8?B?bXJDVkhOMnk1ZlVCM2lUV0tsclVpelI5YStjOHp1ZTY3U2l5akEwcjc2MWV4?=
 =?utf-8?B?NHhheHl0ZUsvWlkvbkxBN3dnVlMxSFFxTCtjYndoNUt2ODVqWmZ4Q2VUOWZa?=
 =?utf-8?B?OGRiWGJLdDBoUXZRY3R1U1dUeGk5Qm13QlN5ZkF2MmJjblAxNDJVWmk2bjJx?=
 =?utf-8?B?aEt4bW5maHJKNWMzNm53QTJvaFJyeTRwbERVcGUvbEJLOHZ3MVFFNWlyRUg2?=
 =?utf-8?B?aXFRTFNkQUFGM2VWdGhoNENFeWQ1SUxEdWkvd1pnNnVJQjFvY1Z0L2NQQ1VP?=
 =?utf-8?B?UHErMC80UDg0QUtSOVZUSWtRdjlnMzcrWUdKcWNSTENpZmd2bnNnS0dsVzhT?=
 =?utf-8?B?dkdOYjJZUWxLNXhMdlVoTW0yREhFOVYwa2xPbHVSTnB5ZXVtbjBMcW5Qczhy?=
 =?utf-8?B?V01rN2RabDloYjhNeEowa1drSmlUdjY3MER1ODVOZDl5SERRK3JOYTBQNjJ2?=
 =?utf-8?B?REd1cmkyMWtESEo4WmJCc0x5YVZVKzZlTUtjWWZ2aUwvMFFZWHNqdXh3WGN6?=
 =?utf-8?B?dk4zQk9sRUNZODZ0M282SlVBcTdtY0dkQkdBb2syTEZUbjZQUWRTY3lXelJt?=
 =?utf-8?B?a1dIKzhhQ2t4anlrYnNSdUhYN2FNSHQxdUJHMk1DUWxMOUtpRUw2SkN4Vlhn?=
 =?utf-8?B?ZnlBY0NEVmFqNGEwem5xc0lHUkU1ZkZhbE9vc2JZd0labnZVMzAySVc0dmJn?=
 =?utf-8?Q?fCvg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bf981c-891c-4149-5b87-08ddf6cb36bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 15:51:21.3369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9c8r9YVk9ZjBrSDjbLLIE05/ymrwfgTr8BpI7u7Rn4zC1iCp7odpRJN/a0PjM1CeKMa4m3On2j/Tw0iUVtWPag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8694
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYW1pbCBLb25pZWN6bnkgPGth
bWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1i
ZXIgMTgsIDIwMjUgOToxMiBQTQ0KPiBUbzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRlbC5jb20+
DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2hhcm1hLCBTd2F0aTIgPHN3
YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IDIvMl0g
dGVzdHMva21zX3NldG1vZGU6IEZpeCBjbG9uZSBtb2RlIG1pc21hdGNoIGJ5DQo+IHByZWZlcnJp
bmcgZURQIG1vZGUNCj4gDQo+IEhpIEplZXZhbiwNCj4gT24gMjAyNS0wOS0xNyBhdCAyMDoxMzow
OCArMDUzMCwgSmVldmFuIEIgd3JvdGU6DQo+ID4gSWYgYW4gZURQIGNvbm5lY3RvciBpcyBwcmVz
ZW50LCBwcmVmZXIgc2VsZWN0aW5nIGl0cyBkZWZhdWx0IG1vZGUgZm9yDQo+ID4gY2xvbmluZy4g
U29tZSBlRFAgcGFuZWxzIHN1cHBvcnQgb25seSBoaWdoIHJlZnJlc2ggcmF0ZSAoSFJSKSBtb2Rl
cywNCj4gPiB3aGljaCBtYXkgbm90IGJlIGNvbXBhdGlibGUgd2l0aCBleHRlcm5hbCBkaXNwbGF5
cy4gVG8gYXZvaWQgaW52YWxpZA0KPiA+IGNsb25lIGNvbmZpZ3VyYXRpb25zIGFuZCB0ZXN0IGZh
aWx1cmVzLCB3ZSBjaG9vc2UgdGhlIGRlZmF1bHQgbW9kZQ0KPiA+IGZyb20gdGhlIGVEUCBjb25u
ZWN0b3Igd2hlbiBhdmFpbGFibGUuDQo+ID4NCj4gPiB2MjogRml4IGxvZ2ljIGZvciBlRFAgZmFs
bGJhY2suDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9rbXNfc2V0bW9kZS5jIHwgMTkgKysrKysrKysrKysr
KysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19zZXRtb2RlLmMgYi90ZXN0cy9rbXNfc2V0bW9kZS5jIGlu
ZGV4DQo+ID4gNDlmYzQ1MDQzLi40M2QxZmM5MTQgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMva21z
X3NldG1vZGUuYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19zZXRtb2RlLmMNCj4gPiBAQCAtMjU2LDYg
KzI1NiwyNSBAQCBzdGF0aWMgdm9pZCBnZXRfbW9kZV9mb3JfY3J0YyhzdHJ1Y3QgY3J0Y19jb25m
aWcNCj4gKmNydGMsDQo+ID4gIAkJfQ0KPiA+ICAJfQ0KPiA+DQo+ID4gKwkvKiBJZiBhbiBlRFAg
Y29ubmVjdG9yIGlzIHByZXNlbnQsIHByZWZlciBzZWxlY3RpbmcgaXRzIGRlZmF1bHQgbW9kZQ0K
PiA+ICsJICogZm9yIGNsb25pbmcsIHNpbmNlIGludGVybmFsIHBhbmVscyB0eXBpY2FsbHkgZGlj
dGF0ZSB0aGUgY2xvbmUgbW9kZQ0KPiA+ICsJICogYW5kIG1heSBoYXZlIEhSUiBzdXBwb3J0LCBt
YWtpbmcgdGhlbSBpbmNvbXBhdGlibGUgd2l0aCBtb2Rlcw0KPiA+ICsJICogc3VwcG9ydGVkIGJ5
IGV4dGVybmFsIGRpc3BsYXlzLg0KPiANCj4gQ291bGQgeW91IGFsc28gd3JpdGUgdGhhdCB5b3Ug
Y2hvb3NlIG1vZGUgd2l0aCBsb3dlc3QgY2xvY2s/DQo+IEl0IGFsc28gcmV0dXJucyBvbiBmaXJz
dCBmb3VuZCBlRFAuDQo+IA0KPiBXaXRob3V0IGEgZ290byBpdCBsb29rcyBiZXR0ZXIgYnV0IEkg
YW0gbm90IGFuIEtNUyBkZXYgc28gSSB3aWxsIGxlYXZlIHRoaXMgdG8gU3dhdGkuDQo+IA0KPiBS
ZWdhcmRzLA0KPiBLYW1pbA0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBJIHdpbGwgYWRkcmVzcyB0
aGUgY29tbWVudHMgYW5kIHJlZmxvYXQgdGhlIHBhdGNoZXMuIA0KDQpSZWdhcmRzLA0KSmVldmFu
IEINCg0KPiANCj4gPiArCSAqLw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IGNydGMtPmNvbm5lY3Rv
cl9jb3VudDsgaSsrKSB7DQo+ID4gKwkJZHJtTW9kZUNvbm5lY3RvciAqY29ubiA9IGNydGMtPmNj
b25mc1tpXS5jb25uZWN0b3I7DQo+ID4gKw0KPiA+ICsJCWlmIChjb25uLT5jb25uZWN0b3JfdHlw
ZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKSB7DQo+ID4gKwkJCW1vZGUgPSAmY29ubi0+bW9k
ZXNbMF07DQo+ID4gKwkJCWZvciAoaW50IGogPSAxOyBqIDwgY29ubi0+Y291bnRfbW9kZXM7IGor
Kykgew0KPiA+ICsJCQkJaWYgKGNvbm4tPm1vZGVzW2pdLmNsb2NrIDwgbW9kZS0+Y2xvY2spDQo+
ID4gKwkJCQkJbW9kZSA9ICZjb25uLT5tb2Rlc1tqXTsNCj4gPiArCQkJfQ0KPiA+ICsJCQkqbW9k
ZV9yZXQgPSAqbW9kZTsNCj4gPiArCQkJcmV0dXJuOw0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiAr
DQo+ID4gIAkvKg0KPiA+ICAJICogSWYgbm9uZSBpcyBmb3VuZCB0aGVuIGp1c3QgcGljayB0aGUg
ZGVmYXVsdCBtb2RlIGZyb20gYWxsIGNvbm5lY3RvcnMNCj4gPiAgCSAqIHdpdGggdGhlIHNtYWxs
ZXN0IGNsb2NrLCBob3BlIHRoZSBvdGhlciBjb25uZWN0b3JzIGNhbiBzdXBwb3J0IGl0DQo+ID4g
YnkNCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=

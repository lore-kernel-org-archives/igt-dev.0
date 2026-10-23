Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30968606A319
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bN8nlJsi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE31A112991;
	Fri, 23 Oct 2026 05:29:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46B5112963
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 05:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792733291; x=1824269291;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jPG320hW/fu4MtBiowVRTrSxDUyaijz2FjxQ92XQ0IM=;
 b=bN8nlJsit9uh7n8UvlQsDT22fporLew+2nhujOXl/S2jvIHqYm4jQpP2
 tjYXC4oQsnOEn7qYm3YX/mJg2D+RuNQ+ZlNccC/dUDLKRzK/zK1yIhJ2m
 wj0dEYjLOLgbrLCImlwYt+OFgYNqjD8l+Qypk615tptnbT/SQbkCWTi6y
 nn3jsR0qVG6RnabrUpcQ+tXsSuNHBfN5Va9aiW+RhjuH3rB4HIzvwoMFL
 5hqcecRkah9/6k+Jc6M5BB2TmD2MvLTX9n2oBNfUQMtRWXlwCpGaGmOTZ
 bjjSAbi4F0LgWUJ385DNbuclAK59vt5KluXtEVjALG/W1lQ7UZlS74fSX g==;
X-CSE-ConnectionGUID: Ywcfh4lkR2etnFn0/ytPww==
X-CSE-MsgGUID: 3Iqu3ac7Sc6pVoEe2IezDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1503939"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1503939"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:28:11 -0700
X-CSE-ConnectionGUID: 3UWLh+c6QbiGekJc/8zv0w==
X-CSE-MsgGUID: ApuqnzfAS0Sp0hMThQkRaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3929912"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:28:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:28:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:28:09 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:28:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXQO10WTzDQQp3D8cI6PvRm1rLnRHBWTrqCEivf3oIin/Agn1SRTt5Ogz6cZ34vesALJs6uVjJZKnqONt75iway/DpNnTt/GiVnoRbHG+0RdBy+OP5SEoX98glkdAEqWQ8QnfebkuM9RAIJaQQVH+paaYRVIM0ImoGiWazKrhXlC1Axc4JHromOLqzQh0Ha0AunMDOSs/G/NfpbUp6yPyU0XexlqS90facY5q6z+r5rdf/wQMcR+68qL86ElYv3swPkwkFNLk71b7DrjQFcUwBIAqmgZ8DMhvf3rrtoy0Gg87Qgx05IIVXJjFx+VtpvYIkJpw6D1DjZFOJP5e7HT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPG320hW/fu4MtBiowVRTrSxDUyaijz2FjxQ92XQ0IM=;
 b=BRrT5W4F0HJ/x61IIX2Yx85AaZE27Xm19YaLnlgd90Cq1uI7DNoc+0ADi+SardRv4fyJvPA433Eai3Se3ObO2/AKjuwirE81YfrWTlkRx9CxJotbaM56tizxs8N/0EkwnR0/NTsyc7xfLy7uZz4DtyZ4/lpP5rfkukIfkFnwoujDvOUK/SaEFGrz/PtS/tqHJp0rDQ751Wj9lRec56NevQzgvGMbCH7PwMhcrDZHbD0sqCVeLXHcOAp2Abj0ZRNwtgU+yXUzhb4SSNCSnzKWGnU8Yeb49bW5GrAwvp6+xf8ymE8TxjQgVaXALY5SrdU6J+WR8E3Fkm7//hGqr81mvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by SA3PR11MB719904.namprd11.prod.outlook.com (2603:10b6:806:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 05:28:03 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 05:28:02 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>, "Grzelak, Michal" <michal.grzelak@intel.com>, "B, 
 Jeevan" <jeevan.b@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
Thread-Topic: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
Thread-Index: AQHdXLEgCFqiRnT7fU2fAHDjEvV8vrcKm8cAgAAIlqA=
Date: Fri, 23 Oct 2026 05:28:02 +0000
Message-ID: <BL1PR11MB5413239E7CA4C069551AD3A8E2642@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
 <20261015140035.2686997-3-chaitanya.kumar.borah@intel.com>
 <BL1PR11MB5413188823D4E12C92070E0FE2642@BL1PR11MB5413.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5413188823D4E12C92070E0FE2642@BL1PR11MB5413.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|SA3PR11MB719904:EE_
x-ms-office365-filtering-correlation-id: a2931f4c-cd1f-4afd-a744-08df30c668c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|5023799004|38070700021|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003;
x-microsoft-antispam-message-info: MEplo/9Aj5W4uYILlXXIcVQArAWVsYu9k6g69Pg9cb6KVBrDS5tYO2q6pcsudHSqLvwD2AHrQsVrSlnrLRFsBIbInkAofIKrBvitU2g05K4gzIC5YVfwO07V+GH1KpQfnVh9zhzSlCBwoVyd0M+haT56VXaVCGxpkOcRbvFZ5VheqGSnl1KwAzJ2buZYFqxqQX1yqY6x1RdQxnhcWhKToOOWgUh/P8EzhtdHcht7NuAP+0iPI+WrovtKy0Yae2LKc/EsHanp6/IFhGCnaZg6g/SK1et9+RmDzZkTSMPgmPF7nNzGbNgVqZ6+H7RdO7VQ4ly0hxlFaSo7dseim3hCR4lWRDmLNv3GNDE1wsUqNqO2mnqt+qd2AW0tR7hN2ayeEG61tY7ftcxORLaw3sYLBzBYpum3+mauPUSdGeocscyA8V/AuGyVDya4XauPkYJWn64jJ8tB5wS5tbdZVzohHOJOWLkKUWWlIB/nHijYZvFBsOQ5/bBrW9yyjRT4LC1+P5qlT0JeRv1afKdMu3TylxLePJYTlJ3cHegXfTywN/XK432MI2oIl8Zcagl3lHfoXxkhnxI9CBmhh6kWblsfE7jMvwawEO8WJjK3xPZHf+sS0k36DQ75miauBDMx/jchSUYStJ4Sxhrx9QSk74f1P2uy89OqdAtA9oA8I6KovbLFKOI4vGWbQhsGmbjz4dO2Zj3eghHDjuZpPjoGHZlv/7Joml2fas2vmgNM/qZosnU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(5023799004)(38070700021)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2N0YjhtZXVOaU1nZUZoVnlQNHhXN2oxNnN5ODFjdFdkYlc0RDQzQ3d2MURW?=
 =?utf-8?B?eWN2dEVlYUIxVHBNaWR5cUtBbHdoUUpQZ2NWRzBHamRQaWhGRkgvR3Q2WURm?=
 =?utf-8?B?M2NJMWF2ZnByRkVJMGxQQjNMd2E5MnFqbG5YT3VXeDBRanh3RjZPTHl0NGVj?=
 =?utf-8?B?c0dvUDUzL2NJWnRFbnFTY2crQkppOUxTNmJSRTRDdmU5V0ppS3RHQXpMNk92?=
 =?utf-8?B?WVlLRVhMdWhLbnA4NW9HMlVJbVh4MjRzVFRGT3F0RkE5UW1LbUJDR1ZKY0wv?=
 =?utf-8?B?b3hUVVVoWjVZbjgxR0orbk0zdjhzYVIrQXdXb1BOQ3RKTmx1U1RGWEs0RlVl?=
 =?utf-8?B?MXlXbjNXcjBUK3BaWHUvM3Vha1cyK29hZzlJWEpjMit5Mmk5RUdnM2t3OXAy?=
 =?utf-8?B?QWRYSXk1cUtiVGR0VkwwMVA1VytuMWJ0OUlPVS9zSm8zcGw1b3NMYWR2SlFU?=
 =?utf-8?B?UVcwS3Z4K20yRHltd0hzQjRaN0pBdXVHM1UrV1ZsNVhOSW9ydU9XVkVrQlB6?=
 =?utf-8?B?bjgxS2p2MWprbGxPMzMxYW1TQVRab2Rjd01yaG1RMUhsanZibE1ZMUF2NmJX?=
 =?utf-8?B?Ri83NVVIeGFKZi9Jam00TVJjOHdUcCtEanBGYzI5RTFuV1VnZkkxL3lrU2di?=
 =?utf-8?B?bHZ3VGVWZDNMZHJUd3ZrWUtic0VtMDFMeU1jUlBqYXVnSzJBZ202MEZLZUp5?=
 =?utf-8?B?OHRaQU1yOXZyaXBvbXpKWEQrZkZlUGRVVmh1aFE5Q1dEWlc1QVRMYko4NC8v?=
 =?utf-8?B?RnRiKzMwTmYzS1YxeHc1VTF1UFMxWXU2ZmVuZEI1aHQrbWd6dXN2cXpLTEZP?=
 =?utf-8?B?bUpvMTVaYlZ3UEhHV294ZXVjV3Q0V293SVRhSlJiYWFuKzRHbzBpK1ZBYk9x?=
 =?utf-8?B?YVEzTDgzaGd3NlBvUlhCTjU1aElMZkZGdUhqdUZPT1JGeHNqT1J0d1VkY0pN?=
 =?utf-8?B?MWNkNWVoZ2wwZnVHdEY5OCtxNE5ySmwvUzl3WHlGNjJuMTgrZ2hHQWF5RXBN?=
 =?utf-8?B?NVlLaVlabytHenc3cjhXWnJmeVVNNSszYlZaOFlEK05vOHh5TmhqWVN0N1ov?=
 =?utf-8?B?U0pzaUJwRHY3MXJVYUd5QTdZcUduQkVpT2E1TzNCZ2JKNllSa2E2MnBpQUFX?=
 =?utf-8?B?MnhUZzdjcjhTQlMxczVFWVBnVGs0czh0Q3A0eXhWanRBcnZ1aDgyREgzelBW?=
 =?utf-8?B?eW8wNnpVYm96Q1ZCbExKeDA1KzlIZ0lWWEF6NnJGZWR2OUVXWk9TYUlpU3ZS?=
 =?utf-8?B?blN2cW0ydjc5QUNFTFBFR1ZEaGFKVVQrWmo2emFQSWhBVXFieGFoeE5yeVRX?=
 =?utf-8?B?Nkl0MG1SS2czOTlvaTZjdEVoamxPVGx0K0RUcXo4NVNFOGV6a0ZiQ2dWdnFa?=
 =?utf-8?B?bWJLNFpmQzlINVN3VlBPMk1HYXU3YmtuRElGR1YzK1BOa2FrMUhHMGZOM3py?=
 =?utf-8?B?RzRFeXAvM1o3Vi9FT1hEUkZBdi9LWWYzandTNFZjdkpobDhvUmk3K05NRHNj?=
 =?utf-8?B?bit0NmlaM3NETlVVNDhYU2VUalcwV3FnVTVhb3UrcjNtclZiU2xVc0dwdDBy?=
 =?utf-8?B?SnJWdnlhRTZxcnMrdVN4dDBFbnFlY2h0dHZNUHlkNUxrY0ZtSDhGc05WNm90?=
 =?utf-8?B?REFOZEQvV0lxYlBtWXU4WUt6SmFPV29zNUNXMjZBd05Ca1paZ09DNUU5UnZ2?=
 =?utf-8?B?cTRYMlJCV3NaQVUyTFNQK1NnWDVsdE10ekYzS0s1aE0zcmxXei9sTG1kYStY?=
 =?utf-8?B?T1p6N2R2TFZPYlUvSGVGNklieVcyQzdVL3J0TElPbFB1MmYwaVdhQVhUNTc4?=
 =?utf-8?B?SHI0VC9Id2JpcVIwUHZDamd0WmU2RWtxMm83cWFBelhaTFM4Z29IdGIzL1NH?=
 =?utf-8?B?NnQwZis4dVdSR1JpdENneUNIOTVCTVpaV0hiRmRKRm5VRnhxR0RTTEZzQmQ2?=
 =?utf-8?B?Z3orNVdkVEJSSWF3TW4yUVB0emk4aXZCQWlkVm92UGFYc01vVXBTcmNQT2V6?=
 =?utf-8?B?YlJzbEhNUVNxS2JVb3lWWldsVkxYM0sydjdadVlqa3F0TnpCT3RBZGRadlFL?=
 =?utf-8?B?MXlGa2x1MkJJazc5eTEza2tJTkZQQVVKcG5mVzliM0EvU3plWE9wUFRJZW10?=
 =?utf-8?B?R3RGaWNWSFpnNDF3cnFNS2twbm8zVVFkaVlMMkxSVGhRUVpFNzB6YTFoM0NH?=
 =?utf-8?B?MHpvRE44RzJDK2huTkxURUlNQnp2TGtMaTM2N3BYVmd2Y2lGZE5mMUpCbzlk?=
 =?utf-8?B?ZVZFYSt2UFIreVBGbGNiYXhFVUZHcnk4cDAxQWk2Q2VPWWs1VDJkcGw2cXc5?=
 =?utf-8?B?NWRSR0kxMklPcHAzdndhV3lhalRITWpNelFEVS9EcCtxYVRyQTR5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WzGUeFIcvRe4Ndh3Jyh2b24fLjmQtOj6t9Q+LHJKpEJJe1Uj33OS/WIH2y5+Bdmqk9yvZNqWgUiaNShTkE79o+bR/6uKNQbyrLMPchvYGVTjzi3tUTu0zeRl2+kK8wGI9rYPwIc+S/6mYFm49jqjABVO/N8PPri7gDw3FqkL5op59EX91rbCgDdQSqCxhhdpIaPyeHZtn80ATGJ6zR8pGAkPymRASD4I1iq/2zCesRiQTtet+9Jh+VzdmCr9XN12cmU3YafCRtHnq1kL/mHDxf/5Di35sUMvGhO9RdnrHHTqcuF3wB/rWQrGA6qYbNGZZJzbgSH7t8MbYMuWIw5fsA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2931f4c-cd1f-4afd-a744-08df30c668c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 05:28:02.8394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+dTIVxCAwIyVcTCRLhZVeicCmeHmnX57ro6A+wcwZL8oxKXhmD+iQQum1JHrnLQnpJZHMJ/Jeovt2W99aH7LsAWrPLRez926PqliX2AmPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB719904
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmhhZGFuZSwgRG55YW5l
c2h3YXINCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDIzLCAyMDI2IDEwOjMyIEFNDQo+IFRvOiBD
aGFpdGFueWEgS3VtYXIgQm9yYWggPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+OyBp
Z3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEJvcmFoLCBDaGFpdGFueWEg
S3VtYXIgPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+OyBBbmlyYmFuLCBTaw0KPiA8
c2suYW5pcmJhbkBpbnRlbC5jb20+OyBHcnplbGFrLCBNaWNoYWwgPG1pY2hhbC5ncnplbGFrQGlu
dGVsLmNvbT47IEIsIEplZXZhbg0KPiA8SmVldmFuLkJAaW50ZWwuY29tPjsgU2hhcm1hLCBTd2F0
aTIgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIGktZy10
IDMvM10gdGVzdHMvaW50ZWwveGVfc3Vydml2YWJpbGl0eTogUmVsb2FkIGF1ZGlvIGRyaXZlciBv
bg0KPiBleGl0DQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YNCj4gPiBDaGFpdGFueWEgS3VtYXIgQm9yYWgNCj4gPiBTZW50OiBUaHVyc2Rh
eSwgT2N0b2JlciAxNSwgMjAyNiA3OjMxIFBNDQo+ID4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+ID4gQ2M6IEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgPGNoYWl0YW55YS5rdW1h
ci5ib3JhaEBpbnRlbC5jb20+OyBBbmlyYmFuLA0KPiA+IFNrIDxzay5hbmlyYmFuQGludGVsLmNv
bT47IEdyemVsYWssIE1pY2hhbCA8bWljaGFsLmdyemVsYWtAaW50ZWwuY29tPjsNCj4gPiBCLCBK
ZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47IFNoYXJtYSwgU3dhdGkyDQo+ID4gPHN3YXRpMi5z
aGFybWFAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAzLzNdIHRlc3RzL2lu
dGVsL3hlX3N1cnZpdmFiaWxpdHk6IFJlbG9hZCBhdWRpbw0KPiA+IGRyaXZlciBvbiBleGl0DQo+
ID4NCj4gPiBDb21taXQgMTE3ZTllY2JkZDFkICgieGUvaWd0X2ttb2RfdW5iaW5kOiByZWxlYXNl
IGF1ZGlvIGJlZm9yZQ0KPiA+IHVuYmluZGluZw0KPiA+IHhlIikgbWFkZSBpZ3RfYXVkaW9fZHJp
dmVyX3VubG9hZCgpIGJlIGNhbGxlZCBiZWZvcmUgdW5iaW5kaW5nIHhlIHRvDQo+ID4gYXZvaWQg
dGhlIGF1ZGlvLWNvbXBvbmVudCBiaW5kIHdhcm5pbmdzL2Vycm9ycyB0aGF0IGhhcHBlbiBpZiB4
ZSBpcw0KPiA+IHVuYm91bmQgd2hpbGUgc25kX2hkYV9pbnRlbCBpcyBzdGlsbCBhdHRhY2hlZC4g
Qm90aCBjYWxsIHNpdGVzIGluIHRoaXMNCj4gPiBmaWxlIHBhc3NlZCBOVUxMIGZvciB0aGUgdW5s
b2FkZWQgZHJpdmVyIG5hbWUsIHNvIGl0IHdhcyBuZXZlcg0KPiA+IHRyYWNrZWQsIGFuZCBub3Ro
aW5nIGV2ZXIgcmVsb2FkZWQgaXQgYWZ0ZXJ3YXJkcy4NCj4gPg0KPiA+IEFzIGEgcmVzdWx0IHNu
ZF9oZGFfaW50ZWwvc25kX2hkbWlfbHBlX2F1ZGlvIGlzIGxlZnQgdW5sb2FkZWQgZm9yIHRoZQ0K
PiA+IHJlc3Qgb2YgdGhlIGJvb3QgZXZlbiB3aGVuIGV2ZXJ5IHN1YnRlc3QgcGFzc2VzLCBzaW5j
ZSB4ZSBhbHdheXMgZW5kcw0KPiA+IHVwIHJlYm91bmQgYnkNCj4gPiByZXN0b3JlKCkgYnV0IGF1
ZGlvIG5ldmVyIGRvZXMuDQo+ID4NCj4gPiBDYXB0dXJlIHRoZSB1bmxvYWRlZCBkcml2ZXIgbmFt
ZSBhbmQgcmVsb2FkIGl0IHdoZXJldmVyIHhlIGdldHMgYm91bmQNCj4gPiBhZ2FpbiBpbiByZXN0
b3JlKCkuDQo+ID4NCj4gPiBDYzogU2sgQW5pcmJhbiA8c2suYW5pcmJhbkBpbnRlbC5jb20+DQo+
ID4gQ2M6IE1pY2hhxYIgR3J6ZWxhayA8bWljaGFsLmdyemVsYWtAaW50ZWwuY29tPg0KPiA+IENj
OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiA+IENjOiBTd2F0aSBTaGFybWEgPHN3
YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdW1h
ciBCb3JhaCA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
dGVzdHMvaW50ZWwveGVfc3Vydml2YWJpbGl0eS5jIHwgMTEgKysrKysrKysrLS0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9zdXJ2aXZhYmlsaXR5LmMNCj4gPiBiL3Rlc3RzL2lu
dGVsL3hlX3N1cnZpdmFiaWxpdHkuYyBpbmRleA0KPiA+IGJhZTllY2EyNy4uMmJlOGU5ZWMwIDEw
MDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3N1cnZpdmFiaWxpdHkuYw0KPiA+ICsrKyBi
L3Rlc3RzL2ludGVsL3hlX3N1cnZpdmFiaWxpdHkuYw0KPiA+IEBAIC0zOSw2ICszOSw3IEBADQo+
ID4gICAqLw0KPiA+DQo+ID4gIHN0YXRpYyBjaGFyIGJ1c19hZGRyW05BTUVfTUFYXTsNCj4gPiAr
c3RhdGljIGNoYXIgKnNuZF9kcml2ZXI7DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgaWdub3JlX3dl
ZGdlZF9pbl9kbWVzZyh2b2lkKSAgeyBAQCAtMTU4LDcgKzE1OSw3IEBADQo+ID4gc3RhdGljIHZv
aWQgcmVzdG9yZShpbnQgc2lnKSAgew0KPiA+ICAJaW50IGNvbmZpZ2ZzX2ZkOw0KPiA+DQo+ID4g
LQlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZChOVUxMKTsNCj4gPiArCWlndF9hdWRpb19kcml2ZXJf
dW5sb2FkKCZzbmRfZHJpdmVyKTsNCj4gPiAgCWlndF9rbW9kX3VuYmluZCgieGUiLCBidXNfYWRk
cik7DQo+ID4NCj4gPiAgCWNvbmZpZ2ZzX2ZkID0gaWd0X2NvbmZpZ2ZzX29wZW4oInhlIik7IEBA
IC0xNjcsMTEgKzE2OCwxNyBAQCBzdGF0aWMNCj4gPiB2b2lkIHJlc3RvcmUoaW50IHNpZykNCj4g
PiAgCWNsb3NlKGNvbmZpZ2ZzX2ZkKTsNCj4gPg0KPiA+ICAJaWd0X2ttb2RfYmluZCgieGUiLCBi
dXNfYWRkcik7DQo+ID4gKw0KPiA+ICsJaWYgKHNuZF9kcml2ZXIpIHsNCj4gPiArCQlpZ3Rfa21v
ZF9sb2FkKHNuZF9kcml2ZXIsIE5VTEwpOw0KPiBIZWxsbyBDaGFpdGFueWEsDQo+IA0KPiBXb3Vs
ZCBpdCBiZSBwb3NzaWJsZSB0byBoYXZlIGEgaGVscGVyIGxpa2UgaWd0X2F1ZGlvX2RyaXZlcl9s
b2FkKCksIHNvIHdlIGRvbid0DQo+IGhhdmUgdG8gbWFpbnRhaW4gdGhlIGRyaXZlcidzIG5hbWUg
aW4gbXVsdGlwbGUgZmlsZXMgPw0KU29tZXRoaW5nIGxpa2UgZGVmYXVsdCB0byAic25kX2hkYV9p
bnRlbCIgaWYgcGFzc2VkIHdpdGggTlVMTC4gDQppbnQgaWd0X2F1ZGlvX2RyaXZlcl9sb2FkKGNv
bnN0IGNoYXIgKndobykNCnsNCgljb25zdCBjaGFyICpkcnYgPSB3aG8gPyB3aG8gOiAic25kX2hk
YV9pbnRlbCI7DQoJaW50IHJldDsNCg0KCWlmIChpZ3Rfa21vZF9pc19sb2FkZWQoZHJ2KSkNCgkJ
cmV0dXJuIDA7DQoNCglyZXQgPSBpZ3Rfa21vZF9sb2FkKGRydiwgTlVMTCk7DQoJaWYgKHJldCkN
CgkJaWd0X2RlYnVnKCJDb3VsZCBub3QgbG9hZCBhdWRpbyBkcml2ZXIgJXMgKCVzKVxuIiwNCgkJ
CSAgZHJ2LCBzdHJlcnJvcigtcmV0KSk7DQoNCglyZXR1cm4gcmV0Ow0KfQ0KDQpCciwNCkRueWFu
ZXNod2FyLA0KPiANCj4gQnIsDQo+IERueWFuZXNod2FyDQo+ID4gKwkJZnJlZShzbmRfZHJpdmVy
KTsNCj4gPiArCQlzbmRfZHJpdmVyID0gTlVMTDsNCj4gPiArCX0NCj4gPiAgfQ0KPiA+DQo+ID4g
IHN0YXRpYyB2b2lkIHNldF9zdXJ2aXZhYmlsaXR5X21vZGUoaW50IGNvbmZpZ2ZzX2RldmljZV9m
ZCwgYm9vbCB2YWx1ZSkgIHsNCj4gPiAtCWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKE5VTEwpOw0K
PiA+ICsJaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoJnNuZF9kcml2ZXIpOw0KPiA+ICAJaWd0X2tt
b2RfdW5iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsNCj4gPiAgCWlndF9zeXNmc19zZXRfYm9vbGVhbihj
b25maWdmc19kZXZpY2VfZmQsICJzdXJ2aXZhYmlsaXR5X21vZGUiLCB2YWx1ZSk7DQo+ID4gIAlp
Z3Rfa21vZF9iaW5kKCJ4ZSIsIGJ1c19hZGRyKTsNCj4gPiAtLQ0KPiA+IDIuNTAuMQ0KDQo=

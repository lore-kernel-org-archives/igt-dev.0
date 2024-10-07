Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7FDCFB440
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 11:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC1B10E375;
	Mon,  7 Oct 2024 11:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3hT01ng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B344310E201
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728301525; x=1759837525;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wmNUsGuzAezMrFTavJhvCbm41IXNMi0JACQeEab2kpA=;
 b=T3hT01ngrku1z5YfzWd9m+iF5DUmVG10ltfblZ1TqRiADgNtFDT35AOr
 tkwhEObMSBLf6HZo9m/WPqb/7gO5oEmX3mI2OJfcpYlEIW9WHiXdiuSb/
 8T9TpK4f4JzRlxuGesZ7j1pl4PFtV+QFPY2yAXM6lMFxnnUjoMDNMYFAI
 BZnuJMrDcOFn+QWWVp65z2DnPpoj7/nN+ww+7KDeYFB7K+gndUSvEPJ9G
 7jSM0ewjIs3Kyw2if0mkmUtW3p2KHG9coD+IUX3rwIbtLrQq5C3KbLihV
 Bte2xE1Dae5zoGgYPT7kQWjhACxkLt63LfvocJ1ecXwxGJc45lo0w4w3v Q==;
X-CSE-ConnectionGUID: 4FclSjcSTVq3/WEdddk9Vw==
X-CSE-MsgGUID: op+v9qtAQDWxXQjvsyaOfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27536074"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="27536074"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 04:45:24 -0700
X-CSE-ConnectionGUID: zqnuGlPRTlG4U4gctQg3Tg==
X-CSE-MsgGUID: ZO62fSE8RQSaKJWTqVZhDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="80037905"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 04:45:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 04:45:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 04:45:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 04:45:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thqSWn76PD028c4B6dEHqO35DeL6afmn9sb6VBZlCeDN3gMpWuM7xot1HABIqKJPayVJGC/EFXAKAqHFiDCUt2XEruPUYrDeecnKbFOypMwXYWkpBIDJxtGkwIjnjbZFbEw2PDxnsPC5jqkIpjlQ2o4eVlm8XVJyKmLpoysNXexLtzUXxcsRRocLxc8c+klTcJFsF3mw6jnA1I9uI1N8AR3PCkz8uKLodlob860oT6vlwDLDwjGmiGV933cOHXZOAevU0UmKLuMZR1Sf9LgFz2g2R8ybICr6TSL2ogMHzBsGCgkHEjIspDG1gcEd9sElAg4bFeWlSaUiIyyXIr7grQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmNUsGuzAezMrFTavJhvCbm41IXNMi0JACQeEab2kpA=;
 b=OiFDqauu/qNDnXfEz7llc/8RM9Wcx0ZwyYyWVGWsKC9OuEU/Cfu3p3HMwglK3SkP90iON2Ashap9OxL2WBlGCN2eoAbhFZHarLRAsqnM8Np/f/UHEdZ3mQfLsbo2/Rawvj91/KxLL4+mD4nRcXX6tPylFPfLdCJRy/xXwwTW0dxyRQqimrrUYIUPNDnpq1tC7GO0j0n6SRZSOJh//YA9SS6SjOgDlF6jY7oRge69WVXKVsq2MeX7fSh6HniGW5j1kuvfAzXYpnznZQJRX2pss6XQZ8q5DLBbf/8iubPJVQYvud1iPJIKMiJzC2V/XGEEn7NoDt2it5nV/PUlfADDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SA1PR11MB7013.namprd11.prod.outlook.com (2603:10b6:806:2be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 11:45:16 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 11:45:16 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class
 property helpers
Thread-Topic: [PATCH v2 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class
 property helpers
Thread-Index: AQHbFL5j3Il3Y6hFoES4jwhNcnriIrJ7M0OA
Date: Mon, 7 Oct 2024 11:45:16 +0000
Message-ID: <272e7129fab143d3357f67ed01e41aed3819cc37.camel@intel.com>
References: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
 <20241002112914.5556-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241002112914.5556-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SA1PR11MB7013:EE_
x-ms-office365-filtering-correlation-id: a5859e69-6fa4-4d0e-f33e-08dce6c58318
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U3hiSEtEMEw0bTdKakZFS3RzeW12Z2pHUGFoWDZnRmJrdVBZeVlnZXFYNXBj?=
 =?utf-8?B?VklvellLK1BlamZKaHA5dUtIakpUVEZ1UWgrNXJCM2ZiZlJjckFNSi85Lzhu?=
 =?utf-8?B?NFlWMmVaUlRsSnZzWGVJa2VoYlJmeTNQMFNvQWVkSGFxeWhnRkx2bklvTkJ0?=
 =?utf-8?B?Sk9JSXlseUJYak9zRDFobGFsRGpKWEZNQXF3aGlvTHFBS205VTY5ZEhPdzZD?=
 =?utf-8?B?V280RDgzL0toSjVWZFpQR1JDZEwwd25PVjRDMWFUZXNoVTY0ZFlId2ovalkx?=
 =?utf-8?B?NDlvOUdNUjR4Nys2aklEc041RjNIamtNZnBYZDNnbVZDV0RBWHV5eGs2SWEz?=
 =?utf-8?B?Q2VpMmtBSTlwTjcxREVXM1VMM3F3WVpjb1g3UWQrbSt1KzN6b3dEZ3lJY2U1?=
 =?utf-8?B?d2JpTlU3dVlQTVgrSlpaNm11d1BWbUJab0hUYTBTUGpJUGgrTWNYam5Tb2hy?=
 =?utf-8?B?SGc5WEUyTUZFbkRROTFmQ1B0bVd4VjhLL0NQbUxOSXRzYkVBTnhVMjExcjkw?=
 =?utf-8?B?L3YxK2FhdDIrdzFrRlFQRUdQRlJPWlhtSC9mZUJOMmlyRmY4N3FrUDRCMnVE?=
 =?utf-8?B?aXk2ZW5ONUNvSXdTL0U1bXFGRTJ1dG1ZbGVHeHczTG1EMG9mVk1jajFRYWl5?=
 =?utf-8?B?VDRjNjdWY0wwa1lMQWNKTnFoZUZ6bm4rZ2tlVDJmVklTZGQ5dmg1U0NkTXdW?=
 =?utf-8?B?aTVVdlAwd1hmWER0a2JnYk5YaHV2YldnbUQ1bTcwR0pQbVRoK3V4TThRWk9K?=
 =?utf-8?B?b3lzTDRLZ3E4UlRwZ2x4dEg1NGdiSFJ3ZkVpWmNRU2RKWmEwYzl2OTNiaWI3?=
 =?utf-8?B?K1JOZ2twSW05SS81VjV3R2tzVjhzM0tyM0UrZjRTcjdGSFZOTmRIWU5mOUtm?=
 =?utf-8?B?UTBLZUN1NTF5VUxsUkx5Y0hJUFJUNXNhbDczS1J3Z3NqQTlIZG5ZV0VXQWlP?=
 =?utf-8?B?cml2WkJtYi9jWmpQUXZMWGttVkhZV0I2M2JDWHVWU2ZQZXlBN05IKzR5eUtp?=
 =?utf-8?B?S0x1Y1grK1pET2Z2b21ETmd0RXhlZUcyeTBFMHlqU2hycmRVUEt6N1RzVjZ6?=
 =?utf-8?B?cjMrUXdqczVOVnFQQlNLTVV3R2hsYjZWR3pVenprNW5iVTVobmZ2a1JXeWJM?=
 =?utf-8?B?RW5YMXVPV00rK05YU0E3MWR0SWVRMVlSMGI3VE4zcHFsNXlCdXZqbXBGcS9J?=
 =?utf-8?B?TjY0UVV1bTNTWTFkelpFR0VCSjlzT0Frc1lHZkdTcnY1Vk9iaGkrb2M2dEp3?=
 =?utf-8?B?OVdHYVRlVkQ2dzRtUEhoODVJK25haGhjdUNZbFRab1N5WFlpMFRidk0rTzJF?=
 =?utf-8?B?aks0cDF2WlYwQXBYOU9aaWJDaVRtMWFZa3FXd2k5QjhFT2E5TXNyZkZNUXJG?=
 =?utf-8?B?cUJoRVJvMDdERmNGemNZb2dmNnJadTBGWFBYMWRSamtpOW4yUHFFVVJGL2I0?=
 =?utf-8?B?eTArUzZPdmF0Tk5RelVhRVNMZUpYK1Rlc2JhMXBlVFJuVUh5Q1NJcE9SVjFJ?=
 =?utf-8?B?QmFTQlJHeTdpV1FXc0d3SDhqQ3dXREtpc1RZNUIvWmNsajdKV2txWTJodGZs?=
 =?utf-8?B?aUVMdUswTEpHMTR0eUZOYXVIYjVnRDVtTFJQRVB0Mnp2cVRLMlBFWmxWSkpH?=
 =?utf-8?B?N2ttRXFadnVvaXV5UTB4VTlJWHc4QjRCTFhuOUxpdFVYVXRJd21rY2xmbjhD?=
 =?utf-8?B?b0tRVWZDSTlQaldIUHNlVngwaWUvcHU3WG1rZ1hvNitXMndtd1lJOCtjd1Ey?=
 =?utf-8?B?UU1KSXR1SmhlaVRIQmJlNXVNaW9ydnZrRFBuT2lkcCs0V0RYMEE0ZEFod1Ix?=
 =?utf-8?B?ano2ZzBpYmQ5NmlCRStuQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M25IMFRHY3c0UkwycitQZnJxK0YyUEc0K3NTcjlWeHE4RDU5UUZxVnZVdmhs?=
 =?utf-8?B?dnY5bEFDaXpCLys2R0JUTzBmUnN5Ti9iTjFubzRZUGw2Q3YrN1dwWURLYmgz?=
 =?utf-8?B?eFRGUnMxTnYrVjFHNll1YXNWdnI5LzZta09lNnkwcnRtYzA1UUlNWEl3aHc0?=
 =?utf-8?B?bllPQk1iZ0hsdmJCVFpGcVlzdU9CUU1vb2NwS2hpbzcrVC9RUDlBYUhrSkFC?=
 =?utf-8?B?RnZIeis5ZHBKYzd3bjAvMUMwSEpycnl2NnE3V0I5MHFCK1dxTlYvMDBmTDFG?=
 =?utf-8?B?bC95QTZheUpCa3V3UEdvV1ExOXRJczlGR0wzd2haZVhNc2xCUHRXMVIxckxV?=
 =?utf-8?B?NjFrc1hSRk9GbDd6czNCdzQvWlBxYjJyWE0vT0k1WGFvamVQZ1FETFdOOUlB?=
 =?utf-8?B?c01OYTlScTFPelpHQVBXeGFrY0RTb0xMd1hqcng4MXMvYzNPRXljTGE5Skp0?=
 =?utf-8?B?VWM1Ykg5dC9YUFhQWlZVMTFOSjR4VnBPSXFnOVBLd2VYY2R2anh4V0dGR2Vl?=
 =?utf-8?B?K29PTFM1UUNqYUt5bzZyblV5UWJnUWZNc29NNnZwTldUN1BPR3NkbitPZUtH?=
 =?utf-8?B?T2ZMVncxMFNXdWRzWWNpSlBiaVlMbDIwMlBTL2NPbVpVTHpweURxVnBaU2dN?=
 =?utf-8?B?QVp0Vk1QK2E5NDQxTjM4eHBCS0Z3RTlKSEY3UkVZMjFNZ0hBai81Y0hwL2xF?=
 =?utf-8?B?R2ZoS1NFUmZ3T256d0U5eWtqNE41ejZLVFNnNTQwRk11dzhObUo4a0lPM0lp?=
 =?utf-8?B?SXBDVHJZemYxREU4WFBMZ2Zoa0tlL1RpdENHRUhCV3hKWkxvTFNxdUhPaytp?=
 =?utf-8?B?MjRabmhwT2Izcnc0cFdmR2E1WVN1Ykp6VXp3Y1JVU2ZJUVpCWjgrajhlUlI5?=
 =?utf-8?B?dG5kV3dWN0Qya2JmWno0cHU1WDZ4dUl3dVV4OE1ycVFIL0ZSaE9wQ2JkemRz?=
 =?utf-8?B?a1J3ZnZpZkpiRXIzZnAwdTJhT0R2cTZiOFZrK1k5ekVSMlQrNmtlRG1kQU54?=
 =?utf-8?B?SXlCb3pnYml2Y3BDU3hwQjM4S2VPV013aUxKamROdWh2UkE0NjBQTmwwTmRN?=
 =?utf-8?B?Slplc1p4Z0MzN0VNd0lVNHBGejN1ajJOdEdNYU9rcnZ6ZUVFWlVBeVd6OENk?=
 =?utf-8?B?aFBuVFZRbkpYOGxJdU9abTY0TE1WYWVrVW9vZmE2aUxpbWtGa2d0WUl4N1My?=
 =?utf-8?B?U0lsTzBNWm9VQzlockU3MFUxc2FTK3RmVXFNV2EzWGFPNXFUN3VJZlI2V0lW?=
 =?utf-8?B?SS9rQ0FEcElUazNDR3k4djZoQUpJMWh5NnBlc21YTTVhVzNUWTVWZTNBYldF?=
 =?utf-8?B?Y2J5UWo4YXZZRUZrNzV0TGtnT3JnMkVtbWRtVzZldEVQRlZxeFdXbkFMSUpT?=
 =?utf-8?B?dWhNQ2diWTVOd1RlYzJ1bGFXaGFOMmF1T20yZEZvS2ZEdWFQYXFNQ1pQNXI2?=
 =?utf-8?B?MzFwNldRRUNLc2FQeEhodzljSGtTbXQzckVqQjJZY0JJcU9jTEdVTG8zbE52?=
 =?utf-8?B?eWw3WUplR0hzT3V4T3kvYjBTWGhtTUk1TXk3SjJrNEtFZU05ZDlibm54QXhE?=
 =?utf-8?B?dUtCYUxyQysxMkNIU3B6VVArU0tvU3JMNTlmM2EyMUpoelhzTm90OVV5RHFD?=
 =?utf-8?B?TDZBU3lqTkFKV3M2MVRyb2RabnIxaktMQlk1aFBtTnpFWitsUTJXMUJta2pB?=
 =?utf-8?B?aE5pQnExU1BmR09QTlNnc3phcDdKUEVpcEI1RUJ0WWhaRWJrOTFnSnFFaVlG?=
 =?utf-8?B?MmhoRHRtM0s5ZnVaaGE0RGtJaktpVlQ5TWM2bGdPSUtrS1ZhYThQbEFrOHFj?=
 =?utf-8?B?Ti9EdEl2cjFSMVY0VUtmZ29tQThZcjdTZC9SYTI3aVoxdDUxVS81eE04U3Yz?=
 =?utf-8?B?TlE2RDdiRDdPbThCeCsxb0RoMUlXUnlWanQ2WG1GMzZ4a3VuYlJ5VlJoUEhy?=
 =?utf-8?B?aktpT3dUOEk3WFFlTWY3ZTcxaklpMzJYaVRZbWMwdVoyblhhY0s3ZlFKNVBK?=
 =?utf-8?B?azl4QkNudHVsWmY5WWFISGFZNnhPdW5IOEd3eEQyMHdjTFhCL2Z1MitMZ2F3?=
 =?utf-8?B?MHMrYVgvc1pDYm5IUGV0S2F0RDJQbklXdm1ocTNkV2VtSko1ZWtRRno4U1Y1?=
 =?utf-8?B?MytodjRsWk5pQmlBZkwrRFVkUlpCQ3Z3ZUFJYUtqbWpvOEZrbE5tN2RHdDhU?=
 =?utf-8?Q?cX8bX89LATf1Jlh6IawsaTg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7398269386E8C54B958D84F14BE35BD7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5859e69-6fa4-4d0e-f33e-08dce6c58318
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 11:45:16.1769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twOCFfdY9XTa/SKz2Hu87eVS/bd/oqclK+yoAx3iBI/P9W5jsuzFmROqGke7mXGvUazLIvjYCDnxdyg1Ivcg5S7Kcy+lkDQU2lENfvdjYzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7013
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

T24gV2VkLCAyMDI0LTEwLTAyIGF0IDEzOjI5ICswMjAwLCBEb21pbmlrIEthcm9sIFBpxIV0a293
c2tpIHdyb3RlOg0KPiBJbnRyb2R1Y2UgdGhlIGZvbGxvd2luZyBlbmdpbmVfY2xhc3MgaGVscGVy
czoNCj4gIC0geGVfc3lzZnNfZW5naW5lX2NsYXNzX2dldF9wcm9wZXJ0eQ0KPiAgICBDb252ZW5p
ZW5jZSB3cmFwcGVyIHRvIGdldCB2YWx1ZSBvZiBnaXZlbiBwcm9wZXJ0eSBmb3IgZ2l2ZW4gZW5n
aW5lDQo+ICAgIGNsYXNzIG9uIGdpdmVuIGd0Lg0KPiAgLSB4ZV9zeXNmc19lbmdpbmVfY2xhc3Nf
c2V0X3Byb3BlcnR5DQo+ICAgIENvbnZlbmllbmNlIHdyYXBwZXIgdG8gc2V0IGdpdmVuIHByb3Bl
cnR5IGZvciBnaXZlbiBlbmdpbmUgY2xhc3Mgb24NCj4gICAgZ2l2ZW4gZ3QgdG8gZ2l2ZW4gdmFs
dWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIDxkb21p
bmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3Rfc3lzZnMu
YyB8IDg1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gIGxpYi9pZ3Rfc3lzZnMuaCB8ICA1ICsrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9zeXNmcy5jIGIvbGliL2lndF9z
eXNmcy5jDQo+IGluZGV4IGFlYzBiYjUzZC4uOGZlNmQ3ZWRlIDEwMDY0NA0KPiAtLS0gYS9saWIv
aWd0X3N5c2ZzLmMNCj4gKysrIGIvbGliL2lndF9zeXNmcy5jDQo+IEBAIC0xMzYwLDMgKzEzNjAs
ODggQEAgaW50IHhlX3N5c2ZzX2dldF9udW1fdGlsZXMoaW50IHhlX2RldmljZSkNCj4gIA0KPiAg
CXJldHVybiBudW1fdGlsZXM7DQo+ICB9DQo+ICsNCj4gKy8qKg0KPiArICogeGVfc3lzZnNfZW5n
aW5lX2NsYXNzX2dldF9wcm9wZXJ0eQ0KPiArICogQHhlX2RldmljZTogZmQgb2YgdGhlIGRldmlj
ZQ0KPiArICogQGd0OiBndCBudW1iZXINCj4gKyAqIEBjbGFzczogZW5naW5lIGNsYXNzDQo+ICsg
KiBAcHJvcGVydHk6IHByb3BlcnR5IG9mIGVuZ2luZSBjbGFzcyB0byByZXRyaWV2ZQ0KPiArICog
QHZhbHVlOiBwb2ludGVyIGZvciBzdG9yaW5nIHJlYWQgdmFsdWUNCj4gKyAqDQo+ICsgKiBDb252
ZW5pZW5jZSB3cmFwcGVyIHRvIGdldCB2YWx1ZSBvZiBnaXZlbiBwcm9wZXJ0eSBmb3IgZ2l2ZW4g
ZW5naW5lIGNsYXNzIG9uIGdpdmVuIGd0Lg0KPiArICoNCj4gKyAqIFJldHVybnM6IHRydWUgb24g
c3VjY2VzcywgZmFsc2Ugb24gZmFpbHVyZS4NCj4gKyAqLw0KPiArYm9vbCB4ZV9zeXNmc19lbmdp
bmVfY2xhc3NfZ2V0X3Byb3BlcnR5KGludCB4ZV9kZXZpY2UsIGludCBndCwgdWludDE2X3QgY2xh
c3MsIGNvbnN0IGNoYXIgKnByb3BlcnR5LA0KPiArCQkJCQl1aW50MzJfdCAqdmFsdWUpDQo+ICt7
DQo+ICsJaW50IGVuZ2luZXNfZmQ7DQo+ICsNCj4gKwllbmdpbmVzX2ZkID0geGVfc3lzZnNfZW5n
aW5lX29wZW4oeGVfZGV2aWNlLCBndCwgY2xhc3MpOw0KPiArDQo+ICsJaWYgKGVuZ2luZXNfZmQg
PT0gLTEpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gb3BlbiAlcyBvbiBndCVkLlxuIiwg
eGVfZW5naW5lX2NsYXNzX3RvX3N0cihjbGFzcyksIGd0KTsNCj4gKw0KPiArCQlyZXR1cm4gZmFs
c2U7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKCFfX2lndF9zeXNmc19nZXRfdTMyKGVuZ2luZXNfZmQs
IHByb3BlcnR5LCB2YWx1ZSkpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gcmVhZCAlcyBw
cm9wZXJ0eSBvZiAlcyBvbiBndCVkLlxuIiwgcHJvcGVydHksDQo+ICsJCQkgIHhlX2VuZ2luZV9j
bGFzc190b19zdHIoY2xhc3MpLCBndCk7DQo+ICsJCWNsb3NlKGVuZ2luZXNfZmQpOw0KPiArDQo+
ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwljbG9zZShlbmdpbmVzX2ZkKTsNCj4g
Kw0KPiArCXJldHVybiB0cnVlOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIHhlX3N5c2ZzX2Vu
Z2luZV9jbGFzc19zZXRfcHJvcGVydHkNCj4gKyAqIEB4ZV9kZXZpY2U6IGZkIG9mIHRoZSBkZXZp
Y2UNCj4gKyAqIEBndDogZ3QgbnVtYmVyDQo+ICsgKiBAY2xhc3M6IGVuZ2luZSBjbGFzcw0KPiAr
ICogQHByb3BlcnR5OiBwcm9wZXJ0eSBvZiBlbmdpbmUgY2xhc3MgdG8gYmUgbW9kaWZpZWQNCj4g
KyAqIEBuZXdfdmFsdWU6IHZhbHVlIHRvIGJlIHNldA0KPiArICogQG9sZF92YWx1ZTogcG9pbnRl
ciBmb3Igc3RvcmluZyBvbGQgdmFsdWUsIGNhbiBiZSBOVUxMDQo+ICsgKg0KPiArICogQ29udmVu
aWVuY2Ugd3JhcHBlciB0byBzZXQgZ2l2ZW4gcHJvcGVydHkgZm9yIGdpdmVuIGVuZ2luZSBjbGFz
cyBvbiBnaXZlbiBndCB0byBnaXZlbiB2YWx1ZS4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiB0cnVl
IG9uIHN1Y2Nlc3MsIGZhbHNlIG9uIGZhaWx1cmUuDQo+ICsgKi8NCj4gK2Jvb2wgeGVfc3lzZnNf
ZW5naW5lX2NsYXNzX3NldF9wcm9wZXJ0eShpbnQgeGVfZGV2aWNlLCBpbnQgZ3QsIHVpbnQxNl90
IGNsYXNzLCBjb25zdCBjaGFyICpwcm9wZXJ0eSwNCj4gKwkJCQkJdWludDMyX3QgbmV3X3ZhbHVl
LCB1aW50MzJfdCAqb2xkX3ZhbHVlKQ0KPiArew0KPiArCWludCBlbmdpbmVzX2ZkOw0KPiArDQo+
ICsJZW5naW5lc19mZCA9IHhlX3N5c2ZzX2VuZ2luZV9vcGVuKHhlX2RldmljZSwgZ3QsIGNsYXNz
KTsNCj4gKw0KPiArCWlmIChlbmdpbmVzX2ZkID09IC0xKSB7DQo+ICsJCWlndF9kZWJ1ZygiRmFp
bGVkIHRvIG9wZW4gJXMgb24gZ3QlZC5cbiIsIHhlX2VuZ2luZV9jbGFzc190b19zdHIoY2xhc3Mp
LCBndCk7DQo+ICsNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArCX0NCj4gKw0KPiArCWlmIChvbGRf
dmFsdWUgJiYgIV9faWd0X3N5c2ZzX2dldF91MzIoZW5naW5lc19mZCwgcHJvcGVydHksIG9sZF92
YWx1ZSkpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gcmVhZCAlcyBwcm9wZXJ0eSBvZiAl
cyBvbiBndCVkLlxuIiwgcHJvcGVydHksDQo+ICsJCQkgIHhlX2VuZ2luZV9jbGFzc190b19zdHIo
Y2xhc3MpLCBndCk7DQo+ICsJCWNsb3NlKGVuZ2luZXNfZmQpOw0KPiArDQo+ICsJCXJldHVybiBm
YWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoIV9faWd0X3N5c2ZzX3NldF91MzIoZW5naW5lc19m
ZCwgcHJvcGVydHksIG5ld192YWx1ZSkpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gd3Jp
dGUgJXMgcHJvcGVydHkgb2YgJXMgb24gZ3QlZC5cbiIsIHByb3BlcnR5LA0KPiArCQkJICB4ZV9l
bmdpbmVfY2xhc3NfdG9fc3RyKGNsYXNzKSwgZ3QpOw0KPiArCQljbG9zZShlbmdpbmVzX2ZkKTsN
Cj4gKw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJY2xvc2UoZW5naW5lc19m
ZCk7DQo+ICsNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
c3lzZnMuaCBiL2xpYi9pZ3Rfc3lzZnMuaA0KPiBpbmRleCAyYTFlM2IxYmYuLjNjZWRlMDdmOSAx
MDA2NDQNCj4gLS0tIGEvbGliL2lndF9zeXNmcy5oDQo+ICsrKyBiL2xpYi9pZ3Rfc3lzZnMuaA0K
PiBAQCAtMTc1LDQgKzE3NSw5IEBAIGludCB4ZV9zeXNmc19nZXRfbnVtX3RpbGVzKGludCB4ZV9k
ZXZpY2UpOw0KPiAgY2hhciAqeGVfc3lzZnNfZW5naW5lX3BhdGgoaW50IHhlX2RldmljZSwgaW50
IGd0LCBpbnQgY2xhc3MsIGNoYXIgKnBhdGgsIGludCBwYXRobGVuKTsNCj4gIGludCB4ZV9zeXNm
c19lbmdpbmVfb3BlbihpbnQgeGVfZGV2aWNlLCBpbnQgZ3QsIGludCBjbGFzcyk7DQo+ICANCj4g
K2Jvb2wgeGVfc3lzZnNfZW5naW5lX2NsYXNzX2dldF9wcm9wZXJ0eShpbnQgeGVfZGV2aWNlLCBp
bnQgZ3QsIHVpbnQxNl90IGNsYXNzLCBjb25zdCBjaGFyICpwcm9wZXJ0eSwNCj4gKwkJCQkJdWlu
dDMyX3QgKnZhbHVlKTsNCj4gK2Jvb2wgeGVfc3lzZnNfZW5naW5lX2NsYXNzX3NldF9wcm9wZXJ0
eShpbnQgeGVfZGV2aWNlLCBpbnQgZ3QsIHVpbnQxNl90IGNsYXNzLCBjb25zdCBjaGFyICpwcm9w
ZXJ0eSwNCj4gKwkJCQkJdWludDMyX3QgbmV3X3ZhbHVlLCB1aW50MzJfdCAqb2xkX3ZhbHVlKTsN
Cj4gKw0KPiAgI2VuZGlmIC8qIF9fSUdUX1NZU0ZTX0hfXyAqLw0KUmV2aWV3ZWQtYnk6IERvbWlu
aWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4NCg==

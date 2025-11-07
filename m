Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE08FCCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 09:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FC710EA4F;
	Fri,  7 Nov 2025 09:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKfMqpbM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C56F10EA4E;
 Fri,  7 Nov 2025 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762508042; x=1794044042;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kYagbsvMy44MJqPnHo7mgg99CJnh/1qYhvdRbq31tpk=;
 b=kKfMqpbMhEbzoJnP90f4AOsW/4tQxMaxekOtTzO9qM6PY+3AcC6xW8t2
 Z4p3KCuGkbq4h8IXfaGyBkLklJYe6/kaYRJEUbnMsL1kEoY12H+zh5PzO
 G5ac7VdeEQs0LjcoCtew3L5c9Ak8q0K/29Vixo92G6IIh7eSQps0G8r3+
 zonCHELbosPTFExI/qYUjR3BMHl4a4SCUwESMVLVJUYmgM6a4QHlahbqs
 vZdvJnn9acOy+TVW0qCvDcA00890ROkRjKsMBHaGgQMgvmiTD4of2DdnX
 u+KOLqI8EXHr9HV47I5Wq08xTdF8VdBPvnNTKPX4a2uT8/d1YWyPwd4Ma Q==;
X-CSE-ConnectionGUID: tXZN/6x8R/CW0Pq7/M1mQg==
X-CSE-MsgGUID: 7uTErWGVT82HW1J1B/OMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75265584"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="75265584"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 01:33:53 -0800
X-CSE-ConnectionGUID: 7f69MprdTnO9J1RaQ35rMg==
X-CSE-MsgGUID: jiQoV6KGRKuYQlO742Xgcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187839487"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 01:33:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 01:33:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 01:33:53 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 01:33:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxQT54wybPNe32YqHHEKIGXey/TGx3Yer8X7MoBjUWYGgRz3/XifayH+Bky4ru7ELhmNyZ3zkHQH53X06/huImgoB5S1E5p8utEGRAfOkwURW7drnImP5bUV3x4DrrrHUl/YyiKifPVxRvQvEdSU57gkUKotktex59j8u5VzQCGz9+8Lu1Wv8MHQBmd+hGDwZ+eFcbCW/svFRhVcs97Fd/JcpUCGyB8kraRtVO2YrFAa5ndc6zmKZlw+e5R9Sm0AWa7ajz9WgWMeh78TbBFUY8Rm7X9ikqxU8l6X4gVwYs9/8WoQPE8vtmMMPeFb0B8U9LYHUJ2sUUWwEXLD/AdvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYagbsvMy44MJqPnHo7mgg99CJnh/1qYhvdRbq31tpk=;
 b=XZfjDjvJjPKg8msBjBJxQT3O4mABA+4X4K8km/Y7QE8DaO7eURZRGe1kH7GwcJlHAgSbIMi1xv8eTR75iTSubPyN9NGBmvhm99tDsfCQIjngzGdybn0ENiYS3LVOiYEAFauZ4GIRcST+4UtCXYu+N+ELgFz+9keWLKWYr8ggsId7LzhmT7iwYhiggkEz2GpR96gLLjGw2dq4CU/cgkb9gtRQaJGiHpqRtpuBny8mcaX5CYjM5ysXUhUJYRQ6eXvuLqj8xtJuTOpOOEx5U9gC2DyDYrPKlrvvlHt6WwkP9xp0nQ3Q3eHYWQzbvEkkvMRZN1grDLs0JFJS10BzrG1iCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 09:33:45 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 09:33:45 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvZG1hYnVm?=
 =?utf-8?Q?:_Avoid_soft_lockups_on_slow_platforms?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9kbWFidWY6IEF2?=
 =?utf-8?Q?oid_soft_lockups_on_slow_platforms?=
Thread-Index: AQHcTwyxUIJLNg63pU296xZqD8yVO7Tm9Q6g
Date: Fri, 7 Nov 2025 09:33:45 +0000
Message-ID: <CH0PR11MB549133F77298CD608F90AC84EFC3A@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20251104112116.432508-2-janusz.krzysztofik@linux.intel.com>
 <176233530617.19585.1715196185756608873@10055242dc62>
 <2751395.Isy0gbHreE@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <2751395.Isy0gbHreE@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH8PR11MB8287:EE_
x-ms-office365-filtering-correlation-id: 9b1a35bf-6df4-4e7d-064c-08de1de0bf45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007|13003099007; 
x-microsoft-antispam-message-info: =?utf-8?B?S0RBMjNFVFZYd3B1Y0NoOU90anFmWWpncERxd0hhQ0xmMTVKWnFWV2ZYcGxj?=
 =?utf-8?B?MWpuaGFXVEN1eDF3bkltemE5V0lVTjFDZEt3a3g5KzRWd3phbllhdTIvVWsw?=
 =?utf-8?B?OEVlUkJpRDVtc0VhcnRFVmFJQ1YxeGJzUjVKSzdZbXNiRmZOamY1Ty8zWEpL?=
 =?utf-8?B?MzZpTUd3VFZreUpvMURzZys3ZEVZWklycFNPVVpORXozSnBUQzlrZzJ5djRZ?=
 =?utf-8?B?bDBUSTRIWmNsUm13dS9FNXlhcG1PMWgyd0NmeXlHWnV3Tk03RGRDQStNT1NZ?=
 =?utf-8?B?WVVjMWFOZE5vcXhBK0hVZ0hySURReHhraFhNM1FYWktrMHE1SEUrUU9BVjVQ?=
 =?utf-8?B?VWJ3RFVUZXYzaEh3TnFpcndjVkRCT3pTdW5FUHYwTmFXQS9sajdtSnB0ck5k?=
 =?utf-8?B?dzk3ZncrbDR5cWxzcHlLNC96eGZ5VlZneGhpL1YxNVJreUtvdFRSNHBxc3Fm?=
 =?utf-8?B?UHJTWW9PdFlndEM5N09zVVEzTmNIakJvSTZleVhNZGduS2lOWDA5RndXNGZD?=
 =?utf-8?B?VFA1OXFVN2VNclZkQ1FkTDFBY3ljb25scCtmSjdVN1YyNUVhTnRnUlJySVlr?=
 =?utf-8?B?cFh6TTNNRGc0aHpXdW9OclJNYVNxUzBoVENlQnJ3elUxZlBEc2k5TzIyREow?=
 =?utf-8?B?SW1ZdndESkJSbEE0T2x0UHRicXNMMUlXRXlsT2ZaRkwwbUF0NnJZcDFXVjJK?=
 =?utf-8?B?K3YrbStxM1hPZU1xYlJ0NWVvcEN3M3RpVU9uV0Y4WXJGODl6aTVIY1UxY2xU?=
 =?utf-8?B?OFlia0lFRC9Nb00wcVJ1UkZGS2dzdU92a2VQNkY2dUNRWWZseHJZSTRGSENx?=
 =?utf-8?B?REVnQlhwTS9vRGdNY0I0U1lkanNHaW9TY0Y0d1RXTnRNTEJKWC9CMit3Szdi?=
 =?utf-8?B?VjFxQzB4emp6NXNHUVBKVnlLUGQ5WlFSdGFvZU4ySVIzM016eldha2ZhUXlD?=
 =?utf-8?B?Wmo4Rmh5YkZVQ3JZbENXNGJLREMwUVplT3E3bkNDZWNyQW5pSFdnNkF4N3pK?=
 =?utf-8?B?MHVMMXVLbTBXbmhweGErcEhOWUwvN0R5WllMa2FzbW9IbWxObkJzVFQ2NjhE?=
 =?utf-8?B?VDZBMnhOaEtCSVZseHoyL2VBVk5MSCtBQkIxSUFwSU5pZ0p4SHc3V0lMZHJL?=
 =?utf-8?B?SmxZakR5TTJHTGkwRDBlQ1Vpc3dtczgzbFIrZkJkdHdVMnlQTkhsM0QyR1d2?=
 =?utf-8?B?U1BhSzBkRUVpYjFzZ1VCUkRDaWJxS1czdUFKQkVpVE5hZ0hRajRydnlzU05w?=
 =?utf-8?B?TjNob0JYRFVvOEMwbDJKb3ZzV0hBUUdPUXNNUFFYdGdDMHcydUNYbDRJdU9j?=
 =?utf-8?B?RUZBUkZuUitXZ2lvQU5FaDEweTJaWExNMzZNb2FSWngwRUFEdE0rUTBqUHhE?=
 =?utf-8?B?OHpuMmlFeUQ2SENnQ3luRzNmc2U2T2ZwNlR2dmNOU0Y0Zlk1SW42UGZOcitt?=
 =?utf-8?B?VGdBakFob1JyWG5RV2duY25sVFhRRlNVUTdwSlc1cWY2SFdTVVkwQTd3Y2lq?=
 =?utf-8?B?Mjc3NU14MnJkaUtoQ0Vnb0g1S09sWEVYcm94SXBWSktEL3laMEVVYTg3YUY5?=
 =?utf-8?B?Rnd5S1BzNmFLYjdqQXJHb0ZYV2RXVlh1dDZwYTdPM3h4bUc2QzIxcldEeHhQ?=
 =?utf-8?B?Y01XckZNY0N2c3hRVnd5bFZZeDJ2NUpKMFhkTytYR05VbU4yQW8vQmNIM0JD?=
 =?utf-8?B?a1M2eE5IelpnbFdETElXeXl2QW9jVEZEWVM0OEIwamszeEpobWRHUWllNG04?=
 =?utf-8?B?cU4yN203dUlyaGlQMUtpeGtWa3FGUFBjRVZnbkJIWmxGdENLb3RpY1U0c1Vq?=
 =?utf-8?B?cVdJWDVTbllJOTlWb3pJczdpYUl3K1BCb0hEeUdxRDIwcG5CSHBIYjRzeGVS?=
 =?utf-8?B?d0tUdksxcWIxSUo3UHlJZ1ZET3c3SjJmc1VQd0pMTDNKb29lRnU1VXBHNlFh?=
 =?utf-8?B?MzhoUTRNYWUrQmwxdFZhV1NPWXNnVFlYaVl2N2lrOGgvcUx5bkhweGF0V0d4?=
 =?utf-8?B?NlUySkYwWnJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q05wQWtGdmxRRTNTWm13QUIzQXdkRXNQcm12WkpSbWdIU01NWlVzRG9NR2NM?=
 =?utf-8?B?SVlLUWlCMUxNQy9ORS9mSUc2Wmllb1BNSzgrQ1pVOEp6RDd4Y3Y4NGlMbVJ6?=
 =?utf-8?B?Q0x2eHlBOGVpSkJFSzVsZ2pzaWZqaUFXYzkwS0h3anI5VlR5L1FGRDJxbmU4?=
 =?utf-8?B?bVZhL1Jydzg1NVR4NEMrMVMvdDFlYU1mRVBMcXhVa3F1NGRJRFhadm1JUnBn?=
 =?utf-8?B?dGxHbGZSSXpoRWgrYzFmWG16L0F3b2dPSUhFYlhkMjR1OHlhVzMrcEIxM0Rq?=
 =?utf-8?B?anZ1Z1FmTUY3U1VybnpVMzhudVJCandqc2o0am9ZZlhGTkl4dTljNk9JR1Fo?=
 =?utf-8?B?R2I3MUxVays0YWdCM3lMSTFJTG85RjJmSGNnM3RCWEswSmVmYllIR1J6VlRr?=
 =?utf-8?B?d2YxRWU2QmJHajVNOUJaWkJ2WUdUZ1N6NENLMnV3ckcxaDc5bXcvUVZidkw3?=
 =?utf-8?B?djI3S1JLWFgrbjVTcVNGaXdhdnBZRm55ZTNTTFEyVkNSd25YL3k2ODUwYjdM?=
 =?utf-8?B?eGxFcnJTMlEzcEM4NXplL1ZLYThhUUlIcXUxbk8wRnRnZmI5a3VZWmVLbSt2?=
 =?utf-8?B?UVphdkZ1bG9KeWVJdlI0UXRaU3VUWlBIdTl1RkFmYitwMzJ0ZnZBLzNhM0JI?=
 =?utf-8?B?ZWxqdjk2bU1LTmhDTVVOWi9UcVlQdW5icDhRRUplQzZWOEdkL3Vpby9rNHAx?=
 =?utf-8?B?cDFFRWVQbFU1cnpXb3Q4dmNZcGNhWktBUU51citaU1hqM1ZKODRmUkpveVd0?=
 =?utf-8?B?UTV4eVRZRVJ4MDVMM1FScGpXQS9WK0VEeVpCeXZ6MUNrdE42VDMxaUNmUExB?=
 =?utf-8?B?SjZJY01IUVEyRElCV3hid05vTGlLeEU0Y2MwNXFycjQxWlFZN2VCYmh0UkFh?=
 =?utf-8?B?RGhTTU15Y1BxdU1MSk1YbUhGaE1CNW1DOTFOeXRzNUN4ZU5EWWpIMEgxbUpJ?=
 =?utf-8?B?eEk4ZVBuMzVHUUdzSlYrMzNvT1VLQ0plWGdRYm5zYlUzTDN6dk12K2JseWl2?=
 =?utf-8?B?ZGkyK3F1aUNQR3p4UktWZitIclhQdER3MEl3WFBBTXh0N0tDODMya3M2bXR5?=
 =?utf-8?B?akJ2NmlRM1FVMG5WVVZvdk5yRnBkRExnY244Vkc2eldpRklIUnY1bzQ3YWlu?=
 =?utf-8?B?NXBvSTVCNC9md3FLRFNuQjRMNHUxOUx4dHVDNHowU3hkOXlIbVlXV2QvQnpq?=
 =?utf-8?B?OHdWdDNWbTJQRjh6Z3p0NmY0MEQ3ZHQzREJFYSt4a2pmd2lrUGNZSHJEYzRi?=
 =?utf-8?B?MXJyTGxVb3JpamFMZHQ0OVRwWlVyR1dPRWkvd1kvTnA0TnQyK3ZXWHJBWWJ0?=
 =?utf-8?B?Q29UN0NnWmlRVEpYbXZneGtlYlVRaElNZVgxL1QyV29nQVFLbVlkWDYxdktQ?=
 =?utf-8?B?KzVqbVJzZ0xleFpPeHNyazEvVGRiRkFVc2U5SU11TFRnR3NEYjVySkY0eUVK?=
 =?utf-8?B?L3I0MGFlNWVNMnRESGo4R0hFSzVndHpNZEY5MVdWLytwNEt2cytYR3hJSEt1?=
 =?utf-8?B?Y0NYT2Yvem16bTJ2WUgzeFcvWVQvSG8vdHhpTlNvVFNnM3hSWTZvZHNaenBt?=
 =?utf-8?B?VHc0RTJidXhueU0zWjFvOC9maDU0UTkyR2J6a01pWVF1Q0lUeGVoUG5HRjR1?=
 =?utf-8?B?Q0F2Ym5PK0dvSFYwck8zUkt1ZFdyQ3YvQ0tueXZJWFZpUWNLeTY0NUkxVUwz?=
 =?utf-8?B?UFM3RktoRVFMcG0xQzc2ODJFR0hNa0ZiL05vcGNUS3VHTW9CT1NjY0NhMFN3?=
 =?utf-8?B?QUp6cThEejBWdDE0dHhHa3ViY3JTeUdvby9yNmE0ZzV1MlJnM2toTmdFZmFS?=
 =?utf-8?B?QWlSRiszUCtJV2JxQTJkelNQcDBUeDN6bEFxK3V3NHQ5V0NBSDhhTmpuMG1p?=
 =?utf-8?B?OU5weFZETnhQOFE0TzhSSFNyYlRoM01xNkZtWVgrQzVrYkhkTDh5Vk1uY243?=
 =?utf-8?B?SFRKMnlnbGNPdWxsUzkrd2Nsc3pncjdabmM3Wm5ZWjF0VTdzTjRwNlNFVUFx?=
 =?utf-8?B?Y2xNR0Z5S2RsZGVjZlVBZjZlaHp4RmJwWjR6UmtkWEVtY1JGWVdnZnNVa2xo?=
 =?utf-8?B?bWtGaEtnS1FLank5aXYyc3hMVk5jZEx3ellTaHY4N2gxd1pTbWgybmFlNzBY?=
 =?utf-8?Q?HKPN3eJbC9cLL5YtwbilQqOCU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1a35bf-6df4-4e7d-064c-08de1de0bf45
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 09:33:45.1668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LqEEyZrc3u5DO3r9/cIKIaAbY0YhAf6bBLjyijrPwLWeHZ5UbuJDu4tDILthpC3wBYSDfjSJZ5JyGt9axDri4HySYya70meahpikFVWzpn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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

DQpIaSwNCg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTY5OTkv
DQppOTE1LkNJLkJBVCAtIFJlLXJlcG9ydGVkLg0KIA0KVGhhbmtzLA0KUmF2YWxpLg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKYW51c3ogS3J6eXN6
dG9maWsNClNlbnQ6IDA2IE5vdmVtYmVyIDIwMjUgMTY6MzENClRvOiBJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpT
dWJqZWN0OiBSZTog4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9kbWFidWY6IEF2
b2lkIHNvZnQgbG9ja3VwcyBvbiBzbG93IHBsYXRmb3Jtcw0KDQpIaSBJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZywNCg0KT24gV2VkbmVzZGF5LCA1IE5vdmVtYmVyIDIwMjUgMTA6
MzU6MDYgQ0VUIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+
IFNlcmllczogdGVzdHMvZG1hYnVmOiBBdm9pZCBzb2Z0IGxvY2t1cHMgb24gc2xvdyBwbGF0Zm9y
bXMNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1
Njk5OS8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBC
dWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF84NjA3IC0+IElHVFBXXzEzOTg5IA0KPiA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1t
YXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtu
b3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTM5ODkgYWJzb2x1dGVseSBuZWVkIHRvIGJl
DQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBv
cnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50
cm9kdWNlZCBpbiBJR1RQV18xMzk4OSwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1
LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRv
Y3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9z
aXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEzOTg5L2luZGV4Lmh0bWwNCj4gDQo+IFBh
cnRpY2lwYXRpbmcgaG9zdHMgKDQ2IC0+IDQ0KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gDQo+ICAgTWlzc2luZyAgICAoMik6IGZpLXNuYi0yNTIwbSBiYXQtYWRscy02IA0K
PiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAg
IEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVj
ZWQgaW4gSUdUUFdfMTM5ODk6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMj
IFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAZG1hYnVmQGFsbC10ZXN0
c0BkbWFfZmVuY2VfY2hhaW46DQo+ICAgICAtIGJhdC10d2wtMjogICAgICAgICAgW1BBU1NdWzFd
IC0+IFtTS0lQXVsyXQ0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUXzg2MDcvYmF0LXR3bC0yL2lndEBkbWFidWZAYWxsLXRlc3RzQGRtYV9mZW5j
ZV9jaGFpbi5odG1sDQo+ICAgIFsyXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RQV18xMzk4OS9iYXQtdHdsLTIvaWd0QGRtYWJ1ZkBhbGwtdGVzdHNAZG1hX2Zl
bmNlX2NoYWluLmh0bWwNCj4gICAgIC0gYmF0LWpzbC0xOiAgICAgICAgICBbUEFTU11bM10gLT4g
W1NLSVBdWzRdDQo+ICAgIFszXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJt
LXRpcC9JR1RfODYwNy9iYXQtanNsLTEvaWd0QGRtYWJ1ZkBhbGwtdGVzdHNAZG1hX2ZlbmNlX2No
YWluLmh0bWwNCj4gICAgWzRdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0t
dGlwL0lHVFBXXzEzOTg5L2JhdC1qc2wtMS9pZ3RAZG1hYnVmQGFsbC10ZXN0c0BkbWFfZmVuY2Vf
Y2hhaW4uaHRtbA0KPiAgICAgLSBiYXQtdHdsLTE6ICAgICAgICAgIFtQQVNTXVs1XSAtPiBbU0tJ
UF1bNl0NCj4gICAgWzVdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVF84NjA3L2JhdC10d2wtMS9pZ3RAZG1hYnVmQGFsbC10ZXN0c0BkbWFfZmVuY2VfY2hhaW4u
aHRtbA0KPiAgICBbNl06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTM5ODkvYmF0LXR3bC0xL2lndEBkbWFidWZAYWxsLXRlc3RzQGRtYV9mZW5jZV9jaGFp
bi5odG1sDQo+ICAgICAtIGJhdC1qc2wtNTogICAgICAgICAgW1BBU1NdWzddIC0+IFtTS0lQXVs4
XQ0KPiAgICBbN106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
Xzg2MDcvYmF0LWpzbC01L2lndEBkbWFidWZAYWxsLXRlc3RzQGRtYV9mZW5jZV9jaGFpbi5odG1s
DQo+ICAgIFs4XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQ
V18xMzk4OS9iYXQtanNsLTUvaWd0QGRtYWJ1ZkBhbGwtdGVzdHNAZG1hX2ZlbmNlX2NoYWluLmh0
bWwNCj4gICAgIC0gZmktdGdsLTExMTVnNDogICAgICBbUEFTU11bOV0gLT4gW1NLSVBdWzEwXQ0K
PiAgICBbOV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzg2
MDcvZmktdGdsLTExMTVnNC9pZ3RAZG1hYnVmQGFsbC10ZXN0c0BkbWFfZmVuY2VfY2hhaW4uaHRt
bA0KPiAgICBbMTBdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9JR1RQV18xMzk4OS9maS10Z2wtMTExNWc0L2lndA0KPiBAZG1hYnVmQGFsbC10ZXN0c0BkbWFf
ZmVuY2VfY2hhaW4uaHRtbA0KDQpUaGF0IHNlbGZ0ZXN0IGlzIGhhcmR3YXJlIGFnbm9zdGljLCBi
dXQgY2FuIHRyaWdnZXIgc29mdCBsb2NrdXBzIG9uIHNsb3cgbWFjaGluZXMsIHNlZSBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzEyOTA0LiAg
DQpUbyBhdm9pZCByZXN1bHRpbmcgYWJvcnRzIHRoYXQgcmVkdWNlIGNvdmVyYWdlLCB0aGlzIHBh
dGNoIGludGVudGlvbmFsbHkgaW50cm9kdWNlcyBza2lwcyBvbiBtYWNoaW5lcyB0aGF0IGNhbiBv
Y2N1ciB0b28gc2xvdy4gIFRob3NlIHNraXBzIGFyZSBpbnRlbmRlZCB0byBiZSBoYW5kbGVkIGlu
IENJIEJ1ZyBMb2cgYXMgZXhwZWN0ZWQgc2tpcHMuICBQbGVhc2Ugb3BlbiBhIG5ldyBpc3N1ZSBm
b3IgdGhvc2Ugc2tpcHMgZGV0ZWN0ZWQgaW4gcHJlLW1lcmdlIGFuZCByZS1yZXBvcnQuICBJbiB0
aGUgd29yc3QgY2FzZSwgaWYgdGhpcyBzb2x1dGlvbiBpcyBub3QgYWNjZXB0ZWQsIHdlJ2xsIGp1
c3QgY2xvc2UgdGhhdCBpc3N1ZS4NCg0KVGhhbmtzLA0KSmFudXN6DQoNCj4gS25vd24gaXNzdWVz
DQo+IC0tLS0tLS0tLS0tLQ0KLi4uDQo+ICMjIyMgUG9zc2libGUgZml4ZXMgIyMjIw0KPiANCj4g
ICAqIGlndEBkbWFidWZAYWxsLXRlc3RzOg0KPiAgICAgLSBmaS1wbnYtZDUxMDogICAgICAgIFtB
Qk9SVF1bMzJdIChbaTkxNSMxMjkwNF0pIC0+IFtQQVNTXVszM10NCj4gICAgWzMyXTogaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODYwNy9maS1wbnYtZDUxMC9p
Z3RAZG1hYnVmQGFsbC10ZXN0cy5odG1sDQo+ICAgIFszM106IA0KPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEzOTg5L2ZpLXBudi1kNTEwL2lndEBkDQo+
IG1hYnVmQGFsbC10ZXN0cy5odG1sDQo+IA0KLi4uICAgDQo+ICMjIyMgV2FybmluZ3MgIyMjIw0K
PiANCj4gICAqIGlndEBkbWFidWZAYWxsLXRlc3RzQGRtYV9mZW5jZV9jaGFpbjoNCj4gICAgIC0g
ZmktcG52LWQ1MTA6ICAgICAgICBbQUJPUlRdWzM4XSAoW2k5MTUjMTI5MDRdKSAtPiBbU0tJUF1b
MzldDQo+ICAgIFszOF06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUXzg2MDcvZmktcG52LWQ1MTAvaWd0QGRtYWJ1ZkBhbGwtdGVzdHNAZG1hX2ZlbmNlX2NoYWlu
Lmh0bWwNCj4gICAgWzM5XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvSUdUUFdfMTM5ODkvZmktcG52LWQ1MTAvaWd0QGQNCj4gbWFidWZAYWxsLXRlc3RzQGRt
YV9mZW5jZV9jaGFpbi5odG1sDQo+IA0KPiAgIA0KPiAgIFtpOTE1IzEyMDYxXTogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMjA2MQ0KPiAg
IFtpOTE1IzEyOTA0XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tl
cm5lbC8tL2lzc3Vlcy8xMjkwNA0KPiAgIFtpOTE1IzE1MTk4XTogaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xNTE5OA0KPiAgIFtpOTE1IzE1
MjMzXTogDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwv
LS9pc3N1ZXMvMTUyMzMNCj4gDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+IC0tLS0tLS0tLS0tLS0N
Cj4gDQo+ICAgKiBDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiAgICogSUdUOiBJR1RfODYwNyAt
PiBJR1RQV18xMzk4OQ0KPiAgICogTGludXg6IENJX0RSTV8xNzQ4MyAtPiBDSV9EUk1fMTc0ODYN
Cj4gDQo+ICAgQ0ktMjAxOTA1Mjk6IDIwMTkwNTI5DQo+ICAgQ0lfRFJNXzE3NDgzOiAyM2E5ODM1
ZGM3NWQwYThjZTU0Y2NlNDQwYTNlMGIzNmM0Y2VjNmFmIEAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVz
a3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+ICAgQ0lfRFJNXzE3NDg2OiA5NTdhYjlhYzY1NzcwMGRl
ZTUwZjQyNDM4ZWQ3OTY1MmRhZDkzOWEwIEAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcv
Z2Z4LWNpL2xpbnV4DQo+ICAgSUdUUFdfMTM5ODk6IDEzOTg5DQo+ICAgSUdUXzg2MDc6IDg2MDcN
Cj4gDQo+ID09IExvZ3MgPT0NCj4gDQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMzk4OS9pbmRleC5odG1s
DQo+IA0KDQoNCg0KDQo=

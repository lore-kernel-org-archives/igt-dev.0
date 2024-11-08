Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C37FD5D69F
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 01:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC90010E139;
	Fri,  8 Nov 2024 01:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBy9ow/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F84010E139
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 01:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731028508; x=1762564508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ma/NkJaYHzxEDWpWjTInf3z0OVRg20h68qjC7Z+GsZA=;
 b=eBy9ow/OlXHqQ0HIyLrNHKfc7MRd+bTlBOVItZVhBGb0xw0d3sztDCxf
 OLs+cZRINEpPkLz9TvHXLea9W1Pnhn02wC5/dJANElMlBFdQ8GypO0j54
 77rsmE6WkdrNH6LkBmo7SuNSqn4WwZCNubqVajVQxEtvH7Lg37ChNkTu0
 NXPJFnlShuoEpQTfGMqT6o3ZxHZV+ZpEJGvl87H9xrhmQoh7XWyqdJHx+
 6WiFaenQvcScLYLS7fUpgrQgr4DMFVzsPA0Rh+ZwohXf9x/juGBGyqMvU
 My6MF157vVsyTUz+5E7/lYoFqyp+yIQqaIpRwwnbyMa3gqGZ2pvjvZrN1 g==;
X-CSE-ConnectionGUID: 3Ap70KttTZCrieYgLu0rzQ==
X-CSE-MsgGUID: Q2HUP+8gSd2mmX+196jHfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31126442"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31126442"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 17:15:07 -0800
X-CSE-ConnectionGUID: jd5fBTd4SjK/Rz4vyqsX8A==
X-CSE-MsgGUID: sHNgmiWNQXaOQQiotZUdpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="108590173"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 17:15:07 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 17:15:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 17:15:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 17:15:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIsl7CihyAyU3QedKhePdlb7egKPqKMF28SMw8Vymp27wle+0/6cPv8n5zqs/NcIdhNDlX4Re5Sgyck+Ee0QiVvkGCljkiv8z+XSwG3CP0P0QaydLuAa/RUx7ookweumVuIV6l0BWHhULjKEQtz6+QgP5JHAgK40pj5VozLkrIN8bmMQQD/dy3ct984D9Kt26ehviHqdYi8pKGEX7rzexFNqlmHnTuO/6wZnixwQ+MUGGTwXc2MDP2maFno2A70gSUPSZKfraHHOFdJQtQKlql6jFoQ8PibT48jM4Wk2DyQwExnEXMbshkNzgHKe33HVQ421s3FH0wbgbYAoyx6i6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ma/NkJaYHzxEDWpWjTInf3z0OVRg20h68qjC7Z+GsZA=;
 b=mMbVt/uPtEHrUegm7Y6f3iKJ5AR3PqOXjvehaHseC3aPoacuGu4lBOdcjLo+ZmHdvp3ppt0do/PnGhLi05omaRNjjIDb7bh4o80AEHVtrDFKs70lHLX08jeBErYCf40/9HuR/Eyqw0cp7yoZ6bEHK6FkcfKEXPluybj/19xrQ7PFnLc4Hbd/cBeUGvTCC6UupnT8JZ3uMwmNLR4tdyHcSNLRTUxhDBsdj1HXts5ZU+qKlkvoazuzal0tILDoKam6TgD/bmnsltrh9usN49uossijFlOa4pokcm8Qse0gzlWqnB3SjiBeY1V8D/c9Io8tUsI7tTyq8kvZUpqMa1XoJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 8 Nov
 2024 01:15:03 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%7]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 01:15:03 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sousa,
 Gustavo" <gustavo.sousa@intel.com>
Subject: Re: [PATCH i-g-t] igt-runner fact checking
Thread-Topic: [PATCH i-g-t] igt-runner fact checking
Thread-Index: AQHbMS2AJqpGUHGjFUOxizV+nlIZr7KslOoA
Date: Fri, 8 Nov 2024 01:15:03 +0000
Message-ID: <4dbdbc32618cc7bbc7b13ee961534fc798be5b91.camel@intel.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
 <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
 <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
In-Reply-To: <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|DS0PR11MB7312:EE_
x-ms-office365-filtering-correlation-id: 8f066259-e42d-4c49-1d1c-08dcff92c64c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?blFTUUxCUTJhc1QyeUlKSEVGbWlWR3NUMy9xTFZteDhZTmlNaWwvS0NyeWo5?=
 =?utf-8?B?dlh2S3p2MDMvMzhjYXJMeEFGNmNwVVFWOE5hZlRabkVXSTlXL2tpTGVjeVhr?=
 =?utf-8?B?QkhiNTN5eXhxcWs4b2xPb2FxL1FJWmZVcmF6RWgxM0syRjVsUGpuaDV2S3E4?=
 =?utf-8?B?S0dQL3hmVE1rYlYyRGtlalg2L2wzanJUNTZxcEtjSy9YallrblBRREdpa3Q2?=
 =?utf-8?B?d3NPbDRnSmZIY3NUNnBUY1VYSFRwSlptaVpPWXM3U2NROHBnMUxrcXBZem1V?=
 =?utf-8?B?SDdaZGRvU2N2Q2xSR0s4eVRZcS94UzAwWU5RV0xKV3VHQWhIa1JRRmwvTUw2?=
 =?utf-8?B?cmRnOEdYUCtpeUxkS0ZFUXQ5V0d0enpEamM0TGRyZ2ovMG8vNU82Zzl3ck5Y?=
 =?utf-8?B?Qk92aHpPMWRHWHo4YTZvRTZod1dxZjZCM0FMeW9TTjNxR1VoVldHVC94Tk9s?=
 =?utf-8?B?WEMwNnQwUzlQRFptdW1NN29oOTJUTS9Za29lRUZhbndKVGFmVXZKQkgwTFpJ?=
 =?utf-8?B?bDY2UFYvbVNJeGFGQmUyTmx3dkFMR3ZuY05sZXVMTUJjODcyWEJ4d2NWSXlx?=
 =?utf-8?B?N0ZTaWlCYUhIS09GS1MzRzlIWGQ1WGhIWXh2aklKZEttSzNyTmkrOEdjL2ZP?=
 =?utf-8?B?eTRkUlR4MzhmbDZLQjcvQTBHRUhsM01tY0hTQlYxSUd1Q3VJcnR2T0ZJNkcr?=
 =?utf-8?B?ckFWS2pyK25IQWVRRGRkZDVMaHora2poYnQ3eGYwTFBXTjNzekZ2MGlqMDJG?=
 =?utf-8?B?QXlva2R4SzRCbTFTNUhObWNlQmVnRFlDNHBIV3VERzN5NUZmM1ZNNFpTR3NP?=
 =?utf-8?B?M0x2U05ESVVvVWxmWTJXazd4VTJOaTQrUmEra29kMVUxTjdoaDgyVTdtYUh0?=
 =?utf-8?B?UzN5R0lQVy9Ra0Fxa1NLRTMrK0E5Q1d4Tys4LzhWTGtJS2dxVzZBVWlnbU9Q?=
 =?utf-8?B?cXJialhtODlCWEdnMFBNQ21GLzN5OGQvZUdvMEM2dytZYzIyUWREZ3NvVXFz?=
 =?utf-8?B?SkIzcy9WUTJWZFBtSHZxT1htSVdJSWNSWW5qREw2c1g2UDBzN1ZVUlVxNm8w?=
 =?utf-8?B?Sno5ZVpMSFFWcDFKSEgyd3FOa2cvSmFKbDU3Z0YvVTI2a0t1clZGK2o4MGZP?=
 =?utf-8?B?YnZwdnp6Rkh5ZEgrMkFST0JBYkcrVTB0VUV1TjcxOG0rakdKV2d3Q1IxWEMx?=
 =?utf-8?B?MU1BQnp2UXh3TVQvVFVFSDE2TUNQQUlnK1haQnp2Wkt5TE8wbjB1QUhxVTFi?=
 =?utf-8?B?UitZaXZ0ZlhaNkF2Z0Voek5ZQnBYNWNoelVNT3NCSnkrUW96NzZtV2g3VzdC?=
 =?utf-8?B?MWpjbisyc3dkZFBuRDJYcUVlN3B6RC9pS1ZFMXhtVWk5akppL0Q2eUhOc3BS?=
 =?utf-8?B?azN2N0xORm5BS01xUjF6b0ZxZzNBZEVkRVEwdThicnhoTVEvMHBCWDhJMlF4?=
 =?utf-8?B?eVhKdmFaRTFnWmNzZnAxNXZhNmNHMmlMTTNVcHJlaGo3V2p6YUNvNWR5VlJW?=
 =?utf-8?B?T3ljTXA2MG5zVkFhTTVXMGRkM3ExbE04TWd0V2gxOGlPQWg1bWk2ZVEvR3Vq?=
 =?utf-8?B?dEh3dm0yRkg0Q3ZLYlZtWUtOa1JMUE0zMk1pREY2U3ZISVkzdXRLeWUxQnJT?=
 =?utf-8?B?OUNrc1R1Skx4YVdLZW8vSHpxakJOSzRpZ0lZUGNZT0VvOWI5ek8ySVZZTHNX?=
 =?utf-8?B?eGJXQm41UndITnNwaUl6NVBkWU1ra1RCNGVIamNlcEQvcFN2QlRHVU1Zd0Nm?=
 =?utf-8?Q?Z4sWxkevBkSuhXGF9K0qwoBZztaCmxJWq1LJrnS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RE9SZmNqcmd4eklpRmd5MzlselJSMjZBWjljUWhCRGZrRFRXZ05WdzFRRmpP?=
 =?utf-8?B?Q2QvaVhmbHhPTGYvM3RhQWNreXU4bml2UzhCOGxDS1NTdE1NWmdrOU1EQWRj?=
 =?utf-8?B?ODg2b1VkVGRZTWJVWlBaYXllRmNzVVp0bHdib203VDMvb282VlJ5dGFOeUEv?=
 =?utf-8?B?cmtyTjNTYVl2RXZmTFB4Mmx2RnFma0l0NjZPTG9pTHFOemF4UWJRdHcwZThS?=
 =?utf-8?B?SS9CYWp0Q2U5U1FwWVF5Zk1MNE9rQ2IzNVJOTW5zK0dSdHRNRjY2S0ZhRDRE?=
 =?utf-8?B?eGZYUjFNNEw1UWNIYy9ENW9JTy9pRHRSSzkzMjYwNEZCVTZOTE9NSlY3UHox?=
 =?utf-8?B?WDJ3aWU1SWdlM01zcWxHWWttNE1UaHoza044K0p4a05vR1FpZmFPSi9qRmFF?=
 =?utf-8?B?M0Z3K2RMOGhjY01UMG1EUDJjaFdRSmI2N3NTbkZDalg5WmFudFlQa1BmNlVI?=
 =?utf-8?B?WWt3eEFJZTl5THZJRVJ2ZGsvY3dsWkFXUGJNL3R6TFRXT0RXMHh6MXZ0Q3N0?=
 =?utf-8?B?ZWl0bVJWaXFLWnZwVTB6SWlHaHZvOVFKakpRY2tCYWpjaTM1SnpFWCtpNW5h?=
 =?utf-8?B?NmhWWk9pQzF2c1h3d0REdlRPYkNkOTVHL1pyck0vUXZIcERyS0F5ZC85eUt1?=
 =?utf-8?B?S3JzdDY2Zmg0SENWdElwZXJQdW1RMTRVZUJPaUsvOERPcVc5OWxQcml5Y1VL?=
 =?utf-8?B?Zy9nRXB0UERqc2xUVnpLYzdHOEkrM2ZuS0N1eC96a1BJTXNtNnhreVRMZk1a?=
 =?utf-8?B?MXFVYnFEbmJ0Q1hWRzl4elNDZXpSZmhWMGh3OEo1RGFlbjhoMFRLbHZnVXFO?=
 =?utf-8?B?ejFUZHIvVFg1bnpyNkdjVnBjTWVFcWZjTGJvVVg5M0VvNGoxcVR1bnhoekh0?=
 =?utf-8?B?dzBvUks5TE4xV09meXhMaWhmZ05XeU5odGsxajVhT1IxU0JjSkhMUlNNdnRl?=
 =?utf-8?B?TG1hSlozbERCaFVJRU5JcFQybDdWOFRCZWZURERFZ3VqTG15SU80RkZ6NVJW?=
 =?utf-8?B?Y1Mxb0w4M25veWg3NTJ5cUg2enZHK2czVERna2VBZm5Ta1JmcC9scnV1VWEr?=
 =?utf-8?B?S05wUG1pYW55UWhnNVhDb2JTT1NlbjU2RlkwYnZMemt1bGV2TW5hd2lTd1Js?=
 =?utf-8?B?Q3hJdm1wb0ZOSlAxbzVwU3ZmeW5BbFV2bFhhQ3RsOFY3RHNtbzJUVmVSM1FE?=
 =?utf-8?B?K3VrTGp1Si91TXA1UEFwM0tPbnpldWV6RzJZTkpCZ1RVN256cndQWnNWMkhW?=
 =?utf-8?B?Z0wwRzd5UlZXYm9Ya2lpTll2TWJ5dExMVUd3V2VhcGRSRmhoMU5HVzQ2eWph?=
 =?utf-8?B?RkpNdlc4MnZWWGtvMVBQejBSSC9WdjJXMXAwcVE5REVxdlRzM0VyVkJpVzhu?=
 =?utf-8?B?VHV5UWllYjM5ZkFCRDJxeDNiWkRMQVZPaHRqMitSeEd3S2lKZWxnaGg5QW15?=
 =?utf-8?B?RG16ZlNrTkpicnVlV045OE9pdlBMUUFseHFYWmFMUjBZOGRjTzhxaHduMmtX?=
 =?utf-8?B?QXFrM0RnTWk4dUwxUkNuY1Bnais1SFpEV0FyYk5xUWs5NlJkNzFaZTIwQll6?=
 =?utf-8?B?NWxzVHFKWjFsNkdYQnhNMXBSL0RnSG5ra2lxZGNkMW4ya2FONTFqVnhrRUZh?=
 =?utf-8?B?dlg4YjBPWTJXbVVXdGkreXkvYW5ERzlBVjhIMmlvRVBuUjRHYWxMeW1TbmU0?=
 =?utf-8?B?Y2pUY2RqMFc5MmFHeHdUbkR5d2UxeDVudlVoTkRSRlRTbnA1VVg3bm5lU3FI?=
 =?utf-8?B?eU9tR2JmUUlvN3UxREo2NXJSR0FPVWsxZnRha1J1RDUxaWEyMi9zY0VPZW1N?=
 =?utf-8?B?dTNZRUcxYUZHcVN1ei9ZOTVRSEhzS0pYVzZBOHlxK0VNa3lNRlBsUXhybEpK?=
 =?utf-8?B?d2JIMUNid1VFYWNCNEo4Mm9UbHFmcDZHckFHV2d3NlBzSHJkZmtqTVZZY2Jj?=
 =?utf-8?B?NlFudXcwaSsreEVjaXZTbWFLSldnVFlCQU4wamhPTTBlRmJMa2d5WFc3M3BT?=
 =?utf-8?B?MkpxWGdheU9YbjZoTU5IV2ZiWUZYSE92T3lHUWg5YS83bGpDVlJiRU5zSW5U?=
 =?utf-8?B?MmlHYy8wR1h2YTFETjJOY3VpS3VPcnpTSW1jUnU4TnFkMEd1cGxkb0tPcENq?=
 =?utf-8?B?OWRWU0xxZ05mdXZrSlVFd3IwTjE5WVF6b1lWM3liMXV5ZlRJYnJFRDcwT2pB?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19B08894403BCD4C8585D78174D81126@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f066259-e42d-4c49-1d1c-08dcff92c64c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 01:15:03.6849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijvQ79KcZjpz3HW2KiPkRwSTFHHOEHURu4QhMeD7XHYpt9ptv7ql8z9Q7zs3U4thVjQ3Z1Hx1h/l6AztsLynJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
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

T24gVGh1LCAyMDI0LTExLTA3IGF0IDA5OjU1IC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+ICtSeXN6YXJkIHRvIGtub3cgaWYgdGhlIENJIHBhcnQgd291bGQgYmUgZG9hYmxlLg0KPiAN
Cj4gT24gVGh1LCBOb3YgMDcsIDIwMjQgYXQgMDg6MTg6NTJBTSArMDEwMCwgUGV0ZXIgU2VubmEg
VHNjaHVkaW4gd3JvdGU6DQo+ID4gPiA+ICvCoMKgwqAgc2Nhbl9rZXJuZWxfbG9hZGVkX2ttb2Rz
KGxpc3QsIGxhc3RfdGVzdCk7DQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gU28uLi4gaWd0X2ZhY3Rz
KCkgaGFyZGNvZGVzIHdoYXQgaXMgdGhlIGluZm8gY29sbGVjdGVkLiBNYXliZSB3ZQ0KPiA+ID4g
c2hvdWxkIHJhdGhlciBwbHVnIHRoaXMgaW50byB0aGUgaG9va3MgZnJhbWV3b3JrIGFzIHBhcnQg
b2YNCj4gPiA+ICJidWlsdC1pbiBob29rcyIuDQo+ID4gDQo+ID4gSSBkbyBub3QgZm9sbG93IHdo
YXQgeW91IGFyZSB0cnlpbmcgdG8gY29tbXVuaWNhdGUgaGVyZS4gQWxzbywNCj4gPiBwbGVhc2Ug
c2VlIHdoYXQgWmJpZ25pZXcgc2FpZCBoZXJlKi4gRmFjdHMgYXJlIG5vdCB0ZXN0DQo+ID4gcmVx
dWlyZW1lbnRzLCBidXQgdGhlIGxpbmUgaXMgYmx1cnJ5LiBJbiB0aGUgY29udGV4dCBoZXJlIGEg
ZmFjdCBpcw0KPiA+IHNvbWV0aGluZyBpbiB0aGUgZW52aXJvbm1lbnQgdGhhdCBjYW4gY2hhbmdl
IGJ1dCB0aGF0IHNob3VsZCBub3QuDQo+ID4gQW4gZXhhbXBsZSBpcyB0aGUgZGlzYXBwZWFyaW5n
IEdQVS4NCj4gDQo+ICQgLi9idWlsZC9ydW5uZXIvaWd0X3J1bm5lciAtLWhlbHAgfCBncmVwIC1B
MSBob29rDQo+IMKgwqAgLS1ob29rIEhPT0tfU1RSDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGb3J3YXJkIEhPT0tfU1RSIHRvIHRoZSAtLWhvb2sg
b3B0aW9uIG9mDQo+IGVhY2ggdGVzdC4NCj4gwqDCoCAtLWhlbHAtaG9vaw0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU2hvdyBkZXRhaWxlZCB1c2Fn
ZSBpbmZvcm1hdGlvbiBmb3IgLS1ob29rLg0KPiANCj4gU28uLi4gdG9kYXkgd2UgYWxyZWFkeSBo
YXZlICJnZW5lcmljIHN1cHBvcnQiIGZvciBydW5uaW5nIGFyYml0cmFyeQ0KPiB0aGluZ3MgYmVm
b3JlL2FmdGVyIGVhY2ggdGVzdC9zdWJ0ZXN0L2R5bmFtaWMtc3VidGVzdC4NCj4gDQo+IAkkIGNh
dCA8PCBFT0YgPiB0ZXN0bGlzdC50eHQNCj4gCWlndEB4ZV9leGVjX2Jhc2ljQG9uY2UtYmFzaWMN
Cj4gCUVPRg0KPiAJJCBjaG1vZCAreCBsc3BjaS5zaA0KPiAJJCBzdWRvIC4vYnVpbGQvcnVubmVy
L2lndF9ydW5uZXIgXA0KPiAJCS0taG9vayAncG9zdC1zdWJ0ZXN0OmxzcGNpIC12diAtZCA4MDg2
Oio6MDN4eCcgXA0KPiAJCS0tdGVzdC1saXN0IHRlc3RsaXN0LnR4dCBidWlsZC90ZXN0cy8gcmVz
dWx0cy8NCj4gCSQgaGVhZCAtbjQgcmVzdWx0cy8wL291dC50eHQNCj4gCTAzOjAwLjAgVkdBIGNv
bXBhdGlibGUgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gREcyDQo+IFtBcmMgQTU4MF0g
KHJldiAwOCkgKHByb2ctaWYgMDAgW1ZHQSBjb250cm9sbGVyXSkNCj4gwqDCoMKgwqDCoMKgwqDC
oCBTdWJzeXN0ZW06IEludGVsIENvcnBvcmF0aW9uIERldmljZSAxNDI1DQo+IMKgwqDCoMKgwqDC
oMKgwqAgQ29udHJvbDogSS9PKyBNZW0rIEJ1c01hc3RlcisgU3BlY0N5Y2xlLSBNZW1XSU5WLSBW
R0FTbm9vcC0NCj4gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlzSU5UeC0NCj4g
wqDCoMKgwqDCoMKgwqDCoCBTdGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJy
LSBERVZTRUw9ZmFzdA0KPiA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0LSA+U0VSUi0gPFBFUlIt
IElOVHgtDQo+IA0KPiBTbywgaW5zdGVhZCBvZiBjcmVhdGluZyBhIHNlcGFyYXRlIHRoaW5nIGNh
bGxlZCAiaWd0X2ZhY3RzIiwgd2hhdCBJJ20NCj4gcHJvcG9zaW5nIGlzIHRoYXQgd2UgYnVpbGQg
dGhpcyBvbiB0b3Agb2YgdGhlIGhvb2tzIGFuZCB0aGVzZSAiZmFjdHMiDQo+IGFyZSBzaW1wbHkg
YnVpbHQtaW4gaG9va3MgdGhhdCBhcmUgY29tbW9ubHkgdXNlZC4gV2UgbWF5IGV2ZW4ga2VlcA0K
PiB0aGVtDQo+IGFzIHNjcmlwdHMgcmF0aGVyIHRoYW4gdHJhbnNsYXRlIHRvIEMuDQo+IA0KPiBX
aGF0IEknZCBsaWtlIGlzIHNvbWV0aGluZyBsaWtlZCB0aGlzICh3aXRoIHdoYXRldmVyIG5hbWUg
d2UgZGVjaWRlKToNCj4gDQo+IAlzdWRvIC4vYnVpbGQvcnVubmVyL2lndF9ydW5uZXIgLS1idWls
dGluLWhvb2tzIGxzcGNpLGRybS0NCj4gY2FyZHMNCj4gDQo+IHdoaWNoIGlzIGEgc2hvcnRoYW5k
IG9yIGVxdWl2YWxlbnQgdG86DQo+IA0KPiAJc3VkbyAuL2J1aWxkL3J1bm5lci9pZ3RfcnVubmVy
IFwNCj4gCQktLWhvb2sgcG9zdC1zdWJ0ZXN0OiRQV0Qvc2NyaXB0cy9idWlsdC1pbi0NCj4gaG9v
a3MvbHNwY2kuc2ggXA0KPiAJCS0taG9vayBwb3N0LXN1YnRlc3Q6JFBXRC9zY3JpcHRzL2J1aWx0
LWluLWhvb2tzL2RybS0NCj4gY2FyZHMuc2ggXA0KPiAJCS0tdGVzdC1saXN0IHRlc3RsaXN0LnR4
dCBidWlsZC90ZXN0cy8gcmVzdWx0cy8NCj4gDQo+IFRoZSBjaGVycnkgb24gdG9wIHdvdWxkIGJl
IGZvciBDSSB0byBwYXJzZSB0aGUgY292ZXIgbGV0dGVyIGFuZA0KPiBlbmFibGUgdGhvc2Ugb25k
ZW1hbmQsIHNvIHdlIG9ubHkgZG8gdGhhdCBpbiBDSSB3aGVuIHdlIHdhbnQgdG86DQo+IA0KPiAv
Y2ktYnVpbHQtaW4taG9va3M6IGxzcGNpLGRybS1jYXJkcw0KPiANCj4gQ291bGQgYWxzbyBiZToN
Cj4gDQo+IC9jaS1ob29rOiAncG9zdC1zdWJ0ZXN0OmxzcGNpIC12diAtZCA4MDg2Oio6MDN4eCcN
Cg0KRXh0cmEgaG9va3MgbW9yZSBvciBsZXNzIGhhcmRjb2RlZCBpbiB0aGUgY29tbWFuZCBsaW5l
IGZvciBhIGdpdmVuIHJ1bg0KYXJlIGVhc3ksIGp1c3QgbGV0IHVzIGtub3cgd2hlbiB0byBhZGQg
dGhlbS4gUmVhZGluZyBleHRyYXMgZnJvbSB0aGUNCmNvdmVyIGxldHRlciBpcyBkb2FibGUsIGJ1
dCB3b3VsZCByZXF1aXJlIHRpbWUgKHRoaW5rOiBlYXJseSBuZXh0IHllYXIsDQpub3QgYSB3ZWVr
IG9yIHR3byksIGFzIHdlIGFyZSBzd2l0Y2hpbmcgdGhlIFBhdGNod29yayBpbnRlZ3JhdGlvbiB0
byBhDQpuZXcgaW1wbGVtZW50YXRpb24gYXQgdGhlIG1vbWVudC4NCg0KQWx0aG91Z2gsIHR3byBj
b21tZW50cyBhYm91dCB0aGUgImZhY3RzIiBpbmZyYToNCg0KLSBJIGxpa2UgdGhlIHNpbXBsZSB0
ZXh0IGZvcm1hdCwgYnV0IGlmIHBvc3NpYmxlLCBtYWtlIHRoZSBvdXRwdXQNCmVhc2llciB0byBw
YXJzZSB3aXRoIGEgY29uc2lzdGVudCBmb3JtYXQgZm9yIGFsbCBzdGF0ZSBjaGFuZ2VzLCBsaWtl
Og0KW0ZBQ1QgPHRlc3Q+XSA8bmV3fGNoYW5nZWR8ZGVsZXRlZD46IDxwcm9wPjogPHZhbHVlPlsg
LT4gPG5ld192YWx1ZT5dDQoNCi0gV2hpbGUgcnVubmluZyB0aGVzZSBmYWN0cyB3aXRoaW4gaG9v
a3MgY291bGQgd29yaywgaXQgd291bGQgcmVxdWlyZQ0KZXh0ZW5kaW5nIHRoZSBob29rcyB3aXRo
IHNvbWV0aGluZyB0aGF0IGNhbiB1bmRlcnN0YW5kIHRoYXQgYSBnaXZlbg0KY29tbWFuZCBpcyBz
dXBwb3NlZCB0byBvdXRwdXQgYSBidW5jaCBvZiBmYWN0cyBpbiBhIHdlbGwta25vd24gZm9ybWF0
DQooaWRlYWxseSBKU09OLCBhbHRlcm5hdGl2ZWx5IGEgImtleTogdmFsdWUiIHRleHQgYmxvY2sp
LCB0aGVuIGRpZmYgdGhlbQ0KYWdhaW5zdCB0aGUgc3RhdGUgZnJvbSB0aGUgcHJldmlvdSBydW4g
b2YgdGhlIHNhbWUgaG9vay4NCg0KSnVzdCBkdW1waW5nIGFyYml0cmFyeSBsb2dzIGludG8gdGhl
IG1haW4gcnVubmVyIGxvZyBpcyBnb2luZyB0byBiZQ0KcmF0aGVyIG5vaXN5LCBhbmQgaGF2aW5n
IHRoaXMgZG9uZSBpbiBob29rcyB3b3VsZCBtYWtlIHRoYXQgaW5mcmEgbW9yZQ0KY29tcGxpY2F0
ZWQgLSBub3Qgc3VyZSBpZiBoYXZpbmcgc2VwYXJhdGUgaW5mcmEganVzdCBmb3IgZmFjdHMgaXMN
CnVud2FycmFudGVkIGhlcmUuIEkgZmVlbCBsaWtlIG1vc3Qgb2YgdGhlIHZhbHVlIGhlcmUgY29t
ZXMgZnJvbSBhIHZlcnkNCnNob3J0IGFuZCByZWFkYWJsZSBkaWZmIG9mIHRoZSBpbnRlcmVzdGlu
ZyBzeXN0ZW0gc3RhdGUgYmVmb3JlL2FmdGVyIGENCmdpdmVuIHRlc3QgZXhlY3V0ZXMsIG5vdCBm
cm9tIGp1c3QgaGF2aW5nIGEgY291cGxlIG9mIGNvbW1hbmRzIHJ1biBvbg0KZWFjaCBzdWJ0ZXN0
Lg0KDQpUaGFua3MsIFJ5c3phcmQNCg0KPiANCj4gKG5vdGUgdGhhdCB0aGUgY3VycmVudCB3YXkg
d2UgaGF2ZSBpcyAiVGVzdC13aXRoOiIsIGJ1dCB0aGF0IGlzDQo+IHByb2JsZW1hdGljIGFzIGl0
J3MgdGhlbiBwYXJzZWQgYXMgYSBnaXQtdHJhaWxlciBhbmQgYWRkZWQgdG8gdGhlDQo+IHBhdGNo
ZXMgYnkgc29tZSB0b29scykNCj4gDQo+IEx1Y2FzIERlIE1hcmNoaQ0KPiANCj4gPiANCj4gPiBT
byBJIHN1Z2dlc3Qgd2Ugc3RhcnQgd2l0aCB0aGUgaGFyZGNvZGVkIHNpbXBsZSBjb2RlIHRvIGFz
c2VzcyB0aGUNCj4gPiBwb3RlbnRpYWwgdmFsdWUgb2YgdGhlc2UgZmFjdHMuIElmIHRoZSBmYWN0
cyB0dXJucyBvdXQgdG8gYmUgdXNlZnVsDQo+ID4gaW4gaGVscGluZyB1cyBkZWJ1ZyBjb3JuZXIg
Y2FzZXMsIHRoZW4gd2UgZXZhbHVhdGUgaG93IHRvIGV4dGVuZA0KPiA+IGl0Lg0KPiA+IA0KPiA+
IEFueSBvdGhlciBmYWN0IHlvdSB3YW50IHRvIGFkZD8gQXNraW5nIGJlY2F1c2UgSSBtaXNzIHRo
aXMgY29kZSBpbg0KPiA+IG91ciBDSSB0byBkZWJ1ZyB0d28gaXNzdWVzIHRoYXQgYXJlIG9uIG15
IHF1ZXVlLi4uDQo+ID4gDQo+ID4gPiANCj4gPiA+IFRoaXMgd2F5IGl0J3MgZWFzaWVyIHRvIGNv
bnRyb2wgd2hhdCBhbmQgd2hlbiBpbmZvIGlzIGNvbGxlY3RlZCwNCj4gPiA+IGFsbG93aW5nIGRl
dmVsb3BlcnMgKGFuZCBDSSkgdG8gcGljayBhbmQgY2hvb3NlIHdoYXQgZ2V0cw0KPiA+ID4gZXhl
Y3V0ZWQuDQo+ID4gDQo+ID4gVGhlIG9yaWdpbmFsIGlkZWEgd2FzIHRvIGhhdmUgc3RhdGljIGFu
ZCBkeW5hbWljIGZhY3RzLiBUaGUgZHluYW1pYw0KPiA+IGlkZWEgc3VnZ2VzdGVkIGEgY29udmVu
aWVudCBtZWNoYW5pc20gZm9yIGVhY2ggdGVzdCB0byBkZWZpbmUgZmFjdHMNCj4gPiBhcyBuZWVk
ZWQuIFpiaWduaWV3IGRpZCBub3QgYXBwcmVjaWF0ZSB0aGUgcG90ZW50aWFsIHRvIGJsb2F0aW5n
Lg0KPiA+IA0KPiA+ID4gDQo+ID4gPiArR3VzdGF2bw0KPiA+ID4gDQo+ID4gPiBMdWNhcyBEZSBN
YXJjaGkNCj4gPiANCj4gPiAqIC0NCj4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvNjIxODQ5Lz9zZXJpZXM9MTQwNTY2JnJldj0xDQo+ID4gDQoNCg==

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E39E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 10:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8517010E167;
	Thu,  5 Dec 2024 10:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQSeWqWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCCD10E167
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733395375; x=1764931375;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=b3qN4WuO/ye6mZr/7KYCBilkIZ4XaNN0S5VPDwUZQnY=;
 b=eQSeWqWzW5bCFPae3uuqw4wgmoOgTi/mfx/qIU22Jw0bL1VAmvI1cTma
 IzEnQyrI+ZRgbzBixFQXjVCijGpvEt46U7XKj6BzXLodMV0UJAW9BMbJJ
 wBSmLXMhZLpwRbfw20ew36KibMs3yCFeoCIpyjzVxFVDZ9o9Ve+cyxqwy
 du4QzM5IxrKNpaPyCMq7DIyPyAe4cGyREFzwyJ17jssrlaKUiS9QcGD+W
 J8itwjggcKDo7aiMtbV+ELWDwznjl3GowzZoPsLdX9JUWw7s0OYoDAm7l
 kvhEs5SVLgoAR01Mr2/bQJiiunQinZtMgPBCot20ehIuzVzxHosfygDAx A==;
X-CSE-ConnectionGUID: pquH5f6XTsauF7fFFe0g0A==
X-CSE-MsgGUID: TImbn5BZTNG9Qssw0puq/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37636065"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="37636065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 02:42:55 -0800
X-CSE-ConnectionGUID: ACWx4cKQTjKOVVAyXAB3jw==
X-CSE-MsgGUID: y8/dG8P+Ta+VK27yiVxf9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93952060"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 02:42:55 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 02:42:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 02:42:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 02:42:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rjawl0oj/LVIJXr3Hn1FveKLV0AROYy1iFh/H0VH561Etqh7mHI7oWaZBRFCc3gPl8M19KP6/o6xGDu9ZxKm8xFDxNpRMA7iC/YXGC7JbbkVS72UJcD7ZqlpXpOe2Pe+JAtTECq+DwjRRuEEsSjv5O+g4UyE2OQQf9NGJ6a8FqTMyyvjMJkj/yBrgxdevbnS9Dpoqzq875tsTPIMlHsQA6OC7bpCKUw3O5LBqtVfdMMVrvqmF5oTjhb3BpC11tcdeRfwAf8WOsj738js+fwqARji7PW5L5WTJl/WldoFS0glIP73fgscOxhtSkNS8+7vzGHdL03TIlWnYh5l5FU32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3qN4WuO/ye6mZr/7KYCBilkIZ4XaNN0S5VPDwUZQnY=;
 b=j39cN3hal7yPZWC5SCN5LqRH2KOiSUY+H92G7eHxWUB6hl1ZKT1AUDwPrx7Mff3AtcgvG92wtC/g8uJaOhBvnBMHxxXENhHTCD9ipyL0nAlcMC7HnHKxU+cq9TjJmelw0lzzgRSDb1gTMJwfyYAbr2Q7HZNYmpduQ0DnciAjlGvm5K2YlOjgbXkv7Gz8dLpS8mkcPPNeTD7nplYCdWuofoK14wjmkeX6ck3BiaF4odAsdf8J/XUKB+ZcLdYj1zEtNPIA1AJnkuuEdjzm+AJ1hKeC2brx3ZtuVeTWz05ZQEniHvyuf/PX+8hITvwMvZmWSwTVpaoAR0xUIyfOWa6dEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by IA1PR11MB6196.namprd11.prod.outlook.com (2603:10b6:208:3e8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 10:42:51 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 10:42:51 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2 i-g-t 1/1] tests/intel/xe_eudebug_online: Fix
 run_online_client memory leak
Thread-Topic: [PATCH v2 i-g-t 1/1] tests/intel/xe_eudebug_online: Fix
 run_online_client memory leak
Thread-Index: AQHbRwAlbRCmPsZ8JUS23iNjqqgjebLXdtsA
Date: Thu, 5 Dec 2024 10:42:51 +0000
Message-ID: <feab9bb685f12a159c330a1974e0d919aee202b0.camel@intel.com>
References: <20241205102613.13524-1-dominik.karol.piatkowski@intel.com>
 <20241205102613.13524-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241205102613.13524-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|IA1PR11MB6196:EE_
x-ms-office365-filtering-correlation-id: 20ad888e-725c-48b6-681f-08dd1519918c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OEsyWHA3MWpNWHF2djF1NVhySUsxRkFmZURsVWE2OTZFeDRiSEhiV2hSZHR5?=
 =?utf-8?B?NGx2NnB4MXcyWWgzM1hXVzFyS3Ntem1DMmZqUzBDSWJCTVFKK3FEU1FDTVA4?=
 =?utf-8?B?aXRmMG5vWldFUDhaNFZGckRwd2J2Wk8xYzlmTDdJSW1ISm5WOSsvTVdIdW04?=
 =?utf-8?B?a2dyaUFBVXluWVluMWluV3BMRHJGZDZBcnFOMFVpVWh6LzdWZ3hORnZPMGNB?=
 =?utf-8?B?K3lnYU1hamJZMXc3OGtIK1pheHJlRlMyS0Fia0cvMSsxQlYvRWsvTFZIQUpP?=
 =?utf-8?B?VFJyWS9wSlNKYVRHTzFHLzFqY3piRGtMUVU2VkpZeTBnekFpMnQrbmJlSzFT?=
 =?utf-8?B?RVN3alE5V2FBYkNOcjQycndSS2pvUG1HVWd5a3NzaHNYcmIwUVVxVmRMVUdK?=
 =?utf-8?B?QU9NUTB5TTkwNHQvWVowMFZwTDJFRG5GTFVoUVdRZkI3MU1yTnJnMXZ5M0J5?=
 =?utf-8?B?bi96aWMraklNa01nZXdzdjdSaUlqUUxvb3VNMmZiK3pqejY1dFNkNnFDK3hi?=
 =?utf-8?B?VVdqMk5ibTFGM2VkTWlScWhjbXQwMWtNZmZsdnFCTTNvd3BzdmY4eThMSENV?=
 =?utf-8?B?UDFMRFRnQ1hOcTQrVDl5alQ5VVZsMjFGbGpwOWZtZWI2MWpxTWxNbm5ZNlBu?=
 =?utf-8?B?aEdJdXQ1d0hXeVROeUdFdGVwWUFncUhmbmNwNVJKeTgwZUtQZnNwNzkyTlE2?=
 =?utf-8?B?M2luOU1oby9ybWcwNGZoTDdKWFAxQys5dmZ3ZnRrYkJZL3hXNVNNT3NXQWhR?=
 =?utf-8?B?djU3WnFpYlF6dHl2cEJSMVpXd2licE95K05ZVVpCV3dObytJbGp4ejRMZFor?=
 =?utf-8?B?UUxlMHdsWFhJa0w5V2QrV1h4cTJhOE5YdHhlMUY3WUNSNU9tbTdHckpFcDNh?=
 =?utf-8?B?ZUN4dE9WQjdua3FhZTc1bFJkczFpMG8yU1lVa214TDMzUFlGOFh5T0JJeXlk?=
 =?utf-8?B?V3ZOaHh5TEYwdGQyb2JHTENURGpXN3ZTV0Y2RWIzY0d3TUt1REM0OEFwc2xV?=
 =?utf-8?B?WmQybU9ydGZ3M2lYdnpJSUtLRzd1c3p2ZmxJUWtKeVZwME0vbWlucUNLbzZj?=
 =?utf-8?B?U2lXdlpMYUw4Vmdxa2ExRVBoYytPblUyRnJ2dXVuRlhZYmZPRGVHeWYxcUcy?=
 =?utf-8?B?VnUrQ0sycWwramU4dXo1aElXbUErRHh1Wk5aU0FldkU0MHRkZHBLa0JudjRn?=
 =?utf-8?B?elVBS0RyVEJiclRHeVI4Y0tCdWQ4OGtQODBRWGZickFsQkRrQlNZMVRmcVgv?=
 =?utf-8?B?WVpkeng4dXZiLzZYTXpONzUyNnZPa0RxSHVvNmJpWlFLWUhycFIzNFcvSXBo?=
 =?utf-8?B?aWhsOTRuaTczUG0zalJiMUhmMzdJUk9IcDhUOHh2N0M5STl6Y2o4ekFiUWlP?=
 =?utf-8?B?VjQyaDJPZDZPd2ZEcE5lSW1KelRyaFVPSGRtL3ZUOUI0M1dMSHpmODZ4WlQw?=
 =?utf-8?B?RURVZ1lsaGwwcFdsMEo0VVBkSXI5YXhlbnI4Z2FSZTdENjY3ZmVkejNXbHJZ?=
 =?utf-8?B?T1JwcEU4NXFucFVaNTZoQVErWXM1Ni84Q0xRNXRJMHNuWlFFbHBobG8wL0hS?=
 =?utf-8?B?eWMvRjNxRE92VmQ3QmIyTTk5OTVrS0NDampwQVBlRFlHT1FucElNZVBWK0k4?=
 =?utf-8?B?SDFySXdKK2Qyc2IvQXJIT20vNDltM3dKNzN1SWdzZlkwc1pJazdGdGlUYi90?=
 =?utf-8?B?TFNNd0VKNzQvV1lKN2M0bEZScy8yY3VzRTk0cGFHYmNsOXVOdWZZNm5GSGFZ?=
 =?utf-8?B?SEpGcWE3Y3pOVGl0NktQL0t4RlNianRvUDkzZUZjelJIVWdqQkdra0lmL2h0?=
 =?utf-8?B?WUFpMXM1cUg5RUplZWh5SHJuZXBib2Fwb0lnVmZQMk41eGQ3ZFYrZis5T01B?=
 =?utf-8?B?dGZNaUhPOTVTN0VTdWZuSnpsYm8xVWx3UExuaFlzWmQ1V3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3doZHQ2SlhMeXdEUFg1R2ducVlmNFdiTGtpcWU1RW9PVzZvMVBnQTJ4c0Fz?=
 =?utf-8?B?Z0ZZQ2NMVFZyejd6ZUh4dVlTQm5hRUU5ZkFPMjgrdlVvd1NVbWdQS1hSZCtM?=
 =?utf-8?B?SUZ6TktNU0lrZysydjViTjhFZU1RNlVSandIaFhwdktwVFVGak90Vkl3WFY4?=
 =?utf-8?B?eEgzZ0VWejFRN0c0blFybUlNcXhOd0dVT3FvMmhCdlFrZEU5NlFyRVhWcUlv?=
 =?utf-8?B?QWZicFE2QmwweVlGREJHVjhNQ2srQmp0OXVmaGZtMnFtTUdKd1VqWGNkU1Y2?=
 =?utf-8?B?MGV3MWUvWmRzY1FnbytLdlEzZVJLYTRUcUF4SUFVenZ0Sko5bHJBSmlDWHEw?=
 =?utf-8?B?bDhjQXFydUhLRVV3cmQxY2tLL2Joa3FGMWc2MXlGdXN4NXdNb1FUc0dpMk1I?=
 =?utf-8?B?am1KSysxbGdBdFNYSTJYc3kwVlI4NFRKaEg4MjcwenVNSFIwOEVMN0ZWVFZz?=
 =?utf-8?B?ZEN5R2FMdS9jUmg2aFp4bkJ2cEo5blVaeW43V0NWQTZhdlRzd3NLUGVyUEhq?=
 =?utf-8?B?ODV4Uk50Znl1NmN6RjlQeTRaTTN3dE51bllrenNxSDN6SWFMNExLY2tOd2xY?=
 =?utf-8?B?OTY2L0dyaTVWdU9UbTBGNmVLNnR2N3NNK3VUS1I2b2E0MHpyVFV6djViUDk3?=
 =?utf-8?B?WEtPS2hPeHNMOU83Yk5jVmgzb0I4Y3FKbWdhTjJ3Rkd3ejRWRkkvMlArdE9X?=
 =?utf-8?B?S2pUVG1yeW54Y0JtY1hteVRWdCtPYXJlL3JYZ2ZYaEhsVkNDWks3OXRPSXU5?=
 =?utf-8?B?eVZ6eUpObG0zK01NN3pSamlzZkEzdy9KK29xTGRLVkhtVDV3eS9nMjZJU3ZI?=
 =?utf-8?B?VXUrRUVNRlRJSEJ2UndjMG5xOGZHQXNzNzJIN1lXalk4VkRjVVBESGJTeE4x?=
 =?utf-8?B?NnNFUlAzOVhzSlJWdEFOd1g2MER2QVZHbnVsNzNmenJicHlXdGxrZS90Q1Fr?=
 =?utf-8?B?cVE3d3BEZkNOMWxuL05sR09Xa2FUNXhWWWVtYlNIOThWSC9raVFndGtyaHZ0?=
 =?utf-8?B?bmM1ZUNvMWFoSnJnMldpKzc4dTY2MVF3UC91emZkbWVyK1NiYUd2WFZJb0RJ?=
 =?utf-8?B?Y0RTM1RtUlVHSE01QU1DUkU0TXNoeUVYT0NUd2VhMkxVME96S0FGeVgwNzk0?=
 =?utf-8?B?WGhwRUc5M01leDBRa3pkSlBwMjROT2hpQmpSNzQrRDBteXdiMnpqajhFN2tB?=
 =?utf-8?B?S2duRno0VGg1UEs4ZStBeldsOXB3MlcyS3UzUVhQNVd0Z0wvc29XYlJkakRN?=
 =?utf-8?B?M2FyQkNqS1FsR1JtYlpiZVBlQW5Cbmt4K25ySzZkRzVud2pORHVvNXNQZWdZ?=
 =?utf-8?B?VUpaQmVOSFNSbGFZaEd1NlVkZXQvS3FoemZSaGc2czc5SjlrWDRSUk9tWE0x?=
 =?utf-8?B?TERuU1Y0SDFoalkweWJuZHZIblhZOUNUQjhTbSt6UG1rQU5wRGlyRzE2TWt3?=
 =?utf-8?B?YnB2MkYvNDNuL0RqZGVVYktXZmdoM05jc1NNdzZCTENtaUZlTHdYQ202K254?=
 =?utf-8?B?VnJyTWVQeURvWlFSbmIvSExvR2tUeWpUT0kzcWlYR1lrSm5lUkE0OHJBblVE?=
 =?utf-8?B?b2czMzFEbEJQb3NFYU1Jd3lVOGZyOWVjckRJYlVRVFpIaURKa1EvVVJ1SEJp?=
 =?utf-8?B?ajlKMkVzVC9pdUxERWRGdVVsMm1tR1J3cGI1TSswd016WkJzaUFxa1lvOEJ2?=
 =?utf-8?B?NU4vS3RVL3VDNnBmdlVRQk5lWStQQk9zY2UrR3pJdENJL2kwWHNwZlNHWE5N?=
 =?utf-8?B?NkcxNTdTWCs1NTluQXcwcmdnc1p1VFNWYmd4R0U2ZENaTU1tcjZublFUTnJn?=
 =?utf-8?B?a1Z5Zk13ZkZxcDQ5bTV0eDRxN1VzTzFaWHpNZDNIMkF6TXFxSHhGaWNWY2Uw?=
 =?utf-8?B?ck82UEswZzNmbDZmbm5ncytKM0xRVHB2bDZKL3ZzM01SYnhITGNLNUw1RGZM?=
 =?utf-8?B?Tm1yV2ZGMUk4RWxBRGUvZkplSWJnSmVjeGhDUmcxWlZlNlZjRjJPWWxhU2xa?=
 =?utf-8?B?azg5QngzQXRRRGVyZGlOU3VZdS9pM3pRRUJ2NDM4QmtMZGVOWlJ4Yy9ycnZp?=
 =?utf-8?B?eGI1Uk9mYmc0WEt1bzVzVmpDTXBlQ2hzQS95MEt3eEpCN0ppamJtbVFTUm4w?=
 =?utf-8?B?OUgrRWEvWmptbGszdDVHaHp6UHBiVk1wemUrVkdrWElJUkgyZURDTUFLa3pI?=
 =?utf-8?Q?cvfgqBwyEF+RXvaeB65qpIo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40011DB24325884D9CB80CF32041BF01@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ad888e-725c-48b6-681f-08dd1519918c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 10:42:51.6235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FV9K35HykHYdsDeIlV1/PMsLHDXJtl//flANdzgzb05nLcdwuQNzwSbVy+mRa6x4lfwzWZQ4Sxj2uxqNyPryn+Kfs88GRjeyQpsdUZZJE9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
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

T24gVGh1LCAyMDI0LTEyLTA1IGF0IDExOjI2ICswMTAwLCBEb21pbmlrIEthcm9sIFBpxIV0a293
c2tpIHdyb3RlOg0KPiBJbiBydW5fb25saW5lX2NsaWVudCwgYnVmIGlzIGNyZWF0ZWQgYnkgY3Jl
YXRlX3VjX2J1ZiwgdGhhdCBjYWxscw0KPiBpbnRlbF9idWZfY3JlYXRlX2Z1bGwsIHRoYXQgY2Fs
bG9jcyBhbmQgaW5pdGlhbGl6ZXMgaXQuIFRoaXMgbWVtb3J5IGlzDQo+IG5ldmVyIGZyZWVkLiBG
aXggaXQgYnkgYWRkaW5nIG1pc3NpbmcgaW50ZWxfYnVmX2Rlc3Ryb3kuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIDxkb21pbmlrLmthcm9sLnBpYXRrb3dz
a2lAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMg
fCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYyBiL3Rlc3RzL2ludGVsL3hlX2V1
ZGVidWdfb25saW5lLmMNCj4gaW5kZXggNzUwMzUwNTU2Li5iZjUzYjQ0Y2UgMTAwNjQ0DQo+IC0t
LSBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwv
eGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiBAQCAtMTEzMiw2ICsxMTMyLDggQEAgc3RhdGljIHZvaWQg
cnVuX29ubGluZV9jbGllbnQoc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpjKQ0KPiAgCQkJCQkg
ICBEUk1fWEVfREVCVUdfTUVUQURBVEFfUFJPR1JBTV9NT0RVTEUsDQo+ICAJCQkJCSAgIDIgKiBz
aXplb2YoKm1ldGFkYXRhKSk7DQo+ICANCj4gKwlpbnRlbF9idWZfZGVzdHJveShidWYpOw0KPiAr
DQoNCkFja2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRl
bC5jb20+DQoNClJlZ2FyZHMsDQpEb21pbmlrDQoNCj4gIAl4ZV9ldWRlYnVnX2NsaWVudF9jbG9z
ZV9kcml2ZXIoYywgZmQpOw0KPiAgfQ0KPiAgDQoNCg==

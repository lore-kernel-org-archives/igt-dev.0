Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885DCC54EDA
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 13:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D107210EA65;
	Wed, 21 May 2025 13:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maQWMIpP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463D818A1FE
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747833266; x=1779369266;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3XKz048cR5SeeVyAoy4+em9LaHvUdb9KQ8hTMUMwI9U=;
 b=maQWMIpPhIUiemjxNy4kbTV/5gpSZZ7k3Eh197ok9EHum+HnnbZqeqbZ
 zKml63jBO/10dqzuTmv55fMAoI8kp7h0N+veEY/xVdPp6lnoInwgPrhPf
 VPOGsf0qeiFdekn+pkuPk9op7TpKDieBqWvqwfFCVsKvbpbyNZlFHaK33
 UQ4eQivmjHgd/qc3L48FeX5q/dah0D5N7Y2aK2cwT2m5La+aHONuNNUPS
 hfy60rdWOQ0wJoK1fJQH9RWNSe9Vq7LCMkyGJOzEu5xquB2uWiJTwdFEh
 XsRnsofWt9Fw32dTpk8gDltHKqKFrTz2X9WkMBmYTjmfpdeBIQumwanAq g==;
X-CSE-ConnectionGUID: RvZH4swJSoqwZg8kgH/zGQ==
X-CSE-MsgGUID: V6Gaxs2+TOGEbyJdpLIvcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61149082"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="61149082"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 06:14:24 -0700
X-CSE-ConnectionGUID: 6sV8emjvRAyANPKgBZm3nw==
X-CSE-MsgGUID: D0jhnfJtSNqscZTwfxwDrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140595465"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 06:14:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 06:14:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 06:14:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 06:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dj8kuihb+53SYn4CFlqzwc1S5P+CANbNLqExs/fqns/wZeFcPY0xq/jW15Kr4pyHA4D3OuG5Q8mp019ATRtqHShu2ItfM3jGWY6MJfkZekfd/Gn/esAxamcF+VVcmGxPwxigRhJuIX5F5Wx5RcEvXVLzH447MHV0ZvAZhxYnUVLywZqbdz8tKzMmW/jRzjb+59JArUY743Ew9ksz3LzNQ40fD4LufBI9XdVJQ/WiEcITOLiiXNKgnwunC9HTJy7N33y2TbtJNx5wMSBCBABLAZMDgavHoQab7Hf9rnPzo+q6UQm2ltDDNGAoicQTuZ/oQyzhTy69+LA2q81MsmzGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XKz048cR5SeeVyAoy4+em9LaHvUdb9KQ8hTMUMwI9U=;
 b=IW/8QXXXhgR6DbxJJwH5/NyeHMIBSasjfvRwA+WIvKd8zVPikSSIUYdeaPoONDKkmsF1Ji+IlsGqZRL7joqvcYTwhtIGUZcXD77yymIy2MMnpBCcqoKqaBkOfBPf+RuAB0f/aCa4L691M6OAUJvdIzOBelMlm9zsPYg8KBmCAxeWXjU9LgT5TEMrPH+2Qf5FeUwAqLyLV8VJ8gxNhqCJapRQ6Q9R/hI/JxBwxrdeSl5Xwxd7QvbELIViKKHVVCv6HBDP5YxzEczwY0aDm1yiBAfzuzH6zevlYSnHvkbKvZe9pKJrRvzjjYrR5hEFX4oLLtEfw5lixnfDxHxSX8ZLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 13:14:19 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 13:14:19 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_plane: Print out tested formats
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_plane: Print out tested formats
Thread-Index: AQHbykpUpladnGw1jkaNNbF9iio/EbPdD9HQ
Date: Wed, 21 May 2025 13:14:19 +0000
Message-ID: <MW4PR11MB705443979DE0FD4F857E4192EF9EA@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20250521121641.32384-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250521121641.32384-1-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|IA0PR11MB7379:EE_
x-ms-office365-filtering-correlation-id: 2a297492-628b-4ef3-2023-08dd9869651b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZytwazR4TklJRUtvQVUwMTBUSDdtbFVmb1NoK01oclpPM1VjOWI3MXMzYVFJ?=
 =?utf-8?B?Y1diVTVpQXZuWUhKSW1Eb1JyRDR6bUg2OUxXQ0FhdUw4aHowbm8xZTFueXJE?=
 =?utf-8?B?SFowS05Hd3RlSnlGamNCMWlmMkN1cnRRdjlxWllFSlNjUS9FUzNoRVBOSSsx?=
 =?utf-8?B?aUdXM1dqcFdCZU1rMXRIOStsNExGY3JBRDdyUFhGSmdrOVA3cGtmcitkWXox?=
 =?utf-8?B?Szh0WFRTVFBUYlVOOEVhVmpjenVzQkZLbldPazVpSmwyY2FiL3NMbGU1bzk4?=
 =?utf-8?B?dXZZSk9LbXJWbDJXdXl3SWZtUTluZkRneXZwUmxINzNhYmF1Yk1ZcUxocFBj?=
 =?utf-8?B?eHhBU3A4N1ZRNVY3L3NWWithZFh3RmlFNWVPcVBaV1dLMTI2V1NQUDBuZlZt?=
 =?utf-8?B?OVlxZlM4T0Nha05PQStoT0FvMDA5WWlQZ0o5ZFdBNGhSd1E2aDJtMmJONUZz?=
 =?utf-8?B?MU94ZXROcmJnRlhlMWxtRmtxODJ6SlBxcjIrVnlySW0vd3pMOEYwQ0NpRXk4?=
 =?utf-8?B?emFIQS9FZTdEQTVXSHM5ZmRXMnJKdU5hY0Q2ZEE2c0hwQituOXZJelZOK2Ur?=
 =?utf-8?B?N3BOK1kvREhlczBTT0tRUFZEazUrbENWMjd6NGgyNmx0VUEwa2xTQi9oK0dz?=
 =?utf-8?B?KytiaTc2ZFZKY1h2MlVmUTdBakZ5bEVvYjZueFhSZkZnSm04Y29qbHNDOGl6?=
 =?utf-8?B?eUxMU2xQVFpDVnRZN0d2M2N6d1hFRTlQVTV6bm5hTWJEM091cGZ5VzVmYjBL?=
 =?utf-8?B?cURzQzc5VVppaUdkTm9FQk4xSlZocnJ4NTArcUJ2R2ZEaEVRUzVLd0QwamJo?=
 =?utf-8?B?S21pMWVEU01LWWlwVll3b0VxRTJFdjc0R1NQRi9pb0NVRUo4dlYvb2hNYTBj?=
 =?utf-8?B?akZSbGtUa1pvMUkzc0FCMlE5UERETmF4MDBkclg1Y3FQaDJldFVmc2tjMWc4?=
 =?utf-8?B?U2Z0VG4vejRBY1B5ekc3ampNTUlCZDRuTnZGS2orMlZ3d0lOR2dPNklpd004?=
 =?utf-8?B?NGlpaFFNTmZDZTZqT2Y2dGtFUm1yQlFxaHo3b2tNUWJjL1k5cE9MNEw4TC9j?=
 =?utf-8?B?eC94TVFmdTBIbDg5dFc4cmJudUQwbjFXNEc5ZnpJNHhNek5zcTdwR0xaZHJL?=
 =?utf-8?B?djNNbyt6L3VIc21vbWppeTY5RXRBcWZYNithbi9yL1B5bGU3UkhkbThFakRY?=
 =?utf-8?B?UnJqWUllSWsrZ3ZTK0NpS2poamovL014UUVKTE51cXBPR1NEbXhxQ2ZTQk1M?=
 =?utf-8?B?ZENscHlwN0MwSXUxVzFuL3lJTjRIVXlpeE5EWHlMTXRkZ1dlbEFuaE1UTElQ?=
 =?utf-8?B?WldZNFRsc2ZXSS85SmJTRGFiYTAvbFhubzZwWWREYWVqdmZ5YnYxcVV4R0pJ?=
 =?utf-8?B?MWl1MXRabTVqcXhXMW9vT1ZMdFVlak5NOUdsb21rTUZ1dnJHYktPRzVUTmZl?=
 =?utf-8?B?d0xNRVBvcHRheTIyUElDVHZ2UmRMemVvV09wMFVxdnhyWXdyUHBQWGJoT3Nk?=
 =?utf-8?B?b1hJTXNFOGx3bHRERkNtaGhVRnNYRTFsVW1zUEdWaDBzOFRJWHcrZVo3RnI1?=
 =?utf-8?B?WllTb0c3SnNWOTI0QVRUR1Uzdzl5eW9IdzFjK0Q3RUdhU2JWdjBKK0tQV2ZP?=
 =?utf-8?B?YmJHRFAxaXNlaWUyZlVIZ2YzaEtjamdlWkl1MmtXU290S2c2YUxnSFdSNElk?=
 =?utf-8?B?QmNBRU4yMVFNOWw0bGowV3piWTBlOWQ5NkJYTmxob04yQkRZcFp1Vk5uVTQv?=
 =?utf-8?B?SUtBQVhvbjhMSmthbHFqamNiOEZCWXJGRmc1dExiT25hQlhhNGRGMGVUM0Ny?=
 =?utf-8?B?UWwxRjdlYjFpc0p1dUdQNGE1RmZpdWJmZDNtNjM2UXdtRmZHV3d4aXN4d0Jp?=
 =?utf-8?B?Mk5xYUhaRGgxWk5WVDV5NHFRV3c0Mks1bytub056eGlsaktRQmlncElNanZm?=
 =?utf-8?B?Y0VacGNmT1Y4QWl3clNlS3J0TWFGd2ZMZ1VGTEpVdFFFMnNqUWpiN0ZBenpJ?=
 =?utf-8?B?cERRYTVpNWlnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXFKdWRSMjNRdGVaOEdkMHkvbFVVTHJoc09TRnRsSC9sRXF2MndQc25HSHo3?=
 =?utf-8?B?TDVKM3dKbkdmVlY0dmdva1ZNWFAvTzZwTmc5bXNHWUpZbXJkVEp2RlNkVm5S?=
 =?utf-8?B?NkdEMTNpL2tpbmRFVzF2SDNnS0xBZlhoOEpaM29zeXU4NlFuVGVlZHBVRXBV?=
 =?utf-8?B?ZUE5ZlM2NGN4R3ZjbTRRV0dlZnRzc3Y2aU5PQW5CUFZFWW9yMXEvdy9zci81?=
 =?utf-8?B?bXlSMTNHbmxqVDVQSWE0VDdxUHFFZndJZWJOOXh2eGlsRHNyTFNNTEpoQVpK?=
 =?utf-8?B?RmtVSHlFR2x1NUxqYjJnZjdSeHJLNE1wT1JkTVMxZTBwVkpmRjlwUG5JK3Bo?=
 =?utf-8?B?dzd0Zy9hZlgyZGpXRkNGTDMyRG5vNkhGRTFYTlExTHo5d3dhOU42TTFTTUZS?=
 =?utf-8?B?TWlla3dQMmUxMlRQbzNFS20yekNjRmZubEtjYWlSZk01RDBzaHFrWUJxRExD?=
 =?utf-8?B?bkZ0QjFyVWhwUC9aaEFOQUtsWkFTMy9uQnZsblBRcEdZdnVSRldiZy82bUhn?=
 =?utf-8?B?bEVNUDFvTHpWY0VCdk1hSTZobTZPdis2QUtaRnd2blJEMXZTRFVDQ2t0NGxy?=
 =?utf-8?B?L3NTY00vUW5xQ1FRMEFYWFJNMkwyN0EyOU50MVNVL1A5TDhQM0o3NndpajlO?=
 =?utf-8?B?dlRtcU5JQTdONFFKZVZBMm9LVDVCTk50bkEyQTRDNEErajNOdDUyazF4U2Jl?=
 =?utf-8?B?MmkwVnJYTmE5WkZqQ2o4c1lCWjR4YS8zVTJpVXBINEFwK0JoWStCVXpzcWh0?=
 =?utf-8?B?RFhGTzNoYVBhT2hpOCtmQ2VMTUJxWExIQUlxQzYyby9ycG9XcEhsWWovTFBn?=
 =?utf-8?B?LzYwdzdTY2tlbGg5a3BhNkVoSUJrWkgreTRvVkZNMEIydE54ZTNDR2dWdHky?=
 =?utf-8?B?aGJPMWxhSGxRN0YwWU11NWc3V2FPWFN5eW9EZnN1a0c1WjNqU3lLWE9LdGJ2?=
 =?utf-8?B?dlk0Z3locnhnK0RJTjZ0RjEyNk5XMzdBSVRCaXUySXlKa3JpbERkS09HS2gy?=
 =?utf-8?B?bzFZaXQ5bUd4UFBOYW56Zk5EdVpHeXlTak5UNS9FZXdtZzhnRUFTcFZyeEc2?=
 =?utf-8?B?VjdFMW5Wa0pmZ0xKdmhLK210UXZndUlMZVpZV1l0NVlWZDA5S29LdDdqY28y?=
 =?utf-8?B?YVhGRTQvTm12RVcyZGhaN241eFJwaHFHZVFPVjJ4bGhGdUZFYi92Yi9GNmNX?=
 =?utf-8?B?amcwNlk4QnQ4V2RFM21BZ0RRV2xlb0QxdGwyS0hqQkpMVVN3UHpRYW5NMzV4?=
 =?utf-8?B?c1doOUNMSTlocTFnZjhHaU10SzlIR2poNmRXbyt3em1DK3ZSSEpLdWZVMFRn?=
 =?utf-8?B?RGU0eTNpK3JsMXVPTFczMVQvbHFUSEhabFNLeUYxcXp1eFVBSTIwaXlGYXZW?=
 =?utf-8?B?eVlJbnplSXJkbm53b1ZoUGQyMGJ4Wlg1ZjA1bWQ5dDlEZUVjUC9lV25zalZD?=
 =?utf-8?B?VGR6d0dYRGo3TkZRTWQyajBKbmFKeXhab2ZTN2lMS29EaWNsYmJMTXRsYk1m?=
 =?utf-8?B?dkRzaHVuMXp5dGdzeW9UL1lsVTJDWDdEcDZ2SFg4LzVibTVPcFo4bkJDdGVF?=
 =?utf-8?B?RnZBK0FucUZwT2ZIcDFWL0dJRXFjK1c5NmtPYjVnckVndzc0UHRCWEpLSnFa?=
 =?utf-8?B?VnBURDJkRHRJL2xyUXVrdjhreWJZT3doR2ZZVWVMOEhKNURHRmkzdFJQY0xi?=
 =?utf-8?B?cG5nczAyYmdIV2R3M1ZXZFhFYVl3NHMzcnBKaXZGUkdnWXMwMFF1di9HLy9R?=
 =?utf-8?B?UC9pMzdwd2xtRXZsbUxTdlduT2s4cHlPV1E3M0hFWHN4anFubUtkVmd2NTR5?=
 =?utf-8?B?Zk1aZXkwT25ISytuV3VmRmcwK1ZGYWErTkt5c1RmaGxwa016NE5zNGxLS1cy?=
 =?utf-8?B?aDJxQlIvNkhKdHFISTk2ZFpSMHRrTXdwaFBlbGx0c1hnTFpBOGpWWmh0UWUx?=
 =?utf-8?B?YUQ5WEg5TjFMZ3dsc253eWVtcnluYVlGd3NMRGwyTnlpZFFLSVBZNHRVN1Ji?=
 =?utf-8?B?cVB3dWhnWk0zRlVWTTlvNTJnN0NKQ29WUmw1TTNNaFYrUXpGNExib05qTVVP?=
 =?utf-8?B?UjE3amFON1p5UzNySWhHcTlOWmQzc1dsb2lZc29ISzR0RGI0UDdkZzk1R2Rm?=
 =?utf-8?Q?cKm5qVf1xhjgt995UmapwL9Uv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a297492-628b-4ef3-2023-08dd9869651b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 13:14:19.1183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tz4RGm8+UcOZhabu4MuHTPb1BLq/hvT0QCdI5R5ih7F5kEQkL7+Tmu1YFU8ZHrkicrxVibfzgNIZMqbspLb+dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS1QZWtrYSBIZWlr
a2lsYQ0KPiBTZW50OiBXZWRuZXNkYXksIDIxIE1heSAyMDI1IDE1LjE3DQo+IFRvOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBl
a2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IDEvMl0gdGVz
dHMva21zX3BsYW5lOiBQcmludCBvdXQgdGVzdGVkIGZvcm1hdHMNCj4gDQo+IEVhcmxpZXIgdGVz
dGVkIHBpeGVsIGZvcm1hdHMgd2VyZSBtb3ZlZCBmcm9tIGlndF9pbmZvIHRvIGlndF9kZWJ1Zywg
bGV0J3MgcHV0IGlndF9pbmZvIGJhY2sgaW4gcGxhY2Ugc28gaXQncyBlYXNpZXIgZm9yIGRlYnVn
IHRpbWUgdG8NCj4gc2VlIHdoYXQncyBnb2luZyBvbi4NCj4gDQoNClJldmlld2VkLWJ5OiBNaWth
IEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEp1aGEt
UGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAg
dGVzdHMva21zX3BsYW5lLmMgfCAzOCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5l
LmMgaW5kZXggZDA4ZWM4MWU0Li4yODMxYjJkMTggMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19w
bGFuZS5jDQo+ICsrKyBiL3Rlc3RzL2ttc19wbGFuZS5jDQo+IEBAIC04ODcsOSArODg3LDkgQEAg
c3RhdGljIGJvb2wgdGVzdF9mb3JtYXRfcGxhbmVfcmdiKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBl
IHBpcGUsDQo+ICAJCQkJICBpZ3RfY3JjX3QgcmVmX2NyY1tdLA0KPiAgCQkJCSAgc3RydWN0IGln
dF9mYiAqZmIpDQo+ICB7DQo+IC0JaWd0X2RlYnVnKCJUZXN0aW5nIGZvcm1hdCAiIElHVF9GT1JN
QVRfRk1UICIgLyBtb2RpZmllciAiIElHVF9NT0RJRklFUl9GTVQgIiBvbiAlcy4ldVxuIiwNCj4g
LQkJICBJR1RfRk9STUFUX0FSR1MoZm9ybWF0KSwgSUdUX01PRElGSUVSX0FSR1MobW9kaWZpZXIp
LA0KPiAtCQkgIGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLCBwbGFuZS0+aW5kZXgpOw0KPiArCWln
dF9pbmZvKCJUZXN0aW5nIGZvcm1hdCAiIElHVF9GT1JNQVRfRk1UICIgLyBtb2RpZmllciAiIElH
VF9NT0RJRklFUl9GTVQgIiBvbiAlcy4ldVxuIiwNCj4gKwkJIElHVF9GT1JNQVRfQVJHUyhmb3Jt
YXQpLCBJR1RfTU9ESUZJRVJfQVJHUyhtb2RpZmllciksDQo+ICsJCSBrbXN0ZXN0X3BpcGVfbmFt
ZShwaXBlKSwgcGxhbmUtPmluZGV4KTsNCj4gDQo+ICAJcmV0dXJuIHRlc3RfZm9ybWF0X3BsYW5l
X2NvbG9ycyhkYXRhLCBwaXBlLCBwbGFuZSwNCj4gIAkJCQkJZm9ybWF0LCBtb2RpZmllciwNCj4g
QEAgLTkyNSwxMyArOTI1LDEzIEBAIHN0YXRpYyBib29sIHRlc3RfZm9ybWF0X3BsYW5lX3l1dihk
YXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLA0KPiAgCQkJCQkJICAgICBpZ3RfY29sb3JfcmFu
Z2VfdG9fc3RyKHIpKSkNCj4gIAkJCQljb250aW51ZTsNCj4gDQo+IC0JCQlpZ3RfZGVidWcoIlRl
c3RpbmcgZm9ybWF0ICIgSUdUX0ZPUk1BVF9GTVQgIiAvIG1vZGlmaWVyICIgSUdUX01PRElGSUVS
X0ZNVA0KPiAtCQkJCSIgKCVzLCAlcykgb24gJXMuJXVcbiIsIElHVF9GT1JNQVRfQVJHUyhmb3Jt
YXQpLA0KPiAtCQkJCUlHVF9NT0RJRklFUl9BUkdTKG1vZGlmaWVyKSwNCj4gLQkJCQlpZ3RfY29s
b3JfZW5jb2RpbmdfdG9fc3RyKGUpLA0KPiAtCQkJCWlndF9jb2xvcl9yYW5nZV90b19zdHIociks
DQo+IC0JCQkJa21zdGVzdF9waXBlX25hbWUocGlwZSksDQo+IC0JCQkJcGxhbmUtPmluZGV4KTsN
Cj4gKwkJCWlndF9pbmZvKCJUZXN0aW5nIGZvcm1hdCAiIElHVF9GT1JNQVRfRk1UICIgLyBtb2Rp
ZmllciAiIElHVF9NT0RJRklFUl9GTVQNCj4gKwkJCQkgIiAoJXMsICVzKSBvbiAlcy4ldVxuIiwg
SUdUX0ZPUk1BVF9BUkdTKGZvcm1hdCksDQo+ICsJCQkJIElHVF9NT0RJRklFUl9BUkdTKG1vZGlm
aWVyKSwNCj4gKwkJCQkgaWd0X2NvbG9yX2VuY29kaW5nX3RvX3N0cihlKSwNCj4gKwkJCQkgaWd0
X2NvbG9yX3JhbmdlX3RvX3N0cihyKSwNCj4gKwkJCQkga21zdGVzdF9waXBlX25hbWUocGlwZSks
DQo+ICsJCQkJIHBsYW5lLT5pbmRleCk7DQo+IA0KPiAgCQkJcmVzdWx0ICY9IHRlc3RfZm9ybWF0
X3BsYW5lX2NvbG9ycyhkYXRhLCBwaXBlLCBwbGFuZSwNCj4gIAkJCQkJCQkgICBmb3JtYXQsIG1v
ZGlmaWVyLA0KPiBAQCAtMTA3Myw5ICsxMDczLDkgQEAgc3RhdGljIGJvb2wgdGVzdF9mb3JtYXRf
cGxhbmUoZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUgcGlwZSwNCj4gDQo+ICAJaWd0X3BpcGVfY3Jj
X3N0YXJ0KGRhdGEtPnBpcGVfY3JjKTsNCj4gDQo+IC0JaWd0X2RlYnVnKCJUZXN0aW5nIGZvcm1h
dCAiIElHVF9GT1JNQVRfRk1UICIgLyBtb2RpZmllciAiIElHVF9NT0RJRklFUl9GTVQgIiBvbiAl
cy4ldVxuIiwNCj4gLQkJICBJR1RfRk9STUFUX0FSR1MocmVmLmZvcm1hdCksIElHVF9NT0RJRklF
Ul9BUkdTKHJlZi5tb2RpZmllciksDQo+IC0JCSAga21zdGVzdF9waXBlX25hbWUocGlwZSksIHBs
YW5lLT5pbmRleCk7DQo+ICsJaWd0X2luZm8oIlRlc3RpbmcgZm9ybWF0ICIgSUdUX0ZPUk1BVF9G
TVQgIiAvIG1vZGlmaWVyICIgSUdUX01PRElGSUVSX0ZNVCAiIG9uICVzLiV1XG4iLA0KPiArCQkg
SUdUX0ZPUk1BVF9BUkdTKHJlZi5mb3JtYXQpLCBJR1RfTU9ESUZJRVJfQVJHUyhyZWYubW9kaWZp
ZXIpLA0KPiArCQkga21zdGVzdF9waXBlX25hbWUocGlwZSksIHBsYW5lLT5pbmRleCk7DQo+IA0K
PiAgCWNoZWNrX2FsbG93ZWRfcGxhbmVfc2l6ZV82NHg2NChkYXRhLCBwbGFuZSwgJndpZHRoLCAm
aGVpZ2h0LCByZWYuZm9ybWF0KTsNCj4gDQo+IEBAIC0xMTA3LDEyICsxMTA3LDEyIEBAIHN0YXRp
YyBib29sIHRlc3RfZm9ybWF0X3BsYW5lKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBlIHBpcGUsDQo+
ICAJCQljb250aW51ZTsNCj4gDQo+ICAJCWlmIChza2lwX2Zvcm1hdF9tb2QoZGF0YSwgZi5mb3Jt
YXQsIGYubW9kaWZpZXIsICZ0ZXN0ZWRfZm9ybWF0cykpIHsNCj4gLQkJCWlndF9kZWJ1ZygiU2tp
cHBpbmcgZm9ybWF0ICIgSUdUX0ZPUk1BVF9GTVQgIiAvIG1vZGlmaWVyICINCj4gLQkJCQkgIElH
VF9NT0RJRklFUl9GTVQgIiBvbiAlcy4ldVxuIiwNCj4gLQkJCQkgIElHVF9GT1JNQVRfQVJHUyhm
LmZvcm1hdCksDQo+IC0JCQkJICBJR1RfTU9ESUZJRVJfQVJHUyhmLm1vZGlmaWVyKSwNCj4gLQkJ
CQkgIGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLA0KPiAtCQkJCSAgcGxhbmUtPmluZGV4KTsNCj4g
KwkJCWlndF9pbmZvKCJTa2lwcGluZyBmb3JtYXQgIiBJR1RfRk9STUFUX0ZNVCAiIC8gbW9kaWZp
ZXIgIg0KPiArCQkJCSBJR1RfTU9ESUZJRVJfRk1UICIgb24gJXMuJXVcbiIsDQo+ICsJCQkJIElH
VF9GT1JNQVRfQVJHUyhmLmZvcm1hdCksDQo+ICsJCQkJIElHVF9NT0RJRklFUl9BUkdTKGYubW9k
aWZpZXIpLA0KPiArCQkJCSBrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSwNCj4gKwkJCQkgcGxhbmUt
PmluZGV4KTsNCj4gIAkJCWNvbnRpbnVlOw0KPiAgCQl9DQo+IA0KPiAtLQ0KPiAyLjQ1LjINCg0K

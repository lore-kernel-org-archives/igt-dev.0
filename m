Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00261CDE00B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 14:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8273010E181;
	Thu, 26 Sep 2024 14:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWQvGB5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AFF10E181
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727360309; x=1758896309;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=39jhOJJP+iV8XChjJepOsPmRpsy3OU4a6d20dBOz8aI=;
 b=JWQvGB5X7HnSgxrW+RDJI0p9npD/C4isfVxWjWPW+J8rZ6twvafdANw1
 mpHOagt/oVb+BuNYyTSV3r5OSD0vo2VnFJUeOSudakXhLf/eub5Moegfu
 MAASPYoT8lXJ/VpQHets2gdkKdBL8afJXeBkl0CdCj64smj9fd/AqLHZl
 WhtVy6GMSTdC5+mQMvmuGt0QBWYRJTlN7moA4APujsEslDqPM8CqWOTgH
 A2vcrBc8t7DRtCX6WcuoVow5fk4GigkBQHKqpIoYurZ4TIlkQkYMw4RHi
 +FDvvMKkls8fdH6nSAmMnYGdSqm9LTLmL+KgznTiHn1FHza9+lhsG5c9K w==;
X-CSE-ConnectionGUID: mC14ynBlQNarIwToEJYgPA==
X-CSE-MsgGUID: actkTAKeS8CkBaKsJR4Jqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37126582"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="37126582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:18:04 -0700
X-CSE-ConnectionGUID: 1KABy6rXTAG+wVKpaNNb+A==
X-CSE-MsgGUID: kLpQqlOYTn29Vf3cSSdBBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76668322"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 07:18:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 07:18:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 07:18:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 07:18:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpZAaVFx2nVSzD9szf5a5z96N2GpGxkt4nF3aGR5cDRxN+I53K/YymJedKLtdFRRVnRrVg+nC4rHGhISdU4jYPF7FzbFgRztJrS7ExS2O8IVq5CpHlwGMzBY5cpzWuHOUwI9qb1Q0Z7NcBVCsz+27eaOBn5LkWipvyrNLTBscuLptykqLsQa3dz5QnZWGs/vHN3JiujLzs04kSowJiBenFwCOwmF9vo++Jtb+ZiBUyD4Zsr0/vobdX4DLmOdvhXdF4fZX2Sk4fnZCd5tIdCmkLIsRt91HyAiojt3CBYtyyP7Psrr1MWUTUX/w0MGQE4EUGSTF/XBN9bJ8i7mrZCmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39jhOJJP+iV8XChjJepOsPmRpsy3OU4a6d20dBOz8aI=;
 b=LTf0O6yv5f1Sl6XhofSWfccEFXkppoKN5mTVqIIYWnILt0gp5gJgrAuIN+QoiJN3dLiFCrs82qCpaaoQbRk3+bxQ9lbPXu3em9KDkAWEYRjHluwUD5N7NR/10NWL3FLc4mOfm7kAZR4x7X/hJ+9EDb+OSYHt9uLLPTBQ+d3DzAtaAkdJCUHeVXBF55mpmSAuEV83RmV3zyEfvStRtGYOjTr+L3gTW6UevZeQ6fF5XL+ry+S8ZWtdUBM1BiYH3dnMpkAtnrkyz+HTEeQm7bSYHVZhOG9TwQnuFz5amqU+7SnzoE1dePj0WpsoK0nf50snV1cPNJixKQM0GOFbG5pKqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 14:18:01 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%6]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 14:18:01 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "mika.kuoppala@linux.intel.com" <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] tests/xe_eudebug: Detect thread starvation on
 discovery
Thread-Topic: [PATCH i-g-t 2/3] tests/xe_eudebug: Detect thread starvation on
 discovery
Thread-Index: AQHbEAHkIQybe65w2kiYWcZSliMx+bJqHcOA
Date: Thu, 26 Sep 2024 14:18:00 +0000
Message-ID: <077daf5f29055787e9d3a8f81da724b1f0ed5e20.camel@intel.com>
References: <20240926103939.550907-1-mika.kuoppala@linux.intel.com>
 <20240926103939.550907-2-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240926103939.550907-2-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SJ2PR11MB8568:EE_
x-ms-office365-filtering-correlation-id: 1bb8464d-3d00-4481-ce38-08dcde36072e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NnJaTU85RkhBSlpLd01mb1c1THFqVHR1YlFCbFdESXhXSXJjZFZtQm0xcnRj?=
 =?utf-8?B?OWVvU3VmZXhQeGZCVnllTm1iaGdRTnZYUkRQc3k0QjlCRm9iZkRmZFc1dFNO?=
 =?utf-8?B?U29MSTRyMzhpcEVYUkhMaVJJWjFMSUpKSTFYZlJvakY3VDNKd0R6U3crajlx?=
 =?utf-8?B?R1JwTXB4bUNTV1NxZGxMV3pwb1M0czdFYzlCd0tXR1duY2l2ZkpQUDVDVmgr?=
 =?utf-8?B?Um9HM2ZIT0tBSmNodTdKVDFZQ00yZitvM2F4MDVEK1dKZ0tvRVpvZjVVMHFp?=
 =?utf-8?B?UzVnYUM2WXFKSGxBVXlodDg1N2hpOFo1eVovUnNhbWlzYnJuY0FsMVk1TDVx?=
 =?utf-8?B?RStoaFNnS2lkSktDRDdGTGYvbjM4MWFiS21yWFdnVDFBaWpPcW9sTi81YUYx?=
 =?utf-8?B?MjdseDI1VEtsYVU0WWRWSHZlU0E4MXJoNnhJS1VDVmdMcjNxTGJSc1JqTHc0?=
 =?utf-8?B?eE9sdWJDUU1iYzhhNmFBaThsdTRBeXgxKzFIK3o5SXFmL1JXamhpVURXUlln?=
 =?utf-8?B?MTVlWi9zWVNZQ2JKdUN6Wmd1VEN5dmNzS3VnN0ZvREwwYWJqQzVyTFo2N1JZ?=
 =?utf-8?B?OHBnZVNFa3FINzlzMFlvMmNQUUFXcGt3b3g3U0Y0dW9STkFIRFJpWitYV3ls?=
 =?utf-8?B?dVV3R2pwOG1UeDNrcXlxc3NOTnZqVjM3RHVnaXVFV0pWYkgwV3lhQUJBZ3dH?=
 =?utf-8?B?SG90cndpQmlyRW9NSmR5bU9YaTJqcXcvMmtFUUVGcDFKdkpVbzlPZnlGam5x?=
 =?utf-8?B?bzVPM3ZDdEswQXk2SDNiRTdCWDJ2Y1R3RXhxMUJyWkl0Szd0cTM4YTB0dkht?=
 =?utf-8?B?MlVoQjdsTXdMZm9KZENKdi9YYVVncTNtUWhXNGpuWTBSck1CdXBqNnh0N0sr?=
 =?utf-8?B?NWRjRE9LVnk2cTVjbjRsL0daaEtFVzVQOUZGaTBKZHBZUmVTSGMvcmQvWVZw?=
 =?utf-8?B?eit3UDNDbm1tTjcvV3lHaTJNbjkrS3FJcjA3Y09uSHlWc2JZbUlCZlZwa2pi?=
 =?utf-8?B?QkMvWThmZ0VweUFUWjVPTTBzcm10NmVtZGtDdHlYRjV5TUVNcmh2Ykk2MGpF?=
 =?utf-8?B?MGdLM2FqOFp5ZUc4U21NS25Ldkc4eTYvSUZRS2tmZXdybnJOdHpVcm52eGta?=
 =?utf-8?B?Sk93cERRMnFBREdsaDhyQ1ljNGFpOStmeGJmZjJUdkNqU3hTUVdRQUNQRm5Z?=
 =?utf-8?B?enJocFgyaFh0bU9ZZDQyS3ppYkNjK1Q1UmV1NTB6SkQwVk9lQUV4VFJKdURG?=
 =?utf-8?B?VmQ0eVNmMk5CdHVFZU15THdkTkJnRFhmcmJZdzRMUEZmRnlzWlpIU2RVVnc2?=
 =?utf-8?B?ejE4UWorR3Mxa3VGOVBCYUlUQnl3dkN6bm5scU1naFBhRWdHa0V2YzJZM3BM?=
 =?utf-8?B?ZVgwQ3ZYQWZJVDdnOEo2V2hoV3ZIVjdJdVo0Nm9rUXgxZTdOdXB5R1dZcy9B?=
 =?utf-8?B?cStWTUt6eUtyQlJjM0NFNjRKUXk1akpYVTVFbU16ajMrcnNlbnBlUUM0TGpy?=
 =?utf-8?B?Z011VXNhY24weU9mbU1HRnp5Y0JCSXJPeFJwbGc4ZkpyMlkvejJwNHAyd3dY?=
 =?utf-8?B?WDVoL0dZU3orekh3ckxkYzhNLzlBUUF1dER5RzRaNGRSMGwzRWhzSTNSU0I2?=
 =?utf-8?B?aUJzRVRpWnQzQkxWd1N3Qm0ySlV3TVFtUVVuRVl4dERGdWVtQ0l5b0ZjVDRt?=
 =?utf-8?B?d0VOUDZLZVBHQ3ByNlY3ejcxSUdaUHpsQ1NrTDR2T2lCUkhTQmxtaTI0S0dQ?=
 =?utf-8?B?QkQ3WHFVc1BvTGhXRkZ0RDczeVZ3TkpaVzZCUzB4UDI3KzR5N3JLVWNydUZO?=
 =?utf-8?B?MzlQdEc2K3FHc0g5b0tRQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0lGSXR6Sk42TS9qSytSbWRPNC9lWmNRZmxXS1k1N2E2MDRTYnZvSnB1Rmw3?=
 =?utf-8?B?T0FBS2ZmUmMvUkhyOHVGeDU4Si9YeUpvZEoxeEVwekVvcHBBazN0eTk4QjRn?=
 =?utf-8?B?eXFOKzZGdEU3cHNhZ1FRZThDZTRjckxNK093TjlXcEdXVTRpZ2hhNUFMTkpX?=
 =?utf-8?B?VG1lTXI4Zm9QVDVWbGJSdGhDZjVkdVVnVnlLK3JlZEtPL2IrSUpFWnYyMEQ5?=
 =?utf-8?B?bUcvTjI3ZnU2dVFmc2ZuZE5VeEg5YWMwbEozbWNMTVEvZVVOcG9EYlRQUCs3?=
 =?utf-8?B?bnFLdUZNamdYdkVnNDliRGpKN2F1VWMzM0tDTWVZVXF6ZkdjT01HUldEQ0ZB?=
 =?utf-8?B?MFoyMU9BVnkxZlRPOGtRanVCSlpuWXE1UjlCWk5Xa1NpTUZZTTkyWTBvanlx?=
 =?utf-8?B?TTlIdkFzT29nQmlqUWhBSEJjY25DVXh0aE9MeGhNUGFkenVyTzVNb3BGZ1pj?=
 =?utf-8?B?WFdDZzdYc1dXVmJ4OVZEVDRZbnJIYmtHREpmNzhJMWI2TTRDWW5tZkJPTndQ?=
 =?utf-8?B?bWhpZUpmN2FWdnVSdittZXErWHdid0Z0eG5pLysvRXlBd2srN0N4WElhZHUr?=
 =?utf-8?B?aGJoU0FBejE5L2ZaMmtWQ3Z1QnAzaXJ3ejEzd2JjMFNIbEtrajJGK20rNW1I?=
 =?utf-8?B?QlFTdUNZM21hTlU1QXVMalVIRjhlUlorK1B3bk1aNUc5WVpwWjBRMUd5Rzlq?=
 =?utf-8?B?bGZqakZkeDZ2SFRWM3N4MWNua2ROekxrY3JiSU1kVE1tSHp3V3JNTW0zRmZY?=
 =?utf-8?B?dXovU1Y3SXJDVndPazgvRHk2ZXhyRlZ0K2dIWHFhYkdFNHFkdXcwMmUyWkUv?=
 =?utf-8?B?NnA5Y2NiVHVxSGxrUTFFUlM3Qll2cXZWRmFIbWEyN2w1N0I0MGJjSmxNSFNt?=
 =?utf-8?B?bHY2cDBRVUVFSGxSdnpJalAxUFo1NTV2S2pkY0hkRTY3cEVLT29sS1NDMmxM?=
 =?utf-8?B?MHRYWElOcmlNUkxHL0Q1QlpEd0J0TGZQY1FDaU9Pak1rdDRnazdBVWJ2clJF?=
 =?utf-8?B?dklqZWYwb1B5U0RwY2dwTm92L2VwT0ZXMEovaWRuaHlpRU9ScG5LZCtYWUYr?=
 =?utf-8?B?UGozUjBxa2tMM0VxeUlVME5tVlo2NUZQNFNHMkZMTDBrMFc5NnFxRnlHVThU?=
 =?utf-8?B?WnVGTDNRSXpVTHBDVlJaZzBMTDN4NzNNYy80R0MzbVpUMVY0SGtMU1dnVnBa?=
 =?utf-8?B?V09rUHFIVTRZRFlxNnNxVzhnNDdjblRuWFlLT2g4bmYyQ0F2Q0kraENKaW9T?=
 =?utf-8?B?VTEwdG5XNytVWGhvcVpvVmxHS3RTSmRTdUpYUVFDbGN6WktuaUN6dG14RnhT?=
 =?utf-8?B?WW1nT1pwMW96TnZvNi9meXI4OElDRGUyaFA0WjdVWHAyUmJaVHJJdmQ3dXRs?=
 =?utf-8?B?WEpHb3FKaEt0Mmg0dVdMZmlUOUhWQkFMbnIxWCtFdDN4Tm9OZDhjaStPOTdy?=
 =?utf-8?B?bm9Ic0hrN05YQjlaZTIrVWtLSTQxUEwwSjhDbHlpcXRIbkxoanpWQTEvSUlz?=
 =?utf-8?B?RVlUb2J1WVdJeWJIdDFMWGZCcGZ3VmRmQUpDRWtKalBwdmtDU1ZjTU1BUCtC?=
 =?utf-8?B?OTRTc01PUElzdXZOSVl1WXRrKyt2OGtMSllCSmRQRE9vVHlINEZ1dmZNai9V?=
 =?utf-8?B?bzNiZlVWUFpTdzdoeVBOTGRDUkk3amdlLytzSDVNTXAzcE5FL3drRWNZNkNM?=
 =?utf-8?B?OE9WbDJicnp5SVArQUd6MWxjaWhnQjVKbXNTbW9rbjB2bE1vcEU4eGZaUmdX?=
 =?utf-8?B?OFZNRmxzZ1VVQ043R2NJY0k3ak92NHNoU0FPYk1GM0psZ3NoOWZLM3BKeXlX?=
 =?utf-8?B?S1MzNXp3ZVdTOHlyczZPeGEraDl6S0liNFJhRE4yN25jSFNyN08xRmd4SVh2?=
 =?utf-8?B?Wi9hdmxYdzQvaEJ4Y0VPajNpTW1Yc0VacFc0Lzc3ZnB1QU10czROTmhkNEdF?=
 =?utf-8?B?ZXZyZlozZWJzYy9BWmUzaGJUYnF6dDhiQzFJVnNpSmczcnpUM0hPbzJyUmVQ?=
 =?utf-8?B?TjdOQ0E1SThhQ2pRK0g3UXgwUmhxaFBRN2FlVDhSWkQvYlVEbldyY2luMTcz?=
 =?utf-8?B?SlBWaFcwWFZzNWh3eEpaSG9HK3puTnkxa0N5dG43WTBCM1o0SXZGRnJQbCs2?=
 =?utf-8?B?WFp1amJuTW9PSWFjQVMvbTdDVXJjblMxRTFxUVpPM1Z2Z0dieGdETU1oak1w?=
 =?utf-8?Q?RauM+mvkkKwlMh1Og7IY86E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6D231102EB93843997F96C7D5473E51@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb8464d-3d00-4481-ce38-08dcde36072e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 14:18:00.9838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CkUkwna0AfVjsjsrykpViywHKSDjMLdRTDS2ebGR7VmZ/W4GuzywlKfGt+YLk7sexSTXCfiGTmgddppJ8E2ZRK6/EMmPkT8YbfCosk/bwZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
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

T24gVGh1LCAyMDI0LTA5LTI2IGF0IDEzOjM5ICswMzAwLCBNaWthIEt1b3BwYWxhIHdyb3RlOg0K
PiBEaXNjb3ZlcnkgdGVzdHMgc3Bhd25zIG11bHRpcGxlIGNsaWVudHMgYW5kIG11bHRpcGxlDQo+
IGRlYnVnZ2VycyBhbmQgc29tZXRpbWVzLCBlc3BlY2lhbGx5IHdpdGgga2VybmVsIGRlYnVncyBv
biwNCj4gc29tZSB0aHJlYWQgcmVhbGx5IGNhbiBzdGFydmUgbW9yZSB0aGFuIG9uZSBzZWNvbmQu
DQo+IA0KPiBBZGQgYSBjaGVjayB0aGF0IHdlIGRvbnQgc3RhcnQgdG8gYXNzZXJ0IG1pc3NpbmcN
Cj4gcmVzb3VyY2VzIGlmIHdlIGRpZG4ndCBnZXQgYW55Lg0KPiANCj4gQW5vdGhlciBvcHRpb24g
d291bGQgYmUgdG8ganVzdCBza2lwIHN0YXJ2ZWQgdGhyZWFkDQo+IGNoZWNrcyBhbmQgYXNzZXJ0
IHRoYXQgc29tZSBvZiB0aGUgdGhyZWFkcyBzdWNjZWVkZWQuDQo+IEJ1dCBsZXRzIHRyeSB0aGlz
IGFzIGEgc3RvcGdhcCBtZWFzdXJlIGJlZm9yZSBnaXZpbmcNCj4gdXAuDQo+IA0KPiBJbmNyZWFz
ZSB3b3JrZXIgdGltZSB1bnRpbCB3ZSBzZWUgYW4gZXZlbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+
ICB0ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMgfCAxNSArKysrKysrKysrKysrKy0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5jIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5j
DQo+IGluZGV4IGEyYjJmMzU5Ni4uYmY1NjA0NjJlIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRl
bC94ZV9ldWRlYnVnLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5jDQo+IEBAIC0x
MTA3LDExICsxMTA3LDI0IEBAIHN0YXRpYyB2b2lkICpkaXNjb3ZlcnlfcmFjZV90aHJlYWQodm9p
ZCAqZGF0YSkNCj4gIA0KPiAgCQlpZiAocmFuZG9tKCkgJSAyKSB7DQo+ICAJCQlzdHJ1Y3QgZHJt
X3hlX2V1ZGVidWdfZXZlbnQgKmUgPSBOVUxMOw0KPiArCQkJaW50IG1heF93b3JrZXJfd2FpdHMg
PSAzMDsNCj4gIAkJCWludCBpID0gLTE7DQo+ICANCj4gIAkJCXhlX2V1ZGVidWdfZGVidWdnZXJf
c3RhcnRfd29ya2VyKHMtPmRlYnVnZ2VyKTsNCj4gLQkJCXNsZWVwKDEpOw0KPiArDQo+ICsJCQkv
Kg0KPiArCQkJICogVGhyZWFkIGNhbiBzdGFydmUgZm9yIG1vcmUgdGhhbiBvbmUgc2Vjb25kLiBN
YWtlDQo+ICsJCQkgKiBzdXJlIHdlIGdldCBhdGxlYXN0IG9uZSBldmVudCBiZWZvcmUgc3RvcHBp
bmcuDQo+ICsJCQkgKi8NCj4gKwkJCWRvDQo+ICsJCQkJc2xlZXAoMSk7DQo+ICsJCQl3aGlsZSAo
IVJFQURfT05DRShzLT5kZWJ1Z2dlci0+ZXZlbnRfY291bnQpICYmDQo+ICsJCQkgICAgICAgLS1t
YXhfd29ya2VyX3dhaXRzKTsNCj4gKw0KPiArCQkJaWd0X2Fzc2VydChSRUFEX09OQ0Uocy0+ZGVi
dWdnZXItPmV2ZW50X2NvdW50KSk7DQo+ICsNCj4gIAkJCXhlX2V1ZGVidWdfZGVidWdnZXJfc3Rv
cF93b3JrZXIocy0+ZGVidWdnZXIsIDEpOw0KPiArDQoNClllcCwgc2xlZXAoMSkgaGFkIHNvbWUg
cmlzayB0byBiZSBub3QgZW5vdWdoLiBZb3VyIGFwcHJvYWNoIGlzIG1vcmUgZWxlZ2FudC4NClRo
YW5rcyBmb3IgdGhlIGZpeCENCiANClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRv
bWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+ICAJCQlpZ3RfZGVidWcoIlJlc291cmNlcyBk
aXNjb3ZlcmVkOiAlbHVcbiIsIHMtPmRlYnVnZ2VyLT5ldmVudF9jb3VudCk7DQo+ICANCj4gIAkJ
CXhlX2V1ZGVidWdfZm9yX2VhY2hfZXZlbnQoZSwgcy0+ZGVidWdnZXItPmxvZykgew0KDQo=

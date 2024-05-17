Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9BFC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 14:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC30E10EEEA;
	Fri, 17 May 2024 14:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSVfMpm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBCB10EEEA
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715955821; x=1747491821;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kFde99Kw8bFqoaSD7spEKdHiZTddmP8djPN8M3EEFZo=;
 b=dSVfMpm0MyoGLLrIG9tmq0W6VyUt97YOI4mf9RPXHNzDIxM1EzEj6+g+
 gR2CPpvXaHpkYtRY4F/IfOSKtoDjBUgEsRxt3t2oIhsmyplEg1PNpCzFV
 KoqtS+cJ8V4aaS8rXD/n2lS6RFGsZwEuHZ9RZnd7ruZ59hUktAXWZPW1C
 ZaaTX73Qn3YAGpWRgEfj0uG/fTuA7DMUKm/CQ6vYrwIlt5/CBoWl/OZ9/
 RmHJGOwKZ+VyPamuesDmVTNFBTUvASUzGPFMy7r352zJpYsgbQvgOvDSl
 6uuDz2GsDJR66Eq7zKrrJ5YFhY2C6IQ8jHhvcxoMoqsuDOcjBYZ9yD8ZT g==;
X-CSE-ConnectionGUID: vA+cGHp5R3O9wOm6zq9P3Q==
X-CSE-MsgGUID: HbIb+UQfQwmj1HUAXrDpqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12345162"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12345162"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 07:23:41 -0700
X-CSE-ConnectionGUID: VR1YvkJmRmmOnr5IyjPFRw==
X-CSE-MsgGUID: cbpF7MjhQxKN0Cz9LJmGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36327755"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 07:23:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 07:23:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 07:23:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 07:23:39 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 07:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+21MX/Zr23g9OZjYMspH4tcNogLD6KthT2jPdS6mMRksgmzu7pYtnzOHIVPW3UmpatVOayrbXb1/xfhB6h8kBy8hLeO4Ym1xTMXszgByL2SUkIG769X0/CXPvhfYpLDZhPdLQx+XbwKNb6x8K621vjIE6aDiFrdrPORe7Q5ns3G8nP8IyQD0dUqDXSzyu8R7h0KnX9OR84O3CHE3x0peY1E0cnUn+fYukQphKO+farM2eddkxiCp3APmWVta1uOvh7UIHyUKPocp/pj/Hgz+dBBooyEpyiAntv1cvk7VEzogtEVZ1Jq9vFbnkKw8S9L+1L3PM+TWTbPDALK6w2dQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFde99Kw8bFqoaSD7spEKdHiZTddmP8djPN8M3EEFZo=;
 b=TOSF7BWgWAA/GqVPDDQw0jx/0ZaYnlE7MaT9uv07cqtW0unLljslfaDWMplzxWtai47cvy3foIdvyWkz8v72qycM0R1xOMpaQUEHfxs7wIEHnkfkEf9DHB0KtOg5DVe/Pi2gX6tICzDo0PqbSXmkwewm8gQCExkb+BevUd18baTSZure56JTJ/AV90hDCcHIWny6QnTe4R4rhStUoMlZSqs/G+LNRImBp2FXX9TYe7ofDzzrSe5ZGKxUVfjNU1M3Je+0f9lGByEHi0lOFqKTMR9nCSWCQPq2kXR6Fr21a89RphcMp0/bCFCDLES+cK/4vUERdSCnlQn/dNslTok1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 14:23:37 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Fri, 17 May 2024
 14:23:37 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 02/10] tests/intel/xe_svm: basic xe-basic test
Thread-Topic: [PATCH i-g-t v3 02/10] tests/intel/xe_svm: basic xe-basic test
Thread-Index: AQHaqE/mtTYmTWIABEuHut60Aii3d7Gbet2A
Date: Fri, 17 May 2024 14:23:37 +0000
Message-ID: <SA1PR11MB6991D36936EC476EE0140DA592EE2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-3-krishnaiah.bommu@intel.com>
In-Reply-To: <20240517114658.810283-3-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|BL3PR11MB6483:EE_
x-ms-office365-filtering-correlation-id: 213e7036-0e86-4b0a-f258-08dc767cf100
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?RkpkY21XN2lWUHNXZGxHTUZMRUROcHZpT2pHODluQXhqeGhIVS9YeGMzd3ZZ?=
 =?utf-8?B?d1p0YUtXVEdNcWlSazNIbVg5L3M0MDgvLy80S2lvZVZNL3hkL0l2T244OWFo?=
 =?utf-8?B?NCs2VHQ4cElPQ2JaYUhjOWg1dU9hRlhZTTc1QTN4d2FmeThmNS9CWlMybHBx?=
 =?utf-8?B?TSt6MWN4RUt5OEQ2Szg2N2t3am5XdXNZTVJQZ2RLYWwyUGYyZytTRyttcmJp?=
 =?utf-8?B?eDU4QUk3cFVNcEhHUlpVZ2ZoRDc3QW1wNDlQTDlvZTNMNHFBZ3hrZ1hVOXVS?=
 =?utf-8?B?VzljK1JVSUFBbjFMN3lBVGp1bTVhdE9OQit6eWx1bUNEdlErbEVXVG9YSXlQ?=
 =?utf-8?B?N3VuaXhWOFpGV1JCazZCV2V1MG1pK3hmTEdleWIyVjl0eGdWMEJNNThmN0hv?=
 =?utf-8?B?dlU5WVVtYnZNWi8rZGNKVlpVK0F6V1lBRm1LL1RoQnlLK1VJajE3cHZoV1o4?=
 =?utf-8?B?Z2NKQUh0Z29zcmFwOW91Vjd6ZURvbWowWUp4QnV3NmdXZE1tTitTN2JGMVpn?=
 =?utf-8?B?TDcycVI5MWdMTWcwNWpOU1BPOHV4RHpQOGdHQzJGK2NmeEt0amRNcVM4Um5j?=
 =?utf-8?B?Z1A5ZnVsNWt6ZVpZeEh1YmZILytONDZqTGcyMnFtekFIb3lSb2FmYURzb3pz?=
 =?utf-8?B?NXZWaGVDQjZFWWl4MjR4clNWazBrSmNHVzN4cE16ZGlMMmxFY21wZjZ2Nm5t?=
 =?utf-8?B?MStpQlhQOTV3bE8zNSs0YjVvN0tsMzM4MVVpUEdHOWZ2UEpFWGNkM29YYUxi?=
 =?utf-8?B?MWNzeUtTaUlLd1dxdjd6d0tCZXJuZ3NLdjJMOWh1Q3QyTFZqSnVCb0l1a05W?=
 =?utf-8?B?NDBINXdVNFBoaXIwV09hbWNvWDkrWlhIRWJFVTArcTR2K21EQy9ZNUI1WGtl?=
 =?utf-8?B?SWRyOVV4bE1uTkUwTnp4cGRCeng5dkZLaTF5S3c5N0N3Y0QrcXRJeHZoeEdM?=
 =?utf-8?B?aS9DeCsvZUtNZGVHWDQ3WEI1enNwY3lKSVE5Q2tMN1ZVbFpZZTl0QXo3c09Q?=
 =?utf-8?B?SVRnN251dkVCaEp4dXBtZHQ0VlRicDNkejVOdDhIWGdZRHFNTEp0UllhcGJB?=
 =?utf-8?B?d2ZIU1RtN2hZUW5abkY1U1p4eWdieG1RNlpSUTcrTlRWUHMycW8va3RaK3Zt?=
 =?utf-8?B?ZW50M1kxU2xldUh4RmZtUTBHMXFueU5tM3piRjlqT3UvQ2hxN2UxcGZEUlZy?=
 =?utf-8?B?anlhaW54RWNkU1p6cUZuRnF5eC9pWWxWdkdvSlg0UVVQQlR6STlvTUdQN0Zj?=
 =?utf-8?B?bElIK3JCbjdFK0Z6SXdxYk5kSjZRQVNsR3EwUlZDNWkydkNjNmJDQzFORXdI?=
 =?utf-8?B?T2x4U0J0SXllSEJmMlJ3MDVnYVdzRjdnM0tJVE5DZ1o4TFhYVE5yaHFUU3JJ?=
 =?utf-8?B?eFUvZ0UrVll5VUpybDJENjFXa2k0ejhZQ3Fpci9vLzE4NFE2V21hSllSbkNF?=
 =?utf-8?B?cEFPcUNydmFnd29SYVh3NGgrZmE1cEg2VE9oL1NOY092MlVrRVJRNDdBOWhT?=
 =?utf-8?B?ZVh4UHBFbDZOd0JTcTdob1FNWGl4Mm5wbTMwaXQ0clVvUHJKMjNCQmJ4U2M4?=
 =?utf-8?B?VEtKSW9JbmdjRlhxVCsyYWZvSitQU0g2ckFOTG9LRGQvaUMrd2VWUVNIL09L?=
 =?utf-8?B?ZFlmOEJNM1RqYnVoMWMyVThCNThWcWtRSXFxemFCY0h1OHhtWlUraHU1S0Jy?=
 =?utf-8?B?MWVXRWpiQlFmdHZNZG12UXdEUlFhVytoNEF0M29UcWdNMGRTTUM3Mk0rbHZz?=
 =?utf-8?B?MXNiWVorQTZZYUVVMWd6ZGh0YTJydUt0Yi9iTXh0eFBIR2FwbXl6Z0dwZjlE?=
 =?utf-8?B?WllGa1RMZUo2ak41MU1Gdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXQwRlJvRHBRNHFOQ1VTVWQxSCsvYXBoRnJKdFFxOVNydUt1WGgrdHJXaDFI?=
 =?utf-8?B?Mldqa21ubzJBYXlCWDBhdlFvamVaUWowdXNFUUROU1JHVmVVRnk0TlJQLytZ?=
 =?utf-8?B?VVpNbmtpSnVQMUthc1FwbW1RclNNOC92UFkwUmthMXdnbWI1RmpkYS9LcG5i?=
 =?utf-8?B?U0tYVmxZZy94ZmU0dFhIc1JDTWFDNG1uWkxvSTF1V1R2ck45QTBiQmlhNkxX?=
 =?utf-8?B?OFJnYmxBZzNVaDRNU0pZWmxybnB5dFdFWjdzN09wWkJ6ck95MldVaGpiV3pi?=
 =?utf-8?B?V0dRSHpzemgvbVFQS2RnSHk4aXUybGpGYUc5dlBTUWNyWnc0Zlc5OWplajVM?=
 =?utf-8?B?WlMxTW5SUzRENU1abDJIbm9Ea1N4NXprYmFMb01LQXVUak9XNkdqUU0vbmwy?=
 =?utf-8?B?UkV4UmlzZFZCRFQ3VTZpd0swNi9PdVozR3VwZnNNdGU0T3VNbFlkMzZjN2ZQ?=
 =?utf-8?B?VTRtRWY3M2JmV3UreFlPTzJmV0FKV28yQVZFcktOTWNsc21FWno0VGR2bmEr?=
 =?utf-8?B?QTZidkl0ZVdVNEZKMnJLbXBEUHpNQXF0aG1yQkJvTm95N2k4MVZoOElUb1hs?=
 =?utf-8?B?U1hqTU5KTlA5Tm5QVi9GT2MzeGNOSGVDTGJpN3d2ZEFoSHR1dW50L2I4b3NH?=
 =?utf-8?B?dURGZmlRdWVJYmxaei9RWWFVa0d1aTM5WWVURFFkaWhkcHhsWTFnbUIwYS9S?=
 =?utf-8?B?Z3dDTWloUHkzWHNlWlNycVB4RTRoU0dFWDUxempac2ZJS2NXa0tWTnNyZG5W?=
 =?utf-8?B?Tmc1YUJhak1WVHRpMEovbFJMUjFJU0pTQmRubjZNRCtSbUJKd2dUREhJVVlK?=
 =?utf-8?B?ZHo2Ym5zampMUjlsUkVFZ1QzK01qMnk0MnltTGtiT3dtS0hYckh1TFVaa002?=
 =?utf-8?B?N0ZnaERLaUxWMW45aVlZdkNkdFNqUWlzbHFuVVJkcmo4bVRsUkQ2ZFRHMm1z?=
 =?utf-8?B?RjE4SmZCR3ZrZzlJVTBSNEY2NGZzdldyNCtVOUtHZzNSQjgxMEJxd2NHS2FI?=
 =?utf-8?B?SmhsRDRWM0JqNDZsaTNxYWxsajlucnc4ZTRIWldmNDZYNHZTMjA4K0xDQmZT?=
 =?utf-8?B?WGM3Vzl5S21KejJneTR6RWJObk94bkc5NjIzWnVhOEdpekE1SkxxUVNraHNV?=
 =?utf-8?B?MmM4aFRRZUExR2ZyYURvTjdsY1hvbldnaFIxd2dWak0zM2xSTVlOMGNGcjFP?=
 =?utf-8?B?alQ3K2k2MmZielJWYXlhejBJS2ZKN1R0YUJvWk50UUtlZFk1QjZKTmorR2Ns?=
 =?utf-8?B?eUJBWkdaUzBFUlZjejJuVFZraStnSnJZdGFYQlpTSHV2K3ozQS9FSkkzb2c1?=
 =?utf-8?B?OWYyVzFveWF4OHJjdnI3eVJ2VGhFVVAzbFhnVFEwbm9iT2Fqdk1BeEJWNFVR?=
 =?utf-8?B?S2hwY2xNd1gySjcwakNQelo1dzdlMlZyZkNYZERIaDk4Qk9HZVAyNk1qOUNN?=
 =?utf-8?B?TzRBb25zdVBtOGtUNkF5anU5VE9ZUnozaHhTQXJSNVJma1ZpNG11R0syeXdW?=
 =?utf-8?B?Ylp6ZlhGajFqand1eTZOeDQyK05iRklHNFJUSlBIWGx1TWJDYmVCanFoeTkr?=
 =?utf-8?B?Tk8rZE54em1ZNno2Tk9HQjFBdy9IZkJoYzB5ZUlNVXdEanpUQktQSDUybGVO?=
 =?utf-8?B?S05Cek10VEpOZi9pWjJIUCtNNmk0QUd3bGpXazlsb0V6a21zcGlkejYvK2hn?=
 =?utf-8?B?MXpvVUI1VEowSmJJNGNWSVhuYjFaMTIvOUxHdFI3RUV3YjBDOFNJT0FiWTFh?=
 =?utf-8?B?dzRSMXJHTFpKc2h5eTA1OEhreDBXalYrcG1YTG83R2lCUU5OdThCUnFpRVZD?=
 =?utf-8?B?dHhtNFBXMHNzM2RXRVdqdHloeDNxL1NBKzRack85VFVINDErMkw3MEcrd2hR?=
 =?utf-8?B?WE9LNGgzdGVBeDNyc2hheGw0Y1BmUW9IT1Q5b2szbGpWU3BJWnpJTVU0ZlRT?=
 =?utf-8?B?UHZIalB6MmFRZnBmQ1hQT21RV0VhUGRQL3JjMnIrODhmM2t4VWh2RjFWZWI2?=
 =?utf-8?B?M1lYbFlXZXA1VFNBUzN5NUI1b0ZXVHc0YnJub0FRN3FtVVpMZEgwNzJsbWNi?=
 =?utf-8?B?bHdZM0V2QyswMXkxWk5kZGxWSm1jbzVBdEQ4R1FPVEtBTkx1SlNPWVh0Y0hu?=
 =?utf-8?Q?5NG/IEAW0xTOopL0zJVFWKihf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213e7036-0e86-4b0a-f258-08dc767cf100
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 14:23:37.1085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlqEabwqtLTmeVZMRfUkaariebEIv1QSSb7oBtKspFgGiVF79R+XkHIWx/tWVKJyqTThkksqk01cN3lNQP/AiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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

UmV2aWV3ZWQtYnk6IE9hayBaZW5nIDxvYWsuemVuZ0BpbnRlbC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9tbXUsIEtyaXNobmFpYWggPGtyaXNobmFpYWgu
Ym9tbXVAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE1heSAxNywgMjAyNCA3OjQ3IEFNDQo+
IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQm9tbXUsIEtyaXNobmFp
YWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPjsgWmVuZywgT2FrDQo+IDxvYWsuemVuZ0Bp
bnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWly
YXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjMgMDIvMTBdIHRlc3RzL2lu
dGVsL3hlX3N2bTogYmFzaWMgeGUtYmFzaWMgdGVzdA0KPiANCj4gQWRkIGJhc2ljIHRlc3QgdG8g
dmFsaWRhdGUgaGVscGVyIGZ1bmN0aW9ucyBpbnRyb2R1Y2VkIGluDQo+ICdsaWIveGUveGVfdXRp
bDogaGVscGVyIGZ1bmN0aW9uJy4gVGhpcyB0ZXN0IHdyaXRlcyB2YWx1ZXMNCj4gdG8gdGhlIGRl
c3RpbmF0aW9uIGJ1ZmZlciB1c2luZyBHUFUgKE1JX1NUT1JFX0RXT1JEX0lNTV9HRU40KS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEJvbW11IEtyaXNobmFpYWggPGtyaXNobmFpYWguYm9tbXVAaW50
ZWwuY29tPg0KPiBDYzogT2FrIFplbmcgPG9hay56ZW5nQGludGVsLmNvbT4NCj4gQ2M6IEhpbWFs
IFByYXNhZCBHaGltaXJheSA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gLS0t
DQo+ICB0ZXN0cy9pbnRlbC94ZV9zdm0uYyB8IDk5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ICB0ZXN0cy9tZXNvbi5idWlsZCAgICB8ICAxICsNCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTAwIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
ZXN0cy9pbnRlbC94ZV9zdm0uYw0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3N2
bS5jIGIvdGVzdHMvaW50ZWwveGVfc3ZtLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAwLi42MzAyYWY5NWINCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi90ZXN0cy9p
bnRlbC94ZV9zdm0uYw0KPiBAQCAtMCwwICsxLDk5IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogTUlUDQo+ICsgLyoNCj4gKyAgKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jw
b3JhdGlvbg0KPiArICAqLw0KPiArDQo+ICsvKiogQGZpbGUgeGVfc3ZtLmMNCj4gKyAqDQo+ICsg
KiBUZXN0IHNoYXJlZCB2aXJ0dWFsIG1lbW9yeS4NCj4gKyAqDQo+ICsgKiBTaGFyZWQgdmlydHVh
bCBtZW1vcnkgKFNWTSkgaXMgYSB4ZSBkcml2ZXIgZmVhdHVyZQ0KPiArICogd2hpY2ggcHJvdmlk
ZSBzaGFyZWQgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGIvdCBDUFUgYW5kIEdQVQ0KPiArICogcHJv
Z3JhbS4gVGhpcyBtZWFucyBhcHBsaWNhdGlvbiB3cml0ZXIgY2FuIGp1c3QgbWFsbG9jIG9yIG1t
YXAsDQo+ICsgKiBhbmQgdXNlIHRoZSByZXR1cm5lZCBwdHIgZm9yIGJvdGggQ1BVIGFuZCBHUFUg
cHJvZ3JhbS4NCj4gKyAqLw0KPiArDQo+ICsvKioNCj4gKyAqIFRFU1Q6IHhlLXN2bQ0KPiArICog
RGVzY3JpcHRpb246IFRlc3Qgc2hhcmVkIHZpcnR1YWwgbWVtb3J5DQo+ICsgKiBTdWItY2F0ZWdv
cnk6IE1lbW9yeSBtYW5hZ2VtZW50DQo+ICsgKiBGdW5jdGlvbmFsaXR5OiBzdm0NCj4gKyAqDQo+
ICsgKiBTVUJURVNUOiB4ZS1iYXNpYw0KPiArICogRGVzY3JpcHRpb246IEJhc2ljIHRlc3QgdG8g
dmVyaWZ5IHN0b3JlIGR3b3JkIGZ1bmN0aW9uYWxpdHkgdXNpbmcgaGVscGVyDQo+IGZ1bmN0aW9u
cw0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxmY250bC5oPg0KPiArI2luY2x1ZGUgPHN0cmlu
Zy5oPg0KPiArDQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAibGliL2lndF9zeW5j
b2JqLmgiDQo+ICsjaW5jbHVkZSAibGliL2ludGVsX3JlZy5oIg0KPiArI2luY2x1ZGUgImxpYi94
ZS94ZV91dGlsLmgiDQo+ICsjaW5jbHVkZSAieGVfZHJtLmgiDQo+ICsNCj4gKyNpbmNsdWRlICJ4
ZS94ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ICsNCj4gKy8qKg0K
PiArICogIEBicmllZiBWZXJpZmllcyBiYXNpYyB3b3JrbG9hZCBleGVjdXRpb24gb24gdGhlIEdQ
VS4NCj4gKyAqDQo+ICsgKiBUaGlzIGZ1bmN0aW9uIHRlc3RzIHdyaXRpbmcgYSB2YWx1ZSB0byBh
IEdQVSBidWZmZXIgdXNpbmcgdGhlIGhlbHBlciBmdW5jdGlvbnMNCj4gKyAqIGZvciBjb21tYW5k
IHN1Ym1pc3Npb24gYW5kIGJ1ZmZlciBtYW5hZ2VtZW50Lg0KPiArICovDQo+ICtzdGF0aWMgdm9p
ZCB4ZV9iYXNpYyhpbnQgZmQsIHVpbnQzMl90IHZtLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFz
c19pbnN0YW5jZQ0KPiAqZWNpKQ0KPiArew0KPiArCXVpbnQ2NF90IGdwdV92YSA9IDB4MWEwMDAw
Ow0KPiArCXVpbnQzMl90IHZhbCA9IDB4YzBmZmVlOw0KPiArCXNpemVfdCBib19zaXplID0geGVf
YmJfc2l6ZShmZCwgUEFHRV9BTElHTl9VRkVOQ0UpOw0KPiArDQo+ICsJc3RydWN0IHhlX2J1ZmZl
ciBkc3RfYnVmID0gew0KPiArCQkuZmQgPSBmZCwNCj4gKwkJLmdwdV9hZGRyID0gKHZvaWQgKiko
dWludHB0cl90KWdwdV92YSwNCj4gKwkJLnZtID0gdm0sDQo+ICsJCS5zaXplID0gYm9fc2l6ZSwN
Cj4gKwkJLnBsYWNlbWVudCA9IHZyYW1faWZfcG9zc2libGUoZmQsIGVjaS0+Z3RfaWQpLA0KPiAr
CQkuZmxhZyA9IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNLA0KPiAr
CX07DQo+ICsNCj4gKwlzdHJ1Y3QgeGVfYnVmZmVyIGNtZF9idWYgPSB7DQo+ICsJCS5mZCA9IGZk
LA0KPiArCQkuZ3B1X2FkZHIgPSAodm9pZCAqKSh1aW50cHRyX3QpZ3B1X3ZhICsgYm9fc2l6ZSwN
Cj4gKwkJLnZtID0gdm0sDQo+ICsJCS5zaXplID0gYm9fc2l6ZSwNCj4gKwkJLnBsYWNlbWVudCA9
IHZyYW1faWZfcG9zc2libGUoZmQsIGVjaS0+Z3RfaWQpLA0KPiArCQkuZmxhZyA9IERSTV9YRV9H
RU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNLA0KPiArCX07DQo+ICsNCj4gKwl4ZV9j
cmVhdGVfYnVmZmVyKCZkc3RfYnVmKTsNCj4gKwl4ZV9jcmVhdGVfY21kYnVmKCZjbWRfYnVmLCBp
bnNlcnRfc3RvcmUsICh1aW50NjRfdClkc3RfYnVmLmdwdV9hZGRyLA0KPiB2YWwsIGVjaSk7DQo+
ICsJeGVfc3VibWl0X2NtZCgmY21kX2J1Zik7DQo+ICsNCj4gKwlpZ3RfYXNzZXJ0X2VxKCoodWlu
dDMyX3QgKilkc3RfYnVmLmNwdV9hZGRyLCB2YWwpOw0KPiArDQo+ICsJeGVfZGVzdHJveV9jbWRi
dWYoJmNtZF9idWYpOw0KPiArCXhlX2Rlc3Ryb3lfYnVmZmVyKCZkc3RfYnVmKTsNCj4gK30NCj4g
Kw0KPiAraWd0X21haW4NCj4gK3sNCj4gKwlpbnQgZmQ7DQo+ICsJdWludDMyX3Qgdm07DQo+ICsJ
c3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZTsNCj4gKw0KPiArCWlndF9m
aXh0dXJlIHsNCj4gKwkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gKwkJaWd0
X3JlcXVpcmUoeGVfc3VwcG9ydHNfZmF1bHRzKGZkKSk7DQo+ICsJCXZtID0geGVfdm1fY3JlYXRl
KGZkLCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERQ0KPiB8IERSTV9YRV9WTV9DUkVBVEVf
RkxBR19GQVVMVF9NT0RFLCAwKTsNCj4gKwl9DQo+ICsNCj4gKwlpZ3Rfc3VidGVzdF9mKCJ4ZS1i
YXNpYyIpDQo+ICsJCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKQ0KPiArCQkJeGVfYmFzaWMo
ZmQsIHZtLCBod2UpOw0KPiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQl4ZV92bV9kZXN0cm95
KGZkLCB2bSk7DQo+ICsJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiArCX0NCj4gK30NCj4gKw0K
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQgYi90ZXN0cy9tZXNvbi5idWlsZA0KPiBp
bmRleCA3NThhZTA5MGMuLmJlNzkyYTRmZCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvbWVzb24uYnVp
bGQNCj4gKysrIGIvdGVzdHMvbWVzb24uYnVpbGQNCj4gQEAgLTMxNCw2ICszMTQsNyBAQCBpbnRl
bF94ZV9wcm9ncyA9IFsNCj4gIAkneGVfdm0nLA0KPiAgCSd4ZV93YWl0ZmVuY2UnLA0KPiAgCSd4
ZV9zcGluX2JhdGNoJywNCj4gKwkneGVfc3ZtJywNCj4gIAkneGVfc3lzZnNfZGVmYXVsdHMnLA0K
PiAgCSd4ZV9zeXNmc19zY2hlZHVsZXInLA0KPiAgXQ0KPiAtLQ0KPiAyLjI1LjENCg0K

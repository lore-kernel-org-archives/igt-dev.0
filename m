Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE01E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 10:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9AB10EF93;
	Fri, 13 Dec 2024 10:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtOUgZ6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B1610EF93
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734084974; x=1765620974;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EFcPmZlqp44gz1YwCrLtIHc+L8n0h34aaz/9FGYP3Yw=;
 b=jtOUgZ6+JHZVEodcKOFjz+36r+F91sJhkfokTogh9nnQRtdR6cwLdBBc
 Y2bLBTGAz0E5CBOxvo/FgHiHJCf5mo9Z2izRt05eJRT0tCrsWEnROncqt
 T2lpl8/l7XYk5JA2AbKZeswH/mtsFwgfd0vvyqGft36nnlze+hPDzQJ+8
 QfxUTRvuRjAsOYcGI62beTShaSQyDDYy6olZdhY3CKx5qi4OYDin45TAW
 SvHLEVGbvTNh9kSfH9j1ahpuyWXLLO/prZ2abN3PbBGfNBY85P1sAoukG
 J8twq/f7xuWfS8c/u3u+SHqWWFrlmlVyVj5j9Xm05J/cE2bu2VUqq6FsT w==;
X-CSE-ConnectionGUID: pJ8yzZDxQhWtvpBazJ4w7g==
X-CSE-MsgGUID: c4jneRmTS06wbWqkMM1YXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34263968"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34263968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 02:16:14 -0800
X-CSE-ConnectionGUID: KaNplBJmTg+uixTIWs5kcQ==
X-CSE-MsgGUID: tC0079w4RTWdQtSKtaX9Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="96571800"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 02:16:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 02:16:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 02:16:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 02:16:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOuZSFKb2PaqORpbpUeXcuczVX9+mKBb8rKb4mDk/Mzk+jOpWXGuwY9kcH6Jllri28hNIn8Ytv1LqeoIpQQxsj6Dy1hF6zt0JPZeSulfnWSkh9xdhnS7tWhraf4VrPf4Te+2sgWbzHEOYh+KJAJMCGa5i48aGiAa9Wj7QdkHV52PvVvcVee7DNx27w2+nKIfC+f9w6opLNawAYWOa/m0jjkUjeUkSC0CzODY5E8OijPrubNHFzuvBTtksN2jn7UcZSCPdrAlMsoBIVONqsJ3cV4BVJujfN6I4dMwUDzkaT0pE9gVjGuYj5FbRZ0IpsTIXm8fq634BEw/P3k1QwM9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFcPmZlqp44gz1YwCrLtIHc+L8n0h34aaz/9FGYP3Yw=;
 b=SqtyejiCYD2zO5DVgWmaPyDkdgaXuEf4VtpgeqmwaysTmdZSUDOQSxq0c59uyfduiOpVpjJ09Vqw2iP+7/R0lcoRFp80JAr3AK/EyEdG4onbQOt6kLzQ4udYVBLtsiYlv/Q8pbbtnii8uAAGFtjQD983pHGviIeJZZBhRtnOA7iXfxWKEbFBsv0P/KVf907nZ3n42ZGc9rOmdqdkyxO4xUi6HSXPjyBHgrkqaw9UL5ZYC933igDV+Kse+HeTqw1rdsfqsE1MOHMJWYLjiUVHeo7enjOFBTHAGSJtlKJzO6P/5uzkk69WbyEKepXcolmCwmliUMSITDmZAQDPrqaImw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB8276.namprd11.prod.outlook.com (2603:10b6:510:1af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 10:15:58 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 10:15:58 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
Thread-Topic: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
Thread-Index: AQHbTTUBqikDxFd2hk+pBvxQBzBY57Lj4wuAgAARqwA=
Date: Fri, 13 Dec 2024 10:15:57 +0000
Message-ID: <BL1PR11MB552576BF04DC09D2D4B821E884382@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20241213075724.641859-1-pravalika.gurram@intel.com>
 <IA1PR11MB6097E036E990499AE43E997386382@IA1PR11MB6097.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6097E036E990499AE43E997386382@IA1PR11MB6097.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB8276:EE_
x-ms-office365-filtering-correlation-id: ff00220d-fba9-4138-03e5-08dd1b5f230c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TXlPbGxXRC9uSVIwaURXc0p2T1V0Z3h5OUdwZ2k0YkZEMnJZU0FkRXQ3dTFN?=
 =?utf-8?B?RzF4M2s3Vkk4RElUaDFzZDB6cG5rZGpTZmx6eURnTHc1Y0JTOG9Lb1NpWUF0?=
 =?utf-8?B?TU1Kei9sd29iL0F6L1BsUVhxRW9mTmRUNWliLyt5RVczNEYwNERSMm9xbnJs?=
 =?utf-8?B?M0dUL0UrRXkxdUNZNkRtMjBrS3psQmZCckRHM0Q1ekJHZWwxdDVGTkF2NDVi?=
 =?utf-8?B?YTB6Qk5EbnNNdHcrTXFBWklSRVJlVlJDaDRyZGtKN21SQkpTa3RpaXZ1Mi80?=
 =?utf-8?B?N0dVOGpITTZRZVBpNnJhNFJ1QkJuOWIrdTByYnprWnRoU0lUQkFBN2ZsMmRq?=
 =?utf-8?B?M08yRHI4cWNucmtMcFV4Y01XSW9jK25aSFd5TlBiSHk4VlBmN3k1K25HRzRC?=
 =?utf-8?B?U0k1TFRKaVN3cU94UTFmM3crVHc2Y1g5bzRsL084dlREbmplOHo5R285Q09H?=
 =?utf-8?B?QjFKZlpUNUFBZWRZbnM0Tk5CUVR0Ni9hd0Z6akp5cy93OVQvRExuVWlWR1dl?=
 =?utf-8?B?eENXblU1dzJnWmxDWHlNYVlOa0YreFlsWFg5OWxNRTYrMzUrMk9EM3ZiSUF5?=
 =?utf-8?B?S1ZHM3ZlOGY5RjVaTVN1QXBzZk5UWlFDRTJUK1lLOWJ0dWJiSmZqRC8vdU5C?=
 =?utf-8?B?eDI2NkYvRE1qWml2cC9OaStJUWxmUE41NTFtS2ZDakllZlBoeFFUcTBEY2tI?=
 =?utf-8?B?ZjBrN3hwbS9lMXJFSlJYNlNHZkNEQXZWampSMER1RnBVa0dMNTd0aGtDNHpQ?=
 =?utf-8?B?MmJuNlVQUEpSdytzWEswSkpoYm5GdzVPOGhPVStvcXhTbDJZbVhPSy81QTFx?=
 =?utf-8?B?bjBiR0dWQ3BvUkFPc01CSFlzd09mdXVnQW1lUEttempXbzc1QXhlOVNQVWU0?=
 =?utf-8?B?anZEZ2JmRjV0eEFJeEZsdkJKOHY1ckxTZkc3SjA2WjUrb2xXY3puNEZnN2JD?=
 =?utf-8?B?VWpZM1pvWUtnMVFtOHlOWVROditEODIvTExQYStXdzIwd21EcjczL1ltbkxF?=
 =?utf-8?B?emNCVldkT2RDTlM2K3p4ejVncUtnM3dNbnl0TXl0Wlk1eUQ0YkVoaUpGZkx5?=
 =?utf-8?B?S3ZmaTVtcGVOeHd1amd0MTByMGpBZy9nLzBDWnJaQm5td0VXZVNJRXZFM2Fv?=
 =?utf-8?B?L0UzRVAydjdEUE0xUGVwbkl1eFhHaytTa21RWVlWTUtLUGZTSEhUajRGemRT?=
 =?utf-8?B?Mld6L3Q0NkUzM3c0eXR1TW9vaFR1Um1QbktkaTZSTldyemVlVG9FbXVRVjNF?=
 =?utf-8?B?RjcrbGFEK3dRVHREbHNQVHVObUJEVS9yOWxEYldDU2d1ME4vc3dlV0dnYnR2?=
 =?utf-8?B?S1RoWXJhdzdGcVpqdEFDbUZ1K2JsQ1VscmlwZklaUjhZRUtPcFhLeWpjZTh6?=
 =?utf-8?B?czlNTTB0NUhwS3RERjN2K0RjbktFZ2ZzNWgreEFCNE9EKzBVVitlSEZkeEVn?=
 =?utf-8?B?Zlp5NEdUblBhbElZbC9hcFpkZmVHWE02dkVyNXZKTkRvOXB6bGprdnlzNEpr?=
 =?utf-8?B?eU1iUDFWRklRejAxVGJpSllJRG9FTndEdll2VURVanVxcjQyOE9sZjh4RmlG?=
 =?utf-8?B?d2Z6aE1CUEZ1c3ZPZDFJNWRDK2ZIR3VQeGlmQXFBVHBkbUFidmhqZFE5Unhz?=
 =?utf-8?B?VFE1K3F4bjJxN0EvMW51SHlqV215MjF6WXhlVEJ6N1pmQnhrRVNNd2psMnJs?=
 =?utf-8?B?WHJJOXdoNHJnUG1HUEZyZERFRmN1WThxZ25MZ2ZCRE9vdWhHVDBZTTc5NXdI?=
 =?utf-8?B?WVRJVjkxV3pReWRZcWlZcDUyaUdQN1NnTHVlQWh5MUNwRTlpRU03Z2RDV1pW?=
 =?utf-8?B?UGNiZCtrUUVZRHd3alZVQWZMeHIrN3BEbUlVOU1yMTRHQms1cm1heDFtdmtm?=
 =?utf-8?B?K09heWkzbEt1MG4yVExLU01jREhrOEcwMGtkNldHT21UcFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1IxeGVFWDYyNFlhQ2pHS211dTNmL2dDNzJLUHFlVG1mdXk4OG9jdVJhSyt3?=
 =?utf-8?B?cE1WMldoNmZLMGd5SjlCMldBVlhycXZwcTVzY3p1S2dXYnc0SmlCeW4xQnVJ?=
 =?utf-8?B?enhpTzBQSW9FY1FkNGt5aUJqOXBlV3pIV2FDOHA0OWhVQ1FOS2xvSDBoc0VG?=
 =?utf-8?B?b2gyRDhMQi9mZ1RkNW1UVWk3NnZpQW5pMkI2a2JlbzhTcjZBdHNKNVFJVVVl?=
 =?utf-8?B?S2o1SjJkM1dNZDM0RUxHSkNaR1kzdTZpeG9CWVU1MnIvZk1ZdENvQTB0OWY0?=
 =?utf-8?B?NFd3V1dYRnNEN2hWTzlGbFF6NXlWL2ZUS2VvL2pzMlV0b0RLWXo5Mzd3VE5F?=
 =?utf-8?B?bFpnQkpZKzY0WTZiZnZJSVV4ZElVaW5tek9qd0ZSS3RjSzk0ZzJKaDgrU3M4?=
 =?utf-8?B?T0tUWUJyaUQyUTE0UHZsRnNZQTZvOURLeEg2OVErVmRxcTFLYjdtcTZGZkdB?=
 =?utf-8?B?RFlGazVzZ1FtRGY0SnlGWDZITUVXeWRRZFd3Z1NkTGtldldZVEpDUWUxTGpP?=
 =?utf-8?B?c2VOY0FyRHRGdE5BM0tsQTl0a3ZoOG9wRlN3V2VtZUhybnBqOTczd1czNG5t?=
 =?utf-8?B?RlpVSTNpKzdscmsvMmwvdjBiNks2Q0lSblpyTDBka0ZsM3d4c25lWGJyWG1y?=
 =?utf-8?B?eTAwZlVXeTZOd0l2MjJkL2t5UFlrTmREb0p0dlova01LNXNRVnNvMUpuWjBl?=
 =?utf-8?B?MXA4b1pzbHBva1hvSHRhWnk3eVliM3UvRG5MYjBZclZnWForYTNsZG0wUUJJ?=
 =?utf-8?B?MTRBOTVOSmZHUXhRa2FLeWRTWVFBVGhsS0FGTkpURDNsUjNlcThjTmx2aHl5?=
 =?utf-8?B?N1k4b0NJU0FQRk5vK1hyRWI1bFpCTXdzdThvQ3E1RXpzeFM5cDJaUVltWGdN?=
 =?utf-8?B?WWVpdi9wQ29rT08wa3lLZXF0UW5SNlFnMmVkdk14YXF2a3JNTVl6YTYweExG?=
 =?utf-8?B?d0ZKVEdQdGFFUEhBYjMrZElrNTg3YVNqL1Q1cEtML1B6UnljUGtMeWRsUUlE?=
 =?utf-8?B?ZGZPL2hDMjhCdEVNa3UvMVRRT0Q0dmhCRVA4S3p2N1UrcU5pZTg2RWFPK0JH?=
 =?utf-8?B?bTV5RzRuUFRSVlJrT1VvNnJOZ1krSi9lcDVER2EyblhwUTQ0TDdkcmFCV2Iw?=
 =?utf-8?B?R2xIaDE3ck1kMEVHdnZNZ09HYVg4RE9TNGtXSFUvVHk4c2s3VVFRMnNFWHJx?=
 =?utf-8?B?ZGNFYlBHYnRVaHFEUGFYSHZwQ09XbkR3N1haeVdhaGVKQkJLMi9wTy92K3E3?=
 =?utf-8?B?YnhIVUJocWFpd0J5VHFERklncExyVlErUmVUZmVYTWhiQWFEbDJmS2MwKyt1?=
 =?utf-8?B?ZHA3dnM3QWVaY2QycldZOURhTGc1bWdHOXFDTm1kVFZaM3dBTVg3YU5rK1ds?=
 =?utf-8?B?R29LNCtzQmRmejdZVFEwWDVGWWJFZURRSm1UQ1ZUTjhuekpNT0dPVjdlK0Jh?=
 =?utf-8?B?SFlKTHp3a1VEK1hlbGY5b2xGT1FqZFVBNTdsWFdXUmdkTkpJcGpTWURidFVD?=
 =?utf-8?B?cW5xallmMTgvZFFyUFZQdnFqcmgwV3RKUkU0RW83NUlDcjhpbGZtWkREbzlj?=
 =?utf-8?B?Z2VLNWg5QWZTeVhTVEYrcCszZ0VYZzZzR1YyRHJhdzBYLzA1Wi8yell3V0tC?=
 =?utf-8?B?NWg4WWl2b1hsYXRudkZCTEFoamdIOFZJZ2wwUVdmYjRlOVJXbGVwNEc3WWhJ?=
 =?utf-8?B?ZE85dVByK0FuRHFQTFp0cCt2S0tNbWR5eUVhZW1Kd1RDUnd3azB1NS8xY2pl?=
 =?utf-8?B?ZE84R2s5UHp0Vm1sM0tZdUI4MVRGdVFOUVZuY2tGUGQ2WUxvbUJ6RFhNV3cr?=
 =?utf-8?B?WDNBdTR0ZGljSUdlYTdLNmtwK2d3UktFaW1hV21STHBkVlZXMEF6d21KcUQr?=
 =?utf-8?B?MzR1dGUvTlMxWVlEVkVLKzFOVktNZ1NnTEUzM2lHc3ZEQUhuK0FWSGlXajY5?=
 =?utf-8?B?cjBSWDk0MldiNWFsTGduVzZQb1p5R2xvZ0RNNmxSODdRYUhIVnhaMDUvUU1R?=
 =?utf-8?B?L3J3TDA3a2tWdDVvK3RpRjUyejZmSmEvcVlZYWxxV1BnRFBUZktGRERHMktD?=
 =?utf-8?B?N3ZXZHdTTHhCUlFkUjMzYVNYYUpGNFU0aTc2b3gxODU1TEFOSmI2QUF2L2Vw?=
 =?utf-8?B?SDNuODBPbDNLMHBZMkxsV2JNQnhlT084MEJpRTBqR2czc2gyc0RiaHFTTzAx?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff00220d-fba9-4138-03e5-08dd1b5f230c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 10:15:58.0160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2RkSdAwtQDlZPs/xvVOs19fUdqxtbgrwU//X1An4a/axiUUmX/MselUFKaAdc0vIrheZu/0s5WCaEIU8TXB60Z8xqJ8CsPNpMyy/kiCFYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8276
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllY2llbHNrYSwgS2F0
YXJ6eW5hIDxrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RGVjZW1iZXIgMTMsIDIwMjQgMjo0MCBQTQ0KPiBUbzogR3VycmFtLCBQcmF2YWxpa2EgPHByYXZh
bGlrYS5ndXJyYW1AaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBHdXJyYW0sIFByYXZhbGlrYSA8cHJhdmFsaWthLmd1cnJhbUBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIHRlc3RzL2ludGVsL3hlX3ZtX2NyZWF0ZTogQ2hlY2sgbmVn
YXRpdmUgY2FzZXMgZm9yDQo+IHZtX2NyZWF0ZSBpb2N0bA0KPiANCj4gTmVnYXRpdmUgdGVzdCB0
byBjaGVjayB2bV9jcmVhdGUgaW9jdGwgcmV0dXJucyBleHBlY3RlZCBlcnJvciB3aGVuIGludmFs
aWQNCj4gZmxhZ3MsIGV4dGVuc2lvbnMsIHJlc2VydmVkICBwYXJhbSBpcyB1c2VkLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUHJhdmFsaWthIEd1cnJhbSA8cHJhdmFsaWthLmd1cnJhbUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfdm1fY3JlYXRlLmMgfCAxMDQgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgdGVzdHMvbWVzb24uYnVpbGQgICAgICAg
ICAgfCAgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKQ0KPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX3ZtX2NyZWF0ZS5jDQo+IA0KPiAoS2FzaWEp
IFdlIGhhdmUgYmluYXJ5IHRlc3RzL2ludGVsL3hlX3ZtLmMgLSBpbiBteSBvcGluaW9uIHRoaXMg
bmV3IHRlc3Qgc2hvdWxkDQo+IGdvIHRoZXJlIGluc3RlYWQgb2YgY3JlYXRpbmcgbmV3IGJpbmFy
eS4NCj4gDQp4ZV92bS5jIGlzIHVzaW5nIHRvIHZhbGlkYXRlIHRoZSAiRFJNX0lPQ1RMX1hFX1ZN
X0JJTkQiIGlvY3RsDQpiZWxvdyBzdWJ0ZXN0IHdoaWNoIGRvaW5nIG5lZ2F0aXZlIHRlc3QgaXMg
dXNpbmcgVk1fQklORA0KaGVuY2UgSSBoYXZlIGNyZWF0ZWQgbmV3IGZpbGUgYmluZF9mbGFnX2lu
dmFsaWQoZmQpOw0KDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV92bV9jcmVhdGUuYyBi
L3Rlc3RzL2ludGVsL3hlX3ZtX2NyZWF0ZS5jIG5ldyBmaWxlDQo+IG1vZGUgMTAwNjQ0IGluZGV4
IDAwMDAwMDAwMC4uMjQzMGU2NzM5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdGVzdHMvaW50
ZWwveGVfdm1fY3JlYXRlLmMNCj4gQEAgLTAsMCArMSwxMDQgQEANCj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBNSVQNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBD
b3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlICJpZ3QuaCINCj4gKyNpbmNsdWRl
ICJ4ZV9kcm0uaCINCj4gKw0KPiArLyoqDQo+ICsgKiBURVNUOiBOZWdhdGl2ZSB0ZXN0IGZvciB2
bSBjcmVhdGUgaW9jdGwNCj4gKyAqIENhdGVnb3J5OiBDb3JlDQo+ICsgKiBNZWdhIGZlYXR1cmU6
IEdlbmVyYWwgQ29yZSBmZWF0dXJlcw0KPiArICogU3ViLWNhdGVnb3J5OiBTeW5jaHJvbml6YXRp
b24NCj4gKyAqIEZ1bmN0aW9uYWxpdHk6IHZtIGNyZWF0ZQ0KPiArICogVGVzdCBjYXRlZ29yeTog
bmVnYXRpdmUgdGVzdA0KPiArICovDQo+ICsNCj4gKy8qKg0KPiArICogU1VCVEVTVDogaW52YWxp
ZC1mbGFnLSVzDQo+ICsgKiBEZXNjcmlwdGlvbjogIGZ1bmN0aW9uICVhcmdbMV0gdXNlZCBpbiB2
bSBjcmVhdGUgSU9DVEwgdG8gbWFrZSBpdA0KPiArZmFpbA0KPiArICogRnVuY3Rpb25hbGl0eTog
ZmF1bHQNCj4gKyAqDQo+ICsgKiBhcmdbMV06DQo+ICsgKiBAeGVfdm1fY3JlYXRlX2ZhdWx0OiAg
eGVfdm1fY3JlYXRlX2ZhdWx0DQo+ICsgKiBAeGVfdm1fY3JlYXRlX3NjcmFjaF9mYXVsdDogeGVf
dm1fY3JlYXRlX3NjcmFjaF9mYXVsdA0KPiArICogQHhlX3ZtX2NyZWF0ZV9zY3JhY2hfZmF1bHRf
bHI6ICAgIHhlX3ZtX2NyZWF0ZV9zY3JhY2hfZmF1bHRfbHINCj4gKyAqLw0KPiArDQo+ICtzdGF0
aWMgdm9pZCBpbnZhbGlkX2ZsYWcoaW50IGZkLCBfX3UzMiBmbGFncykgew0KPiArCXN0cnVjdCBk
cm1feGVfdm1fY3JlYXRlIGNyZWF0ZSA9IHsNCj4gKwkJLmZsYWdzID0gZmxhZ3MsDQo+ICsJfTsN
Cj4gKw0KPiArCWRvX2lvY3RsX2VycihmZCwgRFJNX0lPQ1RMX1hFX1ZNX0NSRUFURSwgJmNyZWF0
ZSwgRUlOVkFMKTsNCj4gKw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGludmFs
aWQtZXh0ZW5zaW9ucw0KPiArICogRGVzY3JpcHRpb246IENoZWNrIHF1ZXJ5IHdpdGggaW52YWxp
ZCBleHRlbnNpb25zIHJldHVybnMgZXhwZWN0ZWQNCj4gK2Vycm9yIGNvZGUNCj4gKyAqDQo+ICsg
KiBTVUJURVNUOiBpbnZhbGlkLXJlc2VydmVkDQo+ICsgKiBEZXNjcmlwdGlvbjogQ2hlY2sgcXVl
cnkgd2l0aCBpbnZhbGlkIHJlc2VydmVkIHZhbHVlIHJldHVybnMNCj4gK2V4cGVjdGVkIGVycm9y
IGNvZGUgICovDQo+ICsNCj4gK3N0YXRpYyB2b2lkIGluYXZsaWRfZXh0ZW5zaW9ucyhpbnQgZmQp
DQo+IEkgYmVsaWV2ZSB3ZSBoYXZlIHR5cG8gaGVyZSBeIHMvaW5hdmxpZC9pbnZhbGlkLw0KPiAr
ew0KPiArCXN0cnVjdCBkcm1feGVfdm1fY3JlYXRlIGNyZWF0ZSA9IHsNCj4gKwkJLmV4dGVuc2lv
bnMgPSAtMSwNCj4gKwl9Ow0KPiArDQo+ICsJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVf
Vk1fQ1JFQVRFLCAmY3JlYXRlLCBFSU5WQUwpOw0KPiArDQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2
b2lkIGluYXZsaWRfcmVzZXJ2ZWQoaW50IGZkKQ0KPiBJIGJlbGlldmUgd2UgaGF2ZSB0eXBvIGhl
cmUgXiBzL2luYXZsaWQvaW52YWxpZC8NCj4gK3sNCj4gKwlzdHJ1Y3QgZHJtX3hlX3ZtX2NyZWF0
ZSBjcmVhdGUgPSB7DQo+ICsJCS5yZXNlcnZlZFswXSA9IDB4ZmZmZiwNCj4gKwl9Ow0KPiArDQo+
ICsJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfVk1fQ1JFQVRFLCAmY3JlYXRlLCBFSU5W
QUwpOw0KPiArDQo+ICt9DQo+ICsNCj4gK2lndF9tYWluDQo+ICt7DQo+ICsJaW50IGZkOw0KPiAr
DQo+ICsJY29uc3Qgc3RydWN0IHNlY3Rpb24gew0KPiArCQljb25zdCBjaGFyICpuYW1lOw0KPiAr
CQlfX3UzMiBmbGFnczsNCj4gKwl9IHZtX2NyZWF0ZV9mbGFnc19mYWlsX2Z1bmN0aW9uc1tdID0g
ew0KPiArCQl7ICJ4ZV92bV9jcmVhdGVfZmF1bHQiLA0KPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdf
RkFVTFRfTU9ERSB9LA0KPiArCQl7ICJ4ZV92bV9jcmVhdGVfc2NyYWNoX2ZhdWx0IiwNCj4gKwkJ
CURSTV9YRV9WTV9DUkVBVEVfRkxBR19TQ1JBVENIX1BBR0UgfA0KPiArCQkJRFJNX1hFX1ZNX0NS
RUFURV9GTEFHX0ZBVUxUX01PREUgfSwNCj4gKwkJeyAieGVfdm1fY3JlYXRlX3NjcmFjaF9mYXVs
dF9sciIsDQo+ICsJCQl+KERSTV9YRV9WTV9DUkVBVEVfRkxBR19MUl9NT0RFIHwNCj4gKwkJCURS
TV9YRV9WTV9DUkVBVEVfRkxBR19TQ1JBVENIX1BBR0UgfA0KPiArCQkJRFJNX1hFX1ZNX0NSRUFU
RV9GTEFHX0ZBVUxUX01PREUpIH0sDQo+ICsJCXsgfQ0KPiArCX07DQo+ICsNCj4gKwlpZ3RfZml4
dHVyZQ0KPiArCQlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiArDQo+ICsJZm9y
IChjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqcyA9IHZtX2NyZWF0ZV9mbGFnc19mYWlsX2Z1bmN0aW9u
czsgcy0+bmFtZTsNCj4gcysrKSB7DQo+ICsJCWlndF9zdWJ0ZXN0X2YoImludmFsaWQtZmxhZy0l
cyIsIHMtPm5hbWUpDQo+ICsJCQlpbnZhbGlkX2ZsYWcoZmQsIHMtPmZsYWdzKTsNCj4gKwl9DQo+
ICsNCj4gKwlpZ3Rfc3VidGVzdCgiaW52YWxpZC1leHRlbnNpb25zIikNCj4gKwkJCWluYXZsaWRf
ZXh0ZW5zaW9ucyhmZCk7DQo+IEkgYmVsaWV2ZSB3ZSBoYXZlIHR5cG8gaGVyZSBeIHMvaW5hdmxp
ZC9pbnZhbGlkLw0KPiArDQo+ICsJaWd0X3N1YnRlc3QoImludmFsaWQtcmVzZXJ2ZWQiKQ0KPiAr
CQkJaW5hdmxpZF9yZXNlcnZlZChmZCk7DQo+IEkgYmVsaWV2ZSB3ZSBoYXZlIHR5cG8gaGVyZSBe
IHMvaW5hdmxpZC9pbnZhbGlkLw0KPiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQlkcm1fY2xv
c2VfZHJpdmVyKGZkKTsNCj4gKwl9DQo+ICsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL21l
c29uLmJ1aWxkIGIvdGVzdHMvbWVzb24uYnVpbGQgaW5kZXggMjcyNGM3YTlhLi5mYjlmYzc1ZDgN
Cj4gMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL21lc29uLmJ1aWxkDQo+ICsrKyBiL3Rlc3RzL21lc29u
LmJ1aWxkDQo+IEBAIC0zMjEsNiArMzIxLDcgQEAgaW50ZWxfeGVfcHJvZ3MgPSBbDQo+ICAJJ3hl
X3N5c2ZzX3NjaGVkdWxlcicsDQo+ICAgICAgICAgICd4ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRp
b24nLA0KPiAgICAgICAgICAneGVfdGxiJywNCj4gKyAgICAgICAgJ3hlX3ZtX2NyZWF0ZScsDQo+
ICBdDQo+IA0KPiAgaW50ZWxfeGVfZXVkZWJ1Z19wcm9ncyA9IFsNCj4gLS0NCj4gMi4zNC4xDQoN
Cg==

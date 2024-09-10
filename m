Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304B3ECE564
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 09:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9BF10E0CD;
	Tue, 10 Sep 2024 09:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i73b4UlL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCB710E123
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962213; x=1757498213;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=g4yHIjmGgI5y1lIQ9Xwo3jIkqv/zhja3tchNnlBfAVs=;
 b=i73b4UlLc+LfYs6jPNygdYfc224MyxwtVeqX4TSG/M9Y2fqPHFH98nxz
 45ne47x5Pnq+wYVU7+PjldUMOBbmBBC2GFpeve5h20g9pEzzA6r8L/HeJ
 +sAC7UTWycY+SwQ+9+E57PQbnEyz4kxrP8FrUtMHuzuaWNR3VJN1YWR/F
 FbJE5uke060K1KGeNHodI5FD6/EZHJ9iQgz3g1CIMa8RI2LenTir9Iywt
 sdzjAS1hmshGzyEY0AV3hFPtI6SHOK6CV6RnX7Gw3gfvsii0nM8Ao1hc1
 xVD8Jh10upeGjGgtUoWZaxQJjzErWmwZthjEZJeSgPmB1mU9mD0Nm1cG5 g==;
X-CSE-ConnectionGUID: XZm/64LwSkWDA3sxI8iJaw==
X-CSE-MsgGUID: ZuKH9v8gQNqqJoSv2LrPAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24848911"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24848911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:56:53 -0700
X-CSE-ConnectionGUID: 3mN5k2/+SHytAMyU5sMwLw==
X-CSE-MsgGUID: bQxoJGo+R5uu1gRXFW/frA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="104444287"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 02:56:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 02:56:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 02:56:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 02:56:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 02:56:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cc3dFpVt5lxSvVUDVsFD89rXe+qedK7c3/VmiFj4IJwt5qe2DOdfkNtextQizg/n2ACXLJzjD4YxVAxaX/AtBknJVmRV9OKuBPvE9cjn5RvyhPxtVWYyNhGT0S7ofcQuK5l4+NAVxL4XQrlQjtABUWCOlUhsHuSRhY/vyRD7wRc11ahbyc0qnaZKerx7QsIb23doN/p+dArE5aYb0r3yjqTMT3mRTjTlWt6DDf6y/XxmjVPatPVSTPUNvaXUADjFx2//apHut/ASRN5qs5i/IpCKWGXOeS+CxPf1TSD/n8lostsmJ8LeYny6umDhOgObvIrPLhhqP+OhGmx1fBtrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4yHIjmGgI5y1lIQ9Xwo3jIkqv/zhja3tchNnlBfAVs=;
 b=LPBHZtmOdgiyh6c3POfE7YrhK2uiAUEWiWToz9FFSTyvB18OhWujJRzvGzCCeRI7uSmwSW2oFeBVcw16rx+3928XSV8pwJIkAPbBLQQpnqwrqWCRhfUQDKNqyJ28DG6Yt/mfymHQsn7Zj96jF18lYqSth/L64AcLnJF5lgZDDonm73kGmznKDeE55RTAMyGRETyqYZydGzV/xzm1P5tvgzwKyaq57JtmyxrqpBkZ5G4vMho4qxZjSYyY6EyzUICIJ4KeU5nJ6u5Esbn2nRfPhiPXSruuRnrKin+8m/x3BHUDQRn0wolK5aqWseOIMtUPGT4ok3Fm7MAA11q4XOC77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Tue, 10 Sep
 2024 09:56:49 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%3]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 09:56:49 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH v2 0/2] tests/intel/kms_psr: DP2.1 PR IGT Fixes
Thread-Topic: [PATCH v2 0/2] tests/intel/kms_psr: DP2.1 PR IGT Fixes
Thread-Index: AQHbA1Sr3koa+NQBSUuLMB/Cudzp4rJQyNcA
Date: Tue, 10 Sep 2024 09:56:49 +0000
Message-ID: <4e72928b85b68c6f575ef937b50613944dc0bd18.camel@intel.com>
References: <20240910073908.1608661-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240910073908.1608661-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB6417:EE_
x-ms-office365-filtering-correlation-id: 26c4a5d7-d182-4228-31f1-08dcd17ee38e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MlFtNWRVU0ZzN0NVVXE0c3ZKMlpwZDg1bzFGYXl0cG5CRG11VElrdGNkUnBK?=
 =?utf-8?B?OUNtb0h2MHFWcjVjL2pqSWZ5M3FMNTBSeVFtR3BUWnZtKytGdUpITldCdjA1?=
 =?utf-8?B?RDcrK25qZUxpbE03OWJYMyttVHptTDNtaUx5VXFlOER6dnAzSGVaWDRVZ1VT?=
 =?utf-8?B?cUQ1VDNPN0VqenF0WGwwZkIyMms1MVJ3Skd6dVA1Ukw4bjAzUmlaWno0dnlR?=
 =?utf-8?B?MVV6Mlh6RWNQdTQxd25WaERkRmZIY29heUVNcmJLOWJNOXdsZnhZUlFNUm1F?=
 =?utf-8?B?Ykt4ZEFUNlJ4c3RkdTJlRjdNVzRXem5ib1EveitlZ1dhYXJKb1B4YVZFUlZt?=
 =?utf-8?B?NGxacXYwR0UxNitIV1NsWDRvZFhZejY3eVlwUGFEc0tQczhZYVBsemMvMGlP?=
 =?utf-8?B?VDE2cHl5aHRFYXE5TlFwMnMrVWpFaXduNStjdGY4cXlEZG5qSHlVcU5hZ1I4?=
 =?utf-8?B?TG1tKzdkU2VueHl3dTBuN1FaK2Iva2NORm0vNkptTHQ4Z0tFK0xQM3JLMGt6?=
 =?utf-8?B?K0IweWkva2o3eW83TzJNOW9wRGlzSXZmK09SdTM3bTVQdnY5d1dHb3kyNHNO?=
 =?utf-8?B?NEVJcTJJb2paZktsQVJIRUVEdjdvQUljR1pvTUpWRk9LcUVkV0dRdWVFVjFt?=
 =?utf-8?B?MDh2OG9lVHdkOTArdGlWaUQ1c1A5UERQbTNzL2M2RHFYVTUvaThCY080eHpq?=
 =?utf-8?B?TEFPemZMMVI1RGpDbmU0aUQzRHJwVXBYWlY2NjhpRVBTRHdWaXpnMkEzbjJu?=
 =?utf-8?B?ZGR5SUJMMGMwQS9VQTJKWFZkS3hadnFnYWF4WUwyRmw0VDZHaWo5aTdTUFZo?=
 =?utf-8?B?ajJLY3ZIMWM0RzdmNXJLQ2w5VkluazRwS1o4MnFscXgxS0g0SS9WR3VLN25h?=
 =?utf-8?B?cVZuTk5icDREeC9IQVdaQ2NMRmZlcnJXZDVua3RGeFNaZlk0NERVNkFHbmNw?=
 =?utf-8?B?Z09PY1gvT1Y0M2h1Y3ZQb21HOU9EeXQzajJQb3Q4bGdyUmpGNU9tbS9VbWlq?=
 =?utf-8?B?bTRJazEzUmdZOHQyOFIxTFlMNXNITzVpc3lpSmxtQ3ZkN1J2bUV2VTZqNWxm?=
 =?utf-8?B?RzBtNVM1Y2pKRFlOaVZuMUtyenJmc3g2K3lianlhUzIxSi95ZzZ6TjJCZEJu?=
 =?utf-8?B?UUIza0ZHOHB3ZWwvVnZVTkhUSDF6bUxmc1ZXOG5kMEtrZ0dVT0h3b1dJVDBI?=
 =?utf-8?B?ZitTQnU5SWZXWHJadVRXTGkxMHliOE9rd3N3NUxMa0lDZTkzTEV6S2EreThU?=
 =?utf-8?B?aVRyZFVaZWpRTHVhRTdXVGVTdVdxbVcydmFNMWxLZTh0NHNUZm9OSzdESzdT?=
 =?utf-8?B?aVkyQkRWL1lZTlBIK3lUV1J5dmZwUENPczR3eUV2SmFyVVgvS05RRHhKdGJI?=
 =?utf-8?B?WkEvQUk1azFIa1RLeVY2emJPeVc5TmVjWE81TDFkOUdOMWk5Z1VPNmpMVjFF?=
 =?utf-8?B?TUxCdk9GQjRJaWFOUE1wK1F2ZXh0MmhoemNEbFdhbW8wZUpaODFRU3NOZkgw?=
 =?utf-8?B?WkJjQ0ZDRU4zTHRoeWJ3ekIzeFNZb1llY3ZmeG1iWGVQY2t6dG1xcnZSRnVO?=
 =?utf-8?B?Rkg0M1VNenl1ZnlaeW5La0xudVpnM2pEVmVqV3AzRkJBcnRHUGFManpBTlBx?=
 =?utf-8?B?WE9BOUFpRlRjOWRxeDhaYXhrbHZ1ZW00ZkcrczdDUUFZQkdYVjRsZ04xR3Vh?=
 =?utf-8?B?MVNhWDJwejc1N0FGMkdNVGpQNURoVzBERGZRVVNESFFvWU45cDg3VjV3MEZx?=
 =?utf-8?B?cUdJdFdicHp0TUJiVVRCZE05OHptNWpGQ04wZERsdXhmVitBMVk2ZnRTK2FF?=
 =?utf-8?B?M2lDZDZqeG81dG42b0wveGl1a2hEYkc2UzdzRk5ubHlHM2wxOXFKclNmeWdo?=
 =?utf-8?B?cE05dDFJblV4ZlFDMi9ING5ZdElkSzk5ME9OeFZQKzZGUFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODVqQWhubzZUMWxOSE4za1IyQUlFZ2M4b2xtQXVRNHYzcDQ5ellNeTBLcGRo?=
 =?utf-8?B?NTVieldxYzYweGduV0htNXI5ZEhSMWdMVG9TZWdaWVpHMlZQNkk3VEQ4SzND?=
 =?utf-8?B?QkFqc0ZKUmFrblZ0OUpqOTR4WWd2MkxDeFl3OXIyVDdzckpqb2dmRnR4Q2pT?=
 =?utf-8?B?d3hKbFB1Snl6djlPZVcraGZCcmpNZFFOVnN4eE94bnVmdWRqT3diSVZiK1No?=
 =?utf-8?B?OXpKMWs4VkhDYzNXVlR1ODVrdFRMbEptbDBURW9WV1YraW9uQmgyK1dEaHZa?=
 =?utf-8?B?ckRTYWpyTUNqNnhqcDMxbC9BN0hiYkc0YXF1MjFNVUVOVkxzelJnaUsrSStl?=
 =?utf-8?B?OS9kWjRzQzMxaEhtNElZTkcrSjZjeHN6MEwwNm9SNnc3L3RJWUNEbEEzZmpB?=
 =?utf-8?B?T3lxRm9rZVFvSThCUVRuakJTbkltYkpsbU4vcWNDSVBUcGEwMTRUYzlUbU1t?=
 =?utf-8?B?VElhK1VhTWxOZDdZZnlxZWdvakF2YlovUC94ZGFYOE4zc2MwY0wrLzh1TWI4?=
 =?utf-8?B?MDFjQ3pBRkh4dEZ6OFQvalBMMTRuNEQ3UUxBTUdpWERIVTRVNmVRbmd0MkV1?=
 =?utf-8?B?UVlndVo4WVduaHVOWnM0MFozRFRuU3l6Y25qbWNWckl2TkxNY2xTQThzcTlY?=
 =?utf-8?B?V0wxdGRqOWtpRHBRWUNFczdDY2Q2M2pWa2lZVzliL09RVk4vQklYajJ4WEtu?=
 =?utf-8?B?Y3h3alBpdUVheVArcXl0U05nY3FYQTE0NTdNdll3NytLT1hwQ084ak5SbTk0?=
 =?utf-8?B?NGJaQWxsM0VnWlFDYnNoWWkrR3l0dWpIQkZsamgzOERzL3dhTWZwTHpzamJw?=
 =?utf-8?B?b2dVTkM3K3NFQUdocVpvYVFNMTlOb2tTWjRkYmNUa3hHWHdoSFY5VnRBbno1?=
 =?utf-8?B?a0lhdFJEK0h5dVZVSDJiTk0xZ0FBTHQvZjg2L0Q1dUlJclE1YUZGSG1Qb2cr?=
 =?utf-8?B?bEwvTDRlWE82Mk5hcWI2VTd1eHhGejFLcnhVQUFuVlB1TlhOSGVMWmlkSHNO?=
 =?utf-8?B?eFdLVHYvaGJ2dDg3OTc3anBnRzR2MmdiVHduOTNsanFaTHhwNnVNNzVPa1BV?=
 =?utf-8?B?djRiU0N3NkdsT1F1RmlVZDljZ2I0Vk54SDhoVjJGckhVRm9jZmlOM2crQmpu?=
 =?utf-8?B?ZnhpWHJBbDVXSHlJaU90cGhBbE5IWDlBUnZZdCtSaC85SXVLSzlPTENJOEJh?=
 =?utf-8?B?aG9mR25xeHlXR0RYNE5FdTFDaXRxL3J2VnZVbjF1cHJsNFArWHFVVE5YdXRu?=
 =?utf-8?B?b2lSeUh3Z3FCb3NreHB6MTV5NTBlVzlhUmJoQnh2bDNVcWE1b2V5NU9YdTk3?=
 =?utf-8?B?WG1RQnNOR01LTE5VaTlCYlBIeFhza1V1UnBrZ0lmWHI2OFIxYlhOWUFUd010?=
 =?utf-8?B?cHpablRkMGE5MEtDa2FNaWNCNGo3OWQvUHZoSmZ5OXJuVUR1Y0ROTmI2d2th?=
 =?utf-8?B?Vk81dkJ4QUZCK25QY0dseTQrUGY4aTZyN2pEYTJmVzBWUy9pMUVsSlV5RTcz?=
 =?utf-8?B?aHpSMG11Z1ZsZzFtVzB2dFMvK3ZUYjBRMytzN3hiN0lmOHA5aEhuam1iRExP?=
 =?utf-8?B?ckZMZ0NWc1MrUE0yUWtKbFUwU1dWSXBiVTBHR2RNb0lOY3JXdlVUNk52eXQz?=
 =?utf-8?B?WU9ZQWRnekVHODhhbDVqNjBic294YkJ4YzJLMG5FeHpIbUxRUDF2bFBFR0RU?=
 =?utf-8?B?ZjJLRnNUKzZYdzJEZWNCd3dpc0czQzdUTlk4T3Y1ZCt4cmx0UklJN0lKODRq?=
 =?utf-8?B?TFd4Z0U5RGk1cjZUaW15cnJSOVBiaFZITEFsRGJiMWJDTmV3SGpjOCs5MHFj?=
 =?utf-8?B?bjZOYUh5YmFObmV2dERSVXRJbjM5eG5aOEI5bDRwNGwwRDJhbDUvWmdWMXZ0?=
 =?utf-8?B?WjBrSFRZZmRsNTJSbXhxNkEySjJObXJlSlcxWUZvbXJpUlhDNFFNTC9Ga2c3?=
 =?utf-8?B?OEFST2RWWWdHMitUZ2tKSVhDMUhVMWJSTTFwZEtucnVTaytvS00yWnhCSEEz?=
 =?utf-8?B?ZEE4TGtYbUppcVQwRW9rU3dYOGlQVUc1eWRxbnZURER4bXFRYnZZNVY2UXBi?=
 =?utf-8?B?Q05aK2l0K2hrT0EvWlhjZkQvNzI4eEh3S0lzY25lRXlCOGxObXdkeEZZajN3?=
 =?utf-8?B?SGtDTWNIbUNldS9yVDF6SCtHeFhpN2U2SDJqQW1ML0l5R3BQMWRTZytSdXFV?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBBC0D0D288EB649AAA8C6465F232DAE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c4a5d7-d182-4228-31f1-08dcd17ee38e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 09:56:49.3578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCkps7EOIHT13oiBrL0FhQeYuTtzgBtpgHUkFnRqV6eVDWA2mLiBOZ/txrJpejLaGAT5sWchedczAF3dDAHx7ElwVFITGZpelNzCcthn6yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
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

T24gVHVlLCAyMDI0LTA5LTEwIGF0IDEzOjA5ICswNTMwLCBOYWxhZGFsYSBSYW1hbmFpZHUgd3Jv
dGU6DQo+IFRoaXMgcGF0Y2ggc2V0IGNvbnRhaW5zIGZpeGVzIGZvciBEUDIuMSBQYW5lbCBSZXBs
YXkgaXNzdWVzIHdlIGhhdmUNCj4gZm91bmQgd2hpbGUgZGVidWdnaW5nIHRoZSBjb2RlLiBUaGVz
ZSBpc3N1ZXMgYXJlIHJlbGF0ZWQgdG8gRFAyLjENCj4gbW9uaXRvciBhbHdheXMgYmVpbmcgTVNU
LiBBbHNvIHdyb25nIHVzYWdlIG9mIFNSRF9TVEFUVVMgYW5kDQo+IFBTUjJfU1RBVFVTIHJlZ2lz
dGVycyBhcmUgZml4ZWQuDQoNCkZvciB0aGUgd2hvbGUgc2V0Og0KDQpSZXZpZXdlZC1ieTogSm91
bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQoNCj4gDQo+IE5hbGFkYWxh
IFJhbWFuYWlkdSAoMik6DQo+IMKgIGxpYi9pZ3RfcHNyOiBSZW1vdmUgU1JEIHN0YXR1cyBjaGFu
Z2UgY2hlY2sgZm9yIERQMi4xIFBhbmVsIFJlcGxheQ0KPiDCoCBsaWIvaWd0X3BzcjogRml4IFBS
IHN0YXRlIGNoZWNrIGZvciBEaXNwbGF5UG9ydCBjb25uZWN0b3JzDQo+IA0KPiDCoGxpYi9pZ3Rf
cHNyLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKystLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDIxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KDQo=

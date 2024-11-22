Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD78D75E57
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204EF10EB96;
	Fri, 22 Nov 2024 14:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6/OQ+hc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5213910E0F5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732285647; x=1763821647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=I5Qoh8CtsGHsdrJeVszjcLSWD1cSc7fQ0r6Rx666dN0=;
 b=D6/OQ+hc3FertmxWUMjdHKfNwnIZokZrdyexjsikz+/pGLgfQAdBBmF4
 yyvApsWx7Fm5GFf4TgliikVR4mF/Ii8y4q6LQGHLDtZCYxArIdGYNlFNV
 uzKLH4hO2gH03bAVwjRhsWhkD4qCvKCBpn+OKxSYj/AQXgLbGmRaHiPS3
 4aAcyZ+VLEg+kdb1QWdNg7JjGKsqUkrEnzAZ+84I7oHOs39hswROYs7it
 wFwD9SOwORoSH1vNGvWHRxDN3mJ7yKXsaEcOKtC0855x/FeyMqqtDF3gC
 2CDptDD8OTbPQdvXvLevT31eGQX1Q/eIogalOMLrW9ZUXPLB7gJ2yHM78 g==;
X-CSE-ConnectionGUID: /3RbUGYZRUqHCMEAnMOCtA==
X-CSE-MsgGUID: sfeiRBTiTYim14oa8swb0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32366433"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32366433"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:27:27 -0800
X-CSE-ConnectionGUID: Vue08cupSMGJozw+pMffPQ==
X-CSE-MsgGUID: Kts64R3ZRqSGB0nnVmOegA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90522147"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 06:27:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 06:27:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 06:27:26 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 06:27:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiW1lmwKNy4oeWp2WyKycg09v0WCu42nfMYsC23v8Po/Yqjh4r0qC0RkpVrMUOmKSRWJDK+gAZzTG/l+iqfZgeeJBtEUsO3LGfsm5ZNkHp+XDDMKmSMhF6sIPdCfS7RsrowQbBNJUwo51rzcALuHseLsnxBS5b+6wPki3tgUiBZ1SlvdUtIplGbfRp0iqR7j4VY9WKZUQTOjVGov+8n8BsIyVHX/bpj1MTOxjt2/NcIChpZ9qQE1+n/bn016eKz0B46/di4j4vJirRZ94P8T6Yvynd/IycsTQxj5yy3CnbMpf0/eHZfgxqNJnfL6UIpjH0DsfFXOjqY/cozcJ9fDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5Qoh8CtsGHsdrJeVszjcLSWD1cSc7fQ0r6Rx666dN0=;
 b=HMYyvSd/8DnLLsLESgvlcW0O2SU6LQHF7p7LQL6r9ZQDNTQCQ5QWgcGEb+TlYz7ilBFNhl6+Xeynw4yhglAlwFO7wa3ESXd1qoowLt4oG82YbHi5K7fEAcynMD8+jorNH+xYILYUKf/FLSNji8ZHqMk1nsFMgFQZROyHXPa5/uYRL2V5DCOKk56SuGH4maKNaVruT0GwTpv/zrmTE8bHJRQnmFFK3aGcN7iThhLSPyA9L2jj+5zPsZ/VCe9sIBK1fdX/L5/QIvmj4TL7Q3La1P1JdAbxhkKbWAK+orEQdnx92mqWubVRRIAazgf6WWQQ0nWgTnuGxhTzUAuEPSsk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 14:27:22 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 14:27:22 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 3/4] lib/gpgpu_shader: pass surface desription to
 shaders via inline data
Thread-Topic: [PATCH v3 3/4] lib/gpgpu_shader: pass surface desription to
 shaders via inline data
Thread-Index: AQHbPDi2B6DoPeZxtECO6h9OsmAsJbLDXNUA
Date: Fri, 22 Nov 2024 14:27:22 +0000
Message-ID: <dcea6fe6f3cf739b3aaaf47fe892133a7ae2edf5.camel@intel.com>
References: <20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com>
 <20241121-gpgpu_send_rework-v3-3-0b6aa48ab006@intel.com>
In-Reply-To: <20241121-gpgpu_send_rework-v3-3-0b6aa48ab006@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SJ0PR11MB4942:EE_
x-ms-office365-filtering-correlation-id: 1a5155a5-ecca-4fcb-23b1-08dd0b01c739
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VVRsY3Y0Wm80VXc2aVhKSE5xTEE2V1k1NS9PTHVzbGxQZzBENFJ6OHk2NWtm?=
 =?utf-8?B?Z0x5STNVUVh0NGw1aDdPUmdVWmNiUHVWaXVBbGR0VHdnUXIrZmMzQ0JGMkxQ?=
 =?utf-8?B?WWF6bWovbStJUzAvamI1Tm1PU0xLWEVrUlExVEd4QmU3NEh1Yms1cEF6RkJi?=
 =?utf-8?B?UE5rWDlpOTlWTzhvWDl4WUk5L3hjNGdNdEFvakFpbGhhRytIdlZ3ZXJ0WWow?=
 =?utf-8?B?c1RBU0U1S3dXWko1b29JTjh2YVIxZkQ5ZW4zYWcwTGxWZDUxWTBOQjNLbFVI?=
 =?utf-8?B?RlFyQmdiV3REU3ZXMjYrT2JaNjdmNVFRMjBBMFZFOTB2aThpcG5CdEJTSVdP?=
 =?utf-8?B?YWFCdEJOREZlSlJWckZYL3hXK3EyRHFoak9UeTJ2VFU0eHdvRXFnRUVMWmR6?=
 =?utf-8?B?cHh4bUQ0ajlGYkc0SGpFSWtiTmphU28ybEVDY0N2M3NuUGFsV3BGMitLZEhS?=
 =?utf-8?B?SHFrWlE3cFNzYXU2Q3N2OWxlaW9JYnUrZ0JobVRMR3pPTW1hY2dvUE1ocHFo?=
 =?utf-8?B?anZXbTVFcGo1UW4vcVdNbTFwYndYNE1hanNqQTNMa2p4MWNDeEtjc0M4RTRZ?=
 =?utf-8?B?NjJ4S2ZaZS9iM1RYaXJSR0ZDTVJ1ZE1CdTJRNmZLQk1hSnpTWE56L3RINXhm?=
 =?utf-8?B?NGhnZnZJRHZkTnVLazNaYTRpQ0NhejFUbklSOTJ5QTByelJ6eHNvVHc4aGJo?=
 =?utf-8?B?T21jSGZaelRlQnp5dDlGbjcwWURmNFJpMGgwTXl3Rm5zSW9jaTJZYkZjQWNU?=
 =?utf-8?B?RldWTXl3Y2pQWFREUGtGVms1UEhYeHlnMHI1cUN0VG40NlJnRWU2S1drVXJu?=
 =?utf-8?B?cm5JY05EdnNnUU9TTnFzbUh2d1llWVRKUlZGK2ppRDd4STdKdjN5ZURUbkc4?=
 =?utf-8?B?RUhMdWVTaTB0b0JpSjJRYmtvN0lReTlsYllZU1E4bFc4NUk5WkZ0Mzd5MFpJ?=
 =?utf-8?B?V0ZTNnlTZkxmMDRCUnRvVDFxaWMxVHBSSjV2V0JOd2lCSld2WEQ3cGR2NWV2?=
 =?utf-8?B?dnNCRUdDeVJaQ0R3c3Y0UXRnYmRKQmhJVDA1K0U1OEZaL29tbzhJRERYNnRq?=
 =?utf-8?B?N1QydE5GYzk1ZFNWNmF2K3UvaGpEZ3dQcHQ4cjgveERhcFAxQTlBRXVKMTFB?=
 =?utf-8?B?a2Q2SktxM0VBclpKY2dzd2Y0UldNc2Q2ZWRMWm5WNHNKbEZ0WFRLcEJEV3lp?=
 =?utf-8?B?UUVrTWcwVzhrSGZBbi9DS1F5K2p1V0lucGJRK252N2lRckRLMjBxODdIZ3Nh?=
 =?utf-8?B?OTI4eUZqZkdRb3BxZ0pnSENQaVE2NWVhc0xVWUlBR1NBcGl5VEJ5Zmtua0VJ?=
 =?utf-8?B?c2E2NytzNTNRVnBpbWRVcjZhd0xSamZpUHF2ZWNzTTVnTG9yQTVSeCs5RGkz?=
 =?utf-8?B?VUFRcmVNRE9ycE1qNTBNbytrUi9sVCsrZDJMcmdoenJZUmVKRlY5dVBtZkcz?=
 =?utf-8?B?ZDdhKzhMeUNXWXdJS2p2UGIxQlg2alBxRnlVOFV3TExhY1ZIc0IrRnZUS2Yw?=
 =?utf-8?B?LytIeHZDbERXbGFoS0FyeGxOU1orVDhvMFY1R2hJNzNPMjVFU1Q4T3JNNEM1?=
 =?utf-8?B?NkwvWXVNU21xbE5PdzdiVlZaN1dWMGs1RXNlaU1FamJSK3p2KzNxWFZ5RWhs?=
 =?utf-8?B?QVpDSU8wT0x4Ri9XTUV1U0FlbVlySTFidFBCd2NnNUVDbC9wY0JlWDNieUxS?=
 =?utf-8?B?VS9YUUp4UWxmbjB2MStUYkdKdGZkU051WnBpQ1NVaTZwR290eVhLTWNHTlNl?=
 =?utf-8?B?QW8yeWZ0c1VEZW5qOEZKNHQyTGtLNkpqMXg3WDdPRWxCdWhMMi9raGh2bmRB?=
 =?utf-8?Q?76JbpNjAFSpmY90mEvYv0EFeO6YibR8faa2Lw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFNmbDZFOFROYUo3RDRkQ0ZabDhGbnR3UjQxNEdsd1BHT3ZQZWV0aHpjY3Fv?=
 =?utf-8?B?L2xja2djalptcGRLckpwZDhRcDQ5d1U3OTI3cm1UU0dqbmtZQXQrenJGL1Rp?=
 =?utf-8?B?WEZBUFh1V0RNWEY2c0EwdGdFMlc0bGMvR2NnMzZkSDM4OEltMFZoclpsWW1D?=
 =?utf-8?B?dEkxd3pESWJZU09LbzFDcVlxa1hrQUErT01TdFB3NmkrdHhhUHhDamwrNG5K?=
 =?utf-8?B?YTlSdlJoWjlNTTNZRXJDSFpiSFV6d2cxYzRENXYyVlB1UE9SQ1ZWanc3Vklp?=
 =?utf-8?B?N3VjaTBUN1NxeDV2RHgxTjFrMDJmdmt6ejFpbTJyWS9mZjVNL1ZxNU96cEY0?=
 =?utf-8?B?eThnWmxxWTQyVExNdW1YamI2WklucVNMcjlFSmxNM0dmeVlRYTBnNlhNV3Yw?=
 =?utf-8?B?c3RVK1RML1R2U0tmZkRaa3ozaFVxVFJ3SVFNRENTajdleWIzd3ZNd3psOWJC?=
 =?utf-8?B?TWNnaWk1bnZOeEY0djJtUVhNcml2MXkvNGo0aFJHMW80Zk1wYWRlUTRIN1JS?=
 =?utf-8?B?ZnRKdDhJQjFkNVIxYkdpSzJJTkNsbnJVbVVkQkJBV2V6WnZpYlNuUitiNytm?=
 =?utf-8?B?UWZWdEV5WTVaMWJ0cWVDbHpFbXFNSTVEL05Dd3B2clBMNUdOWTlyMlNHdDZw?=
 =?utf-8?B?NEszUXd2Q2JqK3dPTnRkYTRPWis0dzQ4VHhVdlRBbHdyNGxnem5LVTlLVFcv?=
 =?utf-8?B?M1NYVEtuY2k3RWV5THpmeGxiekpBOUZxbmJSZWUzSDhwbEhFalowSzZJeTZV?=
 =?utf-8?B?TTloV0c3Y0M2dGRUOVoyQmkxWG1TSjJYVHZ6NmVTaENxRUYwL1VrL25YRTBa?=
 =?utf-8?B?OWp5RFBmcVRGWWNEMFpCLzRnRVpLc3NiTk16aHlZMzZUR29VMWRMemZHdTVu?=
 =?utf-8?B?eEIzZEdGK0tBRjZHbGFZUStTazhGc2hpWGNsVHhPMVBOY2xlZVdmSURnRmRz?=
 =?utf-8?B?VWdOQkx2Tm5iRkVNalZoZkx6My8vRkNFNXlXZzRiQUkxbWF0NkJXQk1YWmpD?=
 =?utf-8?B?NXRZelVib2RXODYrVjdibkNuUUNnUGxxekQ3QU9QcFhpUlFCVitzWkJqYWs5?=
 =?utf-8?B?NlBEZHFlWVdZR29vM3dtcWl3N3VXNWt4eUNKVWxqRkgrZ1BxemFYVUFVTmIy?=
 =?utf-8?B?bDNYZHkrbjVoYmhEZlk2cjVCZmpPbUFQM3NSK0dtTERJVGN2VjB0OHJvLzBW?=
 =?utf-8?B?eGtiaWxyZkZxcHU5L2JZcjRjSWNPWVlRNTR2RGpuUXNkS3BYS0JKeVdSRkhh?=
 =?utf-8?B?enI2YTVpWTF1S3lHcnBLWXJYT2xJSGZyT2ZNZW9TTjJkMm1VVzU1VmQwYWNa?=
 =?utf-8?B?YmpVTmFORTEzcUJGSkVjemNMRTFWZG5TUWpFQzRUR0tNcGVVaFByMG5IbHpu?=
 =?utf-8?B?cXpiUUd0YW5JbmJiOXVnd3d0a2VBZGxEckg5cTF0WXkxazczVUdNZVVWR3RV?=
 =?utf-8?B?WHRjR2VPSzA2LyttNU9zN3ZReU1oVHBGNGlBV2R3MnFmSXA5VGVKZmZvZHh2?=
 =?utf-8?B?b3pmaUh2YVN2dS9EdWNmTXBtd3MzL1FVNVNycGExcjBLL3RpQ0hPTlY5LytY?=
 =?utf-8?B?dGV1MU83SUEwWGE3NVVKUWk5cGl4S3Z5UjExbDdXKzZYTnZ3bldXR3N0QU1k?=
 =?utf-8?B?QUM3V3ZUMm9oVTJrNTNWVmtnM1JCRmpMdnF4K0IrUEFzdVhzUC9kQlBCYUc0?=
 =?utf-8?B?Mm80bE1PMVllYnc0T0FUY3RZVC9iSHVMYzVTSUJkSGZWcUJBK2h2a0RCWjQ3?=
 =?utf-8?B?d0Y0N2xyZG9BZWUydDJTMU5JaDIzVDhQbHhINm1ZVTNkRlRaYlRjTDNwYzFh?=
 =?utf-8?B?UFdOYzdSVW9IamJQME5xMFpVdGNaVzdUU0hzaFMreU9FcWgxSU1JNGhPUnBH?=
 =?utf-8?B?VmdQSjlKOW43RHRzaDFIcFNTS24zOVorcjgwNlBwSlhtZUlicVRieGRBVE52?=
 =?utf-8?B?SkhsTGt6TjVaT3pZbGJRZUFtWGRxSGxlbnl5OGhMajJXcVpXcmtBNlZCMC9E?=
 =?utf-8?B?aE9KbzFlcFVlaTNyMk01UURFRXhVbGxERDhrWUF6SHVkSjFOUXlLd0tMSGli?=
 =?utf-8?B?cW1TdjFLSnlhSGJoYlJRSTR1c0dDVzJNbE9SVFIySmVObGprallUY1UycUtu?=
 =?utf-8?B?QmRBUGdaVXhkSGM2RjYwREZDYjhvOGRzZFJySTZMUU9tU3RBejUrMWFqQTE2?=
 =?utf-8?Q?YjOFTsrtflP+NVh2H0RNiHY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82A7B042975F4D40B536097B386857B2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5155a5-ecca-4fcb-23b1-08dd0b01c739
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 14:27:22.1213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQF5NgsyHjeE7oW0xQ98bhjtD/ME+2E/3HDNaeB2jDyRPivHXEbfIi/liY071VQUKLZftfJS+Yxddos2Pv8tJscOiMDwqoyXrVVWztJrUmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
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

T24gVGh1LCAyMDI0LTExLTIxIGF0IDE4OjEyICswMTAwLCBBbmRyemVqIEhhamRhIHdyb3RlOg0K
PiBTaW5jZSBuZXdlciBhcmNoaXRlY3R1cmVzIHJlcXVpcmUgc3RhdGVsZXNzIGxvYWQvc3RvcmVz
IHdlIG5lZWQgdG8gcGFzcw0KPiBzdXJmYWNlIGRlc2NyaXB0aW9uIHRvIHRoZSBzaGFkZXIuIElu
c3RlYWQgb2YgZG9pbmcgaXQgZm9yIGV2ZXJ5IGNhbGwNCj4gd2UgY2FuIHVzZSBpbmxpbmUgZGF0
YSB3aGljaCBpcyBwYXNzZWQgYnkgQ09NUFVURV9XQUxLRVIgYW5kIGlzIHN0b3JlZA0KPiBpbiBH
UkYgcmVnaXN0ZXIgcjEuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhbmRy
emVqLmhhamRhQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvZ3BncHVfc2hhZGVyLmMgfCAyMiAr
KysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9ncGdwdV9zaGFkZXIuYyBiL2xpYi9ncGdwdV9zaGFk
ZXIuYw0KPiBpbmRleCAzNjM0MzVlN2VmZDMuLjUxODQyMzE1ODg4MCAxMDA2NDQNCj4gLS0tIGEv
bGliL2dwZ3B1X3NoYWRlci5jDQo+ICsrKyBiL2xpYi9ncGdwdV9zaGFkZXIuYw0KPiBAQCAtMTQ4
LDYgKzE0OCwxNiBAQCBfX3hlbHBfZ3BncHVfZXhlY2Z1bmMoc3RydWN0IGludGVsX2JiICppYmIs
DQo+ICAJCSAgICAgIGVuZ2luZSB8IEk5MTVfRVhFQ19OT19SRUxPQywgZmFsc2UpOw0KPiAgfQ0K
PiAgDQo+ICtzdGF0aWMgdm9pZA0KPiArZmlsbF9pbmxpbmVfZGF0YSh1aW50MzJfdCAqaW5saW5l
X2RhdGEsIHVpbnQ2NF90IHRhcmdldF9vZmZzZXQsIHN0cnVjdCBpbnRlbF9idWYgKnRhcmdldCkN
Cj4gK3sNCj4gKwlpZ3RfYXNzZXJ0KHRhcmdldC0+c3VyZmFjZVswXS5zdHJpZGUgPT0gaW50ZWxf
YnVmX3dpZHRoKHRhcmdldCkgKiB0YXJnZXQtPmJwcC84KTsNCj4gKwkqaW5saW5lX2RhdGErKyA9
IGxvd2VyXzMyX2JpdHModGFyZ2V0X29mZnNldCk7DQo+ICsJKmlubGluZV9kYXRhKysgPSB1cHBl
cl8zMl9iaXRzKHRhcmdldF9vZmZzZXQpOw0KPiArCSppbmxpbmVfZGF0YSsrID0gdGFyZ2V0LT5z
dXJmYWNlWzBdLnN0cmlkZTsNCj4gKwkqaW5saW5lX2RhdGErKyA9IGludGVsX2J1Zl9oZWlnaHQo
dGFyZ2V0KTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHZvaWQNCj4gIF9feGVocF9ncGdwdV9leGVj
ZnVuYyhzdHJ1Y3QgaW50ZWxfYmIgKmliYiwNCj4gIAkJICAgICAgc3RydWN0IGludGVsX2J1ZiAq
dGFyZ2V0LA0KPiBAQCAtMTU5LDYgKzE2OSw3IEBAIF9feGVocF9ncGdwdV9leGVjZnVuYyhzdHJ1
Y3QgaW50ZWxfYmIgKmliYiwNCj4gIAlzdHJ1Y3QgeGVocF9pbnRlcmZhY2VfZGVzY3JpcHRvcl9k
YXRhIGlkZDsNCj4gIAl1aW50MzJfdCBzaXBfb2Zmc2V0Ow0KPiAgCXVpbnQ2NF90IGVuZ2luZTsN
Cj4gKwl1aW50MzJfdCAqaW5saW5lX2RhdGE7DQo+ICANCj4gIAlpbnRlbF9iYl9hZGRfaW50ZWxf
YnVmKGliYiwgdGFyZ2V0LCB0cnVlKTsNCj4gIA0KPiBAQCAtMTg2LDcgKzE5NywxMCBAQCBfX3hl
aHBfZ3BncHVfZXhlY2Z1bmMoc3RydWN0IGludGVsX2JiICppYmIsDQo+ICAJaWYgKHNpcF9vZmZz
ZXQpDQo+ICAJCWVtaXRfc2lwKGliYiwgc2lwX29mZnNldCk7DQo+ICANCj4gKwkvKiBJbmxpbmUg
ZGF0YSBpcyBhdCAzMXRoLzMydGggZHdvcmQgb2YgQ09NUFVURV9XQUxLRVIsIEJTcGVjOiA2NzAy
OCAqLw0KPiArCWlubGluZV9kYXRhID0gaW50ZWxfYmJfcHRyKGliYikgKyA0ICogKHNoZHItPmdl
bl92ZXIgPCAyMDAwID8gMzEgOiAzMik7DQo+ICAJeGVocF9lbWl0X2NvbXB1dGVfd2FsayhpYmIs
IDAsIDAsIHhfZGltICogMTYsIHlfZGltLCAmaWRkLCAweDApOw0KPiArCWZpbGxfaW5saW5lX2Rh
dGEoaW5saW5lX2RhdGEsIENBTk9OSUNBTCh0YXJnZXQtPmFkZHIub2Zmc2V0KSwgdGFyZ2V0KTsN
Cj4gIA0KPiAgCWludGVsX2JiX291dChpYmIsIE1JX0JBVENIX0JVRkZFUl9FTkQpOw0KPiAgCWlu
dGVsX2JiX3B0cl9hbGlnbihpYmIsIDMyKTsNCj4gQEAgLTIxNywxMCArMjMxLDE4IEBAIHZvaWQg
Z3BncHVfc2hhZGVyX2V4ZWMoc3RydWN0IGludGVsX2JiICppYmIsDQo+ICAJCSAgICAgICBzdHJ1
Y3QgZ3BncHVfc2hhZGVyICpzaXAsDQo+ICAJCSAgICAgICB1aW50NjRfdCByaW5nLCBib29sIGV4
cGxpY2l0X2VuZ2luZSkNCj4gIHsNCj4gKwl1aW50NjRfdCBhaG5kOw0KPiArDQo+ICAJaWd0X3Jl
cXVpcmUoc2hkci0+Z2VuX3ZlciA+PSBTVVBQT1JURURfR0VOX1ZFUik7DQo+ICAJaWd0X2Fzc2Vy
dChpYmItPnNpemUgPj0gUEFHRV9TSVpFKTsNCj4gIAlpZ3RfYXNzZXJ0KGliYi0+cHRyID09IGli
Yi0+YmF0Y2gpOw0KPiAgDQo+ICsJYWhuZCA9IGludGVsX2FsbG9jYXRvcl9vcGVuX2Z1bGwoaWJi
LT5mZCwgMCwgMCwgMCwgSU5URUxfQUxMT0NBVE9SX1NJTVBMRSwNCj4gKwkJCQkJIEFMTE9DX1NU
UkFURUdZX0xPV19UT19ISUdILCAwKTsNCj4gKwl0YXJnZXQtPmFkZHIub2Zmc2V0ID0gaW50ZWxf
YWxsb2NhdG9yX2FsbG9jKGFobmQsIHRhcmdldC0+aGFuZGxlLA0KPiArCQkJCQkJICAgIHRhcmdl
dC0+c3VyZmFjZVswXS5zaXplLCAwKTsNCkkgYmVsaWV2ZSB3ZSBzaG91bGQgb3BlbiBhbGxvY2F0
b3Igd2l0aCBpYmItPnZtX2lkIHRvIGJlIGVycm9yIHByb25lLiBPdGhlcndpc2Ugd2UgbWFrZSBh
bg0KYXNzdW1wdGlvbiB0aGF0IGliYi0+dm1faWQgZW1wdHkgdXBvbiBncGdwdV9zaGFkZXJfZXhl
Yy4gV2hpY2ggbWF5IG5vdCBiZSB0cnVlLsKgDQoNClJlZ2FyZHMsDQpEb21pbmlrCQkJDQo+ICsJ
aW50ZWxfYWxsb2NhdG9yX2Nsb3NlKGFobmQpOw0KPiArDQo+ICAJaWYgKHNoZHItPmdlbl92ZXIg
Pj0gMTI1MCkNCj4gIAkJX194ZWhwX2dwZ3B1X2V4ZWNmdW5jKGliYiwgdGFyZ2V0LCB4X2RpbSwg
eV9kaW0sIHNoZHIsIHNpcCwNCj4gIAkJCQkgICAgICByaW5nLCBleHBsaWNpdF9lbmdpbmUpOw0K
PiANCg0K

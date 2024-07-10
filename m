Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E49C38150
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 05:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE8C10E5AE;
	Wed, 10 Jul 2024 05:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZBd56iV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E108510E5AE
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 05:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720590666; x=1752126666;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9c0GRbd0fNl8WCM39roo8/N66KpvJpqGkEUqa7O38LM=;
 b=LZBd56iVDkSm9LTArwq1AlKKxUndlvzae3kvmhEpwMZmRxdm+oCLxpu4
 3Lkao55Vzc3ZyN/AQc0rcSU7QKMKaP1W/gW0NrpxnZ0YwsIRmmScRoNQq
 MT9cO+L9t5y9DsTP043z+lt0UbiJIb8GD51qnUgkKbIn+BPWmUKh7qedf
 Tbx7S71TysFg1whhFOteD1Smid8v5Z4RzNwt2+SCox19w1EZA1xy4mdIw
 6HBy5Yoj/qQGBTd2gusUURAqFl8Zva1OxJqCzYTVPjgLebyY0sHSZASGX
 yD5Hr7txrZKfMfStlTseeBkIHGpGNOynzMDgGcgM/+nTLtePAk5XYiBuQ A==;
X-CSE-ConnectionGUID: tEn9w2UGQOmkJcByTg4x8A==
X-CSE-MsgGUID: 1tXMMQp/QVuxtqZRC1zMXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17995349"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="17995349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 22:51:06 -0700
X-CSE-ConnectionGUID: rf0iNpnUTWehFbmmiufEPA==
X-CSE-MsgGUID: PFjboZa8T16qPhwZ35CTYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48830738"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 22:51:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 22:51:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 22:51:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 22:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEbFg+npDOAxQEyGDgE6plhEK1Tjk2S8fTbp9/RVWAClL87TPQg90DY9qLgkHgs14B1k3VydppQBKbJKLJSrMokNeke8ta67LAN4luo5zJO+LIFK6kW+Y3lDsDUl4DuZvt5FAW/ob8y/zrmbxQoz1infUfWIBp5IEc0f4ddIOIj9Mhb2mR23CkVvCsoyBydorJ9h62EUrdWQnBNZNzYlbCns72pKxHjjoChkZRj/XRXRcqLKT6dct+YxPzrHxTnmlcM5OSKFGmcxhPfLztJ5PmzctE+/Muu8OEJG4eMO1sHikq+iONSiH6iaTcuNbxuc28FloxDfkJNvGTmIAGKL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c0GRbd0fNl8WCM39roo8/N66KpvJpqGkEUqa7O38LM=;
 b=i/mS1CxvmcwDgAslH9gHFV919Ua4OpIC0HeFINW/ahjXzdWvx34nO9nzGjOpFAhz0G2zEgjSdCr6fkm13IJZ+DdnbQEksioY/C6HQX8tvbiFrvftTNfBksfAlm2qmlH+HLhgY29kTCJpnsmcYilSAkdZ2dRmr4VTVCI2psl83FUQ3jcioxLmpTTMFd7wf+kypbYCrK15VZc5k46hKYcmMAsRrEofyFVx3tgXPJdmMC35NMgrzF62Dv9ulIWot+25WfUKbEvrNMZTo13UWV1EDX8yvOsWiD+/QakMT5JCoOIJTKfdR1d4m2CeCJLwMjhbcPHoPlS3xIDtlxQXzlXI8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Wed, 10 Jul
 2024 05:50:57 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 05:50:56 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 2/3] tests/intel/xe_pm: Extend mocs-rpm test to
 support D3Cold
Thread-Topic: [PATCH i-g-t v2 2/3] tests/intel/xe_pm: Extend mocs-rpm test to
 support D3Cold
Thread-Index: AQHa0USVEp5+DA+5gk2QzRYMRpM46LHt5V+AgABBA3CAAVFHcA==
Date: Wed, 10 Jul 2024 05:50:56 +0000
Message-ID: <MW3PR11MB4748E2835F17C3F80801A744AEA42@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240708145607.272869-1-badal.nilawar@intel.com>
 <20240708145607.272869-3-badal.nilawar@intel.com>
 <2ced9f5f-9374-44eb-ab8e-2bfc32bd1430@intel.com>
 <MW3PR11MB4748FE96B02A8301F665A922AEDB2@MW3PR11MB4748.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB4748FE96B02A8301F665A922AEDB2@MW3PR11MB4748.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SA1PR11MB7086:EE_
x-ms-office365-filtering-correlation-id: ebfcb524-1ab6-4437-d91a-08dca0a444c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SDdzcXdNTGYrOUZLSlNsbE9ZN094SXJNOVBHbkVRRlJiYkZWOGJYeGNKbFJX?=
 =?utf-8?B?eFZGaHY1TXV0RWlxTGpvRnBpN2MwN3V3aUN4YzVaR0x3RnJ1S0IzRWlEQ2dj?=
 =?utf-8?B?UUo4bVJlRXgzazI1ellENXh3Y3NiUFlVTng0M1hCc1VFTnJmcGorZllFQVI5?=
 =?utf-8?B?dFpKWHoyU2o2OVdPdjhiYy80cUtBdCsxOXVqZ0d4Qnh5T01Ud2Q2MU9xb1pP?=
 =?utf-8?B?OVFlaUFWUWtVSWpNUDVoUkMweXJhUzlEUldMTXhlV3lTallORjBTN09CNTR6?=
 =?utf-8?B?elpnMW1aOG9hM3JSVGlaMi9xdkJhY1F1T2pvbVRWOTkzYzNsZEVESUJNVnU3?=
 =?utf-8?B?Wm52MU5KWWpFY0J4V0FsYmZtd2dyVndhT1ZjaElzWFEyamhYc25OYWx3cXd3?=
 =?utf-8?B?YWthRytJVEZ3b1g4YUZjQ1hpWVlqOGtVbTFyQmF0TkFhZzRkcytmMThjeTR4?=
 =?utf-8?B?a2VLanZoNis2SkFFa05GQ3gzcHVSU0IzM3lzRFNyZnBWRFUydlIrWHJLNWJt?=
 =?utf-8?B?UEhYT3cvN2Y4RTFyWE8wSmx5TXFkZU5PZk9zczFnZjI0bmFOS1V4MGRtVWRT?=
 =?utf-8?B?aU01bVUvdTZMeE1wOVkrVGNuMFJzN0R4YWNwaUVHQ2dRQ2NiM1ptYWVjS2FZ?=
 =?utf-8?B?amZQTk5pUENMWm5MSXdUbmxKWG55cEw3ajBNTWFVTm13dVpyNDM4RGtmdE1M?=
 =?utf-8?B?eXFHNEtGRGFKWDBrcUdiYnVQdlowWklaa3JMYzZrNUg5MW1GNUk3OFUzU280?=
 =?utf-8?B?RUxuOUJSallWSWRYMldtNTFMOFFGTGtneC9PSk9aQ0pqWDE5SVB1QzZWMGVW?=
 =?utf-8?B?MnczcGo5S2VsYjJTaE0zTXZOYkkxd1czOUJmSVhWcnRDN2dxQWNwWTBnMVc4?=
 =?utf-8?B?RzJZVmhGcjdzaFR4b2NEZyswRkMyM2trN0h4MnhXbUNvOGRsdVorM0NjcjJj?=
 =?utf-8?B?bmFWb0RNV2xXdnJlMTEwM0lKSjBNelFiSEkyL2lUOVdXVGRiWituemNWcHF0?=
 =?utf-8?B?RjRFN3lNb3M0UFVTVEVaZFZ3eWF2R3lkZGUvQjh0OU44SSs1VitHYXhmcWFz?=
 =?utf-8?B?Qlg5WkNHZE8yOEQ0R011cXdzcnRZNkdrSVJkeXVWazB1bHN4Rndaai9xSHgz?=
 =?utf-8?B?bWkxYzB4Vyt5M3Y5TWFUZ1c4amd3UVptYjcyaURmaEEvVXdBRnE5dHZpTGs3?=
 =?utf-8?B?WmV2ZThVRkRDelJmMjFNb1c1YmM0aUM5NUtVVTZkUVlvdTdaZUpFWG9Md0pm?=
 =?utf-8?B?RUtSWXhiOHlXSVZNNDFBWnJmNlFZaUNiQW1kRlBycmtnRm5RWWQ4cEpReTBq?=
 =?utf-8?B?RXcvRy9XY0RXRzVDdVYvQXhnUXRpRkpQMFZuQjhlbnRqUXNUd2paMndmT21m?=
 =?utf-8?B?YmJCcHV1VlVUQlFSYUtoYXZ4bmp5Y3gySUhhQUJXcXJyYWo5U3ZlOGZhODFo?=
 =?utf-8?B?OFZZdGdGLzlza1MrWGhxY2R2QzNmTEZ2Y1RXQ2JhU2o5MVI5aEZZb3lIN0Z1?=
 =?utf-8?B?cGVEc0xlbk4vSGt6aGxuaFNuLytWYkFFUjV4cTNLUy9QUnZPMi8rVkZrTUVy?=
 =?utf-8?B?RUEzR2M4LzdUTkYzc1Z1SitxK3d2WjVISEJEZXZvTGhwWnE5NC90dVNiaUNa?=
 =?utf-8?B?enIrT01JWWoyb3dlR2x0VmtGQmxubTd5MTZ6d0x2NHFPUXlZdXZNaGxHQlI5?=
 =?utf-8?B?QXdKdmFkejBEbmIrMmQ3ZUJSekJUeDVvQWU4anZWcjAvbzRndURqKzV5VVZt?=
 =?utf-8?B?L2VSTy9iYklEb2Z6U0ZDMVJRKytPTHY5dHQyT1RnSUZmV2h4UjZDTVU4VllV?=
 =?utf-8?B?M3pOUTMvSTRTTEpGeTRzdW5maXZEYXFCcUNhQzFxOEduOUZjVDJrVWZmblcw?=
 =?utf-8?B?VVloTng5dm9NMUUwZHdMRGw3WDNoMUdDRElmNE1oNDE3V2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnA3ZTJqM2V6ZnZoMm1ET3RPQ3M2U3U4cG42Y3k0YUkvbUtjTU1EZ2hCaVhz?=
 =?utf-8?B?SjlPL1d4V21TNHRod0NLYUYvZGhMVDVGYUpUVm1QVjdyYUxlOXJhTmphZXRH?=
 =?utf-8?B?VFFVamMwYzJ0eWZHT21GbFpQbGdlMVdQRzg0TWpDU0dHS29sYm5oQkpzdENv?=
 =?utf-8?B?a25nYUpDMFMwdHVkbGpTMThHWlpDSHY1N0hzcHBWTExxTk1leGFYK0EzNlJm?=
 =?utf-8?B?a2R3NVN0VEhPem5uMXNxUGsvL3MrWjZwS3pDV0pCSFdjK0xoV1A3ZVp5eFI2?=
 =?utf-8?B?OXptM29vcTEyeTlyYWVVV2hkQjU2eUJ1NHNqUEFGRmhqaVhXQjU3UmQyaE9C?=
 =?utf-8?B?dWRFZWxhTlFvTHMvcmg0UElkVzB3N3ludTFVdzNGN0JMUnNtejBMRWR3T0xu?=
 =?utf-8?B?UkliclBtV2hqMVN1OTJzT1BnOFRUQWRiLzdQY0NnRkFQQjExdWNMUElQWlZG?=
 =?utf-8?B?bGVNR29mOXJvSGl3c3E0NTlVY2gwS0haU0NLNnRCNitmaDZERUNQOFhtN2lH?=
 =?utf-8?B?dnZIYzQzSmJxRGJXU0Z3TmQvaWZ1d1FiV013VE8wMHZKOEdTRklxWFoza2Nq?=
 =?utf-8?B?TjM0b25iOGJwVDBibEZyaG9TZFdrTmVkTXh3WG0vU0MxNFJhVFdvNmJkYnVQ?=
 =?utf-8?B?MGIvNGVYNHdXUnB1Z0hweEVkTkJiV1Q3dTNYRlN0b2N6Q3NmQVNCVlM0cmVK?=
 =?utf-8?B?YklIeXBrMVdwTmxIWWRSc2VTbmlidjM1dHJobTFuakVTV3RTeUNhWFlHYXB6?=
 =?utf-8?B?WlAwczc5Q05CR1dyMjkvbnkyS3JvUGhqWTRUNmo2djF3eVU4L05zanRPcnRT?=
 =?utf-8?B?QzhldGJxWFhFRWk4SExXUVI1NjU2SGtldythMFN6VlU0OTBtM3lCMldvWk8z?=
 =?utf-8?B?bHNkTy9QZXlZY1U0VWhvUk1Udzc5Z2NVbURXaUJKWklXM3JSZXRzQUxVZE5I?=
 =?utf-8?B?eHovR0lRaHVmVWlOeVE1ZlcvTVZBUGsyTk03MkNHa2NNbUFUMG1XR25hekVP?=
 =?utf-8?B?bVVldS9uemJSak5XL0p4OFhzOG5MYXR1Q2xQNUJjdUd5RTRoaTViMkhlOHND?=
 =?utf-8?B?WnF2YVMvZlRiWVdrN1p6UnJOZzJUNjVwNnNOc09pOXpwQjFwWFJwZmQxcFhX?=
 =?utf-8?B?dEI1VmpLdFRFazhmcURMQUJqUS93am5mWFptKzd1UjRSdDMxOWFKRlRMWURQ?=
 =?utf-8?B?dzR4Yyt5TTdvaGZJVDNzVjBvNjJ1VnJpM2piQ0k1WWt4Vkd6c0pCemxCSG9H?=
 =?utf-8?B?c2JaYTcxNjg3b3IvV2cvYzRieElJcE9KaHg2MW5RR24vckkzcWtObTdRenFB?=
 =?utf-8?B?ckIvV2xCN00yTjJUMDNpb2Q3VVlHNDJvTjlHQU9pUWpFSlV6ZnoyT3ZvRm5j?=
 =?utf-8?B?WFJLODRwd1pjM2grT05SNWlVQ05JSHlzY1doaXY5L2UwOXdNUW9nTEVQTU1U?=
 =?utf-8?B?RDY3VXdxV1dmSnd1WEhoU2hremM2Uit5UXlKWDU0Y2E5S0hPYzM0eEswNXhy?=
 =?utf-8?B?eGVaVmJ4QzlWdnVxUjdZYlB0L2xtMHAvTTJlVnV0Ry83RUpvWUVmUDFRN1Vt?=
 =?utf-8?B?aVlFSjV3R2lEYUFibGNvMHFkcnZUSkwrbXl1UDRZVFYyZHcvK2RPQXpEKzFK?=
 =?utf-8?B?K0dTVzBMNEdhQlZ2TFIxMm1RekVHZzJRZHhsZlFlbytpbHJJeHBWTGNiSUQ1?=
 =?utf-8?B?K3NJY2hHcjA3N0xxZC9SZTdTd3RiMVVSNDk3c1M2T00yRWxTUmNkZndFVGgy?=
 =?utf-8?B?QTFHOWRNWXdtcHJkaU9WZzNNa2xnL0x1Z3dWVllSeGovSThlakV4VHcwZU5W?=
 =?utf-8?B?aEFQQk12KzBjOEJkNVJXT3o5ZEZISHIwQ0RRZzhIRGIyNDgzUTZTMEVDNHQy?=
 =?utf-8?B?VkkvSkxMbVJTazkzb1hyR1hnYmRRbms5SlBTSFN6U0NPSzlCeXVnamZ0Q3BU?=
 =?utf-8?B?WW1DaVoxS0ZBVVd0TEJqbkJ5ZTJ3MzVibXhrbXcyWnlMa0lrSklaUkhVcW5M?=
 =?utf-8?B?ZDNRcldCVS9paEZBUTBBV2loYVhabllGYnV1TW5VZGNrZXdSMDF6VlNnUzA2?=
 =?utf-8?B?RGp5RmtISm5KRGpTSmZ3RWNYWktDQmpLd2VaK2dVZlJCeWszNVI5ZTNKYmJp?=
 =?utf-8?B?NmI4UERibUlWUkZDblJmZjY1VGxNem9ZSGNudndPM2pTWERYWnNrcHVDY2x4?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfcb524-1ab6-4437-d91a-08dca0a444c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 05:50:56.7925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZ8OVTGE9bhXOFGUX1BtHs7pznOdiI7Sy4T9o8p34+9nf0BiajOhV3+lEQfsvfNJdLDqxyyUmD4ZCb8BzgFycn07VyWKSF/MYXgD0Kuttog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
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

TEdUTSwNClJldmlld2VkLWJ5OiBKYW5nYSBSYWh1bCBLdW1hciA8amFuZ2EucmFodWwua3VtYXJA
aW50ZWwuY29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1k
ZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBL
dW1hciwNCj4gSmFuZ2EgUmFodWwNCj4gU2VudDogVHVlc2RheSwgSnVseSA5LCAyMDI0IDM6MTQg
UE0NCj4gVG86IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1cm9AaW50ZWwuY29tPjsgTmlsYXdhciwg
QmFkYWwNCj4gPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBr
YW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggaS1n
LXQgdjIgMi8zXSB0ZXN0cy9pbnRlbC94ZV9wbTogRXh0ZW5kIG1vY3MtcnBtIHRlc3QgdG8NCj4g
c3VwcG9ydCBEM0NvbGQNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+IEZyb206IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0KPiA+IFNl
bnQ6IFR1ZXNkYXksIEp1bHkgOSwgMjAyNCAxMToyMSBBTQ0KPiA+IFRvOiBOaWxhd2FyLCBCYWRh
bCA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+Ow0KPiA+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4gQ2M6IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBL
dW1hciwgSmFuZ2EgUmFodWwNCj4gPiA8amFuZ2EucmFodWwua3VtYXJAaW50ZWwuY29tPjsga2Ft
aWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbQ0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1n
LXQgdjIgMi8zXSB0ZXN0cy9pbnRlbC94ZV9wbTogRXh0ZW5kIG1vY3MtcnBtDQo+ID4gdGVzdCB0
byBzdXBwb3J0IEQzQ29sZA0KPiA+DQo+ID4NCj4gPg0KPiA+IE9uIDcvOC8yMDI0IDg6MjYgUE0s
IEJhZGFsIE5pbGF3YXIgd3JvdGU6DQo+ID4gPiBFeHRlbmQgbW9jcyBycG0gdGVzdCB0byBzdXBw
b3J0IEQzQ29sZCB1c2luZyBleGlzdGluZyBkMyBoZWxwZXJzLg0KPiA+IHN1cHBvcnQgRDMgc3Rh
dGVzDQo+ID4gPg0KPiA+ID4gdjI6IFVwZGF0ZSBkb2N1bWVudGF0aW9uL2Rlc2NyaXB0aW9uIChS
aWFuYSkNCj4gPiA+DQo+ID4gPiBDYzogamFuZ2EucmFodWwua3VtYXJAaW50ZWwuY29tDQo+ID4g
Q2MgZm9ybWF0IGlzIG5vdCBjb3JyZWN0DQo+ID4NCj4gPiBXaXRoIHRoZSBhYm92ZSBjb21tZW50
cyBmaXhlZA0KPiA+IFJldmlld2VkLWJ5OiBSaWFuYSBUYXVybyA8cmlhbmEudGF1cm9AaW50ZWwu
Y29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFkYWwgTmlsYXdhciA8YmFkYWwubmlsYXdhckBp
bnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgdGVzdHMvaW50ZWwveGVfcG0uYyB8IDYwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+
ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3BtLmMgYi90ZXN0cy9pbnRlbC94ZV9wbS5j
IGluZGV4DQo+ID4gPiBiMzBlOTRhMmEuLjhiMTE1ZTJmNiAxMDA2NDQNCj4gPiA+IC0tLSBhL3Rl
c3RzL2ludGVsL3hlX3BtLmMNCj4gPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3BtLmMNCj4gPiA+
IEBAIC02MTAsMjggKzYxMCwyOCBAQCBzdGF0aWMgdm9pZCB0ZXN0X21tYXAoZGV2aWNlX3QgZGV2
aWNlLA0KPiA+ID4gdWludDMyX3QNCj4gPiBwbGFjZW1lbnQsIHVpbnQzMl90IGZsYWdzLA0KPiA+
ID4gICAJY2xvc2UoZndfaGFuZGxlKTsNCj4gPiA+ICAgfQ0KPiA+ID4NCj4gPiA+IC0vKioNCj4g
PiA+IC0gKiBTVUJURVNUOiBtb2NzLXJwbQ0KPiA+ID4gLSAqIERlc2NyaXB0aW9uOg0KPiA+ID4g
LSAqICAgICBWYWxpZGF0ZSBtb2NzIHJlZ2lzdGVyIGNvbnRlbnRzIG92ZXIgc3VzcGVuZCByZXN1
bWUNCj4gPiA+IC0gKg0KPiA+ID4gLSAqIEZ1bmN0aW9uYWxpdHk6IG1vY3MgcmVnaXN0ZXJzDQo+
ID4gPiAtICogUnVuIHR5cGU6IEZVTEwNCj4gPiA+IC0gKi8NCj4gPiA+ICAgLyoqDQo+ID4gPiAg
ICAqIFNVQlRFU1Q6ICVzLW1vY3MNCj4gPiA+IC0gKiBEZXNjcmlwdGlvbjogdGVzdCBjaGVja3Mg
Zm9yIG1vY3Mgc3RhdGUgYmVmb3JlIGFuZCBhZnRlciAlYXJnWzFdDQo+ID4gPiBzdGF0ZQ0KPiA+
ID4gLSAqIEZ1bmN0aW9uYWxpdHk6IHBtIC0gJWFyZ1sxXQ0KPiA+ID4gKyAqIERlc2NyaXB0aW9u
OiBWYWxpZGF0ZSBjb250ZW50cyBvZiBtb2NzIHJlZ2lzdGVycyBvdmVyIHN1c3BlbmQNCj4gPiA+
ICsgcmVzdW1lDQo+ID4gPiArICogRnVuY3Rpb25hbGl0eTogcG1fc3VzcGVuZA0KPiA+ID4gICAg
Kg0KPiA+ID4gICAgKiBhcmdbMV06DQo+ID4gPiAgICAqDQo+ID4gPiAgICAqIEBzMmlkbGU6CXMy
aWRsZQ0KPiA+ID4gICAgKiBAczM6CQlzMw0KPiA+ID4gICAgKiBAczQ6CQlzNA0KPiA+ID4gKyAq
DQo+ID4gPiArICogQGQzaG90OglkM2hvdA0KPiA+ID4gKyAqIEBkM2NvbGQ6CWQzY29sZA0KPiA+
ID4gICAgKi8NCj4gPiA+IC1zdGF0aWMgdm9pZCB0ZXN0X21vY3Nfc3VzcGVuZF9yZXN1bWUoZGV2
aWNlX3QgZGV2aWNlLCBpbnQgc19zdGF0ZSkNCj4gPiA+ICtzdGF0aWMgdm9pZCB0ZXN0X21vY3Nf
c3VzcGVuZF9yZXN1bWUoZGV2aWNlX3QgZGV2aWNlLCBlbnVtDQo+ID4gaWd0X3N1c3BlbmRfc3Rh
dGUgc19zdGF0ZSwNCj4gPiA+ICsJCQkJICAgICBlbnVtIGlndF9hY3BpX2Rfc3RhdGUgZF9zdGF0
ZSkNCj4gPiA+ICAgew0KPiA+ID4gICAJaW50IGd0Ow0KPiA+ID4gKwl1aW50NjRfdCBhY3RpdmVf
dGltZTsNCj4gPiA+ICsJYm9vbCBjaGVja19ycG0gPSAoZF9zdGF0ZSA9PSBJR1RfQUNQSV9EM0hv
dCB8fA0KPiA+ID4gKwkJCSAgZF9zdGF0ZSA9PSBJR1RfQUNQSV9EM0NvbGQpOw0KPiA+ID4gKw0K
PiA+ID4NCj4gPiA+ICAgCXhlX2Zvcl9lYWNoX2d0KGRldmljZS5mZF94ZSwgZ3QpIHsNCj4gPiA+
ICAgCQljaGFyIHBhdGhbMjU2XTsNCj4gPiA+IEBAIC02MzksMjQgKzYzOSwzNCBAQCBzdGF0aWMg
dm9pZCB0ZXN0X21vY3Nfc3VzcGVuZF9yZXN1bWUoZGV2aWNlX3QNCj4gPiBkZXZpY2UsIGludCBz
X3N0YXRlKQ0KPiA+ID4gICAJCS8vIE1vY3MgZGVidWdmcyBjb250ZW50cyBiZWZvcmUgYW5kIGFm
dGVyIHN1c3BlbmQtcmVzdW1lDQo+ID4gPiAgIAkJY2hhciBtb2NzX2NvbnRlbnRfcHJlWzQwOTZd
LCBtb2NzX2NvbnRlbnRzX3Bvc3RbNDA5Nl07DQo+ID4gPg0KPiA+ID4gKwkJaWd0X2RlYnVnKCJS
dW5uaW5nIG9uIEdUJWRcbiIsIGd0KTsNCj4gPiA+ICsNCj4gPiA+ICAgCQlzcHJpbnRmKHBhdGgs
ICJndCVkL21vY3MiLCBndCk7DQo+ID4gPiAgIAkJaWd0X2Fzc2VydChpZ3RfZGVidWdmc19leGlz
dHMoZGV2aWNlLmZkX3hlLCBwYXRoLCBPX1JET05MWSkpOw0KPiA+ID4gICAJCWlndF9kZWJ1Z2Zz
X2R1bXAoZGV2aWNlLmZkX3hlLCBwYXRoKTsNCj4gPiA+ICAgCQlpZ3RfZGVidWdmc19yZWFkKGRl
dmljZS5mZF94ZSwgcGF0aCwgbW9jc19jb250ZW50X3ByZSk7DQo+ID4gPg0KPiA+ID4gLQkJaWYg
KHNfc3RhdGUgPT0gTk9fU1VTUEVORCkgew0KPiA+ID4gKwkJaWYgKGNoZWNrX3JwbSkgew0KPiA+
ID4gKwkJCWlndF9hc3NlcnQoaW5fZDMoZGV2aWNlLCBkX3N0YXRlKSk7DQo+ID4gPiArCQkJYWN0
aXZlX3RpbWUgPQ0KPiA+IGlndF9wbV9nZXRfcnVudGltZV9hY3RpdmVfdGltZShkZXZpY2UucGNp
X3hlKTsNCj4gPiA+ICsNCj4gPiA+ICAgCQkJZndfaGFuZGxlID0gaWd0X2RlYnVnZnNfb3Blbihk
ZXZpY2UuZmRfeGUsDQo+ID4gImZvcmNld2FrZV9hbGwiLCBPX1JET05MWSk7DQo+ID4gPiAgIAkJ
CWlndF9hc3NlcnQoZndfaGFuZGxlID49IDApOw0KPiA+ID4gLQkJCWlndF9hc3NlcnQoaWd0X2dl
dF9ydW50aW1lX3BtX3N0YXR1cygpID09DQo+ID4gSUdUX1JVTlRJTUVfUE1fU1RBVFVTX0FDVElW
RSk7DQo+ID4gPiArDQo+ID4gCWlndF9hc3NlcnQoaWd0X3BtX2dldF9ydW50aW1lX2FjdGl2ZV90
aW1lKGRldmljZS5wY2lfeGUpID4NCj4gPiA+ICsJCQkJICAgYWN0aXZlX3RpbWUpOw0KPiA+ID4N
Cj4gPiA+ICAgCQkJLyogTWFrZSBzdXJlIHJ1bnRpbWUgcG0gZ29lcyBiYWNrIHRvIHN1c3BlbmRl
ZA0KPiA+IHN0YXR1cyBhZnRlciBjbG9zaW5nIGZvcmNld2FrZV9hbGwgKi8NCj4gPiA+ICAgCQkJ
Y2xvc2UoZndfaGFuZGxlKTsNCj4gPiA+IC0NCj4gPiAJaWd0X2Fzc2VydChpZ3Rfd2FpdF9mb3Jf
cG1fc3RhdHVzKElHVF9SVU5USU1FX1BNX1NUQVRVU19TVVNQRQ0KPiA+IE5ERUQpKTsNCj4gPiA+
ICsJCQlzbGVlcCgxKTsNCj4gPiA+ICsNCj4gPiA+ICsJCQlpZ3RfYXNzZXJ0KGluX2QzKGRldmlj
ZSwgZF9zdGF0ZSkpOw0KPiA+ID4gICAJCX0gZWxzZSB7DQo+ID4gPiAtCQkJZW51bSBpZ3Rfc3Vz
cGVuZF90ZXN0IHRlc3QgPSBzX3N0YXRlID09DQo+ID4gU1VTUEVORF9TVEFURV9ESVNLID8NCj4g
PiA+IC0JCQkJU1VTUEVORF9URVNUX0RFVklDRVMgOg0KPiA+IFNVU1BFTkRfVEVTVF9OT05FOw0K
PiA+ID4gKwkJCWlmIChzX3N0YXRlICE9IE5PX1NVU1BFTkQpIHsNCj4gPiA+ICsJCQkJZW51bSBp
Z3Rfc3VzcGVuZF90ZXN0IHRlc3QgPSBzX3N0YXRlID09DQo+ID4gU1VTUEVORF9TVEFURV9ESVNL
ID8NCj4gPiA+ICsJCQkJCVNVU1BFTkRfVEVTVF9ERVZJQ0VTIDoNCj4gPiBTVVNQRU5EX1RFU1Rf
Tk9ORTsNCj4gPiA+DQo+ID4gPiAtCQkJaWd0X3N5c3RlbV9zdXNwZW5kX2F1dG9yZXN1bWUoc19z
dGF0ZSwgdGVzdCk7DQo+ID4gPiArCQkJCWlndF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVzdW1lKHNf
c3RhdGUsDQo+ID4gdGVzdCk7DQo+ID4gPiArCQkJfQ0KPiA+ID4gICAJCX0NCj4gPiA+ICAgCQlp
Z3RfYXNzZXJ0KGlndF9kZWJ1Z2ZzX2V4aXN0cyhkZXZpY2UuZmRfeGUsIHBhdGgsIE9fUkRPTkxZ
KSk7DQo+ID4gPiAgIAkJaWd0X2RlYnVnZnNfZHVtcChkZXZpY2UuZmRfeGUsIHBhdGgpOyBAQCAt
NzY2LDcgKzc3Niw3IEBADQo+ID4gaWd0X21haW4NCj4gPiA+ICAgCQl9DQo+ID4gPg0KPiA+ID4g
ICAJCWlndF9zdWJ0ZXN0X2YoIiVzLW1vY3MiLCBzLT5uYW1lKQ0KPiA+ID4gLQkJCXRlc3RfbW9j
c19zdXNwZW5kX3Jlc3VtZShkZXZpY2UsIHMtPnN0YXRlKTsNCj4gPiA+ICsJCQl0ZXN0X21vY3Nf
c3VzcGVuZF9yZXN1bWUoZGV2aWNlLCBzLT5zdGF0ZSwNCj4gPiBOT19SUE0pOw0KPiA+ID4gICAJ
fQ0KPiA+ID4NCj4gPiA+ICAgCWlndF9maXh0dXJlIHsNCj4gPiA+IEBAIC04MjUsNiArODM1LDE0
IEBAIGlndF9tYWluDQo+ID4gPg0KPiA+ID4gICAJCQlpZ3RfcG1fc2V0X2F1dG9zdXNwZW5kX2Rl
bGF5KGRldmljZS5wY2lfeGUsDQo+ID4gZGVsYXlfbXMpOw0KPiA+ID4gICAJCX0NCj4gPiA+ICsN
Cj4gPiA+ICsJCWlndF9kZXNjcmliZV9mKCJWYWxpZGF0ZSB0aGUgY29udGVudHMgb2YgbW9jcyBy
ZWdpc3RlcnMgb3ZlciAlcw0KPiA+IHN0YXRlIiwgZC0+bmFtZSk7DQo+ID4gPiArCQlpZ3Rfc3Vi
dGVzdF9mKCIlcy1tb2NzIiwgZC0+bmFtZSkgew0KPiA+ID4gKwkJCWlndF9hc3NlcnQoc2V0dXBf
ZDMoZGV2aWNlLCBkLT5zdGF0ZSkpOw0KPiA+ID4gKwkJCXRlc3RfbW9jc19zdXNwZW5kX3Jlc3Vt
ZShkZXZpY2UsIE5PX1NVU1BFTkQsIGQtDQo+ID4gPnN0YXRlKTsNCj4gPiA+ICsJCQljbGVhbnVw
X2QzKGRldmljZSk7DQo+ID4gPiArCQl9DQo+ID4gPiArDQo+ID4gPiAgIAl9DQo+ID4gPg0KPiA+
ID4gICAJaWd0X2Rlc2NyaWJlKCJWYWxpZGF0ZSB3aGV0aGVyIGNhcmQgaXMgbGltaXRlZCB0byBk
M2hvdCwiDQo+ID4gPiBAQCAtODM1LDEyICs4NTMsNiBAQCBpZ3RfbWFpbg0KPiA+ID4gICAJCXRl
c3RfdnJhbV9kM2NvbGRfdGhyZXNob2xkKGRldmljZSwgc3lzZnNfZmQpOw0KPiA+ID4gICAJfQ0K
PiA+ID4NCj4gPiA+IC0JaWd0X3N1YnRlc3QoIm1vY3MtcnBtIikgew0KPiA+ID4gLQkJZHBtc19v
bl9vZmYoZGV2aWNlLCBEUk1fTU9ERV9EUE1TX09GRik7DQo+ID4gPiAtCQl0ZXN0X21vY3Nfc3Vz
cGVuZF9yZXN1bWUoZGV2aWNlLCBOT19TVVNQRU5EKTsNCj4gPiA+IC0JCWRwbXNfb25fb2ZmKGRl
dmljZSwgRFJNX01PREVfRFBNU19PTik7DQo+ID4gPiAtCX0NCj4gPiA+IC0NCj4gPiA+ICAgCWln
dF9maXh0dXJlIHsNCj4gPiA+ICAgCQljbG9zZShzeXNmc19mZCk7DQo+ID4gPiAgIAkJaWd0X3Bt
X3NldF9kM2NvbGRfYWxsb3dlZChkZXZpY2UucGNpX3Nsb3RfbmFtZSwNCj4gPiBkM2NvbGRfYWxs
b3dlZCk7W0phbmdhIFJhaHVsIEt1bWFyDQo=

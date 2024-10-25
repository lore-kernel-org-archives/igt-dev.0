Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC71D149D8
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 17:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AD110EB23;
	Fri, 25 Oct 2024 17:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIxlxd2r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A9310EB23
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729877786; x=1761413786;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w9YCLDH0ccBDyv1RUOofAatxN5AAKuMC9Apr/rq2CrQ=;
 b=JIxlxd2riFS7zKCkMEI6eKCpGtFfZIOvzDgXVH+hOWQEKVLkDj1YoY6+
 0uSPE7ex2kh7p9CpHJDU2m4GVHrEYuziVWmpG7+2Yom3D7Me+GyHLaFKD
 8f4z616A/XEiWVyrQhUrIUxfmsQwpktFDQ+Sft5zsnJgbGLCu240AkN4O
 Rf+coQeyR+h2kirrsbsJ1AKmpENEg9YoTjbpCE9KgkVDhHvS62L1lrtTG
 Ke0HdD21pOBPQhc1N6qLJQvJP2A1zGqFqVaBidwegBjygPVgkyh4SHGhr
 //dieI7Gios7SE2fiuKrEhN805e/qMNRPyUyGZZRu043tEkBFrvFX5GsV A==;
X-CSE-ConnectionGUID: ycADZDtuS3Oz2iJJmU84QA==
X-CSE-MsgGUID: Yi4TYAMSStiZlhVx9fqf3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29664318"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="29664318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:36:26 -0700
X-CSE-ConnectionGUID: oQZDe+t2Q4adV40zq65p2A==
X-CSE-MsgGUID: XPlpY4FzT0mGO+NzkWLfNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="86082729"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 10:36:26 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 10:36:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 10:36:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 10:36:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnSj9izagpfAcxcwdWzJOTQbeZFn4WGwy6p1fee5m+0KuLFW3qlj8uS+XrWhsyV0TOzG1Zndzppbidbi6fnbnAOKq2XlymHWoQOTYoszrDkcIBPP3zBgL7YKvo0bFIaaK6OvCK4AYuhytMQA7szbzV/OQ7iQu2mMhYq3w9rPwUVMSSLNRMrlf2+6UE0120ZOr/hZ+ybrWQ7Pkz22Y2hIn2MDL3fw3EqxDouRFh8bmrfxHNP/lwjqFnfXwFVk4xEju00825ZDUYSpIY9AuJoBTLpgI3TM8zz6Kx1uEy/2mDt286oNB77TZQoRMnY0ZmQ80f27k/Rrh4QAimP6fxRQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9YCLDH0ccBDyv1RUOofAatxN5AAKuMC9Apr/rq2CrQ=;
 b=x9u98PErHqIAO1t93xFOA/+hHTIkLlARp7sVbs38f72fCXVk8Vpa6o6tWhDuQuI2RzOEb96BHUrYgcpEHCtV5iw70Ya2qUYbFkn35rxr7U3UQMlu8RBx6bgVlwbxf5a/7RK4vDtAO7/jKINSLIJtdyDWSIjo45wNSw3sWpc76WXE5E6CO61IgwgXAfY8ScfhZbrzswkb7e59CoU0GL2gDJVP+I0z7yM87TrVyyWXEf3VDDRBN+OG/ZhGDevqyE6KM2OJ2UUr6YhD3NIWrsVZu0DvAaYvFxjHlaIwlLJHWp1E8TQCGqdU0wssK2zgg9gy8MFZB4LVc/mJk2S8oBolIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 17:36:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 17:36:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/intel/xe_wedged: Ignore more dmesg
 warnings
Thread-Topic: [PATCH i-g-t v1 1/2] tests/intel/xe_wedged: Ignore more dmesg
 warnings
Thread-Index: AQHbJwEq2unndefoQ0OgPRVU35nxh7KXtR6Q
Date: Fri, 25 Oct 2024 17:36:21 +0000
Message-ID: <CH0PR11MB54446242D892790759C7D6D6E54F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241025171240.114267-1-kamil.konieczny@linux.intel.com>
 <20241025171240.114267-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241025171240.114267-2-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7431:EE_
x-ms-office365-filtering-correlation-id: 821233df-a01b-48c0-2aed-08dcf51b8a48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RTJ6d051ck8yNjdvS0VQMXFaWGhnSDZrcEhwN0xFUzBLcm1jSTRMK0xBVjZ6?=
 =?utf-8?B?Ym9YL3ZEeXhLam1wZEQxcWxObzZnaTNDMWxxelAzNHdObFdpaENJalVhc2xX?=
 =?utf-8?B?ZlZETms1a2pkMzRwclRubWRwcHpUeEx2UHVSVWl4QkVUU1pQbU1TZTBiNWJI?=
 =?utf-8?B?UGthb2doQVNtWUMrOVMwRmxQTEdKWm40bTIxZzZPRjQ1MmFTQzZBQ1BKMGxa?=
 =?utf-8?B?M0YwY1J2aHRML2ZWWVo0b2tQZHJXemc2VE04NGJQZjRRUnRlbXVvNmlTNFcy?=
 =?utf-8?B?VVZHc0FKazJoSnJmaFZxTTJUNXBCdnUweHVMeU52d01ZNDdQU0pKeHN1S2xz?=
 =?utf-8?B?dWNHWTVRZWhMeWphMllibEEwRGZqZmdlNHYvZnVmV2VEOWpxQ0NzZmNDSjZM?=
 =?utf-8?B?c3ZMRTZFaVdCdkNab1NkWm05VnhzZjcrNHhaeElINkZkdGtZYTUxcm8xY1lJ?=
 =?utf-8?B?b3ZKZmhDUE5Uem8rUXovTXRzMzd2U2Y5TnA4UUp3UDhuMVRvYjgrY3FrZnp0?=
 =?utf-8?B?SUZOcWthTFlLdUVHTjV5YXRzcmVLYkJaRm1JN1dJTU93YzZYU2RjU29DY0lR?=
 =?utf-8?B?MVRxRWs5U21mbUxzU2RySzEwckxZSTFLcld0VnR2WGRRYjNoZEV6ZGdlaHhH?=
 =?utf-8?B?cUI3SEZaUCtEZWZrQ05qNVhMVGRxa1BmczhGWldvVEV6RVR4TWFraDVTU2ts?=
 =?utf-8?B?dzFQKzhBM05qYjJOKzUvaDU4Vzg0V3QrdkNaeUlTY3ZtMFdUNHdGdmpOZERz?=
 =?utf-8?B?SE1SdlU1U3Qyb2JPU3lyVEJOSGtmRTUzNWJNck14Q3cvL0V0S1ZwU3ZNenN4?=
 =?utf-8?B?dm5UUnVPQ3Z4eHg0akxGcXlrUWg3aVdHcVB1dkpOOXpsc2w5R0N3b0RKWmRs?=
 =?utf-8?B?WjJCVDJjRlJmd1NVdjcxdEtqUGdueW4xeThKTFRzRXBlUmVqNnE1M2UvOHZT?=
 =?utf-8?B?U1BvRmRmV2tuMWJkSGRzdERaa3ZLc2JZL2lZZ3BiZGxpWkgxdDVMSkhVNnhC?=
 =?utf-8?B?VVowMnFCWmo5OExySEQ1b3p1V0liRjQwQkpLVkorNVA4NFA0WGlpclc3WUF4?=
 =?utf-8?B?UXI3aGVIOHBZVWJHUkRveVhOZ0pxV25LWlZ2Qjh5Q2lDVHJCcXRFVzZUWm5F?=
 =?utf-8?B?U0ZJUWw4RWhEbkVrTHVZVk8rN3Jxazl2T3B2WHdnME5YbnVyRWk0Yzh1ZVM0?=
 =?utf-8?B?d0gwWlFwNnlrbC8vbHlTUU9JUTZJYldBdnZMWS9JRlBEL0pjTTkrbmVHTm9m?=
 =?utf-8?B?MldJaEgwQW1vamh4MnF1SU05NlhLd0RkWDJ3ZWk2Z2NoWi9RbFN1V09FUWQv?=
 =?utf-8?B?OGNlVDJPNEFpUFpUTGpRR0Z6MVhJUTA4QTBDZFdFeTdGNnpGbkx2WGwyUG9N?=
 =?utf-8?B?T3VZUkFIVjdtQkUxZWt2WGtIYis1cmx2ZHVJK1ZvODZuUk0xL2wzNXdERGdG?=
 =?utf-8?B?Mkphd3VuRXZpcE9nOUJob0JaQzZLeGNtTXBmakY3REZRdk9yYVZnN2EyVWpD?=
 =?utf-8?B?WUtXb1lWVmJkOGhKK3hqMUlRWlJlOHBCTzNOOEJLR0tKRFFoM3NBbFVycGF2?=
 =?utf-8?B?L3AzSmRsQU1IVFMrNThQN2VESnAvRDNxSWVxYnBUUmUzV29jemtLZVZsQ3Fx?=
 =?utf-8?B?VXZkcURHdmpjc2d5Uy85M3ZMbG9yNnR1T1JpaFlJQ3FMcVNReStSRXpNdjY2?=
 =?utf-8?B?cWpkY25EcUd6bEpkaHEwM0FzUWh0U3RpMXZJWUJMOXJ4Q2ZnVUI2cStjenYy?=
 =?utf-8?Q?rGSRPiWkH3zTQ0EC3XRQ8y46Xy5HRJMCdXZnucN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rkoya2taalZTRzJuVHdwVXRZZFdoT1FJenRDMjFueHJLU0FZeEhhZVJDTGtP?=
 =?utf-8?B?bUVEei9Cem1XaXZ4TUR4OGVoNGwrV1J4TE5NaEFndFVxeG50SUtzYUVvWVBC?=
 =?utf-8?B?b2MvM0RkcTVZeXJNWXhROCs4VGF6dGp0V01KNFBQQUZFa0VzclF4UjhmaDNq?=
 =?utf-8?B?RWZiYi90UVFTcnN1RTFpVk4rZ05IYkl1NlI3QnlkRlZOWmE3eHpiVU1pM2Uw?=
 =?utf-8?B?RG55dHRCR1AwUm9Ha2NhRHh4QjEwRGNOM210dXFpYlN5NXlCdTlYb29LM2NV?=
 =?utf-8?B?ZGRtTWlGcmdvWHFiMFQ1R3Q2Y3BTbUVNZC8ySzhxc1dyaGJ5Zit6UVNpRDQy?=
 =?utf-8?B?VGtpVkJrdTBFSVlISW40OWp1UnRTNVBKUWNJNko0QzdxZHJwTlpMbGtPWUNy?=
 =?utf-8?B?SG5FWGRFb25lRVdwQ0tiREZER2NYOFo2bkhrdFA0U2N2WmdjYSt5bk1lK1pP?=
 =?utf-8?B?aitVK3FGRW9iTjdUSUR4TitWOXZXSmd6MTNmaHhKQlJra1cwRU11bEF2Vmxz?=
 =?utf-8?B?Q2ppOXVBQzNzbENvZXR3bU1VTW9XSnloNm9CZ3ZSQmRTYXBwS285ZElFQUo0?=
 =?utf-8?B?VExtSCtBTU9SZ0orSitabW90b1Y0dHFrYUJLRmRNbTlkeU5kb2ZTNzYwaDla?=
 =?utf-8?B?QTQrczBxWmdJTDF0WGY5MnA2RmIwS1B1Z2x4VHdnbzdGKzkxNFhsbEo1cjlC?=
 =?utf-8?B?bzhJUnZHYmF6U0piWHpvb2h6WktBL2JEcExObk0vMmZwVWZGajN6NitHVzhR?=
 =?utf-8?B?Z1Z4VE9oenN0R3NOQXpoZElLQk5IWndoUDJrSVUzTDY3R3RKK2dTaEFjbmlh?=
 =?utf-8?B?VktvTjQzRzdCYnRDYzZyRENBYlhpVWJDbm9sSnBSQ3IxRWVWVEhDUE5GTS84?=
 =?utf-8?B?NWtZRGRiOVc1MnFLdDhaNEdybXprQkV3RlhlQkZFSDBVeWl2bE1QMjlwSEJx?=
 =?utf-8?B?VU5nRWxiM2Q0WnhmV3FwMVY4MWNybE1RdFpKL3hxaDRneGo0RVlJMWhhSStB?=
 =?utf-8?B?NVU0ajFEaVRWYXhjUGtlV21TL0t5dmMyYStzelE5SnpVbVc1c1hTVzVGenoz?=
 =?utf-8?B?Vmtxak5HUG5XVmQwbm93VlowMzVuU3JjNWRMVXlVNE4zb1pxUVl1Zm5jV3p3?=
 =?utf-8?B?eVlOdi85Z2dxem5xc29VL0tpT0Evazl1Z3Fla3VJYnJ5UjhRZWNubDQwVzhP?=
 =?utf-8?B?cGxLSG5aZ2hQck9oYUU3TnNhRDZPdHo2d1E1VzIwdlBRd0tBcTBnQXZxU0tB?=
 =?utf-8?B?bThWNlN4Z3FwMUx3cE1QMUg3dHpPTnVHakxJTlBuUFk2Y1E4ejFrVGR5Rm9p?=
 =?utf-8?B?Z0pBZDhQcURHRm55R1NoU2M2T2hhZ3JTajNsWFdJRWM0T0lqVG5UL2xZMXdm?=
 =?utf-8?B?Y3lJNWt5TGVtaFV3NzZiUmp3RXcyMWlHRTRvTDc0VHdsbndhaFdLS1FCNHN1?=
 =?utf-8?B?c3lkODhZaFFQWDhIY0UrYUlmNWk2WUFVOU9MQ3pzZGdONWxlSSt3UzI5cDVI?=
 =?utf-8?B?WkZwSGw4dDlTZ01GZ05IQ3R3NWNIMFd3Y2FZL2tvbEpBUTU1YmNna0hONHlP?=
 =?utf-8?B?NWthRVJBU3Fxa0JRZGJtZ3NMbzlCMXZwb2FSSm1SeFdpTjdBMk8xdXVkSXdZ?=
 =?utf-8?B?VkJEbG1XT0FnTGt1elhVYTJaKys2MFFlWjNpbE95TmpCR1hYaTVWNVMrWU1k?=
 =?utf-8?B?YWUrZWVyQzRwZG5EQ0p4MDRxeHY2bFQ1YnRxTFFDMXA0WS91ZVhuUDBXaXRs?=
 =?utf-8?B?ais2RW1oR2p2Nk9BQVoxSUNrbkNSUHZyVzRWWFBkNU9zZ2VFSGtJeHpQY0ZV?=
 =?utf-8?B?Ylg3dzAxcXFGRXRqeitGS0pJc3ZadDdBK200UjdUdnJ6aXdQanpVU2UyTHNy?=
 =?utf-8?B?S2dMTVhTaVZWK0k4ci9iNitQSktGN0dwcktkNFVucEhuQWpNSW03TGh5UEhx?=
 =?utf-8?B?OFdvYWhwdnZUTmtCMG1NWUlFbkJ6UW1ka256Ykw2S2hPeUdhUm1McUZyZW13?=
 =?utf-8?B?N3d4c1JjbDFUNmRiUDlWTjlkOWdJU0N1VUJjUC9XT0JDbUU5bURjWFN5aUVM?=
 =?utf-8?B?Z1NmREg4c09tTGFOV0REM0dvZmtUUTNoaXQzUkk5U1NvM09FZ3VmejRaMkVM?=
 =?utf-8?Q?hnZXErNrsCfeRe1tYuj6w4uJT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821233df-a01b-48c0-2aed-08dcf51b8a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 17:36:21.2428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyN3GAppPN00eCnaKC0k95UWmJsBhbHZdKZYW5jJ3S+tZL/bbLVY/CjqrffpKBmgGgpHdp6hRwkuo/gqfePMaHluE0Hf0WOWi6MGSKSjtHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBGcmlkYXksIE9jdG9iZXIgMjUsIDIw
MjQgMTA6MTMgQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEthbWls
IEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT47IENhdml0dCwgSm9u
YXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdv
LnZpdmlAaW50ZWwuY29tPjsgS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5
bnNraUBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjEgMS8yXSB0ZXN0cy9pbnRl
bC94ZV93ZWRnZWQ6IElnbm9yZSBtb3JlIGRtZXNnIHdhcm5pbmdzDQo+IA0KPiBUaGVyZSBhcmUg
bW9yZSB3YXJuaW5ncyBpbiBkbWVzZyB3aGljaCBzaG91bGQgYmUgaWdub3JlZCwNCj4gb25lIGNv
bWVzIGZyb20gZHJpdmVyLCBmb3IgZXhhbXBsZToNCj4gDQo+IHhlIDAwMDA6MDA6MDIuMDogW2Ry
bV0gKkVSUk9SKiBHVDA6IHJlc2V0IGZhaWxlZCAoLUVDQU5DRUxFRCkNCj4gDQo+IHNlY29uZCBm
cm9tIGRybToNCj4gDQo+IDw0PiBbNDM4LjY1MTQ0MV0gID8gX19wZnhfX19kcm1fcHJpbnRmbl9z
ZXFfZmlsZSsweDEwLzB4MTAgW2RybV0NCj4gPDQ+IFs0MzguNjUxNDc2XSAgPyBfX3BmeF9fX2Ry
bV9wdXRzX3NlcV9maWxlKzB4MTAvMHgxMCBbZHJtXQ0KPiANCj4gc28gZXh0ZW5kIHJlZ2V4IHdp
dGggdGhlbS4NCj4gDQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Ry
bS94ZS9rZXJuZWwvLS9pc3N1ZXMvMjkxOQ0KPiBDYzogSm9uYXRoYW4tQ2F2aXR0IDxqb25hdGhh
bi5jYXZpdHRAaW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPg0KPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNr
aUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29u
aWVjem55QGxpbnV4LmludGVsLmNvbT4NCg0KSSBkb24ndCBzZWUgYW55dGhpbmcgd3Jvbmcgd2l0
aCB0aGlzLCB0aG91Z2ggSSBkbyBoYXZlIGEgZmV3IG9wZW4sIG5vbi1ibG9ja2luZw0KcXVlc3Rp
b25zOg0KDQoxLiBDb3VsZCB3ZSBoYXZlIGNhbGxlZCBpZ3RfZW1pdF9pZ25vcmVfZG1lc2dfcmVn
ZXggbXVsdGlwbGUgdGltZXMgaW5zdGVhZCBvZg0KbmVlZGluZyB0byB1c2UgYSBsb25nZm9ybSBp
bmxpbmUgcmVnZXg/ICBJdCBtaWdodCd2ZSBiZWVuIGVhc2llciB0byBwYXJzZSB0aGF0IHdheS4N
Cg0KMi4gSSdtIGd1ZXNzaW5nIHRoYXQgdGhlIGlndF9lbWl0X2lnbm9yZV9kbWVzZ19yZWdleCBj
bGVhcnMgaXRzZWxmIGFmdGVyIHRoZSB0ZXN0DQpjb21wbGV0ZXM/ICBJIGRvbid0IHNlZSB3aGVy
ZSBpdCBjbGVhcnMgb3RoZXJ3aXNlLCBidXQgd2UndmUgYmVlbiB1c2luZyB0aGlzIGhlbHBlcg0K
Zm9yIGEgd2hpbGUgd2l0aCBubyBpc3N1ZSwgc28gSSBzdXBwb3NlIGl0J3MgYmVlbiBjb3JyZWN0
IHRoaXMgZW50aXJlIHRpbWUuDQoNCjMuIFdoaWxlIEkgYWNrbm93bGVkZ2UgdGhhdCB0aGUgZHJt
IHJlcG9ydGVkIGVycm9ycyBhcmUgZXhwZWN0ZWQgZm9yIHRoaXMgdGVzdCwgbWF5DQpJIGFzayBm
b3Igc29tZSBjbGFyaWZpY2F0aW9uIG9uIHdoeSB0aGV5J3JlIGV4cGVjdGVkIGFuZC9vciB3aGVy
ZSB0aGV5J3JlIGNvbWluZw0KZnJvbT8gIFRoaXMgd291bGQganVzdCBiZSBmb3IgYWlkaW5nIG15
IHVuZGVyc3RhbmRpbmcgb2YgdGhlIHRlc3QvaXNzdWUuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGZp
eCENClJldmlld2VkLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5j
b20+DQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV93ZWRnZWQu
YyB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3dlZGdlZC5jIGIvdGVzdHMv
aW50ZWwveGVfd2VkZ2VkLmMNCj4gaW5kZXggODhlNWQ0N2YyLi4wZTRjODhmZmUgMTAwNjQ0DQo+
IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3dlZGdlZC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3dl
ZGdlZC5jDQo+IEBAIC0yOSw3ICsyOSw5IEBADQo+ICBzdGF0aWMgdm9pZCBpZ25vcmVfd2VkZ2Vk
X2luX2RtZXNnKHZvaWQpDQo+ICB7DQo+ICAJLyogdGhpcyBpcyBuZWVkZWQgZm9yIGlndF9ydW5u
ZXIgc28gaXQgd2lsbCBpZ25vcmUgaXQgKi8NCj4gLQlpZ3RfZW1pdF9pZ25vcmVfZG1lc2dfcmVn
ZXgoIkNSSVRJQ0FMOiBYZSBoYXMgZGVjbGFyZWQgZGV2aWNlIFswLTlBLUZhLWY6Ll0qIGFzIHdl
ZGdlZCIpOw0KPiArCWlndF9lbWl0X2lnbm9yZV9kbWVzZ19yZWdleCgiQ1JJVElDQUw6IFhlIGhh
cyBkZWNsYXJlZCBkZXZpY2UgWzAtOUEtRmEtZjouXSogYXMgd2VkZ2VkfCINCj4gKwkJCQkgICAg
IkdUWzAtOUEtRmEtZl0qOiByZXNldCBmYWlsZWQgLi1FQ0FOQ0VMRUQufCINCj4gKwkJCQkgICAg
Il9fcGZ4X19fZHJtX1thLXpdKnNlcV9maWxlLipkcm0iKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGlj
IHZvaWQgZm9yY2Vfd2VkZ2VkKGludCBmZCkNCj4gLS0gDQo+IDIuNDcuMA0KPiANCj4gDQo=

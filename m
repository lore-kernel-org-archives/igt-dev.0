Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB16ACCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 18:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F9910E2E1;
	Mon, 10 Nov 2025 18:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCnfYRMM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF2310E2E1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 18:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762799683; x=1794335683;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IV3TdpyYjC5s7nbpGum7qz/RLx4LR+IhRFOSpSBGc5s=;
 b=FCnfYRMMDTsFr7P8dYbJYMA7HTQcYnWzq/8d8aUCiPZFciGk0HKh46L5
 pWbD6ExlDSHXBrr6Nk/mfvZSVs/m0EBH/BsJAkw2RJJvoIGGzXmWIi62o
 rDDkj8KouqWDwE0OimCqWCr/D87MRVcDs0YcKsMcHjFvDJD/noxpAdExc
 pVohwPx9fSKCmkO3ig1Ezf+WHCpPsJWj9EjmVJcKz138vHiqyQti1UUPi
 ZuGGgxzpgbHOEMqhB7FWFu4PzMy7hydmtBmSRgywH7mm7fRu74//GLUQf
 g8b3lz6Yl0nAu7wthj8D9ksOSye6kn9vp1JRpIB8Gcu9Lm3wuxP2CeVjf w==;
X-CSE-ConnectionGUID: gX910AkoS8m843bG5Oy3UQ==
X-CSE-MsgGUID: M2iIbJ41SpmxBt50Wl95Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68713929"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="68713929"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:34:43 -0800
X-CSE-ConnectionGUID: OXg2WXzaRJG6fG57KVDBGw==
X-CSE-MsgGUID: 6oDOwHYXTAmCbg4DWSlh3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="219457702"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:34:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:34:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 10:34:42 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:34:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8HjbPibJADlpPCVbIR2chHcCgK6x24T9tKYZcLPNk9EwxTi/0PQkuS+tn2nMR0rNPf1499tnIk3e4WCRJT/9iAzBYsAcQnO74zrqUvTfKpE7uyJ7dF1+cO8wgzYcsJ3grPMGYKLGIB2l1RVMBD+CSN3EbwJERUfSZoNPlOmSMxIBZMtHtsfQ0IOoRC13KE03UPfl8PAPkPYTWIecj03PWAjU8YhxIAKWIt8Qk+DktzLggWrOPHcqlNUubdE+1YEg70T1woqGoAJQVHmZ3sRqWcHgZvFxw0/7PbxgogsPsqekIXM8+b/TyZK+bkGx7rITg5qAh4uosVz3tHuvd/glw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IV3TdpyYjC5s7nbpGum7qz/RLx4LR+IhRFOSpSBGc5s=;
 b=DRe80HDuqAthjop6zz8OhJZMwOzEg6rN6P3iGDQdOHatnXY5kPL0SDNvVht0Dn7/1U6jIl8QHiKN92+1RxfSCZx/H6Katw1mGzzRabXzxs71eHHuMS53Jd+MRRRgEOcVD8WemhTrV3dTSSKlGbg5vWcy3wvv3yq66gP7lwudg/UWmlCg03K17YcQB6yX9V5JDdYHE94dF7QWAtYIUnxODapbgBzaSB+6MLwPNfU2F0+imYSwa6Yl7HCU0ESIPhNCiww3wpG0Z1tXvErtwYLrTPsXkB0/zFYY4+Nqyv+z0FleTcOJmd9iHLG4syKz38cksklFBaCL4XoRLU6tvuh7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 18:34:39 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 18:34:38 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 03/18] tests/xe_exec_multi_queue: Add xe_exec_multi_queue
 test
Thread-Topic: [PATCH 03/18] tests/xe_exec_multi_queue: Add xe_exec_multi_queue
 test
Thread-Index: AQHcSpVCZ+7TKr1H+UiIiLDrSMdEobTrwFhg
Date: Mon, 10 Nov 2025 18:34:38 +0000
Message-ID: <BL3PR11MB5747B01C4ED90A8E404403DAD0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251031183555.1882721-4-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|SJ0PR11MB5024:EE_
x-ms-office365-filtering-correlation-id: fd65e8ef-afb8-45a0-9e01-08de2087ce01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?OGs0cEZwUDN6ZmlHdllldjlDTTZSWG5SYjZsNWxMWnNMTC9YSFFyUHN4Nmsv?=
 =?utf-8?B?eHRqMTRIUldHNHVIYUhjaGF5M3hPSTVDZ3c1dHhmd3Npc1FwVUhYUG5DRzFI?=
 =?utf-8?B?V0pUZ3J5bktuNWhDWGhVY1lLTVc4SkR2QkJaVUpFSGMxK1VuY0hWWWE0RjZL?=
 =?utf-8?B?MzY0Z2s1TGc2aVo4MVIyZHk4WEVoY0dYL1ZaYjVsayt1czBXTUZKWjlsUURX?=
 =?utf-8?B?aytuazB2SnIrcTlrem5seGg2T1k4clN4akFwUE9qZVRhOEFwa04zRW5JTjU2?=
 =?utf-8?B?Zy9IQnJqTjNnMnFlMDN6QzNYc2Fxai9QdjVkRTFpQ00vcEZLK2JUNE9pc1k4?=
 =?utf-8?B?N2x2RnpNeUtxQkZKMjVSQmRxdCtjajdIOUZTQ2NTOEorMTJMU2dKbDBId2Z4?=
 =?utf-8?B?MUluM29kWXJuODE4V01EK21ZYUxBSHBsZ2d4VFlTSTh6ck1oUkN4V0xpVDNh?=
 =?utf-8?B?UlVnbWJyU2tOWjQ1czlzSzZ4ZEdZRkxLblVjY0N3SzZjZUdXeW1INzBxOXVo?=
 =?utf-8?B?ZjZ0eE5GdWhIc2kzQ25aRnRTRGltK095ZFZKdC8rc0xwUElhYnY0TFFuMnhU?=
 =?utf-8?B?VDMwN0RIN2ljb2lOTGg2OWFVQ1BKeTNVaTNtaEU4anp3aG83d2E5dHFWOUFX?=
 =?utf-8?B?dGpjV0hXeXBudDljN2QxNURYdFFLRU54dzhzczB3TFI1bkJjU0NOaW1LcE5Q?=
 =?utf-8?B?S1lxWDRnQ3JzaTEvejVtNmFTYmR2Zno5VFA1dWg2TGlRY3F3RzYxL0RDUld1?=
 =?utf-8?B?UlRQVlFiWUJhNk91ZlB4V3JKRkN0d2tDQ2Z4WkV1RUxnR252SWJiZkRjSXZs?=
 =?utf-8?B?dk5aWXZFV3JGQU1VbmJxOHZmK0xJdTJWNVdtOG4yMGdDUXJhOUJVQzZFY0FI?=
 =?utf-8?B?djd2V1p2bEQ0czlIWkpjeGkzaE0xa0NORTZPWGZleGNLVzBKa1c2MmF1MGdP?=
 =?utf-8?B?cXJqbGpFZmlIT1RrVElTVFE5VnpPQmtrRXB6NzM4dThGMDg4VXlid1NvdTBs?=
 =?utf-8?B?dzlWKzZUdlhwYmxIcGZ2Ry9na2dFbEZMckZRb0VNMkFSRjFsWVRxL3RyeEFW?=
 =?utf-8?B?VmxPNnVlRkY1eUxoQWkyVzlxYjlMYTNZWnpndUZkak05NHZwUG1DYStMdG14?=
 =?utf-8?B?aktkS1NzQUNJaUQxZzhSREhNN1J4RHF2eUd6Ly91ZGNHQ2wxNy81eUhqNDEz?=
 =?utf-8?B?S0xBOXRqWFRJOEtmRXZQK0pGTk9kN1FFbzEvV3BBT0I4M245OVNteXRMWHFp?=
 =?utf-8?B?dDVLVm1IS3BjWmdmNG1IRi94dHhiaEFHeElLa0szQUdjclk2RkZmMVRwWGhq?=
 =?utf-8?B?eXBPdS8zbXo3RWlyV3hBYU1PTHMvS2planFnNjdTdnczTFBpTGpEenAva1l4?=
 =?utf-8?B?aVRONGh2U2xJd2QzcjJ1R1NBN1loaWhkUWczOEFyRkw1aFZneklFTHJVbU9X?=
 =?utf-8?B?VHdzNzZiUzR1Q0NVakF0TXdId3RpZ0s2UjA0bjZvZVYwdGx1RTRLazZac0Nh?=
 =?utf-8?B?emtOcnNRb2p4SmRYa2IvK3FKQVF5bnNYeGt4T3VnR0FUaFNKSXR5NzlSdHpz?=
 =?utf-8?B?Q0ZzVVVDZkNENzdqWW41ZGFqNHpOZmN3bVBtTmJ6eVZHbFdQcnhuK2FLT3lo?=
 =?utf-8?B?UnovQzhTRlc4Nlp3QitzUGZpYldnMFdKR3VDaFBiOGQ5Z0JNZkJORUhHQytw?=
 =?utf-8?B?QjVYOExxS3VsU3g4OTZVdEIzb2ZPeFRPdGsrZU5KT2Z6R2N2QmtZZWR4NU9C?=
 =?utf-8?B?WTRNMWp4ZFdTUU83R3hKcW1ScW00OG1KSkxwbGxlQ2pwL1NkMFlPNTd6Vkdi?=
 =?utf-8?B?aTY4ZTI4R0xoaEJWMHl2SFlzQS8xM3JLTzB1dzZyOVlicE9UMHkvQWE2T3BL?=
 =?utf-8?B?YXRaMThYY1llbi9CVkgyZXh4YkdMZUxKQzBQQ3ExUnFNOFVWSEIxbTVGdGdN?=
 =?utf-8?B?M3RLbjRLQVZlOE14T1U3K3lqVHd4L3RyTlpseDIyUzI5SG9kRjN2SmNjalho?=
 =?utf-8?B?Z0VMUzR5azBtNWFoQ3RCQ1c2MEpDbHRzaEJtQmMxU1ZFYWV4bGRvYWoyYUhp?=
 =?utf-8?Q?m63thV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2dVeTNjbGxLakFESlJybWR0ODFWYXNEam5XZ1Y2bVdXdDlSMXRTS1p6d1Vh?=
 =?utf-8?B?akJBNE5vbTQ2eUJUZXZYcUJlZEdtTWFiSzZZZTdLLzlNSERCRFBrVVJTTnYv?=
 =?utf-8?B?cWZuZXBlMlM2Ti9KMHVFMHZwb3UxQ3dyZW8wV0poZ09SK2xhbmNFQ09idWc3?=
 =?utf-8?B?ODBxTFpjNjJweEVHdTMrMnRUK3ozSXZjWTlyRDI4MHJvWjBtQWVQbklKOWsy?=
 =?utf-8?B?V1dSc2c2VGo1ODM5dGlCS2xyUlV3RlMxVDFXTmdSaXBXWjBJT3pyT2tNTUJE?=
 =?utf-8?B?L2k4OWdZNXArU3dOalJERVhDRmplQUFTU01DVW9PZTFHM1A2Nlc0OVI4MHNu?=
 =?utf-8?B?cDQ0alZYdVdVYXBja2tMTXpPTDFvWDl3Wjd2T0ZRZERVSnpBZ2lZZEQ3RjZk?=
 =?utf-8?B?aWdhVWx3WTVsMjliV2puRjVoNTBmNUpGV29yQ0V0MEg5dVY4VGwzNGFmeGJk?=
 =?utf-8?B?NXBZSlh1cXhHNERvS0JyVG9MVC8vZFZ5anRsbTAzcGR3L2puK3g3VVNQRytP?=
 =?utf-8?B?cTMzS0ZjZ1BrNTdNUDBDMjdsQTBnTVhVTWlUWDlaYmIxVkcvZmlnNE9DUVVQ?=
 =?utf-8?B?M0RkanczUno2ZUQrQnhJNlY0ZTR5TDlKbi92YW13cml6MkNLVmI1VnpMTUNt?=
 =?utf-8?B?dUhoNFFyaUlNWmFPMkExSmt4SUVzdFpWT1RISzM4R3QrMk9sdytaS1QxL2x2?=
 =?utf-8?B?Y3dXbDFlZFJZRnpYMlpUY004V3h0cStQem9yV3VLWW5RUjR6N2JOeWU3V0JV?=
 =?utf-8?B?RHlUVUlSQXdlelF3eEZTWFB1OGM0VEhMSVdpVUZuaCtoSEgzOEExWTUwdVNP?=
 =?utf-8?B?bVAvMWhGL0Y2ZEkyWXE1cFVvZS9iTEx1R25yd0t4UDJ4RTNDS3dMcmZiVm5z?=
 =?utf-8?B?Z0xZL3h5SnY3djlGdmVrVzVZN29rRGhiRXppZzFQWnFrWWxLZS9qTlZyVVJD?=
 =?utf-8?B?UW1MQW5LRHdyalVPSVVsSzFjZFg2TEx6L0FuVnBCcndwaTJPL2ZsNGZLUlVY?=
 =?utf-8?B?Qm9xVnhRZDU4Q2grY1BWY1VZZ0s4dlZXRVRlSHN5ZmVYaE8rWHpONm5TMysv?=
 =?utf-8?B?Nms3bmlTeGdFMnVMQW5OSVNjZnE5UDV2RG1Mb0JwdHcydHNmdTZ2QUdaSnRt?=
 =?utf-8?B?Yml2bHR6RDM1byt2QURPVkk0ZUtWbWpUbEtCcG16QmQ3VFZEM0lxeGw2aFkz?=
 =?utf-8?B?UUxTdzJOTmsrYitmdHhiOUY0TEM4YzZiRE1zc1h6OFlhUVg2M25LR0Yramgx?=
 =?utf-8?B?Z0ZKR0F1enRoaE1VdXZWSkJucGlRZ1c4bXVPbnh6VlB5V1BQSzE3Wll2Z1FV?=
 =?utf-8?B?aUNlalZoQkkzTkRoNXlraW4ycVdmcXY4bllQb2dXN2xCdkVmS3MwSjVDZ1Y5?=
 =?utf-8?B?WWJXVjhqejRvcE9TQWpzYldKSVA3WUNPbVZEeVVtODc1VlpVb3loc0tTUzdn?=
 =?utf-8?B?a3U2OWo2SkFaQWttR1MrMENNUzBwdWhoampqd0lwcVpTWFhlRGNQMkk0dTVO?=
 =?utf-8?B?bUpzODVHVDQrVXRJcm9uN2UrcVVmM3VpMTYzbVdGSEJKREkrUWM2NUd0Y0pH?=
 =?utf-8?B?R0R5dExIamMwUVhER05weHd2cllyRjNrYld4NTJMZXNxb2dOSE00Vjk3YW1C?=
 =?utf-8?B?REpMNDZQbWE4Qzl3R2U2Z2pCVzNrQXB0MEdZMkR0Vk81NElwc1hPQ1BMbHlK?=
 =?utf-8?B?TGlVQXBtSWp3TUZDNkgrLzBobGlyemFwa05PWUFNZWxqZ2kzQXB5Tk8ySnFq?=
 =?utf-8?B?VU5tTmIra3dtYUJDVkp6Z3JRMFBpMFFGUmtBdklndGVxblhwNWlpUzREUHN6?=
 =?utf-8?B?MHN5WUErc0RlMWllcll0VnV6eGFGa0czUm5XMlpKcjAzazEzQVFKT2YvWTVF?=
 =?utf-8?B?K3lZL3dMeHNzY3NxemJiY1dJMitUT3gzSkNBZ3BHUEJFZzduVTFBR2Y4QlNo?=
 =?utf-8?B?WGZSNmlBVFQvTnhlSkRvVGVyelRHbzR4aWVoSVEyaHljZ3liZVFIN3pSalpV?=
 =?utf-8?B?dmhSOFJ6VXVEWE9HQTQySXJ6WjRRN1pIdzhncm9DQTg4QXlRZ2FVZThyMFJ0?=
 =?utf-8?B?Zkp2d1ZuQXhiY2dkOGpJVmpNaEFsNXBZSm90Y0c5aWpYaVYvb2FVRTlocUJ1?=
 =?utf-8?Q?kJ+wvo0dcAqdvBlLbE6hLOaq5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd65e8ef-afb8-45a0-9e01-08de2087ce01
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 18:34:38.1311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnrIHN+LvL9JGYrfnQZSiBO1qFtzEQnGozoievwp5GteTSM2zkkeN/wYd4sbKvoirFJn2hur4cBzGDiGqBD4qw1TZsL/4jwnvrek0Ektph4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGlndC1kZXYgPGlndC1kZXYt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBOaXJhbmphbmENCj5W
aXNod2FuYXRoYXB1cmENCj5TZW50OiBTYXR1cmRheSwgTm92ZW1iZXIgMSwgMjAyNSAxMjowNiBB
TQ0KPlRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFtQQVRDSCAw
My8xOF0gdGVzdHMveGVfZXhlY19tdWx0aV9xdWV1ZTogQWRkIHhlX2V4ZWNfbXVsdGlfcXVldWUN
Cj50ZXN0DQo+DQo+QWRkIHNhbml0eSB0ZXN0IGZvciB0aGUgbXVsdGkgcXVldWUgZmVhdHVyZS4N
Cj4NCj5TaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhDQo+PG5pcmFuamFu
YS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPg0KTG9va3MgZ29vZCB0byBtZQ0KUmV2aWV3ZWQt
Ynk6IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQoNCj4tLS0NCj4g
dGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jIHwgMTYzDQo+KysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+IHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICB8ICAg
MSArDQo+IDIgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKykNCj4gY3JlYXRlIG1vZGUg
MTAwNjQ0IHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYw0KPg0KPmRpZmYgLS1naXQg
YS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMNCj5iL3Rlc3RzL2ludGVsL3hlX2V4
ZWNfbXVsdGlfcXVldWUuYw0KPm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+aW5kZXggMDAwMDAwMDAw
Li4wM2I5MjBkYzgNCj4tLS0gL2Rldi9udWxsDQo+KysrIGIvdGVzdHMvaW50ZWwveGVfZXhlY19t
dWx0aV9xdWV1ZS5jDQo+QEAgLTAsMCArMSwxNjMgQEANCj4rLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IE1JVA0KPisvKg0KPisgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlv
bg0KPisgKi8NCj4rDQo+Ky8qKg0KPisgKiBURVNUOiBCYXNpYyB0ZXN0cyBmb3IgZXhlYyBmdW5j
dGlvbmFsaXR5IHdpdGggbXVsdGktcXVldWUgZmVhdHVyZQ0KPisgKiBDYXRlZ29yeTogSGFyZHdh
cmUgYnVpbGRpbmcgYmxvY2sNCj4rICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIENvcmUgZmVhdHVy
ZXMNCj4rICogU3ViLWNhdGVnb3J5OiBDTUQgc3VibWlzc2lvbg0KPisgKiBGdW5jdGlvbmFsaXR5
OiBtdWx0aS1xdWV1ZQ0KPisgKi8NCj4rDQo+KyNpbmNsdWRlICJpZ3QuaCINCj4rI2luY2x1ZGUg
InhlX2RybS5oIg0KPisNCj4rI2luY2x1ZGUgInhlL3hlX2lvY3RsLmgiDQo+KyNpbmNsdWRlICJ4
ZS94ZV9xdWVyeS5oIg0KPisNCj4rI2RlZmluZSBNQVhfTl9FWEVDX1FVRVVFUwk2NA0KPisNCj4r
I2RlZmluZSBNQVhfSU5TVEFOQ0UgOQ0KPisNCj4rI2RlZmluZSBYRV9NVUxUSV9HUk9VUF9WQUxJ
RF9GTEFHUw0KPihEUk1fWEVfTVVMVElfR1JPVVBfQ1JFQVRFKQ0KPisNCj4rc3RhdGljIHZvaWQN
Cj4rX190ZXN0X3Nhbml0eShpbnQgZmQsIGludCBndCwgaW50IGNsYXNzKSB7DQo+Kwl1aW50MzJf
dCBleGVjX3F1ZXVlc1tNQVhfTl9FWEVDX1FVRVVFU107DQo+KwlzdHJ1Y3QgZHJtX3hlX2V4dF9z
ZXRfcHJvcGVydHkgbXVsdGlfcXVldWUgPSB7DQo+KwkJLmJhc2UubmFtZSA9DQo+RFJNX1hFX0VY
RUNfUVVFVUVfRVhURU5TSU9OX1NFVF9QUk9QRVJUWSwNCj4rCQkucHJvcGVydHkgPQ0KPkRSTV9Y
RV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9NVUxUSV9HUk9VUCwNCj4rCQkudmFsdWUgPSBEUk1f
WEVfTVVMVElfR1JPVVBfQ1JFQVRFLA0KPisJfTsNCj4rCXVpbnQ2NF90IGludmFsaWRfZmxhZyA9
IDAsIGV4dCA9IHRvX3VzZXJfcG9pbnRlcigmbXVsdGlfcXVldWUpOw0KPisJc3RydWN0IGRybV94
ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgZWNpW01BWF9JTlNUQU5DRV07DQo+KwlzdHJ1Y3QgZHJt
X3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlOw0KPisJdWludDMyX3Qgdm0sIHZtMiwgdmFs
Ow0KPisJaW50IGksIG4gPSAwOw0KPisNCj4rCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7
DQo+KwkJaWYgKGh3ZS0+ZW5naW5lX2NsYXNzICE9IGNsYXNzIHx8IGh3ZS0+Z3RfaWQgIT0gZ3Qp
DQo+KwkJCWNvbnRpbnVlOw0KPisNCj4rCQllY2lbbisrXSA9ICpod2U7DQo+Kwl9DQo+Kw0KPisJ
aWYgKCFuKQ0KPisJCXJldHVybjsNCj4rDQo+Kwl2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwgMCk7
DQo+Kw0KPisJLyogSW52YWxpZCBmbGFncyAqLw0KPisJd2hpbGUgKCFpbnZhbGlkX2ZsYWcpDQo+
KwkJaW52YWxpZF9mbGFnID0gKDF1bGwgPDwgKHJhbmQoKSAlIDYzKSkgJg0KPn5YRV9NVUxUSV9H
Uk9VUF9WQUxJRF9GTEFHUzsNCj4rCW11bHRpX3F1ZXVlLnZhbHVlIHw9IGludmFsaWRfZmxhZzsN
Cj4rCWlndF9hc3NlcnRfZXEoX194ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sIDEsIDEsIGVj
aSwgZXh0LCAmdmFsKSwgLQ0KPkVJTlZBTCk7DQo+KwltdWx0aV9xdWV1ZS52YWx1ZSA9IERSTV9Y
RV9NVUxUSV9HUk9VUF9DUkVBVEU7DQo+Kw0KPisJLyogUTAgY2FuJ3QgYmUgYSByZWd1bGFyIHF1
ZXVlICovDQo+KwlleGVjX3F1ZXVlc1swXSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwg
ZWNpLCAwKTsNCj4rCW11bHRpX3F1ZXVlLnZhbHVlID0gZXhlY19xdWV1ZXNbMF07DQo+KwlpZ3Rf
YXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAxLCAxLCBlY2ksIGV4dCwg
JnZhbCksIC0NCj5FSU5WQUwpOw0KPisJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1
ZXVlc1swXSk7DQo+Kw0KPisJLyogTXVsdGktUXVldWUgY2FuJ3QgYmUgYSBwYXJhbGxlbCBxdWV1
ZSAqLw0KPisJbXVsdGlfcXVldWUudmFsdWUgPSBEUk1fWEVfTVVMVElfR1JPVVBfQ1JFQVRFOw0K
PisJaWYgKG4gPiAxKQ0KPisJCWlndF9hc3NlcnRfZXEoX194ZV9leGVjX3F1ZXVlX2NyZWF0ZShm
ZCwgdm0sIDIsIDEsIGVjaSwgZXh0LA0KPiZ2YWwpLA0KPistRUlOVkFMKTsNCj4rDQo+KwkvKiBT
cGVjaWZ5aW5nIG11bHRpcGxlIE1VTFRJX0dST1VQIHByb3BlcnR5IGlzIGludmFsaWQgKi8NCj4r
CW11bHRpX3F1ZXVlLmJhc2UubmV4dF9leHRlbnNpb24gPSB0b191c2VyX3BvaW50ZXIoJm11bHRp
X3F1ZXVlKTsNCj4rCWlndF9hc3NlcnRfZXEoX194ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0s
IDEsIDEsIGVjaSwgZXh0LCAmdmFsKSwNCj4rLUVJTlZBTCk7DQo+Kw0KPisJLyogQWRkaW5nIHF1
ZXVlcyB0byBncm91cCBhZnRlciBwcmltYXJ5IGlzIGRlc3Ryb3llZCBpcyBpbnZhbGlkICovDQo+
KwltdWx0aV9xdWV1ZS5iYXNlLm5leHRfZXh0ZW5zaW9uID0gMDsNCj4rCWV4ZWNfcXVldWVzWzBd
ID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCBlY2ksIGV4dCk7DQo+Kwl4ZV9leGVjX3F1
ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWVzWzBdKTsNCj4rCW11bHRpX3F1ZXVlLnZhbHVlID0g
ZXhlY19xdWV1ZXNbMF07DQo+KwlpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9jcmVhdGUo
ZmQsIHZtLCAxLCAxLCBlY2ksIGV4dCwgJnZhbCksDQo+Ky1FTk9FTlQpOw0KPisNCj4rCW11bHRp
X3F1ZXVlLnZhbHVlID0gRFJNX1hFX01VTFRJX0dST1VQX0NSRUFURTsNCj4rCWV4ZWNfcXVldWVz
WzBdID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCBlY2ksIGV4dCk7DQo+Kw0KPisJLyog
VXBwZXIgMzIgYml0cyBtdXN0IGJlIDAgd2hpbGUgYWRkaW5nIHNlY29uZGFyeSBxdWV1ZXMgKi8N
Cj4rCW11bHRpX3F1ZXVlLnZhbHVlID0gZXhlY19xdWV1ZXNbMF0gfCAoMXVsbCA8PCAoMzIgKyAo
cmFuZCgpICUgMzIpKSk7DQo+KwlpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9jcmVhdGUo
ZmQsIHZtLCAxLCAxLCBlY2ksIGV4dCwgJnZhbCksDQo+Ky1FSU5WQUwpOw0KPisNCj4rCS8qIElu
dmFsaWQgUTAgKi8NCj4rCW11bHRpX3F1ZXVlLnZhbHVlID0gZXhlY19xdWV1ZXNbMF0gKyAxOw0K
PisJaWd0X2Fzc2VydF9lcShfX3hlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgMSwgMSwgZWNp
LCBleHQsICZ2YWwpLA0KPistRU5PRU5UKTsNCj4rDQo+KwkvKiBRdWV1ZXMgaW4gYSBxdWV1ZSBn
cm91cCBtdXN0IHNoYXJlIHRoZSBzYW1lIGFkZHJlc3Mgc3BhY2UgKHZtKQ0KPiovDQo+KwltdWx0
aV9xdWV1ZS52YWx1ZSA9IGV4ZWNfcXVldWVzWzBdOw0KPisJdm0yID0geGVfdm1fY3JlYXRlKGZk
LCAwLCAwKTsNCj4rCWlndF9hc3NlcnRfZXEoX194ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0y
LCAxLCAxLCBlY2ksIGV4dCwgJnZhbCksIC0NCj5FSU5WQUwpOw0KPisJeGVfdm1fZGVzdHJveShm
ZCwgdm0yKTsNCj4rDQo+KwkvKiBTZWNvbmRhcnkgcXVldWVzIG11c3QgbWFwIHRvIHNhbWUgZW5n
aW5lIGluc3RhbmNlcyBhcyBwcmltYXJ5DQo+cXVldWUgKi8NCj4rCWlmIChuID4gMSkNCj4rCQlp
Z3RfYXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAxLCBuLCBlY2ksIGV4
dCwNCj4mdmFsKSwNCj4rLUVJTlZBTCk7DQo+Kw0KPisJZm9yIChpID0gMTsgaSA8IE1BWF9OX0VY
RUNfUVVFVUVTOyBpKyspDQo+KwkJZXhlY19xdWV1ZXNbaV0gPSB4ZV9leGVjX3F1ZXVlX2NyZWF0
ZShmZCwgdm0sIGVjaSwgZXh0KTsNCj4rDQo+KwkvKiBRdWV1ZSBncm91cCBsaW1pdCBjaGVjayAq
Lw0KPisJaWd0X2Fzc2VydF9lcShfX3hlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgMSwgMSwg
ZWNpLCBleHQsICZ2YWwpLA0KPistRUlOVkFMKTsNCj4rDQo+KwkvKiBTZWNvbmRhcnkgcXVldWVz
IGNhbid0IGJlIHJlcGxhY2VkIG9uY2Ugc3VjY2Vzc2Z1bGx5IGNyZWF0ZWQgKi8NCj4rCXhlX2V4
ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19xdWV1ZXNbMV0pOw0KPisJaWd0X2Fzc2VydF9lcShf
X3hlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgMSwgMSwgZWNpLCBleHQsICZ2YWwpLA0KPist
RUlOVkFMKTsNCj4rDQo+KwkvKiBQcmltYXJ5IHF1ZXVlIGNhbiBiZSBkZXN0cm95ZWQgYmVmb3Jl
IGFsbCBzZWNvbmRhcnkgcXVldWVzIGFyZQ0KPmRlc3Ryb3llZCAqLw0KPisJeGVfZXhlY19xdWV1
ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVlc1swXSk7DQo+Kw0KPisJZm9yIChpID0gMjsgaSA8IE1B
WF9OX0VYRUNfUVVFVUVTOyBpKyspDQo+KwkJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVj
X3F1ZXVlc1tpXSk7DQo+Kw0KPisJLyogVmFsaWRhdGUgd2l0aCBtdWx0aXBsZSBudW1fcGxhY2Vt
ZW50cyAqLw0KPisJaWYgKG4gPiAxKSB7DQo+KwkJbXVsdGlfcXVldWUudmFsdWUgPSBEUk1fWEVf
TVVMVElfR1JPVVBfQ1JFQVRFOw0KPisJCW11bHRpX3F1ZXVlLmJhc2UubmV4dF9leHRlbnNpb24g
PSAwOw0KPisJCWlndF9hc3NlcnRfZXEoX194ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sIDEs
IG4sIGVjaSwgZXh0LA0KPismZXhlY19xdWV1ZXNbMF0pLCAwKTsNCj4rDQo+KwkJbXVsdGlfcXVl
dWUudmFsdWUgPSBleGVjX3F1ZXVlc1swXTsNCj4rCQlmb3IgKGkgPSAxOyBpIDwgTUFYX05fRVhF
Q19RVUVVRVM7IGkrKykNCj4rCQkJaWd0X2Fzc2VydF9lcShfX3hlX2V4ZWNfcXVldWVfY3JlYXRl
KGZkLCB2bSwgMSwgbiwNCj5lY2ksIGV4dCwNCj4rJmV4ZWNfcXVldWVzW2ldKSwgMCk7DQo+Kw0K
PisJCWZvciAoaSA9IDA7IGkgPCBNQVhfTl9FWEVDX1FVRVVFUzsgaSsrKQ0KPisJCQl4ZV9leGVj
X3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWVzW2ldKTsNCj4rCX0NCj4rDQo+Kwl4ZV92bV9k
ZXN0cm95KGZkLCB2bSk7DQo+K30NCj4rDQo+Ky8qKg0KPisgKiBTVUJURVNUOiBzYW5pdHkNCj4r
ICogRGVzY3JpcHRpb246IFJ1biBzYW5pdHkgdGVzdA0KPisgKiBUZXN0IGNhdGVnb3J5OiBmdW5j
dGlvbmFsaXR5IHRlc3QNCj4rICovDQo+K3N0YXRpYyB2b2lkDQo+K3Rlc3Rfc2FuaXR5KGludCBm
ZCwgaW50IGd0LCBpbnQgY2xhc3MpDQo+K3sNCj4rCV9fdGVzdF9zYW5pdHkoZmQsIGd0LCBjbGFz
cyk7DQo+K30NCj4rDQo+K2lndF9tYWluDQo+K3sNCj4rCWludCBmZCwgZ3QsIGNsYXNzOw0KPisN
Cj4rCWlndF9maXh0dXJlIHsNCj4rCQlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0K
PisJCWlndF9yZXF1aXJlKGludGVsX2dyYXBoaWNzX3ZlcihpbnRlbF9nZXRfZHJtX2RldmlkKGZk
KSkgPj0NCj5JUF9WRVIoMzUsIDApKTsNCj4rCX0NCj4rDQo+KwlpZ3Rfc3VidGVzdF9mKCJzYW5p
dHkiKQ0KPisJCXhlX2Zvcl9lYWNoX2d0KGZkLCBndCkNCj4rCQkJeGVfZm9yX2VhY2hfbXVsdGlf
cXVldWVfZW5naW5lX2NsYXNzKGNsYXNzKQ0KPisJCQkJdGVzdF9zYW5pdHkoZmQsIGd0LCBjbGFz
cyk7DQo+Kw0KPisJaWd0X2ZpeHR1cmUNCj4rCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4rfQ0K
PmRpZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkIGluZGV4
DQo+NzNlZGQzZTcxLi43ZTY3ZWIyYmUgMTAwNjQ0DQo+LS0tIGEvdGVzdHMvbWVzb24uYnVpbGQN
Cj4rKysgYi90ZXN0cy9tZXNvbi5idWlsZA0KPkBAIC0yOTYsNiArMjk2LDcgQEAgaW50ZWxfeGVf
cHJvZ3MgPSBbDQo+IAkneGVfZXhlY19jb21wdXRlX21vZGUnLA0KPiAJJ3hlX2V4ZWNfZmF1bHRf
bW9kZScsDQo+IAkneGVfZXhlY19taXhfbW9kZXMnLA0KPisJJ3hlX2V4ZWNfbXVsdGlfcXVldWUn
LA0KPiAJJ3hlX2V4ZWNfcXVldWVfcHJvcGVydHknLA0KPiAJJ3hlX2V4ZWNfcmVzZXQnLA0KPiAJ
J3hlX2V4ZWNfc2lwJywNCj4tLQ0KPjIuNDMuMA0KDQo=

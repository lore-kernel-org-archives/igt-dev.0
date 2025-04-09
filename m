Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0247BC36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 08:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A598F10E309;
	Wed,  9 Apr 2025 08:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ET6qjmjE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BF710E309
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 08:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744188222; x=1775724222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i++OF3M84w0EsH+VxnfRFjzbKO6nHxzr3RS36Vpzvno=;
 b=ET6qjmjE8HhQN4ZU5WOnsR+y0slsqH/k3JyNA8xjehaxYhyfcgt4Sieq
 DBgos0N9sP+dGxMUvoIZluq4z/EQiMX3lvpf9X2JO3H21WeuRucyWFIL7
 2aic1zYQadKwbVT7UWnk+A37zUYGBS/WkiRBAuIWnO4D+0ay8dObNxAZb
 3iOI2pptJmcXcVwKDFIj+xNcEHQrjLF2aMxsnMJ5O8MxRvebLxHejUcQA
 ge0YRmBCFQRvSBlrvzWnc/7uSaA2QAEJJMlA8C8zfYWULExJJX4WMBVyh
 qwuINlYGT4QoY2Ax11BUWnatizF688dU1AntOvRs8MXK+mU+9vBDRBZgt g==;
X-CSE-ConnectionGUID: zuZl/EV/R725Vk3lbsJxWg==
X-CSE-MsgGUID: AaJsWbrJRG2NpXm8OJedKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45742258"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45742258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:43:42 -0700
X-CSE-ConnectionGUID: JiIacCRCSGu/h8aSCYJz7g==
X-CSE-MsgGUID: pIMcBs8zSTyggPZCngLH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="133654614"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:43:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 01:43:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 01:43:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 01:43:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBNUOGE/x27gb6VIGlgdkxe6baFcdkhTBlFwq+VvYZnNLE4CcBKL99bF2gPUAL0kdDC8Br40q4UBzdmWRFsTvAmMQ6YNU/W7aJ+TqDCWy+fdvpSnTlqLTrUMPWxZ1Bbz/gyuia2Pl+/1PHsVYkh+aerUsqCo8DbhIo+L9HRopMFN8haO482md68l99YfAU5rz6IuNjC8pHy6+VcRerkRFPzCYUPQwupe7Jik38ao/F9CFr5Y3x9/MJeX0uQFpKYABF1XzOrQSizXyPiCBPMXbDK9tP+78ipuIT1ykmciIerNAQxSs2XIDoCkdwflJWU5GQ5nZWy4/BdcJ9VneSbCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i++OF3M84w0EsH+VxnfRFjzbKO6nHxzr3RS36Vpzvno=;
 b=Hqy+7V1Usajwr1PMOU3YM1WsN74wB8LG0Lx74JQYPhIheJUDBko2MW4gnTyl01DxtmvseJLPtHn/RYDMCg2CoWErIRd0ukglYzI31Bfvo9NSgJXrjOIOzemEw312QN+e7uWA0A57dhPSGBHAW8L9c8Bv3a8KfbaM1RM2UpLHYGs8ZdJUZIoU7xa4HGHLn34pgZi92KX8+f+sE1uRWrj1R+rCqKMbYYePlmwZcSfg3bampHLDJAW27reCPc36p+v/AayxI9e+JXh1G9IaJyRmBxUn8WmWeqX4OPZZJnCo+qdnM0slGGJbMxhSW20LgCJ8JxwpSVk3kTeJASNynwhcbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 08:43:34 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 08:43:34 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH i-g-t v3 2/5] lib/intel_compute_square_kernels: use
 stoppable loop for LNL/BMG
Thread-Topic: [PATCH i-g-t v3 2/5] lib/intel_compute_square_kernels: use
 stoppable loop for LNL/BMG
Thread-Index: AQHbqLc2sFhzvt43kEin4DOAc3c1VbObBVwg
Date: Wed, 9 Apr 2025 08:43:33 +0000
Message-ID: <CH3PR11MB8434439530FD1FA551A1D6C18DB42@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
 <20250408185045.272673-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250408185045.272673-3-zbigniew.kempczynski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS4PPFDB7809488:EE_
x-ms-office365-filtering-correlation-id: 35b3f4b9-615c-443b-6ac1-08dd77429ce4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?aVFCRHJENW5wVzBnL09hc0FBdUZnUUxBZHg2bndybVhXR0RnQjdMSTJVc0N3?=
 =?utf-8?B?c2F6OE9RTDlORWg5N3JOWUgxU093d2lDcWlIR0JZSTZTSzhZREgwbU90WFkw?=
 =?utf-8?B?NkZJdVM5UnEwS0xFZU9oVEpBQmZhUENyOEtreDVtb1J1MWVubEt0c0IzZm9L?=
 =?utf-8?B?bDd3d3pKNGJPeENhcHIrWFk2eVZEZmdIMENTcHcwQm96V2NRNHduR2JNZkhw?=
 =?utf-8?B?S2tlbTBEYS9OQUd6Z2lGUnM0MEtPMTRGSWp0dnYzbzBISmdqNXFZUmh3Yk90?=
 =?utf-8?B?S1p5ZitUWWZZVVZzN3J2Nk1LR01YZkFOSUgzSDAyZS9vdWZsTFowdDVFYndX?=
 =?utf-8?B?dHcreWZ3NGZFVm16aWU0Z0R3RkVwQnZ1QVI4Zk5XSlZtUWp6blV6aStQOTQw?=
 =?utf-8?B?WnFYbkRheXlldDhaRTl3K3hXcjArNXdpZ3Urb2xtSWdUc1B4RFpBUUZKM1Fp?=
 =?utf-8?B?RG52cXYxc1lCNDA2V05xQTBzV0xCVEQ4andUbjRndk5ZcHl1bnVWZk1ZVVJN?=
 =?utf-8?B?SlF2MjlzZjd5K0lRYlFwZjJNSzlqTkVxejBiVkJLNi8vNTN2dUtrSVF0QThT?=
 =?utf-8?B?eWVBbW9BaHovOW12MUdFUWR4azBGQ2FMKzV2SmV4SCtvVkNpTWV0eldJQjc3?=
 =?utf-8?B?YXZtZ1UwWlBnRjU4allkWVBEaGUrbTV0T2tlVCtWNXgyOTlLZSs5VzJlWmVt?=
 =?utf-8?B?QldLTXhxTTZ3Vm1tYk5halBvZXhiQnRPN0dKRFhKUXpyMmMza29kdHNrUXlN?=
 =?utf-8?B?NElZdGwwRWVyNkVWRjhQZFdtRXFLS3VoUWdkbFJaQnRtSkplSEkvUUZGNm1T?=
 =?utf-8?B?TFVFRklWeVgrTFBDZHFweGpuUm1rT1g2SVFUOHRxMUF4c2NtV0wyUVRlM1Vv?=
 =?utf-8?B?K2czOUQwS2d1ZjRxT3VtUVRGOHBJaENNVk56VE1jMlJrM2Q0Z0dSVDFyK09n?=
 =?utf-8?B?SDhKU0doRjgyMHY3WjlhaEtpVlNOMmhJZlVYdlJDWWVVL1U5TUpLSHdsOGVB?=
 =?utf-8?B?eVdtMDVKbmk4UVpPZ1REcVR5WStPM29rUEptalRXVXJlSk1hQzlPS3cwR2tQ?=
 =?utf-8?B?eWt6V2t1cDhubzBpR21nV3JCV0pCT0x1Ukx1bjNLNitDU3djOHRpbzVlSEgx?=
 =?utf-8?B?R0RBcFpIaUw0UG8wc1ZnU3hWQThhWXZ3YituQjh3My9JcUVybEJBK2dscGtQ?=
 =?utf-8?B?ZTJkRURwbjlINStRZG1Xemk4QVdTUkwybzZ0YjVyQ20wUHE0UjhsVy9NbFlL?=
 =?utf-8?B?c2RZbVJQM0crdXZ2N2xjdEt3WXhJQW96dVo1MStIZ29NZ094cmw0NWpXTC92?=
 =?utf-8?B?cDJCR0NxOUlidmwva3FYNWtxdGJBb1p3aTZTb0Q1L251QWRZS01YK1hZUm9K?=
 =?utf-8?B?NmREMzZHZ1RMQ3FScFpnRG5Hd2c3eWhwdmxmQVJCc3NZQjN1ckxqcHVjVmNZ?=
 =?utf-8?B?S1RMcTMrdHpIOHhlRWdNTGs0WWNDSTYzWHpnd09xa2VvODF2anFULzl4RTNF?=
 =?utf-8?B?VlpvckdHU1J3OWNoQXBKRCtORFZFd0IvMGV6TzROYXJBZU80dktlN3A3NnJr?=
 =?utf-8?B?bjVVMW5FRzhzdVdsVXduT01JZDMxNG9jekt4U3VMNkFkRlBjT0ZmVVB0ZmF3?=
 =?utf-8?B?QmJ5SGlkV0N3TWl3TmVLYWs5NlloQ3FYRUtsQXVSUGVtYWd0bUNmMFNnamJm?=
 =?utf-8?B?WUtsUVVRMG9VTXduQWxEaURoUGJzMGxpSDdIQnlYZFpTU1E4ajFVYmxsOHI0?=
 =?utf-8?B?dEswZVNkTDkxSXc5eTlwQ3BLVUNZdUxUYkszV3RUSk1aaXloU2VlK3dwUjdM?=
 =?utf-8?B?eCtIR2lqRHhleTNzdk1Tb2xmYyszRVhlTHlHeHVzRFhmeThCMmZCU0NRSlRX?=
 =?utf-8?B?QUwxUmZ0RTZpdThvSGI4amY2ZEhzZGgwV3NGSWsxSjc4SnVNWWhWc2tCSmtJ?=
 =?utf-8?Q?frp+oGeYzT1afsJiBakawxA4uK4i5Mr3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFd3bmlCemYvTGVjcld0RUtlT3BVUnI4cUJUN3B3aFZTVnhRMjMwLzFNdXUz?=
 =?utf-8?B?NGxlTHhkL0VzQlppV3JXNUczTEZIMnR1SlVhMjNETGNkMUJRWkNWR2hRQzEv?=
 =?utf-8?B?YVFPbkk5eEtPY3dEcEZYNVJBbVNaaHFkWE1BYi9VYll6MGNzVzVoOEVhREh2?=
 =?utf-8?B?dVM2RW5venFiSEZqbG96OFpwRmRvOGVNdSt3SWUyTG5KRk9PMTNpMkp3OEVh?=
 =?utf-8?B?MHRSSEtRdmJuMkh1L3pYZWVReUxoMnZpYmxxMDk1SHBkbmNjKzV5bkFRcnM5?=
 =?utf-8?B?QnhyWWFhVW1UcWJHS3NtYTh6YWVuUFd5ZEtEUmMwL1UwVHRZS0hpOGhIUStx?=
 =?utf-8?B?LzVBWkIzbTVyMUN6RHRha2tvbXpDRjVteTNyWDhEa3RGTit1MUMwYWpPZjBu?=
 =?utf-8?B?TE5jM3Q2dVBOdWNBdkxqcDlLUjUrenlHU3N1VkdLY05BS25FcmZsaTZYSkhs?=
 =?utf-8?B?dTFuQzhtQXRzczd0L3RNMzk0emliay9hbnE4MzJoQTByTFBxdXVGZi84a1Zj?=
 =?utf-8?B?QXhzMW9TVktZMGVRZGpYYUprMlpqQ3ppQWdrNDc2YzgyTkpEaWh6SmxKdVdM?=
 =?utf-8?B?UWFLMndwdkZ4SmxYcW0xNGg2NmdzN2tjNW9hTENNaHl2VUYxVklYcVUrcVVQ?=
 =?utf-8?B?RTJYS0lDLzVrV1h0bU1PZVhsb1k1RFVIZ2NSMkZsRy9YL2FXZlM2TXhWeEZ2?=
 =?utf-8?B?eVlyTUFIdEVhS0VCOHg1TkE4Q2pTTFByTkZXdUxxTGZNK0tQdEp3eVhES3Ur?=
 =?utf-8?B?Y0J3VUdmU3V5dkxmdzIwaVUzL1lpaDFRT2h4NEE3MEsrd0pvL2dwemttTGNQ?=
 =?utf-8?B?MlJyeDNpWTNSSTRRRVZROG9RR0dhanA4WU9uQnV3c1FmS1JSbm1hSUtKeDFS?=
 =?utf-8?B?bWpLTHFtU21WTHVZeHpscmMxYk52eW5BYmdSNGdXYnMwWjVMOG9RTkJLRHBu?=
 =?utf-8?B?NUZ6S2dQM3MxVXlCR0txM05ObmYvT0hrOHhIYlMrUDBmWWZUNFNSeVNCaGZu?=
 =?utf-8?B?bVZ3UXFyVTFDeGpSZG5LSUVXSjVQeksyN3lWMnV4VTQ0Smh2aWxuT3VZSVU5?=
 =?utf-8?B?bGpJRXNOTThYK2s3alFsdlRxOHlvUFNzT1gzdlJZdjBWYWVjbHN4eXlwM2Rw?=
 =?utf-8?B?NVorSC9wZXVXMlJCQUQ2S2x5elJCeEUxRm5CU1hGeVYva1Zoc2RXS3ZsaDF0?=
 =?utf-8?B?US9OZVdLS0pGQnJXZU1hOUVkWndiOHA4dzJJYnB6bUVveUh4d2hSQm1pSWVq?=
 =?utf-8?B?c1M3bXRPcDVpNnNYRjRhbXo2emoxNHNWZkVVK0JycUtiMXk5Zi85Z1o3QkZ3?=
 =?utf-8?B?WW1WUHVZOU9CNkN4Um5aaTNmdHY0ZjlwOEhuYkRGVHJnMmc2Ym9Kd2ROem1m?=
 =?utf-8?B?azgxSUMycHlSUzRWUjY1RVBTK0c0bGJSNFhwQ0w1MCtqMWFROXZlTVMxSEdi?=
 =?utf-8?B?TXZQZ2FHS1BTdEFZVkNkSDNENkhhai8ySzV4RW1OTUFvTE4wT3ByLzlBeGVo?=
 =?utf-8?B?WmZHc2p4REl3YlZ6bXdFTjNsbVQ1K0d0cEYrbDBTeldrNjdkSjc1Mk1Rc0hk?=
 =?utf-8?B?VjlhUXErYTg4bUxDa1g4RGlHZEptbWhDazRwQ2YvZmVGMy9iS0hZTmIzMkR5?=
 =?utf-8?B?cTdWUXl5cEJ6WWZabzdYOVl1ME44TkpnY0N2ejRKVDBRQXpxQ3U0bmxBNEs0?=
 =?utf-8?B?VzhUSlh4ZlJtaGF2QVY0b3EyNEwxYXB4V0MrbWRSMHNLUERQSSsxOFpGL1Rk?=
 =?utf-8?B?UERBTlJFby9zYVlwMU5iNWZKcEhEMWNvT21lZkY1WnhpQ0x5d0pmdFBqV3Nz?=
 =?utf-8?B?bmlCTVoyeEIrZGJINWcxQ1ZNQnBCZktuREZ6R0thOWZ0U3I3M2JzT2d1dGRM?=
 =?utf-8?B?MnRmemVkSWMrVml3RXptWE1ONmJDRHBRczJYQ05sRk5wQlovdDdVcElwNG5o?=
 =?utf-8?B?a3VERTgvZkRSMG1icDVvV2dDMEFhWTRkalQxbktmZmpzYVBkazJZaHRsQzdu?=
 =?utf-8?B?ZjNDSGFaUFlKaEFxUmNWU2pHZFlxQnhQcXl2M2cxYzZ2QnFTaDV3ZVNIVlZS?=
 =?utf-8?B?R296M3l2WkpFbDhTV3MzbmpCWDk0RTdQcUxCN09sZ2hMZ3BvNWFSWFVyQVY1?=
 =?utf-8?B?eDB6cWF4OHVJR3BiNGM4NXNPUHYrOFl0WGFHRnNDWi91Uytvc25Zcy9EVktR?=
 =?utf-8?B?VDBaUVpVS3grYUxtdU9MTk1hMm1iWXpUSFhNcmFJd2tCTDRxTlFJdjdZaFl0?=
 =?utf-8?B?Z0tQRHBOQWI5bFNxNmdxcWcrdU9nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b3f4b9-615c-443b-6ac1-08dd77429ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 08:43:33.9942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QaHUS2UK+gUWnP2BOk7q2/lP2fr1QccKlJt5XxCf5iL6nJ5n27kLcE/i/6bQzBNZU9o5wz62y0QfP/bz94CVu3hGPBJ006O4+DX8TFGVTVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2VtcGN6eW5za2ksIFpi
aWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IDA5IEFwcmls
IDIwMjUgMTI6MjEgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47
IER1Z2FzdCwNCj4gRnJhbmNvaXMgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+OyBEYW5kYW11
ZGksIFByaXlhbmthDQo+IDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggaS1nLXQgdjMgMi81XSBsaWIvaW50ZWxfY29tcHV0ZV9zcXVhcmVfa2VybmVsczog
dXNlIHN0b3BwYWJsZQ0KPiBsb29wIGZvciBMTkwvQk1HDQo+IA0KPiBJbnN0ZWFkIG9mIHR3ZWFr
ZWQgbG9vcCBzdGFydCB1c2luZyBsb29wIGluIHdoaWNoIHdlIG1heSBzdG9wIGl0IHZpYSBzaW1w
bGUNCj4gY3B1IHdyaXRlIHRvIG1lbW9yeS4gQ3VycmVudGx5IHRoaXMgaXMgcG9zc2libGUgZm9y
IExOTCBhbmQgQk1HIHBsYXRmb3Jtcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtl
bXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBDYzogRnJhbmNv
aXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBDYzogUHJpeWFua2EgRGFu
ZGFtdWRpIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pbnRl
bF9jb21wdXRlX3NxdWFyZV9rZXJuZWxzLmMgfCA0MQ0KPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbGliL2ludGVsX2NvbXB1dGVfc3F1YXJlX2tlcm5lbHMuYw0KPiBiL2xpYi9pbnRl
bF9jb21wdXRlX3NxdWFyZV9rZXJuZWxzLmMNCj4gaW5kZXggNzZjNDhjNDUxMS4uNjI2ZGJjNGNl
YyAxMDA2NDQNCj4gLS0tIGEvbGliL2ludGVsX2NvbXB1dGVfc3F1YXJlX2tlcm5lbHMuYw0KPiAr
KysgYi9saWIvaW50ZWxfY29tcHV0ZV9zcXVhcmVfa2VybmVscy5jDQo+IEBAIC0zODQ0LDYgKzM4
NDQsNDMgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNoYXIgeGUybHBnX2tlcm5lbF9pbmNfYmlu
W10NCj4gPSB7DQo+ICAJMHgwMCwgMHgwMCwgMHgwMCwgMHgwMA0KPiAgfTsNCj4gDQo+ICsvKg0K
PiArICogT3BlbmNsIGNvZGUgaXMgaW4gb3BlbmNsL2xvb3AuY2wNCj4gKyAqDQo+ICsgKiBUbyB3
b3JrIHByb3Blcmx5IGl0IHJlcXVpcmVzIHRvIHVzZSB1bmNhY2hlZCByZWFkcywgc28gb2Nsb2Mg
aGFzIHRvDQo+ICsgKiBiZSBjYWxsZWQgd2l0aDogLW9wdGlvbnMgIiAtaWdjX29wdHMgJ0xzY0xv
YWRDYWNoZUNvbnRyb2xPdmVycmlkZT0xJw0KPiArYXJnICovDQo+ICsNCj4gK3N0YXRpYyBjb25z
dCB1bnNpZ25lZCBjaGFyIHhlMmxwZ19rZXJuZWxfbG9vcF9iaW5bXSA9IHsNCj4gKwkweDY1LCAw
eDAwLCAweDAwLCAweDgwLCAweDIwLCAweDgyLCAweDA1LCAweDdmLCAweDA0LCAweDAwLCAweDAw
LCAweDAyLA0KPiArCTB4YzAsIDB4ZmYsIDB4ZmYsIDB4ZmYsIDB4NDAsIDB4MTksIDB4MDAsIDB4
ODAsIDB4MjAsIDB4ODIsIDB4MDUsIDB4N2YsDQo+ICsJMHgwNCwgMHg3ZiwgMHgwMCwgMHgwMiwg
MHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgzMSwgMHgyMCwgMHgwMSwgMHg4MCwNCj4gKwkweDAw
LCAweDAwLCAweDBjLCAweDAyLCAweDhmLCAweDdmLCAweDAwLCAweGZhLCAweDAzLCAweDAwLCAw
eDcwLCAweGY2LA0KPiArCTB4NjEsIDB4MDAsIDB4MTAsIDB4MmMsIDB4MDEsIDB4MDAsIDB4MTAs
IDB4MDAsIDB4NjYsIDB4MDksIDB4MDAsIDB4ODAsDQo+ICsJMHgyMCwgMHg4MiwgMHgwMSwgMHg4
MCwgMHgwMCwgMHg4MCwgMHgwMCwgMHgwMiwgMHhjMCwgMHgwNCwgMHgwMCwgMHg0MCwNCj4gKwkw
eDAxLCAweDA5LCAweDhjLCAweDNjLCAweDAwLCAweDAwLCAweDEwLCAweDAwLCAweDYxLCAweDgw
LCAweDg0LCAweGE0LA0KPiArCTB4MDQsIDB4MDIsIDB4MTAsIDB4MDAsIDB4MzEsIDB4MjEsIDB4
MDEsIDB4ODAsIDB4MDAsIDB4MDAsIDB4MGMsIDB4MDMsDQo+ICsJMHgwYywgMHgwNCwgMHgwMCwg
MHhmYiwgMHgwMCwgMHgwMCwgMHhhMCwgMHgwMCwgMHg3MCwgMHg4MSwgMHgxNCwgMHg4MCwNCj4g
KwkweDYwLCAweDg2LCAweDAxLCAweDAwLCAweDA0LCAweDAzLCAweDAwLCAweDE2LCAweDM0LCAw
eDEyLCAweDM0LCAweDEyLA0KPiArCTB4MjAsIDB4MDAsIDB4MDAsIDB4OTQsIDB4MDAsIDB4NDAs
IDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+ICsJMHhkOCwgMHhmZiwgMHhm
ZiwgMHhmZiwgMHg2MSwgMHgwMCwgMHgxMCwgMHgyOCwgMHg3ZiwgMHgwMSwgMHgxMCwgMHgwMCwN
Cj4gKwkweDMxLCAweDIyLCAweDAyLCAweDgwLCAweDA0LCAweDAwLCAweDAwLCAweDAwLCAweDBj
LCAweDdmLCAweDIwLCAweDMwLA0KPiArCTB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4
MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+ICsJMHgwMCwgMHgwMCwg
MHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgw
MCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAweDAwLA0KPiArCTB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAs
IDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+ICsJMHgwMCwgMHgw
MCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwg
MHgwMCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLA0KPiArCTB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4
MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+ICsJMHgwMCwg
MHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgw
MCwgMHgwMCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLA0KPiArCTB4MDAsIDB4MDAsIDB4MDAsIDB4MDAs
IDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+ICsJMHgw
MCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwg
MHgwMCwgMHgwMCwNCj4gKwkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLA0KPiArCTB4MDAsIDB4MDAsIDB4MDAsIDB4
MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+ICsJ
MHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCB9Ow0KPiArDQo+
ICB1bnNpZ25lZCBjaGFyIHhlbHBnX2tlcm5lbF9zcXVhcmVfYmluW10gPSB7DQo+ICAJMHg2MSwg
MHgwMCwgMHgwMywgMHg4MCwgMHgyMCwgMHg0MiwgMHgwNSwgMHg3ZiwgMHgwMCwgMHgwMCwgMHgw
MCwgMHgwMCwNCj4gIAkweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDY1LCAweDAwLCAweDAwLCAw
eDgwLCAweDIwLCAweDgyLCAweDQ1LCAweDdmLA0KPiBAQCAtNjYyOSw2ICs2NjY2LDggQEAgY29u
c3Qgc3RydWN0IGludGVsX2NvbXB1dGVfa2VybmVscw0KPiBpbnRlbF9jb21wdXRlX3NxdWFyZV9r
ZXJuZWxzW10gPSB7DQo+ICAJCS5sb25nX2tlcm5lbF9zaXplID0gc2l6ZW9mKHhlMmxwZ19rZXJu
ZWxfaW5jX2JpbiksDQo+ICAJCS5zaXBfa2VybmVsID0geGUybHBnX2tlcm5lbF9zaXBfYmluLA0K
PiAgCQkuc2lwX2tlcm5lbF9zaXplID0gc2l6ZW9mKHhlMmxwZ19rZXJuZWxfc2lwX2JpbiksDQo+
ICsJCS5sb29wX2tlcm5lbCA9IHhlMmxwZ19rZXJuZWxfbG9vcF9iaW4sDQo+ICsJCS5sb29wX2tl
cm5lbF9zaXplID0gc2l6ZW9mKHhlMmxwZ19rZXJuZWxfbG9vcF9iaW4pLA0KPiAgCX0sDQo+ICAJ
ew0KPiAgCQkuaXBfdmVyID0gSVBfVkVSKDIwLCAwNCksDQo+IEBAIC02NjM4LDYgKzY2NzcsOCBA
QCBjb25zdCBzdHJ1Y3QgaW50ZWxfY29tcHV0ZV9rZXJuZWxzDQo+IGludGVsX2NvbXB1dGVfc3F1
YXJlX2tlcm5lbHNbXSA9IHsNCj4gIAkJLmxvbmdfa2VybmVsX3NpemUgPSBzaXplb2YoeGUybHBn
X2tlcm5lbF9pbmNfYmluKSwNCj4gIAkJLnNpcF9rZXJuZWwgPSB4ZTJscGdfa2VybmVsX3NpcF9i
aW4sDQo+ICAJCS5zaXBfa2VybmVsX3NpemUgPSBzaXplb2YoeGUybHBnX2tlcm5lbF9zaXBfYmlu
KSwNCj4gKwkJLmxvb3Bfa2VybmVsID0geGUybHBnX2tlcm5lbF9sb29wX2JpbiwNCj4gKwkJLmxv
b3Bfa2VybmVsX3NpemUgPSBzaXplb2YoeGUybHBnX2tlcm5lbF9sb29wX2JpbiksDQo+ICAJfSwN
Cj4gIAl7DQo+ICAJCS5pcF92ZXIgPSBJUF9WRVIoMzAsIDAwKSwNCkxHVE0sDQpSZXZpZXdlZC1i
eTogUHJpeWFua2EgRGFuZGFtdWRpIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiAt
LQ0KPiAyLjM0LjENCg0K

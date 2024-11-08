Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CF8D5C0C8
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 13:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C6E10E004;
	Fri,  8 Nov 2024 13:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfossInS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBED010E004
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 13:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731073302; x=1762609302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dn4iPLwDOkY/b5BPxIboUf7rRo8b9AYqmqaEwONfZIM=;
 b=BfossInS7gPPOfQ2Q43llZpaTLopzsTn9FpOSnqXI7yzkcNj/j7i5obs
 E7OD045hF5/AARqSHsu08SzBxnoo2dov7mOELoXRdc9zYhgKhl2r+ZF7k
 Ns2aBF6+vFe6jgywVFL9xKsY4rv+ftP3e9IXXiu7Uk0idgDoh3V6E1G5J
 3yn8uW1TjXhHeehRP9+PktB4muzjgPX9Nu+nQXJshLlap4Q/CBG+Sq03f
 ClPIcKw72VAWXUekL6TjOQ7QdzNtBKrJ3Qv0P7q0eKwWtoxnVh1qsC1Ya
 +z2M2Pv6R1TsZdrOodtv097G8ZIBxKkEUfMBWrLVOBNqFOc59VRvIkrY5 A==;
X-CSE-ConnectionGUID: dgR05khnTBiKaxNxZINpow==
X-CSE-MsgGUID: 6Y2q5qq6ToeW4cIKf4Oygw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="33815312"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="33815312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 05:41:41 -0800
X-CSE-ConnectionGUID: tRpRb2YiRrGMNQQTx62A9w==
X-CSE-MsgGUID: +6c+aC94R02QlvTkBgTaCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85712726"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 05:41:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 05:41:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 05:41:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 05:41:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBno7E0r4JiHXG8QQUYN8Gp4loy7wPRqpJlVxHfqMBUktjdIBzHDOTzD6D5aO1Rw1uX4QL/rfhitkZ4elLyltDpatpz+j3J73agNX6jl6JkWmSloOPzhOtdEXXffzxRTa66VWnB5ys8w2jEp25wS5n1P5v3IgA74C+hsygSj8IrRx7n4PxfVVA6lLSK5ny5svcIM68hpl99jw8x8HoZgWmKpopXOapQnE1WB8aV5e7u+c5he8H1OZyLu+UWYbYhK3jpkj7kWF+E1i5QhmVnZWdYM2kFuK5zdpj6CsFirE2y/IqWQSid+MQUeyyWSSQ/hKS+NXcJ4KQ9RF8G84J2lkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn4iPLwDOkY/b5BPxIboUf7rRo8b9AYqmqaEwONfZIM=;
 b=Hc1my0+gtR8MT5oKR+Ri0JJontYuCybGVLa7VaHM5e77vBTuPUZob+3nidJ0625iztpuX46AqkK9W223ORSvYwuJhMux7nHB6XH7erxs94it14reU9If8Z7bPavu3ympR69yhzsu5p/7HVLRJH16Z94NH6Ck7GKJhY7N822Zb/AwWVyaiPcRI+j80tpkPV1KaE+UwlZHWGij3lAHeiQvrM9vO/CbfTL3evhCbCzOdOndtWWN1ZwCNGUToMmMmNigcUGeft4x13RQHXjSii4t8s6eiApFLewYEZ4g0A+/9oRVH5zIziol3unvSJ6tKzD9KN6pOZy3E5Gd5gG45GASmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 13:41:27 +0000
Received: from MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::a942:e985:4705:e118]) by MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::a942:e985:4705:e118%3]) with mapi id 15.20.8114.032; Fri, 8 Nov 2024
 13:41:27 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sousa,
 Gustavo" <gustavo.sousa@intel.com>
Subject: Re: [PATCH i-g-t] igt-runner fact checking
Thread-Topic: [PATCH i-g-t] igt-runner fact checking
Thread-Index: AQHbMS2AJqpGUHGjFUOxizV+nlIZr7KslOoAgABeDACAAHJ8AA==
Date: Fri, 8 Nov 2024 13:41:27 +0000
Message-ID: <51f2ce0c6ddb8569c79dac8d01ad07134892f5f5.camel@intel.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
 <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
 <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
 <4dbdbc32618cc7bbc7b13ee961534fc798be5b91.camel@intel.com>
 <08f43b41-cd86-415d-83e0-ce4fa161545c@linux.intel.com>
In-Reply-To: <08f43b41-cd86-415d-83e0-ce4fa161545c@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5857:EE_|CH3PR11MB8096:EE_
x-ms-office365-filtering-correlation-id: 4ed3857b-62a7-496f-5236-08dcfffb0b79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bVJOSWtUNm55T2NHcEp4b0hwRDBVVWpvc3FiZjc1U09JSFVGbzRMZEZIN0o0?=
 =?utf-8?B?ZE9rTlFMcVN1eUJFUmNRYnpXOW5jZ2N6N1ZjbXA0TUMra3dzU3gyMW84NzBv?=
 =?utf-8?B?RFlyTTRremI4UW82Ulc2RjlCSUtucTVOUm1ONGlCaVF1QWw4UVJiZ1NDcUNo?=
 =?utf-8?B?MlR6R2ZXMXZZSEkzZUk4TU1HeGVCVmRZYWJFOVI0cjNoNm82ZDJPcXF2RFpQ?=
 =?utf-8?B?T1Y4M0p4U0M2THhpaUlPWHVZVnVBNGN2Tjd4SU5mUG9BVGlaTFQxZXp0TUt2?=
 =?utf-8?B?eWdaV2lVcEFubFNML2RBNzJhTExOdjRkNktmWDNkZFMrc1kxWFNiNDVoTTkr?=
 =?utf-8?B?cUxjRVpkWlJocVQ1aWVGUytoNmZVdHNjbU5nM3pCRkdiMGpwQ0xQL2llY0dm?=
 =?utf-8?B?RW1VNVpydjB4WWJ5ZVdTU0psUTNPL3dWcGJoNVlVazhOUXBFdjRNQXdibzBu?=
 =?utf-8?B?UElmYjM0NmlEVmk2WkJJOFB4UnlxekVaNVJ0R1V1bDBYOUVINVgrQWdpMlhs?=
 =?utf-8?B?M1JDSVYwRmYyenRXalVUWEd0blpUWnpNa1BvTm5KcWkwMDQ1WHEyUlRTUFhm?=
 =?utf-8?B?alVaNkszbnljeExNakw3R280WnBXTVJSUDZOTWxtZm42aU9nbzA4aWlLM250?=
 =?utf-8?B?TzFEeXNOVVJFTVJOQmkxaUtHVGlnR3UvTnZWbDZ3SXYrZVdTV3ZRQkNOY1lE?=
 =?utf-8?B?cFhiaHBWK1VITi80d2YrOWhINzBDNGFJTkptaUVpZFU0c2lWUkMvTkwrNFZJ?=
 =?utf-8?B?eHUvWXM0UGlCNFQvQkpTQ2pvQUdMYTJoTUxNZk5Pc3JiR0lIc0ExTGV6UExq?=
 =?utf-8?B?TGFYK1JVT1NBQ1Y3c2ErZkhxVlR3T2VYcVdkSlVGSXYwT2tKQy9qVlVzRVRK?=
 =?utf-8?B?RGEvYnM0R3VMRkd5dWVUaE4zSjBJQ2NqclZqeVBSZldIUmxOMXhFVEdpVTNr?=
 =?utf-8?B?VzlwQkJMV0pyK1Fob0dCWWJacnZUQmdvM080MkNIYVdxVUlScHkrWU1CZW1B?=
 =?utf-8?B?cld3OTZjKzdzZGRBWEpGNzBGaVdQZ0xlQ3ltMDc5bWNmVzBTT3NVMU1uQ0dE?=
 =?utf-8?B?S3pGb1NpdGt5M1BwUHRsT0RMemNwTSsxcTlIVVRkaHBZbEhhbWFPY0ZReGJi?=
 =?utf-8?B?cU8xU3hEbDQwd25hWjNFOHNzQ2ZqYXlHTmloV3h3VlZCSWNlZm5hK0hBTFFL?=
 =?utf-8?B?ekJ3eTRZVVl4SU5QYU5yL0dWalA0RCsrRnFXMzNtcy9ab2tXTHFBUWk0eG9S?=
 =?utf-8?B?ZCtoOVhEbU1VaWJPUnlEWlZJRFhVd0ROSjVSOXNrcHJweEFCWFdqUG53ays0?=
 =?utf-8?B?Z09mS091MVR0RHBXZzhJVEdENFBCVXdoRHBZVWM4eitkSFMwTm40ZEpEVi93?=
 =?utf-8?B?dGNESzhWQ0dnR3BJeUsyT0h1cW8vSVpxd1dJanNXeWFxbjRocml0UC9DN29M?=
 =?utf-8?B?UlFmL0d6WXo5VDFKTHEwc2pyM29PRkFRQ3FBc2tzNnhhNGo4VEN4L2VJTWpJ?=
 =?utf-8?B?amdYNzU3L0VlanUxU1ppUkxIYkltemRERm16dXRFaGR4YmZObUFVb3ZTdTJY?=
 =?utf-8?B?QUNXWEYvbFFSR0UrUGUyeXg0c05XRml3OWtaV0dXR2dBK0JRRC9MYnZSUFRW?=
 =?utf-8?B?aTZKNllHVUxKMVRKbGVzUWFrT21SQUpnV2hVVzdzVXo1YUhsQzVmd0Y1SmI3?=
 =?utf-8?B?akpmSWhBdDIyL1Y4SHR6S1Mvczl2WDRtRUl3cTZoa0tJRFM0YU1LYUlORkZ3?=
 =?utf-8?B?MnlhOFQ4ZHNRWGRJR2M1bm16c2ttbWorMEx2OVduV3k2MmtNRUJ2YTc5OWRQ?=
 =?utf-8?Q?DN3LxEHKr7ohWV1Y5Wcw6VgyhrADLDhBawMsk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5857.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEVKQ2RGbHZadjJ1cW93MUNkQ3V4eUxCZU9FUHVZbW1CZ2ZNSFRMekJFemY4?=
 =?utf-8?B?cmJMWERHRDhmdDdicGVzMExHZGZEMEcrbEI5TDBYS2duWktEaURUNG5ibGJL?=
 =?utf-8?B?YnM1bWhRL1VVY3dSOGt1cUwvb0E1cGxHd1BOYmVyLzI0S1Z0L1VsUGZMb3Qw?=
 =?utf-8?B?MjRURmdsRitQZ2RYRVdWa1VOVlNZYUhvTTZ3ckVOTVFKcnpSRXB1QzhCbkhr?=
 =?utf-8?B?NndQTHQ0UE5Jczl3emg5UzVhUXBEYjlITXpwaDFvZ1R2K09iYVV3eTNBRzlN?=
 =?utf-8?B?ZHA0VVNWaTJJdnczSnBFbGsxM0FLUWNzZXBwWFNKMkRyeUI1cW1Pam1hWjNT?=
 =?utf-8?B?R3hJMDdiTXZ5SkVTL0dDU2xEN29WZXhWbnlBbzhsZ01HUTVyeFQxUVdGU3R2?=
 =?utf-8?B?bnJPN2dQYnFLY2JnRUZCeHV1MGpDQ0dLSHlxdFQxbUg2dVh0cEpEK1FwbTUw?=
 =?utf-8?B?bkJJemxianZlMEpZYVB6dk1kWEc5dHh5MFVCclJzUmErY1h4T0tMQ3pDSUlz?=
 =?utf-8?B?YVI1RkZqWTRwUGVRbEJkcVFoN2FSOEg2c2hpbEVDUVRwaFZ3SFR6L0ZkNUhm?=
 =?utf-8?B?SlRoN2p0L2Fyckg5Y2o1d0p4OERkZlI1WG9ET0paZCtRR3h1eDJuOUhYKzRM?=
 =?utf-8?B?NE1IWXoxanZtVlJsQjJZV21QWWJ3a2lqdy9JT1A1c05adGVDMHM5VUMrYzYw?=
 =?utf-8?B?NGY1NVJRc00rdmNNYjN3SktkeGg5bGZIZkE5aS9McmFodExacHZadUs1NVdR?=
 =?utf-8?B?c3RIL2RxNW4zT0cvVnNvSU02dGtwYkxTb0JlRUo5U0ZISjdGSlpVUUVxT3Rt?=
 =?utf-8?B?VGF5ODBGMDB2SFVtL0ZqMjN3dzgzSFhyT3I2Z2hmeXI3RUVlUkh2NmR3Ry9k?=
 =?utf-8?B?dU5NeTNOanl6TnRNbVYyN1MvVmp2YzJFZElvN3dGRkZJcUl4MlU4RHIwRlRj?=
 =?utf-8?B?clJLL1Z4NlVtUVhYSlNxQnl6a2xCTy9ZNmFrMWNQemZwZ09xaHQwYTBIV2E3?=
 =?utf-8?B?djBkczJLZ3RTSmdIZURuV085eWVQdURJeDE0Rzk4RjV1UXRMZXMyK1JUT0RG?=
 =?utf-8?B?dHBPVTlETTVVYndvU1k5RElSMkE4MkhobklxdnlCU2R1WHdGZWdXYThsalpL?=
 =?utf-8?B?UVNENGMvVVBDajBYSlNDQlNQcUZ5UUVsaDFuNXV0VEROczlxN0JOSFVvcEgw?=
 =?utf-8?B?eGZESWVqSER1MDhGTmhyMEpsanAwaXVwR0NqeG9naXdYdVdxVGR1azF6YlE5?=
 =?utf-8?B?QllzQi9LQUhoZk9wTWNhV2t0WFNFYTZmcHphazNoZE9VdWVKaElwOXdqUytQ?=
 =?utf-8?B?ZGFsNFVsNlFkbU15bE5jbENjclhhNldvL2FlYmhHTEVFTmNmcDZENnA4bmFK?=
 =?utf-8?B?T25Ma2ZtZ0dkY1M0Yy9ySFgxMnVJTGlqMlR1cFNoM0JrVXplSXZEeThEdEhV?=
 =?utf-8?B?MTdoZGNpVzNabGZaYkorRnhTUDVvVFdhMHVTaDZYeml2QkdhcVhVY0NMZ2ZB?=
 =?utf-8?B?ZitLRlRDNGtNSUk2RnBJN2lTMEtVS09WeG5jWGppazVpSWdpUWp0dFYwS1VP?=
 =?utf-8?B?VG1CUUZQTFdZWm8xWW41Q3lBRkVoc29FbTRaSzNVSWNuNUlLRHFURllYdjdW?=
 =?utf-8?B?RkNIV1orMFU2ay95U28xSDdQbmpPZmswOG5ocStxNU03bHRMWnEzanpucVdj?=
 =?utf-8?B?M2pHdHhIbkRjSk16TmRXTTZhUmlBVDBub0JGQ3BlYVZCcTBPTkYvdy9TZk9Q?=
 =?utf-8?B?dkFUMTlKdlowYWVVbEpKVHN0QVFzWG1Rdk9peTJCbGprcUtGK1lnbyt3ak5j?=
 =?utf-8?B?blV5VytsMDBUNEZET0dxb1Y2MTdMZDg0TERVM24vZ2hLci92QmRBdEhRWENM?=
 =?utf-8?B?cXN5TTJnK1BaYndSVnVLWjN4aUhtc1FsQWNxai8vSFBhVTl0cENyZUJqS1gz?=
 =?utf-8?B?UDRHdHFqRFlSc0ZrU3dGOUthcGpZTHY2SG43NXR4azZwMHMrRWt6MmxFcE5x?=
 =?utf-8?B?YUFLRy8wN0diQld0eThzYVJNK0VPOEJ3eXd1NzQ1SnlqL29wS0pHcGdMLy94?=
 =?utf-8?B?VGU0Y0JNbitBS0JTRWtlcERqclNGRFUvYXN5NWk4Z2s0SWV6VUlZR2E3M2FC?=
 =?utf-8?B?czRnU1NCb1Z5SzhDbnJueTFReXhPSktsMDJCM1d5MXYyTm1sNU84N3d1bmN6?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D544C5993DAE14EA37E8EDFE67ED1B1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5857.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed3857b-62a7-496f-5236-08dcfffb0b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 13:41:27.3709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9DW+zrFKv9ONo4hSi6pjt32c9EO/4gO32U+O77AhASSKwYU84DH0uQeiOOGOoPZzo8yNpRs7MvbcPHnv6iQs7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

T24gRnJpLCAyMDI0LTExLTA4IGF0IDA3OjUxICswMTAwLCBQZXRlciBTZW5uYSBUc2NodWRpbiB3
cm90ZToNCj4gRGVhciBSeXN6YXJkLA0KPiANCj4gVGhhbmsgeW91IGZvciB0YWtpbmcgdGhlIHRp
bWUgdG8gd3JpdGUuIFBsZWFzZSBzZWUgbXkgY29tbWVudHMgYmVsbG93Lg0KPiANCj4gT24gMDgu
MTEuMjAyNCAwMjoxNSwgS25vcCwgUnlzemFyZCB3cm90ZToNCj4gDQo+IFsuLi5dDQo+IA0KPiA+
IA0KPiA+IEV4dHJhIGhvb2tzIG1vcmUgb3IgbGVzcyBoYXJkY29kZWQgaW4gdGhlIGNvbW1hbmQg
bGluZSBmb3IgYSBnaXZlbiBydW4NCj4gPiBhcmUgZWFzeSwganVzdCBsZXQgdXMga25vdyB3aGVu
IHRvIGFkZCB0aGVtLiBSZWFkaW5nIGV4dHJhcyBmcm9tIHRoZQ0KPiA+IGNvdmVyIGxldHRlciBp
cyBkb2FibGUsIGJ1dCB3b3VsZCByZXF1aXJlIHRpbWUgKHRoaW5rOiBlYXJseSBuZXh0IHllYXIs
DQo+ID4gbm90IGEgd2VlayBvciB0d28pLCBhcyB3ZSBhcmUgc3dpdGNoaW5nIHRoZSBQYXRjaHdv
cmsgaW50ZWdyYXRpb24gdG8gYQ0KPiA+IG5ldyBpbXBsZW1lbnRhdGlvbiBhdCB0aGUgbW9tZW50
Lg0KPiA+IA0KPiA+IEFsdGhvdWdoLCB0d28gY29tbWVudHMgYWJvdXQgdGhlICJmYWN0cyIgaW5m
cmE6DQo+ID4gDQo+ID4gLSBJIGxpa2UgdGhlIHNpbXBsZSB0ZXh0IGZvcm1hdCwgYnV0IGlmIHBv
c3NpYmxlLCBtYWtlIHRoZSBvdXRwdXQNCj4gPiBlYXNpZXIgdG8gcGFyc2Ugd2l0aCBhIGNvbnNp
c3RlbnQgZm9ybWF0IGZvciBhbGwgc3RhdGUgY2hhbmdlcywgbGlrZToNCj4gPiBbRkFDVCA8dGVz
dD5dIDxuZXd8Y2hhbmdlZHxkZWxldGVkPjogPHByb3A+OiA8dmFsdWU+WyAtPiA8bmV3X3ZhbHVl
Pl0NCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhhdCwgaXQgd2lsbCBiZSBvbiBWNC4gV2hhdCBzdHJp
bmcgZG8geW91IHdhbnQgZm9yIHRoZSBmaXJzdA0KPiBmYWN0cyB0aGF0IHByaW50IGJlZm9yZSB0
aGUgZmlyc3QgdGVzdD8gQ3VycmVudGx5IGlzICJiZWZvcmUgYW55IHRlc3QiLg0KDQpBbnkgd2Vs
bC1rbm93biBjb25zdGFudCB3b3JrcywgImJlZm9yZSBhbnkgdGVzdCIgc291bmRzIGdvb2QuDQoN
Cj4gSnVzdCB0byBtYWtlIHN1cmUgSSB1bmRlcnN0b29kIHdoYXQgeW91IHdhbnQsIHRoZSBmaXJz
dCAnW10nIGFyb3VuZCBGQUNUIGFyZQ0KPiBpbnRlbmRlZCB0byBiZSBwcmludGVkIHdoaWxlIHRo
ZSBzZWNvbmQgb25lcyBhcm91bmQgIC0+IDxuZXdfdmFsdWU+IGFyZSBub3QgdG8NCj4gYmUgcHJp
bnRlZCBhbmQgYXJlIHRoZXJlIHRvIGluZGljYXRlIGFuIG9wdGlvbmFsIHBhcnQgb2YgdGhlIG1l
c3NhZ2UuIENvcnJlY3Q/DQoNClllcywgdGhhdCdzIGNvcnJlY3QsIFtGQUNUIC4uLl0gaXMgYWx3
YXlzIHRoZXJlLCBbIC0+IDxuZXdfdmFsdWU+XSBpcw0Kb3B0aW9uYWwsIHNvcnJ5IGZvciB0aGUg
Y29uZnVzaW5nIGRlc2NyaXB0aW9uLg0KDQo+ID4gLSBXaGlsZSBydW5uaW5nIHRoZXNlIGZhY3Rz
IHdpdGhpbiBob29rcyBjb3VsZCB3b3JrLCBpdCB3b3VsZCByZXF1aXJlDQo+ID4gZXh0ZW5kaW5n
IHRoZSBob29rcyB3aXRoIHNvbWV0aGluZyB0aGF0IGNhbiB1bmRlcnN0YW5kIHRoYXQgYSBnaXZl
bg0KPiA+IGNvbW1hbmQgaXMgc3VwcG9zZWQgdG8gb3V0cHV0IGEgYnVuY2ggb2YgZmFjdHMgaW4g
YSB3ZWxsLWtub3duIGZvcm1hdA0KPiA+IChpZGVhbGx5IEpTT04sIGFsdGVybmF0aXZlbHkgYSAi
a2V5OiB2YWx1ZSIgdGV4dCBibG9jayksIHRoZW4gZGlmZiB0aGVtDQo+ID4gYWdhaW5zdCB0aGUg
c3RhdGUgZnJvbSB0aGUgcHJldmlvdSBydW4gb2YgdGhlIHNhbWUgaG9vay4NCj4gDQo+IFBsZWFz
ZSB0ZWxsIG1lIHdoYXQgeW91IHdhbnQuIEkgbGlrZSB0byBoYXZlIHRleHQgb3V0cHV0IG9uIHRo
ZSB0ZXJtaW5hbCB3aXRoDQo+IGlndC1ydW5uZXIgb3V0cHV0LCBidXQgaXQgaXMganVzdCBhIGNv
bnZlbmllbmNlLiBQbGVhc2UgdGVsbCBtZSBob3cgeW91IHdhbnQgdGhlDQo+IG91dHB1dCB0byBi
ZSBwcmludGVkIGFuZC9vciBzYXZlZCB0byBkaXNrLg0KDQpJIGRvbid0IHBhcnRpY3VsYXJseSBt
aW5kIHdoYXQgaGFwcGVucyBoZXJlLCBqdXN0IHRoYXQgaWYgeW91IGFyZSBnb2luZw0KdG8gdXNl
IGV4dGVybmFsIGhvb2tzIGFzIGZhY3QgcHJvdmlkZXJzLCB0aG9zZSBleHRlcm5hbCBob29rcyBj
YW5ub3QNCmp1c3Qgb3V0cHV0IGFyYml0cmFyeSB0ZXh0IGlmIHlvdSB3YW50IGxpZ2h0d2VpZ2h0
LCBlYXN5LXRvLXJlYWQgZGlmZnMuDQpUaGUgc2ltcGxlc3Qgd2F5IGlzIGp1c3QgdG8gcHJpbnQg
a2V5OiB2YWx1ZSBsaW5lcyBvbiBlYWNoIGhvb2sNCmludm9jYXRpb24sIGxpa2UgdGhpczoNCg0K
aGFyZHdhcmUucGNpLmRybV9jYXJkX2F0X2FkZHIuMDAwMDowMzowMC4wOiBjYXJkMQ0KaGFyZHdh
cmUucGNpLmRybV9jYXJkX2F0X2FkZHIuMDAwMDowMDowMi4wOiBjYXJkMg0Ka2VybmVsLmttb2Rf
aXNfbG9hZGVkLmFtZGdwdTogdHJ1ZQ0KLi4uDQoNClRoZSBwb2ludCBpcyB0byBtYWtlIGNyZWF0
aW5nIG5ldyBmYWN0IHByb3ZpZGVycyBlYXN5LCB3aXRob3V0IGhhdmluZw0KdG8gcGFyc2UgdGhl
aXIgYXJiaXRyYXJ5IG91dHB1dCBpbiBJR1QuIElmIHlvdSB3YW50IHNvbWV0aGluZyBsaWtlDQpM
dWNhcycgYC0taG9vayAnZmFjdHM6bHNwY2kgLXZ2IC1kIDgwODY6KjowM3h4J2AsIHBhcnNpbmcg
YW5kDQpjb252ZXJ0aW5nIHRoYXQgdG8ga2V5OiB2YWx1ZSBmYWN0cyBuZWVkcyB0byBoYXBwZW4g
aW4gdGhlIGV4dGVybmFsDQpzY3JpcHQsIG5vdCBpbiBJR1RzLiAoT2YgY291cnNlLCBpZiB1c2lu
ZyBidWlsdC1pbiBob29rcywgdGhhdCBoYXBwZW5zDQppbiBJR1RzLCBubyB3YXkgdG8gYXZvaWQg
dGhhdC4pDQoNCj4gWy4uLl0NCj4gDQo+IFRoYW5rIHlvdSwNCj4gDQo+IFBldGVyDQoNClRoYW5r
cywgUnlzemFyZA0K

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5B606A327
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fIlnLNnf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8016D10E5B8;
	Mon,  2 Nov 2026 08:34:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC96D10E56C
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793608391; x=1825144391;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AS+gR8osC4JgqEpLFE765979WrVufSGtVt5O0fTRyTA=;
 b=fIlnLNnfPcOaK6ELFNgZ2qVLnzgiHqPDTAXnuvvr+tqqFsRNrWx9PyWV
 XqjikjG777HjMGaHoHQWsKfZqEldveAS6YH4d32728D9ixUzYr1vSvFMh
 kJKL5gfmA9/h65bLyFhSZQkeJCsGoqWbpTfZibOneFv5V1sJNVkxYZ1hv
 O313+/r3WD8F91aXrOlqiGVbPX+hDtgN9pAxVGRtGFlEn3i2sWjB1nkDp
 O94xYJ2cX8GNW0NZ/AT9Wp3y+3bZm8E5BUXBCrgqJ93FOiM+dZISOtUuE
 xJmTwlREc2Io+8fA8zFK+vGkMskRw4ezbtATbbHPQ4I1ybXmE+baM8BmF g==;
X-CSE-ConnectionGUID: ktpTi3CIQNKZ926J1WTLjw==
X-CSE-MsgGUID: YizoBe+ZQAi9jdPn9rYeZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2304387"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2304387"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 00:33:11 -0800
X-CSE-ConnectionGUID: eV2zMBfnTt+PVLR0FMEuFw==
X-CSE-MsgGUID: WAvLd6NaQWadUx2qPLrRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6035422"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 00:33:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 00:33:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 00:33:09 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 00:33:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFlorES5ztvVskVlr0neZSMi63wEy2eDEATmQOexKDnB6qGNoStAmQFTlCsaN50ZpTLxNZn0iOcoGIGtcF2lb06rhQ7oxjHqTq6Tn/e5Uidu2pBzE3CNZvMyLtjXUtEVbTMY/rnUMIplMqIMCiHT4crrp/2TShubQsN2FjVtZr/oit/yNmuJN1jzEDtgX+8DvWguaBiiizqCOf8dapIPb8TG0/yYAW3+v7J5P4WquvkypwnqOtRF7dgT8jBZdXKG/pZiyqIZ6MIk4Zy+K50K6rkFS0ivOORfiMcSgFhqDIgw8INyH9cXziEXE136CL2t/dYKA2dTHLHkD7UO2IrGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AS+gR8osC4JgqEpLFE765979WrVufSGtVt5O0fTRyTA=;
 b=Tt0zlC98y7afIf1O905WreCna/epKNb2tE4vdHzNlpKf3Zp4lOf++nxdnXleEz+hcWtTyY5ekOyesvlerKNdb6lpw8/Dvdj8m6GndDQAiBUAj8i7wThJbc7KTKIRUsLCzRvu9iRcBSuDv2no828E9BdB1rQMPYNE7qpvgTPbbOdzAKyOPWA6Fq5uCcuuR2bEkcf0Mqi62HZrBG6hhnH8CxFbB2nUYa1ogf29h/2YZMoYhahSY7Xp7N1GFfuKHaY+7cNMJllvlvEFypQOQ1EWF1xzNhLml5hIDtc6+bVdqfVLfipTbmZBGPK05P+ZkU98huaGhNIbkP4a4HtGJX+DJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 08:33:01 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 08:33:00 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_vm: Scale BO size in out-of-memory
 to available VRAM
Thread-Topic: [PATCH i-g-t] tests/intel/xe_vm: Scale BO size in out-of-memory
 to available VRAM
Thread-Index: AQHdZ8BhzmZZOhLsaU267HydtvTEkLcaeePw
Date: Mon, 2 Nov 2026 08:33:00 +0000
Message-ID: <CH3PR11MB8434AA5A5A639D28E4A90FD48D6A2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261029161247.1363242-1-piotr.piorkowski@intel.com>
In-Reply-To: <20261029161247.1363242-1-piotr.piorkowski@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SN7PR11MB7044:EE_
x-ms-office365-filtering-correlation-id: 5ffdb46e-eeeb-48bc-327e-08df38bbe7c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|23010399003|10067099003|18002099003|22082099003|38070700021|56012099006|11063799006|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003;
x-microsoft-antispam-message-info: 3FBFS+ei/c46zfiYYwWluvv3evDhs+HvVZuVpssDwrKH57n1regEhWgy028u9WqAyhgeT6UalhKCWM4T4O8j22se/uKOw1sjiK1JPURYybXhYiRPaYi8030nwKJl/cVUdigHhurgwhwowi2mzlcR/WWfJhO/IfDiYBWLZvFQLQEfpJTnrJLZKIH0eciM+J+6hYRoaUQuRHte4pF0WA/sIBpVxpLIJ+fF/h3+t3VYl7Gq4MUwN7cdVJKS31K7zt1sQVwowTS1zlz/4+1dhZg8MvUK9MZZnLvC5N2djGdJsqfovqpIK8hCu6f/EcLhWD8vF0c3Q8Qfv8Ig/KCGaowWpRz5NRfMz3Hvugug4BRq6IP8HnFI/WGU1IV/PH7UPcCr8AyKS8X0snKWjQaT/a4jQ9r3yxZEorVRbVqkwp/kQeEpmFYfyojhwQ15zlxdUylmEti7DkfpD6PSJoeVl6SkbcHsZXhlOaW/Zn98tyNubPWHhSLkuZTqfjyB/At7KeS4rmkWFxaVimgfaSSoLzes71xLEzWac6mDt8SNJAcLiG+0UeuoYOQLMD1EaqdEeNekCZUI0pwDsWHvaJPF3878su4nARnmCAvMd4KQeQPikOoMWNy83XQTwaZz78b9uV+/Qzsh0Evw2XRp9XNXfb46WB7LZzFBHlgPeQ7VSIVhrg5a5jvGRy/f51Ui8NFV104HbsW4o5u3s4CUk5mT458IAjCOTIaCVYcCz3T2X44arsQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVNDVjFmVlQ1K3hrM2lzcXBsL3N3MVhQYWEzUVgxK3RlaEEweFB0VjZtcDla?=
 =?utf-8?B?RDFMNjc5Tll4b1JrWkx1WDF2eHc0L0VEVTljaGRmVHh6cW5oZ3ZkRGJlaVB3?=
 =?utf-8?B?V1RSV1U4VlF6YVBOYktWM24vQ2I1bkt5VVFVUUhwWHFUYlJUQVIxUGpkTEpI?=
 =?utf-8?B?WWZhaTVCMzlwZzU0VUU3Z1pseXcvblJGU3N0UnUwV1BuL1ZMOTZKM3ZVb2dw?=
 =?utf-8?B?ZEFidVQ5QXRRVHR4b2xqOWk0TFR6amlES0NjK3BNMnplTjhkY29jb1MvV0s2?=
 =?utf-8?B?dGljQVpFRkdtZTZQeXdnT1I3cE5Da0JtK0Joa3l3NnV4cExvakI0QUNyYTdl?=
 =?utf-8?B?QTcyZnlKY1Vvb0N6aGEvOFRSMEdmSFQ1TG1jbyt1TkRnU1g2akpiRkZzU0ho?=
 =?utf-8?B?b2h4UjVBWjhVZjNvS0JOTDMzQU9kdFI3LzNyQSthNTNqeDFOQVNkdEZDbVZL?=
 =?utf-8?B?WDA5MlZPS21ZVWdBdmt2NTlwRXNMRXhkODZZYnZXbXNSVHlVL3IzcDVScE9R?=
 =?utf-8?B?bVNlZHNsM2hwOGwwakt6MFAraE9DQW5RUU1WN0hkdE14OHRRUld6RXpmdXBM?=
 =?utf-8?B?ZVlxQzQ2TFg4dStJUmo1TUY4QW1FVTR3UXVjNUREZHlrcWE3Y3lUL0dnZ2M1?=
 =?utf-8?B?Qm5qZDlEWExHdTBQWW9semtXcUhKRE9lbDNXdmRHTmxhYzRmakltZUxHeDAr?=
 =?utf-8?B?TjJ6dG9TVmRDM2FJOHppd2p0ZzBBVHlrOHJyS0dOdUhrclVoZTdNTFc5T3hE?=
 =?utf-8?B?RTBUbWZHVGo5WnFSRWRpQ21GSkNhSGROVWZ6RHhBV0VEYTZ3SS9ENUd2NVhC?=
 =?utf-8?B?MXBsYVBVYjluOXA5Yi9mbWZBbW52OU5DSmJQQ1BMSC9WTmRYWFYwYWVxTm96?=
 =?utf-8?B?TFFnc3EvK0dZbUk5cWZZcXMxeXc4akxuTGpGYWpOaFlZUkJuZHNMck9FeE9S?=
 =?utf-8?B?Wnh2aE5DMUw1OUovaXNBQTFPbkM2VWRwNnRMcnl4d0c1eDVvRnNCV2hmNlpj?=
 =?utf-8?B?RkVqaUJzRlZPVURsQmxJVDE0S1lMdFVNclordGhtSmJaSXU0cXNmaXIwWThl?=
 =?utf-8?B?VTlpOXphd0R0aW9zdlpReTRhTjhiSDU1Tnp4bzJXUWlKZ1RDcmp1YUxRUXQx?=
 =?utf-8?B?NEthd3d1UHpoelAyTG9mTmtEUDhxZEFiQUJ6VElDa2gzS0ZXWkFWeUxLZ3J5?=
 =?utf-8?B?NDhiNWliYTcvdjNabVRNZHNZZW55RWhmUkdpdjV2Y2FaK2ExdjNsTHRHUEJ6?=
 =?utf-8?B?SDFITnVHS3pLOG1kaU9QTXY2WGx3TG9MeXJIRmdYRG9IRS9GamUxazVsWG1R?=
 =?utf-8?B?UGdTOVZzcHRJT0o4TXpsRklMU3ZSWWloY2RsNitGVnhOMy9Nd3hIekRVbTRj?=
 =?utf-8?B?S2dkYlVNYW84clNWNW5WRDNOYWJEV1NqeXRUaXhUMXA3SysxNDIxcVNxZDk5?=
 =?utf-8?B?SGFZb3pUVDFvei9CWFI2bTFoRlRObUdvNVZjYlN5bm00UmRkMXFXcVhvRnF6?=
 =?utf-8?B?M1cwODJObldwaGdNZjhGZnprMTE1djhoSDBwbjA0TTBkZExEdi9SY29DeU9h?=
 =?utf-8?B?Z1ZGKzlCMmF4VjBIWWlkLy94QTljTjduYzNYNHQzSHVpQk1sQ0FtZUU3RTJM?=
 =?utf-8?B?NEtETnhQTHZld1g1dnpEZ0tNY3g3M1JCVkY5TWNQdGh6M1ZhU2R0MHFiRUdQ?=
 =?utf-8?B?U2xKT0JVU2RZUmtabjdMQ2VnK3dLOVlqQWJmN0pYUTBMdXI0b2pyT2N2cStX?=
 =?utf-8?B?VmU1UGEwRW9oVUJwMUhCVUNWMlpSbFlpUDZCSE1FQS9qcWdWM1pIaWI3U2g2?=
 =?utf-8?B?SnNyaGcwMlZLc3JObXlRSFNBbW1HVnlBTURVNDdacTk0enQwKzlQOUlucllH?=
 =?utf-8?B?aEN4VUJxNVBIQU9jSklYdHdINElFTmFOMEYrOTJBdkNhdW1INXY5YXhPeEgv?=
 =?utf-8?B?MHVoQXVBMTAxNnUxdEpkUzZ6RDZxRzk3NU9TU0hIc1JnMEZpMUNJS1lZRkt6?=
 =?utf-8?B?RnBhdVYxdUw1WXVtZTNrNm96R1R6SFcxYkRXbkVYckxPb0xHNk9ORVZMVFFX?=
 =?utf-8?B?dU14K2dlVlRXNEIwSDRWWTdnMzNnSlBoQ0RIcDRlcThkdjVkV2QxK1NrV1Bx?=
 =?utf-8?B?b0ExQjVXUlhHaXU1YUs0Y09LUGtWTnRqMnlIN2lXNlF6dUJ0NUtIQ3JMZGlx?=
 =?utf-8?B?SjIzaENrbmowbk1QeTd0dXhtNmFRSEc5UkkwYUlmUmRlRHBmOURmRkNZeDB0?=
 =?utf-8?B?YUh5WXJOeWNiSk1YNHBkbWl0Ym1BWWpQZkZhTklxTS9QRmpDNStpVld3T0xL?=
 =?utf-8?B?aUJIZFNvaFh4SHJRNjdqU3ZkTy9LQ2pobktRVWFROWJrTGFaaE5FVXdXTnNs?=
 =?utf-8?Q?EhdIk+nX4mQ92vBc7AXcfsdWYudtuxG5iu772PsMEB3wA?=
x-ms-exchange-antispam-messagedata-1: x4uCTtxIMSO7a92SgCGioIrxsxidZYkVoEg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q2jR65fL/vOhEI1Ws+pnjQG0wfiMJTZpomcFfBI9azJC+IDesythJm4cD4g4uqLo79edPoA2iyeosVKySP3ypbg/+H6P8F4/OIXzquP9bKaFMXDn7EZF6G8JQjTRKGPS+a/Bwq5V9ivel0VVY8kk3NnDZeKyVI2Ac8TTDDzwhA+5+8a8Hyeu6IYa8FQtnknUPErB1lX1HIVyceZ1Fdk8K+jbhdy4BKpHqzzjudWljZRRbnNmql822RhdZ4s6LNUXjZr7i/EZjAU6w1EHDbv6buPKctNJeZNLzZgqWwncVNDYxc3fDwzlFhRC7EaJrUwCqEU0Lxuvj87bc849NvGIGg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffdb46e-eeeb-48bc-327e-08df38bbe7c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 08:33:00.7824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OtRWIVMFOTOAoZfmq3VzhQgdGFcru7tncxSYwT+ZWrE0YoL4Vdhcns1BlOnG5RynFz7GJpouBGbg72yS1V9D7u9iZzZ2n+KRXw+HJhYG+S4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGlvcmtvd3NraSwgUGlv
dHIgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29tPg0KPiBTZW50OiAyOSBPY3RvYmVyIDIwMjYg
MjE6NDMNCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBQaW9ya293
c2tpLCBQaW90ciA8cGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20+OyBEYW5kYW11ZGksIFByaXlh
bmthDQo+IDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
aS1nLXRdIHRlc3RzL2ludGVsL3hlX3ZtOiBTY2FsZSBCTyBzaXplIGluIG91dC1vZi1tZW1vcnkg
dG8NCj4gYXZhaWxhYmxlIFZSQU0NCj4gDQo+IEZyb206IFBpb3RyIFBpw7Nya293c2tpIDxwaW90
ci5waW9ya293c2tpQGludGVsLmNvbT4NCj4gDQo+IHRlc3Rfb29tKCkgdXNlcyBhIGZpeGVkIEJP
IHNpemUgb2YgNTEyTS4gT24gZGV2aWNlcyB3aXRoIHNtYWxsIFZSQU0sIGUuZy4gU1ItDQo+IElP
ViBWRnMgcHJvdmlzaW9uZWQgd2l0aCAxMjhNIG9mIExNRU0sIG5vdCBldmVuIGEgc2luZ2xlIEJP
IGZpdHMsIHNvIHZtX2JpbmQNCj4gZmFpbHMgd2l0aCAtRTJCSUcgKHRoZSBWUkFNIG1hbmFnZXIg
cmVmdXNlcyBCT3MgbGFyZ2VyIHRoYW4gdGhlIHdob2xlIHJlZ2lvbg0KPiB3aXRob3V0IGF0dGVt
cHRpbmcgZXZpY3Rpb24pIGluc3RlYWQgb2YgdGhlIGV4cGVjdGVkIC1FTk9NRU0vLUVOT1NQQywg
YW5kDQo+IHRoZSB0ZXN0IGZhaWxzOg0KPiANCj4gICBVbmV4cGVjdGVkIGVycm9yIC03IGZvciB2
bSBiaW5kDQo+IA0KPiBMaW1pdCB0aGUgQk8gc2l6ZSB0byBhIHF1YXJ0ZXIgb2YgdGhlIHZpc2li
bGUgVlJBTSwga2VlcGluZyA1MTJNIGFzIHRoZSB1cHBlcg0KPiBib3VuZCwgc28gdGhhdCBzZXZl
cmFsIEJPcyBhbHdheXMgZml0IGJlZm9yZSB0aGUgT09NIGNvbmRpdGlvbiBpcyBoaXQuIEJlaGF2
aW91cg0KPiBvbiBkZXZpY2VzIHdpdGggbGFyZ2UgVlJBTSBpcyB1bmNoYW5nZWQuDQo+IA0KPiBG
aXhlczogYTUzYTJiNDc4Y2Q4ICgidGVzdHMveGVfdm06IFJlcG9ydCBPT00gZm9yIHZtX2JpbmQg
aW9jdGwgdW5kZXINCj4gbWVtb3J5IHByZXNzdXJlIikNCj4gQ2M6IFByaXlhbmthIERhbmRhbXVk
aSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUGlvdHIg
UGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3Rz
L2ludGVsL3hlX3ZtLmMgfCAxMSArKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRl
bC94ZV92bS5jIGIvdGVzdHMvaW50ZWwveGVfdm0uYyBpbmRleA0KPiAxNDA4Y2FjZTYwLi4zMGEy
NjRhNGNiIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV92bS5jDQo+ICsrKyBiL3Rlc3Rz
L2ludGVsL3hlX3ZtLmMNCj4gQEAgLTI5NTEsMTkgKzI5NTEsMTggQEAgY2hlY2tfYW5kX2NsZWFu
dXA6DQo+ICAgKi8NCj4gIHN0YXRpYyB2b2lkIHRlc3Rfb29tKGludCBmZCkNCj4gIHsNCj4gLSNk
ZWZpbmUgQk9fU0laRSB4ZV9iYl9zaXplKGZkLCBTWl81MTJNKSAtI2RlZmluZSBNQVhfQlVGUw0K
PiAoKGludCkoeGVfdmlzaWJsZV92cmFtX3NpemUoZmQsIDApIC8gQk9fU0laRSkpDQo+ICsJdWlu
dDY0X3QgdnJhbV9zaXplID0geGVfdmlzaWJsZV92cmFtX3NpemUoZmQsIDApOw0KPiArCXNpemVf
dCBib19zaXplID0geGVfYmJfc2l6ZShmZCwgbWluX3QodWludDY0X3QsIFNaXzUxMk0sIHZyYW1f
c2l6ZSAvIDQpKTsNCj4gKwlpbnQgdG90YWxfYnVmcyA9IHZyYW1fc2l6ZSAvIGJvX3NpemU7DQo+
ICAJdWludDY0X3QgYWRkciA9IDB4MWEwMDAwOw0KPiAgCXVpbnQ2NF90IHZtX3N5bmM7DQo+IC0J
dWludDMyX3QgYm9bTUFYX0JVRlMgKyAxXTsNCj4gLQl1aW50MzJfdCAqZGF0YVtNQVhfQlVGUyAr
IDFdOw0KPiArCXVpbnQzMl90IGJvW3RvdGFsX2J1ZnMgKyAxXTsNCj4gKwl1aW50MzJfdCAqZGF0
YVt0b3RhbF9idWZzICsgMV07DQo+ICAJdWludDMyX3Qgdm07DQo+ICAJc3RydWN0IGRybV94ZV9z
eW5jIHN5bmNbMV0gPSB7DQo+ICAJCXsgLnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1VTRVJfRkVO
Q0UsIC5mbGFncyA9DQo+IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMLA0KPiAgCQkgIC50aW1lbGlu
ZV92YWx1ZSA9IFVTRVJfRkVOQ0VfVkFMVUUgfSwNCj4gIAl9Ow0KPiAtCXNpemVfdCBib19zaXpl
ID0gQk9fU0laRTsNCj4gLQlpbnQgdG90YWxfYnVmcyA9IE1BWF9CVUZTOw0KPiAgCWludCBiaW5k
X3ZtID0gMDsNCj4gIAlib29sIG9vbSA9IGZhbHNlOw0KTEdUTSwNClJldmlld2VkLWJ5OiBQcml5
YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+IA0KPiAtLQ0K
PiAyLjM0LjENCg0K

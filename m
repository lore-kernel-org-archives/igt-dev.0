Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9098CE9D837
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 05:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDA110E0A9;
	Mon,  6 Apr 2026 05:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVVz8l9Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CDC10E0A9
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 05:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775454074; x=1806990074;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9x7V/h9doSVm7rVfWjPn3Xo/QH/t1UqgUb6gLILumVk=;
 b=HVVz8l9QpJLv+8TvP6fqwqDazT6f/V46HuDmWoSGKzUxqJphWR8C/Ln8
 dSAxuD5MoOmu49zYI2Jc5RKFljXkAqz8h1S9zQFH6ft9fb6cAlox1r68y
 BqshzSYJ664bCNcTNw4HfZAOdnPtlBOYWseuWo/sTLe1ycOGXC+QcETej
 u7ItuH+QeHrCgUKaC6+gYJegUnFT9FfhCbGZ1C9HSHoE3fg7/nzmgfth0
 CkG1wsY7TRh7wpWF21Psjz5Lkpe4DxO8ot76c1v5ZJ5pXyhm3MniYqBnd
 hI138F0B5xKQ4TXHHNoCnETLgCrmNe+H78ETPwntPpCfJ77zPwugb/4rx g==;
X-CSE-ConnectionGUID: ZpFfuHTlQ96N4/CwuxsHMQ==
X-CSE-MsgGUID: QtHjtSUsSIGz6ciUww9a2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87862542"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="87862542"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:41:13 -0700
X-CSE-ConnectionGUID: viTIun+kTL2DOxvyM8ZDDg==
X-CSE-MsgGUID: rPovsjpnR/KSPX6/FBBVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="232653533"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:41:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:41:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 22:41:11 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:41:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzzi3RAnfzERPZFILhLKGN+bjlFI8HessvsB86Hr8DA27ANycv+2tBB/lipxrwRTB43b003stplF3NzH5Q2XStnCgfNN9DyUxkvh0dB3oYBbN8azScwtvo1/pXd3ACexIQg5V8DPc8AKcGhDXqW+CaqGCV0SSuJX3GBL60lO/e7dyxsTMAFNdrKi7wqZau+I74WyImywxsiQFOlNNzbbw8IgL4m/0ViU6H89Us08x4wzVjcqn49/8IEYMkJneIXwWq2n3/bSSQMVrQeEozgT7Ql+/NPNNWDOJUTRAtCGZVKsYT+cYIYfu+yD+rukYHRO/3jdQV0ufdnxXiWdMRcG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x7V/h9doSVm7rVfWjPn3Xo/QH/t1UqgUb6gLILumVk=;
 b=MXgDBF74m7Kes8VYB9ROfFZySM3TpS3+dTXK6Nb7Jn9xGghqgB/S5R5qWODOncOrH42nsF0a3M5RTdA8FfICv16EHfopocab80L5VTUNSbc+8gs8f6m46becfE1aINQwcAiU4hKEbaa8VkZ3tuT7VQ/C3ohkV6qswIfLt2JGJU0pZsKvSWhNhQ6h97ZbdzL0JR5gooRB3r4uWejfc+RMYM7uIY1jXPnK/sxpZwgWr7brDAMsora52Xm8EHMHF+Wz1r3ez/NbdaIHp1a7TuGCyOud4ZpjEWzSPBf8cm1Nr3zuNSh1XB6IsYeIndmVeGVz4yaXXYc4Hi7aRt12H967JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 05:41:08 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 05:41:08 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>
Subject: RE: tools/gputop: Fix zero output when stdout is not a terminal
Thread-Topic: tools/gputop: Fix zero output when stdout is not a terminal
Thread-Index: AQHcxYHGIXnVYQ1kxUOQMnx15zq8dLXRhHcw
Date: Mon, 6 Apr 2026 05:41:08 +0000
Message-ID: <PH7PR11MB82525EF1740193ACABD30E52895DA@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20260402134522.108322-1-vidya.srinivas@intel.com>
 <14383743-685c-4d61-9c58-b1b563f588ab@intel.com>
In-Reply-To: <14383743-685c-4d61-9c58-b1b563f588ab@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|IA0PR11MB7379:EE_
x-ms-office365-filtering-correlation-id: a6e76be6-038f-4f17-f6a8-08de939f1a2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: Np8p1+qL83Jh2tx2GTh6D+6v2+jUAgoN5XdTx0IGQIFsYOt6GZ4jj6FN7fq+FHHIjHGEOvLZIi2rIacfcj/N4TiHZlAyzXx80voGvA6hM+hBHBieNugFeP3xVERwPcffc0RC9MB2Um7P4/2YhyMtBVlL4cDCDD3aRHVDLZ3HG+zdLE4d1/MpSD7zVNhDWBLeg2WRp1i6ul53ziDL86e3kGFkfxQJzP+GzwSlCZY0P5zHM7Y5ukbXjKdeV7ZGnk0OHKBxKJlK1Th2HscLMRev0cQss7/9nkdwZYATHPqN4ZUhZtrbSIzsl6d7euuKl0PZTr7vT4DAPWe17lG6TmWLz8X1ImaJFDeCYhvijPh6SFy8RIblwf+Pr8181yt9O8P3QiQL1ItJAIXzq7iyGJY8vjAj3toOiwZOX3GfHsoUwcRLLctQ7SpM/yIGTW1gZFW+9nOwE4N2lNzLIs2xdzgK/F6XakoePBy6sR9WaGS354Ukd4VLSv2OpxRyLen3RR7Z/SAA8Ddj0Mjpi7YxAS2plpcACCkmdb9sI32PVc6OFgPF5NNJ6p6xBPmTX7giFwN1+Zx5Wesku7RKK1ttEMYHzhf1h9E1yWl8jHK7G5MUeIh2tQVcdhHDxUZBQj0ztgFQSGJI3Qdd6IYL4iH0iWsLUDJLfDDDyuhvlb6HMP3NTKYUcHXfg7H54mEMEOvJUQ4urPw5pLNVyc4/MiZv5TmAws81l+dVAuWyCT82xcpci3qI4j/L5g9MrOGxbF7hymSe+8grXyHJkLX/tk6tfzGtWQu/BOiDmvB/ptTMeTPzRdM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzNrQ1BUaTNLbVEwZHZrMk9HVTRaRExNK3pDdzlydi9SNytXR1lwdkZLNXhD?=
 =?utf-8?B?blZHeFRaK25OVzZLTkVVUW1tYXY5QWRyUDViY2tBWDFoaWpsNGhaRTlEdHJh?=
 =?utf-8?B?bWhLUGt0UlFOREpsZ01hT2hLNlRIeVhGVGtrSU5maWRGOUQ2ZGZ1NmtocDZz?=
 =?utf-8?B?WnRDY0VIRlduSFVGS0pNdGo3NXptdWxuM2h6aGRNMDEra2JUWE9pRFE0US9X?=
 =?utf-8?B?V1FXUm1GcjQyU3liMk96WGxtV2tBd3VYM2JuTWtSL2txcTE5aHFSSmdXTXBP?=
 =?utf-8?B?aHpIMzlDeWZhNkM0YjlCWnNpRWVnbi90elZSSmVIR3ZreUhpOWZKWTQzK0xz?=
 =?utf-8?B?bEJyUHNIeVc1blFlNjl4TCtERWxKL3NNQ3F6Sk0xbjY0Sm9xdUluUFFLdnFY?=
 =?utf-8?B?STJGUE1ZR2g1M3IzWWFMSGVBbEVLb1RBbzA4TGl4Z2RpdDEyVnNzT1JrZ3Fr?=
 =?utf-8?B?ZmZRSVBnVzMyNnFwb2NQZFRSUU5NT0Iwemh3TTdLSy9oYndSei83bUVZTVln?=
 =?utf-8?B?QVRpTjhqYjRPY3JBVTJxUlRhalRVREp6T0lBclpFV0F2RDJGSUtmMWpJM0pJ?=
 =?utf-8?B?OUFWTmZhWE0ybXdQb3ZoOHhJc1JkS21yQkM5YXVkWkJmOW5sc1JRM25jNTNt?=
 =?utf-8?B?ZUU0bXM5cUhQdmxWdkxhS0k5Qjl0cVlURkxSdFplK3NIMitVR2dWTUlvNnlX?=
 =?utf-8?B?T01reWlIN1l6MFlxMG5JeVEyVzJ3REQ2bERlaDUzVTdxcjhMQXdCT2wxMktx?=
 =?utf-8?B?OE4zUW1EU1UvczRncStsUG9kL1pXaHhvRG1iSWVRYVBSOUM3bld6MXJrc2k3?=
 =?utf-8?B?bDBtbkx5bm9yaE5yUlNQeEpmWlFzcXRLNVYxMjV4UXE2Z3M2c2I4eEdvZjhz?=
 =?utf-8?B?ZElCYW1uYjdNclovVzFGNExELzFTTFRMSHhNRS9WT3NrdmpTcjdqTU9xWFcz?=
 =?utf-8?B?U2pSQm9xaDdFSFJWak9VSk5JWDVsYnZuN2FVdGdBTlRBYU85bjczZ1luWlJm?=
 =?utf-8?B?OVhVMXI0T1R3THFGd0ZqNm9SZ3A0S21DMlVUYTQyKzk1b0xicDVMMS9GWFF5?=
 =?utf-8?B?RE0zcVZ2QnhDSm1OczdIVFQyMkg3MW5xTlJKWWtBOXgxUDZGZ1hPcnI0em0y?=
 =?utf-8?B?TUlUZmduOUpiSi9haTIwdFBNUVY1b3RGUlFuUUNsNmEvWGc5L3ZNaldNazNV?=
 =?utf-8?B?TVY0bEJwaUNSY3kwejRVT3lTNVRZT0VCRHBnd1JFY2xCdTdSTks0Z3pYMVl2?=
 =?utf-8?B?ZUZsTHlBSnVLRGJIdHhJTWF4RmY1YlNXSHpKS2tGV1F0WFlXZE9UWlVrOVRY?=
 =?utf-8?B?SG1KR1BTM3pmUSs1NHI0TzkwRGZzWURPU2xBam9IcnhETnNwODNaNGxVVnMx?=
 =?utf-8?B?NEs5NDhLeFhDWWFGVkNxWHpab2tRK29ueTNDTGwzd1FwNk9tQXNsajNOMjVT?=
 =?utf-8?B?emp1TWFkTWI0RDNldy9TNTNoT1dOTVBuWHRxTktDN1pSTTJWZC9LaVJsYm1y?=
 =?utf-8?B?bCtwNUxFQmpKZzRSN28xV2NVYlBYWVc4alMyRGZxV3I1Q2NPT1RMVjhTZUhj?=
 =?utf-8?B?ZWE1WHJyUHlvc0pJQXd2aHpZMkQxTVFFUmJTWnhSUHBNeVZpMUtUQUplVExY?=
 =?utf-8?B?NndOdUhxY202cnRrNzJES1pGVmliRS9qK0ZLc1hLQWtkQkN1T1huUVQwUjVH?=
 =?utf-8?B?WmdBdDdNVE1wYUY0T0gzdXhpU2RsenUxMU1laVZ4VW0wUTlKWmZTVlo5bkwy?=
 =?utf-8?B?U1R2dHordjhyaEJWVkJFU1VpRGdPS1E0MklOZE1EMUVsRnBPMnhOMHZ1TUVM?=
 =?utf-8?B?VVorQThsVjJ4bUVQczNBdnVIMW9lZnc1bFY4MHJhajZGRWpDS1c1V0hTQ1lB?=
 =?utf-8?B?NlI1S3c1K0NycW1qalV0aU96M1dsbEFGaG1jajVocG40S09rd1pGcEp6UVRj?=
 =?utf-8?B?SU1kOXdYM0NhOENjeGVWT3ZnRjdsMG9ScVFTMUx5NzVQYTdhcmw1RjdhMmFP?=
 =?utf-8?B?S29GNWtNcUlnNFF1Yzh4cnZSaExOdDRMaEpJK1lRaks0eXF6Q29FS2Ivd1Jm?=
 =?utf-8?B?M08vcnVkNkRHMmNIR2twK0J2cG9FVGhZbmYwUXBiSUs1UmpWNjVpTGlCeFVx?=
 =?utf-8?B?czJpajF6aWthcFluY0VzWlN6cVZjWDN3d1ZJVVBJL0pqemk0VWRsc1lISGdl?=
 =?utf-8?B?eUcyVWdjTUt6WEtZWGYrQWFRM3VoRzBjYUV0cTV1c3NiR3JUNGtzTmp2VmdH?=
 =?utf-8?B?TUxieUxCZm80c1JVbGJzbEVkZUl3MlZhdURudjQzVVYxK0ltK05HNmVtYTNt?=
 =?utf-8?B?LzVWMTQyMXhFT3YyTWM0QjRZZC9QeXVFSkFzOG9EVXBvdjF2cW5hQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OHpzFml/11Kauo2Pxip8xEbZlGqFLieS+oYa7oxiTE7tyaBL3CAjAG2pw5ZFVArGBXujJbtUgBXSJZWVj+BSIlCOkbZAHLDgNFG7OcOdVengDrS+8fdFPMG0LuFP5ozF/OI/oMtBjz1GcLNXgdA0OQoC9ZjZ3znUwHRTVHSmCf52hkXeRKuFNbuCUJA3nWkHyXzouT5yVJVSzwpVWMRFj2ERxLUdaMu/oGZ4fuEs770GhH/MCn9F1FM8F7K7uWGfsuaf8kpEc+88W6DqS3xCtA/kFwLRH1Ja7Fqw48P9mihSXKHc/yYsSNuBq16OLOKQkXRRhbZ5pK/NyKSL0c/PEQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e76be6-038f-4f17-f6a8-08de939f1a2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 05:41:08.1493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8gJ6BHpdnm6V8fvuaklww+LArwDNr57AVEx5Q5sqf6N6NnG211snN4JB50AHQWoMBBPHm5oNCRgar+PHEFaUeORxS4GRnNbhf67SxpxBgVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUHVya2FpdCwgU29oYW0g
PHNvaGFtLnB1cmthaXRAaW50ZWwuY29tPg0KPiBTZW50OiAwNiBBcHJpbCAyMDI2IDEwOjI3DQo+
IFRvOiBTcmluaXZhcywgVmlkeWEgPHZpZHlhLnNyaW5pdmFzQGludGVsLmNvbT47IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6
bnlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogdG9vbHMvZ3B1dG9wOiBGaXggemVybyBvdXRw
dXQgd2hlbiBzdGRvdXQgaXMgbm90IGEgdGVybWluYWwNCj4gDQo+IEhpIFZpZHlhLA0KPiANCj4g
T24gMDItMDQtMjAyNiAxOToxNSwgVmlkeWEgU3Jpbml2YXMgd3JvdGU6DQo+ID4gV2hlbiBncHV0
b3Agb3V0cHV0IGlzIHJlZGlyZWN0ZWQgdG8gYSBmaWxlIG9yIHBpcGUsIHN1Y2ggYXM6DQo+ID4N
Cj4gPiAgICBncHV0b3AgLW4gNSAtZCAxID4gcmVzdWx0cy50eHQNCj4gDQo+IElzbuKAmXQgb25s
eSBzdGRvdXQgKGZkIDEpIHJlZGlyZWN0ZWQgdG8gdGhlIGZpbGUgaGVyZT8NCj4gDQo+IEkgZ3Vl
c3Mgc29tZSB0aGluZyBsaWtlICJlY2hvIHRlc3QgfCAuL2dwdXRvcCIgd291bGQgYmUgcmV0dXJu
aW5nIHRoZSBkZWZhdWx0DQo+IHZhbHVlICgtMSBpbiB0aGlzIGNhc2UpIGZvciBjb25faC4NCg0K
SGVsbG8sDQoNCk1hbnkgdGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KSSB3aWxsIHVwZGF0ZSB0aGUg
cGF0Y2ggbGlrZSB0aGlzLiBTaG91bGQgYmUgb2theT8NCg0KaWYgKGlvY3RsKFNURE9VVF9GSUxF
Tk8sIFRJT0NHV0lOU1osICZ3cykgPT0gLTEgJiYNCiAgICBpb2N0bChTVERJTl9GSUxFTk8sIFRJ
T0NHV0lOU1osICZ3cykgPT0gLTEgJiYNCiAgICBpb2N0bChTVERFUlJfRklMRU5PLCBUSU9DR1dJ
TlNaLCAmd3MpID09IC0xKSB7DQogICAgd3Mud3NfY29sID0gODA7DQogICAgd3Mud3Nfcm93ID0g
NTA7DQp9DQoNClJlZ2FyZHMNClZpZHlhDQoNCj4gDQo+ID4gICAgZ3B1dG9wIC1uIDMgLWQgMiB8
IGdyZXAgcmNzDQo+ID4NCj4gPiBpb2N0bCgwLCBUSU9DR1dJTlNaKSBmYWlscyB3aXRoIC0xIHNp
bmNlIHN0ZGluIGlzIG5vdCBhIHRlcm1pbmFsLg0KPiA+IHVwZGF0ZV9jb25zb2xlX3NpemUoKSB0
aGVuIHJldHVybnMgd2l0aG91dCBzZXR0aW5nICp3IGFuZCAqaCwgbGVhdmluZw0KPiA+IGNvbl93
IGFuZCBjb25faCBhdCB0aGVpciBpbml0aWFsIHZhbHVlIG9mIC0xLg0KPiA+DQo+ID4gVGhlIG1h
aW4gZGlzcGxheSBsb29wIHVzZXMgJ2lmIChsaW5lcyA+PSBjb25faCkgYnJlYWsnIHRvIGxpbWl0
IG91dHB1dA0KPiA+IHRvIHRoZSB0ZXJtaW5hbCBoZWlnaHQuIFdpdGggY29uX2ggPSAtMSwgdGhl
IGNvbmRpdGlvbiAoMCA+PSAtMSkgaXMNCj4gPiBpbW1lZGlhdGVseSB0cnVlIG9uIHRoZSB2ZXJ5
IGZpcnN0IGxpbmUsIGNhdXNpbmcgYWxsIGNsaWVudCBvdXRwdXQgdG8NCj4gPiBiZSBzaWxlbnRs
eSBzdXBwcmVzc2VkLiBUaGUgcmVzdWx0IGlzIHRoYXQgZ3B1dG9wIHByb2R1Y2VzIG9ubHkgQU5T
SQ0KPiA+IGNsZWFyLSBzY3JlZW4gZXNjYXBlIHNlcXVlbmNlcyBhbmQgemVybyBhY3R1YWwgZGF0
YS4NCj4gPg0KPiA+IFRoaXMgYWZmZWN0cyBhbnlvbmUgdXNpbmcgZ3B1dG9wIGluIGF1dG9tYXRp
b24sIENJIHBpcGVsaW5lcywgb3IgYW55DQo+ID4gbm9uLWludGVyYWN0aXZlIGNvbnRleHQgb24g
TGludXggb3IgQW5kcm9pZCB3aGVyZSBvdXRwdXQgaXMgcmVkaXJlY3RlZA0KPiA+IG9yIHBpcGVk
Lg0KPiA+DQo+ID4gRml4IHRoaXMgYnkgZmFsbGluZyBiYWNrIHRvIGEgZGVmYXVsdCBjb25zb2xl
IHNpemUgb2YgODB4NTAgd2hlbiB0aGUNCj4gPiBpb2N0bCBmYWlscywgY29uc2lzdGVudCB3aXRo
IHRoZSBleGlzdGluZyBmYWxsYmFjayBmb3Igc2VyaWFsIGNvbnNvbGVzDQo+ID4gKHdoZXJlIHdz
X2NvbCBhbmQgd3Nfcm93IGFyZSBib3RoIDApLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmlk
eWEgU3Jpbml2YXMgPHZpZHlhLnNyaW5pdmFzQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTog
S2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICAgdG9vbHMvZ3B1dG9wLmMgfCA1ICsrKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvZ3B1dG9wLmMgYi90b29scy9ncHV0b3AuYyBpbmRleA0KPiA+IDliMmU4Y2I2Zi4uMTEyZWM1
ZGRiIDEwMDY0NA0KPiA+IC0tLSBhL3Rvb2xzL2dwdXRvcC5jDQo+ID4gKysrIGIvdG9vbHMvZ3B1
dG9wLmMNCj4gPiBAQCAtNTA1LDggKzUwNSwxMSBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfY29uc29s
ZV9zaXplKGludCAqdywgaW50ICpoKQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVjdCB3aW5zaXplIHdz
ID0ge307DQo+ID4NCj4gPiAtCWlmIChpb2N0bCgwLCBUSU9DR1dJTlNaLCAmd3MpID09IC0xKQ0K
PiA+ICsJaWYgKGlvY3RsKDAsIFRJT0NHV0lOU1osICZ3cykgPT0gLTEpIHsNCj4gPiArCQkqdyA9
IDgwOw0KPiA+ICsJCSpoID0gNTA7DQo+IEhvdyBhYm91dCBhc3NpZ25pbmcgdGhlIHZhbHVlcyBk
dXJpbmcgaW5pdGlhbGl6YXRpb24gaW4gdGhlIG1haW4gZnVuY3Rpb24gPw0KPiANCj4gZWcgOiBp
bnQgY29uX3cgPSA4MCwgY29uX2ggPSA1MDsNCj4gDQo+IFRoYW5rcywNCj4gU29oYW0NCj4gDQo+
ID4gICAJCXJldHVybjsNCj4gPiArCX0NCj4gPg0KPiA+ICAgCSp3ID0gd3Mud3NfY29sOw0KPiA+
ICAgCSpoID0gd3Mud3Nfcm93Ow0K

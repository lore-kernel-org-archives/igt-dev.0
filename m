Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6D2C83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 07:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D2710E88F;
	Thu, 10 Jul 2025 07:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTFdDVKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D7510E88D;
 Thu, 10 Jul 2025 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752131923; x=1783667923;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TAZeFWkg1z/fk9GAw7XXodb037vBxyHSsrDWemOd5tc=;
 b=fTFdDVKMYLNVUVXdxzx+j4n098y6+aghQe3EYYWQrSO86Vi0dJSzEvWj
 4H4gZwQaUjC5L/pGuXH3IMqgsfig9cJsY9kQafAMkSt01fut62JQgaKVU
 xWyVful5NXXkywRBaq+IqUmmB96jQkaGm+A5+I+fu878jEaIuftt4/imX
 PZukb36zA12xLiQDR9L4MaVMa7gFoFbby0JbNyk4MJTrFBv6ksSTwrMKk
 FhPe4GJhzljegHhp4zeUK8gmBOonoMfaHzMkWsO7Ov4V4p8bvcFCJv7YW
 danH53FOx+1QSPjoO6M9KBW60Z/Gxk7PiGhHlMaxzQud2RCsaAzJiBeJx A==;
X-CSE-ConnectionGUID: ytUt+cmsTuKYbBoyRLyK/Q==
X-CSE-MsgGUID: e2LXEtqsTrOd2cZlilk4fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54256592"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54256592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:18:43 -0700
X-CSE-ConnectionGUID: 0LuuRaizRdeNujGb7z6H2w==
X-CSE-MsgGUID: 3Sx9/IYxSCqPz/DAe90/eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="186996670"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:18:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 00:18:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 00:18:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 00:18:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kE3JLvTcHIHlHbagxZXXoZVBtwr1latFgmShA/MtIYVvmuqQON6uGFKGyzD87riTSet0RnJ0V5E91N4f+TiyFIQCZ/R7g5vPZHZGYJV0RX55wekCYbFu+J/ZQ5K721FB6evoHPtVTzM0fVWyXTYW1SI4HlqNG0wPp7B3+5GB/6npyU5tU3MyZXhL/GJSByL3m7XVW27p9uSdJUCaWp3V+UPVzwC5pE13n7ILQzjv10JcP6PsywJGX0ZXcOcOGg+1LkJIyGNmC18TG0WW73zHEETHfMvRvsleg6SiG7rh7WetrFuR/4xeXdZWv27Ec1sNvF0peB0hTf4bGX3cUPfp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAZeFWkg1z/fk9GAw7XXodb037vBxyHSsrDWemOd5tc=;
 b=ttGjQmgG2qjYGv8VPYtkeE7syyQjgQuLEuU7B7JKseN82/ra/M4r51yJ/7RVv1ySt07LkUH9RI/nB6mwuIsrfmbRtF1aEDMNvFrnF9xDKFI2KhK4xQwsSH05nY0S7RGnpss5C43GHDUuqfKUmxcGygMzLlUX3VXnJ6y6Xp4/2anRqu6tcFhkSwZpc8D1mgt8mtluaHYLpNh7tM+lbNGe2gSjkSsDZknnJKnMf4xM9zfA6LzzpAGN1MtxGWGBcZ5tUS5vx13GsuJQC42bbQEP+80fvg8060L8DgCwfcef9phw9DkEHoXmBettd+pF2nqR+xHtijGkIiLXUFFyRIOMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Thu, 10 Jul
 2025 07:18:40 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 07:18:39 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBSZXBsYWNlIGludGVs?=
 =?utf-8?B?X3N5c2ZzX2RlYnVnZnM=?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIFJlcGxhY2UgaW50ZWxfc3lz?=
 =?utf-8?Q?fs=5Fdebugfs?=
Thread-Index: AQHb8KHaAXItHN5QdkC9ywYttVC/pbQq85rA
Date: Thu, 10 Jul 2025 07:18:39 +0000
Message-ID: <CH0PR11MB5491AC6149C0B0281A3A7F94EF48A@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
 <175202210059.145914.14422593174335609531@1538d3639d33>
 <24c88440-b587-44a2-85a6-0fbba5b44ed4@linux.intel.com>
In-Reply-To: <24c88440-b587-44a2-85a6-0fbba5b44ed4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|SA1PR11MB7131:EE_
x-ms-office365-filtering-correlation-id: d53c7269-b6c7-4e23-2689-08ddbf81fe72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SldmWVNnZEg5amo4SitjdWdVMzRIdG90OUxaV1NSck14SFFwR21QR25Na3NY?=
 =?utf-8?B?ckwvTDVKdUpCeHZoN2dWOVNCODc5cmw1VWNXK2hoTU9kOTJJWW5nVzVRMmFi?=
 =?utf-8?B?bjF0N05WRTFKN0paTGJtdnduMG96bFdPT1VJVnVKaFhQeks3eW51Y3dGL282?=
 =?utf-8?B?L1B1aXhjcFpaNGdXWDVjY3RORGI4SnBkK0ZNYitFNVBreUR1UUpPQTFXTGVk?=
 =?utf-8?B?UGhpQTRDQnJKMEJpazNHNlJPT0x6SnFTbW1lTWowS3B2YTU3aUE4eFR0cERm?=
 =?utf-8?B?OFZJWEhGT0lqZDRUOCtJWXhHZEJnNmdEa0RCWXE0UGRhQUlxZGFIR0ttamFm?=
 =?utf-8?B?cXIwZG1DbFF2STFTNlYwaWxsM3VrRnBNcXF2aVNKdEs3MFBYSTBLQ0ZQM3Bv?=
 =?utf-8?B?NDl4QVBQTnpmWXg5K21nSmIxUEQ1ZGl5TUFnS2QyZ3RZTXVVOTVvVWt6WnpR?=
 =?utf-8?B?VlFicFprZ2NFYVlVR1hWNnFEODN0eFRHSGgrRTN2TCtaMG1KVUhJRGRwR1pV?=
 =?utf-8?B?UExYdzZNYVFoRWgvczNFUUZCWXZkZzlVdE4yd2VsWDFwbW4rZUVYaWhSL1o2?=
 =?utf-8?B?N1pDaVV1aU5ldlpkNUJJd0ZpVFR5bTJwT0FpQjNoeXlMUkVaeEFYcm42bCsw?=
 =?utf-8?B?ay9NSHFHdytqaUJxdGcvMGZMYXRxWHdrRWRkaFZ1Zi80UjZ0WW4xYVhLRnA3?=
 =?utf-8?B?QnRuRFoyS3pPeFFBd0x1SjhlWnZ0MHFUSk9CN0xOdFdnZnZWVVJCR2FlUlgz?=
 =?utf-8?B?QnFCK0E4VjgvUFVaVTdGTXh0dFczMURaZk5za0ZmZlovcGhxQStrR1hnNVI4?=
 =?utf-8?B?aHl2aTFOamhsdUNUMHAwbSs5NDdSZHg0QWlEK2gyM3NYNGk4WU1ndnhCbFBJ?=
 =?utf-8?B?MGUxVWFsaHFMSGdWOUVYZ0MzcUxscVlCYm02a2lzZTgzUTVXRTdlYkljNThQ?=
 =?utf-8?B?Uy9NV3BJTTdKN3l6YjdrVVUrMEpML08xbFU5Rk1yOHI0eTMzdHJ0YkNZS2NV?=
 =?utf-8?B?RGpHTStJbjdTcHYvWnZ1aGJoR1hoWDhUOGRlRUlwMFM5TzR6c2NsWEJtclQ0?=
 =?utf-8?B?NDR4NXFrVXNCL3lVNnBmSU1ZQlpnN1UyWWF6VjNKcW9nQloyS2JPdzhkSlFO?=
 =?utf-8?B?NFJrbWhOR0V6azFyMVpLTXJWVEI5NWdubklKT01RcFVwSmV6OFdMSHhHWEVE?=
 =?utf-8?B?Q1BJRk9xQ2t6TWRaMjJ1ZVlsMVZXZHhlTFpzZkhpQml2NXZDTGl0QUpJVE1L?=
 =?utf-8?B?UWEwUEp0SHdaUHNhM0p6bjJiU1VjTDRFVjhoMnRNZzhDNG55V2ZkWjVDcWNU?=
 =?utf-8?B?ak05dW56WTFQLy9vSDR1cDBQUjNGbm1TMmVTb1BYWHU5Z3JZMmorcU15aTlZ?=
 =?utf-8?B?emVoK3kyOHErcHQ5MDVaTmdsQ3NDRk43WWQ2L1lzeWJHWXc1TngwZXhXRHBy?=
 =?utf-8?B?aHVHdWw4OWtXL3ZGNjBSRytrRXlRUXJETzRoOGh3eEdHV0FFMWQ2UWlYVnJn?=
 =?utf-8?B?RmlSbW9ReUlIeXFmcXRhTEY1K05qeGQrdlFtajc1K1MxemQ5bXhqaVhOVWlJ?=
 =?utf-8?B?V1pVWHU2dG1SNVpIRFhPTHpsdC9XZnNNa2EzcXRPZ0xWU3oyWWVwYXlmaUMr?=
 =?utf-8?B?bVZSV2VoQ2I5SHJSdzlEOWQ2S1NRbHZwclBTS0w2MFNLYnpnTmEvQmVIVGFL?=
 =?utf-8?B?cmNUL0JZZkRYMDg0N25TdUQwSkZQTk9TWWp4Q0d3b1NSSXl0WFhZMnM5RzZx?=
 =?utf-8?B?MjNvdytrUko0dXVqczIzeWRGa0NSbzBRZU8xVy9tR1ZUVVVhSVdsVUZ0NFNj?=
 =?utf-8?B?TFYrbUFJeklJU2hEc1UzVkkvNnJNS3NJNkpGMXRWMkx5SDNiSXI2YnZFc09D?=
 =?utf-8?B?aVgwQWQ4MUpWdXVzaWRCeloxK0JWNnhyN2FvWDRIMW9hM0pNc1RxQUttMzg0?=
 =?utf-8?Q?MzrxJWpCkdE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGF6dHBDZlJ5WXlxQTVSZnlkY0VGL3I3Qm5Mc2pDTmNxMklQcElBTFhORjBM?=
 =?utf-8?B?eGZpMm5PL0N3WElwTGdqWHoxK3JBU0NRSlltcGxiZWNNZG1oR2VMYU9iYUU3?=
 =?utf-8?B?OU5jSzlmMFBqYW4wUnhlU3RtMXZvSVU3VTdBRXFSTXMzVWF5OUNGYXdtaWVq?=
 =?utf-8?B?MGFPUThZVjFyaGRWay9WYUVSRzJ5bDRDaG1nRWRnZ2pONjZlUHFKQ2ViM2lw?=
 =?utf-8?B?MGp0RUFQNzNZY25hdEU4My8xMFRRdEpMQ1BoZHZvREJma01hYkllNllraS9x?=
 =?utf-8?B?Q2xvbFo1bmJ3cm5CNWdFT3IzcWtlclV4L3FrNU1Qb2gvaFpvL25HTW9tTlNH?=
 =?utf-8?B?cncrS0ZBQU9FMzQ4Q0hQTWVFM1lMTFJmV0dxN2k5eW1pdndKRkpSWE02Ymow?=
 =?utf-8?B?YjhaS3VSNW1OWG9YYmhqajgvQTNGWCs5WG9ja2VtSkxralpUbGhiZlZ1ZDY4?=
 =?utf-8?B?cWdmbHpXMEowQXdtT2ZIV0xnQ1BoNDdoTFNuUnpRbTQrV2hCVjIxdnFtODdI?=
 =?utf-8?B?Qkp0ekZDY3M0ckxOUHA3MTgrY1BTTi8rbyswbjMweEErN3FhQWl5VTV6MHU1?=
 =?utf-8?B?SEE3STlNYjdWeXFFc01PalRkQTV5OFZ5Yk5ZQ0xzbW4vQTZuRGttYktPK1V3?=
 =?utf-8?B?U2x2UnNnYzZpeUlRK2grOVBIdFNPUVErYi9LMnpvMktJcWdqTUp5TlpjUUtK?=
 =?utf-8?B?WHNLcThsdm9lKzJGRVdLQlFDNEtXRW53bTcyNk5wU3VJOEJBY0R1MWtjeXNw?=
 =?utf-8?B?L1p2TytVeFErRFdwTHhMaEJOWDNyZGVSWFJHL3BzQXNOelpTSjJJZG5OcEdG?=
 =?utf-8?B?Rk1WTHNBT1NSb0I5czZqSXdtMWxITVFaeHFZZ2s0KzdSOXl4MG1YTkdIeXQy?=
 =?utf-8?B?UkpZYVd3bjRGREVabFBWeTZqK29rNnVGUWRyei9Tc1ArV1VMSUJqRXgyV0JZ?=
 =?utf-8?B?R0g3ckw0S0RGYnRXNW9va0xMc0RqNUYxWFFNQWxHd1ZvcmNLTzhadTVrb0RT?=
 =?utf-8?B?TTlJd3hrYTI1MDVqN3VEaHE2MjIyanlDcTBISEoxZVlCTkZGS2hCVlhvMkpp?=
 =?utf-8?B?bzcrOTRXVm83ZVpkRk93QXpkby9Bbk16YTRvSUMrRDVUTXFSbTVsTDArY1pz?=
 =?utf-8?B?b2QvRzFnN3pRSG5GZEFYNE81dDJhM2VMemg0TFlrL3l5OU85b0NGUXczRFoy?=
 =?utf-8?B?eTYxcGdrdHRmQnM0UzR2RWtUTUhSYTJTcjc4NkVWajB2N0dhc3pOUjNUMG1o?=
 =?utf-8?B?MDFCWnpHRW14dFd3R2J1dEVWR3lmUTdZSXZtbyt5YU93QzhVYUNPVUI5S1V2?=
 =?utf-8?B?MEkwdUpxQVIxak9kOVh3Q0U5bmdwRnhFM2pFTUs5aFB6SStQTEk5MXJrV0w3?=
 =?utf-8?B?NEJhR1hFQ2RTQmNySHdJR05NMmkvQ0ZuWVpzSUtDbHkyTmp4UU5oNWhDZUVP?=
 =?utf-8?B?aDE3SFRuU2FPeTlHN2xYak9wZGFHdzNJT1VOUkxyckRGL1pnYnMvT0RFL0ll?=
 =?utf-8?B?emZMT1RaMi9VMGRvTmZIeTNuVW04SmpSOHYwNGRnbVY2VlNVK0NxL3VyTzA1?=
 =?utf-8?B?T3hKNlYrV3VFSEJzc3Q2S1F0aHl5Z0JuUnNFUllFMElvZ3FTU2o0dy90OW9M?=
 =?utf-8?B?UnRORzlMbFYrNXVRMDRrMVJKakZUYVJ4NWNQbk1Jb1RJd3VSL2p2L1ZQRW5F?=
 =?utf-8?B?MGptYXpEN3FJMFRjZHEwSTBRYXd1QUlQWUlCN0FneUdBUWptS1ZEb1NsV0VS?=
 =?utf-8?B?T3dkWXJRSVVwNDNsRGF5eVNnOE5tVTgwZnU5cXRQVmU0RU42SnVvTmlJZTQ1?=
 =?utf-8?B?Qnh3ZjhpcUNBVzBVT3BRbW43RmhSWDI2Ry9UZ2FYdzNRMzJCaHlaaUkzbGYx?=
 =?utf-8?B?dEVqL3BXdlpGdHk4c20zOHRYNE8rdnVNd1lrK2IvaEtOdjBFSFpWZnRoK283?=
 =?utf-8?B?UkMzMjVteTZjRHAvNy9MVGJBb0VNTlB1RU1FdXBINGE1YTB1dFMzODNOc0I1?=
 =?utf-8?B?WUVaMXFlM2NZaVN0NDdUV1NkODJEVFpHRWFHb2NIeWJIZzY3Y0NpckV6TlBu?=
 =?utf-8?B?SE5abUN4NjFSSjFXUlJxVy82VlFpeWVlSTc5TXJHazFLbjBOVkl5cExZMnNH?=
 =?utf-8?Q?5hNQ0w2dNMVts+CvMe9Seq6vp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53c7269-b6c7-4e23-2689-08ddbf81fe72
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 07:18:39.6689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: heQpeRanC+gsCXZi1b5Kzx7jBQg9nv3oCG6cNlVip//nhblLvPpZgOMlSlNj73lBekJlu03dCPblRzyztWa/5Q6ShXXBQCbb/ccxgef8E34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTUxMzQyLyAt
IFJlLXJlcG9ydGVkLg0KDQppOTE1LkNJLkZVTEwgLSBSZS1yZXBvcnRlZC4NClhlLkNJLkZ1bGwg
LSBBZGRyZXNzZWQgZmFpbHVyZXMsIFhlIGNhbm5vdCBiZSByZS1yZXBvcnRlZC4NCg0KVGhhbmtz
LA0KUmF2YWxpLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1p
bmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmIE9mIFBldGVyIFNlbm5hIFRzY2h1ZGluDQpTZW50OiAwOSBKdWx5IDIwMjUgMTI6NDkNClRv
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgWGUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgUmVw
bGFjZSBpbnRlbF9zeXNmc19kZWJ1Z2ZzDQoNCkRlYXIgSTkxNSwNCg0KT24gNy85LzIwMjUgMjo0
OCBBTSwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2Vy
aWVzOiBSZXBsYWNlIGludGVsX3N5c2ZzX2RlYnVnZnMNCj4gVVJMICAgOiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1MTM0Mi8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+
IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIFhFSUdU
Xzg0NDdfRlVMTCAtPiBYRUlHVFBXXzEzNDMyX0ZVTEwgDQo+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0t
LQ0KPiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBj
b21pbmcgd2l0aCBYRUlHVFBXXzEzNDMyX0ZVTEwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAg
dmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBj
aGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNl
ZCBpbiBYRUlHVFBXXzEzNDMyX0ZVTEwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkx
NS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBk
b2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBv
c2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICg0IC0+
IDMpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBNaXNzaW5nICAg
ICgxKTogc2hhcmQtYWRscCANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5
IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTM0MzJfRlVMTDoNCj4gDQo+ICMjIyBJ
R1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiAN
Cj4gICAqIGlndEB4ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3JAcHJvY2Vzcy1tYW55LWxhcmdlLWV4
ZWNxdWV1ZXMtbWFsbG9jLWJvLXVubWFwOg0KPiAgICAgLSBzaGFyZC1ibWc6ICAgICAgICAgIFtQ
QVNTXVsxXSAtPiBbRkFJTF1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9pbnRlbC14ZS9JR1RfODQ0Ny9zaGFyZC1ibWctNy9pZ3RAeGVfZXhlY19zeXN0ZW1f
YWxsb2NhdG9yQHByb2Nlc3MtbWFueS1sYXJnZS1leGVjcXVldWVzLW1hbGxvYy1iby11bm1hcC5o
dG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVs
LXhlL0lHVFBXXzEzNDMyL3NoYXJkLWJtZy01L2lndEANCj4geGVfZXhlY19zeXN0ZW1fYWxsb2Nh
dG9yQHByb2Nlc3MtbWFueS1sYXJnZS1leGVjcXVldWVzLW1hbGxvYy1iby11bm1hcA0KPiAuaHRt
bA0KPiANCj4gICAqIGlndEB4ZV9wbUBzNC1leGVjLWFmdGVyOg0KPiAgICAgLSBzaGFyZC1sbmw6
ICAgICAgICAgIFtQQVNTXVszXSAtPiBbRE1FU0ctV0FSTl1bNF0NCj4gICAgWzNdOiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfODQ0Ny9zaGFyZC1sbmwtMS9p
Z3RAeGVfcG1AczQtZXhlYy1hZnRlci5odG1sDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzEzNDMyL3NoYXJkLWxubC00L2lndEAN
Cj4geGVfcG1AczQtZXhlYy1hZnRlci5odG1sDQoNClRoZXNlIGFyZSB1bnJlbGF0ZWQuIFBsZWFz
ZSBmaXggYW5kIHJlc2VuZC4NCg0KWy4uLl0NCg0KVGhhbmtzLA0KDQpQZXRlcg0K

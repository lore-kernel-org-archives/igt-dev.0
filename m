Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F584CFD376
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 08:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100D810E590;
	Tue,  2 Dec 2025 08:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLY0mAI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F12210E590
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764663062; x=1796199062;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=SzzzL9/0+dTcKjJ2PS+7mbc48P9bLJnY8AFboIjHLE8=;
 b=iLY0mAI3llAyGBTMC84AC/TJaE662ExvurLbvkjyFp3rTvXKVtnbj8y4
 8KVTJbZ4uU2aLEWmUDCG4cWlK51+clqo1QQJPUigthUUbuyGbceHjkEC1
 Y9flMvoAeQOxT7+d/07TPelSr9db8uCeb8XqNXakA1YsolI6SXughkVKq
 JpcqjTXSLKTi19yRzupv7jk1kpYcO/jxOEhExvSlh0q/fP9yneGDBJGcg
 wmRMPAbNBA5h+GVyHH70fcogrPFcg2Ujzohhc0ZuwiurjHxTs5rOXorQ2
 w/VuShmCS7FgDGijCce7MtswD2BW2CisIVBtXmIMw6KFbxFuyJBTi8T1S Q==;
X-CSE-ConnectionGUID: D3RH7XcGRoOQLMdhr4O9ZQ==
X-CSE-MsgGUID: MmVVCEMnQbOXPKTmgwDLmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="69214545"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="69214545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:11:02 -0800
X-CSE-ConnectionGUID: NpnQieLYSme9va57nZPd2g==
X-CSE-MsgGUID: 4kUn2gBXTDGjqt+851+Q/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="199259424"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:11:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:11:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 00:11:01 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:11:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nunotps6rIq8UNWF8xzfkhhJw2VaS2xEuXgak7G+Fz2EN8tQtB0RLOY4QnKfSPQ2ONqoeVWsb70/6NFq2jEe6S3g37CxUsGoj9KYUp6FvcJreODfStiCapTlOmr0GGUUkN/qyqiR3xre1BQBHR6P3qhVQFlONcKDpn24QP3Aae2B60GFh6jNK5T2QLh+mgnYBIHSiR7hPeD/8T3NRmwvO6MctYqgFDOkH/YxEM44i0POiZfm1KkaRU2FuJx0AGlP+ABiIYmAnVaE8sBE2i853HC8DYoWJgk8wGM6pqHEwI44n5+Yr54Ki+9PYCXlNAse2kM5d8hPUGXvFc8j6V87Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzzzL9/0+dTcKjJ2PS+7mbc48P9bLJnY8AFboIjHLE8=;
 b=n95bcJ9BBqkOaVXF3KMKP6T6BzsrtjNAPEhshxP5NMm0GIx6y3GDiLSZK0pCuOrAKWPxfQtI+UoPE/GU10i1xMHFwVP4r6Lp+uICIfEqZMJZcwZY+xQVsQA6a/NtckqlLcXjmo0+V8wocce9C3D7sMkknHGRfG3HvRsUPbNUxL2W8W8P4xuUWoWJJH0kpOydGLUDRtNnFJ+aEFVovnvvz1Ux6+GQjrMWO83QpuMFM+IQgj+L3oiRoNcBAi362Ke+DR4Ggo92eK+eP4voNlDOCVJH0QOZta2b9NpDhu3HYy/27Al1d6DB5ug0aqjak/pBySllJTZC48m8XVB2vP9MEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 08:10:59 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 08:10:59 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t v9 05/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU coherency test
Thread-Topic: [PATCH i-g-t v9 05/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU coherency test
Thread-Index: AQHcYqEuWuD10iBaKECR8ARbF1Kx+bUOAR2A
Date: Tue, 2 Dec 2025 08:10:58 +0000
Message-ID: <81d5b8a52c3b5a430ffa3cf5fb909aa3e7dfb55a.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
 <20251201090201.326595-6-nishit.sharma@intel.com>
In-Reply-To: <20251201090201.326595-6-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|LV8PR11MB8485:EE_
x-ms-office365-filtering-correlation-id: 48c2474f-7363-4da5-24c9-08de317a5385
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?blNzcWt1MllKbGdhZmxMN2k3TXkyMlBvSUp2R2U2Vm1zM1JIVTlrTGplaTly?=
 =?utf-8?B?RG1ReFRKUUxtZEJpb2hlNWs3UzFDMk5kMGRKS1hxeGhBNVZXOHRmWm9hbTk2?=
 =?utf-8?B?ZlFGamtBMWdTM1pXd0VUMThQanlxNUh0VW9GemRUdFp0OEhzc040TXk5a1dt?=
 =?utf-8?B?Wno0YlpQaVlaL0t4MnBaWjRaWXFlUHhSelArSUhNUy9ncEhxOEY1Q0RVMmVz?=
 =?utf-8?B?OEppSHV1VDVyVCt1amZMRWk2ZHlxRCtMUC9DQkhmVEtYTlBMZ1VYR1Jsa0ow?=
 =?utf-8?B?aGZzYlpwcVVJVjhtc2lQS2VrMXpKbFNsNWhxZHJodzdtczFlLzZYWTJRUk1a?=
 =?utf-8?B?NEhtM3huZUtIQUZQT01HOWY0WkpKc0xJYjZUekRva3QvOWN2dll5R002NFUx?=
 =?utf-8?B?dHM1bm1wUzVCR3luUUhENllNek9WVk93NDNGWUFVaVZKZDdWMGdXSkNBam5x?=
 =?utf-8?B?YkZWbG1EZkxnMWpYM3RoOWRJNnc4N2lMcDF5RXdHNVd3N2V5RG5EdFJhQkh6?=
 =?utf-8?B?Y2ErWFlBaU5CcVdKMzQyT0NrUVNLS0R3UG9paGZpL1M2aTY2a3l4cXRoM1ZF?=
 =?utf-8?B?VFAxemZQZjRBNkZNR3MwRXplNzlYcEFPaFJmcExiMlhBQUZyQWVZVTFQMWxD?=
 =?utf-8?B?UUNhaGx2STNUQ3QwL2FzelhQczJPVkwxY2RuZUF6Qm9vUUFrT0hsYkVEWlBJ?=
 =?utf-8?B?cytDYWVyWWpkUG5KQTZEOHFIc1NKSWsyMElvY3M4NGVIYXNHbmxYbFBCVmZ6?=
 =?utf-8?B?dWJoUWdKTDh4bWc5VjFqMzlVV1RKQmZLK3R1eFNqZmlCcWhSZG1NZTA4SXBP?=
 =?utf-8?B?Rkd1TjJVUTFGM3lMNkFwQ1htaG15cDdpSEdCQVA4dGZFMnh1WkJyMjcxS2R1?=
 =?utf-8?B?bjZJSWdTRHdudkpvSHFrQXcxUUxpZ1Z3bHdpanZLQitQMnFXZDJxTkt6WTZq?=
 =?utf-8?B?UVhvejBaNmdmRjNjdWM3bU5WRm15c2diM3ZOL2w3V3hzcnlLaUhJSE0xdXlT?=
 =?utf-8?B?cEJxdXN6MWJaVjJueS8rUTdtUlJTbVZxOVAwT3hySGpUckhLMGQxNUlyVzNn?=
 =?utf-8?B?R0FUb0tDVVJ5Y2psWnoyYWttUmpZR2V1bExoSi9ZMjR2MHd4NEZhNTFMRHRH?=
 =?utf-8?B?Y0VZTTZudlB5ZnAxZVUzTUNLWTRSaHYya05zMlFnUSs0dm5nRkJYOVhuTWN3?=
 =?utf-8?B?YkxUejk0ZWtFbFJSOUZDSjdTaVBwRE41WU56QTFOVEgxem5lMzZEbk5KVlh2?=
 =?utf-8?B?WU9RdHhzb3ZaTzBHOHRUc1B1SzE1SDFPUXhWV0ZWSG8ycnBRTDRXalRmMEx4?=
 =?utf-8?B?ckR2RkgvUXJDWnl5eG9oYy9FY1BzNVFteDZzMVFvdGkzUlNUSW9OaWZnSUM5?=
 =?utf-8?B?S2M0M05GdE5XWFp2b2VkVEw4UUNJTFJxdFZYRUxtSzVYRXVwSHM4dUtybHpM?=
 =?utf-8?B?VjUyenpCdzRQQ3RPQ2RpZzBZQzVhMFMwSU9mSEIyMWs0ZzNZY2FPWTVva1k4?=
 =?utf-8?B?OVF4NnVSRHhGdnpUZ2EwYUdLVkIvb3JWMzJxdFNVVmxha1VaU29zUis5a0NU?=
 =?utf-8?B?L0hTMkQ1bnVrWlVia1pmaWxIeitsSis4QVNINitXaW1WKzFsUmpVMjFLMTFo?=
 =?utf-8?B?alkrcE5pNFJ6alZ5WHcvdGU0Y0IxdmM5amgwWkhuWUU5WFZCR0dkaGxDRDZz?=
 =?utf-8?B?TEFvbkg5RlFTL1YvS09kQnlnUHcwQ1dUZnRjM2NzMFpRbUNYQXU5UWdjYlc1?=
 =?utf-8?B?QVdLY2dLZWFUNXFVbFRPbWZxVUM5cTFHeUNPVGwxY2YycXpwYUd3clByWlh2?=
 =?utf-8?B?U3h2Z3FObjRLUHRacWgxYzE3eHU4cHdMUThSMFNlY3JuMjNwaDgzU0ozNk5N?=
 =?utf-8?B?SG03eG1RenBsTzVCaVdiUUFNOUtBTU03UFRzWTE5aXdyN3ZCV2l2MVVobFRP?=
 =?utf-8?B?STBYT1BvMDZiVzFCUW5hSGx2VVdDcVFTWmVDVG5mRHJSamsvNXFzS3QwczI4?=
 =?utf-8?B?bWlVakJBb05adU1qL21JQ2ZXbS96MXdrcHBWMG1XZTQ2UHZMWU50Y2g0cENR?=
 =?utf-8?Q?ujRwuO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWxQdWU3ZGljclFURk9RemNjTGxoSTZhZzZLamQ0akxXTElaQVJUdWJuOXor?=
 =?utf-8?B?TEUrc1BMZlU0MUF1Y2RVd0QyRWxZZ211d05iU0k2eFNZUFlJM0xYVG8xTUdZ?=
 =?utf-8?B?S3ZyelRldXU5Q1RYMVNjYkJWSHUwTzg2MGQ4Uk9ZY0tVWHZWRDk1ZStMUlBu?=
 =?utf-8?B?UUFFZ2lOTzQvOVlrKzhGNlBmTFpHU04wNE9wenFOdDBhcm1HaklZS0I1bmtQ?=
 =?utf-8?B?MWVsME1LZGljb1RIcEFoTnVacDZnaGtaZVQ1WTFOYU1DWUhHN2N5c2ZLWkdM?=
 =?utf-8?B?WGNBL3hPdWFCQzg0a3RwVmszTnAzeW82clJkRXlKbzNETU9aT3FFQXd5TFAy?=
 =?utf-8?B?YU5XT3B0SXdvM0NUOVBEWFVFTTFXVWtXa3F5OWhYR0N5WGFVNlFJQXZJTGE2?=
 =?utf-8?B?ZUZpVElWOTYyR0NZckNHN2VNRHgxTHRhT3lNQWNHTEhjQ2tJRWlRclY5VUt2?=
 =?utf-8?B?bXZ3Kys1cm1RWWRFYUpLYWhLSWt6cStmOHovUGNSYzQzR21pd2RDTEZBMTZa?=
 =?utf-8?B?NGYvL3JYTHV2V3RnWGw3ZVFyTkFpeGlDRmZabGNJaVRRdlY4ekZmY3BCUk51?=
 =?utf-8?B?VGpXQ3lVOGdiNm56VkFrMnlXcE5OaExkWmhRUERITTlIN0E1RmFVYkYydVFr?=
 =?utf-8?B?N3V6Y0p5ay8wWDhDaE43Vis4ZzlFZGNBejhQZnhKa095bVhIUTkvay9iQ1pQ?=
 =?utf-8?B?bFNMczhmQ0lJNWtoWTBEbGp5SGdDVVlxakZ2MC9rRXA2M0VLTDZ3RDB3dThK?=
 =?utf-8?B?S1FGaHhFSGc4SVpRanBDTDVKL3E3bjAwQVBTcWIxMlczRUFScEpncXlBT1No?=
 =?utf-8?B?S2hvVVk3eFhoL1dETVRiaUtXZ2t4cjFhUFQ3VkpReEtYVTMyMUh5akx2SDdM?=
 =?utf-8?B?enpvRVA0dUhVRW5mKzBhbzB3RkpFMUtOdnEvUGd5YmIrbzlUSytpSjZRWXc5?=
 =?utf-8?B?a2xtejNCSllZSzZHY3pHVDBJMFd4UC91VDRiaXBlKzBnVDdjYVRKRkI0dzJP?=
 =?utf-8?B?UlI4eERyeDBRK1R1RUhjTDhXWTVONWR6Um9zUDBBakMrYVNpVnFDSUlyTXZO?=
 =?utf-8?B?MkhHc3NpU2JDVTdVZ3lsQkhSeTZyblpFVzVIT3hDakx6ZDFMSUExOUNuTGRE?=
 =?utf-8?B?cFpubnZoQ0k3MXpmdEdpNWRVK0twaXE2UEFQaWQybzVqTktBSkQxaFF6QzVC?=
 =?utf-8?B?cG95VEFwdjBWSWtwVGlrNzNqdEdZc0htSXNqZTJVZlFIYndXd1E0VG9zZzZC?=
 =?utf-8?B?ejMrRmRKRGI1aERxQThCWXo1eHpuL3FiWjlGdjkrczRrL2xBT2dReEVxSHFp?=
 =?utf-8?B?SlJvWGlORE9iZkdCZm4wdlhUN01NQmxyTndveDdzZ1kwc0xRZ2pXOG5YNW56?=
 =?utf-8?B?UTIwZDlFRXdnak9nY1RRTEZrMVI0eXBhTXpXM2QyWDMxaERRdG5IUHV2TkRX?=
 =?utf-8?B?aWFpenRpVkgxUVlPdzJjYks0cmdEdEtFaFlGaDdkSWs0cXBWWDBJZ0lXZCti?=
 =?utf-8?B?MmszWU1MeDkzV20vZXpFRitPQ2JRVjNSTVJWdFR3VDVOS3ovQjJvRU9VTjF0?=
 =?utf-8?B?MVhnUVk5cWI1L2dPREMrb3VKMUFaS21FR2RJN0ZYcEYvdGF4ZWhZL3JPd3lB?=
 =?utf-8?B?bkRRL2kzVWVVZ2VwUStUQ29JcGxTL255V2lIV08wbUlUM3k4Z01wb2N1R0Jo?=
 =?utf-8?B?RjRTZFYxRCtYUFVUMEtDQno2RFR3RmpDMEpKMzV3cmtHTWFBanFSazNrNDYz?=
 =?utf-8?B?SXVzU1g0c1dxeUFsemNCdzRrT2NDR1VwL3RKTmtNMUxSai9oUzJyRWcvY24y?=
 =?utf-8?B?Mm5hNjRWdkRjYUVnbllCSnh4aVJrZDBhL1NHV253aWtUSHhETEUzLzlKdVI1?=
 =?utf-8?B?M05KNkJwcGpabkVjdGZDQVRoOHlWN0o1VFRpd3pqNzh0ay92MTBORVh5dEV5?=
 =?utf-8?B?SVdQcmV2OXFhTlIwS1NhdHg0TXZ6VXZBdDAxK29rRUp4K1RuS0ozdzMxNXRt?=
 =?utf-8?B?RldzcXFYYTZIaHdNWklPS0dnejJFWkZxMFBsckJKSktydDVhYkUvYm1vZXlE?=
 =?utf-8?B?L3RsdGdIRmduTlpZZ2EzeERxdEdSMGtzSkFKNHQrcVdMclg4aDgzcThjbVE1?=
 =?utf-8?B?eUg0Y3FZQTJrMlZkRzFQL3RnV0pXQ1Vmb2xWdE1IbVBpWHliU2dBLzk2WTFt?=
 =?utf-8?Q?tEe2VoXt2EWudTMp181wleQccVLTgR50e6nwhAPl4ahv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4FE6806B6496C4EA88846F7D50ADBB8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c2474f-7363-4da5-24c9-08de317a5385
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 08:10:58.9911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wn5OU272fba//6kc3aRStEL4N36Z5Fb9+Q/7gQv5nGZk/Pqtkhmd0nTfAFwlJC1i6clkD1ryZgsl8oKwynHreykxJ8JIX5J5l7QQ9otD3qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDA5OjAxICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgdmVyaWZpZXMgbWVtb3J5IGNvaGVyZW5jeSBpbiBhIG11bHRpLUdQ
VSBlbnZpcm9ubWVudCB1c2luZw0KPiBTVk0uDQo+IEdQVSAxIHdyaXRlcyB0byBhIHNoYXJlZCBi
dWZmZXIsIEdQVSAyIHJlYWRzIGFuZCBjaGVja3MgZm9yIGNvcnJlY3QNCj4gZGF0YQ0KPiB3aXRo
b3V0IGV4cGxpY2l0IHN5bmNocm9uaXphdGlvbiwgYW5kIHRoZSB0ZXN0IGlzIHJlcGVhdGVkIHdp
dGggQ1BVDQo+IGFuZA0KPiBib3RoIEdQVXMgdG8gZW5zdXJlIGNvbnNpc3RlbnQgbWVtb3J5IHZp
c2liaWxpdHkgYWNyb3NzIGFnZW50cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFy
bWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRlbC94ZV9t
dWx0aV9ncHVzdm0uYyB8IDIyMA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIyMCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9tdWx0
aV9ncHVzdm0uYw0KPiBpbmRleCAxZDEyNmM3NDAuLjYxNjY3OTViMyAxMDA2NDQNCj4gLS0tIGEv
dGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfbXVs
dGlfZ3B1c3ZtLmMNCj4gQEAgLTQ0LDYgKzQ0LDI2IEBADQo+IMKgICoJVGVzdHMgY3Jvc3MtR1BV
IGF0b21pYyBpbmNyZW1lbnQgb3BlcmF0aW9ucyB3aXRoIGV4cGxpY2l0DQo+IG1lbW9yeSBwcmVm
ZXRjaA0KPiDCoCAqCXRvIHZhbGlkYXRlIFNWTSBhdG9taWMgb3BlcmF0aW9ucyBpbiBtdWx0aS1H
UFUgY29uZmlnDQo+IMKgICoNCj4gKyAqIFNVQlRFU1Q6IG1ncHUtY29oZXJlbmN5LWJhc2ljDQo+
ICsgKiBEZXNjcmlwdGlvbjoNCj4gKyAqCVRlc3QgYmFzaWMgY3Jvc3MtR1BVIG1lbW9yeSBjb2hl
cmVuY3kgd2hlcmUgb25lIEdQVSB3cml0ZXMNCj4gZGF0YQ0KPiArICoJYW5kIGFub3RoZXIgR1BV
IHJlYWRzIHRvIHZlcmlmeSBjb2hlcmVudCBtZW1vcnkgYWNjZXNzDQo+IHdpdGhvdXQgcHJlZmV0
Y2gNCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBtZ3B1LWNvaGVyZW5jeS1mYWlsLWJhc2ljDQo+ICsg
KiBEZXNjcmlwdGlvbjoNCj4gKyAqCVRlc3QgY29uY3VycmVudCB3cml0ZSByYWNlIGNvbmRpdGlv
bnMgYmV0d2VlbiBHUFVzIHRvIHZlcmlmeQ0KPiBjb2hlcmVuY3kNCj4gKyAqCWJlaGF2aW9yIHdo
ZW4gbXVsdGlwbGUgR1BVcyB3cml0ZSB0byB0aGUgc2FtZSBtZW1vcnkNCj4gbG9jYXRpb24gd2l0
aG91dCBwcmVmZXRjaA0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IG1ncHUtY29oZXJlbmN5LXByZWZl
dGNoDQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4gKyAqCVRlc3QgY3Jvc3MtR1BVIG1lbW9yeSBjb2hl
cmVuY3kgd2l0aCBleHBsaWNpdCBwcmVmZXRjaCB0bw0KPiB2YWxpZGF0ZQ0KPiArICoJY29oZXJl
bnQgbWVtb3J5IGFjY2VzcyBhbmQgbWlncmF0aW9uIGFjcm9zcyBHUFVzDQo+ICsgKg0KPiArICog
U1VCVEVTVDogbWdwdS1jb2hlcmVuY3ktZmFpbC1wcmVmZXRjaA0KPiArICogRGVzY3JpcHRpb246
DQo+ICsgKglUZXN0IGNvbmN1cnJlbnQgd3JpdGUgcmFjZSBjb25kaXRpb25zIHdpdGggcHJlZmV0
Y2ggdG8NCj4gdmVyaWZ5IGNvaGVyZW5jeQ0KPiArICoJYmVoYXZpb3IgYW5kIG1lbW9yeSBtaWdy
YXRpb24gd2hlbiBtdWx0aXBsZSBHUFVzIGNvbXBldGUgZm9yDQo+IHNhbWUgbG9jYXRpb24NCj4g
KyAqDQo+IMKgICovDQo+IMKgDQo+IMKgI2RlZmluZSBNQVhfWEVfUkVHSU9OUwk4DQo+IEBAIC01
NCwxNCArNzQsMTggQEANCj4gwqAjZGVmaW5lIEVYRUNfU1lOQ19WQUwgMHg2NzY3NjcNCj4gwqAj
ZGVmaW5lIENPUFlfU0laRSBTWl82NE0NCj4gwqAjZGVmaW5lCUFUT01JQ19PUF9WQUwJNTYNCj4g
KyNkZWZpbmUgQkFUQ0hfVkFMVUUJNjANCj4gwqANCj4gwqAjZGVmaW5lIE1VTFRJR1BVX1BSRUZF
VENICQlCSVQoMSkNCj4gwqAjZGVmaW5lIE1VTFRJR1BVX1hHUFVfQUNDRVNTCQlCSVQoMikNCj4g
wqAjZGVmaW5lIE1VTFRJR1BVX0FUT01JQ19PUAkJQklUKDMpDQo+ICsjZGVmaW5lIE1VTFRJR1BV
X0NPSF9PUAkJCUJJVCg0KQ0KPiArI2RlZmluZSBNVUxUSUdQVV9DT0hfRkFJTAkJQklUKDUpDQo+
IMKgDQo+IMKgI2RlZmluZSBJTklUCTINCj4gwqAjZGVmaW5lIFNUT1JFCTMNCj4gwqAjZGVmaW5l
IEFUT01JQwk0DQo+ICsjZGVmaW5lIERXT1JECTUNCj4gwqANCj4gwqBzdHJ1Y3QgeGVfc3ZtX2dw
dV9pbmZvIHsNCj4gwqAJYm9vbCBzdXBwb3J0c19mYXVsdHM7DQo+IEBAIC0xMDIsNiArMTI2LDEx
IEBAIHN0YXRpYyB2b2lkIGdwdV9hdG9taWNfaW5jX3dyYXBwZXIoc3RydWN0DQo+IHhlX3N2bV9n
cHVfaW5mbyAqc3JjLA0KPiDCoAkJCQnCoMKgIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNz
X2luc3RhbmNlICplY2ksDQo+IMKgCQkJCcKgwqAgdW5zaWduZWQgaW50IGZsYWdzKTsNCj4gwqAN
Cj4gK3N0YXRpYyB2b2lkIGdwdV9jb2hlcmVjeV90ZXN0X3dyYXBwZXIoc3RydWN0IHhlX3N2bV9n
cHVfaW5mbyAqc3JjLA0KPiArCQkJCcKgwqDCoMKgwqAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAq
ZHN0LA0KPiArCQkJCcKgwqDCoMKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5z
dGFuY2UgKmVjaSwNCj4gKwkJCQnCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBmbGFncyk7DQo+ICsN
Cj4gwqBzdGF0aWMgdm9pZA0KPiDCoGNyZWF0ZV92bV9hbmRfcXVldWUoc3RydWN0IHhlX3N2bV9n
cHVfaW5mbyAqZ3B1LCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNp
LA0KPiDCoAkJwqDCoMKgIHVpbnQzMl90ICp2bSwgdWludDMyX3QgKmV4ZWNfcXVldWUpDQo+IEBA
IC0yMTgsNiArMjQ3LDM1IEBAIGF0b21pY19iYXRjaF9pbml0KGludCBmZCwgdWludDMyX3Qgdm0s
IHVpbnQ2NF90DQo+IHNyY19hZGRyLA0KPiDCoAkqYWRkciA9IGJhdGNoX2FkZHI7DQo+IMKgfQ0K
PiDCoA0KPiArc3RhdGljIHZvaWQNCj4gK3N0b3JlX2R3b3JkX2JhdGNoX2luaXQoaW50IGZkLCB1
aW50MzJfdCB2bSwgdWludDY0X3Qgc3JjX2FkZHIsDQo+ICsJCcKgwqDCoMKgwqDCoCB1aW50MzJf
dCAqYm8sIHVpbnQ2NF90ICphZGRyLCBpbnQgdmFsdWUpDQo+ICt7DQo+ICsJdWludDMyX3QgYmF0
Y2hfYm9fc2l6ZSA9IEJBVENIX1NJWkUoZmQpOw0KPiArCXVpbnQzMl90IGJhdGNoX2JvOw0KPiAr
CXVpbnQ2NF90IGJhdGNoX2FkZHI7DQo+ICsJdm9pZCAqYmF0Y2g7DQo+ICsJdWludDMyX3QgKmNt
ZDsNCj4gKwlpbnQgaSA9IDA7DQo+ICsNCj4gKwliYXRjaF9ibyA9IHhlX2JvX2NyZWF0ZShmZCwg
dm0sIGJhdGNoX2JvX3NpemUsDQo+IHZyYW1faWZfcG9zc2libGUoZmQsIDApLCAwKTsNCj4gKwli
YXRjaCA9IHhlX2JvX21hcChmZCwgYmF0Y2hfYm8sIGJhdGNoX2JvX3NpemUpOw0KPiArCWNtZCA9
ICh1aW50MzJfdCAqKSBiYXRjaDsNCj4gKw0KPiArCWNtZFtpKytdID0gTUlfU1RPUkVfRFdPUkRf
SU1NX0dFTjQ7DQo+ICsJY21kW2krK10gPSBzcmNfYWRkcjsNCj4gKwljbWRbaSsrXSA9IHNyY19h
ZGRyID4+IDMyOw0KPiArCWNtZFtpKytdID0gdmFsdWU7DQo+ICsJY21kW2krK10gPSBNSV9CQVRD
SF9CVUZGRVJfRU5EOw0KPiArDQo+ICsJYmF0Y2hfYWRkciA9IHRvX3VzZXJfcG9pbnRlcihiYXRj
aCk7DQo+ICsNCj4gKwkvKiBQdW5jaCBhIGdhcCBpbiB0aGUgU1ZNIG1hcCB3aGVyZSB3ZSBtYXAg
dGhlIGJhdGNoX2JvICovDQo+ICsJeGVfdm1fYmluZF9scl9zeW5jKGZkLCB2bSwgYmF0Y2hfYm8s
IDAsIGJhdGNoX2FkZHIsDQo+IGJhdGNoX2JvX3NpemUsIDApOw0KPiArCSpibyA9IGJhdGNoX2Jv
Ow0KPiArCSphZGRyID0gYmF0Y2hfYWRkcjsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyB2b2lkIGJh
dGNoX2luaXQoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3Qgc3JjX2FkZHIsDQo+IMKgCQnC
oMKgwqDCoMKgwqAgdWludDY0X3QgZHN0X2FkZHIsIHVpbnQ2NF90IGNvcHlfc2l6ZSwNCj4gwqAJ
CcKgwqDCoMKgwqDCoCB1aW50MzJfdCAqYm8sIHVpbnQ2NF90ICphZGRyKQ0KPiBAQCAtMzUyLDYg
KzQxMCw5IEBAIGdwdV9iYXRjaF9jcmVhdGUoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1LA0K
PiB1aW50MzJfdCB2bSwgdWludDMyX3QgZXhlY19xdWV1ZSwNCj4gwqAJY2FzZSBJTklUOg0KPiDC
oAkJYmF0Y2hfaW5pdChncHUtPmZkLCB2bSwgc3JjX2FkZHIsIGRzdF9hZGRyLCBTWl80SywNCj4g
YmF0Y2hfYm8sIGJhdGNoX2FkZHIpOw0KPiDCoAkJYnJlYWs7DQo+ICsJY2FzZSBEV09SRDoNCj4g
KwkJc3RvcmVfZHdvcmRfYmF0Y2hfaW5pdChncHUtPmZkLCB2bSwgc3JjX2FkZHIsDQo+IGJhdGNo
X2JvLCBiYXRjaF9hZGRyLCBCQVRDSF9WQUxVRSk7DQo+ICsJCWJyZWFrOw0KPiDCoAlkZWZhdWx0
Og0KPiDCoAkJaWd0X2Fzc2VydCghIlVua25vd24gYmF0Y2ggb3BfdHlwZSIpOw0KPiDCoAl9DQo+
IEBAIC01MDAsNiArNTYxLDE0NiBAQCBhdG9taWNfaW5jX29wKHN0cnVjdCB4ZV9zdm1fZ3B1X2lu
Zm8gKmdwdTEsDQo+IMKgCWNsZWFudXBfdm1fYW5kX3F1ZXVlKGdwdTIsIHZtWzFdLCBleGVjX3F1
ZXVlWzFdKTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgdm9pZA0KPiArY29oZXJlbmN5X3Rlc3Rf
bXVsdGlncHUoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MSwNCj4gKwkJCXN0cnVjdCB4ZV9z
dm1fZ3B1X2luZm8gKmdwdTIsDQo+ICsJCQlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0
YW5jZSAqZWNpLA0KPiArCQkJdW5zaWduZWQgaW50IGZsYWdzKQ0KPiArew0KPiArCXVpbnQ2NF90
IGFkZHI7DQo+ICsJdWludDMyX3Qgdm1bMl07DQo+ICsJdWludDMyX3QgZXhlY19xdWV1ZVsyXTsN
Cj4gKwl1aW50MzJfdCBiYXRjaF9ib1syXSwgYmF0Y2gxX2JvWzJdOw0KPiArCXVpbnQ2NF90IGJh
dGNoX2FkZHJbMl0sIGJhdGNoMV9hZGRyWzJdOw0KPiArCXVpbnQ2NF90ICpkYXRhMTsNCj4gKwl2
b2lkICpjb3B5X2RzdDsNCj4gKwl1aW50MzJfdCBmaW5hbF92YWx1ZTsNCj4gKw0KPiArCS8qIFNr
aXAgaWYgZWl0aGVyIEdQVSBkb2Vzbid0IHN1cHBvcnQgZmF1bHRzICovDQo+ICsJaWYgKG1ncHVf
Y2hlY2tfZmF1bHRfc3VwcG9ydChncHUxLCBncHUyKSkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJ
Y3JlYXRlX3ZtX2FuZF9xdWV1ZShncHUxLCBlY2ksICZ2bVswXSwgJmV4ZWNfcXVldWVbMF0pOw0K
PiArCWNyZWF0ZV92bV9hbmRfcXVldWUoZ3B1MiwgZWNpLCAmdm1bMV0sICZleGVjX3F1ZXVlWzFd
KTsNCj4gKw0KPiArCWRhdGExID0gYWxpZ25lZF9hbGxvYyhTWl8yTSwgU1pfNEspOw0KPiArCWln
dF9hc3NlcnQoZGF0YTEpOw0KPiArCWFkZHIgPSB0b191c2VyX3BvaW50ZXIoZGF0YTEpOw0KPiAr
DQo+ICsJY29weV9kc3QgPSBhbGlnbmVkX2FsbG9jKFNaXzJNLCBTWl80Syk7DQo+ICsJaWd0X2Fz
c2VydChjb3B5X2RzdCk7DQo+ICsNCj4gKwkvKiBHUFUxOiBDcmVhdGluZyBiYXRjaCB3aXRoIHBy
ZWRlZmluZWQgdmFsdWUgKi8NCj4gKwlncHVfYmF0Y2hfY3JlYXRlKGdwdTEsIHZtWzBdLCBleGVj
X3F1ZXVlWzBdLCBhZGRyLCAwLA0KPiArCQkJICZiYXRjaF9ib1swXSwgJmJhdGNoX2FkZHJbMF0s
IGZsYWdzLA0KPiBEV09SRCk7DQo+ICsNCj4gKwkvKkdQVTE6IE1hZHZpc2UgYW5kIFByZWZldGNo
IE9wcyAqLw0KPiArCWdwdV9tYWR2aXNlX3N5bmMoZ3B1MSwgdm1bMF0sIGV4ZWNfcXVldWVbMF0s
IGFkZHIsDQo+ICZiYXRjaF9hZGRyWzBdLCBmbGFncyk7DQo+ICsNCj4gKwkvKiBOT1cgQ1BVIGNh
biByZWFkIGFkZCAoR1BVMSBTVE9SRSBvcCkgKi8NCj4gKwlmaW5hbF92YWx1ZSA9IFJFQURfT05D
RSgqKHVpbnQzMl90ICopYWRkcik7DQo+ICsJaWd0X2RlYnVnKCJHUFUxIHdyaXR0ZW4gdmFsdWU6
ICV1XG4iLCBmaW5hbF92YWx1ZSk7DQoNCkhtbS4gRGlkbid0IHdlIGNvbmNsdWRlIGxhc3QgcmV2
aWV3IHJvdW5kIHRoYXQgdGhlIGFib3ZlIGRlY291cGxlZCB0aGUNCnRlc3RzIHNvIHdlIGhhZCB0
d28gc2luZ2xlLWdwdSB0ZXN0cyByYXRoZXIgdGhhbiBhIG11bHRpLWdwdSB0ZXN0Pw0KDQoNCi9U
aG9tYXMNCg0K

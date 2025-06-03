Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161C8C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 18:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC3210E610;
	Tue,  3 Jun 2025 18:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoN0GRvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D134A10E610
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748976038; x=1780512038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w/FZ0GOmMZQhe5xyG2i34oxQfD3+ByScA96ymomzxwM=;
 b=PoN0GRvbAMDe6NRWkyYNhtptKUUIajUJALbVlVTQqE4gJRfvlcY0VNRt
 soT2h+8L/+7np20ENvOpG9G4TpsVnQwBe7Vc/YSS/FT3p8qtwFEXu3WM4
 XEzovNO3dnYE+OsN1APlstTXywPR6CKk5pW7MDRv7R2vq1cGCtSF2bU1S
 x71orr0qx23JFtcu4VItWT4D3ccMjstCa/23cebpeU8ckE+vitdVekn7d
 mXBwPyWMq+dyNQFYdD2FG8n7ZzuJx2xfSEaruqhA9XaHpW2V54JdymOsQ
 d1KkqelFlxC3MONiHNCwg12gUnwI16OZtJ5jAmcrXBjB9hIFB7vvW/0Jm A==;
X-CSE-ConnectionGUID: +vBiKYTbT/ObU3N8NnM2qw==
X-CSE-MsgGUID: RHRyoLQmSpWTCg1zLCwNcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54696505"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="54696505"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:40:30 -0700
X-CSE-ConnectionGUID: gPoovCASRFCV5Gtal8ixGw==
X-CSE-MsgGUID: k05Gu5h1TZWcEG2GRzyLXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="150235934"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:40:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:40:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 11:40:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1D4ot9EtbY0emW0Im9rqMGl5cYiUHzfONbPq2wxyEUCizX926luSIGMc4fYtIhGoxaDuDRvw3lCUonbC4P9iOE26fukpQZ2tSULJDbG2fDsyl2jneh6SQi6Lw1A1LE+szY2vtqF4PQKPAhImtVrm1J/E9Imc5KYGcEnONBTuXwnIh5iKSk5Uxk/7Tdkv7WWQ5639p164/fliwS0CF8T8QHsTDD1NktgEo07+wIk1zM9AshAMVaLOQIcBZgIwy9k/r/fYxKUTYWMWV58Bhe6sUmL0468w2+S2CL+g57H0wKbMbfthZM8mXFrgPww3PCggl6PmdkCA9SeNMN3P81WqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/FZ0GOmMZQhe5xyG2i34oxQfD3+ByScA96ymomzxwM=;
 b=QYq1QSxU7keg41tPKm2jcd7Z3BaGusGkODA3j2OiXSFzKrciLz62eqO4QF1c99Xj+DW2F37wTwwF8NXj3RZoroXp8Cnxj7G11x7qaz6pHqvLOVP/6r/O0KJrW06WSTXOsFv/kxlycmZwgD5vCr4uM1Xm2vLO5v7hdHx+Egv9DJLYY+t/Xz2hxKYo0m6mAiJrPZqWW3YUhS6CBngQ81P42KXC7gBYEY7yotP4ZJNGEokVkeBarlGY2IC7JqF4skwFE2tc37Br0rsdgSPtTPK26euFpJuYxz9+F0AD0WGJZSKIv7LI/sQUHcMyU9zVx8+1csdkH51KftLsgmVequG0SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA4PR11MB9057.namprd11.prod.outlook.com (2603:10b6:208:55d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 3 Jun
 2025 18:40:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 18:40:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] tests/intel/xe_fault_injection: Ignore *ERROR* dmesg
 reports
Thread-Topic: [PATCH] tests/intel/xe_fault_injection: Ignore *ERROR* dmesg
 reports
Thread-Index: AQHb1KMhoy6sed+wdUGlXbhruHKvxLPxsIeAgAAQAZCAAANp4A==
Date: Tue, 3 Jun 2025 18:40:14 +0000
Message-ID: <CH0PR11MB5444710E6D80E8535FAA11B1E56DA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250603161804.283350-1-jonathan.cavitt@intel.com>
 <143d8b11-3ab1-4574-8f2b-61591bba8f60@intel.com>
 <CH0PR11MB5444976DE5CFFF252E065BD2E56DA@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5444976DE5CFFF252E065BD2E56DA@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA4PR11MB9057:EE_
x-ms-office365-filtering-correlation-id: 74aef954-f76e-4a8e-b4d9-08dda2ce1457
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?NUlzY3R4M1ZQMVVnSm5xNHNwYXhUNzV3ZUZ6WHpxUzlrQmc2R0R4K25yakM4?=
 =?utf-8?B?STBGWkxyMk1pUGtYNXNQN21zMU02VVNkTDlUMkdiNUgwUUxRczlsUUNaZjc0?=
 =?utf-8?B?UFIreVpxS1Y0ajF4Z2tjVEwzSlZDZFJkaXF3NWJnTHk3cG1sQUwzUXkzZm0v?=
 =?utf-8?B?QVZIK3oybkFlSlYvSi9HYTlDOWRrWnhuT3JVZGNKdjh6ajRMekdXTEMwSTNm?=
 =?utf-8?B?OTlUNjY0S1J6b3QzVmx4YUxkTUdBWE1YNVNtVytyOW1aSVR5T0IzdmlvRTcx?=
 =?utf-8?B?cGh3RnpGMFRhVnNYeElEdVg0ODZVeElLY3ZaV1FRc2tobGVIN0d3c2cvVjlx?=
 =?utf-8?B?SmE0RG5FUlo3QW8yM2grRmRIeTljejQvdnRFMS9vNzZFSkV6elFwVHljNXNa?=
 =?utf-8?B?VEVQb2JqVDI2UEJnMEUrZkFyVUFUU1B2RitPSnkvU0hDblQxSWtpWURzVkV1?=
 =?utf-8?B?WmJLT3ljc1NNeTJIMEZCRUxOS2VxUHYrMUl0K0s3NUJuYmVoU0NhcTN3Mllw?=
 =?utf-8?B?NGNMRnZja1hYK3ZoNXpkc2xvdlQ0UXNTWkk2dnVwbExKZHpqbmY2NU04Zmdv?=
 =?utf-8?B?MVVOZGM2OThocEVhQmhhQWJNVTQxOXcyQS9yaXVZaVdnQW5DSzhrQk52K1V4?=
 =?utf-8?B?MXpOdlpyRFJoTUV5VkcrTEIrRjV6c2NkOXF2aitmZmRoMS95RDR6dzNhZ3lW?=
 =?utf-8?B?N1AvczJkTE9rSFhkTmtpbnFhc29nNDB6RkdUS2hSQ3lKajhCYVBScVMzNVlm?=
 =?utf-8?B?SVBnbmdFM2tWWi9PdCtBRVlINHpOVkpZVWRXV2IycFEzS0dJZ3FtaDN0U3lj?=
 =?utf-8?B?UTZNNnE1Zll6Tlg3cFhXUS9QUVA0M2ErUnNEMU1XcWFFVXBlSTRpUWw4dlNQ?=
 =?utf-8?B?Snd1V0hoaVhLck1pU09HREdSQjZqdG1ldm1ENFFzWGhJQUNDUUp5MHYrNjRv?=
 =?utf-8?B?cW5YNld5UGZKRUxaQ0txZHpDY1R5SUhKZ2FqR0ljQ2k5T3pSYW4zN1dhakpk?=
 =?utf-8?B?ckhoVW9GbEpSNXYycXhNbkJzdFhtZGtwYVJiZUZaaEl5WnY2bis2UFV5NVND?=
 =?utf-8?B?UFVjRnVEQ09JL00zQXp3R0lPUWoyUzdlWVUyWmlNMVYrYXZwbUtiUWtXcTB4?=
 =?utf-8?B?MURsVWZheEZ4bTFBdEwySWFxeTgvRnI0QllRYVhROXY3a2NRQ3RHc2xjcm5R?=
 =?utf-8?B?NGI0YVJ5d3M2Vmg2ZTR3ay8yZERSMWF0Q1hOMU1wY3FwWFBCNWNCZ09jWVk2?=
 =?utf-8?B?L0orVGJGT25xamNiTVQ4NGI0Y0l2bW9iTVVyZ1Bta043ZVpzVk5BWVA4RmZ5?=
 =?utf-8?B?RTY3THhDSTJXUWsrRExsYTFxbFFoTjFWdVZHNzlXTVk0bGc1VXI4bFZRWHhw?=
 =?utf-8?B?R1NmZ3YranBxb2U2VjhvWDkrNFljWHhzR1hrdTFaMWthWkppSnhBYlBDSmpL?=
 =?utf-8?B?ckZ6RWtPS0VmcW9WVTFHcEJiT3BrMWoxNEpIRmdTY2pCYldUN0tHaWd5UFdC?=
 =?utf-8?B?SSt0ajdmZ3NsRjRSK0xxaGs5d0xHOVFxemxhbVB2RGNxZktwOEdtaE5YemZs?=
 =?utf-8?B?amgzU25nS0pleW1xUTNRUGR6aDVTbFBzb2dZU0RmYlNHa1RtVzhpaUlSTm9W?=
 =?utf-8?B?ZVppeHhTSWpTSTRia1A5TDdwNmQ2WW1CeG03N3ZHSGsrczdDMXhEYmp5d2NK?=
 =?utf-8?B?OFNXTGJXSlJVSWFvcTFURnFRWlRUZHZDZURPYUdFK09ucnVLb1RLK0V5bzRG?=
 =?utf-8?B?NWEzczhYSVlWeDhyNWpoYmQ5RElWZk9uUUtDOFZUc2dhVlRpT0NtU0t4LzFC?=
 =?utf-8?B?ZkFUSG5FTGZMVHE4SXovODhacXZTeGdVUk1UN3JKQ3E4bXJMUGRHajFycFhL?=
 =?utf-8?B?RkhaQXJucFdiZkJubWp0SmZvSWFINndBbUdleHlTTzM4aXZOQXBxL0lJcVdy?=
 =?utf-8?B?dVJ5Qy84WW8rT1IyZzBUWXdGMXdQTU5oUXJPdjlsc09GRUlWck1GWHF1K0p4?=
 =?utf-8?B?aFVHWU9nWCtBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODdaN3ZVVGRXQjAxUzNBT1ZIelRBUWF0VG4rTW1IT2xFaXRJRzI0bzJ1NDVQ?=
 =?utf-8?B?bk5jc0hvM2x3b2ZRcXpPZVdVWVl2Tk43SFJWTmVwY1dFQkFYT3ZDWGZ2OHhC?=
 =?utf-8?B?Wk5MSkVWVGVON3pWcEZaQ0ErQTVwYXk1ZFVHc3p4U3hPWUZrbEN1NWJLYzJZ?=
 =?utf-8?B?VmM1WU5vQVcwUlM3eStvazVGMStlTTdMMkx0NE5XeE1IYkxqYzIwdEM1NEVO?=
 =?utf-8?B?OU1EUXBUSFZNbTRaZGpOS3N5NEQ3dFlVc3V6elozQzArVmUxeWc4dnA5dEsw?=
 =?utf-8?B?UVNlZFo2NC9nVDRMR0ZQUUJvNG8zUDdjRURIUVNGSUtvZmFJSDl1cjRaWFBu?=
 =?utf-8?B?a3VNMzNjelEwbnViS0JLaHRsZW9FeVdsamRvTENEZ3YxMExiZzJLaXVValNi?=
 =?utf-8?B?L2tvTzFPUjUwclhRRElYZFY5U211V2xYek9IK2RrQytKVVAyWjUvd3pBK2sw?=
 =?utf-8?B?eHRzUm1TdEplSzZ3eTBKK0NkZVliK3drSEpoUWFIbTBBR01BNUw5YTVDMisr?=
 =?utf-8?B?QXJFU0VsWFlDQUlqQ3B5eE9LWUdsdEk2WnB2dDN5OU1VMzM4b0k0MjJUNTJP?=
 =?utf-8?B?ajdxdkdsM0VHaHVUUjJDdjgwcElYQ1d3RVA5RmtGRkkxNHNjUzJmWDlRSDha?=
 =?utf-8?B?KzJETTlidVdlK0YxNThLQTk4bUVxQnRyMTdsYWJMbDdZQXdJSzE3RmFaNjEw?=
 =?utf-8?B?anZFcW0yQzFTODRKUU9kZ1k0eVVhZy9EU1dqUDFXcFBaMXNpRWVwN3R1VktJ?=
 =?utf-8?B?WWVwQ3N4aXk1bkkrRk5MWDJMelRpbVpadUNlZGtjcmhOSnZ0UmlFWUxDUXc5?=
 =?utf-8?B?TkZCTEUvTmx2N3E3U20zSG8rYmlIOG1vVU04RUFMTXMwOWY1NGhySTc3SjF0?=
 =?utf-8?B?QzU2UHd5dTlIZ245eWZ2MkZQVE9pRDZtWi9ESTgvQUQvSFQwNVRteGN4UmdD?=
 =?utf-8?B?U3RCWVhHcXFLY1hxOWlHellqVUc3b0g0VXozWXVXd0REcXBSTEZ5MFBQNmlM?=
 =?utf-8?B?NkN2YUxyRzRwNnlaQlpXTkloYzBxR0dwYjVwZUFuS3ZGY2h5SkVxdUZkYWZL?=
 =?utf-8?B?TzE2RmkrVXpQYVRHZDRFV3RValozWWZ0clF2TEZBcHAybnpuNjk1UmJlQmJN?=
 =?utf-8?B?engwdHFXaXhNeDIxM3RZcFZPSzh5TmdUZEQybEdUR3RLMVN2Qy9CZG1oT0p6?=
 =?utf-8?B?UlVTZzNWU3o4cVkrS1VlNVRDa2psMmZVVFJIbFo1TFJGYUdIMStSVVh5RURl?=
 =?utf-8?B?UGtFQWRIcEFkUUtuRDRpKzhkMjJ2M2VCeWJLQkVUVXZ6S2had1RJREtDckdT?=
 =?utf-8?B?RWQrR21lSzRaTG1VeDhZekZpN1pTVUFhUUtRaVVrWVdlUndkUTFZWnUxdFp6?=
 =?utf-8?B?RXV2cXIrakp4QUxwNzJtUVQ1RFovOGpJUzRxb3M5RTZIY3JwOVRyMm5zQ3pp?=
 =?utf-8?B?WlN1cG1zeTd4dm80b1pmY3ZZNU1KMGduTDQwRkhkOHZDdSs2alBDUGtNQ0ND?=
 =?utf-8?B?M3MvbCt0enlrMEFqMGY0WGtrLzdDSzF5aitlK0hMdnFnN3I4RjNOTzhQZWI4?=
 =?utf-8?B?Qk0yUktReDlUWTlpdlJvR2h4TUpwdm55WTBybHhlNW52eS9EaGVRV05kV1U1?=
 =?utf-8?B?K0RIbmJrSHlYOE1DUSt1czA3NmRnb0ZNYmtBNXdLSzBPdEdaeC9hMi94ZFIz?=
 =?utf-8?B?dmRnS0MvdHZ1TEFYalRiM3ErTU1oNXlSYzVuTFhqYkJ1T0pGMkZycW8wVUdn?=
 =?utf-8?B?SDRtaUhpWm9UYnV3QStrNzdQeHdET1IwN1V1cEFMOGppUCt4T04zeFFUSlpy?=
 =?utf-8?B?dy9ZOENBUWFuSVJZVlBGSVZ3T3J6cnN3SXZNanFET1NUNGIxM0F1c3BSYXE2?=
 =?utf-8?B?ZWYrM0ExcEJsdVhJR0lhOWszRDdGV2RDU3JtdG1rUkdWc0dCQzdETU01TGts?=
 =?utf-8?B?NU10aUlvTUZLd2dnLzdqMWhNKzB4MWMxMkFQNFVCK1huOHZPanpVZ2pqL3BK?=
 =?utf-8?B?ZEJnUitMNUNHT1JTZmdoa0VodG8zb1dRdUUzNXZkeDRiN0NudDFwUEhzYUxJ?=
 =?utf-8?B?MTZEZWc0SGhSRllqT25YbFVnTGhQbmlXaUNvM0JDblBqL284TEJnamNlendW?=
 =?utf-8?Q?DNgqQ9/5VWzyFax3hJX731lQi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74aef954-f76e-4a8e-b4d9-08dda2ce1457
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 18:40:14.4291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/QVVNScLS+VlXKarUtz/BsKVoIHe+I+ThPkHx8JKEYNkXKP3HMc4CEqkQfUv2alH0jN0Kiz79aNfqP1DiVoQpMbFGkXiLzusnT589eB8i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9057
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENhdml0dCwgSm9uYXRoYW4gDQpTZW50
OiBUdWVzZGF5LCBKdW5lIDMsIDIwMjUgMTE6MzEgQU0NClRvOiBXYWpkZWN6a28sIE1pY2hhbCA8
TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KQ2M6IEsgViBQLCBTYXR5YW5hcmF5YW5hIDxTYXR5YW5hcmF5YW5hLksuVi5QQGludGVsLmNv
bT47IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwu
Y29tPjsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgRHVnYXN0
LCBGcmFuY29pcyA8RnJhbmNvaXMuRHVnYXN0QGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+OyBIYXJyaXNvbiwgSm9obiBDIDxqb2huLmMuaGFycmlzb25A
aW50ZWwuY29tPg0KU3ViamVjdDogUkU6IFtQQVRDSF0gdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5q
ZWN0aW9uOiBJZ25vcmUgKkVSUk9SKiBkbWVzZyByZXBvcnRzDQo+IA0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXYWpkZWN6a28sIE1pY2hhbCA8TWljaGFsLldhamRlY3pr
b0BpbnRlbC5jb20+IA0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDMsIDIwMjUgMTA6MjggQU0NCj4g
VG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlh
bmFyYXlhbmEuay52LnBAaW50ZWwuY29tPjsgQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUgPGRhbmll
bGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+OyBEdWdhc3QsIEZyYW5jb2lzIDxmcmFuY29pcy5kdWdhc3RAaW50ZWwu
Y29tPjsgVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IEhhcnJpc29uLCBK
b2huIEMgPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbjogSWdub3JlICpFUlJPUiogZG1lc2cgcmVw
b3J0cw0KPiA+IA0KPiA+IEhpLA0KPiA+IA0KPiA+IE9uIDAzLjA2LjIwMjUgMTg6MTgsIEpvbmF0
aGFuIENhdml0dCB3cm90ZToNCj4gPiA+IEZyb206IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlh
bmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiA+IA0KPiA+IHNpbmNlIHRoaXMgbG9va3MgbGlr
ZSBhIGZvbGxvdy11cCByZXYgb2YgdGhlIG9yaWdpbmFsIHBhdGNoLCB0aGVyZSB3YXMNCj4gPiBu
byBuZWVkIHRvIGNoYW5nZSBzdWJqZWN0IGFuZCB0aGVyZSBzaG91bGQgYmUgYSBjaGFuZ2UgbG9n
IGF0IHRoZSBlbmQNCj4gPiANCj4gPiA+IA0KPiA+ID4gQ3VycmVudGx5LCBudW1lcm91cyBmYXVs
dCBtZXNzYWdlcyBoYXZlIGJlZW4gaW5jbHVkZWQgaW4gdGhlIGRtZXNnDQo+ID4gPiBpZ25vcmUg
bGlzdCwgYW5kIHRoaXMgbGlzdCBjb250aW51ZXMgdG8gZXhwYW5kLiAgRWFjaCB0aW1lIGEgbmV3
IGZhdWx0DQo+ID4gPiBpbmplY3Rpb24gcG9pbnQgaXMgaW50cm9kdWNlZCBvciBhIG5ldyBmZWF0
dXJlIGlzIGFjdGl2YXRlZCwgYWRkaXRpb25hbA0KPiA+ID4gZmF1bHQgbWVzc2FnZXMgYXBwZWFy
LCBtYWtpbmcgaXQgY3VtYmVyc29tZSB0byBtYW5hZ2UgdGhlIGRtZXNnIGlnbm9yZQ0KPiA+ID4g
bGlzdC4NCj4gPiA+IA0KPiA+ID4gSG93ZXZlciwgd2UgY2FuIHNhZmVseSBhc3NlcnQgdGhhdCBh
bGwgZG1lc2cgcmVwb3J0cyB0aGF0IGNvbnRhaW4NCj4gPiA+ICpFUlJPUiogaW4gdGhlaXIgbWVz
c2FnZSBjYW4gYmUgaWdub3JlZCwgc28gYWRkIHRoZW0gdG8gdGhlIGRtZXNnIGlnbm9yZQ0KPiA+
ID4gbGlzdC4gIFRoaXMgdW5mb3J0dW5hdGVseSBkb2VzIG5vdCBpbmNsdWRlIHRoZSBkZXZpY2Ug
cHJvYmUgZXJyb3INCj4gPiA+IGl0c2VsZiwgc28gdGhhdCBtdXN0IGJlIGFkZGVkIHNlcGFyYXRl
bHkuDQo+ID4gPiANCj4gPiA+IFdoaWxlIHdlJ3JlIGhlcmUsIHdlIHNob3VsZCBhbHNvIGFzc2Vy
dCB0aGF0IGFueSBlcnJvcnMgd2Ugc2VlIGFyZSBvbmx5DQo+ID4gPiBjb21pbmcgZnJvbSB0aGUg
dGFyZ2V0IFBDSSBkZXZpY2UuDQo+ID4gPiANCj4gPiA+IEZpeGVzOiA1ZGNmOTE1NDE1ZWUgKCJ0
ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb246IElnbm9yZSBleHBlY3RlZCBlcnJvcnMiKQ0K
PiA+IA0KPiA+IEknbSBub3Qgc3VyZSBpdCBuZWVkcyBGaXhlczogdGFnIGFzIGl0IHdhc24ndCBi
YWRseSBicm9rZW4NCj4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNhdHlhbmFyYXlhbmEgSyBW
IFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTog
Sm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+ID4gU3VnZ2Vz
dGVkLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4g
PiA+IFN1Z2dlc3RlZC1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xv
c3B1cmlvQGludGVsLmNvbT4NCj4gPiA+IFN1Z2dlc3RlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gPiBDYzogRnJhbmNvaXMgRHVnYXN0IDxmcmFu
Y29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52
aXZpQGludGVsLmNvbT4NCj4gPiA+IENjOiBKb2huIEhhcnJpc29uIDxqb2huLmMuaGFycmlzb25A
aW50ZWwuY29tPg0KPiA+ID4gDQo+ID4gPiAtLS0NCj4gPiA+ICB0ZXN0cy9pbnRlbC94ZV9mYXVs
dF9pbmplY3Rpb24uYyB8IDM5ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQ0KPiA+
ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMg
Yi90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+ID4gaW5kZXggOWZlNmJmZTM1
MS4uYTRhMDhhZjVmNyAxMDA2NDQNCj4gPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2lu
amVjdGlvbi5jDQo+ID4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0K
PiA+ID4gQEAgLTY0LDI4ICs2NCwxOSBAQCBzdGF0aWMgaW50IGZhaWxfZnVuY3Rpb25fb3Blbih2
b2lkKQ0KPiA+ID4gIAlyZXR1cm4gZGVidWdmc19mYWlsX2Z1bmN0aW9uX2Rpcl9mZDsNCj4gPiA+
ICB9DQo+ID4gPiAgDQo+ID4gPiAtc3RhdGljIGJvb2wgZnVuY3Rpb25faXNfcGFydF9vZl9ndWMo
Y29uc3QgY2hhciBmdW5jdGlvbl9uYW1lW10pDQo+ID4gPiArc3RhdGljIHZvaWQgaWdub3JlX2Zh
dWx0c19pbl9kbWVzZyhpbnQgZmQpDQo+ID4gDQo+ID4gbml0OiB0aGlzIGNvdWxkIGJlDQo+ID4g
DQo+ID4gCWlnbm9yZV9kbWVzZ19lcnJvcnNfZnJvbV9kdXQoZmQpDQo+ID4gDQo+ID4gYW5kIHNp
bmNlIGl0J3MgcXVpdGUgZ2VuZXJpYyBtYXliZSBpdCBjb3VsZCBtb3ZlZCB0byBsaWIvIG5lYXIN
Cj4gPiANCj4gPiAJaWd0X2VtaXRfaWdub3JlX2RtZXNnX3JlZ2V4KHJlZ2V4KQ0KPiA+IGFzDQo+
ID4gCWlndF9pZ25vcmVfZG1lc2dfZXJyb3JzX2Zyb21fZHV0KGZkKQ0KPiANCj4gSSBjYW4gdXBk
YXRlIHRoZSBmdW5jdGlvbiBuYW1lLCBidXQgdGhpcyBmdW5jdGlvbiBpcyBvbmx5IGJlaW5nIHVz
ZWQgaGVyZSwgc28NCj4gSSBkb24ndCBzZWUgYSByZWFzb24gdG8gbW92ZSBpdCB0byB0aGUgbGli
IGZvbGRlci4NCg0KSXQganVzdCBjYW1lIHRvIG1pbmQgdGhhdCwgaW4gYWRkaXRpb24gdG8gYmxv
Y2tpbmcgYWxsIGVycm9yLWxldmVsIHJlcG9ydHMgZnJvbSBkbWVzZw0KKG9yLCBhdCBsZWFzdCwg
dGhlIHJlcG9ydHMgdGhhdCBjb250YWluIHRoZSAiKkVSUk9SKiIgc3Vic3RyaW5nKSwgdGhpcyBm
dW5jdGlvbiBhbHNvDQpibG9ja3MgYW55IGRldmljZSBwcm9iZSBlcnJvcnMuICBXaGlsZSBJIGNh
biBpbWFnaW5lIGEgZ2VuZXJhbCBjYXNlIGZvciBibG9ja2luZyBhbGwNCmVycm9yLWxldmVsIGRt
ZXNnIHJlcG9ydHMsIEkgZG9uJ3QgdGhpbmsgd2UnZCBhZGRpdGlvbmFsbHkgd2FudCB0byBibG9j
ayBhbnkgZGV2aWNlDQpwcm9iZSBlcnJvcnMgaW4gdGhvc2UgY2FzZXMuDQotSm9uYXRoYW4gQ2F2
aXR0DQoNCj4gDQo+ID4gDQo+ID4gDQo+ID4gPiAgew0KPiA+ID4gLQlyZXR1cm4gc3Ryc3RyKGZ1
bmN0aW9uX25hbWUsICJfZ3VjXyIpICE9IE5VTEwgfHwNCj4gPiA+IC0JICAgICAgIHN0cnN0cihm
dW5jdGlvbl9uYW1lLCAiX3VjXyIpICE9IE5VTEwgfHwNCj4gPiA+IC0JICAgICAgIHN0cnN0cihm
dW5jdGlvbl9uYW1lLCAiX3dvcGNtXyIpICE9IE5VTEw7DQo+ID4gPiAtfQ0KPiA+ID4gLQ0KPiA+
ID4gLXN0YXRpYyB2b2lkIGlnbm9yZV9mYXVsdHNfaW5fZG1lc2coY29uc3QgY2hhciBmdW5jdGlv
bl9uYW1lW10pDQo+ID4gPiAtew0KPiA+ID4gLQkvKiBEcml2ZXIgcHJvYmUgaXMgZXhwZWN0ZWQg
dG8gZmFpbCBpbiBhbGwgY2FzZXMsIHNvIGlnbm9yZSBpbiBpZ3RfcnVubmVyICovDQo+ID4gPiAt
CWNoYXIgcmVnZXhbMTAyNF0gPSAicHJvYmUgd2l0aCBkcml2ZXIgeGUgZmFpbGVkIHdpdGggZXJy
b3IgLTEyIjsNCj4gPiA+IC0NCj4gPiA+ICAJLyoNCj4gPiA+IC0JICogSWYgR3VDIG1vZHVsZSBm
YXVsdCBpcyBpbmplY3RlZCwgR3VDIGlzIGV4cGVjdGVkIHRvIGZhaWwsDQo+ID4gPiAtCSAqIHNv
IGFsc28gaWdub3JlIEd1QyBpbml0IGZhaWx1cmVzIGluIGlndF9ydW5uZXIuDQo+ID4gPiArCSAq
IERyaXZlciBwcm9iZSBpcyBleHBlY3RlZCB0byBmYWlsIGluIGFsbCBjYXNlcywgc28gaWdub3Jl
IGluIGlndF9ydW5uZXIuDQo+ID4gPiArCSAqIEFkZGl0aW9uYWxseSwgYWxsIGVycm9yLWxldmVs
IHJlcG9ydHMgYXJlIGV4cGVjdGVkLCBzbyBpZ25vcmUgdGhvc2UgYXMgd2VsbC4NCj4gPiA+ICAJ
ICovDQo+ID4gPiAtCWlmIChmdW5jdGlvbl9pc19wYXJ0X29mX2d1YyhmdW5jdGlvbl9uYW1lKSkg
ew0KPiA+ID4gLQkJc3RyY2F0KHJlZ2V4LCAifEdUWzAtOWEtZkEtRl0qOiBHdUMgaW5pdCBmYWls
ZWQgd2l0aCAtRU5PTUVNIik7DQo+ID4gPiAtCQlzdHJjYXQocmVnZXgsICJ8R1RbMC05YS1mQS1G
XSo6IEZhaWxlZCB0byBpbml0aWFsaXplIHVDIC4tRU5PTUVNIik7DQo+ID4gPiAtCQlzdHJjYXQo
cmVnZXgsICJ8R1RbMC05YS1mQS1GXSo6IEZhaWxlZCB0byBlbmFibGUgR3VDIENUIC4tRU5PTUVN
Iik7DQo+ID4gPiAtCQlzdHJjYXQocmVnZXgsICJ8R1RbMC05YS1mQS1GXSo6IEd1QyBQQyBxdWVy
eSB0YXNrIHN0YXRlIGZhaWxlZDogLUVOT01FTSIpOw0KPiA+ID4gLQl9DQo+ID4gPiArCWNoYXIg
c3RvcmVbMTAyNF0gPSAicHJvYmUgd2l0aCBkcml2ZXIgeGUgZmFpbGVkIHdpdGggZXJyb3J8XFwq
RVJST1JcXCoiOw0KPiA+IA0KPiA+IAlzdGF0aWMgY29uc3QgY2hhciBzdG9yZVtdID0gLi4NCj4g
PiANCj4gPiA+ICsJY2hhciBwY2lfc2xvdFtOQU1FX01BWF07DQo+ID4gPiArCWNoYXIgcmVnZXhb
MTAyNF07DQo+ID4gPiArDQo+ID4gPiArCS8qIEFsbCBkbWVzZyByZXBvcnRzIHNob3VsZCBvbmx5
IHRhcmdldCB0aGUgcGNpIHNsb3Qgb2YgdGhlIGdpdmVuIGZkICovDQo+ID4gPiArCWlndF9kZXZp
Y2VfZ2V0X3BjaV9zbG90X25hbWUoZmQsIHBjaV9zbG90KTsNCj4gPiA+ICsJc25wcmludGYocmVn
ZXgsIDEwMjQsICIlczouKiglcykiLCBwY2lfc2xvdCwgc3RvcmUpOw0KPiA+IA0KPiA+IAlzbnBy
aW50ZihyZWdleCwgc2l6ZW9mKHJlZ2V4KSwgLi4uDQo+ID4gDQo+ID4gPiAgDQo+ID4gPiAgCWln
dF9lbWl0X2lnbm9yZV9kbWVzZ19yZWdleChyZWdleCk7DQo+ID4gPiAgfQ0KPiA+ID4gQEAgLTIz
NCw3ICsyMjUsNyBAQCBpbmplY3RfZmF1bHRfcHJvYmUoaW50IGZkLCBjaGFyIHBjaV9zbG90W10s
IGNvbnN0IGNoYXIgZnVuY3Rpb25fbmFtZVtdKQ0KPiA+ID4gIAlpZ3RfaW5mbygiSW5qZWN0aW5n
IGVycm9yIFwiJXNcIiAoJWQpIGluIGZ1bmN0aW9uIFwiJXNcIlxuIiwNCj4gPiA+ICAJCSBzdHJl
cnJvcigtSU5KRUNUX0VSUk5PKSwgSU5KRUNUX0VSUk5PLCBmdW5jdGlvbl9uYW1lKTsNCj4gPiA+
ICANCj4gPiA+IC0JaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmdW5jdGlvbl9uYW1lKTsNCj4gPiA+
ICsJaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmZCk7DQo+ID4gDQo+ID4gbm90IHN1cmUgaG93IHRo
aXMgZmlsdGVyaW5nIHJlYWxseSB3b3JrcywgYnV0IG1heWJlIGl0IHdpbGwgYmUNCj4gPiBzdWZm
aWNpZW50IHRvIGNhbGwgdGhhdCBvbmNlIGluIHRoZSBmaXh1cCA/DQo+IA0KPiBUaGUgZG1lc2cg
aWdub3JlIGxpc3QgaXMgY2xlYXJlZCBhZnRlciBlYWNoIHRlc3QsIHNvIHdlIG5lZWQgdG8gcmVp
bml0aWFsaXplIGl0IGJlZm9yZQ0KPiBldmVyeSB0ZXN0IHJ1bi4NCj4gLSBKb25hdGhhbiBDYXZp
dHQNCj4gDQo+ID4gDQo+ID4gPiAgCWluamVjdGlvbl9saXN0X2FkZChmdW5jdGlvbl9uYW1lKTsN
Cj4gPiA+ICAJc2V0X3JldHZhbChmdW5jdGlvbl9uYW1lLCBJTkpFQ1RfRVJSTk8pOw0KPiA+ID4g
IA0KPiA+ID4gQEAgLTI5OSw3ICsyOTAsNyBAQCBleGVjX3F1ZXVlX2NyZWF0ZV9mYWlsKGludCBm
ZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmluc3RhbmNlLA0KPiA+ID4g
IAlpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAxLCAxLCBpbnN0
YW5jZSwgMCwgJmV4ZWNfcXVldWVfaWQpLCAwKTsNCj4gPiA+ICAJeGVfZXhlY19xdWV1ZV9kZXN0
cm95KGZkLCBleGVjX3F1ZXVlX2lkKTsNCj4gPiA+ICANCj4gPiA+IC0JaWdub3JlX2ZhdWx0c19p
bl9kbWVzZyhmdW5jdGlvbl9uYW1lKTsNCj4gPiA+ICsJaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhm
ZCk7DQo+ID4gPiAgCWluamVjdGlvbl9saXN0X2FkZChmdW5jdGlvbl9uYW1lKTsNCj4gPiA+ICAJ
c2V0X3JldHZhbChmdW5jdGlvbl9uYW1lLCBJTkpFQ1RfRVJSTk8pOw0KPiA+ID4gIAlpZ3RfYXNz
ZXJ0KF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAxLCAxLCBpbnN0YW5jZSwgMCwgJmV4
ZWNfcXVldWVfaWQpICE9IDApOw0KPiA+ID4gQEAgLTMzNCw3ICszMjUsNyBAQCB2bV9jcmVhdGVf
ZmFpbChpbnQgZmQsIGNvbnN0IGNoYXIgZnVuY3Rpb25fbmFtZVtdLCB1bnNpZ25lZCBpbnQgZmxh
Z3MpDQo+ID4gPiAgew0KPiA+ID4gIAlpZ3RfYXNzZXJ0X2VxKHNpbXBsZV92bV9jcmVhdGUoZmQs
IGZsYWdzKSwgMCk7DQo+ID4gPiAgDQo+ID4gPiAtCWlnbm9yZV9mYXVsdHNfaW5fZG1lc2coZnVu
Y3Rpb25fbmFtZSk7DQo+ID4gPiArCWlnbm9yZV9mYXVsdHNfaW5fZG1lc2coZmQpOw0KPiA+ID4g
IAlpbmplY3Rpb25fbGlzdF9hZGQoZnVuY3Rpb25fbmFtZSk7DQo+ID4gPiAgCXNldF9yZXR2YWwo
ZnVuY3Rpb25fbmFtZSwgSU5KRUNUX0VSUk5PKTsNCj4gPiA+ICAJaWd0X2Fzc2VydChzaW1wbGVf
dm1fY3JlYXRlKGZkLCBmbGFncykgIT0gMCk7DQo+ID4gPiBAQCAtMzk3LDcgKzM4OCw3IEBAIHZt
X2JpbmRfZmFpbChpbnQgZmQsIGNvbnN0IGNoYXIgZnVuY3Rpb25fbmFtZVtdKQ0KPiA+ID4gIA0K
PiA+ID4gIAlpZ3RfYXNzZXJ0X2VxKHNpbXBsZV92bV9iaW5kKGZkLCB2bSksIDApOw0KPiA+ID4g
IA0KPiA+ID4gLQlpZ25vcmVfZmF1bHRzX2luX2RtZXNnKGZ1bmN0aW9uX25hbWUpOw0KPiA+ID4g
KwlpZ25vcmVfZmF1bHRzX2luX2RtZXNnKGZkKTsNCj4gPiA+ICAJaW5qZWN0aW9uX2xpc3RfYWRk
KGZ1bmN0aW9uX25hbWUpOw0KPiA+ID4gIAlzZXRfcmV0dmFsKGZ1bmN0aW9uX25hbWUsIElOSkVD
VF9FUlJOTyk7DQo+ID4gPiAgCWlndF9hc3NlcnQoc2ltcGxlX3ZtX2JpbmQoZmQsIHZtKSAhPSAw
KTsNCj4gPiA+IEBAIC00NDUsNyArNDM2LDcgQEAgb2FfYWRkX2NvbmZpZ19mYWlsKGludCBmZCwg
aW50IHN5c2ZzLCBpbnQgZGV2aWQsIGNvbnN0IGNoYXIgZnVuY3Rpb25fbmFtZVtdKQ0KPiA+ID4g
IAlpZ3RfYXNzZXJ0KGlndF9zeXNmc19zY2FuZihzeXNmcywgcGF0aCwgIiUiIFBSSXU2NCwgJmNv
bmZpZ19pZCkgPT0gMSk7DQo+ID4gPiAgCWlndF9hc3NlcnRfZXEoaW50ZWxfeGVfcGVyZl9pb2N0
bChmZCwgRFJNX1hFX09CU0VSVkFUSU9OX09QX1JFTU9WRV9DT05GSUcsICZjb25maWdfaWQpLCAw
KTsNCj4gPiA+ICANCj4gPiA+IC0JaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmdW5jdGlvbl9uYW1l
KTsNCj4gPiA+ICsJaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmZCk7DQo+ID4gPiAgCWluamVjdGlv
bl9saXN0X2FkZChmdW5jdGlvbl9uYW1lKTsNCj4gPiA+ICAJc2V0X3JldHZhbChmdW5jdGlvbl9u
YW1lLCBJTkpFQ1RfRVJSTk8pOw0KPiA+ID4gIAlpZ3RfYXNzZXJ0X2x0KGludGVsX3hlX3BlcmZf
aW9jdGwoZmQsIERSTV9YRV9PQlNFUlZBVElPTl9PUF9BRERfQ09ORklHLCAmY29uZmlnKSwgMCk7
DQo+ID4gDQo+ID4gDQo+IA0K

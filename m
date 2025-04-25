Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7595C369D1
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 03:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E830810E27D;
	Fri, 25 Apr 2025 03:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6D9/t98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6A10E27D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 03:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745552122; x=1777088122;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NDOiWswqn0w2XqSFRCdRjVZ2/UX6YSoIfwk/PKTVW58=;
 b=Y6D9/t98rvZ73DYZrDBJ1wnhLdBCRl0t7n44x9EoaCTc+cyEdmcx4sj7
 SUCSHt+Wy7/T/5SWcIi17qLfF4kG2hue9et1H8BYHXp81EZEztXH1brg5
 vxov2qySl5mHr+tKEAeDBnLak7+pVVmJOplu+Ge+SkCUyS+/C683Qkhpc
 fnVj51Gm0Nq3KRtV5W8dZlMLlH+FGKGl1/NWQ68ipoGKEfV3BtuZ6QZ78
 VK4iv9NJ2ow3CkbjC8EdBNjGQPSCaR2qeIwgBYqzu3ymqH2tha6gPc1Zv
 T9/D3DaWM+50SoK0DmWikxxlc3Fmn+NOmUsE+/UVJzkJ9Fa0sUCeYu//a w==;
X-CSE-ConnectionGUID: ZIENElQ8Tcq4k7y/lpBJ1A==
X-CSE-MsgGUID: SAJqbJQQQG+PjqL2S53A0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="51014102"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="51014102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 20:35:17 -0700
X-CSE-ConnectionGUID: 9SVSXrohRLeYzaMYmnlF9Q==
X-CSE-MsgGUID: lzSFrJeNQ/Otnt4kiNcNZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="137788730"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 20:35:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 20:35:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 20:35:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 20:35:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsO/Ior5tJfDd7ZYPHjCDXFPUmqNG2iI9t9PQokVoPwL7qcEswjerAx4fdCrlL/uOKrmUB3yMIYh9uNL2D8SwoErYQvTl34CibPiyiy0gB1g1zpybHJj4Ff3/krkkkE2hkZ8Xkvr7vyWZ54jzUbF3SrXLEkBS6zWtAFnUO7hPTERGwGSxCXoZ6u/t52C4ceUA8o9eu8JKx3OCYczarMNoSbGU23otAXBlmnPCONLYpxx3Lmax09isZ5NmHrjFbPpMo0iItQjHknnUQaZsVgh0xmWGjkRBZjtSJ8hv6nOPSY0uXpgoPXyz4IgMMTqYCALnMe2Oycy6XRrQA1mbE32Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDOiWswqn0w2XqSFRCdRjVZ2/UX6YSoIfwk/PKTVW58=;
 b=IwZag8ae6jBVMCDZbhGqxR6g1EleF5iQj120irfAxu9vuoFhooJZfGMNO9dSOYYdVNsoXbh5cegj7d6Ve7LlW2bEMPqV3BXIB+U2cJ7VsxzmZ5c7fKgtPWQR3Q8BJE7n18sBp775YyEcak/mhmBkh77SCORcCpmqkFv3C+jFVcIt40x3ZK+NTbJU+XDszpuEXnSbnMg6fmJ71HiOP/JL6SD9xd1dDBG+VodBh4XC8rUDUJTUsEEkEH0JUAOMme+MIt9n33fllJ19IdWKCT+qzRSDabEHXGFgeO01pW4nbcAxQs0CUfIc/rLjGc6yK5nclme8M9TbSZ2/WDI3JbVeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ5PPF1A7C623DA.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::816) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 03:35:09 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 03:35:09 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH i-g-t 2/3] lib/xe: replace div64_u64_round_up() with
 DIV_ROUND_UP
Thread-Topic: [PATCH i-g-t 2/3] lib/xe: replace div64_u64_round_up() with
 DIV_ROUND_UP
Thread-Index: AQHbru0NPluSm+7y0kqOg0mOTr3G/rOzIeAAgACiKDA=
Date: Fri, 25 Apr 2025 03:35:08 +0000
Message-ID: <DM4PR11MB54564522C4B40D776C9AD614EA842@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250416163053.117425-1-shuicheng.lin@intel.com>
 <20250416163053.117425-3-shuicheng.lin@intel.com>
 <20250424173944.s35q2xkfk3ltik4d@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250424173944.s35q2xkfk3ltik4d@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ5PPF1A7C623DA:EE_
x-ms-office365-filtering-correlation-id: 8bf46efb-d352-4f9a-d877-08dd83aa2da0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eGRyRlROSzhmSmZTY3lUeXJxVlJmVGY5cEZIT0ZRc29QdVoxdG9qbEs3dnJT?=
 =?utf-8?B?Y3Z3ejhLRXJqOVgyazF4aHRUQjJsS1dUY0tDdnRidGxMRWxOTUl5WVRTaWFZ?=
 =?utf-8?B?ckh1ZTFiU0ZDZmtYV296aThtSHZHMm9URHBvcVA1S1k0Tm8xeFJ6MjBsN1hM?=
 =?utf-8?B?dkFkUS9LZ2srOHNpSzNtWXJ5ZDBKVHZZV3JrZHAxKzhYMG1PQjYrL0hQalNi?=
 =?utf-8?B?MThiTGc1ZFBCVUtOekJnWmpYVFIrTmVFQzF6ZVpmYWhXZWJGd0FMalowaldL?=
 =?utf-8?B?aXZyYUFDNEZVcEppUDdtb1BDMG9CMnk2WEIzQVpjWTZNUVBqTGJud3pwS1Zq?=
 =?utf-8?B?KzZZZDJiWVo1K1daTTUvY2tuTzllWW56WW9NdnJHVTFwVHM4Yk1maTNubE53?=
 =?utf-8?B?ZTFIb3dYVUZocy9RWWc0eVozWTgvcU1SaENMbHY5VUNmQVA4bEJkbWZDcDlO?=
 =?utf-8?B?Q1ZwTElnemFYSXN0Tzl2UnpNZEE4STNHNlhWSS9GWDdIOERRaUtleUdVYzM3?=
 =?utf-8?B?elFMZzlHUHY3MjJRVUo0OU5EZ3ZVRE1idlZkWmtndU95SXRsVDhDWStUbHNp?=
 =?utf-8?B?dGdpZi9BM3NHU0pqMStTVHJZSk9aWEhSa2V4WnFOTnhXeWFqUHlFemlmOXZX?=
 =?utf-8?B?MDhNR2hxWWZWRjJaTWVWVnZ5WXZpVUc4NkdMd3VFOGdOOS9vaHo4NjlzZUVP?=
 =?utf-8?B?Rm5qMitUQXZnNlBNczd6dUJ2N284VEVHcmRieGxEcVZMZDN3MDdkMVJCTTFw?=
 =?utf-8?B?dHdod2tVOWhHWTRaYXlFWE1MRXFDVWp2NVZlbGJqenZMR0NkK01pc3NIclJZ?=
 =?utf-8?B?ZHd5MkFvUWdNOWVrOSs0dUIwU1ZUTmhiVVozVDJuVDg2UEc5L3hnT05aYTBP?=
 =?utf-8?B?cHd1eGxYbFRIWlNtUURNMDU0Y2lGWGtWQVhKRU5HeUNkdDZYdm5kQ29qQ25o?=
 =?utf-8?B?TUdsYnNXZk11MklGMDVnalorTytsNTVXYUQvTWNrN0M3WmhmY2U2S0VFYzUx?=
 =?utf-8?B?VS85TVhmRGg1VG15TTlaMm9uWU9EMVNDdWhBQnpwNHIxWVZzQmRJVmdpV1d0?=
 =?utf-8?B?RDJxczZzem5uZ1h5dlJJM1FKRDJZdE1uaUlYTHo0TEw2KzE4Z1BKQjJKL0pz?=
 =?utf-8?B?WHRCbmxlZXUzSThlcEMyYXJTQURXTXhrcWRNcVBkWnBITDFrbDRHaTJLQ2w2?=
 =?utf-8?B?UzR0cG0rcm44TDZoZFdPM0xkejUzd25jSGlZTzQ5NXhtWEQxQktOek0yNm9j?=
 =?utf-8?B?VnpSZXpVT245RWtHdS9PbzV1NS9RREVhRkQ1QUhRaGJueGlZL0lZT1cyTTZG?=
 =?utf-8?B?dndHakZLdmljRmcrY2FlcXVXTTFscE5ZTk9SUmw5bkNOcEFFWEp4UlRlbWdZ?=
 =?utf-8?B?S3JQT3U1U0NBWlJyekUvcVVUOVRCWkVDbHFqcjZVZHhGQ3NmeEZCRlhUblRm?=
 =?utf-8?B?ZEZXTkQwNU9sdlZDVDMxQTQ3L1JVdGM2dzZvUGdrTVZBZzZVVmVvckZnNFJz?=
 =?utf-8?B?MnJpOFcva0VMdHE1eElzQU1MOWlmVm1USG0wNndhclRaeGNzMWNKNEtkZVA3?=
 =?utf-8?B?V2tRTjlqZTNIUGpnN0czYlk5T3plZDFRdUVDQW9sdXFzaUVZeUFFbXJvNmEw?=
 =?utf-8?B?cFhodmx5c24xdXJ2Z1hCMmRHSG11alYydUV1R0pPWkpnK290RHE2SGMxRyt6?=
 =?utf-8?B?dmx6cmZqeHRrL2krcUgxYUh3SGF3VkFnZ1FZaVZBdUsxSmVnZVR1Z1l2YW5v?=
 =?utf-8?B?V1dNVWI2SXFoN2RLcWhjZVVvZURyaWpTQ240aEFtYXR4blI3N29Bd3J4VEE5?=
 =?utf-8?B?RmJqOUhFK0d2bVRpT05GZFoyemcvTDhQL0lYVG11b0Vqdk1QZE94MXUzMUN5?=
 =?utf-8?B?MGxLUDBUZnhKTFNwTG9CdWdkQStYVE5NNWhBL1dBTHZkRGdRNjRsVytLcTBh?=
 =?utf-8?B?a29URVJJZTVGTEwwMDFpK0R4eWJuc0MvYVlVZjVpNThtYitRNkk0dEZvSWRR?=
 =?utf-8?B?R2wxUWZzeG1nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGZpaVRxMER1ZHQ1eWRFaGVJN0JjcGpqZVAyTU83WE92eTh3eStKMGUwZ3Jo?=
 =?utf-8?B?aGN0eHVmYWxoVWZNc2RYWmpXOVJ2b3pFVC9RTm04eThQbkhZWlFvRXNCSG9Q?=
 =?utf-8?B?amg4QmxPZTcrYmp3NlFXdWluOGJ6UHRYRWViUWE2S2g3UEhYbWpTaUNYU3lq?=
 =?utf-8?B?SDYrM0JrVVdUVWFnZ0gyU2gzRlQzYXArL1NBbDl1OVAwUzRITG1pKzM0VkV3?=
 =?utf-8?B?S1VjV0h2cFMxUWxVL1Vyb1NlMXFEWWJLT2txdlV3eUhJTlFMMVVDR2p1Mm1i?=
 =?utf-8?B?YkNOUUh4ZzJ3UHE0N1BCWVVZS0ZraWhvUXArNnZubWtueXZEbkhRNCs4Y2Fm?=
 =?utf-8?B?QXU0UU83TGRMcHg5VGM2K2NHY3JudVd3d2ZHZm5ZWDdLZmFEdDJsbGw3TUU0?=
 =?utf-8?B?V1NXdHpTWVBGZGwyZVRNSGVaT2FGSWU4UHp1NXI1L1Nadzh4b29QK0Z0eGZt?=
 =?utf-8?B?TGZSbWpvWkJZZ01IYlFjZVo3bzE3Y0pEcUZNZHZ0d2hvVkdFTmwrdHh6aytv?=
 =?utf-8?B?bEQ1aFVkdFNtR01qTFJSZDJ4K1FIdUZ1WUw1UjhzL2xxNGtidXV5WVU3V0RO?=
 =?utf-8?B?ZHdMdmdRUzByeWNXQXVlRStsb0xFRGt0K1ZJVlEvbGpUbDhIV2tpMEx2Ulls?=
 =?utf-8?B?Q1ZNR0ZFeFVVcjU3ODhOcmttbVVtQ1kydit6K3dsYWltV0dheTNNOG9YYXda?=
 =?utf-8?B?RU4wa1RqSUFtZFhJVnlLMThZaE0zVDE0Q1ZNYU5QaDVDbWdVZlU0Q0Naa2Fq?=
 =?utf-8?B?Y3ZPSGJGY2FVQ0dyOHZkeGhPQUN4aGRxNzhGOEZNOHp1WENWbDcrTSs0RE5m?=
 =?utf-8?B?MDlsR0V1SStqbkRmdkpEcFRVWFdlMFhnakdtUHZkUXBxVy9VZ3RGRDdaTnUx?=
 =?utf-8?B?RElGYnZZeGZHakR6eGFYcCtoMzlUaXUwM2hvZFBhL2NhVDNMTmVja09RRXVR?=
 =?utf-8?B?MFdVdVdyUnRpc2Q4ZUU1ZlJCRnNnZ2l1QWNqZWJhUEhNcDF2Mm5rZnBoeWl6?=
 =?utf-8?B?bUlENzEwRFZWNnRHZlF5dWhMNTJaUkVSdmxPbzFna2dpMXU0OVFoR29PTjgz?=
 =?utf-8?B?M2EyMWgvTUlkQ25EdmpMYzhIUU1vUVhjMEVSSVRJdWE2RVRrdldTV0I4cjR5?=
 =?utf-8?B?TEZpdEN1QmZQbmw2NlFFTElLVHBVNzdqcHBwQk90UFM4dXRFekJTYlhERUxV?=
 =?utf-8?B?WXY0VmZ5L3M1UE1ibTBvUHBJdXVVK28xbEdGNmM1R08vSkhWaXpKQTdsSUVj?=
 =?utf-8?B?eE5aZkltbnF6S2h3ZEVhVlFQb2RlZUZXTnBFcWdkbE1rTnVqWG14YlRjOGQ2?=
 =?utf-8?B?cm03UnRnWUhtVmpmSktnVGk2clZYOU1UaUthbWdyc1E0ZFBZSVE3SU53OTlr?=
 =?utf-8?B?REFtNnRqeHVZUXFXTjdXUzh6UGFRVG5qL2JmS1dpV0ZjNUFXcjF5R0lsc3F0?=
 =?utf-8?B?dXpiai9DbW02cGNCQjB6Q3NiWDRSQmFJdWZhQy9uVlNHUythSHdFZnJGNjJL?=
 =?utf-8?B?dXpnUmNXbk02QjY5WHc4TUxXd0UwNkZRa0NTblJOMGEwNlFKYWFaWVN6aWF2?=
 =?utf-8?B?S0Y4bXczUE8wbjl5Zi8rZFBKRitrTWEvb3crL1U2bElGMk9zL1JVSWlEdmFS?=
 =?utf-8?B?cW1yY3gwdjJIcEExZmF1MVpiaDVOVlphOW9NT0x3YjQ1U0NHOUFDc1R6UUQ0?=
 =?utf-8?B?TlFLNVRIMlUxWWlDUEhydTQ0RG5JWE9TQVdkTW1Pb25JWHJHOXBPcTFLbGp1?=
 =?utf-8?B?TW1rWXY2TzhFUi9OSFVTb3Fwa0hPemtqakF4eTlidnl4S3FlSUVzeXhqQ3pr?=
 =?utf-8?B?cE9iZExHYlErWkRFcWRUMklPVGpQLy9xYVJFOFRlNFp3UjJyY2ErZHdsZmNG?=
 =?utf-8?B?ZUZueG9ZVVdXMm44T3RmRFRXRjc0TjlOd2xzR203THRBeUFYdndDZEU5Ujlt?=
 =?utf-8?B?MU9CbjY0OHlqZHVsZnlCNXRDdVlqQjh0cEZleUVjM2NEcW11anJrTEZ1Qi9a?=
 =?utf-8?B?dERpcWV6Znk0MlBpemxvYWpVT1p5Y3RTandMbm9vdVBzaHI3aXNBVTJ0ZXNv?=
 =?utf-8?B?N0tqc3FnRVJpSy9sY3VYRmt3QURGVVVYa0RrbTNnZjY4MkhNTUsyd2ZtQTNW?=
 =?utf-8?Q?uRwyE/3W+gmmg3oOjvD7saS83?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf46efb-d352-4f9a-d877-08dd83aa2da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 03:35:08.9533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lb+YKm78te7jOkH5F4sbwSF0xLlNUrCKU0+ecemV9+tg7kDVgpB5IcYgrZGviqqTSJ6uZ8VUV2fmMExKUSHn2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1A7C623DA
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

T24gVGh1LCBBcHJpbCAyNCwgMjAyNSAxMDo0MCBBTSBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+
IEhpIFNodWljaGVuZywNCj4gT24gMjAyNS0wNC0xNiBhdCAxNjozMDo1MiArMDAwMCwgU2h1aWNo
ZW5nIExpbiB3cm90ZToNCj4gPiBESVZfUk9VTkRfVVAgaXMgZGVmaW5lZCBpbiBpZ3RfYXV4Lmgg
d2l0aCB0aGUgc2FtZSBmdW5jdGlvbiBhcw0KPiA+IGRpdjY0X3U2NF9yb3VuZF91cCgpLg0KPiAN
Cj4gVmVyc2lvbiBpbiBpZ3RfYXV4LmggaXMgZGlmZmVyZW50IHRoZW4gb25lIGJlbG93Lg0KPiAN
Cj4gPg0KPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0K
PiA+IC0tLQ0KPiA+ICBsaWIveGUveGVfdXRpbC5jIHwgMTAgKy0tLS0tLS0tLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvbGliL3hlL3hlX3V0aWwuYyBiL2xpYi94ZS94ZV91dGlsLmMgaW5kZXgNCj4gPiAw
NmIzNzhjZTAuLjk5MDdjOGIxNiAxMDA2NDQNCj4gPiAtLS0gYS9saWIveGUveGVfdXRpbC5jDQo+
ID4gKysrIGIvbGliL3hlL3hlX3V0aWwuYw0KPiA+IEBAIC0yNTMsMTQgKzI1Myw2IEBAIHN0YXRp
YyB1aW50MzJfdCByZWZlcmVuY2VfY2xvY2soaW50IGZkLCBpbnQgZ3RfaWQpDQo+ID4gIAlyZXR1
cm4gcmVmY2xvY2s7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgdWludDY0X3QgZGl2NjRfdTY0
X3JvdW5kX3VwKGNvbnN0IHVpbnQ2NF90IHgsIGNvbnN0IHVpbnQ2NF90DQo+ID4geSkgLXsNCj4g
PiAtCWlndF9hc3NlcnQoeSA+IDApOw0KPiA+IC0JaWd0X2Fzc2VydF9sdGVfdTY0KHgsIFVJTlQ2
NF9NQVggLSAoeSAtIDEpKTsNCj4gDQo+IEkgbGlrZSB0aG9zZSB0d28gYXNzZXJ0cyBoZXJlLCB3
aHkgbm90IG1vdmluZyB0aGlzIGZ1bmN0aW9uIHRvIGxpYiBpZ3RfYXV4LmMgYW5kDQo+IGNyZWF0
aW5nIG5ldyBtYWNybyBmb3IgaXQ/DQo+IA0KPiAjZGVmaW5lIERJVjY0X1JPVU5EX1VQKG4sIGQp
IGRpdjY0X3U2NF9yb3VuZF91cCgodWludDY0X3QpKG4pLA0KPiAodWludDY0X3QpKGQpKQ0KPiAN
Cj4gb3IgbWFrZSBpdCBhIG11bHRpLWxpbmUgbWFjcm8gd2l0aCBkbyB7IC4uLiB9IHdoaWxlKDAp
DQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KDQpTaW5jZSB0aGVyZSBpcyBESVZfUk9VTkRfVVAg
YWxyZWFkeSwgSSBkb24ndCB3YW50IHRvIGFkZCBESVY2NF9ST1VORF9VUC4NCkRJVl9ST1VORF9V
UCBkb2Vzbid0IHJlcXVpcmUgdGhlIGRhdGEgdHlwZS4gQWx0aG91Z2ggdGhlcmUgaXMgbm8gaGFy
bQ0KdG8gZG8gdGhlIGRhdGEgY29udmVyc2lvbiwgSSBqdXN0IHRoaW5rIGl0IGlzIG5vdCBuZWNl
c3NhcnkgaGVyZS4NCkkgYWdyZWUgdGhlIGFzc2VydCBpcyBtb3JlIHNlY3VyZS4NClNpbmNlIG15
IGNoYW5nZSBpcyBqdXN0IGEgY2xlYW51cCwgbm8gcmVhbCBmdW5jdGlvbmFsIGNoYW5nZXMuDQpM
ZXQgbWUgZHJvcCB0aGlzIHBhdGNoLiBUaGFua3MuDQoNCkJUVywgSSBqdXN0IGZvdW5kIHRoZXJl
IGlzIF9ESVZfUk9VTkRfVVAgZGVmaW5pdGlvbiBpbiB0aGUgY29kZSBhbHNvLiBNYXliZSB3ZQ0K
Y291bGQgZG8gbW9yZSBjbGVhbnVwIGxhdGVyLg0KDQpTaHVpY2hlbmcNCg0KPiANCj4gPiAtDQo+
ID4gLQlyZXR1cm4gKHggKyB5IC0gMSkgLyB5Ow0KPiA+IC19DQo+ID4gLQ0KPiA+ICAvKioNCj4g
PiAgICogeGVfbnNlY190b190aWNrczogY29udmVydCB0aW1lIGluIG5hbm9zZWNvbmRzIHRvIHRp
bWVzdGFtcCB0aWNrcw0KPiA+ICAgKiBAZmQ6IG9wZW5lZCBkZXZpY2UNCj4gPiBAQCAtMjczLDUg
KzI2NSw1IEBAIHVpbnQzMl90IHhlX25zZWNfdG9fdGlja3MoaW50IGZkLCBpbnQgZ3RfaWQsDQo+
ID4gdWludDY0X3QgbnNlYykgIHsNCj4gPiAgCXVpbnQzMl90IHJlZmNsb2NrID0gcmVmZXJlbmNl
X2Nsb2NrKGZkLCBndF9pZCk7DQo+ID4NCj4gPiAtCXJldHVybiBkaXY2NF91NjRfcm91bmRfdXAo
bnNlYyAqIHJlZmNsb2NrLCBOU0VDX1BFUl9TRUMpOw0KPiA+ICsJcmV0dXJuIERJVl9ST1VORF9V
UChuc2VjICogcmVmY2xvY2ssIE5TRUNfUEVSX1NFQyk7DQo+ID4gIH0NCj4gPiAtLQ0KPiA+IDIu
MjUuMQ0KPiA+DQo=

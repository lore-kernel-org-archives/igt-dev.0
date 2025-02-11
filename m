Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86452C0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 04:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595510E048;
	Tue, 11 Feb 2025 04:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwKsewh6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B5D10E048
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 04:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739248498; x=1770784498;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PuBZMAwgaTePSNtjm25LDk7uitlPHp6dALzePzKLKqM=;
 b=dwKsewh6bnGbYDk9N3QDUuwQCJNkMzlk92VBc9q7spYuImsVCQ+ZhvKA
 TbR9/wHQgglOepGYyO+IxGO61O6/Ar6a7w3moXSMOKeRqDqB0WD8WPIOO
 GV7vH6mAVggrRUrd02UMxEBTYFg8DnGqqsF9wzue+2MfQU7UIgWp17KFY
 ifG7biMx4Pp6cVkNMtak4jB6QchgI2J45W/506JtzLIwtJWy7oRzybtXx
 ph7CyAVqxuDbKMkxB5EEXx2H7DQL8kI14OgIPHF7Ck5HiZBhXh9ArLzpf
 LHhCI7FWVXbk783caobhl+otaP/8Mip2n7Ac07rMI3rruI5QGYvbny4Zm Q==;
X-CSE-ConnectionGUID: dpy/1p9gRDqrMWP+IfZ2zQ==
X-CSE-MsgGUID: CRIdJCvASzyVHNbRIKpplg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27454108"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="27454108"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 20:34:58 -0800
X-CSE-ConnectionGUID: BNtJbwaTRUyYgMqt3beZYQ==
X-CSE-MsgGUID: bnhG3Y6BSVC9liGcAAdJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112255598"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 20:34:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 20:34:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 20:34:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 20:34:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIACQrOcucfPCgIkBSoABjxAQULG1Re3C5oKLupDSZGXFFDlM0dhIwhEn6YvVeYgJC3my9TFJC/X2GxEB/kotpolqx5JVu6BkGYeegXtz2j0NIu1RTlZeQg0jyLniEHGy76raSRmWB0gflWyk58ubmQlZf5SbcbhSyggnZgz6yjCwdTNVzZ+hx45a4VG4/9ZuqjHZYD6PCIxvNrUwQTk6Iexk2OScjh4DU/gtG9dL25oE2LJLvj1OUGt2xgN/t2QmFEWNmv4N+joPiH2hO8mWztFjnHgzGdDtg01bf3/JKuV/htYEdQ08GsMPd9yW6Plxe2mVeIaNO249PURwcbPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuBZMAwgaTePSNtjm25LDk7uitlPHp6dALzePzKLKqM=;
 b=k43dfGlb0FbuIH/4FmJQ+5TqXD0ve6piriQfv/lWPuANtxjnGYV8h+paEMfZMqJsuQKsuyWO4LpUfZa+PBHWk4Yiyw2lbw0AMRXwsZYanVbY4N7WHvjLGwulecHc7z3UIKXrwHO2xlbJn5WutA6bGKBXpb0QQ+M2Vkb7I+8+UI9LbLGSuTxrnif6AaAehGvEqlVHfJbBXEsTu6djtvdemz43D3qdCCpEkDjlnE7PZ3tMMuhYvA4I2u3d6QJWbHfnYI72T8T1FjMIzXShd7/4Fh6D3OjLWMvl+L5/diLCrrSPsbvKOb/TZ6YrZL26aYSz+DT9NuPn9lUzGRBRhY/GFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH0PR11MB7524.namprd11.prod.outlook.com (2603:10b6:510:281::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 04:34:54 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 04:34:54 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_exec_capture: Enhance test to check with
 DUMPABLE flag
Thread-Topic: [PATCH] tests/intel/xe_exec_capture: Enhance test to check with
 DUMPABLE flag
Thread-Index: AQHbeABbQQxFOHNFXUuqlY0vP8/ZwrM784CAgAAC7gCABZV7wA==
Date: Tue, 11 Feb 2025 04:34:54 +0000
Message-ID: <BL1PR11MB5525508AA5BCCA9AFB4ED9D184FD2@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250205184143.233197-1-pravalika.gurram@intel.com>
 <c8facc8d-f2e5-4789-81a8-7ae9a3fbeca7@intel.com>
 <87412be1-83d2-4df6-b44c-ed4471984bb6@intel.com>
In-Reply-To: <87412be1-83d2-4df6-b44c-ed4471984bb6@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH0PR11MB7524:EE_
x-ms-office365-filtering-correlation-id: 21083662-7684-4480-3d8c-08dd4a556e7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?aUgyUk03QnczVmlZeWNoTml4b2tTbENodGZnbTJwNGtvUE9pcFc1RDU4MlRX?=
 =?utf-8?B?Syt5MlFTS2xsUnM0RUxXdGNzS3pNWUY3T25Ocnk5S2w0dGtPV094QldqTjFJ?=
 =?utf-8?B?VUU3eUY4WGk0L0pMRGxKcUtCNmtzaU9ZbjVJdXladmlBaHlUc1hEZitZeEFq?=
 =?utf-8?B?Ymc0cUhCNy9sWFdlYUZGbUtqVTNZMWVwTzNmOWtOUUplbUR4MTdaall3TGtV?=
 =?utf-8?B?TEVRZnZaQUZ0VSswRWhNNjVXaFFKeThId0ZWbkVKTU8va2RITXRBZWxlZ0tk?=
 =?utf-8?B?anMxeUN5R01WWHFxOXlTUWljSnRXUUFKdFpUb1l4MGxwUkUya05vaXRKUUhP?=
 =?utf-8?B?M3QrdS9DeUVZN2gzZmhXN200Rkt5ZWRNT3JDaFVTOFBKb1h4TVdsNmUzL3Bu?=
 =?utf-8?B?OEc1ajF3aDdEQ3dXS1pVY2t4b1hBOGdNYlhYU3JFeUtzWTZ0a01xMlFiSWRx?=
 =?utf-8?B?em9CbW1VZVl6dVJkTHF2V05ERTM5L1ZjM2Z1eVlZaVFYVkd3bkxQSHljaitX?=
 =?utf-8?B?YmpZREZCV3VXTWpqeHNCMXJEZFlqNjByTjNxMzhCMkdVVWJzUG55aWl3V1Ns?=
 =?utf-8?B?VHJobksrWit0UlRnS0FTK0sxdk1wUlU3Y1ZYWi9uczhvYlEyWjVYUXNQQTRC?=
 =?utf-8?B?NE8vdElqN3BkVFpRZmE4dWpGczYvbEFUSU5mOGtYMDc0S1pOMklVYnUxS0hF?=
 =?utf-8?B?T0R1KzZ6ZkIrVHNhSGRHd0tzYkxDK2hYK0YwamRzOVhJb1VDUDBhVkVKUmdN?=
 =?utf-8?B?ZmlpMGJmVyt2dGVPWjJMOUhGQno3aDZFZjJna05LZEJjTUluajNZOG5sZG4x?=
 =?utf-8?B?Sm9hYUgva2hicTVJbVBhYVl4YU5nS1cvdURhMy9id296bUo4Q01QSnh6L2lY?=
 =?utf-8?B?UDlZL3o4WVVZY0lXK2tqaGNrS0pJUHZPTkxKakxOUXV5VWI5a1lVY0hHdVNJ?=
 =?utf-8?B?cUxCS3NTdjJ4bkpZbWtNWHJPbnBPcURCQW1PYzUyZm1HMUpITlByd1drWHg3?=
 =?utf-8?B?cFNGQ3JFZHY2bzNDNjF0UmZLdmlaT0NoUHord2NlRC84ZTRsWmFaei8zOWlw?=
 =?utf-8?B?M2ljR0FtZDFlN05BUStKbjg3eEd1UFJ5c0k1OXlqOTdMcXJnakR1cjJnZlFC?=
 =?utf-8?B?eGdaSFEvT1F2ZGhYcHhzNFpFVnk0L2lmdEErRWhTQVZPc1JsQzZqcnZjVVhQ?=
 =?utf-8?B?WVdsVUpsU0pJTkd0aHk2emJxOTRXbkxMTXAxQjlKMXcxeDhFZG9YRHUwMGk2?=
 =?utf-8?B?OXJETXU1SzM4S1BIMnN3UUNYUEt5eFRlcmtMU1IzcU9zWm9oMHVUMjJvZWVo?=
 =?utf-8?B?cVVyMzI5emFaZWJZSGNPY1F1SWVPMHNNYTFQOTM0ODJtSHJQSGNvbEdyRUpT?=
 =?utf-8?B?VlpuOFY2S3MvQnJBNDIxem5NNFlhTEVGRVI2L3ljU3Bta1EwMVo3a0duNk1m?=
 =?utf-8?B?S1dsazlpUTRLRzRRbzZEMndNdjNHRjhKbkF4azBaTWdYN2lGOUhISHU4S3I5?=
 =?utf-8?B?N2VKRDJDQmxwTkxKejRLTjVKRHNZMURveFkwcnVJUDBzTGxPenVtbEJWU2dX?=
 =?utf-8?B?TUVYR1dFSWV1dWExdCswSkVuR3lKOTgvT3NhRWNEOWZSQUM1NXNrcWNZWUVV?=
 =?utf-8?B?RW5ZYXZLVGZlbCtlTG8zTEVnQVdUdUkyN0dQVy9uYnF2a2piUkNjSVZNYnha?=
 =?utf-8?B?MzF4WkpTakJ2NlhYNnRERmJ0cEN6WnRYWjZFOEhVczRyd0M3ZE53VCtWdGYy?=
 =?utf-8?B?MDRqZU1CbFJsTG9DVVVtbWlwdHl6a1JHUVdUWW1Mc01sMHpEQU1yNWdpTnd2?=
 =?utf-8?B?czJiZzNGVVYrcWhFSXNjVjhCbTU5blYwaWhWZ3VtNXhOQVgzS2kxWlBqakc2?=
 =?utf-8?B?VXRIaHRSRUMvbWhVUTlrZFlkaUtGUHNWTjhIWEpZaWFuVEltUFJzakd5b1JD?=
 =?utf-8?Q?XSbxm//Y1TVWWcSTxQbMEI0XHj9uRt4G?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a05qeEtoMCtPWUFMWW1tNi94Mk9aeWpLYnROM2ZxV05SMDBjOFhETnBpVmx4?=
 =?utf-8?B?WTU3RGJIRURqRG9jbSsydTlLK09nNTlKOU1jQjU2ZGUvWkNUWW9OeEtYVVZm?=
 =?utf-8?B?ZEVvVGRJWlhJMHU0TjFjQi9LdnhwM2pRbE5PUWtYckE1ajZtc3pwSUxJL2RM?=
 =?utf-8?B?NUVpaWYyRDA0MzZUZ3lBTWNnZ0k5bVhCVEk5YUVQdHB0L0ZpZGxLZXZVU1Rn?=
 =?utf-8?B?NktIWUdtdEJrVHRPWmtQSnhHUzJwa29zNVQySkRTQWI1VjdJMFU3dzhBK3Na?=
 =?utf-8?B?SVhOTTFuMjRrTXY5Lzd0d2pjR0dFM01YaWIwMDJSSUlVUm9kbDRManB4NDhB?=
 =?utf-8?B?SlZjSHEvdTd3TUEwYWNKZlJubVBpak8xSllSYnJraEhHNlFtdktoc0hxM3N6?=
 =?utf-8?B?UnYxQ1BZTXl4N3I5RHZvS1NXQW8vaGhYNmplWFN5d1RpbEozQVRPTjhVcCtN?=
 =?utf-8?B?YXcvMElTMCttVjUwZ0FQQ3lBYUtlQ0IwWXVFcks1bGNDZFRrNDFnWmlVM1BN?=
 =?utf-8?B?R1NDazBjS1VIc2o4YkxHNTZOazYySS9TVXp3c2ZXb3JUTjdWSG9SSW5XS0Nk?=
 =?utf-8?B?WUtGS3d5Q1dySTV1RExtaUQrMjVCYm9kdFdCRHEzcjNYQU5pYThXbFRQbGVj?=
 =?utf-8?B?cUZoS3p5OEJyaC9rZjdkRHBZRGlWZnZLaFdzb3FjM2NRWEI3QTRZVGdFdXcy?=
 =?utf-8?B?S3hnM1d2c3ZFVzhsL0xjM3dPTmY2Smw1NE1lZlFXUU5Gb3hUSUMrTkRHY2RP?=
 =?utf-8?B?MFNDS09lKzg2aXFkT2E2KzVDenozUm5uSmx2WnM4VEJIM1RJRGd0WEF5K2FS?=
 =?utf-8?B?aGtXaFhmczE4UnlEbXRuc3E4RVRGdUZ6QjRoTEwzOGdoa0FCcnZCcDlTWGUv?=
 =?utf-8?B?ZDNIVi8yOFJCcW9ocVlkSDRBaUQwRXJ6RUxadHRqemNHb2h3eGt3YTQxczRS?=
 =?utf-8?B?NWltN3RjK05aMjh4Uk0veExpOUpzejRoUm9QalpSRkltcFJuU2o2YW83dTAv?=
 =?utf-8?B?MVgycmZxN3k5UWZubDY5NU52c2Rib1NIajM4ZnY1QjdIWjMyVDVHd2FBK1Nx?=
 =?utf-8?B?UE9tdGtLTWh6bWdxQWJha3Z3eVNhb3BDTms1RVVrVk05Y3hBOUFpU1pKVWxY?=
 =?utf-8?B?dW1NdzdkMGFtZmxJNFRINHZYMGUxOERRekR0alFWMWViNjFxZjd0SExxTTN3?=
 =?utf-8?B?MVhoRFVqTWFkYlNYSzdsUmpBbGRscG5kZjBYYm53RUsvOXQ1VDgyQVF4NHNQ?=
 =?utf-8?B?dVkrU0Izd2ZxQ0UrVTJlaGV4WUZWZXRENGd1UGVRV3gvcS81RTczOVhJZmlL?=
 =?utf-8?B?OFptenhZSUpxRlBrajVTai9IcGtGZWd0MWdzdGNBVWdEcmpyVUx3L21FKzZj?=
 =?utf-8?B?WG1zcHRGY0w2QW4rT09PWFNlVWtnYWdTb3VzclhlQnBhSnFqVjRWTGtTSHNm?=
 =?utf-8?B?OGRCN1kwMU0vcmtQTGp2RWptNDBVaG9ac0E0K2hHYVJKMkRnSWgzeFlCbGlU?=
 =?utf-8?B?M2VBZ0ZBWUppbCtMVTdBRmd3RGh5WDdwNU1WbDVHdldlNHB4QkRIZkNFRkl3?=
 =?utf-8?B?cWZtRzdtZGpVQ2pLUnQzeGJPZi9LZm45T0RpNGJBK1lGaTRLSHJlVGNFMVQ2?=
 =?utf-8?B?aXhoRHlqLzMrNmd2akNSbEthU2ZYY0V3Q0VIOEttWm1XS28vR3NUL0k0dlQx?=
 =?utf-8?B?MTVweUlZcjBjdU84QlhxaitNMEh2bE5IVGsrWlIrNDNCMWVvVGovc2E0by9h?=
 =?utf-8?B?dndUalFFR0JmQ1dScmtCSFNpalNoeUt0RDY3V3puRU5yUURCaVFuR2ZXa0sw?=
 =?utf-8?B?ZUNNZUNZb0VmeUo0NnR0U2xyU28waDlsbVhBMFFlcDZZdHNrMkRnZDRtcGg5?=
 =?utf-8?B?SXR5RUZMT3FJYmVGV0d2UEVUT3ljZlNERUtheWpJeVBjdXBPb3FDQ25GK2Iv?=
 =?utf-8?B?Q09BT0dPVnp3aUxmUHYzUG5QUnkrTTJyWnU0d0YrRlIwU3RLZ1ZLKzlMZVJz?=
 =?utf-8?B?V25UTGlNc3ZZMnUzclN1OW11NWVVWjJycUtPRjdxTW45TW9vQUdkUm9IdkVa?=
 =?utf-8?B?a0FoUEo3Y0VmRnMwYjBIRVFMTFNPQVVyT1l6MVRkbnVFR3JOcTZkWUEzZGhv?=
 =?utf-8?Q?5IRPpjuHvIySOhwFa9pKdKycp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21083662-7684-4480-3d8c-08dd4a556e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 04:34:54.2095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3nEpnQ1GSz7ya6vvx+Vjrt9LmPo69yB+wc6A93KRONTdY//DIvB+K6DPnOqOgnExPu3qP1WOCL7Avc+ya9ZO21jqjv6hWYsasH4OEPCgJwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7524
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIERvbmcsDQo+IFpo
YW5qdW4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSA3LCAyMDI1IDg6NDYgUE0NCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRlc3Rz
L2ludGVsL3hlX2V4ZWNfY2FwdHVyZTogRW5oYW5jZSB0ZXN0IHRvIGNoZWNrIHdpdGgNCj4gRFVN
UEFCTEUgZmxhZw0KPiANCj4gDQo+IA0KPiBPbiAyMDI1LTAyLTA3IDEwOjA1IGEubS4sIERvbmcs
IFpoYW5qdW4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+IE9uIDIwMjUtMDItMDUgMTo0MSBwLm0uLCBw
cmF2YWxpa2EgZ3VycmFtIHdyb3RlOg0KPiA+PiBjaGVjayBpZiB0aGUgVk0gaXMgdGhlcmUgd2hl
biBEUk1fWEVfVk1fQklORF9GTEFHX0RVTVBBQkxFIGlzIHNldCBpbg0KPiA+PiB0aGUgZ2VuZXJh
dGVkIGRldmNvcmVkdW1wLg0KPiA+PiBjaGVjayBWTSBhZGRyZXNzIHdpdGhpbiB0aGUgcmFuZ2UN
Cj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogcHJhdmFsaWthIGd1cnJhbSA8cHJhdmFsaWthLmd1
cnJhbUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiDCoCB0ZXN0cy9pbnRlbC94ZV9leGVjX2Nh
cHR1cmUuYyB8IDY0DQo+ID4+ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+
ID4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkN
Cj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfY2FwdHVyZS5jIGIv
dGVzdHMvaW50ZWwvDQo+ID4+IHhlX2V4ZWNfY2FwdHVyZS5jIGluZGV4IDU1ZWMzZDRiZC4uNGVh
YTNmNGQxIDEwMDY0NA0KPiA+PiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX2NhcHR1cmUuYw0K
PiA+PiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX2NhcHR1cmUuYw0KPiA+PiBAQCAtNTMsMTYg
KzUzLDE1IEBADQo+ID4+IMKgICNkZWZpbmUgRFVNUF9QQVRIwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAiL3N5cy9jbGFzcy9kcm0vY2FyZCVkL2RldmljZS8NCj4gPj4gZGV2Y29yZWR1bXAvZGF0YSIN
Cj4gPj4gwqAgI2RlZmluZSBTVEFSVF9UQUfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIqKioqIEpv
YiAqKioqIg0KPiA+PiAtI2RlZmluZSBFTkRfVEFHwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICIqKioqIFZNIHN0YXRlICoqKioiDQo+ID4+IMKgIC8qIE9wdGlvbmFsIFNwYWNlICovDQo+
ID4+IC0jZGVmaW5lIFNQQ19PwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJbIFx0XSoi
DQo+ID4+ICsjZGVmaW5lIFNQQ19PwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJbIFx0
XFwuXSoiDQo+ID4+IMKgIC8qIFJlcXVpcmVkIFNwYWNlICovDQo+ID4+IC0jZGVmaW5lIFNQQ8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiWyBcdF0rIg0KPiA+PiArI2RlZmluZSBTUEPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlsgXHRcXC5dKyINCj4gPj4gwqAgLyogT3B0
aW9uYWwgTm9uLVNwYWNlICovDQo+ID4+IC0jZGVmaW5lIE5TUENfT8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiKFteIFx0XSopIg0KPiA+PiArI2RlZmluZSBOU1BDX0/CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIihbXiBcdFxcLl0qKSINCj4gPj4gwqAgLyogUmVxdWlyZWQg
Tm9uLVNwYWNlICovDQo+ID4+IC0jZGVmaW5lIE5TUEPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgIihbXiBcdF0rKSINCj4gPj4gKyNkZWZpbmUgTlNQQ8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAiKFteIFx0XFwuXSspIg0KPiA+IEFkZCAiLiIgYXMgZGVsaW1pdGVyLCB0aGF0
J3MgZmluZS4NCj4gPg0KPiA+PiDCoCAjZGVmaW5lIEJFR8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAiXiIgU1BDX08NCj4gPj4gwqAgI2RlZmluZSBSRVFfRklFTETCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIE5TUEMgU1BDDQo+ID4+IMKgICNkZWZpbmUgUkVRX0ZJRUxEX0xBU1TCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIE5TUEMgU1BDX08gQEAgLTc3LDYgKzc2LDggQEANCj4gPj4gwqAgI2Rl
ZmluZSBJTkRFWF9FTkdJTkVfUEhZU0lDQUzCoMKgwqDCoMKgwqDCoCAyDQo+ID4+IMKgICNkZWZp
bmUgSU5ERVhfRU5HSU5FX05BTUXCoMKgwqDCoMKgwqDCoCAxDQo+ID4+IMKgICNkZWZpbmUgSU5E
RVhfRU5HSU5FX0lOU1RBTkNFwqDCoMKgwqDCoMKgwqAgNA0KPiA+PiArI2RlZmluZSBJTkRFWF9W
TV9MRU5HVEjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDIgI2RlZmluZSBJTkRFWF9WTV9TSVpFDQo+
ID4+ICszDQo+ID4+IMKgIHN0YXRpYyB1NjQNCj4gPj4gwqAgeGVfc3lzZnNfZ2V0X2pvYl90aW1l
b3V0X21zKGludCBmZCwgc3RydWN0DQo+ID4+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2Ug
KmVjaSkgQEAgLTE3Nyw3ICsxNzgsOCBAQA0KPiA+PiB0ZXN0X2xlZ2FjeV9tb2RlKGludCBmZCwg
c3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gPj4gaW50IG5fZXhl
Y19xdQ0KPiA+PiDCoMKgwqDCoMKgIH07DQo+ID4+IMKgwqDCoMKgwqAgc3luY1swXS5oYW5kbGUg
PSBzeW5jb2JqX2NyZWF0ZShmZCwgMCk7DQo+ID4+IC3CoMKgwqAgeGVfdm1fYmluZF9hc3luYyhm
ZCwgdm0sIDAsIGJvLCAwLCBhZGRyLCBib19zaXplLCBzeW5jLCAxKTsNCj4gPj4gK8KgwqDCoCBf
X3hlX3ZtX2JpbmRfYXNzZXJ0KGZkLCB2bSwgMCwgYm8sIDAsIGFkZHIsIGJvX3NpemUsDQo+ID4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1hFX1ZNX0JJTkRfT1BfTUFQLCBm
bGFncywgc3luYywgMSwgMCwgMCk7DQo+ID4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IG5f
ZXhlY3M7IGkrKykgew0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdTY0IGJhc2VfYWRkciA9IGFk
ZHI7DQo+ID4+IEBAIC0yODcsMTAgKzI4OSw2IEBAIHN0YXRpYyBpbnQgbG9hZF9hbGwoRklMRSAq
ZmQsIGNoYXIgKipsaW5lcywgY2hhcg0KPiA+PiAqYnVmKQ0KPiA+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgLyogT25seSBzYXZlIHVwIHRvIE1BWF9MSU5FX0xFTiB0byBidWZmZXIgKi8NCj4gPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHNhZmVfc3RybmNweShsaW5lc1tpKytdLCBidWYsIE1BWF9MSU5FX0xF
Tik7DQo+ID4+IC0NCj4gPj4gLcKgwqDCoMKgwqDCoMKgIC8qIFN0b3Agb24gRU5EX1RBRyAqLw0K
PiA+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFzdHJuY21wKEVORF9UQUcsIGJ1Ziwgc3RybGVuKEVO
RF9UQUcpKSkNCj4gPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4gVGhlIHRh
cmdldCBsaW5lIGxvY2F0ZWQgYWZ0ZXIgRU5EX1RBRyBhbmQgaXMgYXQgdGhlIGVuZCBvZiBkdW1w
LA0KPiA+IHRoYXQncyB3aHkgdGhpcyBzZWFyY2ggaXMgcmVtb3ZlZC4gQnV0IGNvdWxkIHB1dCBj
b21tZW50IGluIGNvbW1lbnQNCj4gPiBtZXNzYWdlIGFib3V0IHRoaXM/IFJlbW92ZSBzZWFyY2gg
Zm9yIHNvbWV0aGluZyBuZWVkIHNvbWUgZGVzY3JpcHRpb24sDQo+ID4gd2UgZG9uJ3Qgd2FudCBp
dCB0byBiZSByZW1vdmVkIHNpbGVudGx5Lg0KPiBBbmQgYWRkIGV4YW1wbGUgbGluZSwgbGlrZToN
Cj4gMjA0IFsxNTgwMDAxYTAwMDBdLmxlbmd0aDogMHgxMDAwMA0KPiBpbiBjb21tZW50cyBzb21l
d2hlcmUsIGxpa2UgY2hlY2tfaXRlbV91NjQgb3Igd2hlcmUgaXQgd2FzIGNhbGxlZCwgbWFrZSBp
dA0KPiBlYXN5IHRvIHJlYWQuDQo+IA0KPiBSZWdhcmRzLA0KPiBaaGFuanVuIERvbmcNCj4gPj4g
wqDCoMKgwqDCoCB9DQo+ID4+IMKgwqDCoMKgwqAgcmV0dXJuIHN0YXJ0X2xpbmU7DQo+ID4+IMKg
IH0NCj4gPj4gQEAgLTM1MSw3ICszNDksNiBAQCBzdGF0aWMgY2hhcg0KPiA+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbHVlID0gJmxpbmVbbWF0Y2hbdGFyZ2V0X2luZGV4
XS5ybV9zb107DQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGluZVtt
YXRjaFt0YXJnZXRfaW5kZXhdLnJtX2VvXSA9ICdcMCc7DQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0NCj4gPj4gLQ0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
a2V5ICYmIHZhbHVlICYmIHN0cmNtcCh0YWcsIGtleSkgPT0gMCkNCj4gPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdmFsdWU7DQo+ID4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8qIGlmIGtleSAhPSB0YWcswqAga2VlcCBzZWFyY2hpbmcgYW5kIGxvb3Ag
dG8gbmV4dCBsaW5lDQo+ID4+ICovIEBAIC0zNjEsMTYgKzM1OCw0NCBAQCBzdGF0aWMgY2hhcg0K
PiA+PiDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPiA+PiDCoCB9DQo+ID4+ICtzdGF0aWMgdWlu
dDY0X3QNCj4gPj4gK2NvbXBhcmVfaGV4X3ZhbHVlKGNvbnN0IGNoYXIgKm91dHB1dCkgew0KPiA+
PiArwqDCoMKgIGNoYXIgcmVzdWx0WzY0XTsNCj4gPj4gK8KgwqDCoCB1aW50NjRfdCByZXRfdmFs
Ow0KPiA+PiArwqDCoMKgIGNoYXIgKnNyYyA9IChjaGFyICopb3V0cHV0LCAqZHN0ID0gcmVzdWx0
Ow0KPiA+PiArDQo+ID4+ICvCoMKgwqAgaWYgKHNyY1swXSA9PSAnMCcgJiYgKHNyY1sxXSA9PSAn
eCcgfHwgc3JjWzFdID09ICdYJykpDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBzcmMgKz0gMjsNCj4g
PiAgwqDCoMKgwqB0aGlzIGlzIHdvcmtzIHdpdGggIjB4MTIzIiBjYXNlLCB0byBza2lwIHRoZSBs
ZWFkaW5nICIweCINCj4gPiAgwqDCoMKgwqBob3cgYWJvdXQgIlsweDEyM10iIGNhc2U/DQogICAg
ICAgIGlmICgqc3JjID09ICdbJyB8fCAqc3JjID09ICddJykgeyAgID09PT4gd29ya3MgZm9yIFsw
eDEyM10NCiAgICAgICAgcmV0X3ZhbCA9IHN0cnRvdWxsKHJlc3VsdCwgTlVMTCwgMTYpOyB0aGlz
IGlzIHNraXBwaW5nIDB4IG91dHB1dCB3aWxsIGJlIDEyMw0KDQpSZWdhcmRzLA0KUHJhdmxpa2Eg
DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCB3aGlsZSAoKnNyYykgew0KPiA+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKCpzcmMgPT0gJ1snIHx8ICpzcmMgPT0gJ10nKSB7DQo+ID4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNyYysrOw0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsN
Cj4gPj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4gPj4gKw0KPiA+PiArwqDCoMKgwqDCoMKgwqAgKmRz
dCA9IHRvdXBwZXIoKHVuc2lnbmVkIGNoYXIpKnNyYyk7DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBk
c3QrKzsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgIHNyYysrOw0KPiA+PiArwqDCoMKgIH0NCj4gPj4g
K8KgwqDCoCAqZHN0ID0gJ1wwJzsNCj4gPj4gK8KgwqDCoCByZXRfdmFsID0gc3RydG91bGwocmVz
dWx0LCBOVUxMLCAxNik7DQo+ID4+ICvCoMKgwqAgcmV0dXJuIHJldF92YWw7DQo+ID4+ICt9DQo+
ID4+ICsNCj4gPj4gwqAgc3RhdGljIHZvaWQNCj4gPj4gLWNoZWNrX2l0ZW1fdTY0KHJlZ2V4X3Qg
KnJlZ2V4LCBjaGFyICoqbGluZXMsIGNvbnN0IGNoYXIgKnRhZywgdTY0DQo+ID4+IGFkZHJfbG8s
IHU2NCBhZGRyX2hpKQ0KPiA+PiArY2hlY2tfaXRlbV91NjQocmVnZXhfdCAqcmVnZXgsIGNoYXIg
KipsaW5lcywgY29uc3QgY2hhciAqdGFnLCB1NjQNCj4gPj4gYWRkcl9sbywNCj4gPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoCB1NjQgYWRkcl9oaSwgaW50IHRhZ19pbmRleCwgaW50IHRhcmdldF9pbmRl
eCkNCj4gPj4gwqAgew0KPiA+PiDCoMKgwqDCoMKgIHU2NCByZXN1bHQ7DQo+ID4+IMKgwqDCoMKg
wqAgY2hhciAqb3V0cHV0Ow0KPiA+PiAtwqDCoMKgIGlndF9hc3NlcnRfZigob3V0cHV0ID0gZ2V0
X2NvcmVkdW1wX2l0ZW0ocmVnZXgsIGxpbmVzLCB0YWcsDQo+ID4+IElOREVYX0tFWSwgSU5ERVhf
VkFMVUUpKSwNCj4gPj4gK8KgwqDCoCBpZ3RfYXNzZXJ0X2YoKG91dHB1dCA9IGdldF9jb3JlZHVt
cF9pdGVtKHJlZ2V4LCBsaW5lcywgdGFnLA0KPiA+PiB0YWdfaW5kZXgsIHRhcmdldF9pbmRleCkp
LA0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJUYXJnZXQgbm90IGZvdW5kOiVz
XG4iLCB0YWcpOw0KPiA+PiAtwqDCoMKgIHJlc3VsdCA9IHN0cnRvdWwob3V0cHV0LCBOVUxMLCAx
Nik7DQo+ID4+IC3CoMKgwqAgaWd0X2RlYnVnKCJDb21wYXJlICVzICVzIHZzIFsweCVsWC0weCVs
WF1cbiIsIHRhZywgb3V0cHV0LA0KPiA+PiBhZGRyX2xvLCBhZGRyX2hpKTsNCj4gPj4gKw0KPiA+
PiArwqDCoMKgIHJlc3VsdCA9IGNvbXBhcmVfaGV4X3ZhbHVlKG91dHB1dCk7DQo+ID4+ICvCoMKg
wqAgaWd0X2RlYnVnKCJDb21wYXJlICVzICVzIHZzIFsweCVsWC0weCVsWF0gcmVzdWx0ICVsWFxu
IiwgdGFnLA0KPiA+PiBvdXRwdXQsDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBhZGRyX2xvLCBhZGRy
X2hpLCByZXN1bHQpOw0KPiA+PiDCoMKgwqDCoMKgIGlndF9hc3NlcnRfZigoYWRkcl9sbyA8PSBy
ZXN1bHQpICYmIChyZXN1bHQgPD0gYWRkcl9oaSksDQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgInZhbHVlICVsWCBvdXQgb2YgcmFuZ2VbMHglbFgtMHglbFhdXG4iLCByZXN1bHQs
DQo+ID4+IGFkZHJfbG8sIGFkZHJfaGkpOw0KPiA+PiDCoCB9DQo+ID4+IEBAIC00MzUsNyArNDYw
LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9jYXJkKGludCBmZCkNCj4gPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGlndF9kZWJ1ZygiUnVubmluZyBvbiBlbmdpbmUgY2xhc3M6ICV4IGluc3RhbmNlOiAleFxu
IiwNCj4gPj4gaHdlLQ0KPiA+PiA+ZW5naW5lX2NsYXNzLA0KPiA+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaHdlLT5lbmdpbmVfaW5zdGFuY2UpOw0KPiA+PiAtwqDCoMKgwqDCoMKg
wqAgdGVzdF9sZWdhY3lfbW9kZShmZCwgaHdlLCAxLCAxLCAwLCBhZGRyKTsNCj4gPj4gK8KgwqDC
oMKgwqDCoMKgIHRlc3RfbGVnYWN5X21vZGUoZmQsIGh3ZSwgMSwgMSwNCj4gPj4gK0RSTV9YRV9W
TV9CSU5EX0ZMQUdfRFVNUEFCTEUsDQo+ID4+IGFkZHIpOw0KPiA+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgLyogV2FpdCAxIHNlYyBmb3IgZGV2Y29yZWR1bXAgY29tcGxldGUgKi8NCj4gPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHNsZWVwKDEpOw0KPiA+PiBAQCAtNDUxLDEwICs0NzYsMTMgQEAgc3RhdGlj
IHZvaWQgdGVzdF9jYXJkKGludCBmZCkNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNoZWNrX2l0
ZW1fc3RyKCZyZWdleCwgbGluZXMsICJDYXB0dXJlX3NvdXJjZToiLCBJTkRFWF9LRVksDQo+ID4+
IElOREVYX1ZBTFVFLA0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICJHdUMiLCBmYWxzZSk7DQo+ID4+ICsNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNoZWNr
X2l0ZW1fdTY0KCZyZWdleCwgbGluZXMsICJBQ1RIRDoiLCBhZGRyLA0KPiA+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIgKyBCQVRDSF9EV19DT1VOVCAqIHNpemVv
Zih1MzIpKTsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhZGRy
ICsgQkFUQ0hfRFdfQ09VTlQgKiBzaXplb2YodTMyKSwgSU5ERVhfS0VZLA0KPiA+PiBJTkRFWF9W
QUxVRSk7DQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjaGVja19pdGVtX3U2NCgmcmVnZXgsIGxp
bmVzLCAiUklOR19CQkFERFI6IiwgYWRkciwNCj4gPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBhZGRyICsgQkFUQ0hfRFdfQ09VTlQgKiBzaXplb2YodTMyKSk7DQo+ID4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRkciArIEJBVENIX0RXX0NP
VU5UICogc2l6ZW9mKHUzMiksIElOREVYX0tFWSwNCj4gPj4gSU5ERVhfVkFMVUUpOw0KPiA+PiAr
wqDCoMKgwqDCoMKgwqAgY2hlY2tfaXRlbV91NjQoJnJlZ2V4LCBsaW5lcywgImxlbmd0aDoiLCBh
ZGRyLA0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIgKyBC
QVRDSF9EV19DT1VOVCAqIHNpemVvZih1MzIpLCBJTkRFWF9WQUxVRSwNCj4gPj4gSU5ERVhfS0VZ
KTsNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGNsZWFyIGRldmNvcmVkdW1wICovDQo+ID4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBybV9kZXZjb3JlZHVtcChwYXRoKTsNCj4gPg0KDQo=

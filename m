Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CD5CA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 19:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616B410E8D1;
	Thu, 14 Aug 2025 19:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnld4bZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E0710E8D1
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755198711; x=1786734711;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fn7LaOJXvLfg6ScVRrCCNtxXqdkMZOplwA6PMQKeyG0=;
 b=mnld4bZI5A+N7FnjjwNST3eZb5jR5uikdgXvwwmPYey5NodtdN+78NWG
 BtAZIizL9bE+mPGg0OULv60w/ojm1yDQ1a6t3KBP/6KAYErP/fPx7Uxa0
 C+7JXXriNE/Hvro6xfnBgGLp4xMI3jA0Wn+FSY7yOgsrahotrgHfVYxN/
 jh3K8prJwchF9bmlLXjZz6Lw7xJ61L83ztfjLMom0QqHGD7XJ2YvX57N9
 VYTEk0j5nPCprFRRutCwxR3dD/JM6zhBAofYcpzoh1SMr4cls/yKUb9/I
 2B3p0DEA102H2PVZrXkZOSqLtgdYW10u1ogByx9mVQK2DLtoZbVl3QGHZ A==;
X-CSE-ConnectionGUID: VMUj5zlJRbGWrp1WZvaeSQ==
X-CSE-MsgGUID: wjvwAd2SQ2CoRXJbr2K5JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68128963"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="68128963"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:11:43 -0700
X-CSE-ConnectionGUID: /jsfFNIPTOqn/l+motpYQA==
X-CSE-MsgGUID: d5I9IIiQS36/T7M5h9K9Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="197827717"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:11:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:11:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 12:11:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVufRXBMQFEu/0O0Kcl8Yy6Rxkzsn8rzVPhBYD+h4AVZq4DpaILsdEOhsOn0Vi0lSbTMYfzO/8UvCd41hIoRR3tiD34WMCHTNmjDhDhtTv/Et3QmVZr7Jkh6Ir8LRNAGUUV8ca4APlyEYkyLoGp9/HSmCspwZsKL+iET6DMBxnTgqekhltzDPNhugwqaZhwyKkvEpfbEi+D+OnDI08CXSb3G2E5hJdEDrXj/rIF9QODl+WOADQ3HXv7v9e3zhvJOXWLOrPuMXGbz/YK2WUHaBW++Vw07108rTlGdsN1UTUaFjgHnSc8Y26VCAtgbCUFf61tIFZU9YFnP4q7pJPQ7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn7LaOJXvLfg6ScVRrCCNtxXqdkMZOplwA6PMQKeyG0=;
 b=Sti8iNYEZyScJsdq4NNdj2ulri8Jip9RDvjeVx0nowJX7HII8cTP7XNtlbwvvdiEO7MtnT0AGfOmOZ8SGD9fD81RErUl6uyXX2djEI9JI8P5ke2bZKjCG6A9ek0danIjWq13ASHAx5NDrnZgNl1bTyLA+PKCxOGoCpawxAjvF11ZOSrvVaRo2uw785pgHUkf3ddlI2jaD14mGQpfe9+ZHq+MW68CW5N/Yz6G8UWiovcg6/NhoxpAIsgTZxli9ssIshVQ24YLvPIYTbRsiPg5yJ4Hi7dMwlFK+T92rtfInY9sHwTLz+qEJ55MxndimcyEaYDmHY5Vchq/ov+ZcdZViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6618.namprd11.prod.outlook.com (2603:10b6:303:1ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 19:11:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 19:11:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Thread-Topic: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Thread-Index: AQHcDUxS8k/xk7we/E2ZAKCRd3s/BLRigh0AgAAA5sA=
Date: Thu, 14 Aug 2025 19:11:39 +0000
Message-ID: <CH0PR11MB544476B570A9C0B2BB2CECA4E535A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250814185009.52614-2-jonathan.cavitt@intel.com>
 <aJ4zZki709mmqtbV@lstrano-desk.jf.intel.com>
In-Reply-To: <aJ4zZki709mmqtbV@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6618:EE_
x-ms-office365-filtering-correlation-id: f766f0e2-b8d8-42d2-4db4-08dddb6665e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?blhMcWRqTXFrdkZqT0JFUUJMQ1RqS21hYm9yOHRaVzAvS0hQNGNmaGJ5clVw?=
 =?utf-8?B?S0RTNFNNQU9ndFdKamFnZjQ2WkhFYlY1QUJ1dFZQWnRBcHpONDU5eS80YlFv?=
 =?utf-8?B?dG5SR3FPQS9lNUNUVTJXL1RaMU9mdlBMKzc5dEYwWUkrZzdDb0tRSzVsb0Nt?=
 =?utf-8?B?bHF1cnF4QkY0eVVpM25UbFhSUmI0a0Vmb2VUSHdMQXFuVFdBUkJIUmpldGFN?=
 =?utf-8?B?bCt4RGZZZjQ3eXhCREdZU1NhdnU0RWpjUFA5WWdDem5UWjdtUzdsV3g3Y2Ni?=
 =?utf-8?B?bXQ4V24xelgyZ2h1NFQ0RW1hdjY2RkdtM0xnVjFuYU94N3libW40V0NkWHlL?=
 =?utf-8?B?UlE5WjE0V2dhSlR5V2NNQ1RLUlZaMWh0eXJGUm1uWlFoNzVnOURSdVczRjBG?=
 =?utf-8?B?UmN2dUI1QVdkYXZINXFjaFZxaGRvRm9NZFhZMC9CQWJjZVNGQWdjeXNkelhu?=
 =?utf-8?B?eEJyTzJwTmJoVTd6ZkdFbS9YejVjTmozZGdkaEhJTmVRWUJaUjMvL3NQblFh?=
 =?utf-8?B?dnB5TVFFSVZsTTJpVkJiSk5Eb1hqcUl3VEl1bjRyOTREelM5SEpiVWt2UEJ5?=
 =?utf-8?B?UCtTeFE4cDNZY1ZCc3pFc1RsU1JWcW5BTnhtRldRWVhyMjdUaEttbk5VS0Jo?=
 =?utf-8?B?dmVqS2NuUEpkU3hJNEtTMHRVYitvSHVKZVlyeURiR0lyZU45T2RJQmJVMFdF?=
 =?utf-8?B?dWpNNllRVHF3T0pIbzJ1Z25JaDZnVmlPTGc4UjBEZ1lpR2RDVHM5ZGZKOU04?=
 =?utf-8?B?a2Y3QVFXTXc4dGpxUXFIeDljMWllQTZiZkFCTHRRZnpmNDZXaHdSUTZ6aHpS?=
 =?utf-8?B?WEthTkRINFNyYkE5SWZ4dDVWOGplb2VWNjEzN1NpTFNDOVFLMzFvbFlFUklk?=
 =?utf-8?B?M3EzaEpPbjJWVkxVeldhSUpHeXNBWTR1cTlsa2dwRC9HY2dhS2RWQjdVNk5u?=
 =?utf-8?B?VDZFS24rOGpMcFVXV3R0c0tWZ2lRQmVCMldMYnFiY1EyUUdidkhFSXlSaGFC?=
 =?utf-8?B?WjllMmh6dzgzRFdFTEZmcUI5Zm5xRm9UcnFObmloSFg4UVhlZVI1Z2dBR3Fk?=
 =?utf-8?B?dnBHZEhHaEN6RVpwUWx1VTFUUU5hR3VobmNtMzBiQ2k3ZlFMd05sWDM0cVRz?=
 =?utf-8?B?YUM2djlnNEtDNkRFVkY5RzlzVUh3aGltQWRpUkR1VzdqanUwYkpuRzl0eFdl?=
 =?utf-8?B?cG85QTFENnl2ZFpKSHdIQlIyY0dkUktzK2J4N0o3NVhwaFpuWDFlQm1WcDF6?=
 =?utf-8?B?bzl2T21BS0JLZThPa1dRVVN6cGh5NUZQOFJIc3JKSEdPNnEvQWRtdWkwVUh0?=
 =?utf-8?B?eVBISk0xTlExemNRZEw2Z3pxQmV2U1BiYTFaSXFGclhoc3J3WE1FaEo2SkZi?=
 =?utf-8?B?Wk9PWjh5djhhekovVnROczBlWENPVHVMcVM4OVhoeXR6NzZuUGtmSTJBNG5G?=
 =?utf-8?B?UDR2SS94Q01naXZZTjRrVEY4L2dvcmViUmZJZHdFZXpxYjUvUUVuUG9yUEYx?=
 =?utf-8?B?VU43Y3AzRCtjQmN2NDc3QWNCbWhnblF3N1MySmVaUzNPaFAwTUd6VGRyZ1Ni?=
 =?utf-8?B?OUdOQU9HMXpBaFh2T1BoVXRlSTd5dGtaa1hQcFdCdGxDUnNldDFzM285YVVZ?=
 =?utf-8?B?MExpazFxRTBGbjg4VHdRN1l5aHM5b1R4NUhFRmh6ZHY2WVczWDBGQzRlQllS?=
 =?utf-8?B?cUt0Y3l5ZXA1SGQ5dVhVbU0wWVhkRi9BOEVUSFU0ZGpkRUdRMmUxYWVKd0Zr?=
 =?utf-8?B?RGdDVEhoeXFsSGhjU09lUEhpVEErempUUFN5V1dtQ1BsY0VOSWZRem1scGZI?=
 =?utf-8?B?K1NXbDFsZ3hqelRuR09GUnM3QnltdzV3ZFgxQXZmVFVPQS9qUnh1VHBKUWhG?=
 =?utf-8?B?MWNyMUIwenhnRHV3TTBFWUlWd3I5ZDdlSFZqeXFxQ3prb0tqcWJYZXErNjQy?=
 =?utf-8?Q?khcExZ0LwcU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czJzaHBpVGFWYUZSWlU1bm1iYy96ZWpJbVVNbXZDZzZaREwwVzNKMVJtaU1N?=
 =?utf-8?B?V3UrTlBnWWlKZVhBMVArSjh4SHBYcEFRZEQ1M2hpS2p0dUc4TFdGY0tONkZt?=
 =?utf-8?B?OU1OYVRLY21ZQWxmWmVVNUdOQTRldCtUVXFmdnVZa3h3a0xxSHJtUEE3aGdr?=
 =?utf-8?B?RmFhZE1vSEFUVVVGcmtYZ0xFZWlJUUVCQk1WdXYyRk1XR3Ztci9neXliNU42?=
 =?utf-8?B?bnQzZ0twTU0xSmxyWUxzMk5SZXhyaEVqVzE5WENwTWJ2bDJDUjBwUExCUUxo?=
 =?utf-8?B?R0F0ampTMzRWQVJNU2Z6c3hZenpQcEZiNU5tVVZGVkliTU1QK0xPZ3BDS1R1?=
 =?utf-8?B?cnM5YWJYZWhic01ZdlVHWEpqZ3JHM3d4bHdscFVhZk8reEdWOGNzZU5JQzNh?=
 =?utf-8?B?WG5xS2x1b29KU0JWeThUa2N1dGc4VitZMFZ2ZVJPWmtrQmRoeVllVUhPUnZD?=
 =?utf-8?B?ejAxaGhkZU8vQXFjMm9pYjVBci9Dbm44RUFsUFB1bHhLWTdYd09zejRrcGR4?=
 =?utf-8?B?Qm1tcnhhTWFKUU1zTit6b2dQNWRZcHkwUUtUdGlBLzVBdlVRdjVMS2JySTdw?=
 =?utf-8?B?ZFJINS80SEgxTHRYdVRsQ2dxZGFVMzNzaG56b0V2ZUJLZVNiekRxL3duQjla?=
 =?utf-8?B?c3J2dC81MnozU1QwUlN2TzJ1d0cwczAxcldiOGl2eDJpeHJTS2FjV3pOc0xS?=
 =?utf-8?B?Rk1zaWFtWXoya2l4cnNBTGZ5MlFWaTdSb2JqRjF5M1E4RWtBTmRNSjdxSUFJ?=
 =?utf-8?B?ZHpMcHloK1JXM0F3YWt0T0tpbmZCaUFhaXhLWElHL3NaeldJcHpJUGd4K1Q4?=
 =?utf-8?B?Mlk1WU5JaWEyaDlIckM2L2pKYzRnclduc1NLeHREVkkwdjg3R1ZPZ3R5bTNU?=
 =?utf-8?B?b3pOQTN0RGlmK01pa0ZPK3h5R1J5bm5ONnEwT0lQeWxNWTVuZzgvSDdXOE9w?=
 =?utf-8?B?cU1aakgyb1JmZys0L0hEbVEvVUxRVkRDdDJKWU42RnNyVnFjK2dHTDdFblBX?=
 =?utf-8?B?VCtjUWdUeEZFVWZuRWlkcmw1WnVXZkNobFVHaVBFQW1jR1c2b2JZdkdkdFVl?=
 =?utf-8?B?TDlwQUJONjNtV2RRbWpIc2NJZjZzcUhmQTc3cUw2L256TEdYUTREVExORjRh?=
 =?utf-8?B?VVNzRFMwckcrcDJrM3JNcSt0YUhZWmwyUnMyU09LVkZpMFN2Sm1Bc2ptdjFC?=
 =?utf-8?B?VXBsTG1RdE40aExzV3ZWeU9WREhaWTZSc0RMejhYV25GMVVnM3FzV2hnQUQ5?=
 =?utf-8?B?WG1jMHROZmU3MW15cU9qS3JFZ1hRTVhMV1VQN1JWVzVBdy9tVXc3K044eUpa?=
 =?utf-8?B?RWN1djVkbU9yS1RsZW9oUXAxQ2M3VEhzZG1mNlVOelpZQUdjcGp3Y3hnQzNV?=
 =?utf-8?B?Zmo3dmVlZDk1UU9tWVBTT0thL1dZTHJNRnpwbU9ZRlBZUC9CR2NqUnNNS2lz?=
 =?utf-8?B?VmFqaXZmL3ZUeHAzbHN5dTBTcWo1QmNSQjFMRzlOeVFSMGhrN0o1dGM5bEhU?=
 =?utf-8?B?b2NKTEFWVDFSeVB3VGJpMVVxU0s4NUpGZjIwSXY3cXVsLy85VkVXR21EUUha?=
 =?utf-8?B?bFJLNngwMjlWaUp2RDU3aEhGS0QrRjBBLzgwbXJuQk52SWN1a2szSXppUnlG?=
 =?utf-8?B?VFBxSjFhdHJvUEpnUlZiN0VOM2syWGJ3Y3ljUzVvOXlyUUV0cFlRb09OV2hX?=
 =?utf-8?B?eGtpTCtYeVJ0SlZlbG1Ca3ZOVXBnaXBWcGtQcGxBdDI2dm1pQldOc1Zwdk56?=
 =?utf-8?B?YzdXQ2g5RStjWVhuVEIzKzVPVnF2TE5tY0RGUmgrSFlXYUlJbjBkazdGd3R0?=
 =?utf-8?B?Vi9wNnhwcUY0bkt1bVdKRWh6L2Y0L2hhR0FUUGFVbmVXUHI4ZFhRanp2dVpQ?=
 =?utf-8?B?L2c2K2VYd2dGQTZFeStSYUVuL09PR2hBRjJ5dzVoZW00ekVhejBMSmRvdXVV?=
 =?utf-8?B?NnloY2pMS0wwYk9DenVDY05VTjFObFJHbDBkdDVCOHBMcWJzMnQxWDRHVTNx?=
 =?utf-8?B?TGJ5V2ZQVU8yejE3bjVCR1BNa0pYbjNmL0xXUlJZd0pJWVhwYW8xckxTVHJZ?=
 =?utf-8?B?SU1acEZWYW9GOU5DcXhMTXZPTm80WUYvSm1qSVdsTHBQdnRTQXZlY3VFSTAy?=
 =?utf-8?B?SWV2dndEeVNlZHlzYkxrZHZoUHVYUGJYWGtHZEVoWGVpQnBXYlR5bDJiTFFa?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f766f0e2-b8d8-42d2-4db4-08dddb6665e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 19:11:39.9385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +lAlCGjr5ARzOCNXKuDYnmTbDDaeXqiCDaCggvybVgze9gtzJ3vmRRbWsVc/sFpqTFxtsyW5Lralpme1D+J0yO4WLppHAyQoQnBLh2GTuLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6618
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgQXVndXN0IDE0LCAyMDI1IDEyOjA1
IFBNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCkNj
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJo
Zy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IEtlbXBj
enluc2tpLCBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgVmlzaHdh
bmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29t
Pg0KU3ViamVjdDogUmU6IFtQQVRDSF0gbGliL3hlL3hlX3NwaW46IEFkZCBhZGRpdGlvbmFsIE1J
X0FSQl9DSEVDSyB0byBwcmVlbXB0YWJsZSBzcGluIGluaXQNCj4gDQo+IE9uIFRodSwgQXVnIDE0
LCAyMDI1IGF0IDA2OjUwOjEwUE0gKzAwMDAsIEpvbmF0aGFuIENhdml0dCB3cm90ZToNCj4gPiBB
ZGQgYW4gYWRkaXRpb25hbCBNSV9BUkJfQ0hFQ0sgdG8gdGhlIHNwaW4gaW5pdGlhbGl6YXRpb24g
ZnVuY3Rpb24sDQo+ID4ganVzdCBiZWZvcmUgdGhlIGNvbmRpdGlvbmFsIGJhdGNoIGJ1ZmZlciBl
bmQsIHdoZW4gcHJlZW1wdGlvbiBpcw0KPiA+IGVuYWJsZWQuICBUaGUgTUlfQVJCX0NIRUNLIGZv
cmNlcyBhIHByZWVtcHRpb24gaW4gdGhpcyBjYXNlLCB3aGljaCBjYW4NCj4gPiBhbGxvdyBhZGRp
dGlvbmFsbHkgc2NoZWR1bGVkIGV4ZWMgcXVldWVzIHRvIG1ha2UgaW5kZXBlbmRlbnQgcHJvZ3Jl
c3MNCj4gPiBlYXJsaWVyIHRoYW4gaWYgd2UgcmVsaWVkIG9uIHRoZSBhdXRvbWF0aWMgdGltZW91
dCBvZiB0aGUgZXhlYyBxdWV1ZS4NCj4gPiANCj4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzU3ODMNCj4gPiBTdWdnZXN0ZWQt
Ynk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGlu
dGVsLmNvbT4NCj4gPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+
DQo+ID4gQ2M6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgPG5pcmFuamFuYS52aXNod2FuYXRo
YXB1cmFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBsaWIveGUveGVfc3Bpbi5jIHwgNCArKyst
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3NwaW4uYyBiL2xpYi94ZS94ZV9zcGluLmMN
Cj4gPiBpbmRleCAyNWY3NTU1ZTI3Li5iM2E5MzdmZTgwIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi94
ZS94ZV9zcGluLmMNCj4gPiArKysgYi9saWIveGUveGVfc3Bpbi5jDQo+ID4gQEAgLTMwLDcgKzMw
LDYgQEANCj4gPiAgDQo+ID4gIGVudW0geyBTVEFSVF9UUywgTk9XX1RTIH07DQo+ID4gIA0KPiA+
IC0NCj4gPiAgdWludDMyX3QgeGVfc3Bpbl9uc2VjX3RvX3RpY2tzKGludCBmZCwgaW50IGd0X2lk
LCB1aW50NjRfdCBuc2VjKQ0KPiA+ICB7DQo+ID4gIAl1aW50MzJfdCB0aWNrcyA9IHhlX25zZWNf
dG9fdGlja3MoZmQsIGd0X2lkLCBuc2VjKTsNCj4gPiBAQCAtMTY3LDYgKzE2Niw5IEBAIHZvaWQg
eGVfc3Bpbl9pbml0KHN0cnVjdCB4ZV9zcGluICpzcGluLCBzdHJ1Y3QgeGVfc3Bpbl9vcHRzICpv
cHRzKQ0KPiA+ICAJCQkJICAgb3B0cy0+bWVtX2NvcHktPmRzdC0+bW9jc19pbmRleDsNCj4gPiAg
CX0NCj4gPiAgDQo+ID4gKwlpZiAob3B0cy0+cHJlZW1wdCkNCj4gPiArCQlzcGluLT5iYXRjaFti
KytdID0gTUlfQVJCX0NIRUNLOw0KPiANCj4gQnV0IHdlIGFscmVhZHkgaGF2ZSBvbmUgdGhlc2Ug
YXQgdGhlIHRvcCBvZiB0aGUgbG9vcDoNCj4gDQo+ICA3MiAgICAgICAgIGxvb3BfYWRkciA9IG9w
dHMtPmFkZHIgKyBiICogc2l6ZW9mKHVpbnQzMl90KTsNCj4gIDczDQo+ICA3NCAgICAgICAgIHNw
aW4tPmJhdGNoW2IrK10gPSBNSV9TVE9SRV9EV09SRF9JTU1fR0VONDsNCj4gIDc1ICAgICAgICAg
c3Bpbi0+YmF0Y2hbYisrXSA9IHN0YXJ0X2FkZHI7DQo+ICA3NiAgICAgICAgIHNwaW4tPmJhdGNo
W2IrK10gPSBzdGFydF9hZGRyID4+IDMyOw0KPiAgNzcgICAgICAgICBzcGluLT5iYXRjaFtiKytd
ID0gMHhjMGZmZWU7DQo+ICA3OA0KPiAgNzkgICAgICAgICBpZiAob3B0cy0+cHJlZW1wdCkNCj4g
IDgwICAgICAgICAgICAgICAgICBzcGluLT5iYXRjaFtiKytdID0gTUlfQVJCX0NIRUNLOw0KPiAN
Cj4gTGluZSA3NCBpcyBoZXJlIHRoZSByaW5nIGxvb3AgcmVzdGFydHMuDQoNCkkgdHJpZWQgcmVt
b3ZpbmcgdGhlIHRvcCBNSV9BUkJfQ0hFQ0ssIGJ1dCB0aGF0IGNhdXNlZCB0aGUgdGVzdCB0byBz
dGFydA0KZmFpbGluZyBhZ2Fpbiwgc28gaXQgbG9va3MgbGlrZSBib3RoIE1JX0FSQl9DSEVDSyBj
YWxscyBhcmUgbmVjZXNzYXJ5Lg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IA0KPiBNYXR0DQo+IA0K
PiA+ICsNCj4gPiAgCXNwaW4tPmJhdGNoW2IrK10gPSBNSV9DT05EX0JBVENIX0JVRkZFUl9FTkQg
fCBNSV9ET19DT01QQVJFIHwgMjsNCj4gPiAgCXNwaW4tPmJhdGNoW2IrK10gPSAwOw0KPiA+ICAJ
c3Bpbi0+YmF0Y2hbYisrXSA9IGVuZF9hZGRyOw0KPiA+IC0tIA0KPiA+IDIuNDMuMA0KPiA+IA0K
PiANCg==

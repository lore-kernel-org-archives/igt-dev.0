Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19490606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SgLkheHn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8804510E529;
	Fri, 23 Oct 2026 06:14:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9044210E529
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 06:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792736017; x=1824272017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z91moPGtMd+E1Hmn9Dl0wYgcDNOPhIdwek0kxuIlCWs=;
 b=SgLkheHnXElkCRZXQi2P46yedT8TbgB7Iv8o3fDMLMTLD+YUI2FCG/xy
 pJ8WaFwLggJVCsRnpyXOmXS97UlDmqlfnY29SAYmm3YOoSUJU9VbMCfD+
 ysRQfXvQXgzTaeDBJgHlDGxFVtY/FvfcmbN5rH9iZU5+wg9Hx1yFZJ5ZQ
 aP7Rb0TpnfuwIIhRB38/wE45eTfiPc0BkOMZ4acGVo99jOyYnFpaZh0by
 YLFrqLQS5QfrJhvEcjALBj6gwiiLGkrJ9FVEiNm/JdYNijgyCDMPtqPKM
 8VmyorjT5cOXA4Wgj+OhSCaL1z4/VH5lmXRsxDrj90UFsyKIzeyHgXn+d A==;
X-CSE-ConnectionGUID: 4P5h5TF8QCWZtaq27jrPyQ==
X-CSE-MsgGUID: s8PJPKnJS7+7FgMLTCZxLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1386944"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1386944"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 23:13:36 -0700
X-CSE-ConnectionGUID: tnIigxMRTVSOaBqQrvQLkA==
X-CSE-MsgGUID: /c4RpB+NQMqF9fOFpsk6lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3436424"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 23:13:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 23:13:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 23:13:35 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 23:13:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywXyRzFLdIxijDEWWMglWq9Nb/kUv7VcysdwGMb1eRcUoBd0NgXXUHOLaFxzxsH047V6Gcn3l6mPhj7TJvc6AjSr0cP84FnUGiV3vLB1ySiOMbwVpcDhdJQK2LZ33NgEd7faMPINg7O18LO25YZ957+FsJYe39rSxKI0L5yPXIKiRq0lmULxOjpMcSIq+HwUQMDlJPTgbgUX3l1yVLDUmXlFxIRIz77+seFoANLmljo3Y+vTrOxyXQr1nrJoA/9fTkZeX41ascw/FvBwjX6NrkDlj+K4poYAPB2qRsYUllX/8mZChf/K+CCySzVlUzX4JxNngFlV7D5mz7HBTazLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z91moPGtMd+E1Hmn9Dl0wYgcDNOPhIdwek0kxuIlCWs=;
 b=VBClS1CtYcziTWOocQ//y9jt3g1U5PA2NFKz6aXwhydGL2/DLPIM93jQgVTAHsJL/eQYnrWHxF+wioWiU9US2XP/jR5Vd6vM59LM77L/TTtI3K0pgd5Hz9C+TUWoxmnRy1ryCvldZ5bPf5lKGlRH+s9jdiWaZeBmY1YLZ9zO16xcFgA0uu5mZMMxmnLPlWtHRdNmoK5MBfETI1z6lEO6IaAkRQRgEggir4/Un0Xh/EhqAbSVGcs55bLuIxqgZSccUF4enlvGY28QjwfqAEqNdAjz+BZDwlTm1zxSG6IOc9nNhNp065K3Op8wQUJ3HW4gqBXTFWMh9a5h7leCIGIKCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA3PR11MB365394.namprd11.prod.outlook.com (2603:10b6:806:510::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 06:13:27 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 06:13:26 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Grzelak,
 Michal" <michal.grzelak@intel.com>, "B, Jeevan" <jeevan.b@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: RE: [PATCH i-g-t 1/3] tests/intel/xe_fault_injection: Reload audio
 driver on exit
Thread-Topic: [PATCH i-g-t 1/3] tests/intel/xe_fault_injection: Reload audio
 driver on exit
Thread-Index: AQHdXLEEnZ5tGFZnM0Kv63qVP7scUrcKpQcQ
Date: Fri, 23 Oct 2026 06:13:26 +0000
Message-ID: <PH7PR11MB605341BE26FF6FE68947F4D3E7642@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA3PR11MB365394:EE_
x-ms-office365-filtering-correlation-id: 9b7998d1-8dde-42e5-718a-08df30ccc046
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|261021123027099003|38070700021|261022105027099003|261022075727099003|56012099006|5023799004|11063799006|261009223027099003|10067099003|261021121427099003|18002099003|22082099003;
x-microsoft-antispam-message-info: +uRyIArVbP7jKdHXt6NuR9QLNZhJ14XikOocyDIIPFFxigWgq4AJyDJxu6iiVDd+zieUaEFCJRR2yglz0egGH6E+g161pATL2UpsQUy3qQZkhKMYoj6iIABejmEWb1m1M/dpfhZO3CQEWVN/XJxQbYoRHDC+uCNzTnt7VRlT9ZFcSikCUb/eN6tOV7lnYuMnAbXGVrQu8+MwC48NYHUTiP2Xk+00Jmt7A7WhQiMU2qd5JrCDP8CJgPaBKgJsnxbAvKEnCpjK1q/rfgvfA5J9h9NpBVz1EzsF929SMYk3j+IDZy/EUKw7tqn+dU3QfPyxZBrkdZj1iYXrWeNpy4CsXfI0v/AYvLDG06buylh7JTqACw2BRWKHpIivxgUfRisoVbXAeb38VHW74Jm+Wif0kDmYZ31K/+XUBnJFq7YTEKG/gX5Bbjumt9w8TwARjuYhPBZkDsnjWBRtRSOGBfz79JyuhruBPbqj/HFu/79kq0VycW04VkdS9a6YdVSci5Easr1E4XSY0g1o3x3MkqQCktyBMIn9vC59FXlI5tGMxUpMTDB1oWrjFdBaPwN5Avogjs8iHVCY9WaEtHDSsnXk0UKONWAbfnRaOXpQREjgM90rVilRadbyDydFPjjp8Wwy0kb4qkuxXbTFNauc220wNT9e3ZtcMoll+E4llbSvMnoeXKHM8tYDeMR6AoFoVldfAba3x2BuiAPa+HJctJYPFtzEogQjz3y1We806JZMuew=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261021123027099003)(38070700021)(261022105027099003)(261022075727099003)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(261021121427099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTFmNC9GMnMyYWRxWjF2ank2UWlCd1NPRTRwSW1VRnA4Lzc5QmdRazVEOG5V?=
 =?utf-8?B?Y25xdjl3eWYxNnlUcDA1Zis2cG5jUHNXTFhXMVZwbFJwNzBFSVBBcE5ncWJD?=
 =?utf-8?B?aFFoN3ZLZnRaNXlCZzdQT0hVUHlvQ0dSL0dHMkwvcjJGc0FxQ1VRa1hPdTJU?=
 =?utf-8?B?TlpmYjh0bjBOK0FvZmh5cThiTmQ5alZvQVNOMFNRNE5qRmlIUXByK1h5ZlQ1?=
 =?utf-8?B?WU5UQy9oNmJCMlZuVlVmV0x4dmVHZ2lIWXlpaDdSMUFmZkFpKy9QeXg0dVBD?=
 =?utf-8?B?eFlMK3QzamxrTTVuVHV0bkFpUWE4ZW1XUWRXTzh6b1Bzb1YwS2xQeVBpa1lQ?=
 =?utf-8?B?ejhlVEFRRStLNldGRTAyckM4U1A5KzhiSTlzN2VoZzNtd1NwOTRxSTc5Nk94?=
 =?utf-8?B?VDh4WkRsQmcyQ0d2bDhzOElOL2syZ2syRS9sejRDd2JIZGVHKzY2eWtkZHBm?=
 =?utf-8?B?L0ZjSWd4YWptRXVlSXpGU1JlSWU5ZzRISDYxSUYxTmtIcnRJQUF3VUZZQUhv?=
 =?utf-8?B?bzJkU201ckd4aThpYVE1OGlwUUpZT0R1NDd1c3ptbmRaU0xyUDU2cHNnUnF0?=
 =?utf-8?B?enlsLzNWOWdlbEl3aHVVakpNMmN3MERSbUI2Q3l6YXFqWTd2L3dQQTMzbFFK?=
 =?utf-8?B?bFdvaXltZmJLY1NJN1E4NDF3RWpTeGZ1cU5iQ0pKTXA4MnhKVmdSdVJONzM5?=
 =?utf-8?B?d1lxaTdWNXNxT0xCMWE2N2YvL0xGOTlVSGVkU0piSGpHcWNFbmxmRHNRUFBn?=
 =?utf-8?B?VVBtRzBheU9XWk5Sb3ptNWFuUUV2dVp5dnFDMTJGbzJWQ1BUcDQ3TFdKM2R4?=
 =?utf-8?B?Wk9zd05xMkhsMWo5aStJVnBybUdpSkM5L09wejJPVFJ2SjVJRjhqL2lxKzhI?=
 =?utf-8?B?ci9hTTRjekVGN1ZMSWNpZDZ5VXA3Sk1FOGlweE9RcDgrbHlPVk9qcXBxSmRv?=
 =?utf-8?B?T2lYQlU5QlNrNUd6K2E3M1UzOUhVY2FJZ1ViSzlzUVVuRlNuUlNhRW5oVUg4?=
 =?utf-8?B?bWNHbzNXTk1xS2dJZ3Yrb05nS0JKc1FWeTg5eGNPVExuYzR5c0M0Mks2SzRp?=
 =?utf-8?B?MXRmSERHWXlHcVcybm1TY1cyYUtuYmNqTUEzMSthRk5uWXl6czNiZnhzNHNR?=
 =?utf-8?B?am9kRUNXSFlKOFkvTDZ0eVBkK0c1SWtyemppOUsvRHJjMFBCZld0SDI3dTRU?=
 =?utf-8?B?NWt1d0xLYlFuYjV4ZURqSGRaa1d4VFNkNnh2ckI5Wmg5V0pRUmlZb2tudSsz?=
 =?utf-8?B?YVZPdzRidk5waE9XY3ZjSk1FQUs2UTdubE91ZTdIQ1NRZk5JSnNOcjkvMGU3?=
 =?utf-8?B?UmFwYy9oUmd5UFMzQ2hRMmhiZjZuTGRFUUpPRi9NdDRxdlcyeXkvamxJL3NU?=
 =?utf-8?B?RGNMblZySndCSm84MC9QdkQrN0ovSjN4cTVoVHZLSW5QYXFwaEVyNmhNVkFN?=
 =?utf-8?B?bHljbjVhU2RtZGpUM0xhYW1TWjlFSHNKYnl1NFRSUU1jdzlidEd3ekFiVVZj?=
 =?utf-8?B?NTQzK1lJSUlXZUExbStiTEtlbzhaUG96bmxlZExjbDErQ3FKWHpmRGpDS3Jo?=
 =?utf-8?B?bUxLeXJYaHhjcW5QMHg1a1VQazdWbk9IS1JlZ25FMnBMeDdLY05KYSs3aGNj?=
 =?utf-8?B?VEt3TVFicmpFMStNMHpuVDIyTU5ORzMzS3ZBN0plQlptWkNyYWRWdU1kbVVQ?=
 =?utf-8?B?bEx3eHJ0dGl0eGpSQkN1TzROUDhUN0tkbndza2swZElIREZLU3lkWHVVVUNI?=
 =?utf-8?B?OG5zMmtiYW5TQm9PVlpSUzkxbVN3ZTd0RnZTdGRKSEpZLzFlWEhXeE11U3ZR?=
 =?utf-8?B?bWdkOGxQTDlyNlA3cG55eTliWGpaOU40eUhXUHRqQ25Dc2NxcXBZUk4rUnNk?=
 =?utf-8?B?eTZ1NnRYRVI3MFpGL1hjcFJhTTBwcm5kRHppdGI1UjJFMWFvNlBrcnVYdWY4?=
 =?utf-8?B?WG5BRGQxbERsZG40U2dBT3BoWU1CZDFWQnpEVUNGN1hRZGg0R3pITHpUcHpt?=
 =?utf-8?B?MFFocmJQN05UL2dTb3RBMmhJbFNML2N1c01NT0c0T0h3TUc1bWxiMXpISzIr?=
 =?utf-8?B?aEFTOUtRNnlsOUxCQWJPZUJJLzVNU0dhZmp4eDdSMCtJL1VlNHN2N3BPSEhq?=
 =?utf-8?B?bks3Nkdaak5YNmZQeDJaYWxCbWJPSVdrS1R6ZHBMS3ZWZlR6TVB5b3JQalZo?=
 =?utf-8?B?T3RiUG5hbkd3aUVyQTlqWkFWZzc0ZFhhYzl0RjVuT0pjK1J6S1Z2T3c2UFhh?=
 =?utf-8?B?aGtlWVpab2Irb2lqeFFRbGtpZ1BZRUVCUDJDM1UyNlNuZlZlYzZmeDJaeEMz?=
 =?utf-8?B?azZFTG42OEEvWk5ieFgxL3ZaNzRuN05WelNrYzJhSlZtR25hVGordz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TBvGBLIdZMGcq6Mt5RSXDptA4OqOvDmi0dU8NX+XBcu80xWwGvMp8l79ZEUwON6iZRwsD9Qdgk1gwUH4dPfXa/2VNeLLNiRunLwZW3IgSHx8n2oqZIbcWUjXNJnh/pI2mFjeS+SBLDZj1f6vo3LpekXgM25bpJfSSuDklBmdaVq7UZk7ROhZjcKYwDDuqgczvAo/0ksS1B/tpmxgVeqkpROH+jxnA+lOPdLeix2Q7nlgyWLeOJis0rs6YlOCaWFvPjAmSOeYugmw6q8sdltsLgMLnqOUo0+zObMA2dYYJbdf4WjHoztiCNXdzbFMbJ16ywc7J2uhk/jZ14ACXxz8Ew==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7998d1-8dde-42e5-718a-08df30ccc046
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 06:13:26.6813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMrPkBkTKtxdrMhOQ+Dx44b0PUfuJUXgTMe1J3tE/b9ppmF7slyfX/2LBZSoGfATux6+e/RYeCEggqh9+/AXvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB365394
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQ2hhaXRhbnlhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGln
dC1kZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
Zg0KPiBDaGFpdGFueWEgS3VtYXIgQm9yYWgNCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTUs
IDIwMjYgNzozMSBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+
OyBHcnplbGFrLA0KPiBNaWNoYWwgPG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT47IEIsIEplZXZh
biA8amVldmFuLmJAaW50ZWwuY29tPjsNCj4gU2hhcm1hLCBTd2F0aTIgPHN3YXRpMi5zaGFybWFA
aW50ZWwuY29tPjsgRHVnYXN0LCBGcmFuY29pcw0KPiA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IDEvM10gdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5q
ZWN0aW9uOiBSZWxvYWQgYXVkaW8gZHJpdmVyDQo+IG9uIGV4aXQNCj4gDQo+IENvbW1pdCAxMTdl
OWVjYmRkMWQgKCJ4ZS9pZ3Rfa21vZF91bmJpbmQ6IHJlbGVhc2UgYXVkaW8gYmVmb3JlDQo+IHVu
YmluZGluZyB4ZSIpIG1hZGUgaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQoKSBiZSBjYWxsZWQgYmVm
b3JlIHVuYmluZGluZw0KPiB4ZSB0byBhdm9pZCB0aGUgYXVkaW8tY29tcG9uZW50IGJpbmQgd2Fy
bmluZ3MvZXJyb3JzIHRoYXQgaGFwcGVuIGlmIHhlIGlzDQo+IHJlbW92ZWQgd2hpbGUgc25kX2hk
YV9pbnRlbCBpcyBzdGlsbCBhdHRhY2hlZC4gVGhlc2UgY2FsbCBzaXRlcyBwYXNzZWQgTlVMTA0K
PiBmb3IgdGhlIHVubG9hZGVkIGRyaXZlciBuYW1lLCBzbyBpdCB3YXMgbmV2ZXIgdHJhY2tlZCwg
YW5kIG5vdGhpbmcgaW4gdGhpcyBmaWxlDQo+IGV2ZXIgcmVsb2FkZWQgaXQgYWZ0ZXJ3YXJkcy4N
Cj4gDQo+IEFzIGEgcmVzdWx0IHNuZF9oZGFfaW50ZWwvc25kX2hkbWlfbHBlX2F1ZGlvIGlzIGxl
ZnQgdW5sb2FkZWQgZm9yIHRoZSByZXN0DQo+IG9mIHRoZSBib290IGV2ZW4gd2hlbiBldmVyeSBz
dWJ0ZXN0IHBhc3Nlcywgc2luY2UgdGhlIHRlc3QncyBvd24gdGVhcmRvd24NCj4gb25seSBldmVy
IHJlYmluZHMgeGUsIG5ldmVyIHRoZSBhdWRpbyBkcml2ZXIuDQo+IA0KPiBDYXB0dXJlIHRoZSB1
bmxvYWRlZCBkcml2ZXIgbmFtZSBhbmQgcmVsb2FkIGl0IGZyb20gdGhlIGV4aXQgaGFuZGxlciwg
d2hpY2gNCj4gSUdUIGd1YXJhbnRlZXMgcnVucyBvbiBib3RoIG5vcm1hbCBjb21wbGV0aW9uIGFu
ZCBhIGZhdGFsIGFib3J0Lg0KPiANCg0KU2luY2UgdGhlc2UgZml4ZXMgZnJvbSBhIHNwZWNpZmlj
IGNvbW1pdCwgYmV0dGVyIHRvIGFkZCBmaXhlcyB0YWcgaGVyZS4NCg0KPiBDYzogTWljaGHFgiBH
cnplbGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IENjOiBKZWV2YW4gQiA8amVldmFu
LmJAaW50ZWwuY29tPg0KPiBDYzogU3dhdGkgU2hhcm1hIDxzd2F0aTIuc2hhcm1hQGludGVsLmNv
bT4NCj4gQ2M6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogQ2hhaXRhbnlhIEt1bWFyIEJvcmFoIDxjaGFpdGFueWEua3VtYXIuYm9y
YWhAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5j
IHwgMTMgKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZmF1bHRf
aW5qZWN0aW9uLmMgYi90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiBpbmRleCBl
MzJmODQxYTMuLjM3MTNhYmUyMyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZmF1bHRf
aW5qZWN0aW9uLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4g
QEAgLTMxLDYgKzMxLDcgQEANCj4gICNkZWZpbmUgTUFYX0lOSkVDVElPTlNfUEVSX0lURVIJMTAw
DQo+IA0KPiAgaW50MzJfdCBpbmplY3RfaXRlcnNfcmF3Ow0KPiArc3RhdGljIGNoYXIgKnNuZF9k
cml2ZXI7DQo+ICBzdHJ1Y3QgZmF1bHRfaW5qZWN0aW9uX3BhcmFtcyB7DQo+ICAJLyogQHByb2Jh
YmlsaXR5OiBMaWtlbGlob29kIG9mIGZhaWx1cmUgaW5qZWN0aW9uLCBpbiBwZXJjZW50LiAqLw0K
PiAgCXVpbnQzMl90IHByb2JhYmlsaXR5Ow0KPiBAQCAtMTk2LDYgKzE5NywxMiBAQCBzdGF0aWMg
dm9pZCBzZXR1cF9pbmplY3Rpb25fZmF1bHQoY29uc3Qgc3RydWN0DQo+IGZhdWx0X2luamVjdGlv
bl9wYXJhbXMgKmZhdWx0X3BhciAgc3RhdGljIHZvaWQgY2xlYW51cF9pbmplY3Rpb25fZmF1bHQo
aW50IHNpZykNCj4gew0KPiAgCWluamVjdGlvbl9saXN0X2NsZWFyKCk7DQo+ICsNCj4gKwlpZiAo
c25kX2RyaXZlcikgew0KPiArCQlpZ3Rfa21vZF9sb2FkKHNuZF9kcml2ZXIsIE5VTEwpOw0KDQox
LiBpZ3Rfa21vZF9sb2FkKCkgcmVwb3J0cyB0aGUgZmFpbHVyZSByZWFzb24gb25seSB2aWEgaWd0
X2RlYnVnKCksIHdoaWNoIGlzIGJlbG93IHRoZSBkZWZhdWx0IGxvZyBsZXZlbCAoaWd0X2luZm8p
Lg0KU28sIG9uIGZhaWx1cmUgaXQgbGVhdmVzIG5vIHRyYWNlIGluIG5vcm1hbCBydW4uIENvdWxk
IHdlIHN1cmZhY2UgaXQgYXQgd2FybiBsZXZlbCAoaWd0X3dhcm4pPyBzb21ldGhpbmcgbGlrZSwN
CglpZiAoaWd0X2ttb2RfbG9hZChzbmRfZHJpdmVyLCBOVUxMKSkNCgkJaWd0X3dhcm4oIkZhaWxl
ZCB0byByZWxvYWQgJXNcbiIsIHNuZF9kcml2ZXIpOw0KDQoyLiBTaW5jZSB0aGUgcmVsb2FkIGlz
IHBsYWNlZCBhZnRlciBpbmplY3Rpb25fbGlzdF9jbGVhcigpLCBpdCBkZXBlbmRzIG9uIHRoZSBj
bGVhciBzdWNjZWVkaW5nLiBpbmplY3Rpb25fbGlzdF9jbGVhcigpIA0KY2FuIGFzc2VydCAoaWd0
X2Fzc2VydF9sdGUoKSBpbiBpbmplY3Rpb25fbGlzdF9hZGQoKSksIGFuZCBhbiBhc3NlcnQgZmFp
bGluZyBpbiBhbiBleGl0IGhhbmRsZXIgX2V4aXQoKXMgc3RyYWlnaHQgDQphd2F5IChpZ3RfZmFp
bCgpIC0+IGluX2F0ZXhpdF9oYW5kbGVyKSwgc28gdGhlIHJlbG9hZCB3b3VsZCBiZSBza2lwcGVk
IGFuZCBhdWRpbyBsZWZ0IHVubG9hZGVkLiANCkNhbiB3ZSBtb3ZlIGlndF9rbW9kX2xvYWQoKSBi
ZWZvcmUgaW5qZWN0aW9uX2xpc3RfY2xlYXIoKSA/DQoNCkRvIGNvcnJlY3QgbWUgaWYgSSBoYXZl
IG1pc3NlZCBvciBtaXNyZWFkIGFueXRoaW5nIGhlcmUuDQoNClJlZ2FyZHMsDQpQcmFuYXkNCg0K
PiArCQlmcmVlKHNuZF9kcml2ZXIpOw0KPiArCQlzbmRfZHJpdmVyID0gTlVMTDsNCj4gKwl9DQo+
ICB9DQo+IA0KPiAgc3RhdGljIGludCBnZXRfcmVtYWluaW5nX2luamVjdGlvbl9jb3VudCh2b2lk
KQ0KPiBAQCAtMzEyLDcgKzMxOSw3IEBAIHN0YXRpYyB2b2lkIHByb2JlX2ZhaWxfZ3VjKGNvbnN0
IGNoYXIgcGNpX3Nsb3RbXSwgY29uc3QNCj4gY2hhciBmdW5jdGlvbl9uYW1lW10sDQo+ICAJCWZh
dWx0X3BhcmFtcy0+dGltZXMgPSBNQVhfSU5KRUNUSU9OU19QRVJfSVRFUjsNCj4gIAkJc2V0dXBf
aW5qZWN0aW9uX2ZhdWx0KGZhdWx0X3BhcmFtcyk7DQo+ICAJCWluamVjdF9mYXVsdF9wcm9iZShw
Y2lfc2xvdCwgZnVuY3Rpb25fbmFtZSk7DQo+IC0JCWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKE5V
TEwpOw0KPiArCQlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZCgmc25kX2RyaXZlcik7DQo+ICAJCWln
dF9rbW9kX3VuYmluZCgieGUiLCBwY2lfc2xvdCk7DQo+IA0KPiAgCQkvKg0KPiBAQCAtNjY4LDcg
KzY3NSw3IEBAIGludCBpZ3RfbWFpbl9hcmdzKCJJOiIsIE5VTEwsIGhlbHBfc3RyLCBvcHRfaGFu
ZGxlciwNCj4gTlVMTCkNCj4gIAlpZ3RfZml4dHVyZSgpIHsNCj4gIAkJY2xvc2Uoc3lzZnMpOw0K
PiAgCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gLQkJaWd0X2F1ZGlvX2RyaXZlcl91bmxvYWQo
TlVMTCk7DQo+ICsJCWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKCZzbmRfZHJpdmVyKTsNCj4gIAkJ
aWd0X2ttb2RfdW5iaW5kKCJ4ZSIsIHBjaV9zbG90KTsNCj4gIAl9DQo+IA0KPiBAQCAtNjgwLDcg
KzY4Nyw3IEBAIGludCBpZ3RfbWFpbl9hcmdzKCJJOiIsIE5VTEwsIGhlbHBfc3RyLCBvcHRfaGFu
ZGxlciwNCj4gTlVMTCkNCj4gIAkJCWVyciA9IGluamVjdF9mYXVsdF9wcm9iZShwY2lfc2xvdCwg
cy0+bmFtZSk7DQo+IA0KPiAgCQkJaWd0X2Fzc2VydF9lcShzaG91bGRfcGFzcyA/IDAgOiBJTkpF
Q1RfRVJSTk8sIGVycik7DQo+IC0JCQlpZ3RfYXVkaW9fZHJpdmVyX3VubG9hZChOVUxMKTsNCj4g
KwkJCWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKCZzbmRfZHJpdmVyKTsNCj4gIAkJCWlndF9rbW9k
X3VuYmluZCgieGUiLCBwY2lfc2xvdCk7DQo+ICAJCX0NCj4gDQo+IC0tDQo+IDIuNTAuMQ0KDQo=

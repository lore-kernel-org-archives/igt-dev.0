Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED12606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 17:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C9IBUCUa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE2010E3AF;
	Fri, 30 Oct 2026 17:39:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F7E10E300
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793381927; x=1824917927;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3EnAczyc8WI4iTTeu4jbhPDmIFRVoqFBqfcRP/NS0o0=;
 b=C9IBUCUarUPgUtbgbfjW9qC2M0xH4zUNDkH2zmbBMX6zwt2d88sxMwdJ
 TB3Yla3oHO0L5tDJ34tDVodBfzJXpw68cTlF5fg+zsnSSc/w10fA0dpg9
 xlDQzvvf+COx30b9IWeBPA2YovNC1kuxiJleTrsinLwiINwhprUci/Hwj
 rRQPSgd8zTWOLJQg4/6BUvRCemTq/HIeMCr2jfX5rPU2BQ1pav3dO8akf
 h4Gbw04Q+vzTXEZrU8L/iJJB4FOfFV1XuiPU87JHlhU2JlOTAwA9/Yly1
 lz3m/DrrfSQZE7InfZmFEQLQk8G8yfc8TATpfM2rGoyqWNZ9zJpuai0x8 A==;
X-CSE-ConnectionGUID: zznzBobUTYSQ4kD0YyGloA==
X-CSE-MsgGUID: iPvvTetnSmS42m1vSqxJ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2186298"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2186298"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:38:47 -0700
X-CSE-ConnectionGUID: Gbrac+LMSayr50Q7OoGaGw==
X-CSE-MsgGUID: 3QyQ45n+RZ+r3PpBxxrLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5460348"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:38:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:38:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 10:38:46 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhZyMDhRwb3s6IvcmKhHlgfNITxkkSvjW7eqfFiyt7h9tPl5PLtdiNXGBIIPJqTCwdCyxx1xjEO+r8r0nQI9Ff6zrvprubyiIVkW/yIc8ZI2OrMy+25KBKGs2igF8RXk1jSs9lPT7smwu82Sl0GO8Fgk54ct3o0ACN61AnfJnKkMvHRVg4hQJJYxa8C215+i+geuyh5S/3oFp7GzJDxbs2zskHk53MKnVParFpNi13Hl1s/ehGNGMu1QB7/bN9ynR9UzY0E0761qg4G3z+qRjiQ7mZW5mkm/pCWPe9hG+OBCbkvS9pUG59Ad+9CCslM/iyu2ohHnu79Wc7IJHFThzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlcySmkkkDX7rHkEw0+HWVaFi0mGFuPPMJ4aGFrDvCs=;
 b=igTM5GD5F82FfMG3QMKt+R5W6aLx/DLQ++IJa26CtNmJBdGDog+dME4826PL4T3EX5MQqCAIV2z1crKALHo/6CPXCNWMIjzEN4Mf/hZciFiq4KDq5wljpIiKSMi8WxfK2TmnOlBItB7lEzTLFvYLOMufwWbvdgNB2mHQlVsslmYdrMG5R4f6+9tRyz08Pn/5Fw1f2MIf+SKf6fpPauX8pjuiFpr5dqbtHCp2VE8RpiCO2vGlHJm0dcvjqlZ5qseKiHjIZOXv/JlFM20agdPyAdchxrgEfp0DoWDB/LYQm9qiH5DkEYWZ9zETmkcnosiVftmc79CRf2GtGqu+B8oYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Fri, 30 Oct 2026 17:38:43 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 17:38:42 +0000
Message-ID: <df72faff-2755-46e4-90aa-95446dc2a313@intel.com>
Date: Fri, 30 Oct 2026 23:08:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] lib/igt_drm_ras_nl: add event notify
 subscription and event wait support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-9-ravi.kishore.koppuravuri@intel.com>
 <fb9d81d4-dacb-414b-962a-b337994d09de@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <fb9d81d4-dacb-414b-962a-b337994d09de@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::11) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 5703205f-46ad-440a-0aa3-08df36aca422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261026140227099003|22082099003|18002099003|6133799003|261028144727099003|10067099003|4143699003|56012099006|261009223027099003|11063799006|261021123027099003|261022075727099003|261021135927099003|261022105027099003|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: p35MuRLR1b/6YFpVYVQJ8ww8OaF31f25dG0JjMKRxRkUp+VhdfXgBQEPsxnpBXpHdU04slFBUaW0mpaF/Vl807WmYUaIy8t+8OgnccXMvq5U9x576xvvXG6nBPYQOwSxQe6IhMqerVP3hKMT3MiOAjhZLEKz2sQ7l+pFmeV2PDUuvGJQAUogVmDn9qGH+0jTZ2l6gCLdDRAh7EWTHIpYE3x04FeonbnRuUNrQgNbXtgXbBYQEYxAxv5y200592mI63HJ2diRqTLyB7CHn2gJFFGVs8Oj5G7kMCvnmdD8pNd2vVALeFktYeoWwsr80yRXBeyW3n6vEg+wMLWmT800IrRiRlVwO4uZaX2MPH4xAkwzb5wYJyo347MjC7pSowXnsJ068wP1ID5JtPkQcdi2HXv3i/lw3Vwx1EF4HzsYO9Eucmpgg1iYuO5uJe3pe8G3NqaYfw40JT9vg/Wxi1FzEdrQiMuhMgKYvwjfRW+F+e0Yib5okY0i8lCW0r7QVlayoDR9UiPW+sVOWJBiBdazCr7nrQFRgBH4hVr0vhD3fSsIiALRYNy3gxhHs49P/utfIdQKP8EyVfojsB1ANmA/Lul6UZWN6IkLRvPak/H+O99gdJ1hrjGr0y/7uExyfQ5L1Bq6E3uzIl6ULU4UWLkoFcnVA8DrW5Km60WuLNz4ikY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261026140227099003)(22082099003)(18002099003)(6133799003)(261028144727099003)(10067099003)(4143699003)(56012099006)(261009223027099003)(11063799006)(261021123027099003)(261022075727099003)(261021135927099003)(261022105027099003)(261026121527099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTY3a3lQajJHb2tlQ1dsakpRckxZMVdDRlhvV0Rjd3lEU0ZwL0FBZ1pGNDRB?=
 =?utf-8?B?THQ1N1kvVmRIZk1NS1IzTmdSa2RKTzh3WFQ2MlhidE9HVlVHVFZmeTdYeFIy?=
 =?utf-8?B?Q1lWRFY0K0s5VFphTkhEL2FMOEdiSW5jelY0VDhOdkFPdUgwTXBwR3FRRDNq?=
 =?utf-8?B?a1dVc0M2K1RzUkZwSjY4UUdYUitXQkVOZkhVR254NDFpZTFtZS9rc3R2UEk5?=
 =?utf-8?B?aS9HVGdKSHNrelY4NllyQW9WZ3kzRC9CcHh1Rk9QTEE3RjF6MitTbjVSVCtn?=
 =?utf-8?B?UVY5RXJDZFROaXZWV1hFMUo1TzN2TVZHbGs0VWhDQlBiVHAzS0o4ck04YWVN?=
 =?utf-8?B?SFNnOFVCc216b3Rhdlp0SWE1SFpRL1BrYTE1alEzVTNEQ041WnRvWWp6YnhE?=
 =?utf-8?B?OW13dVJtK1dkak1XK2t0Sk5yRllta2hubzZXa21RWDFLcEVKMlZPN09pT3d6?=
 =?utf-8?B?SlN1c3NmNDRueEg4NEdZUWtwcTEvT0hIUE9vT3lMdStVQVErSGMwSmUzSGht?=
 =?utf-8?B?UkN4MnMvdUJaZEJTUi96YVFpdnFKR3drRVAzQUlQdXM1bUJhVUJBWlZ1SVkw?=
 =?utf-8?B?MHFzS0hQYStQK1o5YVdrTlVCLythU0VYQ2d0dmhiQVNUNWcxR2hqWlhCTEd0?=
 =?utf-8?B?VTJxVzlqSnlqVFBpSUFONlplM3NpV3cvSHdQR1ZwaW84SXVtVDZDWHBmZlJP?=
 =?utf-8?B?alhldlVVbmMyU2J3RUNaa1kyU0l4K0dxNVA5R2J3Znc1MERqSTNLS2tmQVdm?=
 =?utf-8?B?c3owQVFyQ3JQSE5WNXNwZENaUWVkeVRsN3YxczVGQ1NNT085UU1IUHdLR2k1?=
 =?utf-8?B?blFJVHlqVTZSdm85NUt3R3BsOEJRbUIwZmNMRlhZMFdOWXpHN1JtQXVtNC9q?=
 =?utf-8?B?ZjdHSHR3c3lVNkg5ZUx5WWJxekN0SzBmTzJ3VmczaHFyR3JQUnBoUFlRdGFC?=
 =?utf-8?B?bjVsMTlsZ3E3eVNJeFcxR1hOVEtxeWxEd3c0MDBOVVlxVFQ2Sm80OHJPY1Zk?=
 =?utf-8?B?aG5RN2dGMnpIc1ZFOTNNSVZoZXFyYTFYM0NJWm00THFRN3pva3pPRXBiQzY1?=
 =?utf-8?B?cm5MZTc1cTdPYVAyaytJTVIvSFo5azhWZEgxL3UwSnlzZVBsNW9MbHk0and5?=
 =?utf-8?B?NXdRWXVFN2ZjUXFXUEdNcXV0T2dvQk0wbVBIM2VzZVRUalQ3NGR0cm5mdjZT?=
 =?utf-8?B?MUJUaDdkRU9TMzNZV1pXbThyWHVqeU9pQm9QSCt1SHNVb0NtWDREdU1YU3M3?=
 =?utf-8?B?RWJsYTU5QVBBbWMzL0pmZFNTUXBsSWF4MmxPTHdVQko3Z2RFWjI2YXdRa1Jw?=
 =?utf-8?B?ZkJUQys1WGxaR0FsWSt5Z2t2TkVLSUFEVzVaTkoyc3ZLTVNTdVZsWUcxU0F1?=
 =?utf-8?B?YWd6ajN4Q0NYRDZPN1dMbmlnSWlGemxvdXVtU1psVUpyanBlZXB5R2R5MC9q?=
 =?utf-8?B?VnhWaGFTM1ZNcWpVYzJZMmFTS1dKU1dsYW5iWExRNEtzekFaYTdzUTFIOEtQ?=
 =?utf-8?B?MFRSYmRTYk1vYVgvcVdpQlBGWFlETzZVZ3JHanlTRzJyUVlreHpyR0t2Znps?=
 =?utf-8?B?K3JZcDM0WHNsYk9xU3RFT2drakVtVStCOFkwSm5kOGNtRDVta0pYd2czUHNh?=
 =?utf-8?B?REVxNlB0eFA2MDZXQnNjamp4RG5kSlJjVzArQ1RkSittWHFWclprTE9yTlYr?=
 =?utf-8?B?VmJsMjZlSFc4V2x3KzhwN0xjbFpiNFpmMzJHSjN3MU9SSis1YjY1eUhteVY3?=
 =?utf-8?B?bkhiWVUrQk9FQ0EvTXFVeUhSR2xkSFkwSWIzSnlUL2RXSnZ5bjBWc0Y1NmM4?=
 =?utf-8?B?dzBRSVg3WWE2TnpXblRNWlBQb0xTT01HYlI4SzNnZXZRbHBuME0vVmVzUFVR?=
 =?utf-8?B?OUM2WnY5bXNlendHdlRSRjVwZmlDYTUxd3FKOW8vbTc5UGtlTFh4eExCYUM3?=
 =?utf-8?B?TlFDanlvMW5YaVJVTUN3NVJla2NDWjhMcm9Yell1YU5qbGZFeDFIdGFrZkF0?=
 =?utf-8?B?NlJGVVFjdDlRTFN1ZnRBcUErMlV5SHp0dUFoQ09ncUhoOEFvRVhxUE15UXM0?=
 =?utf-8?B?N1JIZ2xpMUJGTC9LQkwyNlFBdDVXQkhJbEZ1U1VINjFCSUVVUUtLNWVNOVRt?=
 =?utf-8?B?WkpybDVwa2xiMThwU2diU0w3MTl3UWVBSzE1YzRuVGdTeU9qbGNUOTMrVmNp?=
 =?utf-8?B?V2VtK3VmT2kxVFJpLytKRWFpSEhocVExeWRrei9SS21oT2w3Zk1UQWp2bkRV?=
 =?utf-8?B?Z3BFWWVZWjZMQ0kyaWpQdDZjZ05RN0FNSDlxaHd5cGJxSHNwY3Zkd0VpNGZP?=
 =?utf-8?B?cTEveGdvYnNaajdyZldScExTRnRJdGZaU25vNk0xYms2dUhTcm1RZUF1OXdp?=
 =?utf-8?Q?2ZLnoXOjZ1Q3NaMUjz5i9pd62EKDDP1Fnh/Un?=
X-Exchange-RoutingPolicyChecked: CARID381pusJHNOL6ZBc2CEZlwXWga1w5GN6DAnwhJmBZH/LWNw4dBTj0hMtTJGyWhcyiBsLbhIy2bMzq6eKu0NLOLZKuHNvYCw11VmnRMc8hacqjsSuv01UWyJUdnt+zYooPDoO8S8EPyKF+1bDvHhJakN9v8ANHx0dTD5jpO0wBTvt0UwiIDtMoxfsuKxS5m6hubKMgfyVuualDB6FwJfikpv5CMSoXmIYMhRnRdMsDzDve8X6hniyIdj07Kck8zPiUQUp5wTcSU8a87oqnR2mXQeljxfYB21ZQv/RYYERX51jrh95j0g6M8XBPgBmsi/ekOz3VCDA8AtsvdVP6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5703205f-46ad-440a-0aa3-08df36aca422
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:38:42.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owWsZaoAWf9vPWvodqEeaUc0XGLBY0ZLFN0dmBvbbIDJV67htD1fdoOuS0ksyglDmXtVQPc0dyFe3TPvVxAOYyzZtPpsEzDgbyBu/RPlmDFofabKeFMGPM0lFE1bT+g0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Soham,

On 30-10-2026 17:34, Purkait, Soham wrote:
> Hi Ravi,
>
> On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
>> Added event notification support with subscribe for an error-notify 
>> event
>> and wait for the event notification functionalities.
>>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v6:Added normalize_nl_error() for subscribe and wait_for_event functions
>> v5:Added a guard to prevent duplicate multicast group subscriptions 
>> (Soham)
>> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>>     Jani & Kamil)
>>     updated error event name from error-notify to error-report to align
>>     with the latest changes in drm-uapi/drm_ras.h
>> v2:Handled SEQ_CHECK nl response using separate callback
>>     Added monotonic-clock deadline to wait for messages without 
>> exceeding the
>>     caller’s total timeout.
>>     Added support to receive events until it sees an event whose node 
>> ID and
>>     error ID match the requested values.
>> ---
>>   lib/igt_drm_ras_nl.c | 184 +++++++++++++++++++++++++++++++++++++++++--
>>   lib/igt_drm_ras_nl.h |  18 +++++
>>   2 files changed, 195 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
>> index d23fce08f..62e48662e 100644
>> --- a/lib/igt_drm_ras_nl.c
>> +++ b/lib/igt_drm_ras_nl.c
>> @@ -6,6 +6,7 @@
>>   #include <errno.h>
>>   #include <poll.h>
>>   #include <stdint.h>
>> +#include <time.h>
>>     #include <netlink/errno.h>
>>   #include <netlink/genl/ctrl.h>
>> @@ -62,10 +63,12 @@ static int ras_command_cb(struct nl_msg *msg, 
>> void *arg)
>>       nlh = nlmsg_hdr(msg);
>>       gnlh = nlmsg_data(nlh);
>>   -    ret = genlmsg_parse(nlh, 0, attrs,
>> -                DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> -    if (ret < 0)
>> -        return NL_SKIP;
>> +    if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
>> +        ret = genlmsg_parse(nlh, 0, attrs,
>> +                    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +    }
>>         switch (gnlh->cmd) {
>>       case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>> @@ -85,14 +88,44 @@ static int ras_command_cb(struct nl_msg *msg, 
>> void *arg)
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
>>           break;
>>       }
>> +    case DRM_RAS_CMD_ERROR_EVENT: {
>> +        struct nlattr *event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_MAX + 
>> 1];
>> +
>> +        ret = genlmsg_parse(nlh, 0, event_attrs,
>> +                    DRM_RAS_A_ERROR_EVENT_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +
>> +        if (!event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID] ||
>> +            !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID] ||
>> + !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE])
>> +            return NL_SKIP;
>> +
>> +        ctx->event_node_id =
>> + nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID]);
>> +        ctx->event_error_id =
>> + nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID]);
>> +        ctx->event_error_value =
>> + nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE]);
>> +        ctx->event_received = ctx->event_node_id == ctx->node_id &&
>> +                      ctx->event_error_id == ctx->error_id;
>> +        break;
>> +    }
>>       default:
>>           return NL_SKIP;
>>       }
>>   -    ctx->reply_received = true;
>> -    if (ctx->ack_received)
>> -        ctx->cmd_done = true;
>> +    if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
>> +        ctx->reply_received = true;
>> +        if (ctx->ack_received)
>> +            ctx->cmd_done = true;
>> +    }
>> +
>> +    return NL_OK;
>> +}
>>   +static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
>> +{
>>       return NL_OK;
>>   }
>>   @@ -158,6 +191,27 @@ static int register_callbacks(struct nl_cb 
>> *cb, struct igt_drm_ras_nl_context *c
>>       return 0;
>>   }
>>   +static int register_multicast_callbacks(struct nl_cb *cb,
>> +                    struct igt_drm_ras_nl_context *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>> ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM,
>> +            ras_multicast_seq_check_cb, ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to set NL_CB_SEQ_CHECK callback 
>> (ret=%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
>>                   struct nl_cb *cb,
>>                   struct nl_msg *msg)
>> @@ -303,7 +357,12 @@ static void reset_drm_ras_nl_context(struct 
>> igt_drm_ras_nl_context *ctx)
>>       ctx->ack_received = false;
>>       ctx->response_required = false;
>>       ctx->error_threshold = 0;
>> +    ctx->event_node_id = UINT32_MAX;
>> +    ctx->event_error_id = UINT32_MAX;
>> +    ctx->event_error_value = 0;
>> +    ctx->event_received = false;
>>       ctx->family_id = -1;
>> +    ctx->subscribed_grp_id = -1;
>>   }
>>     void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
>> @@ -446,3 +505,114 @@ int igt_drm_ras_nl_set_error_threshold(struct 
>> igt_drm_ras_nl_context *ctx)
>>         return 0;
>>   }
>> +
>> +int igt_drm_ras_nl_subscribe_error_report(struct 
>> igt_drm_ras_nl_context *ctx,
>> +                      const char *notify_group_name)
>> +{
>> +    int grp_id;
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0 ||
>> +        !notify_group_name || notify_group_name[0] == '\0')
> Could a short igt_debug()/igt_warn() be added ?
will add
>> +        return -EINVAL;
>> +
>> +    grp_id = genl_ctrl_resolve_grp(ctx->sock,
>> +                       DRM_RAS_FAMILY_NAME,
>> +                       notify_group_name);
>> +    if (grp_id < 0)
>> +        return normalize_nl_error(grp_id);
>> +
>> +    /* Check if already subscribed to the requested multicast group */
>> +    if (ctx->subscribed_grp_id == grp_id) {
>> +        igt_debug("Already subscribed to DRM RAS multicast group 
>> '%s' (id=%d).\n",
>> +              notify_group_name, grp_id);
>> +        return 0;
>> +    }
>> +
>> +    ret = nl_socket_add_membership(ctx->sock, grp_id);
>> +    if (ret < 0)
>> +        return normalize_nl_error(ret);
>> +
>> +    ctx->subscribed_grp_id = grp_id;
>> +
>> +    igt_debug("Subscribed to DRM RAS multicast group '%s' (id=%d).\n",
>> +          notify_group_name, grp_id);
>> +
>> +    return 0;
>> +}
>> +
>> +int igt_drm_ras_nl_wait_for_error_report_event(struct 
>> igt_drm_ras_nl_context *ctx,
>> +                           int timeout_ms)
>> +{
>> +    struct nl_cb *cb;
>> +    struct pollfd pfd;
>> +    struct timespec start, now;
>> +    int remaining_ms;
>> +    int ret;
> Inverted xmas tree.
will update
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0)
>> +        return -EINVAL;
>> +
>> +    if (timeout_ms < -1)
>> +        return -EINVAL;
>> +
>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>> +    if (!cb)
> igt_warn/igt_debug log
Here, as it is returning a specific system error, IMO debug log is not 
needed.
>> +        return -ENOMEM;
>> +
>> +    ret = register_multicast_callbacks(cb, ctx);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        return normalize_nl_error(ret);
>> +    }
>> +
>> +    ctx->event_received = false;
>> +    clock_gettime(CLOCK_MONOTONIC, &start);
>> +
>> +    pfd.fd = nl_socket_get_fd(ctx->sock);
>> +    pfd.events = POLLIN;
>> +    pfd.revents = 0;
>> +
>> +    while (!ctx->event_received) {
>> +        if (timeout_ms == -1) {
>> +            remaining_ms = -1;
>> +        } else {
>> +            clock_gettime(CLOCK_MONOTONIC, &now);
>> +            remaining_ms = timeout_ms -
>> +                       (int)((now.tv_sec - start.tv_sec) * 1000 +
>> +                       (now.tv_nsec - start.tv_nsec) / 1000000);
>> +            if (remaining_ms <= 0) {
> igt_warn/igt_debug log
will add
>> +                ret = -ETIMEDOUT;
>> +                break;
>> +            }
>> +        }
>> +
>> +        ret = poll(&pfd, 1, remaining_ms);
>> +        if (ret == 0) {
> ditto
will add
>> +            ret = -ETIMEDOUT;
>> +            break;
>> +        }
>> +
>> +        if (ret < 0) {
>> +            ret = -errno;
>> +            break;
>> +        }
>> +
>> +        ret = nl_recvmsgs(ctx->sock, cb);
>> +        if (ret < 0) {
>> +            ret = normalize_nl_error(ret);
>> +            break;
>> +        }
>> +    }
>> +    nl_cb_put(cb);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (!ctx->event_received)
>> +        return -ENOMSG;
>> +
>> +    igt_debug("Received error-notify event: node_id=%u error_id=%u 
>> value=%u\n",
> Could the log string be renamed to "error-report" instead of 
> "error-notify" to stay consistent with the function name?
Updated. Thanks
>
> Regards,
> Soham
>> +          ctx->event_node_id, ctx->event_error_id, 
>> ctx->event_error_value);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
>> index 5c9be5b17..057c6026f 100644
>> --- a/lib/igt_drm_ras_nl.h
>> +++ b/lib/igt_drm_ras_nl.h
>> @@ -47,6 +47,21 @@ struct igt_drm_ras_nl_context {
>>         /** @error_threshold: Error threshold value to query/set */
>>       uint32_t error_threshold;
>> +
>> +    /** @event_node_id: RAS node ID reported by an error-report 
>> event */
>> +    uint32_t event_node_id;
>> +
>> +    /** @event_error_id: RAS error ID reported by an error-report 
>> event */
>> +    uint32_t event_error_id;
>> +
>> +    /** @event_error_value: Error counter value reported by an 
>> error-report event */
>> +    uint32_t event_error_value;
>> +
>> +    /** @event_received: Set when a matching error-report event has 
>> been received */
>> +    bool event_received;
>> +
>> +    /** @subscribed_grp_id: Multicast group ID currently subscribed 
>> to, or -1 if none */
>> +    int subscribed_grp_id;
>>   };
>>     void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>> @@ -54,6 +69,9 @@ int igt_drm_ras_nl_init(struct 
>> igt_drm_ras_nl_context *ctx);
>>   int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context 
>> *ctx);
>>   int igt_drm_ras_nl_get_error_threshold(struct 
>> igt_drm_ras_nl_context *ctx);
>>   int igt_drm_ras_nl_set_error_threshold(struct 
>> igt_drm_ras_nl_context *ctx);
>> +int igt_drm_ras_nl_subscribe_error_report(struct 
>> igt_drm_ras_nl_context *ctx,
>> +                      const char *notify_group_name);
>> +int igt_drm_ras_nl_wait_for_error_report_event(struct 
>> igt_drm_ras_nl_context *ctx, int timeout_ms);
>>     #endif /* IGT_DRM_RAS_NL_H */

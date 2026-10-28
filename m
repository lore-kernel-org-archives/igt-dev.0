Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A504C606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 10:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DSYuy9eC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557D710E5D1;
	Wed, 28 Oct 2026 10:05:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D22B10E5D1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793181879; x=1824717879;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=koOgjQj4Xhx8iznl+q11WSY3Fvo7PgIN3iH/WSPuwK0=;
 b=DSYuy9eCql01zDHW2MC65lQsHbVWcr7/jCsNuXu1GINLG7820d4wMwfa
 9TALz3ZdoaWQQ/VFfTiIrEkjyhoi2scSrX785yXzgI0khAOWs3gMAenvD
 5jM1JFRS+YLHxOlRoBf11yAwF7ByapvrNnnQCNFP9KP8qRdzCamqQ4nXd
 G1JEoAoEilrbcSvl6P5Z4Uj8uI8zxjwQAxVtNlfblRkWq88RpfGZSWjrr
 iEt1nYrANAw/+ALQznExqxzmVD9Qcqwe+DGFhnL9HtHvobYGW9XDy+CTf
 p1j0rVIEssiOyOwMafVPrgioqayxtHDqnWdGkRWZkfxsCYmkcy2exzoNh g==;
X-CSE-ConnectionGUID: rpfnXB4yQ9umqCuFbukZ5g==
X-CSE-MsgGUID: GhmBwpdsRD+WnrMQIJiMCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1780694"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1780694"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:04:39 -0700
X-CSE-ConnectionGUID: 5OjS/GUSTDWVTuM0/jiKwA==
X-CSE-MsgGUID: m1CbpAd5SF6wiDDgtVuzlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6565090"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:04:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 03:04:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 03:04:38 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.51)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 03:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a54b9MiOaOBlkR8RJAzjoc+GWbvIHtmz6eGMwoPWMzpnBR4B1dfWZr0ULsNJkwMpHGlfJAo03OVMNOjB/oXvHlpn52qzd28CBkKJR0DqYzI/rQD0BoHJQ20owYCpK5tzbTcOQyc7hw2ZmWfm9w0rgQVVrNQpWtA7bUjMbHT9aeIIFuu8gPktrLDtOyziDbJqnkIbSp8PYZZlpBzZjR3vne2aw/Nn0WBfbs6/NYdTRyCJhASZUO5US1lqTWWJtWunnUDavIK5HMHleCht39hdsikborFVCbz7suZXkolQoPJIRzW06AaWKBAdtzhJrE/+GHnqXmu7FfwaLm80NjVbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVtiw+1wZKL7h1GYaIq4gNeDZ8qEi4Sdcqj9MhAQqhk=;
 b=mvOwe4GK/wN5hfwkXFzqHA88iZfLIaejvM51OS6zVVPF9KPc5LUn25oWzwpVMdyVB0nPA5uLFwxP8rIRSVE1xcQ15d0fCDuA8R8lK7eTurfgVG7Ba5dUm4SHNZwYcED8vP4sglV2bW0S1RWkhSJRpdQ4JOdEl3Pm9ZpoD/GLspunofuzIvigrbi/4vHO6ikENzW+UwDo0byF0C6I3gbzSjD5VXWKDRhHRML3ml6fTVyQh+NiFpnjsEPof72QjSLsIZUTTOfTdx6FqzMIKqbLny0wprx86tkxgkidALCQrz61Ye+KyXbzENE5HmIi2gjm/mbQbsrPoyQERP0dSo8w6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 10:04:34 +0000
Received: from CO1PR11MB5028.namprd11.prod.outlook.com
 ([fe80::a6c2:1db1:3753:d949]) by CO1PR11MB5028.namprd11.prod.outlook.com
 ([fe80::a6c2:1db1:3753:d949%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 10:04:34 +0000
Message-ID: <5be71428-e621-4b7c-83e8-8c8ae9644907@intel.com>
Date: Wed, 28 Oct 2026 15:34:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld#
 nodes are found
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
References: <20261015112548.2682369-1-chaitanya.kumar.borah@intel.com>
 <PH7PR11MB6053FF9ACDBB32795BFDA3ACE76F2@PH7PR11MB6053.namprd11.prod.outlook.com>
 <5d7189cd-9e1f-43bb-9015-be712d2333e4@intel.com>
 <PH7PR11MB60534AA451885A77D36DCB0BE76F2@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <PH7PR11MB60534AA451885A77D36DCB0BE76F2@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0222.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::15) To CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5028:EE_|IA0PR11MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 7598f306-74f1-4ffb-5ba3-08df34daddab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: r5RulJCvR3QmyBNFG9fLViVrW4MKDuufat0+EnB7T2sWcyvoEPv6HlwShS32SxQOyhv30u+rBDBuTrHNvVvFgzNVw41schoAFOOzHQ/WmQiJHJ4THipCTFeVFS0+C8q9A4r5pPA8MWxQOJD6rF7/RYZjAEA9T9Z/vUYvvASvtK91QLR1Ujj60tdNUosyLZ1iB4x98Fi7tKAcWzuTQs/fZjcIEB5td7y7bQMUQVxIKge+iiG2iUFqalPJX+gnrD0Ij8q4QbZPagQYObnLqEh78gAYmsFe4ZeHEzL9TxzvSudgiC3zyaPz2xdNb1O6IvtvcUME4iQDN29GtPGDdf9+5QY3QFZhoLV3F4UKi0tKG+0Bom7vhFfIIPV5lIa4iWijVhb+KdFnCv0BvrHrXiBgEufcyTMugyACrKoG8GBHN3yn3smZeNXoe67SGhwetArKb3Ue2Hgz2MHuED34UjRJGNzY3q+bwtJ91Gygykhzx+KWWXgSxGR+byhz44Qh1tdE8yTHzq732SgONOkrweL0Fi9TrR3L3styB3RqCTKv35qnpGzx8R0HfhmOpK/YfJaMz6JGRAjAnV0iRt4z5SePqNM7s1hF5KgsHi4rJCklObSwpGsMH2yZ7J180ye3iT2XQ4H7HdlDM0kjLJ5y5W104MQJ9ETTQ4kafrrLMUz2dGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5028.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHJQUThBOUwyYWtJaDVNa2tuMy8xWngva1ZrVmlqNjV0V2l4YW1hOWl6MFhQ?=
 =?utf-8?B?eENSdDRaZE5idjNWVVJ5b2J0VGk5TjI2ZU1rdWcyYUd6RDNmc1dwL0Ztd0FJ?=
 =?utf-8?B?dVFZU1NiUTVrSW1CMS9SYW5vampJM1dCMHZpMWppMFEvOUtiS2tma2g4UWxz?=
 =?utf-8?B?M1l1SUdYR1RMSVFDc3RFSG5IczQwaEUwVUcwaXJaeW50S1lTR1NuTk9tQUg0?=
 =?utf-8?B?c0lDTExEQnhOQlNUaldGS3EvKzkzcTMwYWtveURnTFdvWFRNT3NudUdVcFpu?=
 =?utf-8?B?Y0duQmhHbml5eUQvQjM0WDF5eEdDNmxraVRPVlNTT1IxQzc1NHlQaCtvNkc5?=
 =?utf-8?B?VUxhaG0xY0owUmFaRE5OMVFrWStNb2NCdkExc0xNdXJRdXlQdGU5QzdrWUFx?=
 =?utf-8?B?dTBBM21xc1BrcHA0VUVUVFhiQnY0Qzg1UG5nMVM3M0FZTkRMZUY2SDkwbUFH?=
 =?utf-8?B?ZFdld3RJVXVBcjZCY1ZYRFRsWUl5VDAvb1RWY2VlOC9zQ1NsbjhOaDhtWGIy?=
 =?utf-8?B?T0EzUmlYY01Ga2xuTWc0d1kvWFNRNlIzbU4ySUlJWEdSWk9tdGdla3ZiWGF5?=
 =?utf-8?B?Z1ZoZkt2N05YQXR6bTl4UjAwS2QyeDBSTFc2VjJncC9LaXQ0NzQrTkU3SUMz?=
 =?utf-8?B?TWZKZjZuQ1h3eXRiQjMxMUVRYjBON0ljcEU2dHdIcVI2UUZ4bUh2ZXhTeXhM?=
 =?utf-8?B?dGJoaldNdEhvUnVVWkJQbjF6bEoySm80ZGh6ZTVYWi9CeUxNN0hWZ0tFbDhw?=
 =?utf-8?B?OWNFd2kxVncxNStNNUZwWDVRbGlCa211SHlvVGdPMjJGUlFRT1dvcExBdTJu?=
 =?utf-8?B?TTc2V3hPWHU4dFhkNmJQR09ESno0azA0amJJdVEyck5MbWJTV0I1NmV4VUpo?=
 =?utf-8?B?clladktiV1c2RlEwWVFNbTFTRUFQMnNVeTdXWE4xL0VtWXJKbDBpSGdyRlZM?=
 =?utf-8?B?djZqNlhQR0wyVzJnbGFPTjlwaFdoYklYNm5zRmlrVEVaK1YrSmZXYmdSdDFB?=
 =?utf-8?B?bDJXQlNnSVkzT1cxSmpqVmlnWGx4NXhtMEdYYjNlZlNwRUNaTWEycUJMS2tW?=
 =?utf-8?B?YndMZFZPUzJOMmlmYXRDVjlmNE9YQm9oQmFJay9tQytxNkZ4OHpjMmlBNmdp?=
 =?utf-8?B?Q2s5MmtwUkxBSENoVkdmbGs3TGo1MlRzMFZLenpCSzJmTGJmMmFLN1RJOEIr?=
 =?utf-8?B?UHJyOS9IQTZUOFN0SEJvRmRuYjVydlpRM0JqVTVhVGo2OGNqRFNPMHhtMS9v?=
 =?utf-8?B?bDdpbUFzeUxHNWhkYWx2a1BYM216cndVODJpNHYyWDZYZnZHTThTQitaZWN4?=
 =?utf-8?B?cWF2Q0hDNjdMbDFMK2gwcHJkTkF5THNQSTdXQTZXeStEeTRPWGNxZndhL0lk?=
 =?utf-8?B?dUtVTHFFai90WndUdkFScEsrSXVEa1hFYjh0Kys4cnUydUUra0RSdkRYRzg5?=
 =?utf-8?B?RkV3Q1BEMDA5OXR3ZFNScG5Fa1NlSzhvNGNXczhpNzYwWmZEOXBueXRVQnM5?=
 =?utf-8?B?U0lrRkRzSGJKb2JMWU5sR2J6RXhNNTRkM0NUS1hDbU9KYUhST0xsNmhVbzVJ?=
 =?utf-8?B?Y0dQRU9zSWNsdkdGeWhCdkcxdXREdGlPdnlGYk10QnN0WHJtTWtVd01xanBw?=
 =?utf-8?B?Y3lRVGVRWklHaFUxSm1tV1FYamtpUWNTem5ZSUpHWEtvU0ZEY0lTQkM0bS81?=
 =?utf-8?B?N0xSQ3YzMzhQZFVyZjhEYjlKQmkxSFlDdkwwTWJSdFFLbmFkSTlGSHlpTmxK?=
 =?utf-8?B?SGtLdEdiczBCcEZITzhpaE1peDFBWDlpM3NmVmJJQzVFbHVHcEtFM09Ud2Zw?=
 =?utf-8?B?dDNyQmFWQXVqNXpNRk8yN2RiNEhSMVhtYVBLYUIyY1Rzb0l3aXlRRGx4cGNr?=
 =?utf-8?B?QXlVeEFlYmJNOXh2bis2bEt1TmQyNTg1eTRLQy94aTU5WVY5NFFtYVV6SU5h?=
 =?utf-8?B?dFQvKzZoSXkvNXZTWmg1N001anVKU1FlZGh0cUplb0lXbExTajM4REZhT2h2?=
 =?utf-8?B?Qlllc2J5MVQ4T0xxZEpKdlhnSWhPS2VxN2FSL1VDS0dudUdVaWtOZ2FoYUha?=
 =?utf-8?B?YmlyanZ0NXFEOWkxaEt2Wi90UVc2UDc5eVZ2WXpxRXIxUlY2bzQ5QXFQbXYw?=
 =?utf-8?B?c0drMnB5K0dmVkVOcGFjTXgwV01Ybkl5QkQ3THhUY1NCMmNzQVFZVEtPODRP?=
 =?utf-8?B?Z3hjL1poR0gwdlpPNnVMdUhTZ1Z4UG9sSlUzbnQrdkovb2pTRW53eVpYcWh0?=
 =?utf-8?B?NzVobG4zZVZyWkMxR3dCc0I3Z3pyTGZpNjN5Q0FNL1dXUDBxL25YY3hHTVFz?=
 =?utf-8?B?cGJLRjQ2ci9nOW01aVFiVUNtdUhmVGd3RXlNL3FLNFNJMGs4NGtjNXAwVzgw?=
 =?utf-8?Q?2c9utBHO3gIL3xCU=3D?=
X-Exchange-RoutingPolicyChecked: VOzpijeVkhjtbuzAhAEgMJEz+QcN172jFXSvp2MkdBPH+VM046TKi844Cnp0DJYEeWO1wNG75QKTj8iOUrr5PESF+NQsZji+8reXAPQd+/nEU6XuhY6S+i7vjRhxnMtvetc7U+zVzmq7s56/ag1fKWE6RRBsl8b5hleK3z+K8FZdrLLQEKlMiq2jNxXsTIg5aTunslSkUtjfOfblu/gmdPZeKx+7nypFti/hMgYJnpEUIviaIrL05IfQLIcUlTxOrJ9Bf2WNVDAebbcETr+f49mQBzx5VmwvsSVFLX1fLdBG2lH3b2eaJeG11/wlfZLiKAB+edpI460t4zeWUpVrEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7598f306-74f1-4ffb-5ba3-08df34daddab
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5028.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 10:04:33.9569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuqy4QDkNsmUo19Qkm/vlEdrLsMrP8GsK63pMjX6TI66kIlgkWABiWqXMyoAYR4Tm7kLGnQlylCiqQZ8aNVpcFHUStGxokDvObGOqDc51S8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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



On 10/28/2026 3:20 PM, Samala, Pranay wrote:
> Hi Chaitanya,
> 
>> -----Original Message-----
>> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Sent: Wednesday, October 28, 2026 2:53 PM
>> To: Samala, Pranay <pranay.samala@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: B, Jeevan <jeevan.b@intel.com>; Sharma, Swati2
>> <swati2.sharma@intel.com>
>> Subject: Re: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld#
>> nodes are found
>>
>>
>>
>> On 10/28/2026 2:23 PM, Samala, Pranay wrote:
>>> Hi Chaitanya,
>>>
>>>> -----Original Message-----
>>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>>>> Chaitanya Kumar Borah
>>>> Sent: Thursday, October 15, 2026 4:56 PM
>>>> To: igt-dev@lists.freedesktop.org
>>>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; B,
>>>> Jeevan <jeevan.b@intel.com>; Sharma, Swati2
>> <swati2.sharma@intel.com>
>>>> Subject: [PATCH i-g-t] lib/igt_eld: Log module load state when no
>>>> eld# nodes are found
>>>>
>>>> eld_is_supported() silently fails when ELD procfs node polling times out.
>>>> Log module load state to identify whether audio drivers are loaded
>>>> when IGT attempts to read the ELD nodes.
>>>>
>>>> Cc: Jeevan B <jeevan.b@intel.com>
>>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>> Signed-off-by: Chaitanya Kumar Borah
>>>> <chaitanya.kumar.borah@intel.com>
>>>> ---
>>>>    lib/igt_eld.c | 12 ++++++++++--
>>>>    1 file changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/lib/igt_eld.c b/lib/igt_eld.c index 896ab0e6b..bfb83a213
>>>> 100644
>>>> --- a/lib/igt_eld.c
>>>> +++ b/lib/igt_eld.c
>>>> @@ -36,6 +36,7 @@
>>>>    #include "igt_aux.h"
>>>>    #include "igt_core.h"
>>>>    #include "igt_eld.h"
>>>> +#include "igt_kmod.h"
>>>>
>>>>    #define ELD_PREFIX "eld#"
>>>>    #define ELD_DELIM " \t"
>>>> @@ -301,8 +302,15 @@ static bool eld_has_nodes(void)
>>>>     * for a bounded amount of time before giving up to avoid spurious
>>>> skips. */ bool eld_is_supported(void)  {
>>>> -	return igt_wait(eld_has_nodes(), ELD_SUPPORTED_TIMEOUT_MS,
>>>> -			ELD_SUPPORTED_INTERVAL_MS);
>>>> +	bool supported = igt_wait(eld_has_nodes(),
>>>> ELD_SUPPORTED_TIMEOUT_MS,
>>>> +				   ELD_SUPPORTED_INTERVAL_MS);
>>>> +
>>>> +	if (!supported)
>>>> +		igt_debug("No eld# nodes found; snd_hda_intel loaded: %s,
>>>
>>> Use igt_warn/igt_info to log in CI logs. igt_debug won't log without --
>> debug.
>>>
>>
>> This is not needed in my opinion because a test failure already triggers a
>> debug print in our CI.
>>
> 
> Agreed for kms_hdmi_audio_bw. There audio_is_active() returns false,
> the caller's igt_assert fails, and the debug buffer gets dumped.
> 
> kms_hdmi_inject and kms_chamelium_audio use
> igt_require(eld_is_supported()) though, so there it's a skip, and as
> far as I can see igt_skip() doesn't dump the debug buffer. The
> message would be lost in the spurious-skip case. If that's
> acceptable, I'm fine with keeping igt_debug.
> 

That's a fair point. Will make it a warn.

Thanks for the review.

>>>> snd_hda_core loaded: %s\n",
>>>> +			  igt_kmod_is_loaded("snd_hda_intel") ? "yes" : "no",
>>>
>>> As per my understanding, on SOF-based Intel platforms (with
>>> DMIC/Soundwire), snd_hda_intel still gets loaded but aborts its probe,
>>> and SOF driver bound to the audio device instead.
>>> If so, this would print "loaded: yes" even though it's not driving the
>> hardware.
>>>
>>> Would it be better to check whether the driver is bound rather than
>> loaded?
>>>
>>
>> AFAIK, our CI system never loads the SOF drivers, let me know if you have
>> evidence to the contrary.
>>
> 
> My concern came from azx_probe() returning -ENODEV when SOF is selected,
> which leaves snd_hda_intel loaded but unbound. If CI kernels don't enable
> SOF, that can't happen and the current check is fine.
> Thanks for clarifying.
> 
> With that, changes LGTM.
> Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> 
>> ==
>> Chaitanya
>>
>>> Regards,
>>> Pranay
>>>
>>>> +			  igt_kmod_is_loaded("snd_hda_core") ? "yes" :
>>>> "no");
>>>> +
>>>> +	return supported;
>>>>    }
>>>>
>>>>    #define ELD_MAX_SIZE 256
>>>> --
>>>> 2.50.1
>>>
> 


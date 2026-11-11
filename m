Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A98606A324
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WT5lZCRf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2040D10E9D8;
	Wed, 11 Nov 2026 10:47:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E619F10E0A9
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 10:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794394015; x=1825930015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ImKUtav1YDW+4Ur+LkRx1V23iwajuqlOLRA94s6a+Nk=;
 b=WT5lZCRfM7j9UayGVsLRS5SsrlV5MBHeHRWUkKeGaC9CmMvfWUasfsRo
 wppiwraUuSz/5M/4hfimDxr6/91gxZye680M2YS+9TX9J+3RNOxBapDu7
 y3D1jW1mLpjse0sjKOqrhS/9iiUt5Hu6Jn8zoccmaa708ohyNuHjnh56p
 qdS85YKtS72WTOlj8jQNJWy5qU4VrNqyRWTF0HCTxIixjj/P3m3KvhQ4d
 p7BLIwGZHNtWU/bH+hrXdxi7KRgjJ3feSecQhc3J6zUG36ONU6CXFr+mB
 PRkcr4cdS63tI4pw1o/9LGzocT0CiVha5Luu9SE3z/P7GspdEGrQKdM81 A==;
X-CSE-ConnectionGUID: cSqluImWSTiSi3S97tzi7g==
X-CSE-MsgGUID: 0dSFmwdRSZeK+icN8p0WHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3190844"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3190844"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:46:55 -0800
X-CSE-ConnectionGUID: pAgcgIfZRIO3hp3H1TjYWQ==
X-CSE-MsgGUID: usYhJUN2RyKoBD9/+NKVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8393563"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:46:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:46:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 02:46:54 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:46:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAEu2W3W/MjM+1HEwKCcHTZqK0TRJhs/yoUsoem6d9aiV8oO3DDgyupY+xpK852pSB6+a8aH7DkArCNE3isnzGotELNdwvfL7uAhNe/tVyj/07X3R8AGTxRm7N6zx27vn6Oke+NFu8GmZsalBi4ENoFm1fXYh8t3/FX9TjYG+dkxlY1RCq+VBds/h72VZ8HFBDi4S1GwiZhgLiEx7GQydzFHLv6/WfWEwDyvpgpSNr+N+d4nMKKfUa983JVmPjumMXKsgoF0Ob5dTEaoXtl9cBSlBsTbrJS8rF3mJPxb6vY01+DBQ/RnIJ1CiTWDPw+0SiwMlhX9V4Ob7pIPphLssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlcd7YAzlVpkk35tkUWXRqLzFfT0mssbAzn+hnQBa58=;
 b=xH0at+Ww7azXq0aSqvmY5WStdH6QnmKvZNJhpD/MzBJsYV2ds2KUHZKXsvvNR+xKnK8gJVjcgG7JzyBwoSspTA5nLQIzryhNoIRdnScSN3BOH8AQ2CqgAmFZdwHBbuxi2eVM3l6uQJy1l90gUYC6RGR3HXgo1ElrrwDZJWhqpozCix3PvE25teaCFiR9vTDlHm/fvISFbNJksj0Vk9asf8nLVyHietmqKnpj8thmCbsF+UTjykSogqNJWCT8BWW9xMYCCA27adAYYOIa3loLiDbVybb18gwZi0gmIS6B4TRwL6hWkaiNJn/UiQq4AraETatfC9HW4cueUx83Qv5j/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 11 Nov
 2026 10:46:51 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 10:46:51 +0000
Message-ID: <ca326d87-f356-4352-b161-bd77095ef8fa@intel.com>
Date: Wed, 11 Nov 2026 16:16:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] tests/intel/xe_err_injection: Add Core Compute
 Uncorr Error injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
 <20261110160504.1315160-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261110160504.1315160-8-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0064.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::13) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|CY8PR11MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c9315d-e0c7-4239-cd70-08df3fe1181e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|4143699003|261009220027099003|261021123027099003|11063799006|261028144727099003|261021121427099003|261009223327099003|261009223027099003|56012099006|261022105027099003|261102123227099003|261022113327099003|261009221727099003|261026140227099003|261009221227099003|261026121527099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: AzT6593rtUB6pYjJzxqp4QSkpNwGw82y3OBwzT7ZEY9bPL0La3jyHChsf0TLpkYHQCgJrNhXpawTrgf1W9jEp3rKr9ycehIkPpFX5Kd5Sm+b7umsZoWDroya4jIt43OVxFtuXcUIcRUYf8YkgNRqImkDkDSuMG5xuFOnu9S5RhD0vhv+E3kXIezHy3clQZpfKb0DsBj8izROm80guFPqOqqmAlyYAZTPVK9bqgXrbucMQtOup/hHTskXrIsVN28tFdTO358MoFRrQYMvCqSzK0+RfacH8C1Gg/n940ryHTImoikaair0ebU4yO6iavHVCL+TrVQtYnnRkerDzZ/0wTPXQRQNlgcD6zTkRMdTShc5XZ7MrvRf9OiVB/5pfZ+QLiSHv7rPR3O2HcstveYFvPJviy0sJsZMf8sjBMKXq19+tjck1KSHd8ZH0T8TUaZq388e6oGHTYtVZVMAAkYdh7gd3zCCX5BF+mUFk147I4q0UinOKT32KQ1WWLZvORZRMyuF+BtnsCMzuwVu5k+mhB4HCHw0A8bPOx1dHm1EDs3cPdn/K5aJeRd0t1tPiD+IYIO4tCCM+N3kzC7u9rqM1R/36hLopteWAM/1VnOTJ8e6TWlO7K6MyRMaDRkeenuutdVms4kFxl7boCsAOSWwDsYbpRFIRC4ucKozYD7XPcc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(261009220027099003)(261021123027099003)(11063799006)(261028144727099003)(261021121427099003)(261009223327099003)(261009223027099003)(56012099006)(261022105027099003)(261102123227099003)(261022113327099003)(261009221727099003)(261026140227099003)(261009221227099003)(261026121527099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWxvczZkY25XTlU0bUZiWnQzTkV6M0x1Z3RkY3lBb2ttSStMcGxuVjBKbTY0?=
 =?utf-8?B?SWxUeUlpY290eEdFMlZqUW5ia1VoY1NadGpWOCtKTG96MHlpbmtrTi9GaVA2?=
 =?utf-8?B?YnA4ems1TWQ5RVBqcHFEWUMxMkdaZEJPOEJhc0dyZEVrVlNNQk9LMTN4R0xP?=
 =?utf-8?B?RUx0Z0Zvc3NPRVRLUTIrV1BXVjJJOWxpelZ6UzFrM3RuVTFkR01Xdm9ta2pi?=
 =?utf-8?B?SnpFbFhSRldnSTFIUU1vS3hZVFNDRXA1cXMvZGpHbWtTeXlTQ01UaVVuOE1a?=
 =?utf-8?B?UlA0akJGY0tSbVA2UVphYzA1cUFPRmVvZVYwdlU5RHg4YUltc0dyK3p1Q0pw?=
 =?utf-8?B?VDdidlNkMVZRbXhJeXV6ZHo3VUhrOEZDNnFGY0czVVVZQ2cyMHBMYmVjMjNK?=
 =?utf-8?B?bE9VdU8vSTBkQ0syaFp0eEkxczk1blJBNkpFRjJqbzBRdGxqSDBVOUdGR01X?=
 =?utf-8?B?NGM3Y2Vhbjg4NnZvaTZabW9TUTlYODVYMzNESmhXN1B1SVN2Y0J1TS9nVU1p?=
 =?utf-8?B?cXRJZ3NRRlRlbU9idGxhcGlmbkQ3UDJwdnFtT2g4d3dPbmMvMnI0TzhDa2Ez?=
 =?utf-8?B?d01BNTQ4SlduZXVnQUxpWldjZS9EZUp1MVZ3L0VvYjlORFBJMk5icllkZGlV?=
 =?utf-8?B?NCsxanJYV0pHcTZ4S0lwODZveGtWSzhnbkNkY1R3WHVYWmNJQ29BU3R6amsy?=
 =?utf-8?B?UkNLbkZ0T3lxM2NvaGpNVEpTOFhabENGMkdETzhDWVc0cFhnWTdFOGxSNVh1?=
 =?utf-8?B?WXpjcE5RcytFaElUQ3VVSU5MZXlUckk2eTQ0NjBQQkdGSjZPSGVhNmNQUExY?=
 =?utf-8?B?TWV3K2FXUHNEMFUzZFcvOVA4dGVWQ1lZd0VKZ3ZuMDc0MWtiZUgzSEtNRHJw?=
 =?utf-8?B?T1NOYXdyWDVndmZHcmpxcTRTTWtYc0xkUXhSYml0VkJPdFpGZEVHcW9SRCtw?=
 =?utf-8?B?UllnSTZ1Vmg3THNiQlNtRUpZVGlvRW1sQVRGQ3lnamg2S3BNMTZYUTFpQ3BH?=
 =?utf-8?B?YVVaWjByOEVwUkxlT1I0aUxOUGFKYnVnZHE0U1Q3R3pxZVpxSFJKWkNzNlRH?=
 =?utf-8?B?T2F2R3dCRjc0OTJtWHRPUkxrZHZ1Sk45VWdyVmtyYkRKbUg3VkpIT2pTYzZX?=
 =?utf-8?B?azhtVVdlK0V4SDUzQnlaMXZKa3NHMC9mdk4rbWRtcU0xKzRhaDBFYW43TG9Y?=
 =?utf-8?B?d1IyK0NLaVJYSm50b0NVUEhQdVdxenIwMVU1RnZaRVBDQmhndmswcW8zVmdq?=
 =?utf-8?B?OE1FL0NjandoeFFqeFhZZmczaHBaTyt0MDVzUG15VU0zclZ3TDdITTdIVGJj?=
 =?utf-8?B?S0ttYXhTWkhocStIMUUzaEdJOXNIRzFMNi9JZWZCd0ovRCtMTlFYck14ck1M?=
 =?utf-8?B?Mk9jcjNxeWsrNWVhdTAxQzdpMTBTYTlyZmN5c3loWG42YXMxTXBaSTV2ZGtU?=
 =?utf-8?B?eWk1TkhnU3d3L1htaUNwMUhmeVJqTVE0dXlaMlZFSDMwN0UyNDZKTWJEQTFk?=
 =?utf-8?B?UHNoYUQ4dXIycE1WZ3FDVzg5a1QxVHB0S2Mwb1NWK2tKNkMwTjdKMFFIZlg0?=
 =?utf-8?B?TzVWRmg4QVE3QUREdHNzdGYrOUFnMXM3b1pZVkpSa0JXeWVZVTcxUGxoYmtk?=
 =?utf-8?B?cmJtRFBlRzREcVIrZ3NUenVWN0dvTTdoUmFkOWNMY1RWbkd1WDZpSFYvWEtS?=
 =?utf-8?B?OU5nOUxGV0dhZXAxWWg3ZzdmZXYyUE5SbVYrNnpwMit6cGlVRTgzNkkxV2dh?=
 =?utf-8?B?UzVQbnJTV1J0cnJxS3ZVQ05nVmFWaFVneC9ob2NKVjQrbElWYlh0KzNtVGdN?=
 =?utf-8?B?Um9RTFAwSTFybG9LV2xWVlZ4MzJlekU5UjlzMlF1bFVYRVpxSm8wR3FEZWFL?=
 =?utf-8?B?TmtkcmFqd3Y1ODNkY1ArNkhOZk1QN3lPZzBkUHZyQ0ZiSUR5UmVKcHFXZkUx?=
 =?utf-8?B?NVRKdlRCS2poWVNNNy9FOEVIM09LdlRKVXNJaVRacG9OUDNrbWREaHF0OUMw?=
 =?utf-8?B?ckJNSk8vM1ROd2dWSUZtYm1tckRuUTVEMzFPYmxwTXZ4TjRoSHdLYmduOFVQ?=
 =?utf-8?B?dEZHeEs2dzhiekk5d0RoZzVidmdBcTh6UnhOU3VYd05QQjVmM2QrOWZWbjVz?=
 =?utf-8?B?UVg2MXVLZER6QnlKc1ZkRi9LdVRNRkdUUU45TG9seEg3b09IaDNlZFg5ajcz?=
 =?utf-8?B?T1V2aHhlRWpqVjRFSk1lbTgrbnI0UEZOeGl4S3hZM3ltWlF2b3JsdWx4ZjNH?=
 =?utf-8?B?TTFrcXg1Zzc3aVdlVnJlWWlkb0VKWmdUMDV0bWkwc09tMFBaOG12aWY3TFow?=
 =?utf-8?B?VmJqTU9Zb2NLcnFRaVJrQmdGY2JINE4rNUU2TUlYWGNJdllxWmplZz09?=
X-Exchange-RoutingPolicyChecked: eqasWoCdHSfzXzHVTO1d8gTi9Obzm+KwMGwpezQrKpQOf+LpRFKtEv/70xg4uEudaIQMaaJB4rDc/o/7pWqXlVlPPKFJW0yHm3POJZuhLsinUsSUgAULQ2Scof2E5MXn+14umfsG4mkirDMf5YB21Eb2pUtbNOJ7PS1iQa7JLRCIq4aoJjLvtbu12x1o9T9YFjem0xrcnNc5rjotXIBMcTzHyFZqp1uIPCkysu98EukHDATTkNHbaqNpRxCC3P+/E42SiRptKXpkmQIlcsFdgCsLrrpsHkD1uxVAkwoXmc2MVqsxYQzuBbKVCi0vWkUkdeWFEa5s0GFi7StDDaznpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c9315d-e0c7-4239-cd70-08df3fe1181e
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:46:51.7755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8+N1ntDj/k/JWtjfLQ+6s0OWQVZegeHfmug0x3zhJ1NaVEo0NWGZMhecPde1Zfl185lveTT/+JqwlgcVY5bgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
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

Hi Ravi,

On 10-11-2026 21:35, Ravi Kishore Koppuravuri wrote:
> Add MMIO based Core Compute Uncorrectable Error injection to verify
> the Xe driver error handling and recovery flows with the help of
> DRM Netlink API suite
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> Acked-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v7:
>    - Added support to ensure that tests pass on all available compute nodes
>    - Added a one-second delay between semaphore acquisition attempts
> v6:
>    - Updated aquire steering semaphore logic (Soham & Riana)
>    - Removed enum to string mappings for test names (Riana)
>    - Updated metadata in the file (Riana)
> v5:
>    - Removed xe_err_injection.h and moved its contents into the .c file (Riana)
>    - Prefixed all register address and bit value names with "XE_" (Riana)
>    - Updated AER recovery dmesg strings to use enum-indexed arrays (Soham)
>    - Added error handling logic for function calls
>    - Changed test name comparisons from strings to enums (Riana)
>    - Added UC test and post-recovery workload tests as dynamic subtests (Riana)
> v4:
>    - Added Steer Semaphore for disabling and enabling multicast
>      operation(soham)
>    - Increased device recovery check timeout from 5secs to 10secs
>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>      Jani & Kamil)
> ---
>   tests/intel/xe_err_injection.c | 389 +++++++++++++++++++++++++++++++++
>   tests/meson.build              |   1 +
>   2 files changed, 390 insertions(+)
>   create mode 100644 tests/intel/xe_err_injection.c
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..67cc81a89
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,389 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) MMIO based Error Injection
> + * Category: Core
> + * Mega feature: RAS
> + * Sub-category: RAS tests
> + * Functionality: Error Injection
> + * Test category: Functional tests
> + */
> +
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_ras_nl.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +
> +/* Steering Control Register (MC_PKT_CTRL) */
> +#define XE_MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define XE_MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
> +
> +/* Core Compute Uncorrectable error injection */
> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +/* STEER_SEMAPHORE_MGSR_3D */
> +#define XE_STEER_SEMAPHORE_MGSR_3D 0x00FD0
> +#define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
> +
> +/* Node types for error counters*/
> +#define NODE_ID_UNCORRECTABLE_ERROR 1
> +
> +/* Error types for error counter */
> +#define ERROR_ID_CORE_COMPUTE 1
> +
> +enum {
> +	SUCCESS = 1,
> +	FAILED,
> +	TIMEOUT,
> +};
> +
> +static bool run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	bool found_engine = false;
> +	bool all_succeeded = true;
> +
> +	igt_info("Running compute-square on all engines post %s\n",
> +		 state == POST_ARMING_INJECTION_WL ? "injection" : "recovery");
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		found_engine = true;
> +		if (!xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
> +							   EXECENV_PREF_SYSTEM))
> +			all_succeeded = false;
> +	}
> +
> +	return found_engine && all_succeeded;
> +}
> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static bool acquire_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	uint32_t regval;
> +	time_t start_time = time(NULL);
> +	time_t timeout = 10; /* 10 secs */
> +
> +	while (time(NULL) - start_time < timeout) {
> +		regval = xe_mmio_read32(mmio, XE_STEER_SEMAPHORE_MGSR_3D);
> +		if (regval == XE_STEER_SEMAPHORE_MGSR_3D_VALUE)
> +			return true;
> +		sleep(1);
> +	}
> +
> +	return false;
> +}
> +
> +static void release_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D,
> +			XE_STEER_SEMAPHORE_MGSR_3D_VALUE);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
> +
> +static int get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct igt_drm_ras_nl_context ctx;
> +	uint32_t error_value = UINT32_MAX;
> +	int ret;
> +
> +	ret = igt_drm_ras_nl_init(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize socket for get_error command (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = igt_drm_ras_nl_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +		igt_drm_ras_nl_cleanup(&ctx);
> +		return ret;
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	igt_drm_ras_nl_cleanup(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg(const char *marker, int elapsed_secs)
> +{
> +	static const char * const dmesg_status[] = {
> +		[SUCCESS] = "AER: device recovery successful",
> +		[FAILED] = "AER: device recovery failed",
> +	};
> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	size_t i;
> +	ssize_t line_len;
> +	FILE *fp;
> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		for (i = SUCCESS; i < ARRAY_SIZE(dmesg_status); i++) {
> +			if (!dmesg_status[i] || !strstr(buff, dmesg_status[i]))
> +				continue;
> +
> +			igt_debug("Found \"%s\" in dmesg after %d secs\n",
> +				  dmesg_status[i], elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return i;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return TIMEOUT;
> +}
> +
> +/*
> + * TODO: AER device recovery logic is pending to be implemented using
> + * "uevents emitted by the aer driver" instead of relying on the dmesg
> + * logs.
> + */
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 10 * 60; /* 10 mins */
> +	int time_interval = 30; /* 30 secs */
> +	time_t elapsed_time;
> +	char marker[128];
> +	int status;
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);
> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return FAILED;
> +		}
> +		if (status == SUCCESS || status == FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)
> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static bool uncorr_error_recovered;
> +
> +/**
> + * SUBTEST: inject_core_compute_uncorr_error
> + * Description: Inject a Core Compute Uncorrectable error and verify
> + *		AER-based device recovery.
> + *		The dynamic subtests are:
> + *		inject            - Injects Core Compute Uncorrectable error
> + *				    and verifies device recovery.
> + *		post-recovery-wl  - Runs a compute workload on all compute
> + *				    engines after recovery to confirm the GPU
> + *				    remains functional.
> + * Functionality: error injection
> + */
> +static void test_inject_core_compute_uncorr_error(struct xe_mmio *mmio, int fd)
> +{
> +	int counter_before;
> +	int counter_after;
> +	int fw_handle;
> +	bool ret;
> +
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=1 (uncorrectable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
> +	uint32_t error_id = ERROR_ID_CORE_COMPUTE;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	counter_before = get_counter(node_id, error_id);
> +	if (counter_before < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to read error counter before injection\n");
> +	}
> +
> +	if (!acquire_steering_semaphore(mmio)) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Timed out acquiring steering semaphore\n");
> +	}
> +
> +	/* Arm the injection sequence. */
> +	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +	modify_reg_bit(mmio,
> +		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	release_steering_semaphore(mmio);
> +	igt_debug("Injected Core Compute Uncorrectable error\n");
> +
> +	/* Run traffic to trigger the injected error */
> +	ret = run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
> +	if (!ret) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to run Xe compute on all engines post injection\n");
> +	}
> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +
> +	counter_after = get_counter(node_id, error_id);
> +	igt_assert_f(counter_after >= 0, "Failed to read error counter after injection\n");
> +
> +	igt_assert_f(counter_before != UINT32_MAX && counter_after != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     counter_before, counter_after);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 counter_before, counter_after);
> +
> +	igt_assert_f(counter_after > counter_before,
> +		     "Core Compute Uncorrectable error injection failed: "
> +		     "before=%u after=%u\n", counter_before, counter_after);
> +	uncorr_error_recovered = true;
> +}
> +
> +enum xe_err_injection_type {
> +	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
> +	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
> +};
> +
> +static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
> +{
> +	switch (injection) {
> +	case XE_CORE_COMPUTE_UNCORR_ERR_INJ:
> +		test_inject_core_compute_uncorr_error(mmio, fd);
> +		break;
> +	case XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL:
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +		break;
> +	default:
> +		igt_info("Invalid Error Injection specified\n");
> +	}
> +}
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require_f(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY),
> +			      "forcewake_all is not available in debugfs\n");
> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require_f(xe_mmio_is_initialized(&mmio),
> +			      "Failed to initialize Xe MMIO access\n");
> +	}
> +
> +	igt_describe("Inject core compute uncorrectable error and run post-recovery workload.");
> +	igt_subtest_with_dynamic("inject_core_compute_uncorr_error") {
> +		igt_dynamic("inject")
> +			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ, &mmio, fd);
> +
> +		igt_dynamic("post-recovery-wl") {
> +			igt_require_f(uncorr_error_recovered,
> +				      "Run the \"inject\" dynamic subtest first\n");
> +			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL, &mmio, fd);
> +		}
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 519a9e727..c8a4c9a6a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -294,6 +294,7 @@ intel_xe_progs = [
>   	'xe_debugfs',
>   	'xe_dma_buf_sync',
>   	'xe_drm_fdinfo',
> +	'xe_err_injection',
>   	'xe_eu_stall',
>   	'xe_evict',
>   	'xe_evict_ccs',
LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham

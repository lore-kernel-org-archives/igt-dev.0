Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33867607C0AA
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 20:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cens5XmN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168410FED3;
	Wed,  4 Nov 2026 20:09:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E65410FED4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 20:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793822928; x=1825358928;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dEcqNVp8ldDmQ9XyXMnzTcL2Mhw8/QDLbaNtAFOHMQU=;
 b=cens5XmN9K3LhoiZd3/5+KClW6RXVy8gewZLEo5D6OelZsN3vn2zRR91
 Sege9HkUguPWg0YCPdmkVRloSxB+3n+68zkmP6dwSjeuPSpoXuFmIbCDQ
 Uvifab6JtHCuXtJshlqH3bc8pkPITYd8lp2WmPvWfKU6QJ5aKzaPKu+kE
 kOMXXuDbgr8C6vt58Ee0/ETLCc8J1AvMWHNu3y5lNRnBAP2Qf2IWvMYYn
 ikupbiG23LMskBmHf90L7FeapxOxP44oLD+YGExLjv8u++Lwn2+v8hvvZ
 QebH81XVKGVETBJP1R8VO80469eimvgGbdUg93oiAjnSJg/S6fm4k0MgT Q==;
X-CSE-ConnectionGUID: aVxJA4KCSkuIkbQ1At6+qw==
X-CSE-MsgGUID: 60gUbeIkS1Gu7Wz09lzG0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2626946"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2626946"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:08:47 -0800
X-CSE-ConnectionGUID: dMLXtr71RuiFBuWfGqFPvw==
X-CSE-MsgGUID: dyVpBxb7QSKI2J7B6Kps6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7129463"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:08:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 12:08:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 12:08:46 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 12:08:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQznJFJ4z5DSKrNChox/RJzMkiyFYkw1YD9jvE/hmqzCoOkSDIRpp4QMvTEZ1JeIGGui+Kr7rzu62Zs3O2JMCEgMykIP2PGi2R7QdwZxRtwhzxhnfP7S8gDoml4XUkJ4xww+sQQjcWwnTkVK68RfCXunzvWQgEZTziUkdOJHHZeyT6o/Z2AyHOnWDb7sUUshGszrPsmD8fuGY6hAsJqC+Ws8E8q273NIMDIxxXL3cIWEp4131zdy1nIS3oPxMKvNLYy6EXEuAFLZFJgN55w6IKQA6DsymkcSeYFCpaqZOJwloqnW62plo8xI2mighGUwUhXqtvUnUhPTWbNe/npDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePXeeh3CTotVLZ9GCYZVtNIvpJIEHsJLnzykrGoZ27I=;
 b=SETHFWs7y6dIWU/lJvUEkkkhd3+OzCulB59jQXuGAYY858AaVTmT7D5GMSk6SaVVi1VfBgMNgQtGgitVOlE3lTP0+A2VVz2TUqF7CbG32NV6UMrKYsE8M7F84xbcdAkrEmqWNEy6k4qjMhLVZPKf5rwYikhdwdTRBDbJUevPOwe+iVnsUSX5qGAQk7UHcUQjePBbEfiIE/6/uUxbFimC8QxtMguZ60TfNDvK2l3+nF6fj6T7Hnrj+YhtackHjO8LyD+xF5a/2tJAutxCmdXtnYC/+TNtt3XQBrQ9crD7Xs5Pqdrp0K6SaFDALU/mi8hY1/0HQrQpzYpB9t9sLJq6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 20:08:44 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 20:08:44 +0000
Message-ID: <c43be4c8-8e62-41bf-8bb9-b2e389dc3776@intel.com>
Date: Wed, 4 Nov 2026 12:08:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_exec_threads: Add multi-queue
 CGP_SYNC replay subtests
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
 <20261103195149.48923-2-jagmeet.randhawa@intel.com>
 <aut8m2k1Rwjjf2uh@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <aut8m2k1Rwjjf2uh@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: dc784291-f8f8-4d9b-3e0a-08df3aaf6d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|10067099003|4143699003|56012099006|5023799004|11063799006|261022105027099003|261022113327099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261009223327099003|261009223027099003|261009221227099003|261009220027099003|261009221727099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: ktG7Z/XOZHYL/I7gb+2WOKsHdXEXv8Nd/ltVgBPnT/gfwdidjmcGsLE2eghcRRK5i0cosL6ONtBOcGvSm/hUrDSVdwnO4bN27E3TVxldTqFf3eU6U08sKo785vXC3kzwDuNuvsyZPujpbk7GnKS+wZP872db5kGkhvr2CLjONssb08c9XkH7OTAgRNfdMGTOx+FWV5Yc0XhsRhSV+kExfK5m7gwobx1/57YwdnNKiVgRVcdUqy47kYMiCcXwFIj7rAI4bAZZKffp2bPz9E8b7VWFpyscDqGQW9bq6hPLQ7m7EuZ2qjpMu3YJ8LsFhr6p+tq5WqZrepgDon33111qzJOKDqJxdWJqywy9vRV37V96C9RIDg83/BFw7ApKPNLJUza8blmLRBjZThHmm4TBOUWhgilzyfIb9C9egZIR5/r825OlBRiCE/pJ3f/jwNSd7XHu36xL5N+EK5S8mD2DoqvDTIc/JS1/KZ3O4R1VhavOaErMr55Pisox9xsW4nwB8/g8z/wUTE0k+nrf0RThIBCiJ4aiyLESXRos81YPhPqwL8rdXt5nmF0xkgdYY2mchxt48q8k8v784bfL5TC7ENo81prrUMjD2hPtb2mXGcSujX3eQrKWw/qd2AIKzv1W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(261022105027099003)(261022113327099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009220027099003)(261009221727099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTRoRzdCaTVlVEl3YXM1YnIyTnBCMGZCRHZibGhobXVJb3RvYWxUSVl1M2xz?=
 =?utf-8?B?Q0kyMkFoUkRMbjJSM01xNENTNWd0TWFKaUJoeVdIeWlHbmFnQjdWdk85a3Fs?=
 =?utf-8?B?a1BnQjRDMVNPd2p6SHA1SmZTekNkbHZ5RmdYcHE4NERVZ2dISUpHS2I2ck5U?=
 =?utf-8?B?bXBPYnpVWElvdGViSlVEb3VQVkZBZFMxcEVqMTVHNGlOV0NNVTd0bDBFZmY2?=
 =?utf-8?B?am1TRkc1NXJxZXNBYy9lQlNBcVRFNXZlQmVQN3JDUE9KTGRnR3JXN3JnR0Vq?=
 =?utf-8?B?bkNYMFJjMSs0ZElRVCtoWnViS1JDNUdjSDFRMXNod0VVRmd3VWs4eFpPSFI2?=
 =?utf-8?B?Zk12alVmNUd0d3dvMVM3cW45d2wxMlVwRGtCaklzSGNUTnBYZUI4Qm9lOWhC?=
 =?utf-8?B?R2FrditGOFdBM3h1WlVZWTBLQkJHRTl3SDJKb3JibmUyZDk5WUFicE4zekts?=
 =?utf-8?B?V2hySUIybUZRU0Ezb21NamR3eWJVZTBqaVRnN1JES1BFUXhzVTcxZW1jZnBE?=
 =?utf-8?B?d3p5dEFxc0VPdmRRQ3JtL1VWdjFwc1NKYTVId0FTNGhScGxDVjdMSEh0UlVU?=
 =?utf-8?B?L1ArNDRUaE1FTDZnaFYxdkNHR2YyWGFkRGdqUHpTWHlSSGtRRysxSDFGSUJu?=
 =?utf-8?B?WWJ4dXc0T0xqWEJ2OEFPUlVzbWc5N0U3NnBBS2xURlNTa3FUMnhOckluVHFH?=
 =?utf-8?B?Nlg2SVA2aTVzZU5Gbmx5OG11bmhDNlVMNkhTTnpST09hK3ZpZ1hjTUJmS3Rv?=
 =?utf-8?B?NmJaVW11Z2xtVHg1TlJHWGsxUkFhY3FDbGFUSzc5QVFOL3BmR1ZhWGhTa0Vj?=
 =?utf-8?B?ZlcxZy85UlBOZ3RxYWd2REhXdCt4RzNTZmtoV09UeXVISnRmdXVnUFc0Zm95?=
 =?utf-8?B?MEdDaHc2MDBtd2RKTVkrSkxpNEVndDMxb29lRTRabjFDM011VTJOM0hwNm5x?=
 =?utf-8?B?WGMxWUpYTWtsUUVlZkUvNGhmRUZNdEhOYVF4R1lRQWRLUTgzbkd0RGZ1OS9H?=
 =?utf-8?B?TmxZRXFNK0F3MTlUSWtIWXU0aitBNy9kcm9MYVlOY1ZtR3JYc05tN3EvWEx1?=
 =?utf-8?B?NVpsYnM5YWl4d1ZpS21yU0FXbXVYVzJKL3JBTVMrUEJRZSt2bzBKTWhwL2pJ?=
 =?utf-8?B?dms0QXhiL2Z4ZStlemx4MVprOVRqV0VWMzVKZzBqbUhNb2s4ditiSHBadkU3?=
 =?utf-8?B?MGJHb2RwQVpOL2phd1lUVDgwZWtuQXJkSHlOWWp1UWlrTHdkOUlXRWJsR0FQ?=
 =?utf-8?B?VHhyWUMySzd0L0YybStub1ZUV2doWlJOV1VENmtLU1d6ekUxUjJUVHNaUnBk?=
 =?utf-8?B?ZWE2SUxzZG5XWHpGcmo3VGFwNlpWR21uTkUzcDc2bW5McUZCb2NaYkRqN0kx?=
 =?utf-8?B?ay9WeVNtaUVGU0JEL1pRZ3RIaktKZnZMZFFJR0M1WUdxTkE3R1VzMmRwclk5?=
 =?utf-8?B?STU1Qjc4ZGZoT2hYSTg4dVVCd2MyUE9HWE1BQVBFRUEyL2dud0dWZDBoeENC?=
 =?utf-8?B?WUhnODdPYVJITjFLcW03Um1DOFd3YU1MWEZ5dm1ObnhOM0lhSDgxZk14Umk3?=
 =?utf-8?B?Vlh6N0Y2dXp6N1JlVkQrM2R6bW83K05hVHo2ejU2RWVSVTRqaTBLZUtsODNP?=
 =?utf-8?B?UGZsRnJIc3RkMkRZSWx3UkhYUVZySHpOa0RQYU5qMG9jNnJLUmdxRE16dHYz?=
 =?utf-8?B?bit4bW1SOGtuT2xLMFVZcU5BMFFtM21ma2VLbE5CNjBEOFlBN0dla3dzQjFk?=
 =?utf-8?B?Yk8zQ2F1OTRBK3U3aWptZlRvckVJNHlteXFkRGRtZ1FxcjlXS3JOYUk2SjE5?=
 =?utf-8?B?emkrdUVURFMwbmNGOWhUMTFIcUJScTB1ZHdidVdpdWoyK0tsMjZzN3lFN3lz?=
 =?utf-8?B?UXp6Uzc1QkxRV0k5bWpLc1ZnZDYzcEl3RjVlT08wckVBV1Q3d01qVGJnelcr?=
 =?utf-8?B?YkZmbFhKVUtTaGVOR0E0WXJrUW42Z2RIdkt4RmY4N0lhT21NOGVZTHJONU9n?=
 =?utf-8?B?aktZVVFJN3BHZ3dwWE80TXYvK092bElKSFVDVks3Mm5LU3ByVStHbEZsL21O?=
 =?utf-8?B?WENsRlJ0bm9TN3N6MXdJcTFzODAzT3NVOWNNNzdYeEZXZWdzNXZpcVJoYThq?=
 =?utf-8?B?Z3dEMm52YzJlRko5YmE0blU2UHdBVTE2Q2x4NGczazJSZVhZM1RLbTdkcHdC?=
 =?utf-8?B?aVdXczBObktoYXZvbXA4WUVXcUgrT2lCRTEwdlFBcEk0SzNlMnBwd1hHbGRw?=
 =?utf-8?B?elRSYjlHblpYcHExVTNVRS9Ob21UdmhXNVp3enZHVFBPRXhkTjJXMGhROEl4?=
 =?utf-8?B?NDZZSW8xVXB4MzN3WWdzbHFNUUhBb1QxZE1HK2JPYkNHUTh5bkUzVVBjVkcz?=
 =?utf-8?Q?GFLTfjDAQ9cXQPOs=3D?=
X-Exchange-RoutingPolicyChecked: uc4b97uqy5LJdoCUxg0/L033jrBlOFvkq28mUvqWRFRhDixJWkfhDikZ5w43xtzCA/HQhKMlj+XE/97ip5cmGkT7B2cu5GlTdjrqQVbT6wvdrj/Xi33Kr+dOAQeATa8Za/NTTv6omz6JWbLaGmvlpyARKsg0LE/3saaOHYfGMiAOu8XfpEt5TFPo+CLuVTR7D6n6LgL07QfKm4UpspZmAHeoX1gOTWGy5EtWhq9X2dpEHsLEPM4n7FdLV3OiDH6KTx9BH28lXn3KiOB3ShBiGc0uX89lunmhv3g+oMFQk4BunI5g+YBMTaH8lMHDdqWUXmEz/ekFdgh/WOPFclNzIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc784291-f8f8-4d9b-3e0a-08df3aaf6d72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 20:08:44.0809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGCUADeLGHjAxfh7zjrnMgvj2FlDx0gcYz/KmjTJzpvxlXCTMwZ2PbxljAKZbJ+MICzPZUjNtzskc284nkHkgQoatSHoy7ON6LbE5OSbTVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
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


On 11/4/2026 10:42 AM, Niranjana Vishwanathapura wrote:
> On Tue, Nov 03, 2026 at 07:51:49PM +0000, Jagmeet Randhawa wrote:
>> Add coverage for the replay paths introduced by "drm/xe/multi_queue: 
>> Handle
>> lost message during VF migration":
>> https://patchwork.freedesktop.org/series/165324/
>>
>> A CGP_SYNC message can be lost during VF migration and is replayed by 
>> the
>> KMD on recovery. Exercising that needs a CGP_SYNC queued or 
>> outstanding on
>> a live multi-queue group when the migration lands.
>>
>> A group serialises on one outstanding sync, so both CGP sources are 
>> needed:
>> queue creation for registration updates, MULTI_QUEUE_PRIORITY for 
>> dynamic
>> ones.
>>
>> A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
>> queues than that spans several groups and registers them in parallel.
>>
>> Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates 
>> after
>> each exec, alternating the values since the KMD ignores a set to the
>> current value.
>>
>> Add two subtests built from these sources, repeated under
>> igt_until_timeout() with a bounded wall clock:
>>
>>  multi-queue-many-groups      registers several full groups in parallel
>>                               from multiple workers per engine
>>  multi-queue-groups-priority  drives dynamic updates on those groups 
>> from
>>                               a single worker per engine
>>
>> The two cannot be merged. Driving dynamic updates alongside many 
>> parallel
>> registrations makes an update wait long enough to exceed the KMD sync
>> timeout, which bans the group instead of leaving the update to be 
>> replayed.
>>
>> v3:
>> - Use the MULTI_QUEUE prefix.
>> - Drop the many groups flag and derive the group layout from the queue
>>   count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
>> - Define the multi-queue extension once and only vary the extension
>>   passed to xe_exec_queue_create().
>> - Take the worker and queue counts from the section rather than deriving
>>   them from flags, on top of the preceding patch.
>> - Four subtests down to two. Neither remaining subtest destroys 
>> queues, so
>>   the churn flag and the queue recreate path are dropped entirely rather
>>   than renamed: registration traffic comes from the repeated runs under
>>   igt_until_timeout().
>>
>> v2:
>> - Drop the secondary churn. A secondary cannot be replaced within a live
>>   group, so MANY_QUEUES is no longer combined with MULTI_QUEUE and
>>   MQ_CHURN_INTERVAL is gone.
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>> tests/intel/xe_exec_threads.c | 89 ++++++++++++++++++++++++++++++-----
>> 1 file changed, 77 insertions(+), 12 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_threads.c 
>> b/tests/intel/xe_exec_threads.c
>> index e7e472b4a..19d7e8fdd 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -31,7 +31,7 @@
>> #include "xe/xe_spin.h"
>> #include <string.h>
>>
>> -#define MAX_N_EXEC_QUEUES    16
>> +#define MAX_N_EXEC_QUEUES    512
>
> If we want to increase this, then probably we need to dynamically
> allocate memory for arrays that are currently using MAX_N_EXEC_QUEUES
> as count and are having memory allocated in the stack. And allocate only
> the required size. Otherwise, we are simply increasing the size of those
> arrays even for cases where it is not required.
Agreed. MAX_N_EXEC_QUEUES goes back to 16 and the legacy mode arrays are
allocated to n_exec_queues instead, so nothing else grows.
>
>> #define N_EXEC_QUEUE        16
>> #define USERPTR        (0x1 << 0)
>> #define REBIND        (0x1 << 1)
>> @@ -50,6 +50,30 @@
>> #define MANY_QUEUES    (0x1 << 14)
>> #define MULTI_QUEUE        (0x1 << 15)
>> #define WQ_STRESS        (0x1 << 16)
>> +#define MULTI_QUEUE_PRIORITY    (0x1 << 17)
>> +
>> +/* Mirrors XE_MAX_GROUP_SIZE: one primary plus its secondaries. */
>> +#define MULTI_QUEUE_GROUP_SIZE    64
>> +
>> +/* Enough queues to span several full multi-queue groups. */
>> +#define N_EXEC_QUEUE_MULTI_GROUP    (8 * MULTI_QUEUE_GROUP_SIZE)
>> +
>> +/*
>> + * Multi-queue priority updates issued per exec. The values must 
>> alternate:
>> + * the KMD ignores a priority set to its current value, so a 
>> constant value
>> + * would generate no CGP_SYNC traffic at all.
>> + */
>> +#define MULTI_QUEUE_PRIORITY_BURST    8
>> +
>> +/*
>> + * Workers per engine for the registration subtest. Registering several
>> + * groups at once widens the window where one queue's CGP_SYNC is still
>> + * outstanding while another queue waits on it.
>> + */
>> +#define MULTI_QUEUE_REG_THREADS    8
>> +
>> +/* Wall clock budget for the CGP_SYNC replay subtests. */
>> +#define CGP_REPEAT_SEC        5
>>
>> /*
>>  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
>> @@ -611,6 +635,18 @@ test_compute_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>     }
>> }
>>
>> +/*
>> + * Group membership for the queue at @i. A group holds at most
>> + * MULTI_QUEUE_GROUP_SIZE queues, so a larger queue count simply spans
>> + * several groups.
>> + */
>> +static uint64_t multi_queue_group_value(uint32_t *exec_queues, int i)
>> +{
>> +    return i % MULTI_QUEUE_GROUP_SIZE ?
>> +           exec_queues[(i / MULTI_QUEUE_GROUP_SIZE) * 
>> MULTI_QUEUE_GROUP_SIZE] :
>
> NIT: can use 'exec_queues[i & ~(MULTI_QUEUE_GROUP_SIZE - 1)]'
Done.
>
>> +           DRM_XE_MULTI_GROUP_CREATE;
>> +}
>> +
>> static void
>> test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>>          struct drm_xe_engine_class_instance *eci, int n_exec_queues,
>> @@ -638,6 +674,12 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>         uint32_t data;
>>     } *data;
>>     struct xe_spin_opts spin_opts = { .preempt = false };
>> +    struct drm_xe_ext_set_property multi_queue = {
>> +        .base.next_extension = 0,
>> +        .base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +        .property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> +    };
>> +    uint64_t multi_queue_ext = to_user_pointer(&multi_queue);
>
> We don't need to move this here if there is only one place where it is 
> used.
Agreed, moved back to its only use site.
>
>>     int i, j, b, hang_exec_queue = n_exec_queues / 2;
>>     bool owns_vm = false, owns_fd = false;
>>
>> @@ -679,16 +721,9 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>     memset(sync_all, 0, sizeof(sync_all));
>>     for (i = 0; i < n_exec_queues; i++) {
>>         if (flags & MULTI_QUEUE) {
>> -            struct drm_xe_ext_set_property multi_queue = {
>> -                .base.next_extension = 0,
>> -                .base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> -                .property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> -            };
>> -
>> -            uint64_t ext = to_user_pointer(&multi_queue);
>> -
>> -            multi_queue.value = i ? exec_queues[0] : 
>> DRM_XE_MULTI_GROUP_CREATE;
>> -            exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>> +            multi_queue.value = multi_queue_group_value(exec_queues, 
>> i);
>> +            exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>> +                                  multi_queue_ext);
>>         } else {
>>             if (!(flags & MANY_QUEUES))
>>                 exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>> @@ -785,6 +820,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>             xe_exec(fd, &exec);
>>         }
>>
>> +        if (flags & MULTI_QUEUE_PRIORITY) {
>> +            uint32_t prop =
>> + DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
>> +            int z;
>> +
>> +            for (z = 0; z < MULTI_QUEUE_PRIORITY_BURST; z++)
>> +                xe_exec_queue_set_property(fd, exec_queues[e],
>> +                               prop, z & 1);
>> +        }
>> +
>>         if (flags & REBIND && i && !(i & 0x1f)) {
>>             xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
>>                        0, addr, bo_size,
>> @@ -1228,6 +1273,10 @@ static void *thread(void *data)
>>  * arg[1]:
>>  * @multi-queue-basic:
>>  *    multi-queue basic
>> + * @multi-queue-many-groups:
>> + *    multi-queue many groups
>> + * @multi-queue-groups-priority:
>> + *    multi-queue groups priority
>>  * @multi-queue-userptr:
>>  *    multi-queue userptr
>>  * @multi-queue-rebind:
>> @@ -1503,6 +1552,9 @@ int igt_main()
>>     const struct section {
>>         const char *name;
>>         unsigned int flags;
>> +        unsigned int repeat_secs;
>> +        int n_threads_per_engine;
>> +        int n_exec_queues;
>>     } sections[] = {
>>         { "basic", 0 },
>>         { "many-queues", MANY_QUEUES },
>> @@ -1749,6 +1801,10 @@ int igt_main()
>>             USERPTR | INVALIDATE },
>>         { "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | 
>> COMPUTE_MODE | FD |
>>             USERPTR | INVALIDATE | RACE },
>> +        { "multi-queue-many-groups", MULTI_QUEUE, CGP_REPEAT_SEC,
>> +            MULTI_QUEUE_REG_THREADS, N_EXEC_QUEUE_MULTI_GROUP },
>> +        { "multi-queue-groups-priority", MULTI_QUEUE | 
>> MULTI_QUEUE_PRIORITY,
>> +            CGP_REPEAT_SEC, 1, N_EXEC_QUEUE_MULTI_GROUP },
>
> So, we no longer need multi-queue-primary-only case where we destroy 
> and re-create
> queues (as in MANY_QUEUES) any more?
>
> Niranjana
Correct. Neither subtest destroys queues: registration traffic comes 
from the
repeated runs under igt_until_timeout(), each of which creates the groups
afresh. Since nothing would set the flag, it and the recreate path are 
dropped
rather than left unreachable. Happy to add it back as a third subtest if you
would rather have explicit churn coverage.
>
>>         { NULL },
>>     };
>>     int fd;
>> @@ -1758,6 +1814,11 @@ int igt_main()
>>
>>     for (const struct section *s = sections; s->name; s++) {
>>         igt_subtest_f("threads-%s", s->name) {
>> +            int n_threads = s->n_threads_per_engine ?
>> +                s->n_threads_per_engine : 1;
>> +            int n_queues = s->n_exec_queues ?
>> +                s->n_exec_queues : N_EXEC_QUEUE;
>> +
>>             if (s->flags & MULTI_QUEUE) {
>>                 igt_skip_on_f(!(xe_has_multi_queue_engine(fd)),
>>                         "multi_queue is supported on graphics version 
>> 35 and above");
>> @@ -1768,7 +1829,11 @@ int igt_main()
>>             if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
>>                 ignore_multi_queue_hang_warnings_in_dmesg();
>>
>> -            threads(fd, s->flags, 1, N_EXEC_QUEUE);
>> +            if (s->repeat_secs)
>> +                igt_until_timeout(s->repeat_secs)
>> +                    threads(fd, s->flags, n_threads, n_queues);
>> +            else
>> +                threads(fd, s->flags, n_threads, n_queues);
>>         }
>>     }
>>
>> -- 
>> 2.53.0
>>

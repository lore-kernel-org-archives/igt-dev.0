Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE072606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CXUYhhnj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B5710E214;
	Fri, 30 Oct 2026 16:53:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C2310E214
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793379158; x=1824915158;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SOl0LCdxHgH1HQhxGUft81mb2ee/WbC9GTPESFPSFDs=;
 b=CXUYhhnjgTJDy35fTDFZyQu8+sOaDxGb2XNWtVc3TJNegv2J/iS+eG0o
 6W1/pPu+DwpkId2swXT5hSu/y/Kf5rbBCuBLIS6OKUU4E+AKHxIKRxHja
 8ODl4uE6nAiHG+kH4WL2seDmI0QnchAM0ZPT65dPyp6kqgpkad7pihvpk
 FHeCy4jsjhrI2rGPN3DEwzAM3Z9Fxr7dFZauP88Vsr8oIAvU9obrzrOhR
 mBMoKeHuJTlA7bphrY0bFmD5TuSlBfKuv+mOzeLvflQAPuoSk/zPNr45I
 D3uy978zisvoBSaWp5ztC2Ufk4qmDtaNLr2mGWd6Hb9SbOUeZplB0Qjhd A==;
X-CSE-ConnectionGUID: tGbaN87tQk+qWMWa5Kg5LA==
X-CSE-MsgGUID: VcQtwxIEQIm2j64vT261FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2025195"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2025195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 09:52:20 -0700
X-CSE-ConnectionGUID: I0oiiPVJTDi0HWdtRkm9LA==
X-CSE-MsgGUID: e9Ko2x41SMWKeDW/Q+VFKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5862884"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 09:52:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 09:52:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 09:52:19 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 09:52:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fy66BQAf7sil49Y8woV8FtJ/RUkwKkd/awSvRRNh7B1U6VVIMlCn0DTnIBe/yUJiY75hIbVm82zQvtV6zE+2iwvT/n2afEfj85urSdH9uXyJmZ3cje8u2RjZv/9onDCm01SoctRI5ipfrbjPBa1aFEASdHpDL+t/GHfqvOGXhCfsJYG38UVBE2/Wi326cC7J72k+wB09LRK2ru83HyUd+AmZ0Bam6XC0yXnbd/OuuZ4+XErWCdhAicJSn/dsNHSbJ4xBUHAhWuOvoX2g7T7lKQi3avDN1a61d1BblUhQVo0ty7Z34mMb/pj9wbv8oIWMgAVEKjxT7c+PmG0k8KdA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxS5q96zJriUyMsY7Lkdvk7nBIOKWtPdMpmoaDgCllk=;
 b=dm2Mfpyfzd++rrtMwSDUqEVcMK/PKlUxdF+yxYyKVJ9JFQs+KgGrZF3HwsqdTWErWpo9/rlpx6TghLAjraJrNry9kFuEuhIYe5VAH3imtn3qiU/h/kRuWAd9+Ks0NJ9KL2JPYZHUoOMDynt2COE4Ha0lZo1SFWixgcSJtPvvmqM75TkeHMGie/lofAKns00MyVxX25+rF6dgK40o6KZ4s31Cu+yVYWpUyrVYuxCMcX4vrTEY47mWjgFSVXoDsOqks9NE7GDeULG3GCRM4GJDjzC+lZL1tpHlo11jXcObiP2P5+7UpDowKdwK1VMW55m5gNDRMRin/08TaILxzqM3ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 CH8PR11MB033160.namprd11.prod.outlook.com (2603:10b6:610:709::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 16:52:12 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 16:52:12 +0000
Message-ID: <6a4caeff-7cbe-4096-ab1b-1f85c4ca1b0d@intel.com>
Date: Fri, 30 Oct 2026 22:22:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] tests/intel/xe_err_injection: Add Core Compute
 Uncorr Error injection
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-8-ravi.kishore.koppuravuri@intel.com>
 <a774eaf1-6156-41f6-a8f5-35bd2595f5d9@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <a774eaf1-6156-41f6-a8f5-35bd2595f5d9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::10) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|CH8PR11MB033160:EE_
X-MS-Office365-Filtering-Correlation-Id: 32916764-8b3b-4cfe-c0dc-08df36a624b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|261026140227099003|261026121527099003|261028144727099003|10067099003|261021121427099003|261022105027099003|261022113327099003|261009223027099003|261009221727099003|261009220027099003|261009223327099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: q8ngxJqrP1nUe0TndYLbAMhvVx74rMbMsjY4O73I8GZr4FA5tF8sjZUz3exaw8d2NpFXT/q3xbK+1zt5/9+uwJpV7rlmcQ5o6TC5TUrJZKG+y7AbBbUNlUnG6B6UV2gKNFbFubSOdJ3lqrhWjaIe7uLkp/eRWOCo6g8szOfv80LDJl4UdTpIsLeJg7lJ2Kcux3CXK6+LEF/dskXm+eVkBPiI8yJz9A5kExFdvrNiAYPrziFTjUDVgjd/H9AfZkZQVW5JZb2HNWoEeNVAKPSSYvpIi0QfWL6bIPSajdqixj/M1Y2Vp3kn8bM1LdUtPQiexovYpPuFbKoctJQdtBGReyqEWVqdbce2uJK+m6Nw3VUBoi3TqO3NHr+OU2BuR8BNmyAExNwzgvEG7jtAdQN0VMVyRJs8OQSjT/EOHbSeORltbzjF5CJOXdEP5GROJF2keWock+u81o3cyakK5JkYjyBI/SdFn4wCr8WSSx3cyI7c3AiHtjws5f0MdKq7RGqXNeEvmfv2o7VXk9vy/8XjR30PcFIeHa4Wsgp5LHig6GK9U4cAF9t53Z5ftkU3LjzwHw4tMc52sF9YNFGlqJcaXjvfK85CMBVY7Oo05VhWClpWFessAMTvq+U/o4ezT8NOcSgjBGA8AS5AcF2S1uKIIsszcXz/zvyV1qIVErpoBgo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261021121427099003)(261022105027099003)(261022113327099003)(261009223027099003)(261009221727099003)(261009220027099003)(261009223327099003)(261009221227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFZ3aDU2b2laV2tobmNmVWJIekpUZGFFdUZYRmtHTDRtTFQ5ZWNPS3QwQnpm?=
 =?utf-8?B?S1lEbnVIMWo5NGpiK2p2WFM1c01CRGJkeWxCa3ZrK1BHZVU3L21ORlB1dGgz?=
 =?utf-8?B?dVo1WVdsblNBcUYzY0h5LzNnRzBTYnNjdnV4dkRCYXpJeFIrYUNORHg5TlFC?=
 =?utf-8?B?S1NKeGtuUjBTYmlvS1FzUWdaYWUyNERKcHFxQ2xvWmdtU1pia3JuNCtETVZT?=
 =?utf-8?B?SDFMOXpVQ2cyV0N5OHIyNEhnVHN0RUk2UWc1L3RxRi9tQXdCZC9jNGRYOURl?=
 =?utf-8?B?cE53U1hTdWxmY0RnSzloNlpOcnFYSlNScWp4NmFvNzZMem0vYjdSaXhEbHhG?=
 =?utf-8?B?NUlRckxUczZMR3AySG8veTZuVDI5VzZ5emFvNDlZa0NSeWZvWFoyTDZGM1ZN?=
 =?utf-8?B?STIxUDBwZFBrdHIyMTRUKzZPRmpzdUFicVRWRE1zcVI0QmVNQ1F2eXJTN1lY?=
 =?utf-8?B?RFUzejQwQUVzc0pmQWM5QjU2eG5GNHBaN2UyeFdlWlpRc08yUzQ5TWRmK1J6?=
 =?utf-8?B?OFFubEtqZEFGSGsxa1p6Tm1EektyWktxUHhhcGtkc2xLN1hYWXpSZVgva01F?=
 =?utf-8?B?ZDg1RWp4dkZKN2Fpb3RVejFtaWE0VlRYd3NGSjlmeFQwR0NrSmhNRCtseFp2?=
 =?utf-8?B?MnF4R3RmWStyQUFjY3ArbU5VVnRvVUNxNXhXSW4zb3R0bHdLeG1QeUs5cmM1?=
 =?utf-8?B?YVJ3TmY5dlNoSm9yWmM1NDNMM0VwNFdramJTOU9kU1k3SmVlQ0I2d1A3MGF4?=
 =?utf-8?B?K0djZzAvNURyVnpGRjdaa3dWNGl4cTlCY0Q5VmpwTTFpRFNuLzBPdE5qUUlq?=
 =?utf-8?B?S1JoTzdwQktNWUQyN05UeklJQy9NRlZlUWZCSWQwbkxSVnlPUTluaHpaK1oy?=
 =?utf-8?B?dnZZL1VwNTNYVDNYOTlYeG1US0RUVmJJU0xlNjBHeXlLOC9PKzJwZzhpUkJL?=
 =?utf-8?B?bHFYKzhSOFhoVFdsOTZNYTVNUitobHVnaEY1dk9ZS3B0RHFsRStyN1pxNkNu?=
 =?utf-8?B?Zng2WS9PSEVkZzF5K1MxR2FJSENWbmhYSjhNaFBxSkI1RndldG1oS3NsbTk2?=
 =?utf-8?B?aG5EWlkra1pIb2UwL3lzdUZ5RkZMOUZ4R1FTSFpUemlPZUU2ajRKRHJUSVA3?=
 =?utf-8?B?akVLWEhkUkJESFptbjVYcDkxS3VMV1ZBeS96SG9rSE13eER1c0t0cTlUamtL?=
 =?utf-8?B?dldPQzJMck5ud0JKUFVNZGcwZ0FMOHFVV0VXWER2M1pIRDd0SnRoNFJSK1JH?=
 =?utf-8?B?Znc5QUxXN0RNOW8vQSttVzh4WSszRSt1MWxDenlXTlBtQXp5MWpsL2RFcm5T?=
 =?utf-8?B?MytwYWYvRWtEZmkxZTM5WDZRdEJOcFl5NHBOWlgzdmJBcjBReU5CSnVlQkx2?=
 =?utf-8?B?R2I4QkFrNlpXczRjVDhRYTRlNE85aE9LLzZSVldHK2JGVDU3N3RRMnRvTEpl?=
 =?utf-8?B?SWZNK1pvSm9lenBuTnVaWWFZV2I0TnVwZW9lWWRWQ09Td0JGc0hzK0czSGhE?=
 =?utf-8?B?ekdKd3BsY0tBZ0locTRqY2ZjbHdsWVhFeXFGRlNETU85ekFVQnlwcmhEOS9M?=
 =?utf-8?B?RGw1d2tES2l0L1ExR21xRUdnZlE0enVrdkNySlRiTlNpSUk1S3hzTzdzUjhC?=
 =?utf-8?B?Yk5yN3BZR3NEbVpBR09DeHlpWTZqam5vZEF6Z0ZkakJUQjQrYWNBOG83S243?=
 =?utf-8?B?eUptUXBiV0l3cXdJNE5uMERhREt0RTVZVno3ZjRvTkRpOFdjZ3FIK2l3Ujln?=
 =?utf-8?B?ZTRhVnlzcGZqcTA4SVdhWXBZZ0NncHQxSUdXSWx1dkNJKzNpdk9nVnh0dFNl?=
 =?utf-8?B?ZlJMcnBHaE9VejJ5akhKQlZ1SHlYSlZjWlF2L0JFTXV5WFBaTjJJckFIaVpL?=
 =?utf-8?B?bStxcGp5OFpJaTRZQ0NyVitSenJvWVNwbWNoNnFNOE9HQU1PZzFFMEtHMnJh?=
 =?utf-8?B?VG9GWUh3QXJLVENUdklxNGZyRHJKZS9FWjNHUHRZcUVwNjlvaXdRRVgrRkZ0?=
 =?utf-8?B?aVpEaU04SEFtd0VscUtFVEUzbFQ3a0YxTUdtSHEzWTdOcFVBUzVwcDNYcTFt?=
 =?utf-8?B?S0s5UHhWT0NSQXZHMkxzT2pRTmN3dWtDMGJMTHZFTldmZEFnY0gySFFXQlBX?=
 =?utf-8?B?ODl0TTRjOEE1WUZiWnpRTnRQMWpaR1VGVXU1U2lMTXpQZUE5a2VJYzhUZ25y?=
 =?utf-8?B?UndNWlFPKzkyUnMwSFNseFpLdGNBL0N2dFpxQWxBMmoxRVhKNUVLTU1XNHI0?=
 =?utf-8?B?a0VTZ3hOSjJXdFRRa0hqcXh2cWtFZUtzaGM5Z0Y0UGlTL1Q2Y0Jkd1B0MUly?=
 =?utf-8?B?aXBQaDZWZnV0WmlPMGw3V1drK1EvQUQ0RU8rd25FeDNBZGlhU0hHUEt1a3dq?=
 =?utf-8?Q?0I4IdQvnuovCGB1VTYuXmiQ6qDsNybiIKb05g?=
X-Exchange-RoutingPolicyChecked: h2Q/fJsyRlthzi2aBzQViTV/bwXZ7tu1/UB3NjMnLZCJbrqe5d09eMoNQcvBClVdMLZZZS4mK0ufj8ZXmVpJ6gW6Rt7xFF/h1WJp549JmB6il85+4VRrx1OzVyx+Ps2iJ+gOmKrY9eAVi+2xRh53D6CZkopSTw5ApOrGqri4ESFo6+0pkeaViLIKROUEC5IBix3gk1Vzz5CM9/axrQehyAt8YbAKs9Eu8k5ekqZrtO68PtviJzQ9K8qAIjfH3cv3lqAFcv3GvkGh0PExg7JRYFswJETZW+gWwzk7yo5j8hSfGdfO9IDq+fdUMsr/1lF3F/ag5XqRJj79Vxaq6ou8rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32916764-8b3b-4cfe-c0dc-08df36a624b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 16:52:12.1264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3L5+pKJyrgWdvdfkkylWUlr7M+qxNlBhSLnIUmyPHVP+KD1Bu6RcsiMxKfTj2uS/bIRk1MMgkOgSUBkQHDNrrRn3z+6Odtz82o4Aqf5QzZzmUq25jJ2CO9B/DisdDc3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB033160
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

On 30-10-2026 17:06, Purkait, Soham wrote:
> Hi Ravi,
>
> On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
>> Add MMIO based Core Compute Uncorrectable Error injection to verify
>> the Xe driver error handling and recovery flows with the help of
>> DRM Netlink API suite
>>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v6:
>>    - Updated aquire steering semaphore logic (Soham & Riana)
>>    - Removed enum to string mappings for test names (Riana)
>>    - Updated metadata in the file (Riana)
>> v5:
>>    - Removed xe_err_injection.h and moved its contents into the .c 
>> file (Riana)
>>    - Prefixed all register address and bit value names with "XE_" 
>> (Riana)
>>    - Updated AER recovery dmesg strings to use enum-indexed arrays 
>> (Soham)
>>    - Added error handling logic for function calls
>>    - Changed test name comparisons from strings to enums (Riana)
>>    - Added UC test and post-recovery workload tests as dynamic 
>> subtests (Riana)
>> v4:
>>    - Added Steer Semaphore for disabling and enabling multicast
>>      operation(soham)
>>    - Increased device recovery check timeout from 5secs to 10secs
>>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>>      Jani & Kamil)
>> ---
>>   tests/intel/xe_err_injection.c | 382 +++++++++++++++++++++++++++++++++
>>   tests/meson.build              |   1 +
>>   2 files changed, 383 insertions(+)
>>   create mode 100644 tests/intel/xe_err_injection.c
>>
>> diff --git a/tests/intel/xe_err_injection.c 
>> b/tests/intel/xe_err_injection.c
>> new file mode 100644
>> index 000000000..2f5f85b07
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -0,0 +1,382 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) 
>> MMIO based Error Injection
>> + * Category: Core
>> + * Mega feature: RAS
>> + * Sub-category: RAS tests
>> + * Functionality: Error Injection
>> + * Test category: Functional tests
>> + */
>> +
>> +#include <fcntl.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <time.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_drm_ras_nl.h"
>> +#include "lib/intel_reg.h"
>> +#include "lib/intel_compute.h"
>> +
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_mmio.h"
>> +#include "xe/xe_query.h"
>> +
>> +/* Steering Control Register (MC_PKT_CTRL) */
>> +#define XE_MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
>> +#define XE_MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
>> +
>> +/* Core Compute Uncorrectable error injection */
>> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
>> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
>> +
>> +#define POST_RECOVERY_WL 1
>> +#define POST_ARMING_INJECTION_WL 0
>> +
>> +/* STEER_SEMAPHORE_MGSR_3D */
>> +#define XE_STEER_SEMAPHORE_MGSR_3D 0x00FD0
>> +#define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
>> +
>> +/* Node types for error counters*/
>> +#define NODE_ID_UNCORRECTABLE_ERROR 1
>> +
>> +/* Error types for error counter */
>> +#define ERROR_ID_CORE_COMPUTE 1
>> +
>> +enum {
>> +    SUCCESS = 1,
>> +    FAILED,
>> +    TIMEOUT,
>> +};
>> +
>> +static bool run_xe_compute_on_all_engines(int fd, bool state)
>> +{
>> +    struct drm_xe_engine_class_instance *hwe;
>> +    bool ret = false;
>> +
>> +    igt_info("Running compute-square on all engines post %s\n",
>> +         state == POST_ARMING_INJECTION_WL ? "injection" : "recovery");
>> +
>> +    xe_for_each_engine(fd, hwe) {
>> +        if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +            continue;
>> +
>> +        ret = xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL, 
>> EXECENV_PREF_SYSTEM);
> In case of multiple compute engines the previous error codes will be 
> masked.
will update it.
>> +    }
>> +    return ret;
>> +}
>> +
>> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
>> +               uint32_t bit_mask, bool set)
>> +{
>> +    uint32_t regval;
>> +
>> +    regval = xe_mmio_read32(mmio, reg_addr);
>> +    if (set)
>> +        regval |= bit_mask;
>> +    else
>> +        regval &= ~bit_mask;
>> +
>> +    xe_mmio_write32(mmio, reg_addr, regval);
>> +}
>> +
>> +static bool acquire_steering_semaphore(struct xe_mmio *mmio)
>> +{
>> +    uint32_t regval;
>> +    time_t start_time = time(NULL);
>> +    time_t timeout = 10; /* 10 secs */
>> +
>> +    while (time(NULL) - start_time < timeout) {
>> +        regval = xe_mmio_read32(mmio, XE_STEER_SEMAPHORE_MGSR_3D);
>> +        if (regval == XE_STEER_SEMAPHORE_MGSR_3D_VALUE)
>> +            return true;
> Would a short sleep in between reads be gentler here?
it would help in stopping busy wait and goto sleep state. will add.
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static void release_steering_semaphore(struct xe_mmio *mmio)
>> +{
>> +    xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D,
>> +            XE_STEER_SEMAPHORE_MGSR_3D_VALUE);
>> +}
>> +
>> +static int acquire_forcewake(int fd)
>> +{
>> +    int fw_handle;
>> +
>> +    fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +    igt_assert_lte(0, fw_handle);
>> +    return fw_handle;
>> +}
>> +
>> +static void release_forcewake(int fw_handle)
>> +{
>> +    if (fw_handle >= 0)
>> +        close(fw_handle);
>> +}
>> +
>> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>> +{
>> +    struct igt_drm_ras_nl_context ctx;
>> +    int ret;
>> +    uint32_t error_value = UINT32_MAX;
>> +
>> +    ret = igt_drm_ras_nl_init(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to initialize socket for get_error command 
>> (ret=%d)\n", ret);
>> +        return ret;
> Return type is uint32_t but ret is negative.
will change the return type to int
>> +    }
>> +
>> +    ctx.node_id = node_id;
>> +    ctx.error_id = error_id;
>> +
>> +    ret = igt_drm_ras_nl_get_error_counter(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("get_error_counter failed from error command path 
>> (ret=%d)\n", ret);
>> +        igt_drm_ras_nl_cleanup(&ctx);
>> +        return ret;
> Ditto.
will change the return type to int
>> +    } else {
>> +        error_value = ctx.error_value;
>> +        igt_info("get_error_counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +             ctx.node_id, ctx.error_id, ctx.error_value);
>> +    }
>> +
>> +    igt_drm_ras_nl_cleanup(&ctx);
>> +
>> +    return error_value;
>> +}
>> +
>> +static int check_dmesg(const char *marker, int elapsed_secs)
>> +{
>> +    static const char * const dmesg_status[] = {
>> +        [SUCCESS] = "AER: device recovery successful",
>> +        [FAILED] = "AER: device recovery failed",
>> +    };
>> +    char *buff = NULL;
>> +    size_t buff_size = 0;
>> +    size_t i;
>> +    ssize_t line_len;
>> +    FILE *fp;
>> +    bool marker_seen = false;
>> +
>> +    fp = popen("dmesg", "r");
>> +    if (!fp) {
>> +        igt_warn("Unable to open dmesg to check recovery status\n");
>> +        return -1;
>> +    }
>> +
>> +    while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
>> +        if (!marker_seen) {
>> +            if (strstr(buff, marker))
>> +                marker_seen = true;
>> +            continue;
>> +        }
>> +
>> +        for (i = SUCCESS; i < ARRAY_SIZE(dmesg_status); i++) {
>> +            if (!dmesg_status[i] || !strstr(buff, dmesg_status[i]))
>> +                continue;
>> +
>> +            igt_debug("Found \"%s\" in dmesg after %d secs\n",
>> +                  dmesg_status[i], elapsed_secs);
>> +            free(buff);
>> +            pclose(fp);
>> +            return i;
>> +        }
>> +    }
>> +
>> +    free(buff);
>> +    pclose(fp);
>> +    return TIMEOUT;
>> +}
>> +
>> +/*
>> + * TODO: AER device recovery logic is pending to be implemented using
>> + * "uevents emitted by the aer driver" instead of relying on the dmesg
>> + * logs.
>> + */
>> +
>> +static int check_err_recovery(void)
>> +{
>> +    time_t start_time = time(NULL);
>> +    time_t timeout = 10 * 60; /* 10 mins */
>> +    int time_interval = 30; /* 30 secs */
>> +    time_t elapsed_time;
>> +    int status;
>> +    char marker[128];
>> +
>> +    snprintf(marker, sizeof(marker),
>> +         "IGT xe_err_injection recovery marker pid=%d start=%lld",
>> +         getpid(), (long long)start_time);
>> +    igt_kmsg(KMSG_INFO "%s\n", marker);
>> +
>> +    while (1) {
>> +        elapsed_time = time(NULL) - start_time;
>> +        status = check_dmesg(marker, elapsed_time);
>> +        if (status < 0) {
>> +            igt_warn("Failed to query dmesg for recovery status\n");
>> +            return FAILED;
>> +        }
>> +        if (status == SUCCESS || status == FAILED)
>> +            return status;
>> +
>> +        if (elapsed_time >= timeout) {
>> +            igt_warn("Timed out while waiting for error recovery\n");
>> +            return TIMEOUT;
>> +        }
>> +
>> +        sleep(time_interval);
>> +    }
>> +}
>> +
>> +static void print_aer_recovery_status(void)
> Could it be renamed to assert_aer_recovery() ?
This function asserts on timeout or recovery failure cases, but prints a 
success message when recovery succeeds. IMO, the existing name better 
reflects both behaviors.
>> +{
>> +    int recovery_ret;
>> +
>> +    recovery_ret = check_err_recovery();
>> +    igt_assert_f(recovery_ret != TIMEOUT,
>> +             "AER error recovery timed out\n");
>> +    igt_assert_f(recovery_ret != FAILED,
>> +             "AER device recovery failed\n");
>> +    if (recovery_ret == SUCCESS)
>> +        igt_info("AER device recovery successful\n");
>> +}
>> +
>> +static bool uncorr_error_recovered;
>> +
>> +/**
>> + * SUBTEST: inject_core_compute_uncorr_error
>> + * Description: Inject a Core Compute Uncorrectable error and verify
>> + *        AER-based device recovery.
>> + *        The dynamic subtests are:
>> + *        inject            - Injects Core Compute Uncorrectable error
>> + *                    and verifies device recovery.
>> + *        post-recovery-wl  - Runs a compute workload on all compute
>> + *                    engines after recovery to confirm the GPU
>> + *                    remains functional.
>> + * Functionality: error injection
>> + */
>> +static void test_inject_core_compute_uncorr_error(struct xe_mmio 
>> *mmio, int fd)
>> +{
>> +    int fw_handle;
>> +    bool ret;
>> +    uint32_t counter_before;
>> +    uint32_t counter_after;
>> +    /** TODO
>> +     *  Fetching node_id and error_id dynamically is pending to 
>> implement.
>> +     *  For now, using
>> +     *  node_id=1 (uncorrectable_errors) and
>> +     *  error_id=1 (core_compute)
>> +     */
>> +    uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
>> +    uint32_t error_id = ERROR_ID_CORE_COMPUTE;
> Inverted xmas tree.
will update
>> +
>> +    fw_handle = acquire_forcewake(fd);
>> +
>> +    counter_before = get_counter(node_id, error_id);
>> +    if (counter_before < 0) {
> But counter_before is unsigned.
will update
>> +        release_forcewake(fw_handle);
>> +        igt_assert_f(false, "Failed to read error counter before 
>> injection\n");
>> +    }
>> +
>> +    if (!acquire_steering_semaphore(mmio)) {
>> +        release_forcewake(fw_handle);
>> +        igt_assert_f(false, "Timed out acquiring steering 
>> semaphore\n");
>> +    }
>> +
>> +    /* Arm the injection sequence. */
>> +    xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>> +    modify_reg_bit(mmio,
>> +               XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
>> +               XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
>> +               true);
>> +    modify_reg_bit(mmio,
>> +               XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
>> +               XE_MC_PKT_CTRL_MGSR_3D_VALUE,
>> +               true);
>> +    release_steering_semaphore(mmio);
>> +    igt_debug("Injected Core Compute Uncorrectable error\n");
>> +
>> +    /* Run traffic to trigger the injected error */
>> +    ret = run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
>> +    if (!ret) {
>> +        release_forcewake(fw_handle);
>> +        igt_assert_f(false, "Failed to run Xe compute on all engines 
>> post injection\n");
>> +    }
>> +
>> +    release_forcewake(fw_handle);
>> +    print_aer_recovery_status();
>> +
>> +    counter_after = get_counter(node_id, error_id);
>> +    igt_assert_f(counter_after < 0, "Failed to read error counter 
>> after injection\n");
> For an unsigned value this is always false, so the assert seems to 
> fire on every run.
>
> Regards,
> Soham
>> +
>> +    igt_assert_f(counter_before != UINT32_MAX && counter_after != 
>> UINT32_MAX,
>> +             "Failed to fetch valid error counters: before=%u 
>> after=%u\n",
>> +             counter_before, counter_after);
>> +
>> +    igt_info("error counter: before injection=%u after injection=%u\n",
>> +         counter_before, counter_after);
>> +
>> +    igt_assert_f(counter_after > counter_before,
>> +             "Core Compute Uncorrectable error injection failed: "
>> +             "before=%u after=%u\n", counter_before, counter_after);
>> +    uncorr_error_recovered = true;
>> +}
>> +
>> +enum xe_err_injection_type {
>> +    XE_CORE_COMPUTE_UNCORR_ERR_INJ,
>> +    XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
>> +};
>> +
>> +static void inject_error(enum xe_err_injection_type injection, 
>> struct xe_mmio *mmio, int fd)
>> +{
>> +    switch (injection) {
>> +    case XE_CORE_COMPUTE_UNCORR_ERR_INJ:
>> +        test_inject_core_compute_uncorr_error(mmio, fd);
>> +        break;
>> +    case XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL:
>> +        run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>> +        break;
>> +    default:
>> +        igt_info("Invalid Error Injection specified\n");
>> +    }
>> +}
>> +
>> +int igt_main()
>> +{
>> +    int fd;
>> +    struct xe_mmio mmio;
>> +
>> +    igt_fixture() {
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        igt_require_f(igt_debugfs_exists(fd, "forcewake_all", 
>> O_RDONLY),
>> +                  "forcewake_all is not available in debugfs\n");
>> +        xe_mmio_access_init(fd, &mmio);
>> +        igt_require_f(xe_mmio_is_initialized(&mmio),
>> +                  "Failed to initialize Xe MMIO access\n");
>> +    }
>> +
>> +    igt_describe("Inject core compute uncorrectable error and run 
>> post-recovery workload.");
>> + igt_subtest_with_dynamic("inject_core_compute_uncorr_error") {
>> +        igt_dynamic("inject")
>> +            inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ, &mmio, fd);
>> +
>> +        igt_dynamic("post-recovery-wl") {
>> +            igt_require_f(uncorr_error_recovered,
>> +                      "Run the \"inject\" dynamic subtest first\n");
>> + inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL, 
>> &mmio, fd);
>> +        }
>> +    }
>> +
>> +    igt_fixture() {
>> +        xe_mmio_access_fini(&mmio);
>> +        drm_close_driver(fd);
>> +    }
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 519a9e727..c8a4c9a6a 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -294,6 +294,7 @@ intel_xe_progs = [
>>       'xe_debugfs',
>>       'xe_dma_buf_sync',
>>       'xe_drm_fdinfo',
>> +    'xe_err_injection',
>>       'xe_eu_stall',
>>       'xe_evict',
>>       'xe_evict_ccs',

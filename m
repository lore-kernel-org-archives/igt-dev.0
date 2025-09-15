Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A798BCAC58E
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 07:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCC810E2BF;
	Mon, 15 Sep 2025 07:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jutlv8a0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C977410E2BF
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 07:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757922474; x=1789458474;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=CCzgBMet7XucYlVR5wpCMkjlm811LtpBt7qFtneml8U=;
 b=Jutlv8a07BZDolJmAveH41oSwcFbuZU5XDDz6kM/sApmfxmcYJa/vRPn
 /BtjHE+Drol4x2xvGNlcopEDSPcko6RIauS0Sjgd+IcvQ/X9PFTbv/zVb
 HYI6iHI64OWyxJCqaRcgEjyVgYDYAosjO6u/nePbZL02CB6LNMzW7qgOe
 maCJmqCb3NPr7Djlfnk+EgiDJhWpZTfuYoHLlyLaAms9epk4yN3PfSkPd
 kbKQJGXRLVP8sAYO4ExksmO3dgZovu6tkc7SCdGqKld0W38fej+DGxVI4
 kCkWP+e4zaj/7d5tXFaacQ9eymZMbfZlekHUy5k1x2zhGLAhNT0Ks+dKV Q==;
X-CSE-ConnectionGUID: ybKpCNqRSmSJnjTw+YdQGA==
X-CSE-MsgGUID: EPztaa23SCCtjE/lgK/YQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60035831"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208,217";a="60035831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:47:54 -0700
X-CSE-ConnectionGUID: h080diCjRJmxEjP8oK1f6Q==
X-CSE-MsgGUID: WIafb1OwQcuz3g2Q+vpJwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
 d="scan'208,217";a="179716706"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:47:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 00:47:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 00:47:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 00:47:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p475A3NdjC/IUthnH1jQXBgMbMEf8MWYjGt2oB4vRnqFB1aise7CipFZvdo0J9oHKBh8Bv5ck2BYkEV2OzcAXv0Oi2Thk+n5CtC0jyZrCCXo9vMG9wO0C0IFw/hT/r2wo5a3DkssmhqzpbK0vOAWzPMEeyJgF6HnWNboxGDGWSgwpQO1fErxlhfvzXXGELYoqWthO9/NU53Y6z+eectxz0VfkuEni5NFmj+Ucd7zLtTDKXUIgl7G6Gt3FldDfzHxBhZNisgbwacpH4SUhfbv/A0fz5CieA4B7AbPxF4KtRhMmYLamNENKtW5aUeF8iVHpzltp0ib/VfR0qIy5GBt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMqa6SjpKL8utpu3esLUAl+qW+a6VOoCZuWb580pgdg=;
 b=scPYNoWOl8jf0xZGgG+4KGll0vCfWc5o5o5fZ/71VGFGI8NbWbguTlkPO80lZF3m/5iGdfdD28UnAHMJZeyCGCBFMpZ6kNi59es1esP0yQ9A/uDO6Naooi9bq32Piwef0U/fxf73PUavTmVKQ7Z6CaP0wD6lxgJLE1IRQb9DyKQ52q4valcbU1qNGAHTs4OyrXj/kRntH1dvljg9vmzTpkPWSWLMvCUUbU7OVjfYa9ZL+fcjqdkWBeeobBaHKOATCELUevXBwiR7B5q6pTYgKuvEMRyVFZx8PHtJwBMDrY7088XgyQ6RDstZzHEoqQR2Y0XzJ9FHd+wKUIe46BgVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by BL3PR11MB6386.namprd11.prod.outlook.com (2603:10b6:208:3b6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 07:47:50 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 07:47:49 +0000
Content-Type: multipart/alternative;
 boundary="------------kTBfTFnM03XRG3k1bCB4IFxK"
Message-ID: <e2af1d4d-92f7-469b-ae7a-2cb8f74b2002@intel.com>
Date: Mon, 15 Sep 2025 13:17:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/kms_pipe_stress: lower minimum iterations
 in simulation
To: <igt-dev@lists.freedesktop.org>
References: <20250910090059.351698-1-swati2.sharma@intel.com>
 <20250910090059.351698-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250910090059.351698-5-swati2.sharma@intel.com>
X-ClientProxiedBy: PN4P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::10) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|BL3PR11MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 83079dd2-1dc5-4113-b546-08ddf42c2ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlpEN1A5bXowelQ4SzdIa01TQTNwcmdJVzBnbDk3aHBNclVKMFNFSDJuYStF?=
 =?utf-8?B?aGt1cnVlQk9wU3pTWEgwZ3l5Q3BTd3dGSlhSbmlaOHhVajFwdUE1VWc2Qnp0?=
 =?utf-8?B?ZG5ZdVNKRDFpeEhoYlp1WUtKWUNzR0ZNaXlSSm5oZFRGY0ZoNjdRVWRYL0pI?=
 =?utf-8?B?a28ycWtDcGhaYmZOdHl6L2N3bDM3T3p0eWNJNTZlclBhU0NIVzF1NmZyZDdG?=
 =?utf-8?B?MkVwMUxicDV3TUdHYU1HOURERXlIZFI5bmwyZWQ4K3FyU0ZOK3Q0SkJDOFNH?=
 =?utf-8?B?aEtmN3FTMW9GL3FRVlFKMW1rdi9IT1paTnF1UmwxNVNpREZTa0Vna1d6QmxE?=
 =?utf-8?B?dVkxU09JTkd2QTF3RW40a2FyMFQreCtCK25kbnhHdk0xdFdMbisza3QvY0hB?=
 =?utf-8?B?WW9URnhGS2dmUE9GQ0huRGlzN0Q5WllMcGtPVDlMUDdhZXR0WDBPOTJJRThO?=
 =?utf-8?B?TVkwc0FNcDk5VVhvVHc4dnBzTWFhaG9zZ3BPOWFEbjdTMFNRczNHQkZwWlVl?=
 =?utf-8?B?aWlIL09BVWNZMitqcDBMNVgwbmJJMmt6WFptMDJwbVVpSmtjRnZOL2ZwNGh3?=
 =?utf-8?B?NWk2UUk1aCtKamx1ZU9RR3R3b0ZXdDNReVFxZU9lZHBwaTFFU2VyQURxSTFO?=
 =?utf-8?B?dUJqN2svNWRZL29OSjcxQnhYTnZZaG1IZytrUWVLZ0V1RlBZY01SWWlKVzBD?=
 =?utf-8?B?MnphN0tQSTBRelRGR3ZPeVRmYzI2NXEvcUhIU2licWdYZWNCRlNNRTI1U0Rx?=
 =?utf-8?B?MWJCcjE4QjZUR0xIWE5BVVI3eVR5dGNXQ0UvN3QrR29jOVFDS3ZMMUlWQ09s?=
 =?utf-8?B?bmk5dCtjbXo4SCszc1I2OG5Gemx5bmxrbGV6ZWxxeGRDMlpCWXZ2ODZPbE54?=
 =?utf-8?B?dWJHdWo2SzlnbUVtMjRtMHVMUDMzelNPdXEva2lSQW0wT3hzM2ZweWZBUzNW?=
 =?utf-8?B?am9qL3ViTW9la3VMeGN5RVpaYlhmblFaaDJTZXNDNFhTK3pBMUt2MmltUVEx?=
 =?utf-8?B?SzB1THdMTW13cVlzc1F3Q0s5TXlwcGU0TElxQUs1T0JzcTFnUlBJYWtpc1kv?=
 =?utf-8?B?d1gzMjhFSWxsYmdOcnNueERyZEdITlpCMnNzUjF0VnVTY3o4ZEc4YkZQR3kx?=
 =?utf-8?B?NmhXRHhWQ1BDVVFCUDM1ZkN0dEdKVUU3TFU3YzIySjl5MXlPVG1mekxzTUFS?=
 =?utf-8?B?dEZ1enNHV2tUdVhsazN1SVpWc0Z1c0VOY2J0TDVQV0VYQWlyQzNrR0NmRndY?=
 =?utf-8?B?WUcwYTA3RkRObmtoVzBzdm8zU2VxQzFDbHU5bU1zb2VJb1JaclhiWDdsWE53?=
 =?utf-8?B?K05uTHhIWk5Ec2p2TktQOS9BUWxZL2RuODEzWWM0SVNqNWlZQkIvNkFNNHZQ?=
 =?utf-8?B?N3V2S1ZTUkZlczBVc1k4bXdoRkFteHkyY2ZML1NuREY4OWtJN3k2TWQ5NmN4?=
 =?utf-8?B?Y3dENGExMWhzcXliSy9ibWdLOGdzSnMrMmJ2SXZTV21wWFhQWGFIa3ViQ1dH?=
 =?utf-8?B?Qm1jUTlrVFI2NDd4L3B6V2VpZHpiWVdyQ2hwTlV4VDNMV1Y2Z1RrRzNLMGMy?=
 =?utf-8?B?T3lkQTJuN0ZULzQrY3Y5Wk12bVdrM29GZjJkMnE2R3JWUFc0TjNrNjBHRkNV?=
 =?utf-8?B?dkpRd0xaVXM1VXlabDZkbEVDK0xHdVR4VytRVGFJT1E2QWpZZFVhNHc3c1Vn?=
 =?utf-8?B?b0pod2pieGc2dHFOUGQrRUFlcU1lRzE4a1BXRjFhdE92V0lCdFE5VlQvSmE5?=
 =?utf-8?B?dTVMU1JKb2VqZ3ljeGdhM0JqWWRWNkptdTEzTktoeFRoQndNNkxDdStaakNV?=
 =?utf-8?B?ZXVoUmxNdVlqY0NkdUtGNUdpdkZvMVArb21NVnBORGlVZkxhc3FCV3ZDTW9z?=
 =?utf-8?B?Q3VzbWgwZzl4VEpsMTA2TUFkZmVjN3pxNFdOblZMOEprZWlMWlBybEk4NHNG?=
 =?utf-8?Q?aQKWuqBAftI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnM1NGMxYk9FM01YQ05LRytrUHByM3NNNDV6cUo3eUdOYWY4NjBJdDNuWG9h?=
 =?utf-8?B?SHdkR2xhZ1VzVkNVT3EwMFl2aG81RG1zaEhkL3VSTnAwTHNNVm9ydHVPUG1m?=
 =?utf-8?B?SjFPNFBVKzJ3d2VienJQL0RSN2dVcjBILzV5K0oreGk4YjVRRGt5UEFZQlh5?=
 =?utf-8?B?QmJBU0lVQUtSdHUvWlVhdEwwOEN2Qzd2bG1yTjhRalJMVFg3dXltL0FlVDZj?=
 =?utf-8?B?MXJMNER1MXJOeDdIa3dvRjBxM0ZQV2R3TFZzMUs2MytRMzZnSXpaKzU0cEgv?=
 =?utf-8?B?ZEJOWEU1ZFQxdS9jdjd1cFhka1FiU1RXU3FiS3BpWGVFSTJpZUcyVzVPRysy?=
 =?utf-8?B?NWNMZDFycGRLUWxid1llR0QyTHh0Lzg3ZVlxb2c4aWRuaDBSa0dUZy9JUHk0?=
 =?utf-8?B?RmZmQlBWNFAzeUFaRlBXejRjaVkvM0YvTlplV1BJMGlwN0daTll3UzVwQVh5?=
 =?utf-8?B?bTFTZ2Y1TEN6bG9DaFVMWEs5TytBNjhmM0ZFZEJmWEpFVXJKOVpINDRXR3FS?=
 =?utf-8?B?bDVhdkJHZVZTbXgrekY5VXlSdGxLNzRKMmhxcTBPL2NqV05KeHdNZElpRE9r?=
 =?utf-8?B?MEgzQzJobHd2RUJycVcrV2dsTDRCeVUzeFhFTUhLTGVRWEUybC91YWxseWJE?=
 =?utf-8?B?UysrWGdlSGU3R21OMllkRFBGaDFPSmZucTdLVkViOUtZZE1BcXozNFp0ZDVs?=
 =?utf-8?B?OTZCdXJUOWpqZ0pWdmRJcW9BL3ZaU0JGcWVHUXV0cmFCQWJTQzVyS2l1aE14?=
 =?utf-8?B?MVdZaTc5WXFiaFoyY0NaZW85WXVpU1BVc2VkbDViNExCaW1XUzl3TG1nOUN3?=
 =?utf-8?B?bkJ3WnptcmxYeW1IeTY0NTM4RCs0QVpwK1ZUVXovZWNSK2N5WiswV2psalgy?=
 =?utf-8?B?SlNmRzY0Sk0xUlZnbjlGVkJkbnZnS290Tm5GckdXSXEyQ2I2QklmZ2xON002?=
 =?utf-8?B?RDhtdlJIbjVVTDRKcG1zVjJJbVF1OVdCVUNRZXcwSFJ0MHZwVVJqejZDNFRo?=
 =?utf-8?B?VjF0c1J5c1FKU0dyYzMxNEtSbmFLY0RQRGM2cC9MQkpNQVhzenBSODQ3TjJI?=
 =?utf-8?B?QXhNcmF0NTFKSERHc3BZZmNNbkxCTmhOY1BRT2pubnJvMkdsTTh6anl2V1BR?=
 =?utf-8?B?NHA0MUVmckhNcG15RERQcHNlNXUybGQwSnBLN3hlK2puZHNxZGVKOUJBYW1j?=
 =?utf-8?B?cVYwcUNiQ2ZTVmpTaE1lbFZLUmozTUF1WWZWc0JlR3huT0pPdDV6SFllNVVG?=
 =?utf-8?B?YmFIZ0Z2SXZHbzV2MVdWYzRVZWhJUityL2R3L2h0MkRBemhucVpGV2NMcndP?=
 =?utf-8?B?aWJrYmpxZENydFpPME11Q29KK204Wmdxa1NDbmJHQWthaUJkSy9CcUNMVFFH?=
 =?utf-8?B?SUM1TndKZU5LeXMwTmkvOVFGQktzZDhObDBScHJwS0lGKzVJS3F2MkZlMzhh?=
 =?utf-8?B?Uk9zM3hrR0VrRzU2SWd0dWpKQmtwbk5aYzBvekxlM0czdjVRNnhRYlBzdnY1?=
 =?utf-8?B?V0ppVnI3QnVTVzZ5SzBQa3FmaDRkSWdabVg3c3ZKUzFXaHZnUlhqeVBtR085?=
 =?utf-8?B?ejMrTDhuWm54RlNGZ1dwZi9xU005WGt4NHJOY05qUXVSKzgvejkzeFdIaFd2?=
 =?utf-8?B?VHQ2Vy9lbytCL2QrUk81SncxZFVhN0ZPMHozSDZ0elgwdjBRUXJTc1ZFSXJr?=
 =?utf-8?B?QnJqYjB6QmNtR3VqZGRVZ2h5OEV6ZklyTnFTV2NFdVluV2VzZ2preHV2NjI1?=
 =?utf-8?B?NjV0U1BrZnZHVkxuVHF6elkzMW5BTnJzbm9JUU80enhqb1IyY0dJV3BKTmtj?=
 =?utf-8?B?dzlVQUlpcXFlL1o1V0pKZ0lHcTdwdDloeFhrWDFlc1BNMXFkbHk0UVNUM010?=
 =?utf-8?B?YlNTQkswelVIN2pPSDgzQzdXbHlZK3hjNFlvNWNjYk0xY2JNRzMyT1kvZEJ6?=
 =?utf-8?B?WmZySC9kVGFxdEtTOTExWGFxYnlvNjk3dEF5RzVWdnI3eUU2UG9NbW1KeXMr?=
 =?utf-8?B?NXNRUmlIOTFrdFl6ZU84ZXpuNG5qZDFDZlNKWjhiUWNTUFI0VmR2Q05URUcv?=
 =?utf-8?B?YVFwUE9SZ2ZsL2ZMRlM3ZlllZW9XckN2SXY3Mjk5WStKTmVzM29vbXFQUW12?=
 =?utf-8?B?UjdoRVZvUTVLQWNwbWQ3T2dBN1JlUHYrQ3VmMHZZb3RndkFJMHBxemZKeG5Z?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83079dd2-1dc5-4113-b546-08ddf42c2ad0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 07:47:49.8531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHCVdKvdfWcrvPJVgil5n5kIQ3UF0RYmvHYODvhrYeHTw/NPVaqUcSfrQ9Sdp5+MEXh12kHc6WRnZ+SKoq4+k4y884qvUwnRBVIymoTeD1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6386
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

--------------kTBfTFnM03XRG3k1bCB4IFxK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Swati,

On 9/10/2025 2:30 PM, Swati Sharma wrote:
> Reduce minimum iterations from 20 to 5 in simulation to
> shorten runtime while retaining meaningful stress coverage.
>
> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 7551a5e9c..a9992cfff 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -610,13 +610,13 @@ static void stress_pipes(struct data *data, struct timespec *start,
>   }
>   
>   #define MIN_DURATION_SEC 5.0
> -#define MIN_ITERATIONS 20

suggestion: Instead of introducing a local variable to determine the 
number of test iterations, consider embedding the conditional logic 
directly into the macro definition.

like: #defineMIN_ITERATIONS (igt_run_in_simulation()? 5:10)

>   
>   static void stress(struct data *data)
>   {
>   	struct timespec start, end;
>   	int iterations = 0;
>   	bool need_continue;
> +	int min_iterations = igt_run_in_simulation() ? 5 : 20;
>   
>   	igt_gettime(&start);
>   
> @@ -626,7 +626,7 @@ static void stress(struct data *data)
>   		iterations++;
>   		need_continue =
>   			igt_time_elapsed(&start, &end) < MIN_DURATION_SEC;
> -	} while ((need_continue || iterations < MIN_ITERATIONS));
> +	} while ((need_continue || iterations < min_iterations));
>   }
>   
>   static void start_gpu_threads(struct data *data)
--------------kTBfTFnM03XRG3k1bCB4IFxK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Swati,</p>
    <div class="moz-cite-prefix">On 9/10/2025 2:30 PM, Swati Sharma
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250910090059.351698-5-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">Reduce minimum iterations from 20 to 5 in simulation to
shorten runtime while retaining meaningful stress coverage.

Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 tests/intel/kms_pipe_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 7551a5e9c..a9992cfff 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -610,13 +610,13 @@ static void stress_pipes(struct data *data, struct timespec *start,
 }
 
 #define MIN_DURATION_SEC 5.0
-#define MIN_ITERATIONS 20</pre>
    </blockquote>
    <p>suggestion: Instead of introducing a local variable to determine
      the number of test iterations, consider embedding the conditional
      logic directly into the macro definition.</p>
    <p>like:&nbsp;<span><span>#</span><span>define</span><span>&nbsp;</span></span><span style="white-space: pre-wrap">MIN_ITERATIONS </span><span><span>(</span><span>igt_run_in_simulation</span><span>(</span><span>)</span><span>
          ? </span><span>5</span><span> </span><span>:</span><span> </span><span>10</span><span>)</span></span></p>
    <blockquote type="cite" cite="mid:20250910090059.351698-5-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 static void stress(struct data *data)
 {
 	struct timespec start, end;
 	int iterations = 0;
 	bool need_continue;
+	int min_iterations = igt_run_in_simulation() ? 5 : 20;
 
 	igt_gettime(&amp;start);
 
@@ -626,7 +626,7 @@ static void stress(struct data *data)
 		iterations++;
 		need_continue =
 			igt_time_elapsed(&amp;start, &amp;end) &lt; MIN_DURATION_SEC;
-	} while ((need_continue || iterations &lt; MIN_ITERATIONS));
+	} while ((need_continue || iterations &lt; min_iterations));
 }
 
 static void start_gpu_threads(struct data *data)
</pre>
    </blockquote>
  </body>
</html>

--------------kTBfTFnM03XRG3k1bCB4IFxK--

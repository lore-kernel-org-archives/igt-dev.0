Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A75EA71B9
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 04:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EFF10E038;
	Mon, 20 Apr 2026 04:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aF7ABkTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616EC10E038
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776658661; x=1808194661;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ur1h7TXsqG9KV022YyhY4hKezDbyOyjapiXxur0vnhs=;
 b=aF7ABkTHDxR3N+vJl6rdkVVk9+nxsYXZ8OMxKfhtr126YGGkItV0O058
 S11v8inEpifNjxIUbyJ87cgufYxFS4meG3L7AW38tTdxtoHGj5I11LxlP
 sexKdn7xTL8UXnhTGzCE/YXLAOpfzfD3t5Jdk6T8VnS036e5gJcdA9XSx
 bKzCp0nW1UjbgsnwLsySrvXD33yOWCbnROfEHvPrjvTKQeBVlMd+Hn/Gy
 mUKKJDVILUuiyxZgVoW5cU36h7+tZ0Og/8DbuzUnMaQToeKiIFr2xcuGx
 zGTQCzIl3AEHaAKtWoSe2cf46hjBomBdPqcfDCP/IQngmZDBVhqDUl5dL w==;
X-CSE-ConnectionGUID: QbXUHphVTiyj6gqendk+9g==
X-CSE-MsgGUID: 84OOqEKqQMe+ShdZ+nIzCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="94969946"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="94969946"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 21:17:40 -0700
X-CSE-ConnectionGUID: GOkLYPXUQwqPXrQOD7PKyQ==
X-CSE-MsgGUID: TXrJi8r+SvOcfdTZp4CBCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="235603035"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 21:17:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 21:17:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 21:17:39 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 21:17:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CY0Ygm7Rf7BOBc00dTwKJwIL85DWpMDZYn7NorYn9Cvis5gGasivOMb3WWZ+OH1A/o3o6Q6lybuEOze0/IknMWtaE45IciCk1/UfJuLgcV4uigx27+43fyLDqBbvR+NdJSc7magKR1loxLCFpt384mw5oCV/SCpVpHicH6MBfElnTofQwv19PHC7peoCe7mtIkWxVpnEDkwC9rMv3Ao6VN17KK//vZXFovErRgzhfCevpIpSnHhNHOshG593eEkGTzeWsO49qE6gaKLDb/FGY7l4VLOflSCb9LZJFU+XhrkJYzwiE8LRtvUn9KBFVGYaZMqAnsiqhAVMs5u9UHQP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcPPa+tw8gVwm8XKIHihXEeZonJNXqd1sHjOIgWzhPM=;
 b=dtzT0suyW9Mj4S12psrs+8cjO994qE47omXIusbLZhRuTr2o2G3V+8YM7+lMZbxaX4Oq+Thr78EK9UnvX73n/RnbTUvC2cVzcjU/xoXyinfFji64gwxXkHUVw55U6IU03BGzkAxOC1lCtmOC5s7mPIWsxOzpi++tQzB91YcPdbvoIdnNqqOr1dV5e7hh8v+GwbcSsRF+XyFE7reMUxC35YHRW91Brhi3K8MKOlaoovDYnRYUCM02aUVw3OX0MzwpUWPYyXAUYv/u3nHKPrhcsHa69BKvAEeccCIOXdAjlmLK9tYkf5VDJ9DjehPDq/IyqC+H9hCsfJMM9uTi/uCtpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.15; Mon, 20 Apr 2026 04:17:34 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 04:17:34 +0000
Message-ID: <e456fa20-708b-46a6-8dd9-835cd75bc692@intel.com>
Date: Mon, 20 Apr 2026 09:47:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
CC: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>,
 <kamil.konieczny@linux.intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
 <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
 <3bd2ed35-97b4-40f0-8d18-21e23f697826@intel.com> <aeIL84BK_pmBS48s@intel.com>
 <da72e919b7cbd787e793f0141697f7c37957f998@intel.com>
 <aeKFxTbWGjrh_N9K@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <aeKFxTbWGjrh_N9K@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 623158ab-5021-4066-9da1-08de9e93bef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: gpmUYztzVZe3qXo9gsnk5s2OS8JUS1AuE8lpm5+6Jb/zmjyjSX/RTokBj2uQIQXN5Rm+6MSMw5c5q6MeuC9Vk+cNsupP/IrCrAHks9zzLW0GFNW5rV3WnuxYfF2U+D50CIeQgrbjgFYhoNnJ2aRrGCag+bV4sL86qVrFFh/WErV215E5mfLOIekjUo5LNAJrAyxElCQ1DBB9GkRyFVOMHc27Leabqw/Sv98W5MtaKbfKq0GWMe5L2ohimyzoks2DDdZPqIX9PEPaxwhn0wwLFPoEejfAnDfEkVdqHvffrKXT8Zfxv1AjjsIaEbDGJUfmvDZvIVvXXz6I42Iu87hyF+ccrUqXs+s+//+78yNOGl1GMKZ6u8sDp0I1p6Qhjlk6RQhb/t3mm4C+lC52nm9YhUQkqMGQeb0+o5vE5mXdrCWANjgLoH3FmH0dmf9wcE1r+nsWSu/nnVBO8R77rPoMWRStlNJqwvdkZP/K92SDqer+xV51Vp3RzId7Jzj2Fk8HF9GTHcSR9MQuA3tKi4X3KEXXbB8WFOgCTYSeTQvOpD/EeDTOtJaYjORXEFzHpqR42FDXw8h16Dl74p7j94p8PDSfdq+Fmm2XIEA9GgjOPHf0Hpe1HMpZYDoSe1PV8ZMaKWxTzZapDmGp2uUuPiRL2KYGT0OezjYE9ayRNc/swsRkAn5f4Ze5s+ZDeodD6xHhKsJJYVA2tGJUEtXcQ+8Fp7uVgbG/SQ2Xj6rdkn+9xR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1dJQ0xaNDNuTmR3ZTcwcXJPWm5GM0FRbS9SbW5iTDhoNS95VXVGOU5Nb2Rw?=
 =?utf-8?B?aGxUQUgvaFVhVkE1aERLK3hYZHpueU0xYldBb3lQQnJIWFZ4by9zUkRsejcz?=
 =?utf-8?B?dHJGcHE1aFN3SXZTSTFndWlJU2g3NUdSSm92YUJHTlhRd2lZOUgyTnlVVHda?=
 =?utf-8?B?YzFOUStKNXkwMFdIMFlWejdVWmcxTUVaQVh1V0RnNmcwdmI3Z1dWUmpXVlhw?=
 =?utf-8?B?YXNDTks0QmVhWjJaeWZ3YzBSZm42MjZIMjl6NWVORUkwOVNlcnlXRHdSRkk4?=
 =?utf-8?B?L3VpUmliMDROK3p2b2p0cXNpNUx2YUlmYU1rdGp3SFcrUWZ2bGdTR2hZRi91?=
 =?utf-8?B?bWx1UlJ1RXgzUFRpQTVINU5BNWxhc2hPRkV0Z0pKbHdOZDdmSXZtNTZ5TTB3?=
 =?utf-8?B?R1gwdlVNclRBam5YeUJEbHZFR3U0VkdVQURJalRhRWM4d2JyN1RvcUM4WU5M?=
 =?utf-8?B?QWZQV1FmQUVDWVAvbzB4OG4ybHlQWmxMcUJES1daUGdTb3BMejdwbC9JdGdL?=
 =?utf-8?B?bVRoY2lCb1RCSG9VWWN2VER5WmEwaU95c1BPM3N2aFBDN1Vhcm00S0JKZVVL?=
 =?utf-8?B?L1JHK1RkUW8xRWo0MFJOK1BmYWlYbzl1R1pLaWJhS3h6Ull0dkpJM3E3OXp3?=
 =?utf-8?B?TXBqdkdCK0hubytnQUpBcnh4YTVVM01RQkhyM21oSDNXVmFtdDJkTitsdTNm?=
 =?utf-8?B?M0drT1FFb2ljaVVwWDBoYWNERWJUNklPd2ZOVHNsc3dhMlJ3cUU0UHp0cnR1?=
 =?utf-8?B?MytiTVQ4MVhjM1RQR2xwMDlSYnJ0aG9wNW1IczkwVjJpZnB1dy9oUS9VcnpC?=
 =?utf-8?B?WHBrN3QrK0Y2YkFJMDExYzlVWmVmQnJzYzdmUWlhekxGTjl0ZnIvM0QxcGoz?=
 =?utf-8?B?NnBjVWNaQTkwZmtEYkU0S094ZXJ0NnVGaWV2VGR5WS9kRXVhMjU4MUFtVmVU?=
 =?utf-8?B?RVVCUjBsT0E1VE11QktXMlducjBqeXl3OXlmTXkzTTR5L2tPd2hDVDR3aHdm?=
 =?utf-8?B?cmpxQnFiYU5CUWtNRmhLQlkrZm9oWnQvdmdIMzNQQmFEUzIveDY0bXZYR1hl?=
 =?utf-8?B?RUhPNjVLWW1NVmJBNytDd1ZjWmRpRkFkcE1oRzRtdkVjYkdxSkNjRnRVS1B4?=
 =?utf-8?B?MisrdlU4VDlGOUZWbE9obFVUS2dKeXluYWZtSlgxdWFuaWVCUW5jRVJ6bWZB?=
 =?utf-8?B?eVBvVXRjQityRStaWWQ1NVo4RmxpWGZPY0c2MXB1QUMzYXFGZWswU01mbjdU?=
 =?utf-8?B?TlNBaUtyL05SV1E2dXV6SzlUdGFHU0RDZzJZbmdjQ1NNTW5tRGhyUFFNa0Vm?=
 =?utf-8?B?Z3hOa25oN1VTbnVhVWpVemVRanhQb0x5SWxQQnZQQmRwZGZMTExMeDl1cTdS?=
 =?utf-8?B?QStWR25zNGdLZTJiYm5yRnpUb2NFK2tzN1gzUUlqSG1xTWdVY3JEdElZVGJV?=
 =?utf-8?B?Y2Yxajl2M0RvaFFtSEUzaHFRSkducHlpZjQ0UCtyemdJVXkxUUVDVWQ4ZHNm?=
 =?utf-8?B?U3hpZkFSeTNtdlNBclVJY215eHBuMndXVWlJN1pBOURBMlhrc2J4YmVZbGc0?=
 =?utf-8?B?R2xmRll0azExaVNaNTRLbEhWRnpETUNPOEcvTXRQSnEvZVVhSkJiMUwrY3Fu?=
 =?utf-8?B?c29wbmF6Zi9maTFnM0JiZVd0bEZndzRqc0dJRnhFUmRHcnBGeStIS1JhcHdi?=
 =?utf-8?B?aWNTYlpkcHVoZHJNdml3ejZZZ0FRRUJXV2N2dHJUdmQ2ZXE2MEMzN3lyRVIr?=
 =?utf-8?B?SUR4cFN0bEpQbDlvSW9ud1hycmN6cjJFK1UwZ3d3bThudkh6VjVLRlNURTBZ?=
 =?utf-8?B?Q3VaUEpscmsxdmduMmxkQ05XT25ZcW5XZ1RaMXRlVlRVMTBQV2lqMXJIQjRR?=
 =?utf-8?B?bDg3ZmFaaC9lVWFRc3l1RkRxcTBhZUZSdTh6bGlCZGN1ZXltL0t5L2hQak1w?=
 =?utf-8?B?Y05jcnJRR0EzeFUxUnFxUUl5cUZFN0tlM0U2bWk0Yy80aHh0WnlDTTEvcmg5?=
 =?utf-8?B?RmFibDRKL0c1NE8yS0gwdkxkbFppYUc3SVZodFhsUHplVmlLY3pOVGxxenR2?=
 =?utf-8?B?ZXJXQXR4TzkwNWg1NnRpaUxyN0VVU1NFVDlDbVZLbzVqOVJvY1haQ2FreU9s?=
 =?utf-8?B?KzNqSTlkNzYrbjBWSUxOZzVSK0VRby91a3VHV0NKM3UrYjZoV0tWZUJCUlJm?=
 =?utf-8?B?dG5qUFlZbVZtVVcvR1hOS1pVZG9XLzREYWhtYVl4QVdlYjZPOEJnSWRxK3VB?=
 =?utf-8?B?MXVlU3NhWTlnZm9GUHFaWkx0aElLN1dBVE12bml3cWlBbW5hQjRjaytSR1B0?=
 =?utf-8?B?QlR2NkdJdS9ISlhwZ1VjbXFyeGNYbFhDSDFSS1ZxRnNtTldDY0sxV09QZTdw?=
 =?utf-8?Q?PK61jZsj/DLaYLsw=3D?=
X-Exchange-RoutingPolicyChecked: P601SYFYCepmqu/vB6YLlCdg1DVYbfGeLH3ttCoSN3u1fqKRMTLwuAHJbofHWMVVDbF68oq3AUq2s3OBk6SQkp+h84G0W5FtKhpgRrqqZTOWo/8WS7XqO6f1w3Vba2i3V+kpheX3hZZnmP+CBJMmwf+sTeJ2MoxOe2RS1+jrl9P9+/EaRF2enAo95JSNJgtkoaBHFxhjZBr2aALzfWkpZEcoPMYK/Ku/LViQiOz4MoixXBt1WF4RPioLZDrr+WmliUa7tLwyrzfLtHwCLR0NtL6QwihjUMJ1IrZcdinH/OLjKHC36s3o+Ge+M60b58QVVG0U8U8fEEDSdIZvLB/LHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 623158ab-5021-4066-9da1-08de9e93bef7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 04:17:34.1344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EC4wKLQdH/o16q+a1uIA5PPdPiAavfKVLeAA6yKiypdmnnM0vO1IReZf1kLeJohXn5T1vIyXWhFxnd1AQZwqP+jkknWNjs2QA5IZzefwRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
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


On 4/18/2026 12:41 AM, Ville Syrjälä wrote:
> On Fri, Apr 17, 2026 at 02:54:32PM +0300, Jani Nikula wrote:
>> On Fri, 17 Apr 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>> On Fri, Apr 17, 2026 at 11:47:14AM +0530, Nautiyal, Ankit K wrote:
>>>> On 4/17/2026 11:09 AM, Karthik B S wrote:
>>>>> Hi Ankit,
>>>>>
>>>>> On 4/17/2026 9:40 AM, Ankit Nautiyal wrote:
>>>>>> Synchronize intel_vbt_defs.h with kernel commit:
>>>>>> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
>>>>>>
>>>>>> Bspec:20142
>>>>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>>>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>>>> ---
>>>>>>    tools/intel_vbt_defs.h | 1 +
>>>>>>    1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
>>>>>> index 6612d3a4ec49..550a9bfba868 100644
>>>>>> --- a/tools/intel_vbt_defs.h
>>>>>> +++ b/tools/intel_vbt_defs.h
>>>>>> @@ -1090,6 +1090,7 @@ struct bdb_edp {
>>>>>>        u16 edp_dsc_disable;                    /* 251+ */
>>>>>>        u16 t6_delay_support;                    /* 260+ */
>>>>>>        u16 link_idle_time[16];                    /* 260+ */
>>>>>> +    u16 joiner_enable;                    /* 261+ */
>>>>> The variable name should be 'pipe_joiner_enable'. With this updated,
>>>>>
>>>>> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>>>>
>>>> Thanks Karthik, will fix this and send shortly.
>>> How was this even different? You didn't retype these by hand into the
>>> igt copy of the header did you?


Ohh yes I did type these by hand. I should have realized this after the 
3rd revision.



>>> The proper procedure is to actually
>>> copy the whole file from the kernel tree.


Noted. Will copy the whole file.


Regards,

Ankit


>> Yeah, this. The commits aren't in the same order as in the kernel
>> either, and they're missing one.
>>
>> I've scripted this years ago, for both PCI IDs and VBT defs, and I've
>> shared the scripts too. Here's my current version.
>>
>> Change KERNEL and IGT paths to yours, update the repos, cd to IGT, and
>> run.
>>
>> BR,
>> Jani.
>>
>>
>> #!/bin/bash
>>
>> SINCE=962601ac4c78
>> KERNEL=$HOME/src/linux
>> IGT=$HOME/src/intel-gpu-tools
>>
>> declare -g -A map
>> map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]="tools/intel_vbt_defs.h"
>> map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]="tools/intel_dsi_vbt_defs.h"
>> map["include/drm/intel/pciids.h"]="lib/pciids.h"
>>
>> cd $KERNEL
>>
>> for infile in "${!map[@]}"; do
>> 	outfile=${map[$infile]}
>>
>> 	echo "processing $infile -> $outfile"
>>
>> 	last=
>> 	for commit in $(git log --reverse --pretty=%h $SINCE..HEAD -- $infile); do
>> 		if ! git cat-file -e $commit:$infile 2>/dev/null; then
>> 			continue
>> 		fi
>> 		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
>> 			last=$commit
>> 			break
>> 		fi
>> 	done
>>
>> 	if [[ -z "$last" ]]; then
>> 		echo "last update to $infile not found"
>> 		continue
>> 	fi
>>
>> 	for commit in $(git log --reverse --pretty=%h $last..HEAD -- $infile); do
>> 		prefix="${outfile%.*}"
>> 		base="$(basename $outfile)"
>> 		ref=$(git cite $commit)
>> 		git show $commit:$infile > $IGT/$outfile
>> 		cd $IGT
>> 		git commit -as \
>> 		    -m "${prefix}: sync ${base} with kernel commit $commit" \
>> 		    -m "Synchronize ${base} with kernel commit:" \
>> 		    -m "$ref"
>> 		cd -
>> 	done
>> done
> Good enough to put this into scripts/ with a quick howto at the top?
> And then reference it from the generated commit messages so that the
> next person is more likely to find it as well.
>

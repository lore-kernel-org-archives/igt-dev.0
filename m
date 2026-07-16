Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C94C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D47310E724;
	Thu, 16 Jul 2026 07:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWUTacIR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD87410E724
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784187837; x=1815723837;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lNTYZxmPFn8ti0O6rfphSybmG0SUFAXrSZbN6wj04Lg=;
 b=kWUTacIRRx1QEuq53xRRSCN7SfpHV++3fSaMw807cH6HeNTf9h8V1h3h
 R57GPOYiGJhHCPo4MPW/wgKIs9EZVxHOIivmYXk/l6Ke1v5+yWyd2fg6+
 UnO3okyHKohsUrsfIwiLDBJaVl8qL1Oo3hHVwQE/dEZMUZ8HmEgn7/p3S
 0QgTg6yZAXPyoP4pCAubKA9HDjYqEnps2YJVn2NCDe3LdzHj5AO9h9ff0
 EV5pGYAw9eftTUpe8k4aX6Ll3CqFbqLeAtBbYC3kfBOLrahHfzVNGlZHq
 ULgC/vHZ1ZzyNxuveaUGPWi4OZIcaE4j2QKTtz09Dii/+kniCR+9tR0g0 w==;
X-CSE-ConnectionGUID: phS66EvDQ/qUa7ZthxYaAQ==
X-CSE-MsgGUID: 3ltLO8J9Tt64D7fVstV2nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95191170"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="95191170"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:43:56 -0700
X-CSE-ConnectionGUID: znOmqV5cQI22V/LT1T8etw==
X-CSE-MsgGUID: EPFJPeqlThGKtGqu3KIldQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:43:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:43:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:43:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:43:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiCKP9PYClAGOB6wdYdtQapHMIrE09u8W4xmhiOLLXgR5gKP5DGKZ/N7gDXXt37nX9U0E8oSROI64oLQQBgoLBUqIEIfzcsFIRYTY1djup8mS4rOMqo/igCAo8RtIQ7Txpm53nRfqj2FV1+7OZkmRiyxQB89kdaqBFtwn9SbyyudcL6ndYS8KSRiATLxbDSmwrpwvsDxkSLl4ddrENcsLxrfkRw5tu18/vJUq/ahL3nrRAgC2J9HcrNRuVHf4oj4nVMBO9J1RhmeD2Y6069GLa895Bdjgv+cqqCs2IP2PS/nuGv2EA4+y+/7thAfXbocEWRDfatw6zkBndGmB34XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3UQ7llkDaIS+aaMLciwMk+OpIFdHghuYeLnaeM/L3Y=;
 b=GZjziu6fTZvo1veOjxlO2FgIqM1LiCJTxfra3SsEQH7vhPxrch3JhM8aOkbqNXL/Mc+xiSbfTfSnXWVvDYPPYkMtAT/sfDEbdqsZczOEae+fTAxpXJfO1i70+ZQ3MBWXPoVQmyZeqzO9S5GvV8PwFOvWWbiLVu1PuEg1w8uuAEn3TUHvDA+8ai3a0d5DBz5uvtc/C9aeT8KSmhu6uHo8Eltr+lS0NAfJlGHxymFQg7UbWjiNvbL4RnfC6R3uIgiuTychsAx50veyRMPALlQf12ck8qUd9ILe5PsIYVVTjGxzil4ozEfTL4NY8p8qcfllRE8HBBnzPRuzfmndXH4lFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by LV0PR11MB9864.namprd11.prod.outlook.com (2603:10b6:408:384::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 07:43:53 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:43:52 +0000
Date: Thu, 16 Jul 2026 07:43:41 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 08/31] tools/intel_gpu_top: add explicit
 drm/tools-stub deps
Message-ID: <hl7jgzlxf63ewlmqby7m2g2ob4hxd2sii5rl4gw7imcz22h4fy@e6unefv6wjtz>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <1eb43ab3578ca29fa5383fd0125d15729f13c730.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1eb43ab3578ca29fa5383fd0125d15729f13c730.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL0P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::12) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|LV0PR11MB9864:EE_
X-MS-Office365-Filtering-Correlation-Id: 0920e951-821e-49a9-49d6-08dee30dfb5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: dJT++iIuCmuDcHv/mqtLtkq+9u87tBSlZ4H+9bDbPiKgiwVu8g3oDjw5mL/4qpFoikBZ9mZCwtb/iTaCSwlKeRPqkEeN31ShLpBVuqXuW8IxNhpA1LpYMHzbHzGkOY1eFxZ2+oNQVTPIf0S18DUMGPTIT4aYAts+qrAvNitKK+RJd4vZAObNfwYea96P2FXVRlo197cutmhAWsXxEzwCemGijydsbtB0x3nggvUh6f29mktXaw2HwJFs6y/T8HwfmQ84dQhakBtArwR6TQo8lesu5y2Ll9mG4yW1ddEWDC3sVqaYF63MCiQ10EsG+hxlj9i9m/iPwY8Rj/syzfHvGvDbaN2dPsb9MgYLcX9gzp9mZoEYB8HEnbqi/iAJ7Z0ulLO4Xfs3726a06a6/gJS9VXK8beTgSwZmB2m7VPlu4N2FiaBzHwbiwJvBJThC/76lNIe6QSCFdjCRjXFHYeDQcLL3D3suy9FE+/OvpDb+xMYsayez2XXk2H28SuuCDjvfJ7JhekUYe8OOtNXLoTUQh8uGy4ys6z3FyUjqybqgTs2DtOidF4f2ct6NGD1hibsQbHnBOXjqAnYT7c7AjVf+HS9gDkUeXj1K49+NdXVJOSO2X0qoiIlx0cr1Li51Ikzwxy3Ti/4iwNXqSVf0peDHQocGIsMAO1n9I26L23/lc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzFwSFV0K2FaS2Q5TmJ4Z1F6Y0huaysxYS9QYlFyWHgvZ0hOSG9kQnV1MGNG?=
 =?utf-8?B?dUVVT2puakVtZ2xjd1pkbTA4cWZwbVEzMWQvWEhCT2h5K3paQi9Fd21BNmdz?=
 =?utf-8?B?ZW54OUdMNllGK002R1R6V0t6Sk44bDJ3UlNEU1AvWHVZRk43ZC9kRWFBcnFI?=
 =?utf-8?B?L1NrQ0ZiSTBHT2dabEpXbnBBY3M0TXdWRzB1OFd0NjZhcDdjNHZkVjBUaUdS?=
 =?utf-8?B?SkJuU01yTFZEOEpyOHpIcU9aVitobENLRlhZaUQ1aEE3cWdMUVJ5cXRtek54?=
 =?utf-8?B?alN1K2F3ck9YTlBXMGhwSTAvQ29nQjk1ZDQ1MHgrcWJ2bGNXVURNcVBnQ2lE?=
 =?utf-8?B?azhLY3AzSkNGR1draTFtZjhJTG40S0JkNGV6QmJERzZsMEF0MHpQc2dJanB3?=
 =?utf-8?B?SGY2TXhMYXc4dlllZDQ2ZVRyOVlHTEVYV3NUWVEwMDRNSjk5MitHbFBobHpR?=
 =?utf-8?B?Q1B6a3JKU2dQQlVzSU9HUHZveVVCcnRxdnQ2bnRNSFJIMUJlc3A0YmlVUm5P?=
 =?utf-8?B?VDQ4NGxGQ3haWDFZRnp5LzBmT0hJZkJDUUNOcnlSMHMwQlIyNHRUSTFPaVpU?=
 =?utf-8?B?QVhjbk9mT1orMGZabCtseDQ0SlF4K1B5WmFXNk5IRnBZV2VXdk4vaFZreit4?=
 =?utf-8?B?ckplWUVwVW5FRUV0REhESEw0Mkwzc2VONnpRaW92ejF0V1VXTU9SVlpMREFm?=
 =?utf-8?B?NGlKUkduc0RGR25NZTMrdk1xbWpMTDZ4TzRUdFMvQmFjbzh4MS9FbndoWXdQ?=
 =?utf-8?B?N0dCNW9iN21LanZyT0YxNEI1S2E0emFjei9uUzNDTFVvc3crU095NE9jT0RH?=
 =?utf-8?B?aHRad1ZJYTVZemxPdktZblo5N1JDMWdKMU1NT1hKVnFBVzdjYktKM0h1VTUy?=
 =?utf-8?B?M0lNSDgwanJseUFGSjBYTXlXK3MwS3ZBQ2oyVzFFNzBmclYxS0o2VFZvcHFE?=
 =?utf-8?B?MlY3dHZTb0tCb1RmUm9sTmMyZ09QckNJZVdqRFdLNmhzSW56bHhpdjNrbGIv?=
 =?utf-8?B?dFoxRWwxZHpLbTlYTE9JU1FRb0hNT0tGNmliTjFIUWMya0kxZE5ZTzVYUm1s?=
 =?utf-8?B?OEczWUkvZkVtQXo3V0xKQUxKbFlER1JhejkvVmxqU2wvNkdWS3ltSU4ycGRB?=
 =?utf-8?B?clR6dEk2Q1k1Z2dTMjAyV0hPZ1hpRjNSSGF3bmw5Y1JGZFZXa0sxK0UweXE3?=
 =?utf-8?B?cWo3bnM2dWxaZnE3NkZBd1k5VnlrL3BPNml5K2plY2RXVUFVeWtUL2llZDZR?=
 =?utf-8?B?cWU4aEVGZis5VFNqM05ueXFjclV0SU1QUFBDRXZWRE1kWjNlSjIxaCtXaElK?=
 =?utf-8?B?bUpzbndjTlB2Nm5rL0t1ZnFRMStxWThkYkFzbVNjZ0M2OVNwdmU3d0llbzBj?=
 =?utf-8?B?b0ZhNmo2SE1yVjVUM2M2bXhzbG1kOXBqZzd1TlBnYzVKeDZiczIxMXNkYnpX?=
 =?utf-8?B?cm5DR1pCZXNxcFpFSVFVRWt5N25LVUZlVmI1MmdDWHlGUTBNRVNHNmZZb0lW?=
 =?utf-8?B?Nm1xNUVqZjdPLzgyOER1VTh0RmsvYWtIdVQ3SjZkMmdlSEJISjI4UkFMVFRB?=
 =?utf-8?B?K0JTV0pDVENkOEpQYzFOY2RBdW5oQ0NvWHNVMitUZjMzd1JWOFZQajdPZVc1?=
 =?utf-8?B?YzJiMCtPdEdZdjE3c3B5bE1KWllLZU1CMkRJTkNQcGs3eFVKeC9Hb0RwREpD?=
 =?utf-8?B?bmNKU0owVFo2WjU5eWlUdXlOM2ozUXlVcW52SEJCL3BUOHU3empEMElmUWps?=
 =?utf-8?B?TlBwdWJKNzd6NDk4K0hzMEllRmJsYjhpcE5jemptNnR4YnJXcWR2VmFIQUxN?=
 =?utf-8?B?MkZKbmh0a0RkMkRCdjdqVkVDVnNqWCtVdmJLaEhYeWtzZVNnNDQ5M0cvOEpq?=
 =?utf-8?B?VzFXT3FBbGgwMU1KbHpWMVhuZXFNY1I1MHpITW82ekJqUmI5WXFhMVk4YWhs?=
 =?utf-8?B?Mk5OaDBOQjZlaXl4Mms0eVAxbmowYTk4QkxRQ0kxZkJSNWJ1d3VEVnhRQnhL?=
 =?utf-8?B?dnpJSWI2RlhKOEtYenluemlBZjhtdzNtREdobDNNT1h5STUzWEN0NjBKSlFP?=
 =?utf-8?B?R0NhYWRpMzV2b2VjNEJ2bDFnK251N1g2RWJhNk9nQWtwSVBGUGp6T3EvZk81?=
 =?utf-8?B?QXR6STBuMlNlOHJWVmdtL21wTU1vVzZmVWwvdU9jWjJCSnZKemV5bkdvZEZE?=
 =?utf-8?B?K2xzMjZJNmR0aW5kc3Ryd2JQWnZaYlk0QitCTDNET1FtNFRTQTJEc0dxRFVi?=
 =?utf-8?B?cURlQWhjSEVMMFovSlNKbG95R09MZ2NWYTVuVkx5YXAxL3MrRFdkaktUcSs2?=
 =?utf-8?B?QzZPbFF2blhOMTd2a00xcHllQWEyY3pnODVxbnFzUzRIa05LeCs2ckRvVzhS?=
 =?utf-8?Q?kOlz3N/QwTlHgI9w=3D?=
X-Exchange-RoutingPolicyChecked: RVOpTmYaXflceSTH64LtB1NidQj2/tsNDgTmcpAKwwttiUfDMhQSwS8ZKlt1Diveb8h85G94YLOW1e24ZkIeF288iYdEc4kPvq3wgNAz+4gpxkGjK0kJ5+A/DiPPAMQhcfw3AVsrwFS+gyEh/Tn/lxx03yTtN8u7Evke2TO4r8xfz26MyqUzpF6UNr7QLrC+7Xzx3inH2G13GJghOf1eeVDztuAQhcqstt8M3qiyy3qHqjn+ITLOaRS3J+qeUR2AS6p4g1b9lPFs/atHMC1IMDvkez7vzaeRlDWH9oE1AzFVce8UgCdI+rTH4NHCxA21+vOczQoznwSQmaoH5xDvew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0920e951-821e-49a9-49d6-08dee30dfb5d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:43:52.6189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdVLZn76qvJU4rsUgwVcdhek3vnZg9pA67d8iT/hjR9rNvP5fwS7foXpbUth71OMo2mIyL43dl2qbBcGOhD0qh8Nv4cBbeRJiOCxUjc44S4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9864
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

Hi Sebastian,

On 2026-07-15 at 14:15:18 +0200, Sebastian Brzezinka wrote:
> Meson does not automatically propagate static library dependencies
> to executables via link_with.  lib_igt_device_scan internally links
> lib_igt_drm_stub and lib_igt_tools_stub but does not reexport them
> through its declare_dependency.  As a result intel_gpu_top must list
> them explicitly, otherwise the linker cannot resolve symbols such as
> is_i915_device and igt_log at final link time.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 4c67dde4f..53aa31056 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -105,7 +105,8 @@ install_subdir('registers', install_dir : datadir)
>  executable('intel_gpu_top', 'intel_gpu_top.c',
>  	   install : true,
>  	   install_rpath : bindir_rpathdir,
> -	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
> +	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
> +	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
>  
>  executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>  	   dependencies : [tool_deps],
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof

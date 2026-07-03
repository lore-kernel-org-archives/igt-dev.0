Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6921C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B6610F93D;
	Fri,  3 Jul 2026 21:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7K3Y35N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9AA10F937
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112959; x=1814648959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LO03k1MYxm145Rr/b45gIEvphQs+NF498WM7w3PQVck=;
 b=S7K3Y35NACXtFVlEbfJtQj2Rt1N47Ub2SKZ7W0emE5KtBs6EimR8DbaD
 EE4oe9ificODWozwTNiC1qdOzwGCDAWCYGKj4UPIjnlTMo/4POUuADW66
 M7J/sMSWTfq3iYMJN5qfNjFCFe4YhPgUFRg9NyNmiq1Iz5EsPCabwhJmu
 79rSgHYhTyJh40Q57oHP9/DkA2wguPOM6ZT6fsZCGSOzlULmbnslSWzRN
 hLGsmEU9mDXa4DhPRUFwu3X0HMtZv4dUVKYp7W8puqP4k0wW7qKajkQUn
 i2SQbbrUa53Xm7XHSWz5IkuyF9/jimPy4C2xbRRxj7gGiPdL915bF9uaV A==;
X-CSE-ConnectionGUID: 4Oy34DUbRaGI4fgg+E9jNQ==
X-CSE-MsgGUID: bHqJCOs2Sr6+3GT79/m3WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86409007"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="86409007"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:09:19 -0700
X-CSE-ConnectionGUID: +AJOj+HJRxySLTyGFakVow==
X-CSE-MsgGUID: narW5MaqRCWYmIp90F39BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="277518756"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:09:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:09:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:09:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROtyDmCEVkeXCCw/UQENJ6MTZ4WfdxjU7UDeYZfPNXZIjNoL3IfXtrCE/lMAvo3z1afkxHM+/ohd5frK+xvpUKrobYaKL141AbINiUY8qhQe4C2XnAIJZJmltr39VOqj9+nAJLReQ/IjU4i/fopVdv8rQMf/UO0hA8f1vjK77fFzK9kAwXR0t7SEVQzU+o09Be7DmUennBah5ZOhyKlyrLq/rus9qkOJDtltstg/CPdlAW+zzCGq7YQ5sxWHwX75bkynoQxws4wwNmUyGPE7BEN82/N2WabAGpR1XwqypEsKd1QIoN04BtKi3/U2L6yoxafOQTh+zWcouLiclugXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orA3q99VMuJaH0+Vni9qzuW0JCWx2SlDeU0O6R5l/9Y=;
 b=sEsJSYGF548wNInU5CM+CkKe1QbKuqOMuWYt63wkF9rHq3d7s5MSFUgtldaz3ooerl7Ov0SVxGUFb1Y+Fj/d6FB6Z5M/KhmM6+LjZ9PnKGu6HKQt2wmxV3su+qZZmAaYDyhcl/U/VLx+lynBaKnnNIyfkALc8LbkmQjHL4ZahTspxGn8vBKJUz4Xvp2sJmQDf0NZbTA+5+0ixyVOq2e4CwMbm/XAiZ2I97bGqHWegC3Gox03w18mGwe062QukpO68h5sS9w4sD1jx/3zCeKXDX0cj92ZCIBs5UHNVInqEOXmjUJGXFY6tbtMzhXv6gx2R37WEBaZjBC/20aT7o20kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:09:16 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:09:16 +0000
Date: Fri, 3 Jul 2026 23:09:10 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 28/31] tools/intel_display_poller: link with
 minimal sub-libraries
Message-ID: <gfauqsrnozltunywvsxgceyqkg5ydbwn3vv5rxcunpjy4lubuw@yy47wf2q4jon>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <9ad7e1f0a2bac78e571b88008b2c01e37added89.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <9ad7e1f0a2bac78e571b88008b2c01e37added89.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU6P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::17) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb8acdf-ac26-4c06-e99c-08ded9475700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: /4HtFqxyZUvwZ7O4dLOTnT6jLxwL4J06witiIMnB6mkmuYCt/Zgc7G8V/ke3YVLMpsjYZ/z0EGeV8/9WeCmMV/WzKV1sUGrVc/c5yvuMu8p60QTye2uF7NSSDEep7UzGOBiyk28DcIVNIAhrFtWsH23oblJIocYJt5UO7zICFMMUgCgVaY0/pzGHGwW5JdAGsiRM4vbynyURNLF5aDw3p3z1mSqiiy9nm9CrNqVMSMQOSfmI6lXKot+mPCzBbZKEzRiGw3SpvIF00KLA+PrvLgMNipqW17KLHBKVFmrG9hbDHaACVGE48n3zrFbYwC5pUdvQjfbfdBv6dTgPGU3R+7o5R4OcLlaGbQWkGLQQE+A9XXKsLgskO87F8BuhF9mAxQie321UPx7Qd4VoNiBY6q/u26TnJYTEsAYb9FH/SR0bVJF+iHoXC1zP8gXfs+WSDGNmeQrhl/nt5wqEaWFP1RfcH2wUApw685eWvuZQHt6zL/Tbjgad1lM+JptCXbXiR7nfOqIwBQg01znxQyLGaMvGdTIQn0K81ueJN3/x8yVkMGCiNpimbJlw6/XYwzeJDHJHDkzqr6fFWwnD8IMNKsw1oYZkwA/Iqwzcz0VzvTlQyqjdEQk5MlBdAjHHtXdBFAorej+9d5dvUBZRU/aFUHzAZyplY8i7oZBDn6nTeaY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2dFVWhLTFhzV1Z6Nzh1SXhjZjR5YWlEY2d2VERVeTIzUERySGtmVHpydFhG?=
 =?utf-8?B?UDNQK05SS1VnUnlpY29KSVNUME9nSGp3WkhkenU3VUhoRkplckhJcWhSWkE2?=
 =?utf-8?B?SFBuOFFXSm1hczVQekt0Nml5c0MxUkVqTGF4VWdKVUZ2TTNqL29RQ1dLRStx?=
 =?utf-8?B?TThHUUZmb2puQjM1V2dyVkxVRExCWkp5U2E4RVhDZ0E0bzlCSkpuY3RjN2kr?=
 =?utf-8?B?YjRUSmY4Y3Z3UVBRVVJidjNiVnI0UCt1K0dPMWRpN3ByM0tJRGdrNGhTM3RZ?=
 =?utf-8?B?b3h6RzFUUHZ4QitraEpGR21OTWo1Uko4SjE4bXN0dFA2a0FaR0pwUk9lSlJh?=
 =?utf-8?B?TGlYbGRUdThuMW4rWVVkY0k4UjF6M3QyNTNGdzhHL0w1bE5FUTZRZ1dFOHNq?=
 =?utf-8?B?aUw5dHo0b0ZQQmVlblVDOUd5eXNldDJlSHFwTkp4M2YxalRUUGJmeWdzYjdH?=
 =?utf-8?B?bktOcTQ2YStmRmR2ZEJIdGNpYnRzSGpIN2NoS1ZFMVNXc013TTNRdllra0hN?=
 =?utf-8?B?WHVxZmlOUWVlWGxCTE1lVGQ1K3lLYWRKT2dKVWVUYXZjUmhrTUV4VXVnTW1R?=
 =?utf-8?B?V1NKQS9uZnFqYXZpV0xuNk1kaHlNeWR6LzU3c1F6TFNYY0pYaUxaM1IwUHlW?=
 =?utf-8?B?RDQvaHpCQnRlTUI2T0ovekl2ZmJJbHVyaDgyNDVoYUpKQ2ozMGltM2dReVBM?=
 =?utf-8?B?SVNTV3Jra09Ub2JtblhRbEtkVWh4K2xwWVVLTkF6eVRGNlJlWVVwdndMNDFo?=
 =?utf-8?B?Z3p3dEdzQ3c5Mk5GcEt5R1F5NG1CNDBaWHBpQjM2TVJtNUVZNndYNSt6T2dj?=
 =?utf-8?B?d2NMbXhTeTlOV1NlUW5DbGJ2Z1NvU3JvS0xybWhWL3pkNlpXQzNzbWIrUlpa?=
 =?utf-8?B?M2Q3c3VNTUZmMm9CTWI2dlhnTHp0MDI5SHA4WnJCdVB6dFBhRzJyODhlVk9p?=
 =?utf-8?B?UTlRRW5rdFlacWtGOWQ0c2VHaVZNTDkyNGQxSmZHSjFhUjh1UmdvTU9FbTJJ?=
 =?utf-8?B?eUpsYUlvZDNmb0s0ZGdza21EbGpOTHJiamR4QWkvVmhjMnBydXBRZmkrcHRq?=
 =?utf-8?B?ajZHUEdyMkJQVEYweHNLOURyT002UllOSlFGZkhqYmlPOUlndE5JU1B3Z0Z4?=
 =?utf-8?B?c2NHQVJ0TEVld05aOFl5NnVZdE1FM25Ja3VkWHVhOWRhT2Y5OFVnTXpyY1cv?=
 =?utf-8?B?bGRqeGd2TTBmMmRSbjR1ampDZXl2WjFpWmRBY0pFRTYxWlRKVzRCSUpzZ0Z3?=
 =?utf-8?B?NjEzbjdYcjNvQ3o2N0VROUM5TFNzZDVXMEpjNElUVmsrMERCbnk3S21MMmls?=
 =?utf-8?B?NEZlUnhQZm9idVUzSFhDeTR3a0ZRUmlxdUJKL0RJVDkvdUpHck13Z3NkS09O?=
 =?utf-8?B?YVFuSEtEZ1FuaUR0aU1QcXlEQ0dsREg2NGl3Y0lkM2dOU3haSXZFR2hCU1Yz?=
 =?utf-8?B?YURDOThLSVJiNW9rYkFWeXJ5VkZwU2Ivdjk2QkppNUxoZmFaejMzL2I2NkZB?=
 =?utf-8?B?cUxVQzNwR2lYUE5NNXFFYXFldVN2OE0wQ2lLTmFyOFlxWFJYYm1FODNrM2RG?=
 =?utf-8?B?Q2puT0xtZFIvWHV1bHBEbnEyTllZWWlmbUJoaVJSTHJPMldBS253Wng1WXdy?=
 =?utf-8?B?cWZzK3RZM2xkQW91cG1PL0l3ajRTU2ZlUXJEWFR4R0d3dUZqZEwvU00vL0s3?=
 =?utf-8?B?MHNVUHJ5VUl5RStDNG85RmhBWWVEaUFDVUFTemdhU2hsRng1MTVOb1pzeXc0?=
 =?utf-8?B?TTVLeTEvR0taZTFTMDVoUDU3VzhTaVdWU1ZHcWEwMjk5LzUyL1p1Y3NaKzF0?=
 =?utf-8?B?ckx2VkF2UUJxWDVCTENDdTZTYWFpZEl3THlpZHlPNWhvMDJEZW0raCtpcGVo?=
 =?utf-8?B?OGMzWVFMbmdpUjZJeHdDK01pWVNPZU81aW0zK3M3aG9tMStHSWNDYVZVMEZL?=
 =?utf-8?B?U2lJQ25SbWpZblArQVdvUCszaGJMM0dSQ2U0Ryt2eHdXdFgveTVuZmIweStX?=
 =?utf-8?B?NU9ESjZDTVI5Ymtmc2xDdWF6OVdkeUVWN2d3R0l1UHhVWUpuS1RKNDUyVzh6?=
 =?utf-8?B?V0o1OEZyYktDUVN6MEJjUndRUVNHMExtcjc1NXVSa3pBRXpDRUhiajdhQm9n?=
 =?utf-8?B?OGpLSTlmdHVKWHgzSTNnaU55aWZlMHFhWnl6MEVBS2RmT1pSSXNobmNRbEVF?=
 =?utf-8?B?KzZUUFNRaG1SZW9tQzF4bStLaUpyaFFkTnI0V0NpZGNuTU9uQ3dyWGxjQ0xE?=
 =?utf-8?B?T2Rhb0E2VVkxaFVOVFVEdmRaajN0ZyttZG5Rang3L2tpaE9SdjlzQlBFVlpn?=
 =?utf-8?B?NDVaNHdPUzFTOTJiMDY5UlVEUTV2RHJDRDNEZ1JjNzVZVUJGandId0Y1dzA3?=
 =?utf-8?Q?8BBd/mQOmTMXnR8RMITdMYfC1b29FP1DdlqvKZ+l81YTM?=
X-MS-Exchange-AntiSpam-MessageData-1: qXk2RUfKVCQbi/nVwqx1E89uTMmXWxjKmA4=
X-Exchange-RoutingPolicyChecked: oF7TLELBKo4Xh1KF72o3RvQgnccu9WkFRNWl4+CPpKfwOMYxx6MyJPzrOvwoc1xdZ/WyxIbyqbXzayJ8yf8cgzCFjcFyV013vw7EfmCl9kYYZVhwZT0pV3cTK/hbNTI3/IJ342bEXN1LzsfLsKxSa8KfGf0uOR5Vsf1dljKeOhhNITEUj+Wck5fhunyPMvsTgdRfLHeMBKSdrdHtsjrIr3MR8xro8p0RNoOV2Kv61gaI0VPR9/avUPrihpWVuq/DiL5VE0L5E6zO6LRmMRwndGibpYrx4uRtd7h3rMdBwReuwm5qOBc4HdEJF3bOVSvHQFdCttnS7FKcY11usTIqZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb8acdf-ac26-4c06-e99c-08ded9475700
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:09:15.9763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9djPl/qti67gUnVpfBQfJtyvMx9fh7/pLkMclwpMb43hfhbVRfa282ufWoo3ntA5ko3dmE/z3ahHMQdfzkog+M6kLBmrSUbMSIg0sz0aPNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:29:02 GMT, Sebastian Brzezinka wrote:
> intel_display_poller only needs the register/MMIO helper subset, not
> the full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 0cc62b54d..2a084a0c4 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -17,7 +17,6 @@ tools_progs = [
>  	'intel_bios_dumper',
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
> -	'intel_display_poller',
>  	'intel_framebuffer_dump',
>  	'intel_hdcp',
>  	'intel_opregion_decode',
> @@ -128,6 +127,11 @@ executable('intel_watermark', 'intel_watermark.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_display_poller', 'intel_display_poller.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 

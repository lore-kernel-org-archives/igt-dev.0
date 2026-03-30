Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B127F3D5E7
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 08:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E578A10E4FF;
	Mon, 30 Mar 2026 08:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xh2ixyO0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5B210E4FF
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774858749; x=1806394749;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XwyHV3v1A4XPzQjrXjUhqW++7ML0K0Dmjn3EtqxLnWc=;
 b=Xh2ixyO0Ka22AWo5oHtmMQCfCniuv1ElEPa+3Ns5SqfjHebg7ZYps76B
 umZpzpdx4H6EyZVcQmw+kjIf2UuWjkHwzXgIZdltI7hEsYk8H32Kh80fG
 O0aVnM/fjCJQ3muU1IvoVldDlqIeS6/MjFvfM7Kof7/umfxhq1OBAwKut
 qWCHaZAVxvEO27JiuHfqNJyKqBvKO7Pfg10HvWcSyYKX2EGoFRO1ByTac
 V3hQGE9R9OOYOAOhpSSW9F6jUrLgtqqGSwZeSJxY5tAoE5W9UiCDYwDKn
 APGqvYNaVOZb1h2HxWwVQeHemKmRUZAE0QKaUe9Tth0uxZKgbucvizqGs g==;
X-CSE-ConnectionGUID: RI5cODCrQpG/Lk9r7yIpzw==
X-CSE-MsgGUID: zMG+oMi9RQeGhkvDjfaErQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63396971"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="63396971"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:19:09 -0700
X-CSE-ConnectionGUID: fhTbp1+nSe6LboKKLBIPLg==
X-CSE-MsgGUID: oNMn/vxLSYevu2J3avIg1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230899272"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:19:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:19:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 01:19:08 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:19:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcktIL95AdgWADFSXgw7INSJ4yvoV2eSSr7wge4MphIQBrL3Ggaua7RVSqHwnspG2GtJmJ3D+vqLsQyYEr2b2yAk5OmYkcJHgZ5g/mPSHQ4U+VrwGEKcOPoIPCqdDrYA2dKQaLDtMcBRVLfH5TpY1uhCbFb3ouEy9pmuoccyn4o3Cn/zgG7X8d76mJzYUt34Jf3qx8H+6d0Cay822Od8RDGyruAvebpfLWNb8jtAzu9wQ/XAHxWH6RpRnkpZXAi/Bc8Ads9LD6d8KZu5P2189tVmm+xO+LqIB/r3+k94Y8RXh+X7KkqGxMuwIabirwPgXnKJg2av24yZ9VUfT1S5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAvyElqoCz5CdK3HMK41COxcclB63S0zbpwsdkLifUo=;
 b=eFR/DQQXq880DTDPnL1nKMGEpcYc8KSEN10M4lQMKB9A9/LrJIAeyIZ8AVvpx6kYTEycoZQ4EQ1Ep30lTeJsgONBNFoV46bcp3DEEKfBVDE7kcNWfkNdbRFkEPzCzjqNeopPgnEdSEwouzgNEES2cMxVnj09KskiFxhG8F/KczoR66Q/m1QZNvO7dWoItpZwjiXxF2/fXDN57qFVjf6Jq2IEkFCFtw01Z13eP1hf+tPq4yB0u6gXsrTo0GZ6Ef52lBezyjiCNn3r7qeXsyLqB0NeN9Wtgse9P6yrp7FlZOMHBipwNWYchxwQ3M+OXwOx3+FpnE+gwm+YgzzFeklxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 08:19:05 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 08:19:05 +0000
Message-ID: <e7fa1ab4-ec46-4e1b-a73c-e4d92ea2bf26@intel.com>
Date: Mon, 30 Mar 2026 10:19:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 3/4] tests/intel/xe_sriov_vfio: Add open-basic
 subtest
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>
References: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
 <20260327140627.64574-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260327140627.64574-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI6PEPF0000022D.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8e7) To DM4PR11MB6214.namprd11.prod.outlook.com
 (2603:10b6:8:ac::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: e4308d88-7874-429f-9c0d-08de8e350209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Ily2W/OKi74SC/VmccNRp1JZB0x2SWvaJOucCR3ZgLHe5YGZ2Jh6ixzoytOP/P3nKsvGrI8m9mfXFPxERfmJT2wVxZbSTVJ+mB1dbKVQnT510XYxuHe4YkBgws+T6XQ9Bf4lsu/ntIyqELfuLIaupP3A152VRKy4xUkFBCh0DEqeuAa7NapmVYdWLFc/6rpSufGCgKA1tn70e4a9JS5TT+fWj4bFuZL23sP5sON6u3wD+6MOEkqChSZvO2cFwIA4ZQsXzjbWGqllN/8ry9buSUXSYm05ZDOK7u0Gx63p6YnluXWPvwfi9Z0UmbFn/OBFatyLxWHws6FndaUa3fIbFeY1qw1MOBRODGsFNRIfCKBNsi/wI1kcBD/bNMLq17A7jfoKSoclaifa/5G99K2HIGEGWSnBumm57F7aFQO9oE750xq8S1aSFnoTfFTrfLXZx+Nzd6023ZnNERJRoTZ2cnmeHHgWYSLfK/0bQlHZ+9sxb6Z8348b2ewA7JPFxstBbRI1G9tcdMkVrsFMLuEn4rcmyvvzVH/dhMjxlkkn6PJYulqbuhHuklNdO0k/u7VQFohPqpaHNUw1rItBLin+lCjTnTcWzRyRIsPQs2N9RawkYLQECw6ZR4GkapZDcGCxXEIdeOtBDPQlegayCfiPDrn0Q6AyCrCdnXRXbfZiiNYPpcEiCLDbaded7FFfhJDP/vmbVL0E8TXhUlDO9UqYTHqBfbKvgQei7Q/Bm21P/Lw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHlLNHA5VlBFOGFIK01sa0hQRlZhUXptd0xqN1pMMm4wRnFhUmp0eHREQVNj?=
 =?utf-8?B?VjZnYzBMY1pCVEdYa3lJcTZvbHRvcGJjN2tXSHFmdy9aWXcrbEswajREODVL?=
 =?utf-8?B?WGp1V2YzTERteEIzbmxPeUFqeUxCdE1YcjREZVZiUnErL3pkL3pMMmwzeWdj?=
 =?utf-8?B?bnZ6ZEhQSHlHa1FuUnRCKzBDTlViam83QWdqZFJuTVBDTmtRSVBZcGR6VXF0?=
 =?utf-8?B?L3I2TlRBUFgvTFV0TUZhRFNrNndUbU5wd3Z0SDcvUkVpS0RXc05vYXVlY3hE?=
 =?utf-8?B?d0dmTDA5MkY0WkVvNVdHaVF4NGkzRDhJSTJvSnQ1aC9LbE92Wk8vN3BxNnlC?=
 =?utf-8?B?dDV5Qk82aW5EL2JIVElnVjJXbU9IcDJvVlVNbXp0b1lIaW9Lb05UU1VEMDJq?=
 =?utf-8?B?N3BINElVOGw5WWN4ZlFKcFRnRW9NUFplZEMxM0E4R1JNUE5KOUZXaDV6UXFr?=
 =?utf-8?B?QmM5TktBQytNbW9NbGo1TXdQTVQvVHhtNXNieCsvL0RNaE9yc3FRN0NxVCtF?=
 =?utf-8?B?cWZqclZNVktqTlRZNWRnTFZUN2tFWnFmVnZlR2ZUdndvZms2TjBCTFIrN0g2?=
 =?utf-8?B?RGNYSXpzZ2ZuN1hXakM5V1JLRW82RFhtRTNtRlBNelA3cDMzRHpCaVRoSkw5?=
 =?utf-8?B?R3liSGs0ZjNoejFqalhzWk5LMjNmcXhDT3F2MlBUZzdya3JIZk1oWE5qZXhD?=
 =?utf-8?B?TXNSbGRIMTlMNjdpSHhMUGpUVGdBelBNZlI2UnV6L0QwMG12RG9xZ3F0dnds?=
 =?utf-8?B?SjZqMVRNWVBqeHY1Y3VNdzl2NFkxZzRUKy81Q2swUUU2WnZ0VldNcTV5LzZo?=
 =?utf-8?B?V0dEYWNGc0FYMStNWXIrMG9xQW83aG1JWUZXdTVNcE1uRGFkRVZ0SGtvUVpx?=
 =?utf-8?B?bC9LRlg5eE8xQkx2aG5CaEMwb2tMTGd4YTh3cHZvTy9SOXZMM2tnT1hSVDdm?=
 =?utf-8?B?ZE5WajRNc0thZUhBYU1RRlkzWkZNOUNrOVhhL2VPUit1dHoxR2IrNjhzWW5o?=
 =?utf-8?B?MWVLaWI5MXRmbTRFbjExQ2t0QjZHU3J5c3V0b0RFWmZvM1pqNGdqUHRGUllh?=
 =?utf-8?B?UDBTczBzRS9FL0NlbmZkRW01ZzNPc3cyNnZ5Y0xxamEycFF6TllZcUhqT1JT?=
 =?utf-8?B?cWQ2R2Nmd204REtRYkNva2kwZ1UvSUlpL2NBQmt2anlpUGtsOGFoVTRIbFMz?=
 =?utf-8?B?Z1YrWnZ1eVFpQURURVBBdThyWG4wMTdRNkY3Nkw5VXpwMW5zcDRmU0hxdlNi?=
 =?utf-8?B?OC9vbkd3QWxUMXcvVjVvTXgzdGRJVkVEQTYwNVF2Vys4WVJQZGp0YjBOOGxk?=
 =?utf-8?B?dDhGbXIzSm9oaGpzNGNLcTJ2Y0NET1RBTlhKcWpnWjNZOFVBaDdJN3NRRlBL?=
 =?utf-8?B?UHZlVWVtUDZXZW1xdTl1N2FzV0wxV3hWQXdJZDhZOU5mancxOWV6dUV4Yk9E?=
 =?utf-8?B?N25LbHNLUkxISmt4RVZvcUdVeW4vbkpkYnM3OEpjRTVyOGNZa1ovb01iZjJE?=
 =?utf-8?B?RWpKaFQyeHJaWUJ1aHNZSk0zWnhSNGt3emo1Yzh6QnNpdE9UK3VIZ3hSK0xX?=
 =?utf-8?B?WkpsQklkNmZvM09KeEVlQTZyb01nbWlOTnlDZDlrelFGbUs1WlI3aFZzcnlS?=
 =?utf-8?B?aTRNVTlXSlN0QTRER3pMS25lZ1ZDZXduVW5lbDBIeFkyd2VvL05yb1FUWkRO?=
 =?utf-8?B?YmhuRDVJZkNUTzM5NS9GSXhaZ1hmNmxGbWZOcVZJUlpaR2lPZ1VpaGNOWTBn?=
 =?utf-8?B?dFJOOUpVNmY2djlWeksyUlRFc3Q0eW9FdStwZnZRWkFneWpkclJncCs5OUNk?=
 =?utf-8?B?UXJqMTd4c1VzVExNTVErdGYvUXZHMVMzSmVXSmRYeEZBbXMwMEh0RmZjU0FV?=
 =?utf-8?B?VXg3aExBTWt6MGhrNXpnREQzVGtpRGJqRXAwQktJK2FMb3VKZ01UYkxTVDl0?=
 =?utf-8?B?MW95eW5hMTFaRGx4WGR3aGFqOTRzbWM4bjBpK0piRmFMdlhYK3pKS1Z1TWhq?=
 =?utf-8?B?YllYaGw2QWdES0dLejZsZ3pwTHFyZy9YTC9oNXcxNGpzM25KTFFYWGhyQ0tV?=
 =?utf-8?B?dCtqTTMrSXhITFpjK0w3aW9OeW5JRlJrZWk4K2N6QmprK2dycnZtbzM5bWVx?=
 =?utf-8?B?YUFZR1FLbXh0eFZqbVg5WkgxYmU3MzZ6RXREYTQ0V1FJTW1UWHRvNmpCVG14?=
 =?utf-8?B?WEV6U25GU0pQZ1Uya1ZjYldkMkdFYUNObDFoSGRkdk5hbFVsNHBUWlRXMy9Q?=
 =?utf-8?B?MHZxVnY0OEFDWXlMeEVjT0xoa2l4QWQyS1lDbVU5VmRzV2Z4QXo3MUZabExY?=
 =?utf-8?B?OFgvS204Vi9NYjAxQzBqUGpTakJsVVpkNDFGeWNQZ0RCZzN4bTFFQT09?=
X-Exchange-RoutingPolicyChecked: K78s96tJ51GQWZCoEWIdx4J+MUFZEMWUs0cyRLLGD47ASUbznvgdMb4DohusZGhmYKbofpY0QvuRnfY+OLdapegtp2gPMye2ckIphGgOZh0Z5sALz5UcPyKqch86FEbBS71XumrApd14PBYtZYnrMzZEDkT2iNlK/8LB8hm5+HyxZDqGgtakNWq0JA6l2lk7mTvtOpo7CV+2/DD2OCIXHPgn8GSM94qnJgPCsEwezl5zLY1Mbc1qFSvtV/uFX0TnHkfEkncj8BIAz+9hkXhte9PahCJ2oYbgO5KxUga3Je0CaJJz0VwgT5AJDO9+e+Dl9jVG7VaympsuEOrWJsFc0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: e4308d88-7874-429f-9c0d-08de8e350209
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:19:05.7224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUj/DypPaiq3zMs+3vn0CuAb2Sy3Oi6SF5tjXkGjtJ8BVgu2d8/lVHuY9UfShBdwJ6oxfC1Jp0jlO9O97RPqLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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


On 3/27/2026 15:06, Marcin Bernatowicz wrote:
> The subtest binds a VF to xe-vfio-pci, opens its VFIO group, and
> verifies basic VFIO access with a minimal group status query. This
> provides a simple smoke test for VFIO device setup.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
> v2:
> - Introduce vf_num variable for clarity (Lukasz)
> - Remove unnecessary unbind (Lukasz)
> ---
>   tests/intel/xe_sriov_vfio.c | 136 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
> index fa9026741..6a86b3780 100644
> --- a/tests/intel/xe_sriov_vfio.c
> +++ b/tests/intel/xe_sriov_vfio.c
> @@ -2,6 +2,9 @@
>   /*
>    * Copyright(c) 2026 Intel Corporation. All rights reserved.
>    */
> +#include <linux/vfio.h>
> +#include <limits.h>
> +#include <sys/ioctl.h>
>   
>   #include "drmtest.h"
>   #include "igt_core.h"
> @@ -22,6 +25,9 @@
>    *
>    * SUBTEST: bind-unbind-vfs
>    * Description: Enable VFs and bind/unbind each one to xe-vfio-pci via driver_override.
> + *
> + * SUBTEST: open-basic
> + * Description: Bind VF to xe-vfio-pci and perform minimal VFIO group open and status ioctl.
>    */
>   
>   IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
> @@ -109,6 +115,109 @@ static void bind_unbind_vfs(unsigned int num_vfs)
>   	igt_sriov_disable_vfs(pf_fd);
>   }
>   
> +static bool vf_iommu_group_id_alloc(const char *pci_slot, char **out_group_id)
> +{
> +	char path[PATH_MAX];
> +	char link[PATH_MAX];
> +	ssize_t len;
> +	const char *base;
> +
> +	igt_assert(out_group_id);
> +	*out_group_id = NULL;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/iommu_group", pci_slot);
> +	len = readlink(path, link, sizeof(link) - 1);
> +	if (len < 0)
> +		return false;
> +
> +	link[len] = '\0';
> +	base = strrchr(link, '/');
> +	if (!base || !base[1])
> +		return false;
> +
> +	*out_group_id = strdup(base + 1);
> +	igt_assert(*out_group_id);
> +
> +	return true;
> +}
> +
> +struct vfio_dev_fds {
> +	int container_fd;
> +	int group_fd;
> +	int device_fd;
> +	char *group_id;
> +};
> +
> +static void vfio_open_group(const char *pci_slot, struct vfio_dev_fds *out,
> +			    struct vfio_group_status *out_group_status)
> +{
> +	char group_path[PATH_MAX];
> +	int ret;
> +
> +	igt_assert(out);
> +	*out = (struct vfio_dev_fds){
> +		.container_fd = -1,
> +		.group_fd = -1,
> +		.device_fd = -1,
> +		.group_id = NULL,
> +	};
> +
> +	if (out_group_status)
> +		*out_group_status = (struct vfio_group_status){
> +					.argsz = sizeof(*out_group_status)
> +				    };
> +
> +	if (!vf_iommu_group_id_alloc(pci_slot, &out->group_id))
> +		igt_skip("No IOMMU group (IOMMU disabled or not exposed)\n");
> +
> +	out->container_fd = open("/dev/vfio/vfio", O_RDWR | O_CLOEXEC);
> +	if (out->container_fd < 0)
> +		igt_skip("/dev/vfio/vfio not available\n");
> +
> +	snprintf(group_path, sizeof(group_path), "/dev/vfio/%s", out->group_id);
> +	out->group_fd = open(group_path, O_RDWR | O_CLOEXEC);
> +	igt_require_f(out->group_fd >= 0, "Failed to open %s (%d)\n", group_path, -errno);
> +
> +	if (out_group_status) {
> +		ret = ioctl(out->group_fd, VFIO_GROUP_GET_STATUS, out_group_status);
> +		igt_require_f(ret == 0, "VFIO_GROUP_GET_STATUS failed (%d)\n", -errno);
> +	}
> +}
> +
> +static void vfio_close_device(struct vfio_dev_fds *fds)
> +{
> +	if (!fds)
> +		return;
> +
> +	if (fds->device_fd >= 0)
> +		close(fds->device_fd);
> +
> +	if (fds->group_fd >= 0 && fds->container_fd >= 0)
> +		ioctl(fds->group_fd, VFIO_GROUP_UNSET_CONTAINER, &fds->container_fd);
> +
> +	if (fds->group_fd >= 0)
> +		close(fds->group_fd);
> +	if (fds->container_fd >= 0)
> +		close(fds->container_fd);
> +
> +	free(fds->group_id);
> +
> +	fds->container_fd = -1;
> +	fds->group_fd = -1;
> +	fds->device_fd = -1;
> +	fds->group_id = NULL;
> +}
> +
> +static void vfio_open_basic(const char *pci_slot)
> +{
> +	struct vfio_dev_fds fds;
> +	struct vfio_group_status group_status;
> +
> +	vfio_open_group(pci_slot, &fds, &group_status);
> +	igt_info("VFIO group %s status flags=0x%x\n", fds.group_id, group_status.flags);
> +	vfio_close_device(&fds);
> +}
> +
>   static void open_pf(void)
>   {
>   	int fd;
> @@ -207,6 +316,33 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Bind VF to xe-vfio-pci and do minimal VFIO open and GET_STATUS.");
> +	igt_subtest("open-basic") {
> +		unsigned int vf_num = 1;
> +		char *slot = NULL;
> +
> +		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
> +			      "Failed to load %s\n", XE_VFIO_PCI_MOD);
> +
> +		open_pf();
> +
> +		igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_sriov_enable_vfs(pf_fd, vf_num);
> +
> +		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +
> +		slot = vf_pci_slot_alloc(vf_num);
> +
> +		vf_bind_override(vf_num, XE_VFIO_PCI_DRV);
> +
> +		vfio_open_basic(slot);
> +
> +		vf_unbind_override(vf_num);
> +		free(slot);
> +		igt_sriov_disable_vfs(pf_fd);
> +	}
> +
>   	igt_fixture() {
>   		cleanup_pf();
>   		restore_xe_vfio_module();

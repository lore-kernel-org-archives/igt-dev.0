Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DB7106ACCD
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 17:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DF110E068;
	Thu, 12 Mar 2026 17:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQvHFhig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5C410E068
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 17:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773334962; x=1804870962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2/wSKdFUNy5OBZpSE9j0vf6Q6FGIVuMERn6Fc71d3tw=;
 b=ZQvHFhigXrr1cjoa68UkXmO4E3nEAlrAYJ0C6fv5g5D1JSypLICVC3wX
 M8avCDP5Eo5gJMDOooPlJBkM/8QN5qTDUoMVUc8LpFn5M8JqChqXpZ20/
 irUQ3Zkjn1lBMpNGis3FPcHC8Qrqh+Qngp0A6k/dDY/lHTaK0b5P+1xlD
 RKbC/QSXy05GoFwpXKKlHzSRj/s+h2FIMzo0OJvI/PIcodurRRyn1Vz17
 y5lNIXYCmUUZ4O+o2KsfHIFRlKBK8JF53zMbUnzHYG+QWcHqZ1Qb+Y7Z7
 Y/SuiXhMLDuMdXqM777Qg8FyK6+jvWOJzGD7uMm9DVTCiuR63ei8Okxj2 Q==;
X-CSE-ConnectionGUID: vnAVDDPjQYWQUlsHJcnSnA==
X-CSE-MsgGUID: Ts3UMUy9RL+UxvKVA9fIEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74137061"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74137061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 10:02:41 -0700
X-CSE-ConnectionGUID: ObtzWcI3TKmtK/vheVaSNQ==
X-CSE-MsgGUID: B0mOKRqdQ9mwkJk935eLUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="251386810"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 10:02:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 10:02:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 10:02:40 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 10:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/6pFaU0M355W7yAFR3ylcZYizLjrAOoAIcgWIkJSWE1Ap5rHmFxd7J4R5jZgwSkykGaT6MdekSnZDRY8kRaqMGZVx182BD57PaWcFZ6l2sYyoGhwoGLpMbhzuIbMaiMCpNaxWLtPIS1NtP0Lh0PyQFMffjaf+M2e3wLfNVMtisB9N0ZDgeHMT4pG2fxJPCe+awZxrvjNXqJJbu3OR6MM0F/bkYt1x2znRRXHV7+zcLDY4YJi3GhwVcXy97DQB5JEhbqbw4n40tCY1cp3RrZyZRak0kQ2jhJbQfXJEq/Q3cQudyGm8T4HGXwEm9Gzrx9+Cj2Qq1maM+A2nW/0vEoiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTfV7FfPn+T8G+lwMnceanCzgme2fnQi7osVUzPkMiE=;
 b=fne0AUyLQWegi0073QiU341toVPYsZ9KA8LsZKxZuAbYm+1SbkfwyoowHyMsHneXF8z8CE4VGn9zDk3V7Cb4RI6OiZa9J2gq7Zvur6pX+ke+9yUDSGe6w8vP4AlXhe/Z4a/3HmKI22mnKJMrsR9BnoMlb53oENVs4CUJ4LvsfCkYGmT6HBCp+CpOtaOr3cQClombtrAO1KmaNWe5N+vDhtsxDdhVXQISJd8zt5w1eXbGQKnd4Og4YXR3Ru8/Op2cWNSrDqLNaH7Yvr0axMeCYRwX0zLgpB2OYHK1F1Ox0LBc+BIYSk7O92Auk969jKu7CKHcyLPDVGyevGpHZqBgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 17:02:35 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 17:02:35 +0000
Message-ID: <c3da90cd-9a83-4018-94a3-01bb185708fd@intel.com>
Date: Thu, 12 Mar 2026 10:02:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 3/5] tools/gputop.src/xe_gputop: Refactor
 xe_populate_engines to close card_fd and use direct ioctl calls
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <ashutosh.dixit@intel.com>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20260219094804.835429-1-soham.purkait@intel.com>
 <20260219094804.835429-4-soham.purkait@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260219094804.835429-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA2PR11MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: b135481e-f90d-40f6-b528-08de8059282d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: wFM28WFUgxOF4PynOFGst/71Dynp7IFiZPIqKSLdT9X46oplA7Ard7ZtK1FpQlGkt4A5atr6D3eBGd5F0Rv9PBwX6r5Xffb2J9UupAIT8YfIISSF28N8ilEayBkiKz+eMlB73bRd+Scuw9MAq6hLiBmuRGKZ+wZielrBWQ3We/GYKzQ1d1bVjdMRF6kMkbFN62jWXkBVxyJUdne5HBuNLtEHjgBcNK14Cy1c1ZLcBG2uaJfFXPjXP8caVTh0xVgD33MfnTOsP2YVswkngm3V3lDeFITOHMmpYSdlKhTOJRfiwO7tofHTpAoLpY/uMm/HMgj8LKOswK98qdfbGWKFTzm/4wpTLF0Yi2s3nBsurr87s09DNgXvm0g+8XI4jHqzfNBHyQpa7iAOrjajdA9gs94UZJ4JckkDJcklzUXsVnA3ieQAaQPLpVHXXXKPeEIfcVjyPnPPxFx5e0DD5B5WZ9Sw9QBs9BX3v9HXRwoTXWh86YjIr07CyA1JvIZB0lW7yiSLWhOe8gYuytGDd2M4BCD+5zMOkzsU2bXIE17Y9ncpw1solgjTnRThoaWkl592i79WSUJc33St17YuHyHYkjdhUVz4YkHRp7jK2a6jlXQPjE5CLXhC7OA79o6Ac+KgAnA5z5thTy3PAxCMKqyDS8HYMZ37HrJYhWIrKW7wWaWaSKbtS2kFjYxpumGUeZFVg2/GutPqf9qMnjEKUxFcoTtlhmOKZJ5n1NUL2x/TtXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThZYUNDTkwrY0RVVFpvb3FtbllVZDlFaWFMeit5cHJ6d05PZzcvbzM1WVgz?=
 =?utf-8?B?VzBSOG9Uay84ZXFQakg4WEt0SmhmT2Z6dkFwd0srNlluaEY0dlN0L1l2dVVQ?=
 =?utf-8?B?S1ZYNFFCTlZmMG5NL0o0T29HZWJWZW9oTGxucmxsZXc2eVRWRldnK1dDRHpQ?=
 =?utf-8?B?WTFYOElidVJ3T0srMEZra0hFN2lOZnEwNTRFV0NCN1JEZVdyLy9ycDJpRUcr?=
 =?utf-8?B?dzFOaFVBcEIzaVVHVXlwOG1HMUVrY3VQYXBETW1CNmcwclYwektNbE9NSmM0?=
 =?utf-8?B?YlRJOVd5U0ZRcTBPdzdDbjMvL1I0U08xWUMrbXFyS3pENnpPZFRhTkFITjBG?=
 =?utf-8?B?QUNTRGY5Ryt3My9IY0ZIQ3owMklEWk1CR0ZEblZRMnB4dlpUOXZUYi9KRVZY?=
 =?utf-8?B?eENlM1c0VTU1cEp1SFZzeTliRG9JUnRhcDRVaHNaYUtocStGeGlpcW4yUmg5?=
 =?utf-8?B?ZkRacUFEVXB6Ylo1L1J1QkluekU2NTg3dUh2VHJrdzczTnZSR1BCOHVtcys4?=
 =?utf-8?B?U0JQdVpQT0pvZzZ6ZkphWGFXajhIaHhPOWRHa21QZnFrV1A4VDFIUTJMRHBz?=
 =?utf-8?B?emFBV3ZWbERMVVh3WjVEYW9TR2JqeTJZYk1OVmhudHVBWGg0V3FoeXhrWXJG?=
 =?utf-8?B?a0hzZUcwN1Qzc0RGMXZVSHRsaVdUclhLdmFzNEZsT1NrajhEUWJzVENSU0Ja?=
 =?utf-8?B?NGJ1bmR5MGFZQUpsSllzaHc0MXUzelRCd2lSdUNwSWVaWTFIb3hodWczdnV3?=
 =?utf-8?B?MHh6U3l4a3d4MDVYcno4RWN3QTNOQ2lobFNyZXA4WUFjemlsa2NhNWhaRmRW?=
 =?utf-8?B?TUwwZGUvSmhsS3JlaHBtUjVNQnppd3VaNEhEekdObkYxZXgzS1JMR0RSMzYw?=
 =?utf-8?B?NW9FV0pXeFROZDV0TWZ0Yko0UjFxR09ZYVkzWi94blNSd3NPYUZEbnM5Y294?=
 =?utf-8?B?UVZXMFhMT2N5eW9wMXRWLzlCR2VMekUvVU50QlI4UzRHRXhLUUdIQ0NkVWFx?=
 =?utf-8?B?bjcvTFV5Vm5DYXFMOHdsT1dwRnU2Mk1OeW5CZkFaMlZrMGRuY3lHYWQyYWor?=
 =?utf-8?B?VXhZaVEwc3R5MSs0MVkxRW1JTC81RisrWG1pR1BHZENjNXBGQWgxMzExQXBM?=
 =?utf-8?B?djl6MmRLOEsrOFp3TjZNTXg1K3YzQW5Ob2czR1FiQmdOUlVlSktycHUxQ2FU?=
 =?utf-8?B?dUlhN0VVRk8vM3hjYXA4ZWtDN1h6bnRiL0lKbUIwZWJHVkx0dmo0akVzOXpP?=
 =?utf-8?B?aGRQSjQ5cTBxUjVGN3ZMS2cwQnRCR1Q1bWk5SE9qcllwVnRHSTk0R1dPQVVr?=
 =?utf-8?B?Y3MyQ0dBRXY2cS9lcGUvdVE2V1UzWjF1dkRKUndta3BtZWltSDhncjd2cm11?=
 =?utf-8?B?Y2dhTlFNS3hzb1pPdU1rblIxVUVRVm1yQkFZU0xHSFBQNXpmTFJ6YmRLc2Vx?=
 =?utf-8?B?Y01XdUNpSjFIUXJZUnhnOU00c0xHRDBQRDhNaUVSWjBlVHExd0drUXk5dnpH?=
 =?utf-8?B?eDU2RU1mVlcxeUlKUVUyZXEycnNhUHlFVjR3WWpmZWNyUDMxbjNueEc5MWl0?=
 =?utf-8?B?U3Bjekp3UjBLTjdMMHVuUmRRV1I0VFZ5OTh5NzVZWktBNWNpcEJLM2JIc0Mw?=
 =?utf-8?B?ZWNJQUtjVC8yVnQ2QjZjUUQrZzFlTEpsNmp3RlY3QlBOQU1kL2p5Zi9yY1Vm?=
 =?utf-8?B?V09lZllyUTBOSUNFTDRMank2UGJsK0czZzVvY3B1SXM1Y2lYeEF1a2dnMm9J?=
 =?utf-8?B?QkFxYU82blFuN3RtRi9rdExRTUsxQW8xS09JeGZFaGJ1cndQOWlGZy9pQ0ZS?=
 =?utf-8?B?OWsvdStBYzk0NjhwWTh0Y21UaXlZZExJQW9KWDFSaEluUUhoSngyZktyeHV5?=
 =?utf-8?B?SVhZbFFnTVhDWlhsZnBBMk5EbzhTa2VPbVNTdnFYSWdDZnBTbGIwZldITHBi?=
 =?utf-8?B?THF2ZlZNVDlLOEdIeWtad1daci82NGJEQVJ0QlFzT241Ukh6R2E2MzFMb2d2?=
 =?utf-8?B?NXdqcTlvdnNMSkZXVnhHZm1haTU5dDBXVEtKSW9lUEwxZkpZTnJsK253OTV0?=
 =?utf-8?B?OTU5V25XdEZrVC8vWmFlQS9ERFVZTUZqQnUyZUZoTjljcE9DNE9UY09kZDNQ?=
 =?utf-8?B?d0JsUVlDcy9TNStFUGFMbkVwNkRKM2VqS3UxQ2N6VGFKb3Jnc3RUYWQycHJF?=
 =?utf-8?B?K2ZQUDFVenhPVVRkRUpBaXNCSTR3ODk1djMyZVV3L3BrK1VacGY4dnRKTm9F?=
 =?utf-8?B?QnJsN0dqeUpTVFRzdDBGUDJUTVZvajd5eDEwanFRMy9NbHRDdk9BSmI4YXMw?=
 =?utf-8?B?bVBGSzdOSHY0UG5RM0t4VUliaGtna1VNaVRxRnNKM0o5cmtUcEE0MkllSEJi?=
 =?utf-8?Q?cqcbT2AM0454JMtw=3D?=
X-Exchange-RoutingPolicyChecked: udkIxn58NbjliPswatX+xHWIyCZz34DXlDxZShFtLgJgpt3E82T7/lL0I8jHgUGll+XBzv8kqC8wUc3PvV+z8Ki1A2r0TPAkR2zVdRM5ajyAOwsefZfbLs/E3acBvmqBrAy8qQ4TBS2LYBuFprSbpzx8B+hT0aYnzFEnrkFU0RAmLJKvLoYqS988wAsmeaXhSZMEGnLX6t2R1e5TIxoNE5qGcWqBwNaUI0O29+X5l6YBDvV0REv1uhyO9a5W6kljAl6w548yBn2kSqSGIx//4l4hgWEtVGUcaJNnFL9qgW/E0PG38pDbWS6iQqWpPCfLZOPWCJDOVUy0o6/Qh2pTBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b135481e-f90d-40f6-b528-08de8059282d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 17:02:34.9466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnwKOu4OI3xmcgKHylA+uWZ65RB40bthz+/49Im+tETldcInr7LFWZZenhD5KOWYs2J3uQe9mqaKLOWQyPAaOcQ3GLYo0OAdAlPznlPu4Fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
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


On 2/19/2026 1:48 AM, Soham Purkait wrote:
> During GPUTOP engine initialization, the opened card fd is required to
> query engines and obtain configurations for PMU busyness calculation, but
> leaving it open causes the process to appear as a DRM client, which
> conflicts with KMS test requirements. To avoid this, card_fd is closed
> immediately after engine discovery, and engine queries are refactored to
> remove the lib/xe/* dependency in favor of direct ioctl calls, simplifying
> the implementation and reducing igt test library dependencies.
>
> v1:
>   - Initialize pmu_device_obj to null.
> v2:
>   - Remove dependency on lib/xe/* libraries. (Kamil)
> v3:
>   - Refactor ioctl failure check. (Vinay)
>   - Check q.size only once. (Vinay)
>   - Add num_bytes for asprintf return value. (Vinay)
>
> Fixes: c8106465683f ("tools/gputop/xe_gputop: Add gputop support for xe specific devices")
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/gputop.src/xe_gputop.c | 108 ++++++++++++++++++++++++++---------
>   tools/gputop.src/xe_gputop.h |   3 +-
>   2 files changed, 83 insertions(+), 28 deletions(-)
>
> diff --git a/tools/gputop.src/xe_gputop.c b/tools/gputop.src/xe_gputop.c
> index bb2caa6ea..d8892c587 100644
> --- a/tools/gputop.src/xe_gputop.c
> +++ b/tools/gputop.src/xe_gputop.c
> @@ -1,8 +1,10 @@
>   // SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2025 Intel Corporation
> + * Copyright © 2025-2026 Intel Corporation
>    */
>   
> +#include <sys/ioctl.h>
> +
>   #include "xe_gputop.h"
>   
>   #define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
> @@ -92,6 +94,7 @@ void xe_gputop_init(void *ptr, int index,
>   
>   	obj = ((struct xe_gputop *)ptr) + index;
>   	obj->card = card;
> +	obj->pmu_device_obj = NULL;
>   }
>   
>   static int pmu_format_shift(int xe, const char *name)
> @@ -121,20 +124,50 @@ static int engine_cmp(const void *__a, const void *__b)
>   		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
>   }
>   
> +static int engine_query(int fd, struct drm_xe_query_engines **engine_q)
> +{
> +	struct drm_xe_device_query q;
> +	int ret = 0, num_eng;
> +
> +	memset(&q, 0, sizeof(q));
> +	q.query = DRM_XE_DEVICE_QUERY_ENGINES;
> +
> +	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
> +	if (ret != 0 || q.size == 0)
> +		return 0;
> +
> +	num_eng = (int)((q.size - sizeof(struct drm_xe_query_engines)) /
> +			sizeof(struct drm_xe_engine_class_instance));
> +
> +	*engine_q = (struct drm_xe_query_engines *)calloc(1, q.size);
> +	if (!*engine_q)
> +		return -1;
> +
> +	q.data = (uintptr_t)(*engine_q);
> +
> +	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
> +	if (ret != 0) {
> +		free(*engine_q);
> +		return -1;
> +	}
> +
> +	return num_eng;
> +}
> +
>   void *xe_populate_engines(const void *obj, int index)
>   {
>   	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
>   	struct igt_device_card *card = ptr->card;
>   	uint64_t engine_active_config, engine_total_config;
>   	uint64_t engine_class, engine_instance, gt_shift;
> -	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_query_engines *engine_q;
>   	struct xe_pmu_device *engines;
>   	char device[30];
> -	int ret = 0;
> -	int card_fd;
> +	int ret = 0, num_eng;
> +	int card_fd = -1;
>   
>   	if (!card || !strlen(card->card) || !strlen(card->render))
Need to check if card->card is null first before strlen? This is not 
part of this patch, so can fix in a separate patch.
> -		return NULL;
> +		goto err;
>   
>   	if (strlen(card->card)) {
>   		card_fd = igt_open_card(card);
> @@ -142,39 +175,52 @@ void *xe_populate_engines(const void *obj, int index)
>   		card_fd = igt_open_render(card);
>   	} else {
>   		fprintf(stderr, "Failed to detect device!\n");
> -		return NULL;
> +		goto err;
>   	}
> -	xe_device_get(card_fd);
> +
> +	num_eng = engine_query(card_fd, &engine_q);
> +	if (num_eng <= 0) {
> +		fprintf(stderr, "Engine query failed!\n");
> +		goto err;
> +	}
> +
>   	engines = malloc(sizeof(struct xe_pmu_device) +
> -			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +			 num_eng * sizeof(struct xe_engine));
>   	if (!engines)
> -		return NULL;
> +		goto err;
>   
>   	memset(engines, 0, sizeof(struct xe_pmu_device) +

again, can use calloc in place of malloc/memset?

Other than that,

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> -	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	       num_eng * sizeof(struct xe_engine));
>   
>   	engines->num_engines = 0;
>   	gt_shift = pmu_format_shift(card_fd, "gt");
>   	engine_class = pmu_format_shift(card_fd, "engine_class");
>   	engine_instance = pmu_format_shift(card_fd, "engine_instance");
>   	xe_perf_device(card_fd, device, sizeof(device));
> +	close(card_fd);
> +	card_fd = -1;
> +
>   	engines->device = strdup(device);
>   	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
>   	if (ret < 0)
> -		return NULL;
> +		goto err;
>   
>   	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
>   	if (ret < 0)
> -		return NULL;
> +		goto err;
>   
> -	xe_for_each_engine(card_fd, hwe) {
> +	while (engines->num_engines < engine_q->num_engines) {
> +		int num_bytes = 0;
>   		uint64_t  param_config;
>   		struct xe_engine *engine;
> +		struct drm_xe_engine_class_instance hwe;
> +
> +		hwe = engine_q->engines[engines->num_engines].instance;
>   
>   		engine = engine_ptr(engines, engines->num_engines);
> -		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> -			| hwe->engine_instance << engine_instance;
> -		engine->drm_xe_engine = *hwe;
> +		param_config = (uint64_t)hwe.gt_id << gt_shift | hwe.engine_class << engine_class
> +			| hwe.engine_instance << engine_instance;
> +		engine->drm_xe_engine = hwe;
>   		engine->engine_active_ticks.config = engine_active_config | param_config;
>   		engine->engine_total_ticks.config = engine_total_config | param_config;
>   
> @@ -184,12 +230,12 @@ void *xe_populate_engines(const void *obj, int index)
>   			break;
>   		}
>   
> -		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
> -			       hwe->gt_id,
> -			       class_display_name(engine->drm_xe_engine.engine_class),
> -			       engine->drm_xe_engine.engine_instance);
> +		num_bytes = asprintf(&engine->display_name, "GT:%u %s/%u",
> +				     hwe.gt_id,
> +				     class_display_name(engine->drm_xe_engine.engine_class),
> +				     engine->drm_xe_engine.engine_instance);
>   
> -		if (ret <= 0) {
> +		if (num_bytes <= 0) {
>   			ret = errno;
>   			break;
>   		}
> @@ -197,9 +243,11 @@ void *xe_populate_engines(const void *obj, int index)
>   		engines->num_engines++;
>   	}
>   
> -	if (!ret) {
> +	free(engine_q);
> +
> +	if (ret) {
>   		errno = ret;
> -		return NULL;
> +		goto err;
>   	}
>   
>   	qsort(engine_ptr(engines, 0), engines->num_engines,
> @@ -208,6 +256,15 @@ void *xe_populate_engines(const void *obj, int index)
>   	ptr->pmu_device_obj = engines;
>   
>   	return engines;
> +
> +err:
> +	if (card_fd >= 0)
> +		close(card_fd);
> +	if (engines)
> +		free(engines);
> +	if (engine_q)
> +		free(engine_q);
> +	return NULL;
>   }
>   
>   static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> @@ -263,11 +320,11 @@ int xe_pmu_init(const void *obj, int index)
>   		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
>   			       &engines->fd);
>   		if (fd < 0)
> -			return -1;
> +			return fd;
>   		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
>   			       &engines->fd);
>   		if (fd < 0)
> -			return -1;
> +			return fd;
>   	}
>   	return 0;
>   }
> @@ -359,4 +416,3 @@ int xe_print_engines(const void *obj, int index, int lines, int w, int h)
>   
>   	return lines;
>   }
> -
> diff --git a/tools/gputop.src/xe_gputop.h b/tools/gputop.src/xe_gputop.h
> index 1e3856071..dcd82de7d 100644
> --- a/tools/gputop.src/xe_gputop.h
> +++ b/tools/gputop.src/xe_gputop.h
> @@ -7,11 +7,10 @@
>   #define __XE_GPUTOP_H__
>   
>   #include <dirent.h>
> +#include <xe_drm.h>
>   
> -#include "igt_device_scan.h"
>   #include "igt_perf.h"
>   #include "utils.h"
> -#include "xe/xe_query.h"
>   
>   struct xe_pmu_pair {
>   	uint64_t cur;

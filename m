Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F9BE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 15:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F27110E345;
	Wed, 18 Dec 2024 15:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+HffZc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB92010EBE0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734534375; x=1766070375;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1o6uUXrhimgKGSt7UQ7xqko6xGOyHYFnqJw9gHM4JSs=;
 b=J+HffZc1muD7tyXxqCAI9fDzhHXe2GGH9fnZ/b98fA+i1EczdFbZ/U9V
 LTj3z5wh3AZaeOSBPVIZ6vyNI2RIvKiWxwpb90gPDkDE8zEhh2hL92uzC
 hLR4kC3T8bG6HAbPQXW06dNX9vBJLEDQBiywCAxcrjpUduAtHXj0yT2iP
 +ia31PTbSy/UiTwitkdnqXzTA4WrQ/tOXnBWB5NafipVk7r8f8KJwYpMn
 FpWlZMqsvtiAGyLA2NoTm8tSQ7fctAcpO5qNO0yd5BeK+przfg/bnjh2L
 02AsegLTWCF4C82W+0UPZ4UzwbPy5lW2WXN9AC5g8IoXQVBu8UM6Yy7T1 A==;
X-CSE-ConnectionGUID: +MTvTRYtT3aEKJPicHWoLg==
X-CSE-MsgGUID: e+qyDgBcRJqhBUi7VNcXTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34297449"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="34297449"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:06:15 -0800
X-CSE-ConnectionGUID: CfFD3dXbSDSVGdCbhUnJXA==
X-CSE-MsgGUID: nBYJz0A7R+yHAVVH1yJUwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97686495"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 07:06:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 07:06:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 07:06:14 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 07:06:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGxLbnsV5A0U2vsidcMcqefA00K5p3P4tzU5lw6H7NUi+nYGVlbbwJsveClQNgqf9gdO9OhInRSojGzuaM8oFJ3e0Hw1QX6E0tvFd23MA2PLE61PGWxdm265kJuS2jL6+jm0s9oYioSZdNcGGtXl8zpr3xgAt7ImMyUdvqq68yTBh19l6YlTMOfKMFWBucjFZ7VV12uziURGDbMnNghTLeVsZ1uSJ2M62T/gQqWO4XGfFMhbI8yeYSZRsKBzUird3nCtxcbA+0O0LWZ6VtyreWjr/IiVXSHbe9A+lGWe7MDcv07TqrHqLibe1aZsrDDJ8SgZBc4H1pjxzgFHvCvAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQdtqqTYeE6QqTHbjYbPP0Zc6StJ8W0VXCRRhVBGlm8=;
 b=iZo9R54IVe0yyn9uCfoQ7L/3esc86PubYNrOKCWudSLmgq3yoXXEPyzFnG++PpdwSl7S/qlq/cqnC4GXr2c/5qQzTbfmNwUWeCgwbSBSWywW3OiHMUysQvEjBDnqbanp8R39/XzGfulrzX1Rvq75sGW1QFDMvxSOxMh0xq6BNDCLgAewZnMPPyvVZE1HWmfXmqrjq2ejxrTL1dsXb5UaxsfCzXrfhqVA/T3QuhiApAozrDFBpEu2vD0DkIcHTyb2+451IBZUHq/S2C09qrouB4rbj2osvFKaYUt0I+oBUNTObSzdkbPWO9HCKWAX7SO0T7y0rlrdWjlurVTyg6tJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 15:06:10 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 15:06:09 +0000
Message-ID: <a3682280-2093-4b52-961b-555b22230517@intel.com>
Date: Wed, 18 Dec 2024 07:06:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] xe-ci: Disable xe_evict subtests that are expected
 to possibly fail
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20241218124519.4697-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20241218124519.4697-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::8) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|MW4PR11MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 82aae7c8-9b6c-48e2-98e8-08dd1f75812d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkZQWVNtVVZZWE95SjJBcUNXTGZuKzVDRTJOclM0MUh6VVFVVGRGdXllQ0NH?=
 =?utf-8?B?dTZIMUc3L2ltZDZkUllwc0xRMGFKZ1YzY3g3aVZYclVKakdHZVBlaVMwR3lD?=
 =?utf-8?B?akd1SDN4bEFydmxhTnJqMXNZNUNTNFA2WkpHUEJFWTVZOTJRRDZkSGNjR29a?=
 =?utf-8?B?ZFg0L3VPblNmV0F1Zld2Y21kaTlrVU4yNTZITnM0NzJwaDZoMmdZS0xVcHl4?=
 =?utf-8?B?L2RodTUzTnl4aFlPMmhUYmZFc3VDbFFmVWhNNCtGaXJRTytlRFBBejV4UGpU?=
 =?utf-8?B?aVN6MFNBNGN5SGJjQWVhZCtIaXFmWFpUN3g4TzE4RndPYkN4TjVTWHVVY1h0?=
 =?utf-8?B?R1MwWkk4ZVJQelVEUjdCaG9QMmJkWVRqaWNUOStrai84RU9ocDJEazBiYTB6?=
 =?utf-8?B?MjV1YkNBbFpDKzFBY0pPb1l1ZFNBQ0VwbXlvekgva08zQ1I4UDRBd3R2SGY5?=
 =?utf-8?B?Tkt0Y3AzdUwvUkRlWndPa0VvOU95cVlLNjN1WG1HS3NUMUVLTkthR05zcGhD?=
 =?utf-8?B?WkJselNIR0xQTGtjTC9ISU5udUdzUno3MkNOMjBqWFhsWU1lY3hEdXZ1ay9C?=
 =?utf-8?B?UnNCeGt2N24wNWRXREIxd2VhUTZHVFNQemlGTVdhbDJ2THZJM1pGTWFXVEZs?=
 =?utf-8?B?SFJRcjh3WVhRRUsyVGtMODVOU3o0QWdFOHNoYUtCdTdHV0Z5blJ6NDZXalYx?=
 =?utf-8?B?c1RrcHljcmJCMCtXT0l0VGZyYy9zUm9YbFZLUHpVWVlnOXV6L1RQTlZ3Wnpt?=
 =?utf-8?B?c3lCK1BwWHlCTysya0hsR3BCRGgxMzFibkV6Z1RhYWw2c1dNMzJHMDNsd29K?=
 =?utf-8?B?MXRmU1pGSklXR3E0dTBtYVFoN1lEN3pCanNDZlZ2MVlUNmRzZEhmYTVoZU9x?=
 =?utf-8?B?aDkrdnBudWp0Tlpxci8xYWJTTWE2OVVMOWVVcWZEZExzajlERXZKcmNWcWFi?=
 =?utf-8?B?ZWtMZG9MNG1xL1drQUxoUWkvaVFYQkVlYjI3cmdsRkZVUXg3Qk51YzVRbEVT?=
 =?utf-8?B?NWV5TGo2MW94azdKTTVqN0NTRkRuWk9JRkVOeUY4RFBkaldoMDlHWTlKMGdO?=
 =?utf-8?B?Q1hIWGlmRWhxbkw3TVVZL1BGY0kvNjh6ZC9SMGt2c1M3NVVNdGVmZklWN2p3?=
 =?utf-8?B?bHFyK0pWd3hhd2tJWXhwWU5nVWVPUVJJamRYZzhSdFNhZjVCMzdnUmpiRXhU?=
 =?utf-8?B?OXpLV1pxRlY2UTUrclhESCtOcWwvY2I1YncwSWlZRmZLS282dzJrU1IyMlRS?=
 =?utf-8?B?V1BaclhST1FQN0V5WGV1RGxMNHRjUzBFanQvYW1SclVxUjladUVBUUFEZFdD?=
 =?utf-8?B?WURjdXFoUGNjSjREQmZKYUNxYnpUWGtpN2Q5SlIvd1UyekVmWXAyRDdvdGpt?=
 =?utf-8?B?QUgzUTNLL0tLbittOXRIYXVKWGZzbmlWRHdldTJIOGhqM3E1TGlOSVNJY2dr?=
 =?utf-8?B?UVRMSnBRUU1vN1REOS85aXJtS1dPRC9Zb2xNSkpqK3JocjQ2aktyajdTQk43?=
 =?utf-8?B?OUhoZTZrQW9IdUdwZ2Fzb3NTZzZ3d05wNFVpMTQ5RGdRd3ZGUDFkd3NmODNC?=
 =?utf-8?B?bFB4eXQ2WkF3aS9qTWhDbW9SYWhGUzU2V2Y1TnMxcWRWYmlYendCNy9hWVZ4?=
 =?utf-8?B?VWJ1am9CZHh1dlFuNnJpbURVTUhrMlpDcE1XOENmK0tEa3MwWU42eWdDZzJo?=
 =?utf-8?B?S2p4SkxXVEpNYWQ0UVJZSEsyZ0dFYllVVVN6cmdwelZ4eEJlY2dLYzcrRnBt?=
 =?utf-8?B?TE9hTGxMbFd6RGwzdkNnUmZmL0F1UnB3cG03YU5ZbUx6Qzk4NkZLOFdQb0RZ?=
 =?utf-8?B?S1RSc3pLNElaQ3lLbmtTekM5S1RhdWFvMHpFdVJTUVZSKzVWVzNMb2Y0Z3d2?=
 =?utf-8?Q?ZwnYgVqgL0UzD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkR3NlU1cnE5MkxZQStmbHhnS1Y3N3RTeTIzUkZjV1pBZmVxZ1NtRzBiS2Ry?=
 =?utf-8?B?bWMvcjRPU0VBMnA5VUJnNHcvekZaanlIVHZiQUdIV09YMGhhZG9Tc01yRzB5?=
 =?utf-8?B?eSt1WC9rMWYxNDIrcHpSQ2EzU2JLZGFSNnhKamZFWWw4czJ6RE1Ca0hubFVX?=
 =?utf-8?B?ekJja09jcUZrNUNVdVJtc0FaNE5ja28vRjFKemxZZnRHUGxqaVNZUkxad01z?=
 =?utf-8?B?Y2dzbkE0ZVZYY0FmaTdIazlQZUlIeDlmSnl3UTRsMnd6YVpEclBMMTFMa0Jr?=
 =?utf-8?B?Q3gxeDlkM1RDREd3RC80UFBxU2hNcnJYdE9FLzV4ZjZyWWlNS2JBTk80cGxx?=
 =?utf-8?B?WURIeU4yRjdDRkdSTlROa1BITE4xSE0vM1NkLzhVSnVXL1ZQV2tmT29VcG1v?=
 =?utf-8?B?dG9yUVJ1MDA4c0FnTk16UEFsK1ZtYmlkTVQ2WmtLVHdSSEFWOC96bDEvMTdL?=
 =?utf-8?B?Lys4eDhoZkFObGQyT3dEdlgxV1BqcThDbkNMSlNOcE4yclFERThtK1k5TG5M?=
 =?utf-8?B?c0x6RmxoeGJNS0RFUjk2a2hWRXEzM1RFend4NFVqSFFjalFhQ01MMkVWWUd5?=
 =?utf-8?B?bkZuWStERE9tMkhHMDNXMVRIZThDQWttS0wrVFZNU0xlWEpCTzN0YkdKckZz?=
 =?utf-8?B?bG5DUG9aN29Yd3R4bno2cnhxZGZyWUhOQXRXeGJwWHNCOG1jcFg2TmJkMmlU?=
 =?utf-8?B?Zmc1K1ZCYTZERUJjYXJsWHhZMGwrM1MySGpTQ1M3ZXdEejVyRUtVMnhHNVVx?=
 =?utf-8?B?Q051NHhEWmR6UGJHR1dyVWNZT0Uydk9yQVJoNGdTVjhDL29ERjhKdUlrY1NB?=
 =?utf-8?B?VlBQTzM2Mk9HZkJiZnBmNGtNVnZuRk9aWXRmZ1h3bTNjSUhjUzVuYUhZeWt0?=
 =?utf-8?B?YmpiR0RVWXorUWVCZUdYYTh4Q2d0VURlRDlyYzhqbmhKTFE2MjVnNnlmS0dz?=
 =?utf-8?B?T3lEcklaWHpKMERvRTF3SVB5QVRyY2ZBRXpkOHVCYTB6N0U1RXB4Wk4rd0Ru?=
 =?utf-8?B?N29CYXA2MVBTWlZJbTh0TVJXRnd4ZFpKNDZQeEV4UTlQQUtYb2xNc04xeFdQ?=
 =?utf-8?B?WHMvYXJ1dmIwYXZINXRheTl2UnBwOUo2ZCs0Rk15akdzZEpldk41dnZrM1lV?=
 =?utf-8?B?eWRPekY4NWh2Znl0NXY1UGFFYysySnJqdFBnZ1NUNGFnTXFwTDh3MnVDQ3Mx?=
 =?utf-8?B?U042WEtCNUFibm00MUhId091MjB4bEFRa1lDZ1ZjbHU0Y2REZDBGbXhHT0lk?=
 =?utf-8?B?UE5IRURjbGUzbm5HUDdoL2JVMjEvaG5yOEpna3ZkRHVKOUhWTW5PM0tGWitH?=
 =?utf-8?B?N1MyNkF2aTFpcllUTzU4NjYyejQrdkFqTnlDU3E1ZUlSb1N3MGp0QnhTVmM4?=
 =?utf-8?B?bW9mMnI1L21hOFI2YVlZZE9kWWxCNUFqQzhIM21Bc3B5VkQyOWlWYk43TXUx?=
 =?utf-8?B?VEZxZjBrVjFBSzY2ZWZQdWVIZTFHdk51b2liNndidWpsNTdhUGNUL2hvRytH?=
 =?utf-8?B?cERSRTRkTFVJeGFvSGRDdnN2UHdFcDJUWlo4TzdUM2tsbTBUUkt4bm5USzc2?=
 =?utf-8?B?MGNhNVZscW0rNXp2WlRiRGt6SWpHK084TVJRRlVOdGE2UEd6MCtRc0NDV2pw?=
 =?utf-8?B?MDYzSUhTQUR6SDNHa25VK2VKenBFTFNoNjFKRFdxK283NUMwV2FyQ3BRdGZi?=
 =?utf-8?B?TnR1UWtieU44QTl3aW1KSXJVWjRGam9wcVVMR3k0ZTNnZkt5U0luUzd5SFg5?=
 =?utf-8?B?Tjd2UjhCZjVhR09FSnRIUlM5Z2xrZ2F4dFdsS2thVWRva2lHcGJyY2dpS09k?=
 =?utf-8?B?eGVYeERieEppckEzNW1tTmFrSittd1hkK0UvSXR3L0dzYzd2N2QzdWY4SHM5?=
 =?utf-8?B?TG0vMXpJODcwMEE4RDFqMUJzMUFWL0xqdU9KUzJnUjdtMzBLT0JxYng5YkNZ?=
 =?utf-8?B?b3BCY2pWblh0TmRNSWFFd1JrZW9TSFFOdFJtMmRUN041c3dXaHRuZmV1WGlB?=
 =?utf-8?B?QXZ2aVNZVDBsazZMWjZWdXlBazdSdlZkMHpwT1BPZXd2cm5QUElmZzFpVmRy?=
 =?utf-8?B?c21mT1FqMTgwOFZhekRWR0YveGl2Z2c3anY3Rkw2aFlsS2JESDhyNUdJaFg2?=
 =?utf-8?B?bTJqcEhUL1ZFWWJyWmJsdHRyWFdRYmxyYitnOFNWOHVkSHRueEVGVS9tTGJK?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82aae7c8-9b6c-48e2-98e8-08dd1f75812d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 15:06:09.8975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+4BxfeSxII+DclqWwzCo7i+8q5Lca6uSN776u+sRN3KPcYP9ryPjH5rdlKAHwGnrmraKjGAoKCDyUUijelbUdp+kUbhQgkRUof276fcjVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
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


On 12/18/2024 4:45 AM, Thomas Hellström wrote:
> Threads may compete over VRAM resources, and since there is no
> serialization in TTM, threaded evict tests may have a high
> possibility of failing.
>
> Disable such tests until we have a working exhaustive eviction
> implementation in place.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <akshata.jahagirdar@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 5 -----
>   tests/intel-ci/xe.blocklist.txt          | 7 +++++++
>   2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 727be9230..f16ca9188 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -263,19 +263,14 @@ igt@xe_exec_threads@threads-mixed-shared-vm-basic
>   igt@xe_exec_threads@threads-mixed-fd-basic
>   igt@xe_exec_threads@threads-mixed-userptr-invalidate
>   igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
> -igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
>   igt@xe_evict@evict-beng-small
>   igt@xe_evict@evict-beng-small-cm
>   igt@xe_evict@evict-beng-small-external
>   igt@xe_evict@evict-beng-small-external-cm
>   igt@xe_evict@evict-beng-small-multi-vm
>   igt@xe_evict@evict-cm-threads-small
> -igt@xe_evict@evict-mixed-threads-small
> -igt@xe_evict@evict-mixed-threads-small-multi-vm
>   igt@xe_evict@evict-small
>   igt@xe_evict@evict-small-cm
>   igt@xe_evict@evict-small-external
>   igt@xe_evict@evict-small-external-cm
>   igt@xe_evict@evict-small-multi-vm
> -igt@xe_evict@evict-small-multi-vm-cm
> -igt@xe_evict@evict-threads-small
There seem to be multiple issues pertaining to these tests.
Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index e29e745a0..ed9e572a5 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -90,3 +90,10 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
>   igt@sriov_basic@enable-vfs-bind-unbind-each$
>   igt@sriov_basic@bind-unbind-vf$
>   ##################################################################
> +# Exclude xe_evict tests that are not expected to succeed
> +# due to missing TTM exhaustive eviction
> +##################################################################
> +igt@xe_evict@*-multi-vm-cm*
> +igt@xe_evict@*-threads-*
> +# igt@xe_evict@*-cm* # Rebind and VM_BIND may race.
> +##################################################################

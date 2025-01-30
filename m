Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4A2C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 15:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4C610E35B;
	Thu, 30 Jan 2025 15:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goHQDM1h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F1E10E35B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738251633; x=1769787633;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T/anxLoFanBi0p1kYUlKvAy5PDcUTlE9MiY3uFHY3R4=;
 b=goHQDM1hgYL5MCSo5AeWG6J6iKxcNp76eJJIXxjMam7+pF7bodATdAW4
 7pbYbpR9Gyv7i/60FIf9peuC6ko+d9JMQaxYV9//MTJByOwMGxfjQ6X5U
 jIMS36LEWtJqU5yVtnH8jlAPPgW2OueqOtU8sKo1V6FBmGLaDC8Ar2LJr
 Trja3zBMC/LKhVw5Flt9CHL0aGQZanMGLIGGgvo2z22ydj+nIzK1/AbZA
 ME3cpIDHnfGTTI5XGNwwfBQpfqpJhJrWFohmejGOuCrqiNcFNt3zZ1ZPo
 ECR+a38Hdi2cjXSkS81ZNZZ3AbBYVDo5tjsaCYb4V8dShjaisKCUVKO/R g==;
X-CSE-ConnectionGUID: f2L2qFA8QpS9YjxsDKqFvw==
X-CSE-MsgGUID: 3adBUCFJQ5Geop2U6N5nOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38041014"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38041014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 07:40:33 -0800
X-CSE-ConnectionGUID: bWvbUg6pR1+zq1Uz1KgU7Q==
X-CSE-MsgGUID: 9mv2fMtARw6SiM6WTKK4xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="140254709"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 07:40:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 07:40:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 07:40:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 07:40:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVacO+sbjXtE3R4cteHS0XjDV/uphTEmeS1/trPQYUgs7IBtFjMdLElk8m0+1q/9FPBQSJYfmnAYN8O/0knY8WWCRhHFJFdB/7khLJsd1iXYUdCPPX/7ZF6mFMyqo5OWtLTW21yKeitBbiHjQcqpo969jlX3Ab12QFCVnaqTNSlG9DYd+FILnRxBWGeUzNbDG9rYi3UEOapFlrOlnhCnVE0fzPupziaxmEvya0vqDoVdiT+37mathgiEahD4maa6HH+97VtZfTwNlSfPpTUTu0tSq7FZdTv8iN6RTqi/CJ+GTT1digi21zbzi7LCNfPYyKs8fzP3fHd5hPII17vH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfWwwzcx2x+sKL+0ZZPEMIkqixzHyO90DhjAjUrTRfM=;
 b=KvSJZD5jH7RqrpNmTb+6yFIJG+40cF8G3WmHaMCw+Vlz6FMQdFmM8V36ZczjfuHt3hf1avf2k19SKQ+YMHLTasBVkYC6HTkYoD5TqQqTSkM53Vs+dfc8wsUyOcqo9b6rrRnP/uz+GDOSH9p/RyHyVHCJ7DOuErxahxJ4R1UE9/OuEb+vFcpAgw6zwaUMhbiYPgr1i1AEfhsS7nLBmozcrFfzMt+hCsM0FknXeY9pLOE+HvTmJ5yUVcnOEKcX13ZmY7a4GIBkou5oxsmiivUia8cQLfGB/sdtt74d9q7r5jjgIUWinzFJYcbelwXwaydertUhGTFY9oyTnxoh8c9cAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 30 Jan
 2025 15:40:29 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 15:40:29 +0000
Message-ID: <22cdf2a4-2b5d-4b9f-80f9-29223cdf1353@intel.com>
Date: Thu, 30 Jan 2025 16:40:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/xe_sriov_scheduling: VF equal-throughput
 validation
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250120203445.16285-1-marcin.bernatowicz@linux.intel.com>
 <20250120203445.16285-4-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250120203445.16285-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::18) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1b7efc-4bb1-4dab-0dd4-08dd41446c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDNBbmhOTGU0SnZudm14NTBxUjFVNSttNkQ3QzFtNlhsQkg0QmJFd0tDamla?=
 =?utf-8?B?L3ZoUW5nOFRQaUM5R0FMTlZxbG1NRDZIUEFqUmlyMnRsdXlKaVl0OGRIWXc3?=
 =?utf-8?B?bnJBc0VkanowbmNzYTVBeDdjRSs0aVphamlCdmtvYmVjeDN3Tm9tcUdXR1BY?=
 =?utf-8?B?NlBKVHJMWGlzL2w3TDRra2k0Q2JUdG1NckVDeEdsYjJLaE5rR202UnNFYnJL?=
 =?utf-8?B?WU4wSEpQN3pYTGxQNzF0NjVCeTdxSGtQZU0vRGhnWVhsWi9ZWUJabFV1d1No?=
 =?utf-8?B?NkQ2R2U0SE95Q3A3d1hhOVB0Mi9TSGpqMzdoSkRsWVNHUDJjWkJHWGIzbk1x?=
 =?utf-8?B?N2E4S1RIV1hEWnBGNkpQWHhXbzFQemZ6QVg0VFVlbngrSFBROFVnaXRJNEhJ?=
 =?utf-8?B?OE9aYXpZbVRJMEtuRExnTlJqYzNLYS9xaUZPdWt6Mkc5MWh5Q3VpVGhXMkRi?=
 =?utf-8?B?eGRhZUhPMWt5Rnl1TzMrQ29ZbjRCZS95KytDMWxvQ0drYkpkb0xLZ1U3SGxy?=
 =?utf-8?B?QUpZUTMzWHMxTE5WblRHMGZLblJJZXQ0TC9CWjB6UEwyVno4Z1VCc1IyVmJz?=
 =?utf-8?B?VkxTSklZUmU0MnpGcFJwVTUzS0NCeVNsZks3ejRYVlRhb3ZmemJlcmtIa09K?=
 =?utf-8?B?eXhmRTJMOC9FTnFBRTRHMWUyYkpqMjhwc3RvMHR5Nmw0eHU3bHZwSjdDQVha?=
 =?utf-8?B?TkVYdkYycENUb1dROHRtcFdnY1RacC9kaWYrSW9YcjRvTmNIYnJMN1R1cXFF?=
 =?utf-8?B?Q1FCdEQwd010dGZ5ZzBDQ25HYzFaVkYweThPZEFCQ2xDU2xIRGhHS1BUdnRt?=
 =?utf-8?B?VWJSREErSHhtUUM4QStPY3JJaUtyZStod1p3dThXUzJSNU1TdTY2UGpvR3Zv?=
 =?utf-8?B?V09NL1JVdmRKcTFrNCswS0w5YndCTWxobzJCSE9LQ2hUbGJKQ0dnTGR1Y240?=
 =?utf-8?B?bkZtczk3dXV2amx3Z2lmS0tyVHlzdVkxTFdWenNiUGtaMDhQVEtQdE8vdFp3?=
 =?utf-8?B?WktQQTBaMXV4L3UwWVdOUER6cHZOSncySi9TTWZmelZSVlRwSnlEeTlMTHRs?=
 =?utf-8?B?T0c2RS95V2tqajAxZ2JncDRSZE9acElITGVUbEJWNDEvdFF1OEN3WkV0REtW?=
 =?utf-8?B?a0hrZk82S2EzcmxTSTlheGNqMml6Y0s0MnFCSW1GOUVpZEZTeFpicnFQYzlB?=
 =?utf-8?B?dTVCYU9kYlF6TTd1eVlUUmNQNDRWVTR5KzMwV1NvSWh4TFYweDJGdGNTSHQy?=
 =?utf-8?B?T2RLclR5L0lkekJwSEtGaHZlZmU4UDRTRU5FNHl0TmRqdFZZcDlib3NoNlBr?=
 =?utf-8?B?OFZlcXBybjg3bldKUCtaQ0x5UFRIaExob2JjRzZlcVd4YzhLenZzNE9KdnhU?=
 =?utf-8?B?MXRISUI0eUoxTzUxWGtpTFVPWGpSdDdLQzVvbmgwTjdUcUZDK1pGVlRSTVNR?=
 =?utf-8?B?VEZVQnFzNDFJRGxQM1J0aVNFWkt2dFp4RjBESlRpcGxIMVJLZkRDa3ZsOVNT?=
 =?utf-8?B?U21sS1p5bnRaY0VPeG5RTVBncDVkdnd5WkVHeXc0OG1ZT0pHUzBKYWNYbFRW?=
 =?utf-8?B?dExVQVo5dEhnWitjM25jS3dVQmRvdVBRK3NvRkZLRUQ5dVd0MnJ2dEFab0FW?=
 =?utf-8?B?MXpGZjI2SFFBR2hKNnpqVzBuQWtXWlZ4ZWlpTG8xN2E0OGxFQi9Lb2JiNm9Y?=
 =?utf-8?B?UDNHLzNzQ0RINjBKaHlGaGJtTmpaa0RaRGsxSEZpT05wTGovV01nTERMVDhp?=
 =?utf-8?B?OE43U1dVTGZtUEFLRk42NTZkN1VHeFdMMG9yOEdMRTNIaHVuRGJVdzZNWkd3?=
 =?utf-8?B?MGhCWlNTeUFSVkJtZmVDWTR6bnUzZWlNUlRVNVZjSmZTREdPZFFCMCtzbXRB?=
 =?utf-8?Q?bOd9p9+b1iGli?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVhwUFp3Ukl1YldXMTA4dnU4MXNKM1QvOFVkTGR1RlVYMjVpWW5HS0hBb1Bz?=
 =?utf-8?B?d2lJMGtLeHk3aGpGak9xYUs0QUlBQk1qeTM2VjcwWDVucEhXYzBmR3JCdDNl?=
 =?utf-8?B?M3k3TkFFNWhsY25tSGpRSk5QTUczeFJaeG80d3ZKWDJrTG9YUnRLTHJvWXJi?=
 =?utf-8?B?SkttdGNxdFBDaWVXdEkyeXQ2ZnNKUTFUWkdVSkxEWHZ0b0ZPSTlCZThjY2cz?=
 =?utf-8?B?aGE0RTB4eVVrSThhZ2tacTJEaitzZ1NLZHd0OFhkL1loYm05a3krakVTa2VY?=
 =?utf-8?B?bUhRL2JEN3R0dnpROHU0bGdNbElXVDhNTUo0akRFUWp2OGlUYUdpSFVQSFJX?=
 =?utf-8?B?SThwU3Zqa3hraDRrVElRRjRaaWppTjlpR1BGVyttT0xBRytZSnpkSm90NFVB?=
 =?utf-8?B?K3hqWHVEaHZSM29UT3dBTy9qUkNHV21wWjJ1dDl6Z1BWbm5xaHlvdFRja2ta?=
 =?utf-8?B?THZia0phZW5NdFRBWXduV3o3c01FS09NZmU1RUhqUm1uOHNPbnpVSnkwUnE5?=
 =?utf-8?B?SUVDSDBQVlpTMWFLK0hSci9UL1hHYi9LQnM5ZWxlY1NQNUdnUTR6ZUw4Z3VK?=
 =?utf-8?B?QWlzSE1UTDhpWkhBdFRacmwwVzNlZW9OZUlyTksyaVdQdHp4WlhnalJBWVZw?=
 =?utf-8?B?ZFZtU3pNcURvRVBXbmxhY3c0aVh1UW5qZ2pJeS8rcGMrNVpuWjBSb2ZQamx5?=
 =?utf-8?B?Q0pqTTBpTlRCS0NtdlY4dlMrNkdmM0tYUWw0WE9tZG54OU9XNHQxcldVZHhE?=
 =?utf-8?B?bkd3N1lIckl0bGFYYTF2RkdjYW9pZHBoMEh5UnFzNXZJQWFmM1B0QWtWaDRQ?=
 =?utf-8?B?Unp2SUUrNEhIVWhabzFEYm5OT3laOGRHUU9ZekxaVmEyZ0FkZXNFdkY4OHZY?=
 =?utf-8?B?TjJQblczbnZiZU1LOUpHdHNtRVdia2dEVnAvZHR2Zll5Vk9wK2dIcWNhZXNJ?=
 =?utf-8?B?ZkZWZ3FVaURxMmhBNVJFcjJTMlZ4eDJTR2xjQkVsUGFrT2daWkdmY25Vd0FY?=
 =?utf-8?B?TEJuZXdtQTl0SklVWTRmLzRoVFJOK1puMy9LWCsrQW1Bd2NPbldqbUtMRk1Y?=
 =?utf-8?B?YjBVdFZJYkZxOVhmaXVQbkh4Vk5MSmlTVDhSeXhBekZia05iUk9ZakZIQ01i?=
 =?utf-8?B?d2NQWXFCVjJTaE43QUdOdk5aL2J5NG5ibC8rSURKNU9rVEVUbERqS2pYSm01?=
 =?utf-8?B?Wk1XQVJxYWFFQ21YZDhFa3JSZENtcEswbVFkVjdYdkxPTFMvUys0eGpVa09u?=
 =?utf-8?B?Wk5aNFJTd0crK0Zwc2gxYWdab0VDYTlVazhSUnhGWjJESCs5dlJjUi9adkJX?=
 =?utf-8?B?OVlXdFJvdmt4YXFBOG5XbFdXcjk0aHJtaHA0ZzNTUjJTdDBWN0ZibXFVVjd5?=
 =?utf-8?B?WjI4V2YwN0tuMWdWS2RXUkNMbTVrQjlrQ3ZVc21HZzk1M3hqNTJhU1dyTzg1?=
 =?utf-8?B?K0paZWxsUk5sN2d2N3VrTGNOY1FWOE02V3JiRWRLVXU5VWkrYkY2TWpmaXM3?=
 =?utf-8?B?d0VOaDR0dnBkL3hMdk5YOEhDOGJ5bUJsUkFNK0NUSFo2NDZsN2gycVZWdVo2?=
 =?utf-8?B?dkgzZXpkTzRQVlpIVWpCREJDWGUvRFJoOS9OTS9xQW9iSk9IcUFDajlzSXhU?=
 =?utf-8?B?NmFDdVJpem4xZEhoZFh6dHNQOWU4bjNQWjgxbnZGeDk3cFYrWHI3WnVEMzlX?=
 =?utf-8?B?K3l2dGl3RTRMbnlSTUp5djNpdlczNVoyVHRzdlpZenViV0pPREN3bkNma3hD?=
 =?utf-8?B?dm9uUlRuVFFyOThiWWg0ejMrRjNCcEdETVBQdmFUK0dHOFdpeW1RNy9kSmdk?=
 =?utf-8?B?amgzaDBneExNWjkxQ3pEekQzVUpQcFlMS1ltK3dYQUlMTUlhLzllWndyc3pU?=
 =?utf-8?B?U0xFR3VjTTVESFBTMVJzd2VhOFBwekdwc0E4Zlc5K1RtQUhlekNPaUQzZ1Bo?=
 =?utf-8?B?b1kwV0RJZzQwYlRvQkxpS09RU0o2aWJLUzVXbDdkYUp0L3hSL2Q5eSt5RG9W?=
 =?utf-8?B?UlFjb2FaODBnVWJnUGp1cFErQmdiRGNhQjFxdDNEUDlSb0tLdGlHeWxReVJX?=
 =?utf-8?B?WS96czVPc1V3aXRBbVhqbGtNUHNTVFNRSzlnSDJrc09rREY5SHVjTjVZeWlx?=
 =?utf-8?B?Q3JvbitLODJhcE4zbHRJcmhiNHlCQll6dXpOdW13N2JBMHBldkpJVit0Y1Zt?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1b7efc-4bb1-4dab-0dd4-08dd41446c65
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 15:40:29.1468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBx8UjqNFqvf0GwcvYhBHOEgeAadrB5RHeiBISewTgkTwg1JhwcH0yu08oBSXISuAQwPcK1HhjEgvUMYM3wwWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
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


On 1/20/2025 21:34, Marcin Bernatowicz wrote:
> Implement equal-throughput validation for VFs (PF is treated as VF0)
> with identical workloads and scheduling settings.
> Scheduling settings are adjusted to consider execution quantum, job
> duration, and the number of VFs, while adhering to timeout constraints
> and aiming for a sufficient number of job repeats. This approach
> balances overall test duration with accuracy.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 698 ++++++++++++++++++++++++++++++
>   tests/meson.build                 |   1 +
>   2 files changed, 699 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_scheduling.c
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> new file mode 100644
> index 000000000..20ec15b22
> --- /dev/null
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -0,0 +1,698 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation


2025


> + */
> +#include "igt.h"
> +#include "igt_sriov_device.h"
> +#include "igt_syncobj.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_spin.h"
> +#include "xe/xe_sriov_provisioning.h"
> +
> +/**
> + * TEST: Tests for SR-IOV scheduling parameters.
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: scheduling
> + * Functionality: vGPU profiles scheduling parameters
> + * Run type: FULL
> + * Description: Verify the occurrence of engine resets
> + *   when non-preemptible workloads surpass the combined
> + *   duration of execution quantum and preemption timeout.
> + */


Description doesn't seem to be accurate.


> +
> +enum subm_sync_method { SYNC_NONE, SYNC_BARRIER };
> +
> +struct subm_opts {
> +	enum subm_sync_method sync_method;
> +	uint32_t exec_quantum_ms;
> +	uint32_t preempt_timeout_us;
> +	double outlier_treshold;
> +};
> +
> +struct subm_work_desc {
> +	uint64_t duration_ms;
> +	bool preempt;
> +	unsigned int repeats;
> +};
> +
> +struct subm_stats {
> +	igt_stats_t samples;
> +	uint64_t start_timestamp;
> +	uint64_t end_timestamp;
> +	unsigned int num_early_finish;
> +	unsigned int concurrent_execs;
> +	double concurrent_rate;
> +	double concurrent_mean;
> +};
> +
> +struct subm {
> +	char id[32];
> +	int fd;
> +	int vf_num;
> +	struct subm_work_desc work;
> +	uint32_t expected_ticks;
> +	uint64_t addr;
> +	uint32_t vm;
> +	struct drm_xe_engine_class_instance hwe;
> +	uint32_t exec_queue_id;
> +	uint32_t bo;
> +	size_t bo_size;
> +	struct xe_spin *spin;
> +	struct drm_xe_sync sync[1];
> +	struct drm_xe_exec exec;
> +};
> +
> +struct subm_thread_data {
> +	struct subm subm;
> +	struct subm_stats stats;
> +	const struct subm_opts *opts;
> +	pthread_t thread;
> +	pthread_barrier_t *barrier;
> +};
> +
> +struct subm_set {
> +	struct subm_thread_data *data;
> +	int ndata;
> +	enum subm_sync_method sync_method;
> +	pthread_barrier_t barrier;
> +};
> +
> +static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
> +		      struct drm_xe_engine_class_instance hwe)
> +{
> +	memset(s, 0, sizeof(*s));
> +	s->fd = fd;
> +	s->vf_num = vf_num;
> +	s->hwe = hwe;
> +	snprintf(s->id, sizeof(s->id), "VF%d %d:%d:%d", vf_num,
> +		 hwe.engine_class, hwe.engine_instance, hwe.gt_id);
> +	s->addr = addr ? addr : 0x1a0000;
> +	s->vm = xe_vm_create(s->fd, 0, 0);
> +	s->exec_queue_id = xe_exec_queue_create(s->fd, s->vm, &s->hwe, 0);
> +	s->bo_size = ALIGN(sizeof(struct xe_spin) + xe_cs_prefetch_size(s->fd),
> +			   xe_get_default_alignment(s->fd));
> +	s->bo = xe_bo_create(s->fd, s->vm, s->bo_size,
> +			     vram_if_possible(fd, s->hwe.gt_id),
> +			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	s->spin = xe_bo_map(s->fd, s->bo, s->bo_size);
> +	xe_vm_bind_sync(s->fd, s->vm, s->bo, 0, s->addr, s->bo_size);
> +	/* out fence */
> +	s->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	s->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +	s->sync[0].handle = syncobj_create(s->fd, 0);
> +	s->exec.num_syncs = 1;
> +	s->exec.syncs = to_user_pointer(&s->sync[0]);
> +	s->exec.num_batch_buffer = 1;
> +	s->exec.exec_queue_id = s->exec_queue_id;
> +	s->exec.address = s->addr;
> +}
> +
> +static void subm_fini(struct subm *s)
> +{
> +	xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr, s->bo_size);
> +	gem_munmap(s->spin, s->bo_size);
> +	gem_close(s->fd, s->bo);
> +	xe_exec_queue_destroy(s->fd, s->exec_queue_id);
> +	xe_vm_destroy(s->fd, s->vm);
> +	syncobj_destroy(s->fd, s->sync[0].handle);
> +}
> +
> +static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
> +{
> +	s->work = *work;
> +	s->expected_ticks = xe_spin_nsec_to_ticks(s->fd, s->hwe.gt_id,
> +						  s->work.duration_ms * 1000000);
> +	xe_spin_init_opts(s->spin, .addr = s->addr, .preempt = s->work.preempt,
> +			  .ctx_ticks = s->expected_ticks);
> +}
> +
> +static void subm_wait(struct subm *s, uint64_t abs_timeout_nsec)
> +{
> +	igt_assert(syncobj_wait(s->fd, &s->sync[0].handle, 1, abs_timeout_nsec,
> +				0, NULL));
> +}
> +
> +static void subm_exec(struct subm *s)
> +{
> +	syncobj_reset(s->fd, &s->sync[0].handle, 1);
> +	xe_exec(s->fd, &s->exec);
> +}
> +
> +static bool subm_is_work_complete(struct subm *s)
> +{
> +	return s->expected_ticks <= ~s->spin->ticks_delta;
> +}
> +
> +static bool subm_is_exec_queue_banned(struct subm *s)
> +{
> +	struct drm_xe_exec_queue_get_property args = {
> +		.exec_queue_id = s->exec_queue_id,
> +		.property = DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +	int ret = igt_ioctl(s->fd, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args);
> +
> +	return ret || args.value;
> +}
> +
> +static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
> +			   const struct subm_opts *opts)
> +{
> +	struct timespec tv;
> +	unsigned int i;
> +
> +	igt_gettime(&tv);
> +	stats->start_timestamp =
> +		tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
> +	igt_debug("[%s] start_timestamp: %f\n", s->id, stats->start_timestamp * 1e-9);
> +
> +	for (i = 0; i < s->work.repeats; ++i) {
> +		igt_gettime(&tv);
> +
> +		subm_exec(s);
> +
> +		subm_wait(s, INT64_MAX);
> +
> +		igt_stats_push(&stats->samples, igt_nsec_elapsed(&tv));
> +
> +		if (!subm_is_work_complete(s)) {
> +			stats->num_early_finish++;
> +
> +			igt_debug("[%s] subm #%d early_finish=%u\n",
> +				  s->id, i, stats->num_early_finish);
> +
> +			if (subm_is_exec_queue_banned(s))
> +				break;
> +		}
> +	}
> +
> +	igt_gettime(&tv);
> +	stats->end_timestamp = tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
> +	igt_debug("[%s] end_timestamp: %f\n", s->id, stats->end_timestamp * 1e-9);
> +}
> +
> +static void *subm_thread(void *thread_data)
> +{
> +	struct subm_thread_data *td = thread_data;
> +	struct timespec tv;
> +
> +	igt_gettime(&tv);
> +	igt_debug("[%s] thread started %ld.%ld\n", td->subm.id, tv.tv_sec,
> +		  tv.tv_nsec);
> +
> +	if (td->barrier)
> +		pthread_barrier_wait(td->barrier);
> +
> +	subm_exec_loop(&td->subm, &td->stats, td->opts);
> +
> +	return NULL;
> +}
> +
> +static void subm_set_dispatch_and_wait_threads(struct subm_set *set)
> +{
> +	int i;
> +
> +	for (i = 0; i < set->ndata; ++i)
> +		igt_assert_eq(0, pthread_create(&set->data[i].thread, NULL,
> +						subm_thread, &set->data[i]));
> +
> +	for (i = 0; i < set->ndata; ++i)
> +		pthread_join(set->data[i].thread, NULL);
> +}
> +
> +static void subm_set_alloc_data(struct subm_set *set, unsigned int ndata)
> +{
> +	igt_assert(!set->data);
> +	set->ndata = ndata;
> +	set->data = calloc(set->ndata, sizeof(struct subm_thread_data));
> +	igt_assert(set->data);
> +}
> +
> +static void subm_set_free_data(struct subm_set *set)
> +{
> +	free(set->data);
> +	set->data = NULL;
> +	set->ndata = 0;
> +}
> +
> +static void subm_set_init_sync_method(struct subm_set *set, enum subm_sync_method sm)
> +{
> +	set->sync_method = sm;
> +	if (set->sync_method == SYNC_BARRIER)
> +		pthread_barrier_init(&set->barrier, NULL, set->ndata);
> +}
> +
> +static void subm_set_fini(struct subm_set *set)
> +{
> +	int i;
> +
> +	if (!set->ndata)
> +		return;
> +
> +	for (i = 0; i < set->ndata; ++i) {
> +		igt_stats_fini(&set->data[i].stats.samples);
> +		subm_fini(&set->data[i].subm);
> +		drm_close_driver(set->data[i].subm.fd);
> +	}
> +	subm_set_free_data(set);
> +
> +	if (set->sync_method == SYNC_BARRIER)
> +		pthread_barrier_destroy(&set->barrier);
> +}
> +
> +struct init_vf_ids_opts {
> +	bool shuffle;
> +	bool shuffle_pf;
> +};
> +
> +static void init_vf_ids(uint8_t *array, size_t n,
> +			const struct init_vf_ids_opts *opts)
> +{
> +	size_t i, j;
> +
> +	if (!opts->shuffle_pf && n) {
> +		array[0] = 0;
> +		n -= 1;
> +		array = array + 1;
> +	}
> +
> +	for (i = 0; i < n; i++) {
> +		j = (opts->shuffle) ? rand() % (i + 1) : i;
> +
> +		if (j != i)
> +			array[i] = array[j];
> +
> +		array[j] = i + (opts->shuffle_pf ? 0 : 1);
> +	}
> +}
> +
> +struct vf_sched_params {
> +	uint32_t exec_quantum_ms;
> +	uint32_t preempt_timeout_us;
> +};
> +
> +static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
> +				      const struct vf_sched_params *p)
> +{
> +	unsigned int gt;
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		for (int vf = 0; vf <= num_vfs; ++vf) {
> +			xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt, p->exec_quantum_ms);
> +			xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt, p->preempt_timeout_us);
> +		}
> +	}
> +}
> +
> +static bool check_within_epsilon(const double x, const double ref, const double tol)
> +{
> +	return x <= (1.0 + tol) * ref && x >= (1.0 - tol) * ref;
> +}
> +
> +static void compute_common_time_frame_stats(struct subm_set *set)
> +{
> +	struct subm_thread_data *data = set->data;
> +	int i, j, ndata = set->ndata;
> +	struct subm_stats *stats;
> +	uint64_t common_start = 0;
> +	uint64_t common_end = UINT64_MAX;
> +
> +	/* Find the common time frame */
> +	for (i = 0; i < ndata; i++) {
> +		stats = &data[i].stats;
> +
> +		if (stats->start_timestamp > common_start)
> +			common_start = stats->start_timestamp;
> +
> +		if (stats->end_timestamp < common_end)
> +			common_end = stats->end_timestamp;
> +	}
> +
> +	igt_info("common time frame: [%lu;%lu] %.2fms\n",
> +		 common_start, common_end, (common_end - common_start) / 1e6);
> +
> +	if (igt_warn_on_f(common_end <= common_start, "No common time frame for all sets found\n"))
> +		return;
> +
> +	/* Compute concurrent_rate for each sample set within the common time frame */
> +	for (i = 0; i < ndata; i++) {
> +		uint64_t total_samples_duration = 0;
> +		uint64_t samples_duration_in_common_frame = 0;
> +
> +		stats = &data[i].stats;
> +		stats->concurrent_execs = 0;
> +		stats->concurrent_rate = 0.0;
> +		stats->concurrent_mean = 0.0;
> +
> +		for (j = 0; j < stats->samples.n_values; j++) {
> +			uint64_t sample_start = stats->start_timestamp + total_samples_duration;
> +			uint64_t sample_end = sample_start + stats->samples.values_u64[j];
> +
> +			if (sample_start >= common_start &&
> +			    sample_end <= common_end) {
> +				stats->concurrent_execs++;
> +				samples_duration_in_common_frame +=
> +					stats->samples.values_u64[j];
> +			}
> +
> +			total_samples_duration += stats->samples.values_u64[j];
> +		}
> +
> +		stats->concurrent_rate = samples_duration_in_common_frame ?
> +				     (double)stats->concurrent_execs /
> +					     (samples_duration_in_common_frame *
> +					      1e-9) :
> +				     0.0;
> +		stats->concurrent_mean = stats->concurrent_execs ?
> +				      (double)samples_duration_in_common_frame /
> +					      stats->concurrent_execs :
> +				      0.0;
> +		igt_info("[%s] Throughput = %.4f execs/s mean duration=%.4fms nsamples=%d\n",
> +			 data[i].subm.id, stats->concurrent_rate, stats->concurrent_mean * 1e-6,
> +			 stats->concurrent_execs);
> +	}
> +}
> +
> +static void log_sample_values(char *id, struct subm_stats *stats,
> +			      double comparison_mean, double outlier_treshold)
> +{
> +	const uint64_t *values = stats->samples.values_u64;
> +	unsigned int n = stats->samples.n_values;
> +	char buffer[2048];
> +	char *p = buffer, *pend = buffer + sizeof(buffer);
> +	unsigned int i;
> +	const unsigned int edge_items = 3;
> +	bool is_outlier;
> +	double tolerance = outlier_treshold * comparison_mean;
> +
> +	p += snprintf(p, pend - p,
> +		      "[%s] start=%f end=%f nsamples=%u comparison_mean=%.2fms\n",
> +		      id, stats->start_timestamp * 1e-9, stats->end_timestamp * 1e-9, n,
> +		      comparison_mean * 1e-6);
> +
> +	for (i = 0; i < n && p < pend; ++i) {
> +		is_outlier = fabs(values[i] - comparison_mean) > tolerance;
> +
> +		if (n <= 2 * edge_items || i < edge_items ||
> +		    i >= n - edge_items || is_outlier) {
> +			if (is_outlier) {
> +				double pct_diff =
> +					100 *
> +					(comparison_mean ?
> +						 (values[i] - comparison_mean) /
> +							 comparison_mean :
> +						 1.0);
> +
> +				p += snprintf(p, pend - p,
> +					      "%0.2f @%d Pct Diff %0.2f%%\n",
> +					      values[i] * 1e-6, i,
> +					      pct_diff);
> +			} else {
> +				p += snprintf(p, pend - p, "%0.2f\n",
> +					      values[i] * 1e-6);
> +			}
> +		}
> +
> +		if (i == edge_items && n > 2 * edge_items)
> +			p += snprintf(p, pend - p, "...\n");
> +	}
> +
> +	igt_debug("%s\n", buffer);
> +}
> +
> +#define MIN_NUM_REPEATS 25
> +#define MIN_EXEC_QUANTUM_MS 8
> +#define MAX_EXEC_QUANTUM_MS 32
> +#define MIN_JOB_DURATION_MS 16
> +#define JOB_TIMEOUT_MS 5000
> +#define MAX_TOTAL_DURATION_MS 15000
> +#define PREFERRED_TOTAL_DURATION_MS 10000
> +#define MAX_PREFERRED_REPEATS 100
> +
> +struct job_sched_params {
> +	int duration_ms;
> +	int num_repeats;
> +	struct vf_sched_params sched_params;
> +};
> +
> +static int calculate_job_duration_ms(int execution_ms)
> +{
> +	return execution_ms * 2 > MIN_JOB_DURATION_MS ? execution_ms * 2 :
> +							MIN_JOB_DURATION_MS;
> +}
> +
> +static bool compute_max_exec_quantum_ms(struct job_sched_params *params,
> +					int num_threads)
> +{
> +	for (int test_execution_ms = MAX_EXEC_QUANTUM_MS;
> +	     test_execution_ms >= MIN_EXEC_QUANTUM_MS; test_execution_ms--) {
> +		int test_duration_ms =
> +			calculate_job_duration_ms(test_execution_ms);
> +		int max_delay_ms = (num_threads - 1) * test_execution_ms;
> +
> +		/*
> +		 * Check if the job can complete within JOB_TIMEOUT_MS,
> +		 * including the maximum scheduling delay
> +		 */
> +		if (test_duration_ms + max_delay_ms <= JOB_TIMEOUT_MS) {
> +			int estimated_num_repeats =
> +				MAX_TOTAL_DURATION_MS /
> +				(num_threads * test_duration_ms);
> +
> +			if (estimated_num_repeats >= MIN_NUM_REPEATS) {
> +				params->sched_params.exec_quantum_ms = test_execution_ms;
> +				return true;
> +			}
> +		}
> +	}
> +	return false;
> +}
> +
> +static void adjust_num_repeats(struct job_sched_params *params, int num_threads)
> +{
> +	int preferred_max_repeats = PREFERRED_TOTAL_DURATION_MS /
> +				    (num_threads * params->duration_ms);
> +	int optimal_repeats = min(preferred_max_repeats, MAX_PREFERRED_REPEATS);
> +
> +	params->num_repeats = max(optimal_repeats, MIN_NUM_REPEATS);
> +}
> +
> +static struct job_sched_params
> +prepare_job_sched_params(int num_threads, const struct subm_opts *opts)
> +{
> +	struct job_sched_params params = { MIN_NUM_REPEATS,
> +					   MIN_JOB_DURATION_MS,
> +					   { MIN_EXEC_QUANTUM_MS,
> +					     MIN_EXEC_QUANTUM_MS * 2000 } };


Maybe macro MIN_PREEMPT_TIMEOUT_US should be defined?


> +
> +	if (opts->exec_quantum_ms || opts->preempt_timeout_us) {
> +		if (opts->exec_quantum_ms)
> +			params.sched_params.exec_quantum_ms =
> +				opts->exec_quantum_ms;
> +		if (opts->preempt_timeout_us)
> +			params.sched_params.preempt_timeout_us =
> +				opts->preempt_timeout_us;
> +	} else {
> +		if (igt_debug_on(!compute_max_exec_quantum_ms(&params, num_threads)))
> +			return params;
> +
> +		/*
> +		 * After computing a feasible max_exec_quantum_ms,
> +		 * select a random exec_quantum_ms within the new range
> +		 */
> +		params.sched_params.exec_quantum_ms =
> +			MIN_EXEC_QUANTUM_MS +
> +			rand() % (params.sched_params.exec_quantum_ms -
> +				  MIN_EXEC_QUANTUM_MS + 1);
> +		params.sched_params.preempt_timeout_us =
> +			params.sched_params.exec_quantum_ms * 2000;
> +	}
> +	params.duration_ms =
> +		calculate_job_duration_ms(params.sched_params.exec_quantum_ms);
> +
> +	adjust_num_repeats(&params, num_threads);
> +
> +	return params;
> +}
> +
> +/**
> + * SUBTEST: equal-throughput
> + * Description:
> + *   Check all VFs with same scheduling settings running same workload
> + *   achieve the same throughput.
> + */
> +static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opts)
> +{
> +	struct subm_set set_ = {}, *set = &set_;
> +	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> +	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1, opts);
> +
> +	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d\n",
> +		 job_sched_params.sched_params.exec_quantum_ms,
> +		 job_sched_params.sched_params.preempt_timeout_us,
> +		 job_sched_params.duration_ms, job_sched_params.num_repeats,
> +		 num_vfs + 1);
> +
> +	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
> +		    &(struct init_vf_ids_opts){ .shuffle = true,
> +						.shuffle_pf = true });
> +	xe_sriov_require_default_scheduling_attributes(pf_fd);
> +	/* enable VFs */
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	/* set scheduling params (PF and VFs) */
> +	set_vfs_scheduling_params(pf_fd, num_vfs, &job_sched_params.sched_params);
> +	/* probe VFs */
> +	igt_sriov_enable_driver_autoprobe(pf_fd);
> +	for (int vf = 1; vf <= num_vfs; ++vf)
> +		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
> +
> +	/* init subm_set */
> +	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
> +	subm_set_init_sync_method(set, opts->sync_method);
> +
> +	for (int n = 0; n < set->ndata; ++n) {
> +		int vf_fd =
> +			vf_ids[n] ?
> +				igt_sriov_open_vf_drm_device(pf_fd, vf_ids[n]) :
> +				drm_reopen_driver(pf_fd);
> +
> +		igt_assert_fd(vf_fd);
> +		set->data[n].opts = opts;
> +		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> +			  xe_engine(vf_fd, 0)->instance);
> +		subm_workload_init(&set->data[n].subm,
> +				   &(struct subm_work_desc){
> +					.duration_ms = job_sched_params.duration_ms,
> +					.preempt = true,
> +					.repeats = job_sched_params.num_repeats });
> +		igt_stats_init_with_size(&set->data[n].stats.samples,
> +					 set->data[n].subm.work.repeats);
> +		if (set->sync_method == SYNC_BARRIER)
> +			set->data[n].barrier = &set->barrier;
> +	}
> +
> +	/* dispatch spinners, wait for results */
> +	subm_set_dispatch_and_wait_threads(set);
> +
> +	/* verify results */
> +	compute_common_time_frame_stats(set);
> +	for (int n = 0; n < set->ndata; ++n) {
> +		struct subm_stats *stats = &set->data[n].stats;
> +		const double ref_rate = set->data[0].stats.concurrent_rate;
> +
> +		igt_assert_eq(0, stats->num_early_finish);
> +		if (!check_within_epsilon(stats->concurrent_rate, ref_rate,
> +					  opts->outlier_treshold)) {
> +			log_sample_values(set->data[0].subm.id,
> +					  &set->data[0].stats,
> +					  set->data[0].stats.concurrent_mean,
> +					  opts->outlier_treshold);
> +			log_sample_values(set->data[n].subm.id, stats,
> +					  set->data[0].stats.concurrent_mean,
> +					  opts->outlier_treshold);
> +			igt_assert_f(false,
> +				     "Throughput=%.3f execs/s not within +-%.0f%% of expected=%.3f execs/s\n",
> +				     stats->concurrent_rate,
> +				     opts->outlier_treshold * 100, ref_rate);
> +		}
> +	}
> +
> +	/* cleanup */
> +	subm_set_fini(set);
> +	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> +	igt_sriov_disable_vfs(pf_fd);
> +}
> +
> +static struct subm_opts subm_opts = {
> +	.sync_method = SYNC_BARRIER,
> +	.outlier_treshold = 0.1,
> +};
> +
> +static bool extended_scope;
> +
> +static int subm_opts_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		extended_scope = true;
> +		break;
> +	case 's':
> +		subm_opts.sync_method = atoi(optarg);
> +		igt_info("Sync method: %d\n", subm_opts.sync_method);
> +		break;
> +	case 'q':
> +		subm_opts.exec_quantum_ms = atoi(optarg);
> +		igt_info("Execution quantum ms: %u\n", subm_opts.exec_quantum_ms);
> +		break;
> +	case 'p':
> +		subm_opts.preempt_timeout_us = atoi(optarg);
> +		igt_info("Preempt timeout us: %u\n", subm_opts.preempt_timeout_us);
> +		break;
> +	case 't':
> +		subm_opts.outlier_treshold = atoi(optarg) / 100.0;
> +		igt_info("Outlier threshold: %.2f\n", subm_opts.outlier_treshold);
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{ .name = "sync", .has_arg = true, .val = 's', },
> +	{ .name = "threshold", .has_arg = true, .val = 't', },
> +	{ .name = "eq_ms", .has_arg = true, .val = 'q', },
> +	{ .name = "pt_us", .has_arg = true, .val = 'p', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --extended\tRun the extended test scope\n"
> +	"  --sync\tThreads synchronization method: 0 - none 1 - barrier (Default 1)\n"
> +	"  --threshold\tSample outlier threshold (Default 0.1)\n"
> +	"  --eq_ms\texec_quantum_ms\n"
> +	"  --pt_us\tpreempt_timeout_us\n";
> +
> +igt_main_args("s:e:p:", long_opts, help_str, subm_opts_handler, NULL)


missing short opts


> +{
> +	int pf_fd;
> +	bool autoprobe;
> +
> +	igt_fixture {
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		xe_sriov_require_default_scheduling_attributes(pf_fd);
> +	}
> +
> +	igt_describe("Check VFs achieve equal throughput");
> +	igt_subtest_with_dynamic("equal-throughput") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, vf)
> +				igt_dynamic_f("numvfs-%d", vf)
> +					throughput_ratio(pf_fd, vf, &subm_opts);
> +
> +		for_random_sriov_vf(pf_fd, vf)
> +			igt_dynamic("numvfs-random")
> +				throughput_ratio(pf_fd, vf, &subm_opts);
> +	}
> +
> +	igt_fixture {
> +		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
> +					  &(struct vf_sched_params){});
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> +			       "Failed to disable VF(s)");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		drm_close_driver(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..c8868d5ab 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -318,6 +318,7 @@ intel_xe_progs = [
>   	'xe_spin_batch',
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
> +	'xe_sriov_scheduling',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',

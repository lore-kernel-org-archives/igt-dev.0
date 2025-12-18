Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16146D6ACFE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 12:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16CB10E41D;
	Thu, 18 Dec 2025 12:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpqNSVit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A2410E41D
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766062529; x=1797598529;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3TjOhMpDOjBG3TL4ym4zymhjfh0ekZ9udXiQp7u5b6U=;
 b=NpqNSVitt3dm74/pjrXKy1IktxWulg+LYydcIK+bEY0UiZqP7T+GwcwF
 DFMFjv4aAjUQxKeQjqGv6RKJxx2D7YgyYW6EWJqTx7x1EYTgYX5/sh0Tf
 p57jNsu9j/SHFQKl/U6hQyvI9lrz8yIIUC/JQkhw5iJJp2r34BD7nGPdz
 JQHmINvrPiAt8i4iG3PNOR1Mb3qwm6qjZILhwnEkKear+toBycRV6DNRe
 gAIUFAUdZ7+Ifly+BqHc0+pr5aBMwQnmrIJPTivQQjgxr/NeB872ASMZY
 4gOwKCnHvAZV+WkRyHeM9Xoi46vz7eJxR61OQ1F/FRY/Pzu4jTOZoCjvO w==;
X-CSE-ConnectionGUID: TJ0Xf2umSWCQYH64cnRZ7w==
X-CSE-MsgGUID: 1MdJw9coQF+y7bkxC12lvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79470983"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79470983"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:55:28 -0800
X-CSE-ConnectionGUID: 8287zn/KQDaHngULlkmp5g==
X-CSE-MsgGUID: l+8eFi7BQ+eLdgL20/5aAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="199051646"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:55:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:55:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 04:55:27 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:55:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9u0NtRYDoqr6jmUOuYiSJkhfd1tsMzujcHZHTTTkudbx7YJyFquobdIbYtJ4bBLrBLp1z1R4Bkji6mo2Js3AlCd6bosrfHBNHLhqWQod2zbzc69V/Hm/PIGs4fKJrOll9MzSyp+qylEM9ghr2MUk4uDcDGUbeVOfA2FJ47NTJ+Ih/YJm7w44wBoIm1qOJWYWLe9XEBgZIlj0ICIo2/aPMQcIqGLFYivNa/NJwpDuqzYLmPxFXosVKGHxl75asDxekP3s9EsAKZw837HVt5CvaPlU4uvM95uyOrkgXQyoLkdlFMVFO1L28Bh/hCxdOTvDljXeVTyeHgwSbPK40SpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JENbLZJeJ0UGfBD/r8Tg+FgBPvrlMcOJHRv21VGNeDI=;
 b=EcDXMnW8tqA8TQBgSAAXufNfq1wiqcteNgWVYiHLgrUEVXRl7vptrJBbO9rgXy3Gyi8k+vhnetMI8EnAtxPESzAH3GatokxLzxvlPSfBls97BCjlFcpVbgACs+YkldlJn2YdblKDfloi5G3E5LAxNBfE4KsNZFS+wCOrS5FJINh5KttWZQJN9u17YbbnpNE48OkpSO3dcz1HKEegdCQbO0XwiiAbbKnx5A6SAB9HdscU2xgGS7bd7j0mf+3SuoVgqEOo9HZGxVfIQ3noEoUQjSkkp1peXfwarmM6Mra+ALxFbgmwfybJieXftPCEYl7dViZlprS3bl0jHCX2nOCP5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CO1PR11MB5202.namprd11.prod.outlook.com (2603:10b6:303:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 12:55:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 12:55:24 +0000
Date: Thu, 18 Dec 2025 13:55:17 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t, v3 3/3] tests/intel/xe_exec_system_allocator: Add
 new SVM compute tests
Message-ID: <aUP5qkrjQ0WbETiS@fdugast-desk>
References: <20251218104907.117812-1-francois.dugast@intel.com>
 <20251218104907.117812-4-francois.dugast@intel.com>
 <fuy2cuq6kt5g2o2c7bspkrqpyqxfi25q2fkhqkb6qrfvlzns35@2a3g6357bkwm>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fuy2cuq6kt5g2o2c7bspkrqpyqxfi25q2fkhqkb6qrfvlzns35@2a3g6357bkwm>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CO1PR11MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a94524-e68d-4684-b0a0-08de3e34b5dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEVmQkNJQ0dabkZ6WVpXTTk5YlEzK0pMS1dlRllWL29YSUFNeGdVT3Eya21S?=
 =?utf-8?B?Ti9SYU9hYVBkSWtCQkczV0MxbTdRUEdMU0F5Zm9sREpBdDV4L051czA3a2hK?=
 =?utf-8?B?RVF6STVGT3E0Q2dmQnVRaFkzS3laMThIckNiMGRWbzFsRStzb1FqNTl0VEVY?=
 =?utf-8?B?bm1HcGhKL0hKb2JrUk1hUXBIWUVva2FodnRJL1dZNVl3b0tsbzh5ZHNsYk02?=
 =?utf-8?B?enVxY05nWkMyb0hTYXhRU2ltL3VGU0JvdmFuRXdoN1J2TWpvNnVlang5N3l4?=
 =?utf-8?B?ek1wMjkrL1dxQXVKL3dqQjZ4eU1uUkdJcjEvaHJBMnhsYWhZbWtublFIMFdY?=
 =?utf-8?B?Q2g0ck00aWxZT1FyTlhnbk9jSkJyOWJzN1J5NzB1UEpJaGlISUJEb0tQRUJv?=
 =?utf-8?B?UEVNUmt1UFZ4NzdJcVZNSGNjTGdoeVJ6ekgxUEdCY0s0dCt2V3RKdDE0Q1Iw?=
 =?utf-8?B?Zi85YWNoQVhLYmwyQk1GNGsrVEU5STNqUHVLdjFnbkl1M0JpR3lTVDQ2WjNH?=
 =?utf-8?B?UlBUNG1ReWs3TEpjNWpoVlBSeDJScUlPbTcxSVMvWkdPUVEraDVuVnhkMHRB?=
 =?utf-8?B?SFhzVnkvb1ZTV3M0OW5nLzlkaG0zK2hKTnppUkdlMHNLTnlUNXBrN0xaOGhr?=
 =?utf-8?B?bTZ1WWx6L05IZk0ra3lXNy9BMERuSlo1V2oybkFLaEp6V0Z6eFpIeFlWWENa?=
 =?utf-8?B?SVVSTnR4dXl5Z0t0dmlzd3Z0dFJIWU1Mb09ia1VaQzV2UURDNVVtVEtFeTY0?=
 =?utf-8?B?eW9OYWliLzgreFhsQlZ0R1lNMjhoWjVwU29qQzlSNnFZSVdBZFNDVlNZZFZY?=
 =?utf-8?B?SDRYQ2ozSENiOEd1ay8rUWRCMDdTUUVPSjFvdmZjSzRBMmpRd016ZmNnOGVL?=
 =?utf-8?B?R1FqTlJDelJ2dTYwR0ZYellNemVQb1g2OHdHZzFMRURqVHlhdmgzZ1FCM3Zq?=
 =?utf-8?B?clh1K0kwQ0tjTlFvVXBpbWdJNUhwTXd1V1UwWGEwREVZRGx2cTFqRmJmTFM3?=
 =?utf-8?B?S0pwTHZERTJiVXI5ZWVTKzdaM25mcVpNYU5taW1KOERUN2krUy9OanF2U2RT?=
 =?utf-8?B?bUV0RTVqNFVRb1kyQWRIenFVaWRFZmtOVzFBb3RWZlFhcU12S0dEVUZqVUN1?=
 =?utf-8?B?SzU0Q291cHJ6UWt2VFRyVHhXRGJjT24vSUR1SXNiSXREbG1qOU43SWo0eWFT?=
 =?utf-8?B?VXR0S3RZOFlPeThZSzMwUDYxMUMxdzM5U0lTMm9XVHVvMHZQVFBjL3orVU1E?=
 =?utf-8?B?VHM5akM4S0NvN2VwelNPK0R0TWdrYVFyZkJwcFlkTDZCVEFsUk5EdUhLcGpj?=
 =?utf-8?B?ZTNOajVSb2YwRlJrV2M0YkpFZENJbytoKzZkckY4NTdZcTJLSnFMMStsdThp?=
 =?utf-8?B?bGhVTnJGZHFIc2t0Zzljc0pOYzFhdmZmNkRQakp2bDdrVVJQWW1TOHN4ekxs?=
 =?utf-8?B?TUFSZXVGTXlGUXZMc2NhaUl3blRVQXhiWlh2aTl3Uno1QnBFMWFiUHpMeTcr?=
 =?utf-8?B?QlhnVHcrRlcyY3RwOG04MjhzM2Zib083MFh1b3FZWERteHFTYjNYN29Ubjln?=
 =?utf-8?B?a3ZKUUp0bTNNcnJ3OGk1bkJlSWIvL3ZON0FMc2w1bys5TndQOTJpeWVCbEcr?=
 =?utf-8?B?SktCZ1VVc2Rna1RkVUR2SmlrZWczNE5kUit6K3BvVnl0RmhHTG1jRkM1ZFN4?=
 =?utf-8?B?enJqZEpndERUSDg2UG9IM1lGSnNiZEJRbHhieklsN2xDTXB2d1MyUlAxNGpz?=
 =?utf-8?B?bUg3akc3cXM4MEN6TnJuOXBzbmxycnlNQXY4Mjc5NTRSb09qaWxTWWJvNHhh?=
 =?utf-8?B?WjkxLzB5b3BEcFBiMWhRRGs1OW1kQWNEb0JMSlVWc3FUdnZJYzJ6OXJmMTVJ?=
 =?utf-8?B?MXNyMHJYeFhXVGU0Zkxza3dQRnRuZ00zY3F1d1JUajRDKzY0aWUwTUVVSjlv?=
 =?utf-8?Q?ch1eY6Bs1402XHVhSpTzioe22MuSHEVl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkZDYjVjM283VzkybUhGeW1JWHVLcnRrc2lxQWE1WXdWN3J2MTRnMnlxU2do?=
 =?utf-8?B?NDk5dUtEaU5SL0hJUFRIb1o1TVRycVVtV29iM0hwd3g3QmRoOTR6VGx3TTVF?=
 =?utf-8?B?S3dRRkRzUVcrQzNnYlJURzByS2lMRzJ4VG15RXhERVFOZE44eXQ1cElxUzBK?=
 =?utf-8?B?eGlrSm1CNmpOZExZdGVBaWJqaURaNTB3Zjd1bUZPN2xmYjRGenYzSmxLeUZ0?=
 =?utf-8?B?THNFU1RacmwvVG5tUG0vUGlXend5RXVQZUI0Qk92T2JEUlJmdDB6QW1OQ0Mx?=
 =?utf-8?B?UUczTmZaamtRVnh3cWNqOTJxbkRDMzNPMVA4bFNSY1BIVFJuSU1QTnI1TTFt?=
 =?utf-8?B?SXh4TE1GdEpqK2E3L3VWclJ1cnBkc1RYUzdtT2NOYkhIVUtiRU9WcTlucjZl?=
 =?utf-8?B?MkhUNzJlNkFkZVVlakZoYll4WSs5ZUtrVm96S3J6SVZQR0VKd01YS0xiRVh3?=
 =?utf-8?B?a3lyaXpWbFRsdHArYmdvMTJpRXZrL3ZuNC9PaDZVOG5BMW0rY0x4Umo0RU9R?=
 =?utf-8?B?NytVMG9FQnNXZTBGUlgwWEFjRkM2cHhYOVh1NGNDbEErQWZpRGhieEI5NXpN?=
 =?utf-8?B?Y3NTN0NCR1lhUTRZQzY1U2R1WTc1N2R5TEp6QTNNVytiaFJnV2tyTUVlUkM2?=
 =?utf-8?B?bm9La0FMRkVKU2V1c2hmbzZYb2Q2UDB2STZmL0dKNmkwRU5pVUtsZGFyM3VX?=
 =?utf-8?B?ejRrbXAvbnptZmYram1mNGtsOFlpcjQvdWQ1Yno1S042bTZnajljRGE2TlIy?=
 =?utf-8?B?Mm1XYXhEaERGc0VJWmVyVU5ZSkhWTFZiU0M2TGRraDYzNUhYVTRsVWMraVY4?=
 =?utf-8?B?aGJ4dFR0cm9jaG9OVkVEeWxvUDlpS1I0VXdEL01ZUEFkY3hlTUxzQ2VNcU45?=
 =?utf-8?B?QlFSamgvNlZVWkxSMGNFcjdTeWRpMno2amdPK0kvS0kvbHNjb3RoMnlBRWRk?=
 =?utf-8?B?b1VhTi9taVhkM3BhaXdlcEl2MVBmYlorWUhQREpxUngzMHJBcTZaQ1FVWU5q?=
 =?utf-8?B?SVZmUzlNTXpoa3RCNXI4UCtwUXhlRENYUWl3U2cvL0QyZ244Y083b000SmpV?=
 =?utf-8?B?dTZGYjlJTkhGbEVJU0dBYlhDMWpaY2N0Y1Q5OWlEVGVMelFLa0ZraHlUS0Iy?=
 =?utf-8?B?TkNyYURPVThCNDRkYzB4U29HT2hwOGlmcStuaWVuUDRnSUUwdUhLQW5VM3FT?=
 =?utf-8?B?S3M2cFVmZlFUWmRyZ0IyOFQ2SytGcjVncXQxUlRDZEtiRFBwbUszdzd2YURP?=
 =?utf-8?B?ZE1oY1FBdE1FV29DbUwvM1Zmc3RqSHVleEd5ZUswR1JiVkRwcllTS2c1WHpV?=
 =?utf-8?B?aXhJQjA1UjFkeHpwb3RRMzRvY2J2R3Iyd1U5SlVTeTNURDlmdzluQlNMWmFP?=
 =?utf-8?B?K1JRSzVjN29kNi9NVUd3K2M5WUJnUjhOM3lBZElkUEJZMUR3MW4yUlQ2MmlY?=
 =?utf-8?B?QlYrcVE5SU9lWXZyQ0lrWEExRWRCZTg2SzlNL010cWJEb2prTlJEVmR3S3hu?=
 =?utf-8?B?UTRnaGdCcWwxV1NaODJkV2xJMXVDRTlkMFVNM1pNdDNSM1NoZUh4N1Byc0V2?=
 =?utf-8?B?OWxTMDFjeVRyN2FzWVR1T0ZnaVpxRndvYkRKMG1CRmt3akFGbzhvNDFYUk1t?=
 =?utf-8?B?M3R5Z0R4NCtIbHV5eS96bXVtTlkwMUVDTVJtVGRDNGZRWUx3SmovaWxLUVNJ?=
 =?utf-8?B?TndRckhTMDM1SDVzWFl3bFFObFE0YUxGWDdZTzFmd1MyY2czbzR4ZzRXaXJF?=
 =?utf-8?B?TGdJYU8vRDc4UDZqRkhwMzA0NjIvZ2FTU0Rib3BNbmJFa0pCR0pta21YdlVM?=
 =?utf-8?B?THdLN1FGMWpSQXhVNURWZjdia2F2aXNMQy8zTzdBYVA3b1ZRQk9Pa20rUmE5?=
 =?utf-8?B?SUY2OTNMdTd2NXloSjY4bFBlamZ6WE1DaXpySW1XTU1TeWpwTEowZUVRK0tE?=
 =?utf-8?B?dlpMcDlmT1hrbUcyWVZDLytOcC9YbmpJRjhxSVE5SVRjM3NnMjJzWnl5Wlo2?=
 =?utf-8?B?RUJUYWljdTZ2Z3NJbTJiOEtkcmpPbHB5U045SjRTWmVkRHRqQzJ3aG10S01X?=
 =?utf-8?B?UExjYk1neU1NSStPSzZyUXBQMWxmL0crLzc3WjY3ZTgraDFFRUVBZ29oTDlK?=
 =?utf-8?B?YlRIVERFeUdtWGkvbUc2YTBVbHRVb3ZiOStyL0o3WWRIa2JUTVJZQWpmc3Rx?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a94524-e68d-4684-b0a0-08de3e34b5dd
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:55:24.5019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYM2tQfdUXYNOaL5TvG/wLtTHcZrTf+nnWlqtxWV8cUJ/ZoaC28zqH/1mYZUQS1amVg3D4z6nGOeyOF4tcytFl1P1gYx9OpMLOsHfQpmxlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5202
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

On Thu, Dec 18, 2025 at 01:06:35PM +0100, Zbigniew Kempczyński wrote:
> On Thu, Dec 18, 2025 at 11:47:22AM +0100, Francois Dugast wrote:
> > These new tests allow triggering GPU page faults from the context of
> > execution units. They can be used to create single page faults or page
> > fault floods, of various sizes. This is helpful for debugging and for
> > performance profiling.
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Acked-by: Nishit Sharma <nishit.sharma@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 53 +++++++++++++++++++++++---
> >  1 file changed, 48 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index e66fa4203..25fca9ba6 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2172,13 +2172,36 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> >  	munmap(pdata, sizeof(*pdata));
> >  }
> >  
> > +/* compute flags */
> > +#define TOUCH_ONCE		(0x1 << 0)
> > +#define ACCESS_DEVICE_HOST	(0x1 << 1)
> > +
> >  /**
> >   * SUBTEST: compute
> >   * Description: Run a simple compute kernel with the system allocator
> >   * Test category: functionality test
> > + *
> > + * SUBTEST: eu-fault-4k-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-64k-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-2m-%s
> > + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
> > + * Test category: performance test
> > + *
> > + * arg[1]:
> > + *
> > + * @once-device:				touch the buffer only once, from the device
> > + * @once-device-host:				touch the buffer only once, from the device then from the host
> > + * @range-device:				touch the whole buffer, from the device
> > + * @range-device-host:				touch the whole buffer, from the device then from the host
> >   */
> >  static void
> > -test_compute(int fd, size_t size)
> > +test_compute(int fd, size_t size, unsigned int flags)
> >  {
> >  	struct drm_xe_sync sync = {
> >  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > @@ -2194,6 +2217,7 @@ test_compute(int fd, size_t size)
> >  	};
> >  	float *compute_input;
> >  	int i;
> > +	unsigned int loop_count;
> 
> Compiler warning.
> 
> >  
> >  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> >  	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
> > @@ -2204,11 +2228,14 @@ test_compute(int fd, size_t size)
> >  	compute_input = aligned_alloc(SZ_2M, env.array_size * sizeof(float));
> >  	igt_assert(compute_input);
> >  
> > -	for (i = 0; i < env.array_size; i++)
> > -		compute_input[i] = rand() / (float)RAND_MAX;
> > -
> > +	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size / sizeof(float);
> 
> According to my comment on 2/3 I think here we should have:
> 
> 	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> 
> because allocation is env.array_size * sizeof(float);

I sent a wrong version. Agree with all your comments.

Francois

> 
> --
> Zbigniew
> 
> > +	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> >  	env.input_addr = to_user_pointer(compute_input);
> >  	env.vm = vm;
> > +
> > +	for (i = 0; i < env.loop_count; i++)
> > +		compute_input[i] = rand() / (float)RAND_MAX;
> > +
> >  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> >  
> >  	free(compute_input);
> > @@ -2360,6 +2387,13 @@ int igt_main()
> >  		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
> >  		{ NULL },
> >  	};
> > +	const struct section csections[] = {
> > +		{ "once-device", TOUCH_ONCE },
> > +		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
> > +		{ "range-device", 0 },
> > +		{ "range-device-host", ACCESS_DEVICE_HOST },
> > +		{ NULL },
> > +	};
> >  
> >  	const struct section intel_get_pat_idx_functions[] = {
> >  		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> > @@ -2602,7 +2636,16 @@ int igt_main()
> >  	}
> >  
> >  	igt_subtest("compute")
> > -		test_compute(fd, SZ_2M);
> > +		test_compute(fd, SZ_2M, 0);
> > +
> > +	for (const struct section *s = csections; s->name; s++) {
> > +		igt_subtest_f("eu-fault-4k-%s", s->name)
> > +			test_compute(fd, SZ_4K, s->flags);
> > +		igt_subtest_f("eu-fault-64k-%s", s->name)
> > +			test_compute(fd, SZ_64K, s->flags);
> > +		igt_subtest_f("eu-fault-2m-%s", s->name)
> > +			test_compute(fd, SZ_2M, s->flags);
> > +	}
> >  
> >  	igt_fixture() {
> >  		xe_device_put(fd);
> > -- 
> > 2.43.0
> > 

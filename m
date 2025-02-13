Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98228C0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 12:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD2A10E3BC;
	Thu, 13 Feb 2025 12:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gut0eTI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F242B10E3BC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739448106; x=1770984106;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KUnzWchfkn6rDpIFy4dHeUoOgszywzHi7DwtunBa/bg=;
 b=gut0eTI/98EVTK87hdFVh8Dp9JL+o+p4SXQuK8Km3qdXyM+qMiWRKhPo
 fPcagtHDOffWelXC8aJ/pLamUH/nvT9EG2ix4iy6V0NTbK/4k0kqqVilm
 NtQCLkunsfedd6v4SctkWtu5ZaQBQiJaPC19MH8RKa4DFK6gHhCOIVf/I
 5q/8vh2MSsOACR/wkk11lQX0aDx2xE9h0MgUrQL5mt1COwtgHKBHzzvuG
 kzUfZarXjM4dt/WoISftCUiUhazGkQDW0fbIEYAJqSL3XY9iMGdSAI+sv
 iKLZVWtDbBphaYMZZQR+qmDcBYMCy+I+ykx2Ev0NwQ9TTefeDFIEiPNWU g==;
X-CSE-ConnectionGUID: UUAGzvhcT0SdhmpPB3W8qg==
X-CSE-MsgGUID: EeILZJ64SiKmapQP3xU1dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57548538"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="57548538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 04:01:45 -0800
X-CSE-ConnectionGUID: hVi1XLhaTgWjvjlBskl4yw==
X-CSE-MsgGUID: oCANSvORR0aztvKUg95j9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="143969802"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 04:01:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 04:01:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 04:01:39 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 04:01:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqpQ2jyDyoFY5RwTPOl+64se33NlCBoy4eVKtpAe7GmlG0l7H2neWmVC0R0SC+wyyE/sr4Smu/08b9fc/VwK3faPmv1okkuoRrXubop9uYc8YHWmh3+70YH7rDWkWVt501kJdt++oszegJEih+7Xuv0IiK3iDwIVu/l+dLcyExTlGioSXapuZhIvsYUanebXJIO8IgNAoMDUoeENq5hBx77A6aXLTfMYReFibbMqTbU6g2j9b3qWXDkZ04+ikZmYRPSOg2Ta2NaH/yp0S/GLiPkVM8uVw8ouB63XXCaogWw/TOqApQgNIo5h3MLbqWTjZJnhC5S5OiJpq9yDbuocMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1G1D0wHHbDnrb8RbkPL1W7M6mY9zsreQ0E8AZE/hHUI=;
 b=BJsP37ZcR50Jj0dybP89rRUw5PdCsPzlbIvJnpg4NY7PScjeno4G1jyie8seQgGfR23/u3elKsh8PBnujfC3RADJtChUpkML6NWQ535/jgVwWaW65gYi2LK5da1D0fHIGJdaRZm55PNXykx63drRbY/CiRfHHEYxq78rij2iom/1kkJnc5yZPrAlu7FZMx6xCacvZKGWeSYiThxgspuajj+MRpWQdbzaI+Jc52191057YW+bVHIxwlTQcDrlEzd8SlkxyAgW/YCZONhey+X+H4fKR1c2rCO3vesVneBSiWeQfMrG4m30S4qn4sRITlnFYiKDYECqTCWxLlKFi9K9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 12:01:29 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%5]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 12:01:28 +0000
Date: Thu, 13 Feb 2025 12:01:20 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Pranay Samala <pranay.samala@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/kms_draw_crc: Add more logs to
 skips/failure
Message-ID: <fpqrcy46khksau3mm5dykzutaarydicy5mhpm7dv4siak7z4vq@cdinrm2swl3o>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250213094732.706414-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250213094732.706414-1-pranay.samala@intel.com>
X-ClientProxiedBy: DU2PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:10:232::9) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: b682be0f-4eeb-4540-5a27-08dd4c262606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTNLNDZxUUd3NUpwU2RuK2hKc2ZPeHk4cVc0ajhzQURITUd4OXlWTnhCNUNP?=
 =?utf-8?B?UnBJZ0VhRXJwaGxmby9WdzFIOHFjemlMcUtaa05mY2ZZbnNEZjM4anhxRWdB?=
 =?utf-8?B?dlF6WUsva2RENFNlSVRsekdXbGxuY2dCODcrKzRzTUcxeXlBenJTYTBTNVJY?=
 =?utf-8?B?Q1pNcW95VkF6RFYyUWVmaWpLUUJhaDZob2lwdGhoZnlidVZyV2J1NTZqdElo?=
 =?utf-8?B?REhNbGtnZmRHQThKL01HY2w1eHU2M2tDU0krc1ZQU3hFNWxtTjk4aHNZUGYw?=
 =?utf-8?B?QjZRQ3lHNEJ4NjVCc3hPRXh0U1V5SVpUQ1U1NUdlZE9NeFUvMzM3MEZ1dnlD?=
 =?utf-8?B?WjEzdjE5TjhoNVBCeGFWK0g4SnhtcFZLNzBoTndDaHVWZUpDS2ZGNVRobmhm?=
 =?utf-8?B?OFh1ekdBSXhtQzJnTVNOaVdKb3BJbGJwOXdhNHZSN1poMnZiRStMR0g0bEFz?=
 =?utf-8?B?SkZjZ1pLSXJ2bFJBSjVZcGxIenV0N2Y2eHZrdUFGMHFGLzNVNHlMd2xqakcx?=
 =?utf-8?B?bmhSUXNWN3gvWVFjRHVkQS9ITU0wZDF2d1BzK041b3VRNUY1dlZJVkY3S0xu?=
 =?utf-8?B?SU1EYVNiUHRlWGpwT1VrRW5XVitxYm9iNW1nbVZxNUxMTFpnSDB3K0crNFZN?=
 =?utf-8?B?RmlZbUNCWktoY1pXbWRJN1lscTY1Wnd5ZWJmSlhabU5KSE9YVWRTOEFLalc2?=
 =?utf-8?B?UHBlc1FqVGU1NTNCM2tSbVdVNldOVW45TDhqZlF1OFNjZWdJM2NGQVMrZXhK?=
 =?utf-8?B?dDhIQnB1cmNNNXZpZGhHVkQxckM3UlJVOHFDdFVDNWI4UmdyTmFpdHFTRVNI?=
 =?utf-8?B?cVNuV053bmpRYVZXRmFYTHU1alc5MHpKT1pRMWdNbUduQlhEZVhGYURrY2xE?=
 =?utf-8?B?MWNSMGIvVFBCc3hKaHJNTTVDUEVYSVIyeVdrWVJpTlB6L2VtTkhQNmZzeW9W?=
 =?utf-8?B?OTJBQVpYTVB4UUx4cUMyMUEwR2k4RGZPU1RKRVpESjU3UDQ5MHc0RWp4aTNr?=
 =?utf-8?B?dmxmRXpiZDZHd2pEVURQczJ2bzRyMi9aY2MyQ0Q2NVFjV3FNeTRldmFGMWE3?=
 =?utf-8?B?VHFNbXlnakJ3MkNOYUl2N0Rjb0tXdTNIaGJ4V2RnUjVKTnlaajVBQWszV2Ux?=
 =?utf-8?B?bEkzNy91SUtYRTVmL2Rpczl6T3lkalNTM2ZGNzZqQnplZmdFNDZPNDlGWGlj?=
 =?utf-8?B?ZFc3ME83cEJsUWJTb0xQNUQ2UGZyMTlZR1Bub1I5S3BQTE11SGxoSzlpVDFT?=
 =?utf-8?B?bE5LZ2xPNklsSnlNMFhxbmZ6Yk95RzBkN0N6UWRPRGZBcVNlclZ1WjVHeWRC?=
 =?utf-8?B?bW1vZDM4aXF4bThiVmtkSk8zUFJLODJJa09kanE5L2l5RmgybG5INkYwYTJR?=
 =?utf-8?B?dEpJSlI5OGo0SUFEQ2RsU0hkTFdHL1hVZjRsSVlmd1BtcnYraGF1K0hQNXFh?=
 =?utf-8?B?TEdzRUZ5ZGpMZDIzYnhtOWpYMVNOaWw1c0FKck9QdEpyUFFmRVc1dVY3QmE5?=
 =?utf-8?B?RkxaTm1vdCt6cnpmVHo1QmxrR2FDUkZzb01WRGJtc0Q3UjhYZE9majkvYm9y?=
 =?utf-8?B?RzNRQ3VPTDN2bCtONFpmNWVSNkw1UHZlOG9nazExUmdwUEdaUGI5ZVFxcHlZ?=
 =?utf-8?B?cTdPbEFiZkoxMkswdERBTTJDci9KS2NPNi9TeG5OdElHanlrQUpua3NXTjV5?=
 =?utf-8?B?N3l1Y3lLRytUL2MxdnQ4V0U3d0IvUnd1UFZiSUFGSm5zdUEvQmUvOVlqSGVL?=
 =?utf-8?B?bWhIak5nMkkyWVJKSFMrR1VCb0p3cWZNdG1OYWwrMlFKejRqSnJKaHVNTmlQ?=
 =?utf-8?B?SmYzWnJsTE81aGsrdEdsTnBRR2hTa3ZhZVIxSEpnQ1E1d3VSUHVjNkw0Qndr?=
 =?utf-8?Q?hCWVtxcCiIGDn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVJvanJxciswMHFFOWgyeEFGOG9uUCs5NU5XMkpYQjJBK1BEdlZ6b2VwWW5n?=
 =?utf-8?B?c3FzbWVJVngrTEZxQ204Qjg2KzZjWDRtZ3lvTVNTRG9IdHk5Njc1dzgxb3RC?=
 =?utf-8?B?bFpyYnhFcEs0dmlubWxHdUZYK3pubkFFSktnMkJSUFQrOThUaUYyNFJES2pQ?=
 =?utf-8?B?ZUZLYXliT0lqanFCK1VSTDV5bGkrQkwrVGlzNjJUekxGN3NhYkpzalcvam54?=
 =?utf-8?B?Q1dTTGhXNmwrMFFPNUJkeENqTzhPSlpHY0I2UU9icjBiR0pwdnlEODEyR1M4?=
 =?utf-8?B?V0lZVHNHU3JseG0wUVdqSWZ6VTltTVRzUVlJQ2c1VGE0V09FSnVqL2JlbG01?=
 =?utf-8?B?azFNM2VuSm15Y01JZlhGTWN0RW8zd2F2cjJXSTltSTAvN0hTcDdSREV6T0do?=
 =?utf-8?B?Y0J4NFB2YXJJVTBkRVBLZW9GclpnZnFtZFJQM2pCaXZZMlIzVFZUL1BFVUNw?=
 =?utf-8?B?aDFzTmd1VDVEYmFPT25YSzBadlBOVG1la1lic1c0QTJaM1JNNi83T1VleXh1?=
 =?utf-8?B?V2xpSzh2YzZXT1ptNVJBcUhEOXNCL1JRSWNZbHd4RXNJTm00Z3VmWHRhem5Q?=
 =?utf-8?B?akttR1JuRXNRd2lpS3hsQTdpSjk1djVCNjlvZU5CT1kzM09EWitkNktzSldG?=
 =?utf-8?B?bEdXUlByNFFwR2Q0aUtnL2R5aHIzM3J3c0E2VlZhNzRUSFhORjU2WXA2V1lW?=
 =?utf-8?B?L2R6Z09tU2d6Uml0TTlJZ0g1eFBNLy80Qko1UUFrSGZUdmpveW9tcERFdFZo?=
 =?utf-8?B?czlLTkFvWmo3ZDI2dFRaVFRDRGFCL29VZGdIbkNtS29YVnBzKzU3Q0oyUWdT?=
 =?utf-8?B?NnpjSGVkaXk5RjZ5ZEZETENjRExpZjNTZEQ3VHhjNHUrbTFyaVBLdHFreVFn?=
 =?utf-8?B?c05IUldmZG9xVzE2Z2duWFpNL2lJNzlmU1NrSGNxc3ZKWXNZSGZ1NnJlK3RK?=
 =?utf-8?B?VTIzMUJ5dVd6bmhObDkzZTlHeWdoVDFKZG1LandZRnZuK3pWQWFvRjZlRDR6?=
 =?utf-8?B?K0U1OWxYTk91OW9sYitIMGhLcVhuVVBwZWlQS0k4Q2x2SGpzRlVQYUJaK1Mz?=
 =?utf-8?B?ZjNBMEJZaTk5aGxnZnk0VzZXeWFxZW11NkJBTGFrNTl0UmtWUDZsNFVmYXVs?=
 =?utf-8?B?NE9SKzc0SW5OMktGcmJJSk5mbHlpQnBFTzNSODNOdXErTE9SS0QwdGpwa29H?=
 =?utf-8?B?ZHJULzIza0hoMnhvVmdBUE8yL0FpeEloT1FodEM4cDdVR29rRXk2dDZRcEhI?=
 =?utf-8?B?ZGpuS0YwbjJ5MzA5Slk1TE04YVVFQXhwVDlmTUJrWnhaakZFVFhEUkQrZUdP?=
 =?utf-8?B?NlFYNlFZYWRVVnhQbjNWRlVQallhUU5LY3RsdERHcmduZHBLejlnZE5iS0lE?=
 =?utf-8?B?QXorakNxSGNUd0p5KzgzV0U3NUZrcUtZSEdQcVAwYS9YaUNFUFNpM0dBYlJM?=
 =?utf-8?B?YnhiZ1MvUEFRN2YzZjB2bEc3ek1LTzB0dE9VMWcxTzVhWDdvck1vZDFtVCtY?=
 =?utf-8?B?LzdyL2lITWNOazB5RUJBSkc5OTlDTjBUSGhWRVFjdDhQNUEyUnJSTjlpbEc1?=
 =?utf-8?B?bkRlWDNyd3Q0M0s4SmJNTFY2c3pNcVI1TWVBWTFpL0JwbnpEbjZVdHlOYU42?=
 =?utf-8?B?aXNCZk5TYTkvb3VGNjJSWTVpbnByanBTWWk3SWd0TVBKYzdWTnNtaTBZZ3NE?=
 =?utf-8?B?cTNqdUpCZklEdDZzU3Z1OEgzQ0orWkxCYXAvZmNhOFN1b0ZwcDI2MzB1S3lT?=
 =?utf-8?B?Q3pYZHIxWXhqNHJyQThQalk4WUNFaExSWEVBbUMxRjc3MzVkSlg5Q0pkakdq?=
 =?utf-8?B?dmJabkF4SldMeGgvazJVc2pxUDM0YlpKTWhacHp0N05zRnljOThJek5BeCtH?=
 =?utf-8?B?Y0tBcHZPb25DVmZCbDBRVFJVTUtYei9xK3FZRlRoU0U5bHJ0bjdJT0tkZWRw?=
 =?utf-8?B?cGQ3ZUJuRW9XUC9HbXIxTGtaQi85dG15SStRQmlkeDlrSTNram5DdGJGTkFn?=
 =?utf-8?B?bTRZRUM2eHkwZXdNYisxRVZveGFrWXNyOWVhdEZqSk1VSHVyVVlxcmZ4dXBl?=
 =?utf-8?B?N1dnRURCbmlUVlJ4amV0VU9iZEtDQ3ZtL3BNNURpMno4TU9ETEVYMDNtTzZk?=
 =?utf-8?B?ZU1ZdjFIdGhrb2xhQ2dDQ1ZPdFVySmFJck5CempaNTM5RmtrbVphRzJXc1p6?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b682be0f-4eeb-4540-5a27-08dd4c262606
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 12:01:28.8080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTwAkkBhnaA3VVIvCupJFONLUjgPExzB5RA9Pc8oxszHZ0Ezts5gO67lri5CqK2l+1bvAsiomj0hWleT40OtgdkMQBFOyB2iaZNB1ND0C3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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

Hi Pranay,

> Having some logs for test failures or skips would
> make debugging much easier.
I think the commit message is too broad for the changes that you
make. Something like:
"Add a flag to check if display supports any format and
modifier."
would better reflect the purpose of the code changes.

> +	bool flag = false;
"flag" is too generic and does not hint at what it's usage is.
You could name this variable "found_supported_format" or
"no_supported_formats" and start with a "true" value, which is
flipped when a supported format is found.

Best regards,
Krzysztof

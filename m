Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0322CD8CAD
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 08:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656AD10E189;
	Tue,  9 Jun 2026 08:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PI++Awxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE5210E189
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780992640; x=1812528640;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Qx4blPXzQjqzXazpsqiB79KpfePwTho1TTMtWxjKzA=;
 b=PI++AwxmsIzQFbNN7AeoqxVxfGGoIVL32Tgu8cq3dolDSdDDtA5ITkH9
 NaV0WvhhtIDHD205sCe1gpCF3dFcebwA4K2oQFHrxIsPVDwbOGAE4ylGE
 IqvAfnlc3hZp0789y597FBZ3EZc9ZMhjbQbmtX4TyIGLAHLr66FmDauPH
 cmBB9gnLtw5lSYq4ERQtMdnuw0VtDOq3gfW7dn8elO405lRwEr4hj8U2H
 c+Ey0nexQjLXIfF063UVP0its+zi3CiSVdch+tPW49A6Aq7jEWsLge2q3
 9bBGJ52j+cZilPwac9b09JmwGP5Xq3j0qu44d53AUlq77hxeoRQuSeVsc Q==;
X-CSE-ConnectionGUID: lqrJO2JjQ46SzIz7XouN6w==
X-CSE-MsgGUID: a1HiXpPXSUO/TUatKTfa8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="84314239"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="84314239"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:10:40 -0700
X-CSE-ConnectionGUID: lnfWowJRQJmwlU9NxuHM+g==
X-CSE-MsgGUID: yDqGnHAdRRqUZaPPET3qKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="242847761"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:10:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:10:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 01:10:39 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:10:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZF1gHy3N7dvafrRCMTBdNeK7UpeROeFB7QfcpSquC4XryrErPkjR/1Re09qNS4pISZSm+hzqUqeaNOVM/yBdqBPTimb6LBHo2GLc13bM2iLFl8ZcmDucliTr2GvTzoylfdYjTgjur9BbeEmUTuukcs2Y2DAityuNlk7iqB5+o5U5GRamEmtvaO8ja8Ekni5Gaw6AiHiurS1emdre4169+EAaet19Olxlm+IGOr26161LEF15YYK0r/l9cwZbFix1vJWPVMf27xmLfQHUiqxAkSlLdLmoX+bCVi7CZYqfrSG0L9kriVh6jjiqKJTMLzGM4Tp027b9H0Z9xefBY8ifKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+CItldCK77u8JXBq4USTzMGg3H7wXGjokkOCEAGEhs=;
 b=f9L/2v9X2FMwnj038EcqsR2DDoxdHnwSKaIO3hNyJK/Xr1vd8cvJoluGvYaPN6O5nfQ8q1n7X8fzCTRApc4oyONWh87rcTleNlgMeq2uqL4s9cwQLad5fxr5D+cmvIK8oXI3lt01BEdshNecyzz38gUnRmOdCBYQXea8/QxkcgpybQiQ00ZIFvjUSov68ZtEnxvD2BaK0cYSTJRVZntKBL9rRl1jYNpBPCtsdebiLYx4+kezsrkInSZHip7X4BHIRglsnuHDGpWMkHa68BxDHXXb3m9fdpR5lM21K7V9cj0j0kzawW0WV8Asy5nQE9jYM2r8yskNG+KcgpZGVHeEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:10:31 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 08:10:31 +0000
Message-ID: <a8d3815e-c460-4503-9ed0-03467af18d00@intel.com>
Date: Tue, 9 Jun 2026 10:10:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/6] lib/xe/xe_sriov_admin: Add SR-IOV admin exit
 cleanup restore helper
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
 <20260602141609.3941750-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260602141609.3941750-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0057.eurprd02.prod.outlook.com
 (2603:10a6:802:14::28) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: c9997a2d-c7ca-45fc-1ae8-08dec5fe932d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 1EU4rd5Cns3/KXiaXaHm2If8M1I51WI4MT8bBcbVflfAsrdXzaj8kU95D/HogoVfricHW73m4Mpu2Qehk6DAQAHidIPStbdXBisUnziXA3hU0DXW/1DNA9VHbiVFK4T7NGQ0mKRkY97TonhO/xZ/tmBe+6HrmmWSUydZwZznut7/ob4nCz7bkuvZvjAS49S031dMPUltH4Ao5UqL7xjTon9/9Ql1ef26rnZaiLlmi8bw6JBrSDWY9WbbdhaTe3e9BHBUFbC3XlVKwqL2J4rNOS2hD05kjGL627rHqW/kPDfsTbXx+GSypXk46JebUpo4flyU724AQC4mb8UL0Q1BHkZoFIj+wbxhKz6GCaSMhvzHL0iM7ORfC5L58DbnMhqPZ0maYqmu8+yAT/N/KS1QwLVOXin6T83X0X7S+e9rJ/v+5Z1OrwnvB3HP7IOFuLg0tjq7AvGq66pW8oerVCJ4fA1WL3Jaxv/xkHGsYLZNwM7Qnfahau1GbuFBSVE7kdsNDs5kpYeiTXBdFsGHTrJDjA5UXfeZcO/oUqM6bcreEa+JQKgG3q+xyPCIMfd32fkxIj4IYJO6vTB/2ggZ/YF8mdDabFlZnk3L4O87jJz7FJU7Pn3+cP+1k4e/GHJLuYf/miPJjsPjDWc7+hqVPmnand5egiHX/bBGDVXmK1xuRP1wLDpghxtRcYHUQZX/82NJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1hxTDE1ZktKQ1hweWdJZFh6emg0eTJpMVIzL2ZUYW9OZW1ibGxLQ0c1Zlhr?=
 =?utf-8?B?bFhMVWZyMlgvaC95M2xVU2NUNDA3K3VMS0FGRzVpd3pJS0ttTkNlb3l4NFlT?=
 =?utf-8?B?cFZsVDgxeXdFRDhSdm1kQ01JdGsyTjhlWHYxU0h1MVEwb0VHS2RabzFaYkJm?=
 =?utf-8?B?ZFZnQW9uU0poYWxjUUlHbXFLTGM0d3hSa0pzZFZ2NWh4YmwwUGRKQlBveGUz?=
 =?utf-8?B?dVRCcDZvYk9aV0hQbE9LSE4zYWhYS0pxNFY5QWtibGpNUzNuZGRxUCtaM0tn?=
 =?utf-8?B?RGJoMFl0WFJDbFYyeGExMlZRNXBJT1djbXMvbTE0dlpmR1FBc0s4OHZvUHV2?=
 =?utf-8?B?cWhsS1dObUVNR09RNjVHdVBuQldMZ25wZVJXTEgrQkkvS29qL2F2Nit3c1h5?=
 =?utf-8?B?bWhQdnZOdTE1MTREUUtQYlNSTXByZWVXV3BxVjNZdEVMRngxQTkvZEZGa0lE?=
 =?utf-8?B?SmhRUkJLZk4rbGdDbHc5UENhODZYWHR5RXpZam13eEptaGJMRCs5eHRNQTht?=
 =?utf-8?B?dXBZbndaUDNoZ3FvV2phZDN0TjJpRmVVcHBuUktXaVlxT0NTMHpvYzQ2aXpy?=
 =?utf-8?B?WnhBM2Zzc01hOUNGbVdDNkZLRGpEWTJ4QkMyYW96OHZtWUVqUVhHVHhLd3NL?=
 =?utf-8?B?aTdWRmN4NGVRenZYVUg3allxb3YzbkdBM2wzMmRtODN6TTZ4VW96WFJlVFU5?=
 =?utf-8?B?MDZTQkJkVHg5R0gwV0NjNlh0Rk1oSzJxMWRKSmpDRzZWMEthZVpoc3N0NjdE?=
 =?utf-8?B?ZzJZblA0TE5pKzFwcnltQnJwbGZKYTJWVy9xbVpNOUN0RHJnQytDM0FhTmhQ?=
 =?utf-8?B?blF5RGxIQnpwTGhjNFQycHpVaUdiOXd2bzBvSEpmSTBxdW1NRHN1MUhzcG1C?=
 =?utf-8?B?NjdBRFNpZ01SUW9MRy9nZ0E1M1hBOFNwUjh0Q2poRTJuNVRmRXdiNFRjeXhX?=
 =?utf-8?B?ODV0VkpuRUhzTFB3RUlWSG04MFk2eGFsTWZYeVZkbnNvRTk0ZkgxREVURk96?=
 =?utf-8?B?K09xeEdIQjZOMW1ObWo4RU9DeHptaVVDWDlnU2k0NkZ2VUU4cHFlN0k3bVpW?=
 =?utf-8?B?R093TDVPOVlqc3hPME9LRnpzdHpjMWhDRE5hRmFabVBXeGhyNmJQS3luOTZL?=
 =?utf-8?B?ZGMzeURLWTNkSmR6S05qTlkyQmM4MDhraERwKzhaRytncHpGazZGQlJ5MWts?=
 =?utf-8?B?QkFzT2VMRlZDb0d6eElEcDBHOUlHUUhuNTRzaGJXRjlqa1dmekcwQVdvczNB?=
 =?utf-8?B?N3hqUzlQa3NHWFdBT1A2QjlPN0ljeDUrdHp2MWsxVEJoYWFaSVVuTENrVmJ6?=
 =?utf-8?B?RFNnc0hQcjRKaW9tdXpmSzRJaUpNb0M2cU1UMCtQMlNzd3BNeUdkcG5jM1p1?=
 =?utf-8?B?SG81dXU5eDlYWXdUcmlDaU9wcU94bWFia09UTGt6emdLZDRMaVR4UXIveEd3?=
 =?utf-8?B?T0xpY1VjaVNkd3J2YmZTQ0t5a3ZCOHBieElGUFNQNUp1SUhzZ3dZR2VqejFX?=
 =?utf-8?B?L1pkUmI1ajRBaFJCenVXRmxSTGlNR2xIZlNlVjZXWnJObmY4eUJkQXZJczE5?=
 =?utf-8?B?NUlFcnR4YW5LRnNzWW03ZHZ1cFJwNDlxY0JpUzdVbGQraVl2UFNRekZCS2RN?=
 =?utf-8?B?YXMvSm9zV05CSGk2MkZmbmJMTzA1aTc3alUyNEljclUvWWZTS284cng2a1Ru?=
 =?utf-8?B?dE1Qc3A1dXpDRDQvejVKTVpDVUZhMGpFSy9iQ3NyNSt0cHJyVHlGSVladlpa?=
 =?utf-8?B?eVZocWcxNTc3cHkrSVBaSDkya2Z1Mnc5WjN5ajZaNDZOK2x0am9iaVAxSkdn?=
 =?utf-8?B?aTRUS2ZRbjRCMDFZbGtwdlo1QkVIaGlLMnB4OXBTSmw3WVVRVzlqaXFFQXdH?=
 =?utf-8?B?ekhPaVl0UlhKc2JLbUxTOWExTTBVVldDUUVsSDhneWlFUnlRa00rZERPMlM1?=
 =?utf-8?B?ZUJiMUMyL0gxQURkTGdKdHhqUEUrMy9uSGRFeFFldXZUK2tKNWpNNHg2Vzg1?=
 =?utf-8?B?YkptM0dtQnV4Vy9tNXM4ZmkvNmtwWEc1RVBVWFMzVmhUOGxoR3JncXBKL0NY?=
 =?utf-8?B?VFE4aVd1VWFnOTRlU3FkMG1UZmxxcFNWWVVxdWNxUTNKLy9EcmpvOTZoQ2Jj?=
 =?utf-8?B?MkN0VllhYUVFeU4zRHJYVDRYTkw5dHZEcDBiQjRoMkNRN05PNEJFQ1EyNERW?=
 =?utf-8?B?NzY2emR5RzJzMzRjazY1eTE4N1FJS1ZtTm04K01FSVdLUzBYTitxVEdFd2Z5?=
 =?utf-8?B?Mis2Z1kyMHhPQkRMU3VMdTBxRS95OUFKQzcwSWw1Q0Jnd1IrcnV6WUpWWHZP?=
 =?utf-8?B?SWo3WDVmQmNxRmtNNDFlNW1lMGs0RzUvekxKalZaT1FwMUIyYlEyQT09?=
X-Exchange-RoutingPolicyChecked: JMUxDQNam/heoqukAPBuzC/rpor6rVr1PJ+wZp5TtS10V8+B/pywk8bFDye1Mv/l3cITcXtov2N0YnFzCcbr1GV/CW3mJZiPH3RCdR6LN+ezb/Czsh7WSBXART15G0M1mUW5pw4TZQzNxClKMBsvhC1XK1PwAa5dG84EAyYvRnkFl3ej2/HfusbpZdqnmXnwI5iq4VwpgnmihXc76ZSycXTvmk8BKRGHhHruRT1UzE2W6RDKAWiXmfVLfY9zzV5z/LGnXRx8Oe0LG+ARHXXeWBdK6uuPrmxmg6j/G+kac3GWRyyJ4RuCpf6OkjM2tv5+eKFLNutLzmISNtsQ2LXLOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9997a2d-c7ca-45fc-1ae8-08dec5fe932d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:10:31.6901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkQ57Fv2P81RbuPOjigMrpip7jcqIu0jDu24akzaBZd+F2pLIE62HP/ahHTMRzBInIo1ECYJh1LVR/ML5f1FmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
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


On 6/2/2026 16:16, Marcin Bernatowicz wrote:
> Add xe_sriov_admin_exit_cleanup_restore_defaults() as a best-effort
> exit-handler callback to restore PF/VF scheduling defaults via
> bulk restore.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   lib/xe/xe_sriov_admin.c | 21 +++++++++++++++++++++
>   lib/xe/xe_sriov_admin.h |  2 ++
>   2 files changed, 23 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
> index f3be70db8..0e7ffb52d 100644
> --- a/lib/xe/xe_sriov_admin.c
> +++ b/lib/xe/xe_sriov_admin.c
> @@ -623,3 +623,24 @@ void xe_sriov_admin_bulk_restore_defaults(int pf_fd)
>   {
>   	igt_assert_eq(0, __xe_sriov_admin_bulk_restore_defaults(pf_fd));
>   }
> +
> +/**
> + * xe_sriov_admin_exit_cleanup_restore_defaults - Best-effort SR-IOV defaults restore callback
> + * @pf_fd: PF device file descriptor
> + * @sig: Exit signal number, or 0 on normal exit
> + * @user_data: Unused
> + *
> + * Callback suitable for igt_sriov_install_exit_handler() when a test modifies
> + * XE SR-IOV scheduling defaults. Restores PF and VF scheduling attributes to
> + * driver defaults. Failures are ignored so the callback remains best-effort.
> + */
> +void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig, void *user_data)
> +{
> +	(void)sig;
> +	(void)user_data;
> +
> +	if (!xe_sriov_admin_is_present(pf_fd))
> +		return;
> +
> +	(void)__xe_sriov_admin_bulk_restore_defaults(pf_fd);
> +}
> diff --git a/lib/xe/xe_sriov_admin.h b/lib/xe/xe_sriov_admin.h
> index 607e33a86..3db13c2ac 100644
> --- a/lib/xe/xe_sriov_admin.h
> +++ b/lib/xe/xe_sriov_admin.h
> @@ -56,5 +56,7 @@ int  __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
>   void  xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
>   int  __xe_sriov_admin_bulk_restore_defaults(int pf_fd);
>   void  xe_sriov_admin_bulk_restore_defaults(int pf_fd);
> +void xe_sriov_admin_exit_cleanup_restore_defaults(int pf_fd, int sig,
> +						  void *user_data);
>   
>   #endif /* __XE_SRIOV_ADMIN_H__ */

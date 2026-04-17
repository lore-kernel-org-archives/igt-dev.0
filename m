Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68C7F8E499
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 02:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6460310E1D3;
	Fri, 17 Apr 2026 02:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpWuAK3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90F410E1D3
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 02:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776391809; x=1807927809;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5My7D1oyfglFxp8vTn+oTaGwLXaNGzTlVaWEgF7yGoU=;
 b=IpWuAK3nppfIRIPk5411HU7tIKzbmU3InTe7LL6fWBg7thT0XZHheyPj
 e7UyTzhGZkC3CklS+3Ump4W1e1pptEckbcZxHls0wXRDggZ+21RLmqak0
 OYR+NI2DK32rWHnGU7ZM2aqXRjfH/2D6NAVDm02Dxb84Wn+5xR6DY/C+c
 spoIRtTr7OTOgySS4cbxam2ZTxzmQ8abwCLmp0GWmEMZKCE4YV6sU2frO
 ucUV0iHCUVFwxbJo9VaGFTLIiNziL6nwTGNia6hcgGdC7FAzHFBwWPMPO
 oLXwdLAB2+AjBFS0CvSOiRWD6UJKupE8U5Ete/8BaSdF+C0NgVO6Kf8UD A==;
X-CSE-ConnectionGUID: qFZ1ygOAQFKJJ3s9uODmlQ==
X-CSE-MsgGUID: FI+e5LeDTAyMYC7+rL8Fgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81274878"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81274878"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 19:10:09 -0700
X-CSE-ConnectionGUID: CuVFvtISQl+29TcDWpM6kg==
X-CSE-MsgGUID: yu/BRxhoTUGretVU2usVBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="230829727"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 19:10:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 19:10:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 19:10:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 19:10:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkTcqxsJAidOEF9pVNpCGLaxgEI6hKg3wVkh5XPWUr6elRGsIcPpSGmH+jkFnP9+x/CkIX6YB/9zBHCpiBW5XlXbRP/u1BbePpEuOJXrAityK6oHgEBenl65WbCD2fPDUgX2zBTq1yfGpW0Mb9nHgQ1c66atOhQcxBPjIFNUk05AyewEL0XU/XypZADzNLRUSSxnGMpV3DyvtzSRp1mxmfdAUA4QPqQFkzwqwnCvRWQscQGLUaGqtuI3eB4iQLCOgz8WV5vTCQfUTkV41978SPrOJ/F58B4HgYuL4mOJMStuFsetkixXszfYxCjaQTdNB1+9G/IjqanDjisQgv4Ung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKc8rjN89E1lbnatPvUTWUO/Hzs4/PEiFzxcRhcxZ8E=;
 b=jS7k7+c8rWuBLCNvFemuAYJ4nHA8gsLq6cgIcrN3gdgvkUanmwGWLmvhOCUFTTlKyPuhY7oksUDTct04fjlv3p30CNvcHtVz2+/QokpLz86fDy+W/8AOmV5h2J9rJWdPBJzq9rimloH3tMeRBRM3ZZKA5FlWOn8SN7fatSqUt2o69GLHUv1cXBW7hx37R0uppGbmbrKVQVx1VB5L8/TYVvlMM5dLqQEz+RJmcN641qOR6YGIK3EKv2logi6RBM27UjL4s/uc4VSdIN7bOu8kWRtkt5Ukq7hIwxproWk8qDAOTJBMX6+Oo9N9M5T+8V7JcPf8puTmeXfqDFKX6wyl7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 17 Apr
 2026 02:10:04 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 02:10:04 +0000
Message-ID: <4d5988f1-09a5-4e48-b133-2b1f2440cb5a@intel.com>
Date: Fri, 17 Apr 2026 07:39:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t] lib/xe/oa: Add support for 192B_MPEC8LL_NOA16
 OAM format
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260416184826.913464-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260416184826.913464-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::9) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: f031835c-6696-474a-9525-08de9c267024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 6ge8EkbZ58Dv8mj0xwFIYj0X5cVduFy07sGhE8u5LTDPaOYzyX+d169576bJiQdJEcL/r8Vih89An2+Sj9K0RqeSzH22yuTejYjoxU97TIlGj4PBkFu7zTsu6w7n8iX9oL/GTOO8kBxvZ4jghLMtT3NPqR4dEJhHMxAdpf/QVrUFBP1BbCTOiCzHPoCIBnBnVoeluJGP2kI/x4X1K0uGpR9DogRi1N+QukAOaTWTWresYLCfFmti0D5rk+tmn7goTGTkNRMsSk1md/Du1fbAAqukf0RaYOfCRpsldo5zDQ/gWxvecyhvzFAn3tkzXyMPAyLwWOX8dk92eV+2IVKCAbFY5GoGiucxbG5USyP/u7REN9mzjfIoYbt+h+AsNPSiObDvoLMn0m6zycu7FJ4fIIc1e94LoV7lLgx4jmA6CgSBdk4hdvaYkhQWlbBKhfktHOHo8HtUChoJ+9/iEB3AjsOmYUsHfMANsaLZytA3ankK7C4VFisQs7ORn+fuA8lm1oCHWXX3cvCjFyrPjU0XcX7E04iQLDBKQJtdVI5KQwNUyHiha6CC6lnocL6iFkVHQVRxw14FyhuALAaEEHfaisfkJbNoYSy3vVNAjJ+FpglDIRJcIQK0o148TuSrVUjOzt2iBklpr9VssWOlaPmIQ43hhYiCitEYrbcGnVsjMYEiGOipbT8Z04pFkUDZcbhhj7zwv7BbcvBIxUcjPMuOh9szMBvG9QJPDLD4mml/sDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlFidlZPTUVLeVJJT3Exa2pQcHF6QVRyK0dLcnNsQ3VxZzBBNnorSGZMWks3?=
 =?utf-8?B?azlQV2dNOGNyTE1ObjkrWDA3S0thWkorcXdjdS84Um1hSjBSaDFwWXBvbjRH?=
 =?utf-8?B?bzNYVFA0b3ZjRE1yTEt1MEJvYitSaTNYVFI1TlZIZnp1dHlwOThWNXQrVVlo?=
 =?utf-8?B?UVBEamJyZzNyVUh3d2hiTnIraFRJcU0xN1orMFllWW9EMXNYNG5FamNoQm85?=
 =?utf-8?B?YXJiOWtHbWdSazFBd2lPUHN0OVdydC9tQTl6d0p1N1JSUmk0bW50WmkzZTB3?=
 =?utf-8?B?OTl3dGtSV0JONk1UWC9ZNGZ5NzBpYUpzbnYxK2w0QStQeFJkSmI5MEN3WldW?=
 =?utf-8?B?OGx6dlNPVmhVaVRPZEVzSlVjZm8vQzgxVUFtMWZ6eHJxdTFBaERZcHlCdVRK?=
 =?utf-8?B?eVdTYXdHYjNLWS93OGxPQVJ0cVArNDh4MnVLaERobXlVWmVlK2xJNjlvQlkr?=
 =?utf-8?B?VE9TZEdTaVVjQkNiTUNXazFITmRXSjVkelF0MzdsNng2QVhzYUoxUWQwTnJU?=
 =?utf-8?B?L083Q2VWS2xNbXJmZTY1TGVjODJob1IwZ3Rpa1h2dmJZc290VE9oRlV1TFZC?=
 =?utf-8?B?RFFIY2NxeEpvZ09qcmJUUE5xTXliUDVSejV3d21nSm4zell4NCtzcnBCZlZh?=
 =?utf-8?B?R0tGWHNTMzlvNDFJUnBUQWZWWFBUZ0JIQnVqSVhPT01pUis4eDIxdWN6NHVF?=
 =?utf-8?B?NmJKYUx5TXVNOXVTY2o5L0ppL2hYaW95YXJxUmxBd201dXlCdDFLSDBaZFRo?=
 =?utf-8?B?dDdvUnZIMGZLd1h6RnVhOWdwaHVKZ29jRzJwMVNVVkVZcHpTZGkyeUZtaUpl?=
 =?utf-8?B?VTNERkdLMDJDbTRPSEVVUGJCYUF0eHAvRXIxajVXUXBIRmZ0NlhZakczbDUz?=
 =?utf-8?B?ZkhCNm1HblVJd1V3RHQwV2hVSmI5V013ZUdKSnMyNm56bWJEQmV6a2xEWmt2?=
 =?utf-8?B?NUpkUjZ2STRVZ1UvUHA2cGpXb1J6Qnh4VnpRZUgwa0dPUkFBVnlzQ0RIRm16?=
 =?utf-8?B?bnc5VmtpYkNSVU1xS0JqY0x3eTM2QSt5ZGp2b1F5MDhlNnY2YTQwS1p5SHgr?=
 =?utf-8?B?c29NYWx0VTh2ZHNXUkpOT3FxVkRMTDM4RHdmOWt0WnllWGdiMTBnM2JBcHlM?=
 =?utf-8?B?NlZLRHVxZ2FOazArOWR6azZFeXJyblByUjhZRmQ5QzIxS0JQWUZGcndVQlho?=
 =?utf-8?B?SkZkMDZrR09WQ1Bvdzg2Ym95T0hqVHV2NzB2OWNQeTRTOEU4NzR1K2lsbURT?=
 =?utf-8?B?SUZNbGpjWmV4bWIwUmNUQWttVzFmODhEbzhKM05ad01pVUNSNjVPODVmYXVM?=
 =?utf-8?B?WnhnS2toaCtBNEduTG92Y0xhck8vcXd3U2ZJTUJJZmdscHV1YTA4NGl3OVd4?=
 =?utf-8?B?NVRTRlR2alhDQVpLcHVTcHdtSG55WlFHcXBnQlIrT0pGZHEzVDVISUN6NWtW?=
 =?utf-8?B?U2ozdEo1UHdSRW01Wmk5WHAwaFF1UlcwRUlZV0Qvbk9BQi80ZjBmUEpEVDE0?=
 =?utf-8?B?SnZKQjFTWkdERW5Ed2x2bzNtcUJ4aDVlOWt1dGVhMEVCaC9XMFFJVUlVT091?=
 =?utf-8?B?Nm5EOHVIOXVVd1lUSXRjR004ZnovL3YwL1dKS3BOSngxRlZvclZ5YlZlVU02?=
 =?utf-8?B?WVFEdEFIbnJHeE1kb3dXV05vdzVsYlVBWWp1RUk4OVhFQkJXZGlaTXRKZmpn?=
 =?utf-8?B?UStraUdjdG45OVhFVHAwcHpaTVRIWlBNa2JXbm9YT25KRzAxaVpXU1QyV1Ns?=
 =?utf-8?B?MW5yVkRmY3RwY3g0WVNyN293VklmUGhpbWtuRlRjbExFYWpiVkduUE1GTFkv?=
 =?utf-8?B?ZDBrUkI1a0tlaWY5MlBnbWxySlY3b0FqU3kzK1hlOWFUNlZSM0M1SzBEdHhs?=
 =?utf-8?B?N0o2QW5sc25kenZuRDI5TW9ia3R6S2M3ZjF3MnU3NDQ4TDhaRW0zV1RrdG1O?=
 =?utf-8?B?akVUSFNDSFFpM0hsSHllT0xzRGJyeGtsU20yUXpjdEhFbTFJVFRTVHpVOFNt?=
 =?utf-8?B?eTlsNklWWUZ2MEUwSkNtZGVaSUxsU1JqM1hyTHhLU3I3NFE3dEFBME15YmMw?=
 =?utf-8?B?dmZrVUZFMkF3c3RhUDZqdEE1NjVtd2NMd1FRQldsZHZLdGNZNHV5clFXSDBi?=
 =?utf-8?B?RW1zc3lhM0UwaHNTQjR2VXJmbVV0SmNiem1sWTdCWVk1TmFQSmxPRyttUmdF?=
 =?utf-8?B?SEZzUHluUG5Lc09sUnZ0Tm96b3pTVkZSTWluZDByaGk2YlpPdDIrYVF3SEIy?=
 =?utf-8?B?SnlvWE5oRjUwZFJzRWlQbExlKzRUQ2tXNU5XVVJuWDNobTFadHZJQzNpdndv?=
 =?utf-8?B?WG9sdlBmdFNqZTRvUGhLSDZIYUlGZFJ0U3VBMFRnMzkwV2RFQXFDQlBUaFRD?=
 =?utf-8?Q?MJZHX+SRgf4Sy2U4=3D?=
X-Exchange-RoutingPolicyChecked: lK1giDui/6LMAvzfEjy8JzHHuxPPAJEwXXmoX0VLZWVGquQA4hbp+mXC5Cuw+4ZQIqddm7dE8n/4GqcJELirCyHlzb4UwNXE8sQ5UKfhEFLY8LxCe0n/TGXMDIfOPgFemtQpkoByLcEQLNaaZySlM0d6Qy32hp/7vlv0rhvW6E/gcvGhUaGCOmE6XkKqmcDo3+CVV+6trpHkOgnWcv7SwD8uV+ivjGgCZ+02a0wzMkTYLYLJOTBQTihyZlW49Ei6sOKT5g7PL6DTAJEDtCVxy9QvH2ufzMS3YwTzv2zf8TgQ7iMZmnb5XuTXpddi+29HXDLIrOhf4Av89++ysbDqxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f031835c-6696-474a-9525-08de9c267024
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 02:10:04.1655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IkddyPfm3VxEMenP9ioiXJ4gPW3QOZQb6atKHA1NeMB6Zx+ZJJ4XkdcdxcbQKjyxKPKsbhuuN/HJ/nIsCrU4cRbea5XaqFCe3MaGv0h+7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
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


On 4/17/2026 0:18, Ashutosh Dixit wrote:
> Support for CRI 192B_MPEC8LL_NOA16 OAM format was previously missed
> out. Add it.
>
> v2: Fix B/C counter accumulation (Shekhar C)
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   lib/xe/oa-configs/oa-metricset-codegen.py | 13 +++++++++++-
>   lib/xe/xe_oa.c                            | 24 +++++++++++++++++++++++
>   2 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
> index c5c7a2c8d4..b44d4d73af 100644
The patch itself makes sense now. But there's one change missing in 2 
places. The function "intel_xe_perf_read_record_timestamp" and 
"intel_xe_perf_read_record_timestamp_raw" both need this new format 
recognised there else they'll still fallback to "assert(0)".

Other than that, this looks fine and we can merge it after that.

-shekhar

> --- a/lib/xe/oa-configs/oa-metricset-codegen.py
> +++ b/lib/xe/oa-configs/oa-metricset-codegen.py
> @@ -139,7 +139,7 @@ def generate_metric_sets(args, gen):
>                       metric_set->perfcnt_offset = metric_set->c_offset + 8;
>                   """))
>           elif gen.chipset == "lnl" or gen.chipset == "bmg" or gen.chipset == "ptl" or gen.chipset == "cri":
> -            # See intel_xe_perf_accumulate_reports for the offsets
> +            # See intel_xe_perf_accumulate_reports for the offsets (value of idx variable)
>               if set.oa_format == "128B_MPEC8_NOA16" or set.oa_format == "128B_MERT_PEC8":
>                   c(textwrap.dedent("""\
>                       metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u32_B8_C8;
> @@ -151,6 +151,17 @@ def generate_metric_sets(args, gen):
>                       metric_set->b_offset = metric_set->pec_offset + 8;
>                       metric_set->c_offset = metric_set->b_offset + 8;
>                   """))
> +            elif set.oa_format == "192B_MPEC8LL_NOA16":
> +                c(textwrap.dedent("""\
> +                    metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u64_B8_C8;
> +
> +                    metric_set->perf_raw_size = 192;
> +                    metric_set->gpu_time_offset = 0;
> +                    metric_set->gpu_clock_offset = 1;
> +                    metric_set->pec_offset = 2;
> +                    metric_set->b_offset = metric_set->pec_offset + 8;
> +                    metric_set->c_offset = metric_set->b_offset + 8;
> +                """))
>               else:
>                   c(textwrap.dedent("""\
>                       metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
> diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
> index b2f447c944..b7be64cc3f 100644
> --- a/lib/xe/xe_oa.c
> +++ b/lib/xe/xe_oa.c
> @@ -875,6 +875,30 @@ void intel_xe_perf_accumulate_reports(struct intel_xe_perf_accumulator *acc,
>   
>   		break;
>   
> +	case XE_OAM_FORMAT_MPEC8u64_B8_C8:
> +		/* 64 bit timestamp */
> +		if (perf->devinfo.oa_timestamp_shift >= 0)
> +			deltas[idx++] += (end64[1] - start64[1]) << perf->devinfo.oa_timestamp_shift;
> +		else
> +			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
> +
> +		/* 64 bit clock */
> +		deltas[idx++] += end64[3] - start64[3];
> +
> +		/* 8x 64bit MPEC counters */
> +		for (i = 0; i < 8; i++)
> +			deltas[idx++] += end64[4 + i] - start64[4 + i];
> +
> +		/* 8x 32bit B counters */
> +		for (i = 0; i < 8; i++)
> +			accumulate_uint32(start + 24 + i, end + 24 + i, deltas + idx++);
> +
> +		/* 8x 32bit C counters */
> +		for (i = 0; i < 8; i++)
> +			accumulate_uint32(start + 32 + i, end + 32 + i, deltas + idx++);
> +
> +		break;
> +
>   	case XE_OA_FORMAT_PEC64u64:
>   		/* 64 bit timestamp */
>   		if (perf->devinfo.oa_timestamp_shift >= 0)

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation


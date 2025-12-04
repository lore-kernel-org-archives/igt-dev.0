Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344A4D2A532
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E009110E223;
	Thu,  4 Dec 2025 21:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8/7q3yr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D42310E223
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764883735; x=1796419735;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZHUE7s1Rj9Yr7SWHgANutzp4jJXZmsiCf4OY2OZI1hc=;
 b=n8/7q3yrv6cprDXMC0KHYUihS4K6JcJWzejXpJ493iLs+LRfTW0X0iEv
 v6X3NhKiFIiPLVnFa4dVVKIqF0MMd7hKdyD8PWxk8tOlU8+jayIWs6dvd
 pfNQrNKXRgK8I/jLXaBQrrNVT+VI/K/QQdiFj6sFrsUCYe7zMZwG1dicW
 MT9r+vEZBLZluAdb6PMkGjKecyCVEJcEW5ZL+aHYVPd0GrDnHH2Ry4QGB
 LXZzOTo9beQ5p6Tc7oGYcq7SQyJtMU5EeaG+KKPc6TxqyWm+N7eyjKIzK
 REwWfvi4SMUh3hXXeBlKCPvwMk2Ig06yqxU18MF8HCVwwqJ2GEFLFDORz w==;
X-CSE-ConnectionGUID: P+N5QRN5SS+1YK1YkZ4Xww==
X-CSE-MsgGUID: UTaXLZFnRVun1gtfY5Rxcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66877702"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66877702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:28:54 -0800
X-CSE-ConnectionGUID: ZR1zO22rREe8iV93mGoTAQ==
X-CSE-MsgGUID: hWiXnuALRyqSlNw6wF2WiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194753388"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:28:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:28:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:28:53 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:28:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zW8XWVbtp9wbSOGMr0GfXT58Zw1k4dcapjtB7yTgHCYIp1+QC6BPwLZW0tEn11V6HFtqLSe7F+OnHSYw4LdqDne9yirlefF9C0PFAxs7XMoLcYZ0Zzw0da9/V5Z7Cv6RC9bcjd/sX/dONCR0bdnsH8MAYml4clWMfi50iPSL3SHVneZl4GGcEUrhwbkjvO3sd+PWSkWEkSWUN+aBVTs9r3S2vEEK6Ul1zj4g8xyajmAC5oOBE105Wo6HPPWnGCyuI8kdib4XCKi5YBRKIZwnYMXgcOdF+VuuMHQat8pSiCDbYwvM3DuD0HeHAZCTc099YGCMilcpXj1r0hTlSXNb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbMZPAcYJ2OX13HuzkiN2m6MFh45DpthD6ETgYd9OZY=;
 b=w2uKgPTL2lSJWFY2twpjtVnkHz6M7c7Qiur6cxy8Dd8puC0T9aL5/PKpJ704KBCqQPJHPU/UBWNtoUf9gangQt+Jw8M8qwRd4ClFT2toOJYwOEDOnvN1kPbRtsyMU41EeLO6hyjHKz8MTXWpd2kbjpQJ9L3MnOKjiP6gHUBTCywu5Tx3YdOKyH/2rXZvfs/gGn+MT9TtQOMm/mZptC2F9Vty6evmusz4DWgkyBM+jpXfS5lmVzT/DJFai/RvhiJhCo8+Ipb0i+m7pUr45wLtNyJYY9WVjMdAWiHbS9e7FnWEq4WIxRaWJRkLcxaIZFLToo4Rt4LCXX3LSGRT61YjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Thu, 4 Dec
 2025 21:28:51 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:28:51 +0000
Date: Thu, 4 Dec 2025 13:28:48 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 16/19] tests/intel/xe_exec_multi_queue: Add submission
 sanity test
Message-ID: <aTH9EGpg5v1iRfKU@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-37-niranjana.vishwanathapura@intel.com>
 <04e4d61c99e2496c4ba288fcd551fb2de416282e.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04e4d61c99e2496c4ba288fcd551fb2de416282e.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ead225-2774-48dd-978b-08de337c1e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LLYaGfqDkfccKy+Tr0XjfpicoigKfUdwyVmXLFiCJmfYNnY/hjGyJPzoFf?=
 =?iso-8859-1?Q?j9kNgwjqCfJ2uAe2JSBc87aXDfOd+mirWWa/iZNPyey8iS14Pd/XDcMA/I?=
 =?iso-8859-1?Q?D6ok5TuXa5yNg2sRO2R2H0e9aLQFvatv3iSCAdqSLNiOSKDzUG2bFc2GKF?=
 =?iso-8859-1?Q?pRqrPPmlJuN99VtYqko002GVKYoKTYz8T8xE77xmLDpTGKl1ZtOcRz21L6?=
 =?iso-8859-1?Q?AOg2OIlXbqQzhjTZWKo2b7gtRrYMXp2vYEsG/f/agyHbcdWbrNfLWELxrs?=
 =?iso-8859-1?Q?p7fBt+DbaIXZDcYOr0OeBDkKWAnhmEUHPG0c9q0R8tLsjjt2u7KPwE1v/K?=
 =?iso-8859-1?Q?26zhvfa6Vhx0EN+/qjLZfqrNfdo06No2+JVT7Z0i/J2JGbRqj0XUgpCl9n?=
 =?iso-8859-1?Q?CUNOfCwO2cUUsR2tLszEW14eCQtnvmAGGcYfce1fRypSueFhvxAkJm+GVF?=
 =?iso-8859-1?Q?uTaqwdQBOIReemnATygbEtC116XDOdO4bfSoGo4iFgA5of+v27YX3kNNOG?=
 =?iso-8859-1?Q?WTurjTvj8ZLoI19uFC19GpQmu67zhjE59kUMHxHJptYmxWnb7VZK/LmwP4?=
 =?iso-8859-1?Q?Zmzf9yG8EhA/CvXjRTomcblBqMc19XxBfXpC7K3F4xaLSco2USzspSX7jt?=
 =?iso-8859-1?Q?dN/t5wnfmpRCj+Ovk6Xw6390PCkFuozaWPzaw0kNmb4haBjQNQvQQUqwGd?=
 =?iso-8859-1?Q?spS77VrGVj+S2DOjjbTQot4zTq1rMdO0/7ELgQgvU3LAanG/0zBJ6nHWVI?=
 =?iso-8859-1?Q?Z73fkQJThM3VsqeThui/HMxV+a7/XcgfyL8WMiwq4zIKAxyCaymNuCmnun?=
 =?iso-8859-1?Q?t2Imc/9bTkFHvaVl/CcFd9ZElFwQMroc/oWe+cRqiYKWFpWapnoyKm6LgJ?=
 =?iso-8859-1?Q?k5By5tjvAV3/BmujlZowxBGvIqt9YW1Z/So0yCh84ebdYjelcITV34QJ0B?=
 =?iso-8859-1?Q?JEdb6U3/fbmb56vvmU0ncz2nayKSi9l87Lu6todEKmPAI9P0GqAQAEQatV?=
 =?iso-8859-1?Q?SSKfLETX9czyc75MzCCyNtUdIdcI8XZMmllYmlKw9AQHcnWGWy9t0MgbaU?=
 =?iso-8859-1?Q?iEA0ZCIwbCtmCnPC9C1ngm8/FKnIcn2CTYDok/d6My8AtbanK/v0YRfcDg?=
 =?iso-8859-1?Q?UXKZurFgUn6YoqAdEMH0z90rdcDffMj8m6Ltce8qRZtbzzUCMBGHa82zBC?=
 =?iso-8859-1?Q?+yjK85p0FJTrv6vpkOfUTlvy4irOVuWDf8fgFZoSSIwBqqY9b6ruR8/Vzj?=
 =?iso-8859-1?Q?UzecLK7puXDKfMp9gVCGOZ9deomvS51Qv5lOtOh1o90Tcan3pBuf7XW0yK?=
 =?iso-8859-1?Q?meEA/YBUwhl0k4CJuiMVBnRzOYLSQQcB2QO9tBhgKsebJo5S4u6nxV8nZP?=
 =?iso-8859-1?Q?FPuddbnxJURwNAhye11fTan7OP2RjzubAv9UwRSHoFvG3QxS5yEruo7G2m?=
 =?iso-8859-1?Q?SN9gQ08vA3x8VPfxHNlME32MyA4JLDkTmBHahAM1EnQ2FLR4XH+p0NZEiO?=
 =?iso-8859-1?Q?LTTi6vmMem6EbsvN6+izkd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EP+D55+r0G/WLasRqfrRFHsh0n7ICYarPfxACqDUz7ECsKYa1OiC40vP31?=
 =?iso-8859-1?Q?AFMhMbEFSUxqTfyQGSLaqpuTxmTtX7ayNGrsFFPxprFTZ4PMaF/I43GTKy?=
 =?iso-8859-1?Q?/MbW44eHXZMJLatuOnb+g5Jf9OJ+G6mMhFsXc1ZpigLJGZfibR/A2PlNGW?=
 =?iso-8859-1?Q?2Jpuv/K1XWI/OegC/p7YB5LvJypRYkNkbnEcS/eqs1+mizdG+sj/51q0eS?=
 =?iso-8859-1?Q?0cXtoDz9y0pF4l/GBc11Wiky4OOj4dgxiiut+baNrNRBCsBf0S8wT/OjUB?=
 =?iso-8859-1?Q?TZ41ipOMv+kRmcm7WZp7euHiAklF+dps7Ngob3A9ioGLxyLtbHeLb50dYZ?=
 =?iso-8859-1?Q?/N64ax48gfEmCH85X5GO7cFpt1abjNI4I30mIu0Ko7kv7+qTLDsw94ANn7?=
 =?iso-8859-1?Q?PgFibXO/PvZU/tmVEwNapvwFiraLfWykacpnIH0awAGBYTHZyeRpZXbkMo?=
 =?iso-8859-1?Q?rIoHPSAkgg0kkyuC422EADF669kl4AWlEcG6CAYl6q0310OjfeBCjdavhS?=
 =?iso-8859-1?Q?85IX0kiRWiI6sDnvXM6E+I/EoIh/5E5lJs/6jx9tLcfQT47l75OfcGl8+T?=
 =?iso-8859-1?Q?GbAV5bW07PRCOouflo3zdryWaHQglmbn5K4zH9J8xGcwdZmtL7wsyOnIzx?=
 =?iso-8859-1?Q?rBUF/80UDLpHojEIQ+Vu3lU9prvg0Pr8zpIKy+vRiCv6VSDUrWYIsiwm31?=
 =?iso-8859-1?Q?tDdhX2cW+UzF3bebVY4rgxwcnFXC3Isnd2ww4wZ4YYSNrRzumo78tdF9rB?=
 =?iso-8859-1?Q?fFrLee5nP4Axca+rTAaowIbD47Pm27IpB23RH3nIEY9YRBlYyIQGeo5S4x?=
 =?iso-8859-1?Q?EveH+ZPIwUnwWpwj+/npYscgfvYWTVcF/XGjz1tgh8gPZvpOFAQw1H+u8k?=
 =?iso-8859-1?Q?ZgF5cMosamD3C+KiSlNvfKlZza6tD/NMjoBsQouvBF/luHbObw0VzJSMPZ?=
 =?iso-8859-1?Q?BLH6JUPw2juNfa+qzyNoXUrxh96SwNnz/6+8y/6mnCeZSoLA8RVZLHFy2M?=
 =?iso-8859-1?Q?uTGuztHuNQk/EA3r6rM/X6fXMJg3cxOwaKG3CjcLUBQJVtTRChNGRpfmPy?=
 =?iso-8859-1?Q?3XMxdmmVd82txMJUcEplYxQorXTUNVNgOOZSzJE01ou3TE7IbP0Zp2QtJV?=
 =?iso-8859-1?Q?uBOXw1fovtuMnZeVvHIjpBKl4JpRpwUs7oqK8f8lWc6mNhERS0AkDLlqsk?=
 =?iso-8859-1?Q?f/QdQ4f/mmF5K3bFKaUcFISFUkuRVJmTO/OonJ2k8QHjWRWuzcydeNY3Vg?=
 =?iso-8859-1?Q?ubt0BdeBQS9LaRAO8fESXx6KGfBsCNVEtolJz0m64Tpor4Czk/rlG0U18g?=
 =?iso-8859-1?Q?x/jt358TuuX32QE4Qk/ovuE1E5lUVoTFNua+P12ogv+LLlCgz8SN93QQuy?=
 =?iso-8859-1?Q?ounx9dCipGc09QuoHmSsSrfXjqq6ismEMT6UOgFbU7hGFEY4TV+esoKO8x?=
 =?iso-8859-1?Q?P1NmGYlp0Gorpj43+O4AwcJh+QQibwJ+2eEu9BUk7dEbxV8Ky2LRaaYU4X?=
 =?iso-8859-1?Q?4/5S6oMRPmYdu0Ij3V8K+g7C2wEMGgDOlj/7CzBFkGkpTyPBrKQPzAaDer?=
 =?iso-8859-1?Q?15Rc7jvUt+uPnFXGqElIyMLuKrzOvZHTaco9bd7GZKySMSFuWeW77eJQyc?=
 =?iso-8859-1?Q?lNmRlROVC3j+4xyEZLxIY0OwR6hIbG5YwD63DEq+C83fV1FNfZJP2Fgy5f?=
 =?iso-8859-1?Q?uGviPVhx3l+Vpt0BH5A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ead225-2774-48dd-978b-08de337c1e65
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:28:51.3291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBWagIrhV9guHSb+aPs8eI6P5Ej4+Q30jCUDOdajXNcHvsDzogAz1JGomh06KD1ZAjU6tsBw8IhJCpDg0tv62G6z3WwdzG4HPy2DiHyO7cOMFh2IJP47kLa2x+uCpyK3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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

On Thu, Dec 04, 2025 at 01:08:06PM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> Add sanity test involving exec submissions in multi queue group.
>>
>> v2: Remove simulation related code (Priyanka)
>>     Use BASE_ADDRESS macro for address (Sai)
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 139
>> ++++++++++++++++++++++++++++++
>>  1 file changed, 139 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index 06e898a47..9f7b3b4d7 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -44,6 +44,9 @@
>>  
>>  #define BASE_ADDRESS   0x1a0000
>>  
>> +/* Number of queues in exec sanity tests */
>> +#define NUM_QUEUES             2
>> +
>>  static void
>>  __test_sanity(int fd, int gt, int class, bool preempt_mode)
>>  {
>> @@ -216,6 +219,138 @@ test_sanity(int fd, int gt, int class)
>>         __test_sanity(fd, gt, class, true);
>>  }
>>  
>> +static void
>> +__test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci,
>> unsigned int flags)
>> +{
>> +#define USER_FENCE_VALUE       0xdeadbeefdeadbeefull
>> +       struct drm_xe_sync sync = { };
>> +       struct drm_xe_exec exec = {
>> +               .num_batch_buffer = 1,
>> +               .num_syncs = 1,
>> +               .syncs = to_user_pointer(&sync),
>> +       };
>> +       uint64_t vm_sync = 0, addr[NUM_QUEUES];
>> +       uint32_t vm, exec_queues[NUM_QUEUES], bo[NUM_QUEUES];
>> +       int64_t fence_timeout = NSEC_PER_SEC;
>> +       struct xe_spin *spin[NUM_QUEUES];
>> +       size_t bo_size;
>> +       struct drm_xe_ext_set_property multi_queue = {
>> +               .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +               .property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> +               .value = DRM_XE_MULTI_GROUP_CREATE,
>> +       };
>> +       uint64_t ext = to_user_pointer(&multi_queue);
>> +       bool preempt_mode = flags & PREEMPT_MODE;
>> +       int i;
>> +
>> +       sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
>> +       if (preempt_mode) {
>> +               sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
>> +               sync.timeline_value = USER_FENCE_VALUE;
>> +       } else {
>> +               sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>> +               sync.handle = syncobj_create(fd, 0);
>> +       }
>> +
>> +       vm = xe_vm_create(fd, preempt_mode ?
>> DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>> +       bo_size = xe_bb_size(fd, sizeof(struct xe_spin));
>> +
>> +       for (i = 0; i < NUM_QUEUES; i++) {
>> +               bo[i] = xe_bo_create(fd, vm, bo_size,
>> vram_if_possible(fd, eci[0].gt_id),
>> +                                   
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +               spin[i] = xe_bo_map(fd, bo[i], bo_size);
>> +               exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>> ext);
>> +               if (i == 0)
>> +                       multi_queue.value = exec_queues[i];
>> +
>> +               addr[i] = BASE_ADDRESS + i * bo_size;
>> +       }
>> +
>> +       if (preempt_mode)
>> +               sync.addr = to_user_pointer(&vm_sync);
>> +
>> +       for (i = 0; i < NUM_QUEUES; i++) {
>> +               xe_vm_bind_async(fd, vm, 0, bo[i], 0, addr[i],
>> bo_size, &sync, 1);
>> +               if (preempt_mode) {
>> +                       xe_wait_ufence(fd, &vm_sync,
>> USER_FENCE_VALUE, 0, fence_timeout);
>> +                       vm_sync = 0;
>> +               } else {
>> +                       igt_assert(syncobj_wait(fd, &sync.handle, 1,
>> INT64_MAX, 0, NULL));
>> +                       syncobj_reset(fd, &sync.handle, 1);
>> +               }
>> +       }
>> +
>> +       /* Validate job submission on secondary queue before primary
>> queue */
>> +       for (i = 1; i >= 0; i--) {
>
>for i = NUM_QUEUES = 1
>
>In case we ever need to increase this?
>

Yah, will fix.

Niranjana

>Looks good otherwise:
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>
>> +               xe_spin_init_opts(spin[i], .addr = addr[i]);
>> +               if (preempt_mode)
>> +                       sync.addr = addr[i] + (char *)&spin[i]-
>> >exec_sync - (char *)spin[i];
>> +
>> +               exec.exec_queue_id = exec_queues[i];
>> +               exec.address = addr[i];
>> +               xe_exec(fd, &exec);
>> +               xe_spin_wait_started(spin[i]);
>> +               xe_spin_end(spin[i]);
>> +               if (preempt_mode) {
>> +                       xe_wait_ufence(fd, &spin[i]->exec_sync,
>> USER_FENCE_VALUE, exec_queues[i], fence_timeout);
>> +               } else {
>> +                       igt_assert(syncobj_wait(fd, &sync.handle, 1,
>> INT64_MAX, 0, NULL));
>> +                       syncobj_reset(fd, &sync.handle, 1);
>> +               }
>> +       }
>> +
>> +       /* Destroy primary queue */
>> +       xe_exec_queue_destroy(fd, exec_queues[0]);
>> +
>> +       /* Validate submission on secondary queues fail after
>> destroying the primary */
>> +       xe_spin_init_opts(spin[1], .addr = addr[1]);
>> +       if (preempt_mode)
>> +               sync.addr = addr[1] + (char *)&spin[1]->exec_sync -
>> (char *)spin[1];
>> +
>> +       exec.exec_queue_id = exec_queues[1];
>> +       exec.address = addr[1];
>> +       igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>> +
>> +       if (preempt_mode)
>> +               sync.addr = to_user_pointer(&vm_sync);
>> +
>> +       for (i = 0; i < NUM_QUEUES; i++) {
>> +               xe_vm_unbind_async(fd, vm, 0, 0, addr[i], bo_size,
>> &sync, 1);
>> +               if (preempt_mode) {
>> +                       xe_wait_ufence(fd, &vm_sync,
>> USER_FENCE_VALUE, 0, fence_timeout);
>> +                       vm_sync = 0;
>> +               } else {
>> +                       igt_assert(syncobj_wait(fd, &sync.handle, 1,
>> INT64_MAX, 0, NULL));
>> +                       syncobj_reset(fd, &sync.handle, 1);
>> +               }
>> +       }
>> +
>> +       /* Destroy secondary queue */
>> +       xe_exec_queue_destroy(fd, exec_queues[1]);
>> +
>> +       for (i = 0; i < NUM_QUEUES; i++) {
>> +               munmap(spin[i], bo_size);
>> +               gem_close(fd, bo[i]);
>> +       }
>> +
>> +       if (!preempt_mode)
>> +               syncobj_destroy(fd, sync.handle);
>> +
>> +       xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: exec-sanity
>> + * Description: Run exec submission sanity tests
>> + * Test category: functionality test
>> + */
>> +static void
>> +test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci)
>> +{
>> +       __test_exec_sanity(fd, eci, 0);
>> +       __test_exec_sanity(fd, eci, PREEMPT_MODE);
>> +}
>> +
>>  static void
>>  __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>>                 unsigned int flags)
>> @@ -901,6 +1036,10 @@ igt_main
>>                         xe_for_each_multi_queue_engine_class(class)
>>                                 test_sanity(fd, gt, class);
>>  
>> +       igt_subtest_f("exec-sanity")
>> +               xe_for_each_multi_queue_engine(fd, hwe)
>> +                       test_exec_sanity(fd, hwe);
>> +
>>         igt_subtest_f("virtual")
>>                 xe_for_each_gt(fd, gt)
>>                         xe_for_each_multi_queue_engine_class(class)
>

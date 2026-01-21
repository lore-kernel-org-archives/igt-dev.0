Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8851DD262B3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE4510E1A6;
	Wed, 21 Jan 2026 02:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/DULdEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4FB10E1A6
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768961222; x=1800497222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NvkJoEkE+NqD3FJrc5att3CSM2qHyPHybOWpOO27YzA=;
 b=T/DULdECSMiTD/7UaQXVrgb9VARsFfMrghCnNof4Gu4E+3bsiFBt/qoI
 hKoDToFSZuuBQ7fMzUCw8osan1oj/h8EraqP8wolur2jXuX8nXAEO6ZA1
 a8er70up8oSPgZUSmE89yCOE6PREAB0k0Aaq8aP41vpL7+rVW+zZ4N70/
 BsJ7khW/fwL17OfPVREa+qgf8n79ImUhrW/F5xc/yrZsLf/rFcFBosGB0
 9HdAws+eJ7zKI3Iga6lBuMJT7Jw4dVQvYAV0qLFttintIxYBLrpsxVqgq
 ing6PNQoKLAos8vvCutychmw0iav00dQB9IFqFSeYU7ZhzOsHO6oBp5LV g==;
X-CSE-ConnectionGUID: Z5/Ujgg0TpKJNOGT0AvOZw==
X-CSE-MsgGUID: UzEUTCyXRAqM1JJbme32mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69381241"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="69381241"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:07:02 -0800
X-CSE-ConnectionGUID: U42d1d+uQKyxncdEW1a7fQ==
X-CSE-MsgGUID: ju/jL+qKQ8eU426qdblhzg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:07:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:07:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:07:00 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:07:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epeOzMuYxVzTliaITxtI0dfzjaB/xl4TQe9xQxmL44USYBtR6wV3AdQXqYDtz7PG3D0+OMyHrR+mw+y5aK2bYUABTug4Xh8ltS29tfZMc0IHGVQ5RfVukP4YIygU4x6ZaDYtLxt7ifWfkxrKZkk9iWRueUDEckk3YnV+5gztPg7LKQy6++45BFCZAHBg7+t0f+Koobn3spjGSWIvrrMEcwxpI+Hk/uDukT5/NryYoOTuASuxT2XWaX+/mbo15iNnKb5lfQSChjhssgR3g8gMA0YDtaycAgCfejRvRKfzwEdZUWE0kxIYmQDrooa+gNGHDG8SsyYlPclZ0QFIdNeoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHx+IJ919/+2btMLxeBZ1eXTZV6mXCG0AJuTGuwViVw=;
 b=sUIjgOJ9K3bSDpQhgjceQiHr+JbUwDc6IgTPNwaIuuQDab4Kv5Ls0mC4es/leeZPebyl2uxMp9OlWNNUcJ0Ki5RckkfUJDn2vnXRfSIEEXlJKQmB/6aoFC4snjl3rtIWQP0SooteR43kM/D2McdR0vYb/vHJXoIHPlXwZA1q67WxHBI7rR9f0rleqJmaxsCQv67UE5zYFYb9S5Exot6L9zA+rPHdqOSih1Q/puGThQICNjQiagIcpqyS18ZVgr3rd9SbYpO+1oteDEWX9QSDwfja1gIRZy0b/K4GIhm+q5K0gpQnqeqV5usTnCirYcYVjv+McIUkuOoYubulr8TyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Wed, 21 Jan
 2026 02:06:58 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 02:06:57 +0000
Date: Tue, 20 Jan 2026 18:06:54 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH i-g-t 1/9] tests/intel/xe_exec_fault_mode: Add
 multi-queue test support
Message-ID: <aXA0vibRIwHa8gIh@nvishwa1-desk>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
 <20260114065925.197958-2-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260114065925.197958-2-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e55617-3cad-4be8-b507-08de5891c159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LX1i9LxPEQoqp46TdNLmN0Syu9VZuY/VAvXJLLjtbLQ8RuFG/RpdneYOoEJ7?=
 =?us-ascii?Q?Jeag2grqfZajA+ZlT7Ur2C6u3qZ1sLqk6KXyc94OmO4a6RjfWNq7iUnle9st?=
 =?us-ascii?Q?8lEnsXJ8rK/o4HyG9M5Aba8HPwt5Bfd2x5gOCB0T0LiTKWDCv1cizJuPy3tA?=
 =?us-ascii?Q?VK8ggeCOSSuiMeubr5feZt+SRks5trjbY2ITIhu4BEG/Q7nJ/dNlaH6McuA5?=
 =?us-ascii?Q?Sme0i6vkZJWtWhl+RegWD9ICcwGYvLuuOllpNIii3RUhObcvDNIIvvThTNP2?=
 =?us-ascii?Q?nnwr9x/qpl/1+WXvc8U+FzP/6ujU3XJvJzfrxcS9JCjkprsVv2kwKWns3UlI?=
 =?us-ascii?Q?/80MD+ChUXacORuUqe/RsA5FRuXqs0vwPkhFe1nL5mhN/L8CM/xYH18Ed4WA?=
 =?us-ascii?Q?lAeUAD5+CwjXHk3pFCmVSPPkTRxE2xid/GvpufcPyyCJH0Hf0grmWlPH8pbm?=
 =?us-ascii?Q?eKsyGKCoo44y2vgT393tFVacOk96Vc8/+z6kRQNKAzm21FavRFxCTLXUun1Z?=
 =?us-ascii?Q?jTfdqKn8uMA18DcfxC0vD4NiIwbH6xXXUbNAG5XLYByNYzWrSRaMBt5Smb30?=
 =?us-ascii?Q?v5ODvWr/s/XRFWOuCK/R5TPUYKUe6gK7Fjf2WwrvXx835fIRRak90JGXYhfK?=
 =?us-ascii?Q?dqhMJIFwHqMAVTksLsVg1DIlKkgrowma9Ui83KTcRey+fNGyepZWm10mgm/B?=
 =?us-ascii?Q?xB+HhJYRQ3XTVcdpSSRBcZIO2VvdKXe63SHabL1dDVZ4gLwV7Mh/S1jcGphi?=
 =?us-ascii?Q?FjRtRu0UeBN1rPqd9CpHMJbZlOpgxNnV44w+CCnyF2w3t0ONz//XtcpPJmVK?=
 =?us-ascii?Q?w3MUiQzekWwyL4F0IsUxKF1yscgfY4N2lyvHjsGkX2BEsFZXovOShgkf5q/Q?=
 =?us-ascii?Q?y27n6jxm81U0sGgulTCml5tQL6x/EN2G0dkjzoRuLu+xVTk+ZQDGzO79OEAj?=
 =?us-ascii?Q?VD/2CLICDPJEDh2EyRl4shA1pEq7993ezOkeqaskMFpIzZf4F1rVQIg5GA2N?=
 =?us-ascii?Q?qj7jB8EOC4ZljB5Uw0W+NXnGLmE/cgP2EOv9OLyezhxEDIJnRKCv2jjfL7FL?=
 =?us-ascii?Q?BllIC0vqlESaBHN4hML8NgUcRXPp+GGewcCFL0+aMP+6bAlEXBjd2mv0sG9k?=
 =?us-ascii?Q?SbywG6ph0QPz2l+HiZLDR9ua9mmQLd0emUQFuXiTVh0mI68qPDFTneYdv9EP?=
 =?us-ascii?Q?86GfuoVPqnH/56Eyt+a2AGsrFcN1L0E441rnwzDisRlNK4HyOlDZd84bk+PA?=
 =?us-ascii?Q?WPZ/dKfMri4tLcQOdEyCkYXxYQCu4iHAgz4PQIL8JAq/M0AnYbS8DdXkvUEh?=
 =?us-ascii?Q?AabRCJb9WhyGpaYVHFtIM33kcUNzrLv+S8Veca19kYOZze9wblIKJiawzZ+i?=
 =?us-ascii?Q?VRhZdmyme4NC+uQuoSINy9Xgmdi7Na+bm5BYaTGzO8s8Qm35Z155hQg3acPo?=
 =?us-ascii?Q?/+16TuO/hoqatPAL+i/L1QykPa85AYZ4kpJYlFOEPH9YE9PYZtOeQvjusGHb?=
 =?us-ascii?Q?QQD0Mb8WoZohvSvB4pAnGBmAX5Mb/cnpKbT0t5dsQhirBeq6SgDdZVBc0Ifs?=
 =?us-ascii?Q?59k3i6vP+MVIXvFD/XU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KnSJrUiwjBtfVQfV2dsZF1t/7UfMzZwV+55BmNmsCK5DTDS2UpLoIIk4DTd/?=
 =?us-ascii?Q?/HGcjI4B8Z5l+MoerOIO1THogsyIj0EtdbxPiG1Mle/g8zLZDtIoIxjMVWUs?=
 =?us-ascii?Q?3mbOuBSrS0vwMjruYCLkTwkiGmqtf0bPD+ldng673jBZZUT3it5wBVhh5Xio?=
 =?us-ascii?Q?X/njd2zL9o3ikYwMRYftPL9dXlwrUs/m5OVqfqvxq0crTdBAOsZq7k6ymZPe?=
 =?us-ascii?Q?tfuZoFkgZO+/ptbV6+l0+Kq2z0eWGA9W++wNs5TmgtfFw8qqgsRvUUcptf4c?=
 =?us-ascii?Q?RW/r7MF/yp+fSXN5MAPpMuy9ZaDB8jt5t1LZhPL+X7pqIFlEug3YFgxKHUC6?=
 =?us-ascii?Q?G+uJdDR1ZjL5/yklJBXtVaRHcDp7QU4GyDPzEeWZPxS9Yo2ToEQgvoSJxbHX?=
 =?us-ascii?Q?LCCmbMxaACUXCZfUf2+CQIrraVnBe1Bh3aQCtwnXxwrxXraqRUhJRkPCJvaV?=
 =?us-ascii?Q?yfB3ZzqT45V+7RtTLxbwj0DXzXQ4fYF/VcwIEtIx0RXev4Y5lqIuKRSiYoQn?=
 =?us-ascii?Q?iqoeXtS5iVOgP2G5Sc8TG/qkinpBD12WkSBbq+kYEDNZ1cL93NwCtBSdXsb4?=
 =?us-ascii?Q?elnz5sq4udkyLbIDML954Iy506+AhEkZ/KnESPhv39l0nhkZ+XwIdMSVWeKr?=
 =?us-ascii?Q?MkOrKaai81P8Q0TJ4pebqqcy22WXoUIM8C10BF0GrdehJuZueZsL0Pf8sHlG?=
 =?us-ascii?Q?NHt4G8vIQbLBCEFreETb5lhgKmucmGpDl47baRh9Mqd35ygGTMbGAgWw0BFZ?=
 =?us-ascii?Q?g2kMcAaLhWZawefvhcjzDJP4XoVBDYvrMKQoJXy1DH/0B3SKBC3pw1wFlhc9?=
 =?us-ascii?Q?LoH1moBaxLSTvQVLya0QjYVhNQqLw1IT6rGkPLzN6l5fvV+V/RRncnbLmwqT?=
 =?us-ascii?Q?Brt/x3ajF8LUkvW36qXmnwiWllWaSRg/hhpCFJem31RpdFyyaSrKEHWu/wKA?=
 =?us-ascii?Q?JeBYr908qWRkpBjKN4rOuzL3JsL4Ecg1jOXluE3eHCBQAg3FxDtRZAvzpAxA?=
 =?us-ascii?Q?VZzcTKuEvjUVYfJAsfdk/I1kOvlwo8j2ifIx+fjtSmxv7Em4a4pLmjO9WLQG?=
 =?us-ascii?Q?pj2qfahSFtk/K0nsqT+W++IY8nitXfshD5Vn6mkfVGIOU+Dj1yTlVYFyqQmM?=
 =?us-ascii?Q?lvUbC350mKNYQrP/g8Xw02GZsiJGBR62wYGJFMITNisoxzk+ihA72aB1TJKB?=
 =?us-ascii?Q?Iunx9D/bEk0RR8cEch5RnZWvLEWPFFKogz4rgWZnvkE/ULfNYFUeyTeZ6t+R?=
 =?us-ascii?Q?AnpBXbjp9tlv73vvWy7KajJAPIEci8KLNTmTxLzp5BXweLzU1FmOFqghOKkW?=
 =?us-ascii?Q?EoSn8GbQnoTmzbVi/paZwDJNc5WDOi9ipr0HZn6gPUvIKvPw2gJeqErwjm2N?=
 =?us-ascii?Q?mBz+33BQSpXabhv6f7xC8THuCUnWEG9syYUsMneLuHsMcSXtti9aqBc2kt8p?=
 =?us-ascii?Q?0Tpxvm6jth8g/ol6fPL48+0+els+XyW53LYcU+0N4jALYUVsFtTdQYZMnFBc?=
 =?us-ascii?Q?9dveiVr2dpekUOy/FukmsZuqshXac/VB5EouQf+YCeRfqDcSVySWHtQMCldH?=
 =?us-ascii?Q?KqSeZh7Qz0+ISjWgdscGVVrhGV6DR7aKw2MfH/DZTj6czYdNQpm73BB4EsY0?=
 =?us-ascii?Q?infa1P3IreWy9oz/lpjGLT56kUwYDYTMc4DmQ1L8euUACZZitcitAZQSV53B?=
 =?us-ascii?Q?MzDa3mJWQYW3tjwxPAhQdIaOJ5jBolU51Wp9y35tikWbx5WqcjZhgSMCiTyg?=
 =?us-ascii?Q?fH2urOPE1ud+46UZHGFiloujKAOsEVwu/ByNMqR/HkkFCAyT1SoI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e55617-3cad-4be8-b507-08de5891c159
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:06:57.2252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tuvpve8DWFjlwkkGG40ehrlHKjA/2vdaknI5ZjOKTQBJbwfOn4MawYmZAldQCeTrr++GJ5XZo8jhaW4n3ZHEc3nAgJlBdknyGhN/rtq5HjSik43QfZYd2Md9oTKjw9gG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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

On Wed, Jan 14, 2026 at 12:29:17PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Extend fault mode test to cover multi-queue test scenarios.
>

The patch series is missing versioning. Please use
--subject_prefix to add versioning to patch series next time
around. Also, add version change log for each updated patch
in the series next time around.

Other than that this patch looks good to me.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_exec_fault_mode.c | 111 ++++++++++++++++++++++++++-----
> 1 file changed, 96 insertions(+), 15 deletions(-)
>
>diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
>index 5f42051a1..3e92dfbd9 100644
>--- a/tests/intel/xe_exec_fault_mode.c
>+++ b/tests/intel/xe_exec_fault_mode.c
>@@ -35,6 +35,7 @@
> #define INVALID_FAULT	(0x1 << 7)
> #define INVALID_VA	(0x1 << 8)
> #define ENABLE_SCRATCH  (0x1 << 9)
>+#define MULTI_QUEUE	(0x1 << 10)
>
> /**
>  * SUBTEST: invalid-va
>@@ -77,6 +78,14 @@
>  *					bindexecqueue userptr invalidate
>  * @bindexecqueue-userptr-invalidate-race:
>  *					bindexecqueue userptr invalidate race
>+ * @multi-queue:			multi-queue
>+ * @multi-queue-userptr:		multi-queue userptr
>+ * @multi-queue-rebind:			multi-queue rebind
>+ * @multi-queue-userptr-rebind:		multi-queue userptr rebind
>+ * @multi-queue-userptr-invalidate:
>+ *					multi-queue userptr invalidate
>+ * @multi-queue-userptr-invalidate-race:
>+ *					multi-queue userptr invalidate race
>  * @basic-imm:				basic imm
>  * @userptr-imm:			userptr imm
>  * @rebind-imm:				rebind imm
>@@ -92,6 +101,15 @@
>  *					bindexecqueue userptr invalidate imm
>  * @bindexecqueue-userptr-invalidate-race-imm:
>  *					bindexecqueue userptr invalidate race imm
>+ * @multi-queue-imm:			multi-queue imm
>+ * @multi-queue-userptr-imm:		multi-queue userptr imm
>+ * @multi-queue-rebind-imm:		multi-queue rebind imm
>+ * @multi-queue-userptr-rebind-imm:
>+ *					multi-queue userptr rebind imm
>+ * @multi-queue-userptr-invalidate-imm:
>+ *					multi-queue userptr invalidate imm
>+ * @multi-queue-userptr-invalidate-race-imm:
>+ *					multi-queue userptr invalidate race imm
>  * @basic-prefetch:			basic prefetch
>  * @userptr-prefetch:			userptr prefetch
>  * @rebind-prefetch:			rebind prefetch
>@@ -106,8 +124,18 @@
>  *					bindexecqueue userptr invalidate prefetch
>  * @bindexecqueue-userptr-invalidate-race-prefetch:
>  *					bindexecqueue userptr invalidate race prefetch
>+ * @multi-queue-prefetch:		multi-queue prefetch
>+ * @multi-queue-userptr-prefetch:	multi-queue userptr prefetch
>+ * @multi-queue-rebind-prefetch:	multi-queue rebind prefetch
>+ * @multi-queue-userptr-rebind-prefetch:	multi-queue userptr rebind prefetch
>+ * @multi-queue-userptr-invalidate-prefetch:
>+ *					multi-queue userptr invalidate prefetch
>+ * @multi-queue-userptr-invalidate-race-prefetch:
>+ *					multi-queue userptr invalidate race prefetch
>  * @invalid-fault:			invalid fault
>  * @invalid-userptr-fault:		invalid userptr fault
>+ * @multi-queue-invalid-fault:		multi-queue invalid fault
>+ * @multi-queue-invalid-userptr-fault:  multi-queue invalid userptr fault
>  */
>
> static void
>@@ -188,7 +216,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> 	memset(exec_sync, 0, sync_size);
>
> 	for (i = 0; i < n_exec_queues; i++) {
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+
> 		if (flags & BIND_EXEC_QUEUE)
> 			bind_exec_queues[i] =
> 				xe_bind_exec_queue_create(fd, vm, 0);
>@@ -398,6 +438,21 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> 		close(map_fd);
> }
>
>+static void
>+test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
>+{
>+	struct drm_xe_engine_class_instance *hwe;
>+
>+	if (flags & MULTI_QUEUE) {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
>+	} else {
>+		xe_for_each_engine(fd, hwe)
>+			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
>+	}
>+}
>+
> int igt_main()
> {
> 	struct drm_xe_engine_class_instance *hwe;
>@@ -420,6 +475,15 @@ int igt_main()
> 			INVALIDATE },
> 		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
> 			INVALIDATE | RACE },
>+		{ "multi-queue", MULTI_QUEUE },
>+		{ "multi-queue-userptr", MULTI_QUEUE | USERPTR },
>+		{ "multi-queue-rebind",  MULTI_QUEUE | REBIND },
>+		{ "multi-queue-userptr-rebind", MULTI_QUEUE | USERPTR | REBIND },
>+		{ "multi-queue-userptr-invalidate", MULTI_QUEUE | USERPTR |
>+			INVALIDATE },
>+		{ "multi-queue-userptr-invalidate-race", MULTI_QUEUE | USERPTR |
>+			INVALIDATE | RACE },
>+
> 		{ "basic-imm", IMMEDIATE },
> 		{ "userptr-imm", IMMEDIATE | USERPTR },
> 		{ "rebind-imm", IMMEDIATE | REBIND },
>@@ -436,6 +500,15 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "bindexecqueue-userptr-invalidate-race-imm", IMMEDIATE |
> 			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-imm", IMMEDIATE | MULTI_QUEUE },
>+		{ "multi-queue-userptr-imm", IMMEDIATE | MULTI_QUEUE | USERPTR },
>+		{ "multi-queue-rebind-imm", IMMEDIATE | MULTI_QUEUE | REBIND },
>+		{ "multi-queue-userptr-rebind-imm", IMMEDIATE | MULTI_QUEUE |
>+			USERPTR | REBIND },
>+		{ "multi-queue-userptr-invalidate-imm", IMMEDIATE | MULTI_QUEUE |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-userptr-invalidate-race-imm", IMMEDIATE |
>+			MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
>
> 		{ "basic-prefetch", PREFETCH },
> 		{ "userptr-prefetch", PREFETCH | USERPTR },
>@@ -453,8 +526,20 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "bindexecqueue-userptr-invalidate-race-prefetch", PREFETCH |
> 			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-prefetch", PREFETCH | MULTI_QUEUE },
>+		{ "multi-queue-userptr-prefetch", PREFETCH | MULTI_QUEUE | USERPTR },
>+		{ "multi-queue-rebind-prefetch", PREFETCH | MULTI_QUEUE | REBIND },
>+		{ "multi-queue-userptr-rebind-prefetch", PREFETCH | MULTI_QUEUE |
>+			USERPTR | REBIND },
>+		{ "multi-queue-userptr-invalidate-prefetch", PREFETCH | MULTI_QUEUE |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-userptr-invalidate-race-prefetch", PREFETCH |
>+			MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
> 		{ "invalid-fault", INVALID_FAULT },
> 		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR },
>+		{ "multi-queue-invalid-fault", MULTI_QUEUE | INVALID_FAULT },
>+		{ "multi-queue-invalid-userptr-fault", MULTI_QUEUE | INVALID_FAULT | USERPTR },
>+
> 		{ NULL },
> 	};
> 	int fd;
>@@ -478,26 +563,22 @@ int igt_main()
>
> 	for (const struct section *s = sections; s->name; s++) {
> 		igt_subtest_f("once-%s", s->name)
>-			xe_for_each_engine(fd, hwe)
>-				test_exec(fd, hwe, 1, 1, s->flags);
>+			test_exec_main(fd, 1, 1, s->flags);
>
> 		igt_subtest_f("twice-%s", s->name)
>-			xe_for_each_engine(fd, hwe)
>-				test_exec(fd, hwe, 1, 2, s->flags);
>+			test_exec_main(fd, 1, 2, s->flags);
>
> 		igt_subtest_f("many-%s", s->name)
>-			xe_for_each_engine(fd, hwe)
>-				test_exec(fd, hwe, 1,
>-					  s->flags & (REBIND | INVALIDATE) ?
>-					  64 : 128,
>-					  s->flags);
>+			test_exec_main(fd, 1,
>+					s->flags & (REBIND | INVALIDATE) ?
>+					64 : 128,
>+					s->flags);
>
> 		igt_subtest_f("many-execqueues-%s", s->name)
>-			xe_for_each_engine(fd, hwe)
>-				test_exec(fd, hwe, 16,
>-					  s->flags & (REBIND | INVALIDATE) ?
>-					  64 : 128,
>-					  s->flags);
>+			test_exec_main(fd, 16,
>+					s->flags & (REBIND | INVALIDATE) ?
>+					64 : 128,
>+					s->flags);
> 	}
>
> 	igt_subtest("invalid-va")
>-- 
>2.43.0
>

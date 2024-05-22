Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2026C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 12:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7963C10E285;
	Wed, 22 May 2024 12:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3JgRdoy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34D010E285
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716382025; x=1747918025;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+yOmYdESn81xeNziipbriiRmJM0tTfUEQcS4ksnTf3c=;
 b=A3JgRdoyMZL1coyieJ4ZhE76HSzscewMF4+OJhA2wa2bU3E3U0whk8JQ
 sjm9uCNzFGkAE1xPLD7WMgmZaHHoQVHqVFdJ5XJ4Mou+65Oe5YNivL6p2
 iOfel4+u8tcw0YzIDT87MSqcbFRXRTzaM9vMDODxSB7fkRE84Hsq7lS1s
 nGUnntR0Nrxotl9S0rHVdfKFfR90J885zEwAWW+YjbSc9/PbSrFvIDxs+
 wGPq9L4+hXqlnJSkGZtHfmbWYqqFPJWEtabgTFjXGgY7I5ILwlD2ONXEL
 QcAlBx+mkzYmrFgdhyaUaUmVY+2OFDAK+CsORuJpzHYZdH8FWGVCqR8o9 w==;
X-CSE-ConnectionGUID: jP+rI2K9RQeOnAl2VnaJ4g==
X-CSE-MsgGUID: TlSTE5qGTbGZ/oWO9QUc8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12859968"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="12859968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 05:47:04 -0700
X-CSE-ConnectionGUID: yaVAjjdNRYen647ziUzc1A==
X-CSE-MsgGUID: MAoVLscKThSNsico6XVAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="33262610"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 05:47:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 05:47:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 05:47:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 05:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjIfF6dySQXnK6oeK3+SGvWqABW+FncckpmfH+GwvOkZQ8VBXWct2LzwnQVGHPHJxbnSgO7FGN62ICwnsETQbv+0a3LsRqnwnK2e0mPSGS1Swu5Aj35HYHUPXxr9HOIVl+7t7SCP4DLtnTw2Mf2A/ooeuZ3mdvbf3tpzk5V15TIBqV6vKvxWhuLB7Cf3p/yg63i7x9tDFEOlnVCNMmVdNlu16Aw3pvYdEWRlcPgPPpkzDs5uZdvAB39cOnyYGePDkHHzKCHes8vcCBS0wBSJK9EBnOQCXbKcnM9duPjVfXVKCvaXGWXGzAG8fge9ytnZZDOfguH/2dEvKWE47hK+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mYSJl5gQ1h57UpgVs03XoA0Nxf0aNdp+O5AwumylAg=;
 b=Lx/gbZkKJtQp0vSWf0yX0CNwwYo3D//n1Yo6yLPsYUdsJuEJpW+cJisTeooNZniMsKuiqZ9gTNGaBO68IN/cMfo+d/mx3m9JEW4hM6SZ7npxhQ42SXeViHZh7n5d9zXV7GslMn4/y1h9AdBudHHGSCzMUuIkj4u37/JSTXKKMl/h5E6mXgLTM77YZbC4JE5XL9tYiQErRMXh+BFdEt6psCUNZJkUP5eojlROu4rTvut5iGtiECCDUsbrq8Qpm/Ujk21XhHwQV+h7DLfWIWs3LaQVBCUsPgZk6gEAOfqd04z2prq1tyGtfciVXKPDhNU9gkV5RQVqU6GdPrn4uM81jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY5PR11MB6114.namprd11.prod.outlook.com (2603:10b6:930:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 12:47:00 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 12:47:00 +0000
Date: Wed, 22 May 2024 14:46:52 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t 1/6] tests/intel/xe_pm: Update runtime pm conditions
Message-ID: <Zk3pPEt99nHKYEk8@fdugast-desk>
References: <20240521151640.280354-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521151640.280354-1-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY5PR11MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f90aed-7b4f-4f59-73ce-08dc7a5d45fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j2zdVZoS8/A65crbt0W+SoGwvoaKLMWiKzk7+SwBzoC0WFgUnSAADUaoIAOM?=
 =?us-ascii?Q?LExiDHZaymgG3I1OCgnyM469Ye1ZZDhtFCvc4DrlYqHb2sncuP7C8fjURaIJ?=
 =?us-ascii?Q?d24ndHlkIuZt0ap6r5XQSYu7V3icQm8KicjeUNJRuRYxFU6mtbtciC22flIP?=
 =?us-ascii?Q?WOkLEtmi1n8JDRqYgxxcck1bQhZuUhHTF/OtSyzDwjsqoKP+SDmaVVgVPsMg?=
 =?us-ascii?Q?eJVUYqa4JpqjjBIuCWL79PNpF408V8fZl5RlP4NeKC58i+Z+I8Y3n5jdW4wj?=
 =?us-ascii?Q?vxt8L99krDxepj4hKF75rwvnRFFKUnTp9g19HCjEgPHn6tbSTMDcMHxKcnoK?=
 =?us-ascii?Q?R3ukdee3w52LsLJT8j4HdFVmU+Qo+JTAXjxAuVsytaZMwQK9FFgJdWUCOpub?=
 =?us-ascii?Q?IaXbri0BPTir6goZ5ax6idwM+o4yuxgw0ey+5dDtPqzlJdaWyCO7WlgcKt0Z?=
 =?us-ascii?Q?GZr3SRvcvaqQTZMe4Qjp2tTux9EdhsfJXw/tKNUJxhixyd1GCTanW/aDpBjz?=
 =?us-ascii?Q?l2fofmQFQpD74TvHoQ6MXpYwn/8BMS9MnzTSzwB86gW9JW5AME8MA+XduNKX?=
 =?us-ascii?Q?YdyRofzkBICJeiRAk+0llCDF6pmExVs4n/ll4DbvpgraC5g/pfhYSLDyTwU7?=
 =?us-ascii?Q?McaTLbMNQo0c6n4zXmHkim1skbA1T0eK5kvos5Wjx0FXhUZ1FTzSCJncBzrx?=
 =?us-ascii?Q?om2bma9rfd3KIRXDexVSYijMlSQizrorxOc6c2ZNfps71nAUKyxHditKNfy6?=
 =?us-ascii?Q?PoNCNzLmSc8h9AV+oXslWxmPrXoPp12U4aoFMyuALoEK/l4MS6vcd48vCvDX?=
 =?us-ascii?Q?a+FAiwFvbRU/7Ors5Rs2B+XVW/5+WL8kq7CCnqi1hkl1q2QFXt9wUWcFwBGY?=
 =?us-ascii?Q?baiInR/UEMyiHJynnOE/Uxij9LsNmbDbNBIsIWMtWbcbuIq9oeU9g8/hAE9n?=
 =?us-ascii?Q?AHOwkBgsrdT3vdDv/oHTDyjjB5fvhDicxkwlg0bUCONqngigvLVwM20p5jMg?=
 =?us-ascii?Q?N0rH0eP75bXqrrJ6b+LmwOJ8Tm850UQ+DkYwwFxWPZ3jkikAY1j4D+HqRxRl?=
 =?us-ascii?Q?pFO0dBrDY5T/5W5XNnjP3FuNztVLD0lm62wd3qua+G/wWhBT1J84a1tfdKQC?=
 =?us-ascii?Q?pRkAwJokDcDNaqCEvkFIcHsiH29t8gkOwG+5rNvksF3LV70yRdGUupBNj++S?=
 =?us-ascii?Q?kJhte2uPi64DDx/NvBlA5q1F1TBV6TbgXgcWN1PmYFvKZGSZeuMWUEvv1+IS?=
 =?us-ascii?Q?gQkKMEOtTqOqqosAS/odRBkqRfd4oh7ufc3x784FWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VFly/oFFheGw7iKKkCc+LwioIgGrydP3VK6c7FD57A8PRyCukJ0fQor+wxXb?=
 =?us-ascii?Q?40sLSg2FBD+gzlg/5sWP3+GxTzi1+mBKMv5MkwdoWS9+/3HdcPA1vaXa+9Ga?=
 =?us-ascii?Q?f6z+oy9Mtr/XfKXCU9I9Q4iC2UnFE4SsrtQfM4Y/MyM7iLwTjCBtR3qPimQw?=
 =?us-ascii?Q?wahY9AYOPO8ePTPDK7Znj5/QzAbwXzqx763MqHGjzxUZbYbfpZ9+NRkLM0Py?=
 =?us-ascii?Q?kKzSzQ6lP8gk/uwCNoSO7FvommfjE7uADhmjLNmXH0XyeCfFopr1DxPNhoBD?=
 =?us-ascii?Q?glwI7WKSijvprv1BBl4X6R9ggwIhcBZAS1nhKcW5AgbQTN3SGqjiejQ3MBfo?=
 =?us-ascii?Q?5Si6izYybD58AM67S4ZGATQ9E859AYFI4Czfz7/mZtd7TLPYt7akzgVyEc3/?=
 =?us-ascii?Q?brdYM/Lgt+5TCF/hR/UPUlGNMEUrK5AGFxNvDdZRiFh62HFhC4o0nc/qe+Fx?=
 =?us-ascii?Q?b6fGVUsxaXQhcAUdLm3a8NN6P/h0DXGA20DhoYRxCTv6Q2sdQYeoW8jAnXaR?=
 =?us-ascii?Q?Or2tfFtg7jJQkVeTb6e6ryyoGtiefyM4axqvWxkAdpBvJ73L58snbFZoqjOz?=
 =?us-ascii?Q?lpZk+O3qjIhNtL4uCDmT/uy2X+VFaKLEBJiRjVM5wtQrGP8LYlUen1zOTLCY?=
 =?us-ascii?Q?rbXV8ii0MlgviDwWGa8RtyCJvnWzUn9OBNbO3INOyPW9becgB/2t6MNm++uc?=
 =?us-ascii?Q?LKGZ8IT5v76+FoDAvlR5KYGZULM1TE1rmuylTbkhPlTjIa3YhDIFGf/mhvXt?=
 =?us-ascii?Q?hr70G6rnR6GXIE+NgMOlaoHEhkTZvWhngkWcU2T9l/ntnykpznVKXnEYChNq?=
 =?us-ascii?Q?hyj8QhqlRmyO0fy1/b2BdaOOYPS3oR8IoOAWxEKhtMnJwqhxUHCB/DdeZZhE?=
 =?us-ascii?Q?0fXRjA1JjFvTpKXLQkENFik87P8LwZ2rHmPe0TsrwM2V46Q5KIZxQ/tvGHyG?=
 =?us-ascii?Q?jBiKg6fcqKCXzCKkgl1XJY2CdwOXCZp1scluBgR/Hz/u1SEbLzuKpC89tiIi?=
 =?us-ascii?Q?0yGm3jde+/Q4d1az30FrLRGdfXoBfd5IGjP2n2TFki/TTbiYiBvccpYUXWWk?=
 =?us-ascii?Q?DVzz5ZoX+RHjH/mbecvobGE8sQvb5zUeM37R83ZLpKWf7yKV7xAnoQVuJFeX?=
 =?us-ascii?Q?vVZc7TVKrnmp1guyxyaVwNfCcYVcDoB6JbFsZb22JXXATnxDqQrxVoqYjBDI?=
 =?us-ascii?Q?HQ7ib4jS0JviOZXF2mjtzYXSOG6LzsS7KAwJhAhzRMnqPffqkBuBe9LoKl1a?=
 =?us-ascii?Q?yAw3FaHcCzpWe8N5/HDYYfc4eKYqxqHRWU//Ce6jiWZ3yKWY/AJVxxer9LXE?=
 =?us-ascii?Q?/sS93gRm9zt8MK8k68EGiAnpYICECWWw4WpPZKIKERIQOwqvzFR8+7EbqtCX?=
 =?us-ascii?Q?k01q8WuODbofxhjQxGdCUiRyGDKGWN7E5dC5SL3HC0foIVIdgMr8RYr8nFIn?=
 =?us-ascii?Q?yxNMEKpGziVjVgVEzq9QDZCwrQgjo6cOysm++ZJY7dUlmHXMuP1POqFkf4Vt?=
 =?us-ascii?Q?ODQSqGRsePdcayv+6RxRKsskYLKEojiMRdX715Zojq7YIACo4K+1ppUe/sUl?=
 =?us-ascii?Q?E631diJEs3YEcAj5ThtATADwlTOtNvrNna5FW/ugnEhGWFC/kipqdxXaytAk?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f90aed-7b4f-4f59-73ce-08dc7a5d45fe
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 12:47:00.6060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTpqPI1FBG4ik48TrI4ee2HYb3Ji9Iw9xuFqiaWi4RUtVVs6o1u/XoSuGlsnA5nCYiOwB70Xu/j4uHO976SrxmRhtDl7u4j8zvKUQjCA5Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6114
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

Hi,

On Tue, May 21, 2024 at 11:16:35AM -0400, Rodrigo Vivi wrote:
> Xe is no longer holding a runtime pm reference for the life
> of a VM or exec_queue.
> 
> Also, IGT changes autosuspend time to a minimal time, so we
> cannot guarantee that rpm is still suspended after the execution
> has finished.
> 
> So, the reference usage is not a reliable reference.
> 
> Hence, start using runtime_active_time as the indicator
> that runtime_pm resumed upon our actions.
> 
> v2: Usage of runtime_active_pm and inclusion of mmap tests.
> v3: Add doc for the exported lib function (Kamil)
> v4: Use uint64_t for active_time, which is a big number in
>     miliseconds. (Kamil)

s/miliseconds/milliseconds/

> v5: Used PRInt macros instead of %ld (Kamil)
>     Tell what unit of time is returned. (Kamil)

It seems that improvements from v3, v4 and v5 would also apply to
igt_pm_get_runtime_suspended_time().

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v1
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/igt_pm.c        | 25 +++++++++++++++
>  lib/igt_pm.h        |  1 +
>  tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
>  3 files changed, 55 insertions(+), 48 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index fe7692960..baaa6657d 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1412,6 +1412,31 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
>  	return -1;
>  }
>  
> +/**
> + * igt_pm_get_runtime_active_time:
> + * @pci_dev: PCI device struct
> + *
> + * Return: The total time in miliseconds that the device has been active.

s/miliseconds/milliseconds/

With that, feel free to keep my RB.

Francois

> + */
> +uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
> +{
> +	char time_str[64];
> +	int time_fd;
> +	uint64_t time;
> +
> +	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
> +	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
> +		igt_assert(sscanf(time_str, "%ld", &time) > 0);
> +
> +		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %" PRIu64 "\n",
> +			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
> +
> +		return time;
> +	}
> +
> +	return -1;
> +}
> +
>  /**
>   * igt_pm_get_runtime_usage:
>   * @pci_dev: pci device
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 91ee05cd1..15e301533 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
>  bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
>  bool i915_is_slpc_enabled(int drm_fd);
>  int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> +uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
>  int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
>  
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index b4a8c4d15..d301ad031 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -185,34 +185,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
>  	return true;
>  }
>  
> -static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
> -{
> -	uint16_t val;
> -
> -	/* Runtime resume needs to be immediate action without any wait */
> -	if (runtime_usage_available(device.pci_xe) &&
> -	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
> -		return false;
> -
> -	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
> -		return false;
> -
> -	switch (state) {
> -	case IGT_ACPI_D3Hot:
> -		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
> -						      &val, 0xd4), 0);
> -		return (val & 0x3) == 0;
> -	case IGT_ACPI_D3Cold:
> -		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
> -			IGT_ACPI_D0;
> -	default:
> -		igt_info("Invalid D3 State\n");
> -		igt_assert(0);
> -	}
> -
> -	return true;
> -}
> -
>  static void close_fw_handle(int sig)
>  {
>  	if (fw_handle < 0)
> @@ -323,27 +295,28 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		uint64_t pad;
>  		uint32_t data;
>  	} *data;
> -	int i, b, rpm_usage;
> +	int i, b;
> +	uint64_t active_time;
>  	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
>  			  d_state == IGT_ACPI_D3Cold);
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  	igt_assert(n_execs > 0);
>  
> -	if (check_rpm)
> +	if (check_rpm) {
>  		igt_assert(in_d3(device, d_state));
> +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +	}
>  
>  	vm = xe_vm_create(device.fd_xe, 0, 0);
>  
>  	if (check_rpm)
> -		igt_assert(out_of_d3(device, d_state));
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(device.fd_xe, bo_size);
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> -
>  	if (flags & USERPTR) {
>  		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
>  		memset(data, 0, bo_size);
> @@ -381,8 +354,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
>  				     bo_size, sync, 1, 0);
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
> +	if (check_rpm) {
> +		igt_assert(in_d3(device, d_state));
> +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +	}
>  
>  	for (i = 0; i < n_execs; i++) {
>  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> @@ -426,9 +401,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
>  				NULL));
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> -
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  	if (n_vmas > 1)
>  		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> @@ -456,15 +428,13 @@ NULL));
>  		free(data);
>  	}
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
> -	if (check_rpm)
> -		igt_assert(out_of_d3(device, d_state));
> -
>  	xe_vm_destroy(device.fd_xe, vm);
>  
> -	if (check_rpm)
> +	if (check_rpm) {
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  		igt_assert(in_d3(device, d_state));
> +	}
>  }
>  
>  /**
> @@ -558,10 +528,14 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	size_t bo_size = 8192;
>  	uint32_t *map = NULL;
>  	uint32_t bo;
> +	uint64_t active_time;
>  	int i;
>  
>  	igt_require_f(placement, "Device doesn't support such memory region\n");
>  
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +
>  	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
>  
>  	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
> @@ -572,7 +546,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
>  
>  	igt_assert(fw_handle >= 0);
> -	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +		   active_time);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		map[i] = MAGIC_1;
> @@ -582,22 +557,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  
>  	/* Runtime suspend and validate the pattern and changed the pattern */
>  	close(fw_handle);
> +	sleep(1);
> +
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		igt_assert(map[i] == MAGIC_1);
>  
>  	/* dgfx page-fault on mmaping should wake the gpu */
>  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		map[i] = MAGIC_2;
>  
>  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>  
> -- 
> 2.44.0
> 

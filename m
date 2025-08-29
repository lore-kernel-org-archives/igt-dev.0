Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168C8CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 20:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60DD10EC3A;
	Fri, 29 Aug 2025 20:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nop/ueRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC7410EC38
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 20:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756498046; x=1788034046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8w5kqdkGL5pvYRYQW+su3FfbXu6oILj/dbForsxBdr4=;
 b=Nop/ueRQWbFzNoqpxsYm8r3ar/Cb9da4pvgbT/Gl5/ahmU4g7utYE4Lh
 CX07QrUcKEUrVG7iSfr91s9WCL2LCCNQIle95bSPwibx4uDDRIwMr3/NV
 bkdy95H+S0rLm5xzy8StBGhqPP0hEkU+iE7rrv4u4cRyUFlLZdmRAkeZO
 dC6HovC5CXyQ6PNJGfiX6Jz5H2C+7boc2yd0vPoNbK+E1STyv9i3b9z2X
 Do6igWTcxE4YGcx3rypl1ksLS4M8y7OFbt1NaTNPL06jkWDiwqqTN+NLI
 zCg0JWrxpvp458hB4YaQpTT5m6Op8r8bkTkETtv96Y7KIaC2+1uUgEgtz g==;
X-CSE-ConnectionGUID: 25FrFEIrRCyR4ZHWwYYd7w==
X-CSE-MsgGUID: SkuXrNPHSBKSRpiF5ilDHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58862375"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58862375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:07:26 -0700
X-CSE-ConnectionGUID: iFcWgQVrTNSgeZ7bzn69aA==
X-CSE-MsgGUID: FGbA9V9PRcK6KxfrvvLIvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169756744"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:07:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 13:07:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 13:07:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.88) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 13:07:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdXVc372EWc63JGXr9ZergzcFnZ2GC0TT8hnd8tznPST8nKoO85tqt6CWn1HrHtGZll6EtnhsjAQmn9gVwGFCz/36VdyINHcA9DTZY/3PFpWCIANnOLTgH9Kjuke/Pjgl5qyDgyRXSUnVGP67PWBuQoufEHe5gYAIE+8CBVb9s82mkMk6lWwdURxF45fJKnA9lvbEWoWqEeNBpC9Q+Iupku12aedDc2dhABLdxxEZq8a5K7fteI1BYLTi9cMEGMgkfcRqhInXTyIAodwrNS1loQyYrf7qiUho4tP0gimLkdRXwTqqKnwjRXT8tGAI1JJqH4UXEhRnY3WV4oOeCLeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMOIssOuICYdeqfdGaans6gDnRNnqPCJCqsXeVlxsEs=;
 b=SAgk3taQCsVRiBytMtL3xoR2Yla293DtMh1khs1bp7xhuk1X+ra1mngwrY7zDSGBDg7XYygSgVT6N6d4xeYN5tVhQ/yf1rgg9Vw+RWhYAfXul5rRGsbleeA+HiU7gwM3rdIlUpr/hfK59EmrdPRMvKquoQyTNuS3AYZfdW12DppXer25iEgLjJsnfL/Ron+eMTSdJuab1jzmUzveQUUfA3MYmUgqTBdPeLjtDtC4yDFlc0dgt6bmXrgNy7LRZyu9c3w+im2mBRc2XCeY3qmaRLyCA6ZXJhw7SehMsj0KBUjeG1e4eWFjUKw4RVrcXEUZDpmrNGOI7dqHlZLNQxS0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV8PR11MB8461.namprd11.prod.outlook.com (2603:10b6:408:1e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 20:07:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 20:07:12 +0000
Date: Fri, 29 Aug 2025 13:07:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pravalika.gurram@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t v5 5/5] tests/intel/xe_exec_system_allocator: Add
 atomic_batch test in IGT
Message-ID: <aLIIbaIlo9vddVd6@lstrano-desk.jf.intel.com>
References: <20250828165817.97661-1-nishit.sharma@intel.com>
 <20250828165817.97661-6-nishit.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250828165817.97661-6-nishit.sharma@intel.com>
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV8PR11MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 8218b88f-4cf3-4b6f-b95d-08dde737a453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z4sDlD/0PHCE1YSrMWNxsyRu/9um8QMdeu6SO2GNYuv3sSLsE6snm9p62Idy?=
 =?us-ascii?Q?LICS87wmYWJVifnKln+7UhKQtu1Abhq/rTkjeKkrBeeoRoLeaYHYIZqKdbLZ?=
 =?us-ascii?Q?4S/nRFgMQxfqHzKaSEe7nkQ062EZ23Cs0yN8gtSmIwX7Gz8niBgfhEmauCWr?=
 =?us-ascii?Q?P7wgl45Z6iAHcKCNYyeCb+xYmVe/NBn8tSoGFIl7bWgGuSXr2N8OryJGmGpM?=
 =?us-ascii?Q?2aFoF/YhWkFrM8rHEhJIVFvQ9hv6aV8mKOurfxzrpr4gcklsHUsB7xvZdgBs?=
 =?us-ascii?Q?MlcAjJIOiUrvFJubtYqwEdngkwQaRl5K0qas066CgshadCy/2J/VqNzxK2/4?=
 =?us-ascii?Q?ljz7KGE7yPK+Jlbqg+981tNFmnkuWUy9jUNDsBPi4Wva2KmGmCpuydCxeEEG?=
 =?us-ascii?Q?aLkEk5gTCHVz+0PKu8waHCCRSPLD9cqSBmAOQxHPYwHJD13P3jk36TYpfCwh?=
 =?us-ascii?Q?wnvB7VxyR74ruCSx6lmKmsXogQmpaZeFgI61+FxPJlu5Nvp1RZgcnvem7wRp?=
 =?us-ascii?Q?BwZOE3y0tEQiJNDXaS+wKLQ3cN50UrtELlVeBD4AeGWK+0pV33EqYod8r9FB?=
 =?us-ascii?Q?5sRma12ZutL1kozmDYofk4HPigxb+lLIcDPkcG+NcFrYkn0hAaPCW8KH6CYb?=
 =?us-ascii?Q?6Z1zFg8Uh673A80ier+t8XXJz5IReXuf9k8EWMSww0c+oJ/HbtKHzRJzJPQo?=
 =?us-ascii?Q?ni++w1ikRiJwVuj8wzKXk3zus6qOMkO0m9DKlUL29tkF1XdPR/uzZ+rI22nG?=
 =?us-ascii?Q?lNyoBilFRHB0RQNFl4YfxwLuYZKhLmjAOkGq+QNM1+yTeURNvYEVLp2/hiGZ?=
 =?us-ascii?Q?7sOmMzD4bDrBcUWPISYtqAQHWd1EnH420LZu4EuWkF/+nNW9kPlkOK1I87MC?=
 =?us-ascii?Q?ibG48EeUqDXgsbHQz1jcyB/fm7TWePeCQQCxJxQOFNu8EhSWNHWyS79F7yOm?=
 =?us-ascii?Q?ptGI6z7s/SmlQSimPtElt5dK8s/b30moEWPegxFaAQOj1YvQhS98pwJXDV5C?=
 =?us-ascii?Q?B4FF6cZVNwX1EcGqRTDU0r/oamY7r0qibH2Th/VIJdlJ9jcNLwGiX82z8vHf?=
 =?us-ascii?Q?9Smc36W/ziWBWJ7rYRn+8v+Qqnijr7DhMq49B2bYMlRb0284OgUtJSP6Z4qZ?=
 =?us-ascii?Q?9jURloByTCLijfKch+C6t1GRiPR/DJLB3lcaVcC2cSbyzWcaLEEuZMvvY8kT?=
 =?us-ascii?Q?mek5id4GZeNPdnP1ZFKx/B0tmXW3gbmrA3JiaTV1ZEt4V8nNYwBCqMA81+Nj?=
 =?us-ascii?Q?Bme+AAZ4HsR6jljnQvhiueE1MPTXFCFbSTwZkfdthHdOEO8tyJiTl+ZCfEML?=
 =?us-ascii?Q?mL1gBCvpXxhoxix+RALNpTB5UPhk1oeuaPQXn08I4XiDsnMl8tHHrSOQm1Pb?=
 =?us-ascii?Q?r7R9tbbtDeSOR9TBk7TEYz/HUqdvlSntKIYmqj3kqV2BOIbd4oFnu6Z4yZ2k?=
 =?us-ascii?Q?gRZEBCHReIQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8zKkjKR5zGu82onEk32Ha1Myd9ifKBvOQsZadvk6Jjqn5f1gNcHJz+qmIlMX?=
 =?us-ascii?Q?PRhPUhsnPlI7WYjEFoTh7oZJbhf7bKq8O5p3ohRj6q76aJq3zBrvAZU6MWgR?=
 =?us-ascii?Q?/GwvB91EzuaSCSjF3JybyB4e0iqF3C70xbZI2//qByxcDZzbAxLvJS6qG+t7?=
 =?us-ascii?Q?hsHpTQesyUJRz0FGV8DLNzULzWjpeXlm0TVtHjAr5LF3enOPpQrGFNzOgm01?=
 =?us-ascii?Q?wGZbCnOCmD9JgXJJdq6nBV6DwGY8qrK4jyUhLxdMjLZYi8DvjgTkWubONuSo?=
 =?us-ascii?Q?S9wVBNLlKeTcOQxo/0WAXlM4l/uo0YvFuwgFzYKDer8o3INrqZwfNhYPd6TD?=
 =?us-ascii?Q?gyWslTd0yBvNTlfYyrV19NKIYRNDP7uEcoHVsPY41WMWKVYmIaK3AtySti/l?=
 =?us-ascii?Q?3EqPIgXyYjt6v41EyjQGj+7rmpNo49z4fFxqAnBteaeWHFg3KF0i59+W0OJL?=
 =?us-ascii?Q?Xxy3n7ji+M104wF5Jm8hMyxpouJGkFAXZhD0u/qpug7h9CEW9FW2ZHVXKGtB?=
 =?us-ascii?Q?y8k2VZftYTiJrRk8eo+Ku/+zV/rYAX2GthJWRe/XBloft1cP0KL9glchX537?=
 =?us-ascii?Q?d9tioBFg6s/0gSqd0XIgG/w76bhUyy8NLLHIzoR7JiES6bCliNNGydl096y9?=
 =?us-ascii?Q?ra/IgcM8BthJy5Q1flNM6v2npCxu+kazDb8pwVJycMeD4Ban42WLQR/vADFk?=
 =?us-ascii?Q?/p5uIkeC2VJY1Yf9fibJ28EtSAgbnWjk5/nzdAF9mSxh/zmLvf1XCDttN1FF?=
 =?us-ascii?Q?a8zw0dFFE1rkUhdtyyzwGDatUQvzZn6GB4JlHfcwc+70/fugDCl1wM27d/yC?=
 =?us-ascii?Q?XoWC8aY+058VffEg6RzJWFoKvysZbC1snPs8NccTJMpExpPctTIbGLQFaK8/?=
 =?us-ascii?Q?K8vX2oDF8uf6nolJw+p3mCniBQvYp5vXXYfyz6/wSib9zv67/8Gf9oGG4AVx?=
 =?us-ascii?Q?6ATcyzIwWer00+WiGmNO+/iWIM2FaXFbN1X4a5yv6hAeCD2KGOQdDg2g6OF2?=
 =?us-ascii?Q?4wJOq+EDGnfBCGtsqeTt7l5o9/zNaNR4d1Xl/FEB6GT6/K2RyJQvlmHSXAHx?=
 =?us-ascii?Q?5qaqLW5HAEd23SwPwg0S/oO4zyWsPgylMRJ5tHs+qCCm8wGoTHwqP42tLgQH?=
 =?us-ascii?Q?gBpyAo3l2slZNxH77AL9tFURCXFJJe0CS8pjY6BvVSC+uMCF6p+Sk/W4kbmy?=
 =?us-ascii?Q?ekgHokjAu046C/i6pxIaEMteIamgcwPaS6AP14rt8uuCOVwt+AHybrtsRkBB?=
 =?us-ascii?Q?4UZ3ZSZ1+r88AeBpNZiCIBIxXhXbVGBHQK4wFiQuRH4pj1ei3ND6/BCygxQJ?=
 =?us-ascii?Q?dFpD7gQrYqgyRSgaGjliog7Zf8o366QAhrx2R9KbXSQtdtFaPlX5lq3DhdkX?=
 =?us-ascii?Q?dyhFz3G8XjrkN1zJtoLKBoAiW1Rc80QmueYMGsL4UjEP19P3vtUSvezVDYVN?=
 =?us-ascii?Q?0p9o7+g752KixT2xHkuCm4dKjdN+kF1s1UsZ725o35ORtIG981hRn+2gCYw4?=
 =?us-ascii?Q?KOhm8GlUOkUfg0Lmx1yetHSadrfkRd9fZki4IULXQzGJMU7z/uCW/KN6qCAg?=
 =?us-ascii?Q?9Xu2Dd4B3YnpAwsdTZL+eb1SGhtEoexyRZENBPg3krLHXjDB/b4wrlLIXVuw?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8218b88f-4cf3-4b6f-b95d-08dde737a453
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 20:07:12.5023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agUwLsyZ96jeu+mKFGSCpEpjLveRv5ysKReJEJDW/01eAv+RNhH2in5/TxGs1HybawjSbwQT92VBOovBLeVXFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8461
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

On Thu, Aug 28, 2025 at 04:58:17PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> ATOMIC_BATCH flag is introduced when true MI_ATOMIC | MI_ATOMIC_INC
> operation will be called. This will avoid writing another function which
> performs atomic increment operations. ATOMIC_BATCH flag is passed as
> argument in write_dword() if true then value will be written on passed
> address and incremented by ATOMIC_INC operation. For all memory
> operations this flag will be used to verify if ATOMIC operation is
> working or not.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c                      |  18 +-
>  tests/intel/xe_exec_system_allocator.c | 545 ++++++++++++++++++++-----
>  2 files changed, 445 insertions(+), 118 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 4ab2ef39c..71a427b4d 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -688,19 +688,26 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  	madvise.start = addr;
>  	madvise.range = range;
>  
> -	if (type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> +	switch (type) {
> +	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
>  		madvise.type = DRM_XE_MEM_RANGE_ATTR_ATOMIC;
>  		madvise.atomic.val = op_val;
> -	} else if (type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> +		break;
> +
> +	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
>  		madvise.type = DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC;
>  		madvise.preferred_mem_loc.devmem_fd = op_val;
>  		madvise.preferred_mem_loc.migration_policy = policy;
>  		igt_debug("madvise.preferred_mem_loc.devmem_fd = %d\n",
>  			  madvise.preferred_mem_loc.devmem_fd);
> -	} else if (type == DRM_XE_MEM_RANGE_ATTR_PAT) {
> +		break;
> +
> +	case DRM_XE_MEM_RANGE_ATTR_PAT:
>  		madvise.type = DRM_XE_MEM_RANGE_ATTR_PAT;
>  		madvise.pat_index.val = op_val;
> -	} else {
> +		break;
> +
> +	default:
>  		igt_warn("Unknown attribute\n");
>  		return -EINVAL;
>  	}
> @@ -730,6 +737,5 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
>  {
> -	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy), 0);
> -	return 0;
> +	return __xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy);
>  }
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 70ca5fc2e..d0a8431a2 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -21,6 +21,7 @@
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
>  
> +#include "intel_pat.h"
>  #include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -29,6 +30,14 @@
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>  #define FIVE_SEC		(5LL * NSEC_PER_SEC)
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +};
>  
>  struct batch_data {
>  	uint32_t batch[16];
> @@ -37,6 +46,7 @@ struct batch_data {
>  	uint32_t expected_data;
>  };
>  
> +#define VAL_ATOMIC_EXPECTED  56
>  #define WRITE_VALUE(data__, i__)	({			\
>  	if (!(data__)->expected_data)				\
>  		(data__)->expected_data = rand() << 12 | (i__);	\
> @@ -53,10 +63,19 @@ static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
>  	batch[(*idx)++] = wdata;
>  }
>  
> -static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
> -			int *idx)
> +static void write_dword(struct test_exec_data *data, uint64_t sdi_addr, uint32_t wdata,
> +			int *idx, bool atomic)
>  {
> -	__write_dword(batch, sdi_addr, wdata, idx);
> +	uint32_t *batch = data->batch;
> +
> +	if (atomic) {
> +		data->data = 55;
> +		batch[(*idx)++] = MI_ATOMIC | MI_ATOMIC_INC;
> +		batch[(*idx)++] = sdi_addr;
> +		batch[(*idx)++] = sdi_addr >> 32;
> +	} else {
> +		__write_dword(batch, sdi_addr, wdata, idx);
> +	}
>  	batch[(*idx)++] = MI_BATCH_BUFFER_END;
>  }
>  
> @@ -271,7 +290,7 @@ check_all_pages_threads(void *ptr, uint64_t alloc_size, uint64_t stride,
>  
>  static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>  			    uint64_t alloc_size, uint64_t stride,
> -			    struct timespec *tv, uint64_t *submit)
> +			    struct timespec *tv, uint64_t *submit, bool atomic)
>  {
>  	struct drm_xe_sync sync[1] = {
>  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> @@ -302,7 +321,8 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>  		uint64_t sdi_addr = addr + sdi_offset;
>  		int b = 0;
>  
> -		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i), &b);
> +		write_dword((struct test_exec_data *)data, sdi_addr, WRITE_VALUE(data, i),
> +			     &b, atomic ? true : false);
>  		igt_assert(b <= ARRAY_SIZE(data->batch));
>  	}
>  
> @@ -407,34 +427,45 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
>  
>  #define MAX_N_EXEC_QUEUES       16
>  
> -#define MMAP                    (0x1 << 0)
> -#define NEW                     (0x1 << 1)
> -#define BO_UNMAP                (0x1 << 2)
> -#define FREE                    (0x1 << 3)
> -#define BUSY                    (0x1 << 4)
> -#define BO_MAP                  (0x1 << 5)
> -#define RACE                    (0x1 << 6)
> -#define SKIP_MEMSET             (0x1 << 7)
> -#define FAULT                   (0x1 << 8)
> -#define FILE_BACKED             (0x1 << 9)
> -#define LOCK                    (0x1 << 10)
> -#define MMAP_SHARED             (0x1 << 11)
> -#define HUGE_PAGE               (0x1 << 12)
> -#define SHARED_ALLOC            (0x1 << 13)
> -#define FORK_READ               (0x1 << 14)
> -#define FORK_READ_AFTER         (0x1 << 15)
> -#define MREMAP                  (0x1 << 16)
> -#define DONTUNMAP               (0x1 << 17)
> -#define READ_ONLY_REMAP         (0x1 << 18)
> -#define SYNC_EXEC               (0x1 << 19)
> -#define EVERY_OTHER_CHECK       (0x1 << 20)
> -#define MULTI_FAULT             (0x1 << 21)
> -#define PREFETCH                (0x1 << 22)
> -#define THREADS                 (0x1 << 23)
> -#define PROCESSES               (0x1 << 24)
> -#define PREFETCH_BENCHMARK      (0x1 << 25)
> -#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> -#define PREFERRED_LOC_SMEM      (0x1 << 27)
> +#define MMAP				(0x1 << 0)
> +#define NEW				(0x1 << 1)
> +#define BO_UNMAP			(0x1 << 2)
> +#define FREE				(0x1 << 3)
> +#define BUSY				(0x1 << 4)
> +#define BO_MAP				(0x1 << 5)
> +#define RACE				(0x1 << 6)
> +#define SKIP_MEMSET			(0x1 << 7)
> +#define FAULT				(0x1 << 8)
> +#define FILE_BACKED			(0x1 << 9)
> +#define LOCK				(0x1 << 10)
> +#define MMAP_SHARED			(0x1 << 11)
> +#define HUGE_PAGE			(0x1 << 12)
> +#define SHARED_ALLOC			(0x1 << 13)
> +#define FORK_READ			(0x1 << 14)
> +#define FORK_READ_AFTER			(0x1 << 15)
> +#define MREMAP				(0x1 << 16)
> +#define DONTUNMAP			(0x1 << 17)
> +#define READ_ONLY_REMAP			(0x1 << 18)
> +#define SYNC_EXEC			(0x1 << 19)
> +#define EVERY_OTHER_CHECK		(0x1 << 20)
> +#define MULTI_FAULT			(0x1 << 21)
> +#define PREFETCH			(0x1 << 22)
> +#define THREADS				(0x1 << 23)
> +#define PROCESSES			(0x1 << 24)
> +#define PREFETCH_BENCHMARK		(0x1 << 25)
> +#define PREFETCH_SYS_BENCHMARK		(0x1 << 26)
> +#define PREFERRED_LOC_SMEM		(0x1 << 27)
> +#define ATOMIC_BATCH			(0x1 << 28)
> +#define MIGRATE_ALL_PAGES		(0x1 << 29)
> +#define PREFERRED_LOC_ATOMIC_DEVICE	(0x1 << 30)
> +#define PREFERRED_LOC_ATOMIC_GL		(0x1ull << 31)
> +#define PREFERRED_LOC_ATOMIC_CPU	(0x1ull << 32)
> +#define MADVISE_MULTI_VMA		(0x1ull << 33)
> +#define MADVISE_SPLIT_VMA		(0x1ull << 34)
> +#define MADVISE_ATOMIC_VMA		(0x1ull << 35)
> +#define PREFETCH_SPLIT_VMA		(0x1ull << 36)
> +#define PREFETCH_CHANGE_ATTR		(0x1ull << 37)
> +#define PREFETCH_SAME_ATTR		(0x1ull << 38)
>  
>  #define N_MULTI_FAULT           4
>  
> @@ -478,6 +509,47 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
>   * SUBTEST: processes-evict-malloc-mix-bo
>   * Description: multi-process trigger eviction of VRAM allocated via malloc and BO create
>   * Test category: stress test
> + *
> + * SUBTEST: madvise-multi-vma
> + * Description: performs multiple madvise operations on multiple virtual memory area using atomic device attributes
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma
> + * Description: perform madvise operations on multiple type VMAs (BO and CPU VMAs)
> + * Test category: perform madvise operations on multiple type VMAs (BO and CPU VMAs)
> + *
> + * SUBTEST: madvise-atomic-vma
> + * Description: perform madvise atomic operations on BO in VRAM/SMEM if atomic ATTR global/device
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma-with-mapping
> + * Description: performs prefetch and page migration
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-vram
> + * Description: performs both atomic and preferred loc madvise operations atomic device attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-gl
> + * Description: performs both atomic and preferred loc madvise operations with atomic global attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-cpu
> + * Description: performs both atomic and preferred loc madvise operations with atomic cpu attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-sram-migrate-pages
> + * Description: performs preferred loc madvise operations and migrating all pages in smem
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-no-range-invalidate-same-attr
> + * Description: performs atomic global madvise operation, prefetch and again madvise operation with same atomic attribute
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-range-invalidate-change-attr
> + * Description: performs atomic global madvise operation, prefetch and again madvise operation with different atomic attribute
> + * Test category: functionality test
> + *
>   */
>  
>  static void
> @@ -544,7 +616,7 @@ many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
>  		allocs[i] = alloc;
>  
>  		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,
> -				&tv, &submit);
> +				&tv, &submit, flags & ATOMIC_BATCH);
>  	}
>  
>  	if (barrier)
> @@ -692,7 +764,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  		.num_syncs = 1,
>  		.syncs = to_user_pointer(sync),
>  	};
> -	struct {
> +	struct batch_data {
>  		uint32_t batch[16];
>  		uint64_t pad;
>  		uint64_t vm_sync;
> @@ -750,7 +822,8 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  		uint64_t sdi_addr = addr + sdi_offset;
>  		int b = 0;
>  
> -		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
> +		write_dword((struct test_exec_data *)&data[i], sdi_addr, WRITE_VALUE(&data[i], i),
> +			     &b, ATOMIC_BATCH ? true : false);
>  		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>  
>  		if (!i)
> @@ -773,7 +846,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  		xe_wait_ufence(fd, new ?: exec_ufence, USER_FENCE_VALUE,
>  			       exec_queue, FIVE_SEC);
>  		if (i || (flags & CPU_FAULT))
> -			igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
> +			igt_assert_eq(data[i].data,
> +				      flags & ATOMIC_BATCH
> +				      ? VAL_ATOMIC_EXPECTED
> +				      : READ_VALUE(&data[i]));
>  		exec_ufence[0] = 0;
>  
>  		if (!i) {
> @@ -1001,48 +1077,47 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap-free-huge-preferred-loc-smem:	mmap huge page and free buffer for each exec and perform madvise
>   * @mmap-free-nomemset-preferred-loc-smem:	mmap and free buffer for each exec and perform madvise
>   * @mmap-free-preferred-loc-smem:	mmap and free buffer for each exec and perform madvise
> - * @mmap-free-race-nomemset-preferred-loc-smem:
> - * @mmap-free-race-preferred-loc-smem:
> - * @mmap-huge-nomemset-preferred-loc-smem:
> - * @mmap-huge-preferred-loc-smem:
> - * @mmap-mlock-nomemset-preferred-loc-smem:
> - * @mmap-mlock-preferred-loc-smem:
> - * @mmap-new-huge-nomemset-preferred-loc-smem:
> - * @mmap-new-huge-preferred-loc-smem:
> - * @mmap-new-nomemset-preferred-loc-smem:
> - * @mmap-new-preferred-loc-smem:
> - * @mmap-new-race-nomemset-preferred-loc-smem:
> - * @mmap-new-race-preferred-loc-smem:
> - * @mmap-nomemset-preferred-loc-smem:
> - * @mmap-preferred-loc-smem:
> - * @mmap-prefetch-preferred-loc-smem:
> - * @mmap-prefetch-shared-preferred-loc-smem:
> - * @mmap-race-nomemset-preferred-loc-smem:
> - * @mmap-race-preferred-loc-smem:
> - * @mmap-remap-dontunmap-eocheck-preferred-loc-smem:
> - * @mmap-remap-dontunmap-preferred-loc-smem:
> - * @mmap-remap-eocheck-preferred-loc-smem:
> - * @mmap-remap-preferred-loc-smem:
> - * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem:
> - * @mmap-remap-ro-dontunmap-preferred-loc-smem:
> - * @mmap-remap-ro-eocheck-preferred-loc-smem:
> - * @mmap-remap-ro-preferred-loc-smem:
> - * @mmap-shared-nomemset-preferred-loc-smem:
> - * @mmap-shared-preferred-loc-smem:
> - * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem:
> - * @mmap-shared-remap-dontunmap-preferred-loc-smem:
> - * @mmap-shared-remap-eocheck-preferred-loc-smem:
> - * @mmap-shared-remap-preferred-loc-smem:
> - * @new-bo-map-nomemset-preferred-loc-smem:
> - * @new-bo-map-preferred-loc-smem:
> - * @new-busy-nomemset-preferred-loc-smem:
> - * @new-busy-preferred-loc-smem:
> - * @new-nomemset-preferred-loc-smem:
> - * @new-preferred-loc-smem:
> - * @new-prefetch-preferred-loc-smem:
> - * @new-race-nomemset-preferred-loc-smem:
> - * @new-race-preferred-loc-smem:
> - * @prefetch-benchmark:
> + * @mmap-free-race-nomemset-preferred-loc-smem: mmap and free buffer for each exec with race between cpu and gpu access, perform madvise operation
> + * @mmap-free-race-preferred-loc-smem: mmap and free buffer for each exec with race between cpu and gpu access, perform madvise operation
> + * @mmap-huge-nomemset-preferred-loc-smem: mmap huge page single buffer for all execs, skips memset and perform madvise operation
> + * @mmap-huge-preferred-loc-smem: mmap huge page single buffer for all execs, perform madvise operation
> + * @mmap-mlock-nomemset-preferred-loc-smem: mmap and mlock of a buffer with preferred location set to system memory, skipping memset
> + * @mmap-mlock-preferred-loc-smem: mmap and mlock of a buffer with preferred location set to system memory
> + * @mmap-new-huge-nomemset-preferred-loc-smem: mmap of a newly allocated buffer using huge pages, with preferred location set to system memory and skipping memset
> + * @mmap-new-huge-preferred-loc-smem: mmap of a newly allocated buffer using huge pages, with preferred location set to system memory
> + * @mmap-new-nomemset-preferred-loc-smem: mmap of a newly allocated buffer with preferred location set to system memory and skipping memset
> + * @mmap-new-preferred-loc-smem: mmap of a newly allocated buffer with preferred location set to system memory
> + * @mmap-new-race-nomemset-preferred-loc-smem: mmap of a newly allocated buffer with preferred location set to system memory and skipping memset
> + * @mmap-new-race-preferred-loc-smem: mmap of a newly allocated buffer with preferred location set to system memory
> + * @mmap-nomemset-preferred-loc-smem: mmap of a buffer with preferred location set to system memory, skipping memset
> + * @mmap-preferred-loc-smem: mmap of a buffer with preferred location set to system memory
> + * @mmap-prefetch-preferred-loc-smem: prefetching mmap buffer with preferred location set to system memory
> + * @mmap-prefetch-shared-preferred-loc-smem: mmap of a shared buffer with prefetch and preferred location set to system memory
> + * @mmap-race-nomemset-preferred-loc-smem: Tests mmap of a buffer with preferred location set to system memory, skipping memset
> + * @mmap-race-preferred-loc-smem: mmap buffer with race between GPU and CPU access with preferred location set to system memory
> + * @mmap-remap-dontunmap-eocheck-preferred-loc-smem: mmap and remap of a buffer with preferred location set to system memory, does not unmap after use
> + * @mmap-remap-dontunmap-preferred-loc-smem: mmap and remap of a buffer with preferred location set to system memory, does not unmap after use
> + * @mmap-remap-eocheck-preferred-loc-smem: mmap and remap of a buffer with preferred location set to system memory
> + * @mmap-remap-preferred-loc-smem: mmap and remap of a buffer with preferred location set to system memory
> + * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem: mmap and remap of a read-only buffer with preferred location set to system memory, does not unmap after use
> + * @mmap-remap-ro-dontunmap-preferred-loc-smem: mmap and remap of a read-only buffer with preferred location set to system memory, does not unmap after use
> + * @mmap-remap-ro-eocheck-preferred-loc-smem: mmap and remap of a read-only buffer with preferred location set to system memory
> + * @mmap-remap-ro-preferred-loc-smem: mmap and remap of a read-only buffer with preferred location set to system memory
> + * @mmap-shared-nomemset-preferred-loc-smem: mmap of a shared buffer with preferred location set to system memory, skipping memset
> + * @mmap-shared-preferred-loc-smem: mmap of a shared buffer with preferred location set to system memory
> + * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem: mmap and remap of a shared buffer with preferred location set to system memory, does not unmap after use
> + * @mmap-shared-remap-dontunmap-preferred-loc-smem: mmap and remap of a shared buffer with preferred location set to system memory
> + * @mmap-shared-remap-eocheck-preferred-loc-smem: mmap and remap of a shared buffer with preferred location set to system memory with end of check validation
> + * @mmap-shared-remap-preferred-loc-smem: mmap and remap of a shared buffer with preferred location set to system memory without end of check validation
> + * @new-bo-map-nomemset-preferred-loc-smem: Tests allocation and mapping of a new buffer object with preferred location set to system memory, skipping memset
> + * @new-bo-map-preferred-loc-smem: ests allocation and mapping of a new buffer object with preferred location set to system memory
> + * @new-busy-nomemset-preferred-loc-smem: Tests allocation and usage of a new busy buffer object with preferred location set to system memory, skipping memset
> + * @new-busy-preferred-loc-smem: ests allocation and usage of a new busy buffer object with preferred location set to system memory
> + * @new-nomemset-preferred-loc-smem: Tests allocation of a new buffer object with preferred location set to system memory, skipping memset
> + * @new-preferred-loc-smem: Tests allocation of a new buffer object with preferred location set to system memory
> + * @new-prefetch-preferred-loc-smem: Tests allocation and prefetching of a new buffer object with preferred location set to system memory
> + * @new-race-nomemset-preferred-loc-smem: Tests allocation of a new buffer object with preferred location set to system memory, skipping memset
> + * @new-race-preferred-loc-smem: tests allocation of a new buffer object with preferred location set to system memory
>   *
>   * SUBTEST: prefetch-benchmark
>   * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
> @@ -1072,16 +1147,6 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * Description: Create multiple threads with a faults on different hardware engines to same addresses, racing between CPU and GPU access
>   * Test category: stress test
>   */
> -
> -struct test_exec_data {
> -	uint32_t batch[32];
> -	uint64_t pad;
> -	uint64_t vm_sync;
> -	uint64_t exec_sync;
> -	uint32_t data;
> -	uint32_t expected_data;
> -};
> -
>  static void igt_require_hugepages(void)
>  {
>  	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
> @@ -1090,11 +1155,37 @@ static void igt_require_hugepages(void)
>  		      "No huge pages available!\n");
>  }
>  
> +static int
> +xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +			int pat_index)
> +{
> +	return	xe_vm_madvise(fd, vm, addr, range, 0,
> +			      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
> +}
> +
> +static int
> +xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +			  int mem_attr)
> +{
> +	return	xe_vm_madvise(fd, vm, addr, range, 0,
> +			      DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> +			      mem_attr, 0);
> +}
> +
> +static int
> +xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
> +{
> +	return	xe_vm_madvise(fd, vm, addr, range, 0,
> +			      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
> +			      DRM_XE_MIGRATE_ALL_PAGES);
> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
>  	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> -	  unsigned int flags)
> +	  unsigned long long flags)
>  {
>  	uint64_t addr;
>  	struct drm_xe_sync sync[1] = {
> @@ -1107,9 +1198,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		.syncs = to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> -	struct test_exec_data *data, *next_data = NULL;
> +	struct test_exec_data *data, *next_data = NULL, *org_data;
>  	uint32_t bo_flags;
>  	uint32_t bo = 0, bind_sync = 0;
> +	uint32_t val;
>  	void **pending_free;
>  	u64 *exec_ufence = NULL, *bind_ufence = NULL;
>  	int i, j, b, file_fd = -1, prev_idx, pf_count, err;
> @@ -1234,6 +1326,133 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				 strerror(errno), vm, to_user_pointer(data), bo_size);
>  	}
>  
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		if (flags & MIGRATE_ALL_PAGES) {
> +			err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
> +			if (err)
> +				igt_warn("failure in page migration err = %s, vm =%u, data=%"PRIu64"\n",
> +					 strerror(errno), vm, to_user_pointer(data));
> +		} else {
> +			err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +					    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +					    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		}
> +	}
> +	if (flags & PREFERRED_LOC_ATOMIC_DEVICE) {
> +		err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
> +		if (err)
> +			igt_warn("failure in page migration err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> +						DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in atomic device attr err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & PREFERRED_LOC_ATOMIC_GL) {
> +		err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
> +		if (err)
> +			igt_warn("failure in page migration err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> +						DRM_XE_ATOMIC_GLOBAL);
> +		if (err)
> +			igt_warn("failure in atomic global attr err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & PREFERRED_LOC_ATOMIC_CPU) {
> +		err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
> +		if (err)
> +			igt_warn("failure in page migration err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> +						DRM_XE_ATOMIC_CPU);
> +		if (err)
> +			igt_warn("failure in atomic cpu attr err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & MADVISE_MULTI_VMA) {
> +		if (bo_size)
> +			bo_size = ALIGN(bo_size, SZ_4K);
> +		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) + bo_size/2,
> +						bo_size/2, DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in atomic device attr err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) + bo_size,
> +						bo_size, DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in atomic multi_vma err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err = xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size, intel_get_pat_idx_wb(fd));
> +		if (err)
> +			igt_warn("failure in pat attr index 4 err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err = xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size, intel_get_pat_idx_wb(fd));
> +		if (err)
> +			igt_warn("failure in pat attr index 3 err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err = xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size/2, bo_size/2,
> +					     intel_get_pat_idx_wb(fd));
> +		if (err)
> +			igt_warn("failure in pat attr index 8 err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & MADVISE_SPLIT_VMA) {
> +		if (bo_size)
> +			bo_size = ALIGN(bo_size, SZ_4K);
> +
> +		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo = xe_bo_create(fd, vm, bo_size,
> +				  vram_if_possible(fd, eci->gt_id), bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) + bo_size/2,
> +				 bo_size/2, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) + bo_size/2,
> +				    bo_size/2, DRM_XE_VM_BIND_OP_MAP,
> +				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				    1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +		data[0].vm_sync = 0;
> +		gem_close(fd, bo);
> +		bo = 0;
> +
> +		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> +						bo_size/2, DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in split atomic device attr err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & MADVISE_ATOMIC_VMA) {
> +		if (bo_size)
> +			bo_size = ALIGN(bo_size, SZ_4K);
> +
> +		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data), bo_size, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data), bo_size,
> +				    DRM_XE_VM_BIND_OP_MAP,
> +				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				    1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +		data[0].vm_sync = 0;
> +		gem_close(fd, bo);
> +		bo = 0;
> +
> +		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
> +						DRM_XE_ATOMIC_GLOBAL);
> +		if (err)
> +			igt_warn("failure in atomic vma err = %s, vm =%u data=%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo = xe_bo_create(fd, vm, bo_size,
> @@ -1307,6 +1526,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		bool fault_inject = (FAULT & flags) && i == n_execs / 2;
>  		bool fault_injected = (FAULT & flags) && i > n_execs;
>  
> +		if (flags & MADVISE_MULTI_VMA) {
> +			addr = addr + bo_size;
> +			org_data = data;
> +			data = from_user_pointer(addr);
> +			batch_offset = (char *)&(data[idx].batch) - (char *)data;
> +			batch_addr = addr + batch_offset;
> +			sdi_offset = (char *)&(data[idx].data) - (char *)data;
> +			sdi_addr = addr + sdi_offset;
> +		}
> +
>  		if (barrier)
>  			pthread_barrier_wait(barrier);
>  
> @@ -1316,18 +1545,74 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				__write_dword(data[idx].batch,
>  					      sdi_addr + j * orig_size,
>  					      WRITE_VALUE(&data[idx], idx), &b);
> -			write_dword(data[idx].batch, sdi_addr + j * orig_size,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr + j * orig_size,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
>  		} else if (!(flags & EVERY_OTHER_CHECK)) {
>  			b = 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> +			if (flags & PREFETCH) {
> +				if (flags & PREFETCH_SPLIT_VMA) {
> +					bo_size = ALIGN(bo_size, SZ_4K);
> +
> +					xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
> +
> +					igt_info("num_vmas before madvise = %d \n", val);
> +
> +					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +
> +					err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
> +					if (err)
> +						igt_warn("failure in prefetch split vma err = %s, vm =%u data=%"PRIu64"\n",
> +								strerror(errno), vm, to_user_pointer(data));
> +					igt_info("num_vmas after madvise= %d \n", val);
> +					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +				} else if (flags & PREFETCH_SAME_ATTR) {
> +					err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> +							DRM_XE_ATOMIC_GLOBAL);
> +					if (err)
> +						igt_warn("failure in prefetch same attr err = %s, vm =%u data=%"PRIu64"\n",
> +								strerror(errno), vm, to_user_pointer(data));
> +					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +					xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +					err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
> +							DRM_XE_ATOMIC_GLOBAL);
> +					if (err)
> +						igt_warn("failure in prefetch atomic attr err = %s, vm =%u data=%"PRIu64"\n",
> +								strerror(errno), vm, to_user_pointer(data));
> +				} else if (flags & PREFETCH_CHANGE_ATTR) {
> +					err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> +							DRM_XE_ATOMIC_GLOBAL);
> +					if (err)
> +						igt_warn("failure in prefetch atomic attr err = %s, vm =%u data=%"PRIu64"\n",
> +								strerror(errno), vm, to_user_pointer(data));
> +					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +
> +					xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +
> +					err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> +							DRM_XE_ATOMIC_DEVICE);
> +					if (err)
> +						igt_warn("failure in prefetch change attr err = %s, vm =%u data=%"PRIu64"\n",
> +								strerror(errno), vm, to_user_pointer(data));
> +					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +					}
> +				} else {
> +					b = 0;
> +					write_dword((struct test_exec_data *)&data[idx], sdi_addr,
> +						     WRITE_VALUE(&data[idx], idx), &b,
> +						     flags & ATOMIC_BATCH ? true : false);
> +						     igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> +				}
>  		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
>  			b = 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
>  
>  			aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
> @@ -1346,10 +1631,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			__aligned_partial_free(&aligned_alloc_type);
>  
>  			b = 0;
> -			write_dword(data[next_idx].batch,
> +			write_dword(&data[next_idx],
>  				    to_user_pointer(next_data) +
>  				    (char *)&data[next_idx].data - (char *)data,
> -				    WRITE_VALUE(&data[next_idx], next_idx), &b);
> +				    WRITE_VALUE(&data[next_idx], next_idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <= ARRAY_SIZE(data[next_idx].batch));
>  		}
>  
> @@ -1404,9 +1690,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  					       exec_queues[e], &timeout);
>  			igt_assert(err == -ETIME || err == -EIO);
>  		} else {
> -			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> -				       &data[idx].exec_sync, USER_FENCE_VALUE,
> -				       exec_queues[e], FIVE_SEC);
> +			if (flags & PREFERRED_LOC_ATOMIC_CPU) {
> +				int64_t timeout = QUARTER_SEC;
> +				err = __xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> +						       &data[idx].exec_sync,
> +						       USER_FENCE_VALUE,
> +						       exec_queues[e], &timeout);
> +				if (err)
> +					goto cleanup;
> +			} else
> +				xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> +					       &data[idx].exec_sync, USER_FENCE_VALUE,
> +					       exec_queues[e], FIVE_SEC);
>  			if (flags & LOCK && !i)
>  				munlock(data, bo_size);
>  
> @@ -1456,17 +1751,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				if (flags & FORK_READ) {
>  					igt_fork(child, 1)
>  						igt_assert_eq(data[idx].data,
> -							      READ_VALUE(&data[idx]));
> +							      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
>  					if (!(flags & FORK_READ_AFTER))
>  						igt_assert_eq(data[idx].data,
> -							      READ_VALUE(&data[idx]));
> +							      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
>  					igt_waitchildren();
>  					if (flags & FORK_READ_AFTER)
>  						igt_assert_eq(data[idx].data,
> -							      READ_VALUE(&data[idx]));
> +							      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
>  				} else {
>  					igt_assert_eq(data[idx].data,
> -						      READ_VALUE(&data[idx]));
> +						      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
>  
>  					if (flags & PREFETCH_SYS_BENCHMARK) {
>  						struct timespec tv = {};
> @@ -1494,13 +1789,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  								((void *)data) + j * orig_size;
>  
>  							igt_assert_eq(__data[idx].data,
> -								      READ_VALUE(&data[idx]));
> +								      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
>  						}
>  					}
>  				}
>  				if (flags & EVERY_OTHER_CHECK)
>  					igt_assert_eq(data[prev_idx].data,
> -						      READ_VALUE(&data[prev_idx]));
> +						      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[prev_idx]));
>  			}
>  		}
>  
> @@ -1521,6 +1816,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			gem_close(fd, bo);
>  		}
>  
> +		if (flags & MADVISE_MULTI_VMA)
> +			data = org_data;
> +
>  		if (flags & NEW) {
>  			if (flags & MMAP) {
>  				if (flags & FREE)
> @@ -1610,6 +1908,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				 pf_count, pf_count_after);
>  	}
>  
> +cleanup:
>  	if (bo) {
>  		sync[0].addr = to_user_pointer(bind_ufence);
>  		__xe_vm_bind_assert(fd, vm, 0,
> @@ -1864,7 +2163,7 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  
>  struct section {
>  	const char *name;
> -	unsigned int flags;
> +	unsigned long long flags;
>  };
>  
>  igt_main
> @@ -1964,6 +2263,19 @@ igt_main
>  		{ "malloc-mix-bo", MIX_BO_ALLOC },
>  		{ NULL },
>  	};
> +	const struct section msections[] = {
> +		{ "preffered-loc-sram-migrate-pages", PREFERRED_LOC_SMEM | MIGRATE_ALL_PAGES | ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-vram", PREFERRED_LOC_ATOMIC_DEVICE | ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-gl", PREFERRED_LOC_ATOMIC_GL | ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-cpu", PREFERRED_LOC_ATOMIC_CPU | ATOMIC_BATCH },
> +		{ "multi-vma", MADVISE_MULTI_VMA | ATOMIC_BATCH },
> +		{ "split-vma", MADVISE_SPLIT_VMA | ATOMIC_BATCH },
> +		{ "atomic-vma", MADVISE_ATOMIC_VMA | ATOMIC_BATCH },
> +		{ "split-vma-with-mapping", PREFETCH | PREFETCH_SPLIT_VMA | ATOMIC_BATCH },
> +		{ "range-invalidate-change-attr", PREFETCH | PREFETCH_CHANGE_ATTR | ATOMIC_BATCH },
> +		{ "no-range-invalidate-same-attr", PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
> +		{ NULL },
> +	};
>  	int fd;
>  	int num_sections;
>  
> @@ -1983,10 +2295,11 @@ igt_main
>  	for (const struct section *s = sections; s[num_sections].name; num_sections++)
>  		;
>  
> -	for (int i = 0; i < num_sections * 2; i++) {
> -		struct section *s = &sections[i % num_sections];
> +	for (int i = 0; i < num_sections * 3; i++) {
> +		struct section p = sections[i % num_sections];
> +		struct section *s = &p;
>  
> -		if (i/num_sections == 0) {
> +		if (i/num_sections == 1) {
>  			static char modified_name[256];
>  			snprintf(modified_name, sizeof(modified_name), "%s-preferred-loc-smem", s->name);
>  			s->name = modified_name;
> @@ -2175,6 +2488,14 @@ igt_main
>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>  	}
>  
> +	for (const struct section *s = msections; s->name; s++) {
> +		igt_subtest_f("madvise-%s", s->name) {
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
> +						NULL, s->flags);

Since these sections are pretty directed and test_exec() is really
designed to do bunch random things all at the same time (e.g., like my
swillze suggestion in prior patch), I'd write a dedicated test function
for these madvise tests. People complain test_exec is already too
complicated / not modular enough, I intend to clean this function up a
bit when I have time. Adding more cases to that function will make this
worse.

If you'd like to reuse parts of the functionality in test_exec(), break
out the parts you need into helpers and then call them from you new
function which implements the directed tests for madvise. This would
help make test_exec() a bit more readable too.

Matt

> +		}
> +	}
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		drm_close_driver(fd);
> -- 
> 2.43.0
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D301C36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 08:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5CC10E128;
	Tue, 25 Mar 2025 08:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgJ2NUdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F6E10E128
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 08:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742892716; x=1774428716;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EVHZWTkvC7pw1rnBts+lCQ1I2cbmxDVqJoeK5nQA69Q=;
 b=kgJ2NUdtJXf4FvjbD63ndrbyb1QKzl6NevcmsBhqoS1W0Iev72WJHmis
 OwRgvX0O5IhpswpzqkBDVjI0nYjBYOke7Q9iVhMZcyctOTIT+zNADCg+H
 SbtQgu+8oVXz27Q8JxG/HWpAD8JlqzrkLABNjV3dueaprhU19wcgy4nnC
 E1DmhkxJvmbmJpcH+lofq9BsOopwD6CTPeLWt9orLPBaIWgGJW1WWPmgk
 HWpmRsB1+dRFNsgTSNHey9W1w+OcZU9oPtOuFxrcLe8xjirzDFm4py+3Z
 wEI91IWHp3m10MeXks2fmVTzrLaC4S8kOcwoRo+XWon/NTeTiiU5pT84x Q==;
X-CSE-ConnectionGUID: yeZGv9pqQFi8nRnhg6yVlw==
X-CSE-MsgGUID: YRQTcQMmR3Ge0eRdGcSOvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44312367"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="44312367"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 01:51:53 -0700
X-CSE-ConnectionGUID: mDikEApzTu2fl6pYYuvwjQ==
X-CSE-MsgGUID: Vl8fnvT2Rf6rqR8LHsB/hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124274214"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 01:51:53 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Mar 2025 01:51:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 01:51:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 01:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTLS+4k9ScNbVhtTWCN2v77UPGOXQXWVYRU0wMpq0CsfI5CORsfR42bGTVMdnTevc2+uCOyemdiPCeepon4r4F0IGuNwrAVsJcuFAIS2piTpySnmPHdW817Jcg7myTylv7a6WDn7hEw6oyiXWlKshPFEa8jfbQ+CoC1448irH36FnxRSxGv5ZzshNxIEGith3/rS+AsNjrYhdJiUy49foNaiUX6d/mx83cO1YLaSFdqDaxc+oKMMxamwTfnKUvUzR8saDOmsenDthfjBibCEG2GS8MrF9Rr7zsg4pUZOLa6ZGKUqUdpWBXlyrJmlfqNGH1ol9XCm0bU0sAjmPOZVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gv0kFLwHnhu6mucWMT/QE0ZmW8tVLv1ExcBweFFwDmY=;
 b=dn0D+2Njw9mn3Ptq02a49A9YQFoYoBaMf1z6yrQ23K5VjSZi+7AVXSeWw1B4aBMywW3hxz7SSMTzXr+Zio9Fq9bpU6J4GPIkxVw1FzY6Mg+CoaYkWjZnM7NQ5S0hem0QejY7Dj0DOiqLhz97ma7FMMLBOnVuc/tGKOOzN51gNEszR/TIUyt629ytTJcbnlsSaARYYZ0EQw0YtWzw720TXEaKoS3dy+euIwoQmYSEVpzMfS1OG6sozMwKx4nN/VjQk067IhMgtWoltGuAi41HQ8wXklk+N2GE3vAqP0Er8OCr0+tImxZ8R1rJaFMGbWoK6zWGwYekgdu7Er0xKTFWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB8467.namprd11.prod.outlook.com (2603:10b6:610:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 08:51:49 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 08:51:49 +0000
Date: Tue, 25 Mar 2025 09:51:40 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/intel_compute.c : Increase WMTP loop count
Message-ID: <Z-JunHtuZWtgVRgp@fdugast-desk>
References: <20250325052901.195938-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250325052901.195938-1-priyanka.dandamudi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR06CA0118.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::47) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dae9ffd-b190-483e-3dd9-08dd6b7a47f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uFzmRK7rC2GQpvEV0adV+kTFSbNy88kcjz7iqKX9oU09aa1pC0OKk9LRB033?=
 =?us-ascii?Q?4QPliqv0LIUvvE0Kk/YZ/XrInCicJyEU9dHmcHKF99VfECnoBjuUiMbG4bhP?=
 =?us-ascii?Q?bnJw7ffradGEihPZHuDyCzIrIot1U81+VTL46jln7budptr+aXwhao7oKkB3?=
 =?us-ascii?Q?ddRxw6srCaDZTl16ZyRkycn+7ZyJwAPVul+8cHxbtesTq12XO3aVYWbezKl/?=
 =?us-ascii?Q?F2U/9THbLdi8pMRwNTC3dn1/jJCFcVEIWSRbzbPkPgRqOHwxhVxGHCNNN70M?=
 =?us-ascii?Q?2rgQQk75DiMKJCpC/AXr7KZ+TflBZx2tIIgdgudPQZ+gdeOzrB6Be8mX2a2d?=
 =?us-ascii?Q?7IcYX9IRPZD9D8CZS19XgPkc5h4uUAYz07AAlDxDt5pdicHhaXchVgz/X4ku?=
 =?us-ascii?Q?1tnkijRxVRT/XugJmUmS+/fEr+rOr6b8U4jVAHiIhx3x7RWF3hYavVli9sCj?=
 =?us-ascii?Q?rTNwR0O+ZzJsLA2N1m1XvpBX1icbA0rrMlFiAQyIKM7AEAMumUmaoV7nT6vB?=
 =?us-ascii?Q?K4cyBCaZ3hcP2Pg+Jlc65qcd0JTLKSwW0E8dvKxasX4qT6Q3BTY8p6QCh1vD?=
 =?us-ascii?Q?U77ZYgQppEl9Lisc+G9mhDchCIgRRpk2aRvDAJ3O5nlpYVqgUto6AL2VGuCP?=
 =?us-ascii?Q?PEodpZoTVjVCVOmFXIdVnqSRvJVzGalc3dEd6kkOvMAYTNmijLOLQtIWifY/?=
 =?us-ascii?Q?HofI+JYJtg3bjY3YhhYww/IVvQ6hfi9le1CNZrWm+tX6xdJOrUNISHGcQg2Y?=
 =?us-ascii?Q?K7H6l3yyeeYNgJOVGWpygqQE31ESsbTYF6fKOnSWacwpwhqi+2whV90lTci+?=
 =?us-ascii?Q?MqegGwcQYnC2/UF6ODrt6wADm36ofLe1XMsX/GFH9h9w5cMbztjF1piQAAbK?=
 =?us-ascii?Q?dAxGKulnDYbGV5QhvTBC+42Ne+1sO8OpIrMtU43pB/UsPBQljyGvEdzwPdho?=
 =?us-ascii?Q?KyO1AxCjex3rwV/xogzt4iRxD+H1RclgX6QILtXDypXuYIyich5yaWeVll20?=
 =?us-ascii?Q?u94x86Solqw7+FmDNN+l1SgMU4pzxH/whdW4ZxeTv/fS1R//Hz/N1sy3uZiX?=
 =?us-ascii?Q?UjHGsMWK2tBH23g2dRRzaRrmNCKq8jrKofWgrhNzlbjCRaqqsqqK09tFQtmU?=
 =?us-ascii?Q?Q9vGMiT5r4BjdhBEHgVCWcHnNv6/zTRBrVFlly9yl7UNUy5ngYPDUHrnWhxf?=
 =?us-ascii?Q?Jltze2T+CnAiY7Q+hx4FG9qMk4q0GMqqFiAzWUEM9kePiR8zyt9QXVT2u1FS?=
 =?us-ascii?Q?XYFux9TaP+sWQ9QE1LHnXlR2d00QRKm2z1qoM1jSek9sP+qlB6+bZu8LE/wy?=
 =?us-ascii?Q?G0T/Z5UEsw9cOKuRT0kQNrz8vH1KvQg/2X2iH3JTuxFEHXlz1oZdaHJh0kwS?=
 =?us-ascii?Q?zNz3s20hELxd/qpyRse2AvAMQr0P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q1MJlHyVIlD/CWl3WqqG7WfODMiezhwat+Ay427gziwSITDdyxMoG3ysSSJ7?=
 =?us-ascii?Q?/stR1Vx6DyYq8XqBjDZFffNh7HbKNNXm+yYr5A8g3VkPyywCaETAqVLIJqMh?=
 =?us-ascii?Q?D5Vj4xQNaNcQXHz7Qq4svLrcfOUEjM6hxw81Kxiz4HBD0Uypa0S99Ct37ukH?=
 =?us-ascii?Q?K7T9MvXgHVKHStskGfRCdk+trrUof09EQLERncox+4HujtWMggTS3Qps0UTz?=
 =?us-ascii?Q?3+Bz9MWfoy4+dX+JNCBA3vktLiTNeQ4fhgVh0zjimI0pWHZoBGKiVqcfS8yn?=
 =?us-ascii?Q?lhndStdX0lIlQT15YXcps+cMDvJykvaYe6/PerFp+zgi89TisNXqMm3FmriH?=
 =?us-ascii?Q?77RRrPNnYAtzcgp8ZNnT24C3T+5hm06d2wDk0Km+BI44h9/pcHao+kRZOe6G?=
 =?us-ascii?Q?EBd8VhTDVJxYlDMqqB8wmum3KTngqRuxQ8TU++YB1ZpvmepZ7Koc7Pk+haO7?=
 =?us-ascii?Q?88sMD8F6RmqGNe+TcztEfLQ3u5KGuDSfawzsd/4IfIGiVPJTiqVHZ176LwMG?=
 =?us-ascii?Q?bO2FWRCyjWfsJKYSwN200gpRlvq2dN25fYqIrNqXrAs998K5rb7Ijluj5AA8?=
 =?us-ascii?Q?Ll2XzRCGxFeCJZFhxEwvkE3cKD2XGLZv0KyFW+uRWe9p2lxz4km+93+18Vvs?=
 =?us-ascii?Q?+9fUt46Xcj4c2tC5xTbDKLvGN9XiPE+MgkQTc08JrjEaofpxbR0GFcoIfhLc?=
 =?us-ascii?Q?+M3wTRir4lrU3hUCNeQt68xWIJTkYoRFMBSmufKKvcuELW6vAs6+o53xN0Ny?=
 =?us-ascii?Q?jkPfD650eO0tKUwpAYtG+xe7XT5tNJy5Jk50Zo+fYSe8OZ6RcwSol45F9z6z?=
 =?us-ascii?Q?oesr0x6KensU7A72Yqd9jdWUCL5aZoAGZDJpC0pCq+ZwZljg+e4PFLQDuwcD?=
 =?us-ascii?Q?23jD/kcdDwaR58xc9NO7W5JJg+y2r21grG+SuhZ+SICjMQ5Apxk39ihHEJEA?=
 =?us-ascii?Q?s/igHuHuw7Sei3/TBH4XCtY2F7Md4naToB4zZSMMbm9hWgWTgGHHrDzsoHQd?=
 =?us-ascii?Q?9iXFCxNG7Wveyxrjs0A4j0ns0xMLD5AmvwOLqWDa1mWBYC4Eoluczurx1R2C?=
 =?us-ascii?Q?RzzCpaAWuOQjVMHaueIsi2lyIt2noia0qlrKA/MxkAU0ULxL9jlIDpxQ74q7?=
 =?us-ascii?Q?/hgRfhmJgQBfW1MRaXa6wjX0LFqPE/0XLyCUhVu9Vfelj1jATbyP3NUPYm9m?=
 =?us-ascii?Q?wc1qEzVHXFVeoCUxqLJ3LJryAzaIoveZ7aM/EYdgUQIwWapeRy6M7cwI602X?=
 =?us-ascii?Q?KyyfAC7jG3vrblLtRum9mf3K9sfONQkvULDa5ey0i7HFu4GZbbsJVvESfREd?=
 =?us-ascii?Q?ZWTTiuVKYvK8QRt/VRa9Ag7L6RpyVCakQrxx90f1wqbE5fPAE0pFroIAlZYI?=
 =?us-ascii?Q?1yHwUby459+Q1vbos/Ij21IkYezCU03HPsmFyMQUZjMCWw6WFcdFQABKSJjo?=
 =?us-ascii?Q?7SnAARrqkKAfvItFT+NLtxUYlmXTYP6Fcw6EHa0DVurOqO/uZqnjecZgH3Cj?=
 =?us-ascii?Q?HCLjAJnbA1PwhkwTVhLpl0tTUvI4K3iuF6876KB92BUIO/SgWsTkr+dCWdTa?=
 =?us-ascii?Q?qMsbFvXHlcJlqoZSQx8gNJJZ4dj1FJMorShSBbHhucQCRxhx5NodQ2oTfK37?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dae9ffd-b190-483e-3dd9-08dd6b7a47f0
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 08:51:49.4813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItvlrtTHiQlOBQsAZ4xRJLDvGqINQaIj8At8zIBn4/6LvfkrHMTWOmK4Az/9g/Xyk52nog9qXjF69BM1cbnX7OU6IPZq+iEzmjdEd7GrqUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8467
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

Hi Priyanka,

On Tue, Mar 25, 2025 at 10:59:01AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Preemption is not happening and getting failed at the check for long
> kernel with current WMTP loop count. So, increasing the loop count.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/intel_compute.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 28149db53..76d435794 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -52,7 +52,7 @@
>   * WMTP - Walker Mid Thread Preemption
>   */
>  #define TGP_long_kernel_loop_count		10
> -#define WMTP_long_kernel_loop_count		1000000
> +#define WMTP_long_kernel_loop_count		1500000

I am still observing sporadic issues in compute-preempt-many with this
new value, but not with 2000000.

Francois

>  
>  struct bo_dict_entry {
>  	uint64_t addr;
> -- 
> 2.34.1
> 

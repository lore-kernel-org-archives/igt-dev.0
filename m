Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB56C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59E010E063;
	Fri, 28 Mar 2025 08:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEfPDbIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3997410E063
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743151266; x=1774687266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PClFOQ1xPZgNAMOH4KHJLTfbkXA1hUr4kuyxUS7HI1M=;
 b=bEfPDbIc3yfsRMMfn5o3HLULrbvLzGT4uTRFIp+H9n2Vl52+41NYeuWy
 Z/FD6q/3w9cVsK2OPZFPBHZXf0XFCOOjD1wJ4V3FwC6/46W7yxhMTOJXn
 +Hp12qMMp7dKJhoM9NmCw0k5qudh4wKTPCPUI++JSyXu37MWK7jwRFXPB
 Cc8Ro9LA5Y1PBnbcYhB0H0YprdyJmxJIKeDwClYMcArnSdc62ngnSSH8L
 0D1oIn5F/0z4BEqW7PxQhx7TE3+ttZ3/cEyjlpxPHALPaSo06mAtdif8U
 OnSqjkX7ip5toBrEObXhHczej1N+pEdUvByYrqddm0NgtBL5a1BgzwM4c Q==;
X-CSE-ConnectionGUID: EFld2hQcS42Itd9QLG1gyQ==
X-CSE-MsgGUID: EyzDG0Y1Sj2UW5QX/O5M8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="32110530"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="32110530"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:41:06 -0700
X-CSE-ConnectionGUID: UcmgeYEOTtSxVwe23NIX9A==
X-CSE-MsgGUID: 6ExV49TSSpGTRs3JcdYdqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="156322422"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:41:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 01:41:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 01:41:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 01:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaFHnmZ59mEtzN1Q7uWgowQuAJuHvYBzW0J5ot3t9JZ7uBUx7r2KVBmjsaZMhQWu7ayfOpt3JYo1dr0QF8S531FkP5y9gYom/PWBXhuu3GlbhkJ7GFLPDbndC4gYYAJjY8TLR/VtQXakOSgxCNyWIJ4EHCjBR2gj1pfnwVTwhQJC78Gfw88U+kLrfHi2YnejopLmbK3ZJ1jwCEjuxJOtXZ/UZXfgtakqv3rxuE35LBzh1CXg31RIblmloE1BNrZYOIg9zcpEWtzUFOPrkHBy+ExDQS4fJGraeT7iMMpkvgOx3fgYcEIoMzmBOCFYt1uTaTww6KWBIwIlQyjlAnhVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yt9pcnl4JG3qXo1BjF0kHpbjKWC/7YdXHpXwMkPEQF0=;
 b=ar6QwyPSuC9uIlSHHvOT8gmJG/VWzMUDvRYYnDrwuCaJkq5HsQEi9mNA77YAjqvyPtqJ0PDmFXydPS+nhaWUCEqNZ3uYjqKK9k5cFS7+lMRvE86GLul8nEMAoyELwD7+1f2rVmXRr7R6vjycurR9vp+WI9xAHLnH46sxACzSQvF43dEb7sGvKSG+TkNxrW9yF4I2/plgP9U8wU6RZBQ3hj+vitABNmLxX4NHrQCRc1PMceqfQb+1R4+6+qseeEr6JJ4fX4IURzlTQSPNu9Ph7lpgrdKmuD7erkrMje+fpf/tEQMKnuVVdw3qq6W8hit3JevMpdxAO6Oi0lDzOd7EcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 28 Mar
 2025 08:41:03 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:41:03 +0000
Date: Fri, 28 Mar 2025 09:40:55 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/intel_compute.c : Increase WMTP loop count
Message-ID: <Z-ZgjmTZveVN4w6b@fdugast-desk>
References: <20250325135817.198133-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250325135817.198133-1-priyanka.dandamudi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW4PR11MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: d8451a5e-20c7-43c0-b23b-08dd6dd445ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?epeOZto6S8KWbo3yTLBBC02eWsmy1lI7gLP7Ri9D9iW+vD1sKQdPEZesf99I?=
 =?us-ascii?Q?OSJtL1bx4FEEDMq++EjIFIf6uc45gJk0WGfLO/vTIfK2gqpZDaHR6cFwgjZn?=
 =?us-ascii?Q?JIJSE7xI+ve3R0LMaMVn6m9+WULNwNDnqEtysJY/REGjywJk3Bdme+53S3SH?=
 =?us-ascii?Q?HSzJ+rbr8QoURwCefK47ZAntkTwHsYDK+bO3TfwzxslfUlTKI2lGj59H7AZh?=
 =?us-ascii?Q?nwQCQc4jmvPKtSkNZWKVFsuG1O6UCnZiCuz1N18LwfaG8gFLG5WPNrfKLDmN?=
 =?us-ascii?Q?0FHDVqovk5n2A+p4OVvBwSLm3HByhohEAz8MMmwY1o05zS7DunHWHSeQpZWu?=
 =?us-ascii?Q?Hqty5hy/N+mHMyHeMWEoj2SFrie1CubL1Vka/NO9aoC5zJZuLTux0NCF7b1o?=
 =?us-ascii?Q?ljShlLiipltBz+m4ycnHt5VPgvfhXC/iBxkd1ochiWJTf/CH6nc1VqpM/Tv2?=
 =?us-ascii?Q?9A1yKUUlva7cMV+1tz4viEnZo96g5dDOuvHrVr7aQRjNuvIPi4DuiJwwrLdK?=
 =?us-ascii?Q?bcSuRn69C+okKZ+Ub0I2xOykiOM0e7vtAFVz4OIyBmSH32CDXVkKkwhr06EI?=
 =?us-ascii?Q?uP1n5OEcBPB/cJILQlT3A99MmiDznhrCqSPWkOgil9hAG96SdlJL0xmRC2l8?=
 =?us-ascii?Q?Ll5B4t95DVQRWZbpSojSliRIpydXE3QYLg1hY2Kh7AzDkFafIJCwg+LzcjIe?=
 =?us-ascii?Q?LkpRU7GgE6IWTDMIhQXJJygWFQAoBv7AOcQGZg40zhN9Zc+V2dGTBt+YE5YY?=
 =?us-ascii?Q?qTbIpFZwF+oirY8/VongPKJ1bHq8YW7vU1mozJKsgimqlISXNjxxga/f84js?=
 =?us-ascii?Q?hrxQ1dAihVE2k+jh+s5+Ywt8jd98qArHf3ElXLTBFaXi3qJggtIe0+ecTTC6?=
 =?us-ascii?Q?cz9V+B9J+b5L/4CGLDGQCepEzq5ct65r4mV6MqUzjPnjtn9pwyl/OFabsdvB?=
 =?us-ascii?Q?rXgmf6KaUgkHp9ksejq/4IBCdVMuGTDtYGh1D217DCogccUwJT0VqNsPpNM9?=
 =?us-ascii?Q?68p4uQ6HL2wwWrH/yCVfoYQymRWIjHd+g6izUDrthbdL2k9MQsd2RTJjFTPI?=
 =?us-ascii?Q?ycB/ZK4YQ0mJG8vrwQdq0eLyas8W+hOgdXwA8rLCDXoD1UbJL+vXk4OCYdez?=
 =?us-ascii?Q?8wRz+jmonmplUgQ1u1OFcpl2VciolJxdvVk6hg0WUuXt5FUfJhJAOSIlTZ4o?=
 =?us-ascii?Q?4nWobDQ/TikX4OJo6/0VpufshrfHUhwa/rlIgCs1jBzwsy1cdgDdb46rCVZn?=
 =?us-ascii?Q?N3kwr2vXuNAS98Bz2usa2SoEgoUICn36unrkqUUSKn8YIRJTRap282X3kBzW?=
 =?us-ascii?Q?oWPyD5iVH6FbAl2r07DberI/Jjxu35TB6JTKQR6oYh3WUEkCCKlS0rf+KH1B?=
 =?us-ascii?Q?IioYKdHhQ05+3e6NBgD8paXwrzij?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FG9UMjI7varUfh9NWnsZkSgB//4MH3u3MEly1JOQtizSb6Q3tC7i9hnyPAIA?=
 =?us-ascii?Q?8g4qBEDJ/t4PljCGQA6cBYiuBiZmEKZg7T0cifkqC7HAwGGkNkeHL8CVeElG?=
 =?us-ascii?Q?9fq58WRxe/438Ty/GAHy4VshA8MfuXDA8LxvqaRps225/V5jGwyg5tRGU5yY?=
 =?us-ascii?Q?f60VGWMxYv0/KjCezYLeJbMPLiN8bEYYHEq3rMK8CMx6k4V7XwC+igrGfhTB?=
 =?us-ascii?Q?upluBzQMQE4G8+j1rYNPzgw456NQTiVE9OXUQbnKFJkddcFsKlhluYIeiHAQ?=
 =?us-ascii?Q?WoTXWpYwmjjxdsp6JnHdvnjnh6RzCFzca+9j9+RPmPH2TLpGPmW1eDoIF16r?=
 =?us-ascii?Q?jHrNzaBbUMSfK1aKF5FtpmZQgRMTiKYI3G6nX7p2VpmyPl3XQfhGBbS681eR?=
 =?us-ascii?Q?fpPB/Zg2YlEJfcrVnZEsk8FtXTrbpRaD5EqjKXNhnHEgU4hw2CQWTw/mNDR8?=
 =?us-ascii?Q?crBc6UXwz9lbjg3HMwFmXVp/8oOlyWjvk3oNHjiImiOT3c4zylF7yoKkuOjV?=
 =?us-ascii?Q?epPtVtKW9I02YVOSfmOsGwM/rFhPP0PUl7hohAZTrBlu/A9Xa6hZk4MpLWLS?=
 =?us-ascii?Q?Cm5OvqQWrdTUMwm2lCx83C+K2k1lkWgYyzK4/aZ+AwhIeRwS0gPIK97k9Wz+?=
 =?us-ascii?Q?2R1xSkg+U2fcxHNcAE/NLZgxF5JmN+iHO8XNUZe2sl91nPR+6keA0Na/V1/7?=
 =?us-ascii?Q?9Vu4JSX8RDt679FaonT6lv6LxVZRl3chBLhvOUV9nEYB3lBA0MQA1nVWfrRJ?=
 =?us-ascii?Q?myfmYRXmAKXd26/xIrFgCPqAfS3s4qHLcv+FoLo+Jo2O5ujkBDCcRFXrgTlv?=
 =?us-ascii?Q?Cilfm3SioCJrsdlMVwY3Rk8Qoa9OJrdSgGFXfCU7nl1sXyE+jbyglE5oBlHb?=
 =?us-ascii?Q?wRe6PM/kcysnyzluIFCugqugwWZ/aTeyOd6us6CKv8fHLO0KnycceOQF7rqS?=
 =?us-ascii?Q?4tEbs60XN1xP+wI0i52uLelkKS5YXSDf9uBh7hZ2oLhHWkw8W0uNnD9OhvHg?=
 =?us-ascii?Q?h57jdlWcAmWSKSTrWZU1ANE2uTk1hj4Pidq+BHhCxTMxYAv7rWEveNdz3gls?=
 =?us-ascii?Q?S2EWCAG42QhaxS0+zJEpjqwtvHWMR7CVxyEGjfsWRTn2a0WOgWDaNYd7Mnay?=
 =?us-ascii?Q?itIaXbzNKZlsLLa3CjuCAq4D3NJKP19wxn9oZ4VXJcbbg5WJVn1VqjzYz4Aw?=
 =?us-ascii?Q?0qlPhivPBNYGJ329UDuGpm1KzViKB3Qu7uVrEFB6FihbxtnGl/p5cpunrAv5?=
 =?us-ascii?Q?rZ/tRLRHnNjNuIIyR9vIBr2glbuzEozDhe3j4Wy4O2gurW/fGbk1XHm7RLNk?=
 =?us-ascii?Q?4om23HgK5WZXPBPIs0fJg1uculGEbTy+pP9Zh05aI8288MGUucTBhDnWqAu/?=
 =?us-ascii?Q?M3AXbUvztojF8Hiycr8HWOwPWYg0Q2s0+TNo3LZWil1VXihF7fjUPhB6Hywa?=
 =?us-ascii?Q?qa5eINAupe6dZQYZVXAJEHA6cBX3OXXp5x4FeUIovEwVB6AWt2I/8qYSM5ZJ?=
 =?us-ascii?Q?ke+3YHskY+WHSchbbtzcdut/XUTC7Q/TbQ0wZ/R+cnSsWoKyuQ7PLE1vsJF7?=
 =?us-ascii?Q?AGqaQLIPd57/pslX1QQX4emYPGoHlUlTr6/L+Nf41TJs+UUB8BIFCKGSOCPv?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8451a5e-20c7-43c0-b23b-08dd6dd445ca
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:41:02.9169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zScYF5f9fsFPom60zbN8P+N6AIuTNGqWWQlloYdSqUCBdBAQnBJA90AvvJLmKhcpR6NTXJ+dc6XU5iKqExqGopGkTd1rHEaP6mPtWMNnChc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
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

On Tue, Mar 25, 2025 at 07:28:17PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Preemption is not happening and getting failed at the check for long
> kernel with current WMTP loop count. So, increasing the loop count.
> 
> v2: Increase loop count to 2000000 to avoid sporadic failures.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

LGTM but let's make sure we get CI results before merging.

Also, please see Kamil's comment regarding the commit message.

With that:
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Francois

> ---
>  lib/intel_compute.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 28149db53..9dbb38709 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -52,7 +52,7 @@
>   * WMTP - Walker Mid Thread Preemption
>   */
>  #define TGP_long_kernel_loop_count		10
> -#define WMTP_long_kernel_loop_count		1000000
> +#define WMTP_long_kernel_loop_count		2000000
>  
>  struct bo_dict_entry {
>  	uint64_t addr;
> -- 
> 2.34.1
> 

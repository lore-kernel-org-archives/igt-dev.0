Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6FFC369B5
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 11:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9037110E56D;
	Mon, 14 Apr 2025 11:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SIYNnxOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3110E56B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 11:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744628465; x=1776164465;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HWbp1H/glcDnUOvb7BIojVwvHVxWk+ppKIWhwMP3ETo=;
 b=SIYNnxOyknEgVOw5e3+FKgV2SfdJWOdtmexNMzrWL7jH1sUZDKEYwmmV
 0CwbRQBTaRcpdoY5VFJcSLx13erFcPana/X2ZDhTlqnD0q6GWS8RaxCSR
 0B+I2DiplLeL3h/QQdiegvBrQZ0YNrKatFexcHh+pD7unTHtXYf4O6XnG
 7RfxDGYLjwZ1Fq25S6GxFj3kCKWK7CAVyyRi/ojNHw1nuqqFHV0ZSykcD
 OX3VC5TOsillZgJJCv/JGaPL5Unm8hqibCFcb1W27fiw8Kt/wvgt/sE7U
 siOfBsjeHkWDT7ynVauyu4pGGi8GfB3anrfBCzUQZjn34y41GVk1VSF7z w==;
X-CSE-ConnectionGUID: CjXVnMj1SFe7U7wX9uqw/g==
X-CSE-MsgGUID: rivcvDWAQ5ieESCkBmWTjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56752135"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56752135"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:01:05 -0700
X-CSE-ConnectionGUID: KWrB8jAgRBCM8sNYpY5dNA==
X-CSE-MsgGUID: Pdi1gfZPSS2dd83Jf6ovSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="129725985"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:01:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 04:01:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 04:01:04 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 04:01:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rckyd7i4Bs/YAD6jfDY0j5/1mg+9eYIzGYuu7ibO/ZLNe+6FTwZVAg2ccwvkQBlRNgt3R2fcAFS3HuaMAjZo+rpPxL3va9VNWMa5hFvCc0d6AblE4003F2+aaO7BKACMv6KvL1DElLG0VQxh9n120owHIhP+W3EX8IrTntS/Letp4+K7/5GWGXb6tjNl3YhsBqV3X+zOPpJPoSIOwXJ+cC/qchfsmdwdnZOe0tc+AHKhPyn2wxRcuPm7x4CBKXdXhI/p9zOX5Gyn/vU33p8eIN+43pDvwGXtXHI6Zhu/l4HHXhJUsCszjxTkf7OChaIzRMx+FD02WNHrvbeprLjxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gz+VqYkBbjFarJCIBYGt6BxNnKC2bimOEOQG4digNpo=;
 b=ha8oyiCq7pxJQGAP3e5fanf1a9Bg6IfoP8ygCmrfivGj7atJnUWBEMq+e4E1/CSnrkxC4g11R82NwllUzGak37Hp8PdHbbsdjCcgF9JU8zKrXGodSe3+nYe0WAgUBl8vC0ApRRyYZuCoCTJekKDNce4WRcP245+533DbrrWUTBLKIisLwU1MbvHr6SrI2hU5+2O+NwOlPGWYO9YoN7666mHew+deBH1FTYQDhTGsKz0RLsWSFR5abKKPFWe6pGpSMwj7GBJ7F2V5hWaqL40pXqpoa22ih9WkQXeuVDhXyTRqSwutCooHKjQFW9V18X5jMTmXKfDDyQ4L4lhNXrE5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 11:01:01 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:01:01 +0000
Date: Mon, 14 Apr 2025 13:00:57 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 06/10] tests/intel/xe_fault_injection: Use
 igt_kmod_bind()
Message-ID: <Z_zq6Qx1r4PU7qtE@fdugast-desk>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-6-84b1ad0b8075@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250410-lib-kmod-v1-6-84b1ad0b8075@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d04d11-154c-4340-6080-08dd7b43a487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WRxhHsi+9NsskqyfYfKGCelcqALOjPAd5Mqn2Cfss/DvCQ5+siR9x+XRwtt9?=
 =?us-ascii?Q?AUR2QPTHZUvPOdROwGjKtILr3BSIDoAZDPsvkXoq09WsFi/HSbNurgbSbbtR?=
 =?us-ascii?Q?IImTNcoawoA3Ry4Za1hO03oy4h4WwEmjbDe2h5ssHr52i47EHgjLqVCPGUVW?=
 =?us-ascii?Q?D2NQCkkmgl7YKi2lvOXIjltsWBQi4ydRtCcqi1le0DbmU67/t/U3hBkE2JMX?=
 =?us-ascii?Q?6seDPLQbtQMN+qBGkcOjkGPWddIlB23c6cYuN82jvKxbk9/VeNjuob/abeLn?=
 =?us-ascii?Q?LtaJDbLhmmcLx1uJ5bt7TlPKinFHQwKR7q7w64o9vmG3BuBx5AQ3Ar17Wr/Q?=
 =?us-ascii?Q?IULdDPtyxCtP1UOzlJLDUN5DMW0RusChgT27u4rnWS0PxqEvzW0aSlLK9DDU?=
 =?us-ascii?Q?543pqEBn8t0DSSq0uu5eWl8XK8soRCEuXbfDE56+uhU+9S09010m7zdx0Ay2?=
 =?us-ascii?Q?K3WyZWlJZ+lrPIPD5IuNv8LQAVwAePZJ4Zx4gKva/3FDHqYxXaO++WbILesB?=
 =?us-ascii?Q?//jTonXS9O65SRfRIUAS2kt/gr8cJNrLcbD5OvTYdXM+IzY73aG8c7FgPubs?=
 =?us-ascii?Q?QTlpsmqGxr30aGreH1AcP1ZpbHApHtqZNB51ksHgpMVs11k0cZyyLw1Nf3et?=
 =?us-ascii?Q?O6gQF5kCrqjbJO0vArYFhLl4gLVRqihtsGUgVCO8qwv2gxWbS9pytbtywYab?=
 =?us-ascii?Q?HDLWipfD5EUsbQRBqYokuTl/acgqT5Lc9wfb7w6+VD7+6ZmuV/nvvOOahk8w?=
 =?us-ascii?Q?RevQnYzCqN5QqWVLZoPQJi8MmOxCvF0NI/zgpbaUrqbWkNdj32HNmUYzieM1?=
 =?us-ascii?Q?vC97bGm8U6EZ1TzMrDTGJgBkhWUSH/2LHRGxRUff+QoagBAcacxWQJjgyiTf?=
 =?us-ascii?Q?KxSiBKYm3HMZgPQWe7I3SZ5c9bAKiTMkvSGx6KzURY6pDTc+OderCBt3/jOo?=
 =?us-ascii?Q?+mA7E3uQpwCSBnclH/PBVF0ZCCXpBUq9w1yCkQrrznOdkZkeflNTFNdB9SaI?=
 =?us-ascii?Q?w/sy4ctoqyDo2AsRr1huhK17aaCtKzDm95x3WcW6cZE1mYvc36oEAHezQVfE?=
 =?us-ascii?Q?MDcP0dPJ+DuFv3IHqv1ueifF8Q7lIafshUT8hCDZ4rkwzDgWwzPctYENl3vV?=
 =?us-ascii?Q?1ldpE7wLT5hsWT7PyIzVQggQStbC1rXl6Gq/9PGOLfm2thua7CNoUNtXZ7ZE?=
 =?us-ascii?Q?Xsws5Ui20Cw/NiDdCcIPd2KZpQPhD0yj/SyY0Ap6QlCLdGPl/Oaj/gyBTyLO?=
 =?us-ascii?Q?2lAwtGHXFBARYVcATKltu7PoqcD1g8Ohdl78UzFWrVHx5DmPBuJ4lFePXkLO?=
 =?us-ascii?Q?yP7EK5xhv651zo+EXL+qnIzO3AmSyWW8W0SmYxopu2V7uy25Pwer9Stm2/CP?=
 =?us-ascii?Q?rPKsJKEEIfVZXlorAg7ujiUX2NdDy1Tt5E1HnmFvW77JgYEeMg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JaYCQF6nopteSvh8mCU8ucPvsEWk5qo4MqODMTQkH7r/UxonnOcSfHMafbPc?=
 =?us-ascii?Q?+H/XrbMeWqer4cU50cmWLcBdcWngqMHOMxv8TrUFduOLnkDFKCMV3WdW9Jvq?=
 =?us-ascii?Q?5VuYPCc55dDgsgv7BDTWthan978SOUkz3zVEutqbQjWx/uYUDXbwni3M8X8Q?=
 =?us-ascii?Q?sSIEatN0Ng6botjFC0pQ1i4gTo8phOR6sKYXFBiMYa4fRTjm43oxjq3szvKx?=
 =?us-ascii?Q?nyfpK2m5YuhXwcXUSZVBcmnKsxmgV6IEy8ysG5OCfNupQm+WWz7+CTyGD/k2?=
 =?us-ascii?Q?ntLbYVrV17e42sfcE+bw1T88OkoVOkUjm9aCh36AZgTuudZ9mAk8Mh2H4koB?=
 =?us-ascii?Q?GzL6ker3HZHOFdLuHiJ9UWKcc/NFG+1b5g9nsGzgkcBTtttS/QGp6posDJ5U?=
 =?us-ascii?Q?2XZZeMWAq1q4kxFrhXvsHXJ1LvNoeH6OEC6bp5omEGp/F9FiqRj3bI4ZEYKw?=
 =?us-ascii?Q?kAh4tmmKcJ/GN6Z8SXppzsRMu45nhUnLT3WoHAusWePRzFXp4t2hUmbZC8Hj?=
 =?us-ascii?Q?sEu3qsJQVNl3OlKhB89yD0ef6++3rTum7/NUR48mkU7sejJK1a7QVawGa8dk?=
 =?us-ascii?Q?/8qZQ0T5lVddkEYQFK37ZfWh+LKD6H0LHT4MsSHybwbLt+qsJ4yr6hbJfZJk?=
 =?us-ascii?Q?PBcgNQG0EoDN4+NP2DPiCJhurKOn/JuxP375IlrrM0xs8S5mLXOxdCJ5Mzps?=
 =?us-ascii?Q?tDSLxzLdbRJGmJP/0hl55huTb+IRU4SUIqPsXD56PQmzWV5zEIN+zDFqB8+B?=
 =?us-ascii?Q?2Mzx9xQvdVInog3Wv9CYa7CXIlTqy/nuD2mwOnXSZUZqPaQb3nU6lRxCJQBK?=
 =?us-ascii?Q?7Ljk7T62i4E0mVGt4ohuKuZRQTlR1+3ECSeteGN43B5Nnz8ebZahxKOvmD2l?=
 =?us-ascii?Q?xlXMyqGfnShsNVIxWfyeN6vBwwJBURJ/WugE0X+WhnaQB5nTwu8kkTzppFWG?=
 =?us-ascii?Q?sVdqEAx/cKQBl7x17pvi15zBumS0wmeUp9i/tVM/Xn2Hq+oFjJYR46oGJdD9?=
 =?us-ascii?Q?CLSCIopYyIrCnZsb5bn1d0K/crMoB+erRA2lEHKwylgNOWkio3zthiWTIl8P?=
 =?us-ascii?Q?ZtPx2VbRvZgjQdrJKMpBvy8PidgdEgdeRL6WDC2+vU/NhVSpr0maIDGmJFfw?=
 =?us-ascii?Q?UdDCvEjjPHqAPgQSwQaBjSHyGqttR112krtX6sxUAUWTeai4Yuy5hswZEKut?=
 =?us-ascii?Q?ylgqGbe2dlHRJUcvcywOieQIdBcYWS1znud3r0yU7I4YtjNPRhlGLOv0hgsR?=
 =?us-ascii?Q?HsAEH+ZxEoPX54yxUj28rRyKOm1N0kAN6VLATD+wcqYMkWg5Dq/TuG0sU/jJ?=
 =?us-ascii?Q?ooNV/HlxrxzFRE7DDsOo95SfsQ2k692+4KMmoUbMRNYOgCQAVZssQbcR/AfS?=
 =?us-ascii?Q?EnyEZ/fQR5StaLB/OZH4cmmRcQnjgyV1Ohfzhh6w11erjOS0P23trh6OPkwv?=
 =?us-ascii?Q?tFf6e4jmqjKt0pYkAVskl3q3qGNAftmRWJLXol14UU8W8D2ANhfZJ4ub9QyN?=
 =?us-ascii?Q?n4itElXanauDyuCy4iPA9AohEa7Fhd5gOH7pHnWvSN9B+0GhEv8gGdoKjnQ0?=
 =?us-ascii?Q?fsH3/JhNItJKTwpZWBHfgQvxGt7gISR3iB/lXQDaFCDcXnvPA/b6nKZT1Ql1?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d04d11-154c-4340-6080-08dd7b43a487
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:01:01.0996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ofy+U2YqlJbP0QHbaBv8sV9Od7pF6DTEdiClLAXyn3LZjEucefLx6/L5nr0KSMZFhooF8pKrkAYQTjO0x3o0l8DhRAQdVXvc3ejKrmuaI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

On Thu, Apr 10, 2025 at 03:48:35PM -0700, Lucas De Marchi wrote:
> The following sequence is very odd:
> 
> 	drm_close_driver(fd);
> 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
> 
> When the second call is done, fd is invalid. It's not a bug since
> xe_sysfs_driver_do() does nothing with that other than returning.
> However, now that we have igt_kmod_bind(), use it.
> 
> While at it, remove some trailing newlines.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index fdd11ffe6..61d5fa872 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -481,8 +481,6 @@ igt_main
>  	igt_fixture {
>  		close(sysfs);
>  		drm_close_driver(fd);
> -		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
> +		igt_kmod_bind("xe", pci_slot);
>  	}
> -
> -
>  }
> 
> -- 
> 2.49.0
> 

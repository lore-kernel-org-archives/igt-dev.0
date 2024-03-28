Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05924CD11DF
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 19:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E34F10ED48;
	Thu, 28 Mar 2024 19:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpC7ccLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6861010F751
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 19:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711654365; x=1743190365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jaHQbE8viwAmM+pugCS7jaMgnH/K9WriAsuy66ZWFe4=;
 b=jpC7ccLjmwXynK/qj/bcotUtqWZVNYiJeU6wU+rPlKSX3HMXfBwk6X30
 ILaLzM6ZISe3d6ihHI1U7HZl6ENQBvFlUlmOduW9p/AvddQ+fOAfnu4h0
 YA+Uf/haYIhCTLZPrXqNzBNaLyZRLpi4bfOHrwoV0OkdDDXfI2jSsbdZb
 AEyYHJSqM0KP61iHqS2P7CXcQsXtH98kydkFdhCBM8Fgx2Umgykz2dBZN
 KoTDp6skIs52KsvXl8Bq1By2nT9hlp1Mu3Ymg08fPE1hpVMpZj8ZEIT0y
 EdipnuMRMat6abxP3zx0k/0UrpM8TwBEjBASBww8saIJ6YdVXzqGVVtSU w==;
X-CSE-ConnectionGUID: 1unAQevOR+CAUzHW+Ejv1g==
X-CSE-MsgGUID: Wn3A0E+vSriEpm/aIihyCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6690783"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6690783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 12:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="21255159"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 12:32:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 12:32:43 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 12:32:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 12:32:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 12:32:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQyoFGT+sk74fFWfJms6t39eBcXXDPnJAWOd+wtI13YvHGYxA0ASSOKwIUTw/kPHxXwmTWlXisqDXN4QlTixcC4Y+M4TF7ujYqxNbdZoFB0t2EwQQQ4O0deApMBygNAI4ZO77UezOqmGqZ3I6G2vApM3hUyfhHKZCznP2JGOEbzGAsdPC8KRqi3vDTi6ytqUCn6fqPhGzn1K6ywGbyxHPTFqNHcRqA1QwaNpNRLyM2RdG+2QqSfMgCJdSzR53wknuEog0uvzDdJihHRd3UlfjMhKU9aQxsOAKz7kb+9WNjM0IQfQW6JR6iZ/c8dKq0oONGdDTSxMm5AjyFQc13Y42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKO++OsagzVyXRlg1PfMkCT7l4oEwfHpSN7Cv4ouX3Q=;
 b=bSIcOmOsHv0WRL+ZtLO9Bp1F2DmQ5w4sYNCTAFbzS/QzspqXAOYRh5r5eQuLlUyQPVuKBU3lLNjfelo+pC3wKZpmQOm55R9LkGceAQi0CgOB6//37sWaxeg1H2Y2qoYUZAhZ9zrzv1os7tlOEFSsR1ga0hJX7Goj8AjWH4PClUh5XsvmYXS/o6PF70hox+qCcp+w7eR0h3KPj8sw7uKyiQTEY/jIUtfzkmshtNdssD5VdrpaNhuBLZ74uPSyMYmCclBWdEEoeU+p+B8QtfAfYtxC2FFVYYzgYAKLvFWn4Fj44dQWKCIuGoMj3kbILmUUwlXfNqsAqwSeHNRwpi49CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 19:32:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 19:32:29 +0000
Date: Thu, 28 Mar 2024 12:32:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <balasubramani.vivekanandan@intel.com>,
 <lucas.demarchi@intel.com>, <gustavo.sousa@intel.com>,
 <radhakrishna.sripada@intel.com>, <clinton.a.taylor@intel.com>,
 <matthew.s.atwood@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <haridhar.kalvala@intel.com>, <shekhar.chauhan@intel.com>
Subject: Re: [PATCH] lib: sync xe_pciids.h with kernel
Message-ID: <20240328193227.GG1332995@mdroper-desk1.amr.corp.intel.com>
References: <20240327202100.3910719-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240327202100.3910719-1-ravi.kumar.vodapalli@intel.com>
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB8598:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UoflS1CQehPU5TOKxZl20dXfzpYB4Hw0x4D6P4GoIia0TuFBL8krh3S6Q23g0ZoZ7z9rOEu/YzG/jt4P6kFPCANgF6vhjwW+f3MJfrSWrddrFTsKx5VlvwIJdoLcDJBViRo9lcE93Emgr9y35vxr3qmIQ/E51RWaahN9YkpazDkzyjM/xQTD7XpaaHipEfl2dyW2eVipZTB/02/NRzj1ncp4e055+Cn/9+p2ynRyACJsTioftNLH4boUh/BuFHP+yPBFK4sseoO26jkiFDPtSyd2CqA3KskYtnLGGSud+GmwUd5i+lm/kxeULGoB7DwMlu9vZ4JIxp8fHnv2AtZVrkoeLwbLmpsE+Ety8EfqeoWSLhwpESZ1EJTBDJYcjhR6CwxItl17QOMPw42gEo9H/DoOEMqH924ZXuVIpeIOWVKRGtwxltdMNWwhzr8HtRNUdLgbSNEagsmMxC+f+uJf/GewVqSuucOyLMf4a8v+KuUbnfN70fnYXnfYNx2whKiN/XFCbQ0IYxr2Ac9bbk+TrTjRaNng/rCmGTv1OGQtOS1TBgB1diQTBcuDXU8OroF0L7WNWs6M/GXEsfS+a49MlfBe3zLbS+aAxda10Qk4wVgXfCCxXnk0coILQPro1M7xYkH/aePWNBlIjjKg46YwK2SDijB6jAIxRDxxBHfLef0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XOGVe4jDtsq9mKJ2BQM3O6CvWmWmfmyh/gZTEXP2CYyn4EUt6uNyINn0rHOq?=
 =?us-ascii?Q?aoZEYG3WVOOwQBOMtWjllScs+G/jAkuU58CSnq3OHg8KwSiZ7V34+I2j+WJj?=
 =?us-ascii?Q?R5I96V9U2oH/9o17gOT61VVeamY7Vwp+FjsCzX3+iW+iSQTIY0/tnXQaelLj?=
 =?us-ascii?Q?JCFmvIvFxNPJggjnFZK8f0hZsivHldCgV5XQN9U9nHxYACm51o3kTdiSJc1Y?=
 =?us-ascii?Q?Qe3CsvBF0NdY+/KvmDhMWpV0EEQxH7DFoluzvBJyMkqmGrhIx8lrf5ZGT82d?=
 =?us-ascii?Q?fpoxtzC51WVzCCdmZ6OyjARChUNwBeFbz7J3MXU8D/1y7T/LS1zLxlgEFOGu?=
 =?us-ascii?Q?YO/0VHkAZAqszM2+T7Z9oFTGIFenR4J5Gmf3/mLzRcFKiCEjOmkTKjt4RREb?=
 =?us-ascii?Q?3NLz2DYjOjoq0/uOP4qUmt9lkmqhRiyQINPNxo9CSCOGZTBvnf7JVz8UKO4l?=
 =?us-ascii?Q?XySu6BlUzIe9s8w28yNCcKeK0cr0fzqNuGy2bbvQ0XnD+LtefCzVkO0vI7wM?=
 =?us-ascii?Q?fEloQeFHOAwlpOe3/fVjg2RrDI5/ay8sGR7nAWBg9TUhMrZiSEL28Uh3Tgbv?=
 =?us-ascii?Q?irq3SeGXV5h4DZVptK1keNtSdVGVlmJSZwyWh1LV+2l41PJ5uIXjjPJLbm+4?=
 =?us-ascii?Q?SuDvoRQ+tWQhcI8ZycTPJ1hpepdFh3ULm4N/Ijh2hvDS+ep6A96WF9VkzMMr?=
 =?us-ascii?Q?JCvseoG0srRF0MlSpbIu4YooyCvUsmouF/9bjCHk97UnPbb7Fju5ggymCqZd?=
 =?us-ascii?Q?0olcyPlMj144efCtTS+kkgPJe6m14aiR9/fxwNu7+Nxx59ZW401Tnm2cfAHw?=
 =?us-ascii?Q?TRfSMP+mlLP0c/ojgz/iCUbAz8K0Q+JgryfcGbYqOMxWMhW3EyqNXJAShGDE?=
 =?us-ascii?Q?8egsiiG+gqXQYmgRw28wZTijDidEkj02eNdV727EmaIs8161VNmDqpy+FMnv?=
 =?us-ascii?Q?9YA1Y4QxOW+5o+qsmkI/MTwnPc43IoNmLqr0fScrU5ytz24bL7QkCPbyGSkO?=
 =?us-ascii?Q?lUHUiFkMD7GB2gQiz8c1Xb/BDHuNWVKvxk2Z5k86wZ4ICKMFsBDiNbvCM/mF?=
 =?us-ascii?Q?dCO9qJcCoQmsk/bSF/8aQUA2N8PUBbSl1hmiM4VWXW5UToReo0DqUaspynCT?=
 =?us-ascii?Q?4RTFJ+QWTNgZxUilukIJPTAmUBJAkQXydyeEQnPZhX0VGqhD0B49efQIQDtv?=
 =?us-ascii?Q?md7AtytrTOl0jnrmYqFtsjluR+4aV71JM3KeK29GuuVerKSyRMmZtuHIVQwj?=
 =?us-ascii?Q?8MRgHRkAgcMrJdaoWOXw/5n/pA8XYeA8oXLbCKjto2u3bXAiTCKbmcP9INME?=
 =?us-ascii?Q?OdHpsZv+I9KkTqw9rI8rq9n+eHAFkvjIhbrfVC/x3pAjdYudbhlzJrgVkh2s?=
 =?us-ascii?Q?Tl//6zyDeDA+zRQPwbS1hA0BhlirAZchD4EUPs4YU4CIYua/k0983V0FNHXM?=
 =?us-ascii?Q?Uw/xO0hEBiFzn2GV47LgtPPYBv8WvtRXtCAURgrylPVxTeTw+TXCEaPZ+VA7?=
 =?us-ascii?Q?Wr8C0LiQtbIMyPbmP+L8vaOTB6G8L5vmnCKb7cS5Xks06Ni53m2Irc8MgGxh?=
 =?us-ascii?Q?Chki9Z1WewNgNCPYFUgeh8LDYZp7LEauZAJLqUe9JSnEpl43RbxWCDJa8Xo/?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b42ce053-a581-4680-8ee3-08dc4f5dce90
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 19:32:29.7241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMbDeu0OLlQq+itx2bmXj1FxLkBZMZQ1JWPn1ya9JRFWD11gwytYppNev+x2dD25412SRFqYp+GDRD2OeLBByZBaB+idR1z1wjhY3ej2tF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8598
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

On Thu, Mar 28, 2024 at 01:51:00AM +0530, Ravi Kumar Vodapalli wrote:
> This synchronizes with kernel commit
> 0bd25f78c4fc ("drm/xe: Add new PCI IDs to DG2 platform")
> 
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to master.  Thanks for the patch.


Matt

> ---
>  lib/xe_pciids.h | 72 +++++++++++++++++++++++--------------------------
>  1 file changed, 34 insertions(+), 38 deletions(-)
> 
> diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
> index 29f07a00a..c7fc288da 100644
> --- a/lib/xe_pciids.h
> +++ b/lib/xe_pciids.h
> @@ -67,6 +67,7 @@
>  	MACRO__(0x4682, ## __VA_ARGS__),	\
>  	MACRO__(0x4688, ## __VA_ARGS__),	\
>  	MACRO__(0x468A, ## __VA_ARGS__),	\
> +	MACRO__(0x468B, ## __VA_ARGS__),	\
>  	MACRO__(0x4690, ## __VA_ARGS__),	\
>  	MACRO__(0x4692, ## __VA_ARGS__),	\
>  	MACRO__(0x4693, ## __VA_ARGS__)
> @@ -113,13 +114,18 @@
>  #define XE_RPLU_IDS(MACRO__, ...)		\
>  	MACRO__(0xA721, ## __VA_ARGS__),	\
>  	MACRO__(0xA7A1, ## __VA_ARGS__),	\
> -	MACRO__(0xA7A9, ## __VA_ARGS__)
> +	MACRO__(0xA7A9, ## __VA_ARGS__),	\
> +	MACRO__(0xA7AC, ## __VA_ARGS__),	\
> +	MACRO__(0xA7AD, ## __VA_ARGS__)
>  
>  /* RPL-P */
>  #define XE_RPLP_IDS(MACRO__, ...)		\
> +	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
>  	MACRO__(0xA720, ## __VA_ARGS__),	\
>  	MACRO__(0xA7A0, ## __VA_ARGS__),	\
> -	MACRO__(0xA7A8, ## __VA_ARGS__)
> +	MACRO__(0xA7A8, ## __VA_ARGS__),	\
> +	MACRO__(0xA7AA, ## __VA_ARGS__),	\
> +	MACRO__(0xA7AB, ## __VA_ARGS__)
>  
>  /* DG2 */
>  #define XE_DG2_G10_IDS(MACRO__, ...)		\
> @@ -128,17 +134,22 @@
>  	MACRO__(0x5692, ## __VA_ARGS__),	\
>  	MACRO__(0x56A0, ## __VA_ARGS__),	\
>  	MACRO__(0x56A1, ## __VA_ARGS__),	\
> -	MACRO__(0x56A2, ## __VA_ARGS__)
> +	MACRO__(0x56A2, ## __VA_ARGS__),	\
> +	MACRO__(0x56BE, ## __VA_ARGS__),	\
> +	MACRO__(0x56BF, ## __VA_ARGS__)
>  
>  #define XE_DG2_G11_IDS(MACRO__, ...)		\
>  	MACRO__(0x5693, ## __VA_ARGS__),	\
>  	MACRO__(0x5694, ## __VA_ARGS__),	\
>  	MACRO__(0x5695, ## __VA_ARGS__),	\
> -	MACRO__(0x5698, ## __VA_ARGS__),	\
>  	MACRO__(0x56A5, ## __VA_ARGS__),	\
>  	MACRO__(0x56A6, ## __VA_ARGS__),	\
>  	MACRO__(0x56B0, ## __VA_ARGS__),	\
> -	MACRO__(0x56B1, ## __VA_ARGS__)
> +	MACRO__(0x56B1, ## __VA_ARGS__),	\
> +	MACRO__(0x56BA, ## __VA_ARGS__),	\
> +	MACRO__(0x56BB, ## __VA_ARGS__),	\
> +	MACRO__(0x56BC, ## __VA_ARGS__),	\
> +	MACRO__(0x56BD, ## __VA_ARGS__)
>  
>  #define XE_DG2_G12_IDS(MACRO__, ...)		\
>  	MACRO__(0x5696, ## __VA_ARGS__),	\
> @@ -154,7 +165,8 @@
>  	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
>  
>  #define XE_ATS_M150_IDS(MACRO__, ...)		\
> -	MACRO__(0x56C0, ## __VA_ARGS__)
> +	MACRO__(0x56C0, ## __VA_ARGS__),	\
> +	MACRO__(0x56C2, ## __VA_ARGS__)
>  
>  #define XE_ATS_M75_IDS(MACRO__, ...)		\
>  	MACRO__(0x56C1, ## __VA_ARGS__)
> @@ -163,8 +175,23 @@
>  	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
>  	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>  
> +/* MTL / ARL */
> +#define XE_MTL_IDS(MACRO__, ...)		\
> +	MACRO__(0x7D40, ## __VA_ARGS__),	\
> +	MACRO__(0x7D41, ## __VA_ARGS__),	\
> +	MACRO__(0x7D45, ## __VA_ARGS__),	\
> +	MACRO__(0x7D51, ## __VA_ARGS__),        \
> +	MACRO__(0x7D55, ## __VA_ARGS__),	\
> +	MACRO__(0x7D60, ## __VA_ARGS__),	\
> +	MACRO__(0x7D67, ## __VA_ARGS__),	\
> +	MACRO__(0x7DD1, ## __VA_ARGS__),        \
> +	MACRO__(0x7DD5, ## __VA_ARGS__)
> +
>  /* PVC */
> -#define XE_PVC_XT_IDS(MACRO__, ...)		\
> +#define XE_PVC_IDS(MACRO__, ...)		\
> +	MACRO__(0x0B69, ## __VA_ARGS__),	\
> +	MACRO__(0x0B6E, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD4, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD5, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD6, ## __VA_ARGS__),	\
>  	MACRO__(0x0BD7, ## __VA_ARGS__),	\
> @@ -176,37 +203,6 @@
>  	MACRO__(0x0BE1, ## __VA_ARGS__),	\
>  	MACRO__(0x0BE5, ## __VA_ARGS__)
>  
> -#define XE_PVC_IDS(MACRO__, ...)		\
> -	XE_PVC_XT_IDS(MACRO__, ## __VA_ARGS__)
> -
> -/* MTL */
> -#define XE_MTL_M_IDS(MACRO__, ...)		\
> -	MACRO__(0x7D40, ## __VA_ARGS__),	\
> -	MACRO__(0x7D43, ## __VA_ARGS__),	\
> -	MACRO__(0x7DC0, ## __VA_ARGS__)
> -
> -#define XE_MTL_P_IDS(MACRO__, ...)		\
> -	MACRO__(0x7D45, ## __VA_ARGS__),	\
> -	MACRO__(0x7D47, ## __VA_ARGS__),	\
> -	MACRO__(0x7D50, ## __VA_ARGS__),	\
> -	MACRO__(0x7D55, ## __VA_ARGS__),	\
> -	MACRO__(0x7DC5, ## __VA_ARGS__),	\
> -	MACRO__(0x7DD0, ## __VA_ARGS__),	\
> -	MACRO__(0x7DD5, ## __VA_ARGS__)
> -
> -#define XE_MTL_S_IDS(MACRO__, ...)		\
> -	MACRO__(0x7D60, ## __VA_ARGS__),	\
> -	MACRO__(0x7DE0, ## __VA_ARGS__)
> -
> -#define XE_ARL_IDS(MACRO__, ...)		\
> -	MACRO__(0x7D67, ## __VA_ARGS__)
> -
> -#define XE_MTL_IDS(MACRO__, ...)		\
> -	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
> -	XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__),	\
> -	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
> -	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
> -
>  #define XE_LNL_IDS(MACRO__, ...) \
>  	MACRO__(0x6420, ## __VA_ARGS__), \
>  	MACRO__(0x64A0, ## __VA_ARGS__), \
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

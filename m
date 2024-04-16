Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2DAC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 20:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C770310EEDA;
	Tue, 16 Apr 2024 20:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4aAPuHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6772110EEDA
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 20:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713301126; x=1744837126;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wl/FYkkAvqnNK0+JznX1k91TCrCtMUezmWj8CqkETOo=;
 b=T4aAPuHyX603qqgtq+aR2yb4gWqgt7Rwqpgp97ryI1NjeTSAqEdvnZFq
 R9gttMU3yRdFgGoDUyDcCuQ/LUpTOzWdRhkv80nnhO4vypadg2y5CJ8Gy
 epUU+SHmR0M+iXLnBHjOAiyX5fgHmOGSP4aP1oJcRhSq01JJcHe8Wphsh
 xC+CsgmPvbcbVsj2zcfCuLyekLU1Jp5reCZUnkWqzPkcK+ta7qWMOyRS/
 zIgiA0PkM63pZKYOj5ZpvPu/6WvLCaJqjXVG/V+eXHLvs0i6cYP082RLL
 NzKzor0JKOzkpVltgd9itvFuajTwpUp+vI60I4VZSXb2xiTpzqo3UYD0g w==;
X-CSE-ConnectionGUID: tmclJ/afQtexKxUHy8x1ZA==
X-CSE-MsgGUID: lHyXSIz8TI2q0nh8PcP2qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8632614"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8632614"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 13:58:45 -0700
X-CSE-ConnectionGUID: cUHj6xH3QyiFAJcAz3y7xw==
X-CSE-MsgGUID: /WyuxUf7TGeXV2Q6JP7JJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22442586"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 13:58:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 13:58:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 13:58:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 13:58:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 13:58:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTcnJIfy44fi8OLi8aMROfTJKQwgin/o0TOSthj0xy2TPysoftH20vynRzJte5bZejLPjJE+1YeGi+XgXehuNoyRn4R+edckzQc0ThivjR6rqHkrls3k4+uZXhPqlA6aaQ1OVI0A8qEZH7l+JfpvBvCBVzAkCEa/aaJFKqGLlCQP+5KJMaHq2ScOOxUhEQoNW4iHGWwyRUmOXHpShJOyX019bCgBaylC77O6bHv4rBXqR+vOjMIUou83MXeM7p4kmN4zuDXjZu1Q2Z10vT0QyZwnCJFOj5ZyeNuFAyoJELZQQ71MtuJR+Y90SzXTtYuZc4KGNaVma9mTUE/R1shpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7s5p2cNQB1Vl4qEG/MQpmr8Ykd4gtKERlFu3SM69+g0=;
 b=laZSxLynmzbYDPn7NZPuoFRLBg4OHiMBo/N02rovL0TCvjIUaK9h6KP5v5fO9qYDQnuZRO30b5F+TJvIH6WusQ314y+Zm2qrMBg5/5TfWdA2uq0x0shoc1CuLvDygGx9JI70RKxJE6hC2PJlkRXLV2gREcDArOYTHNf+tTuTsrJLgQXaZMkv/byLaHS4V8PaUrObfKLl57FmTIG/5pWzg2qAibSr1ExyuWIOHC/dgq2coZt0IWo19TUZywWOZ1V0i1rDuhesG9V2JzbAN5A8TwD9o4VC68VZUN6KAXMlF6pUch+sVqTB6LEIepvwNjKYjKFAfWt3Nicr6dk+xiNt0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 20:58:41 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 20:58:41 +0000
Date: Tue, 16 Apr 2024 16:58:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pm: Tests vm-unbind all flag
 functionality with S&R
Message-ID: <Zh7meoKXHlocCgtx@intel.com>
References: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
 <20240415084035.2603-4-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240415084035.2603-4-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: cdae1f66-006a-4c75-32d7-08dc5e57fe9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3PvEQ+5wRMckL6CW+jz8glZNLSFtEgS7XQKaGA4WYDliHmnZKMiKq4lHR7TI+S/Fwn9XX+IJDJOkR2xbZdwYC7HvSJg2Iqq0J2mu9eVha+C6r0TxjFEW7Bl6/CX2AC7IY/+wZUTb4EwCr2vfH8GtGqJfQ6SDR4B6OSTc5vZAAeqy1ix1nNOwFfHIC9OFMIyW8ue7chAxouDKEHzrGGmtJn4OxUONC4qterYaISV/HWYMTF2mx0Ex4VIVEU0VT3tql1QfPZCV0b5NWJGptXTYCFrmOyBHebf5V3h8kXA1Kg6yApAx0CHuifUvrK+oYcstrDVs5otZ/K5IR3rxx0VoYL6sXVY7xwxxeCGjHBi2YYAtxoFlhNhXnALgGC6y0SvgQ8mxdcU+BcbEwzcwFBDVNtjpIWD4YOeka7XcCdlXilVSpKtSHRXIrwvbxf4OM4DWFJGTnhN91XfwgbEhpk6JvOx3XJ0Ppour2i2lmiE28QziBwQpgPHbNdN+0z/pgD0y2eBZxXx2vWh2CgeNFE++OAiroDFaHhhGt/yPGEAxEsOC/SW/d9lWkVGNI1MxncotmtH41eDzIM/ZyapqWkaPKhgLqB17oIGv0e08ECIvqv+cZX5LYDyG/G/O/4DdBCK3SBhn8Vnu6+woN/EhTdrr6C8UXyl7nqqcKiXiaiUWxro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?THXZzMHJUcxt7URXzvMj6oRbRTANEgrWSsGZ8LG7E5SEDR/PTwoAgvcxaeZe?=
 =?us-ascii?Q?3fvj+g73L+6E/O/Z7rC3R/Xmo6r/4ZNPsWFuG+6XfAPHvs/9PNi0c7tB15yc?=
 =?us-ascii?Q?+nBEebmSQ4lW8n9mupFk4bQLGCdOiaB+HJ2ytRYa+xyfDrz9mZf9QJZmBKgb?=
 =?us-ascii?Q?bBw7SzK6g4krUSIWz0yzxXw+r3K+bwdl9QOIONrpVHqFBC+XeYOaUvTDw/u7?=
 =?us-ascii?Q?f36zLc/GZnyUAPMyj70gTT6tbqtY8E7wbo/aX9Qt+H7AIqv2H3cgJkRXCMRI?=
 =?us-ascii?Q?vNGl5dnnKMr4jpcjkb7kOb29OwuHOXYfnErGi165cRyYZDfWL6Eij1WoK9JZ?=
 =?us-ascii?Q?YTa+NFYBTTT+1TiJpsTh3SvTjp9tYO2jkfy0SgLpvHn+uzjUEBJ2Z1DpjXbL?=
 =?us-ascii?Q?MhUg29TBa4T7yOJywKZMzD1OoBG0zyXlQNLH6NBkVkYTMPBDE9Jf/jiFMqBp?=
 =?us-ascii?Q?tvqxMhMNUjmS0vL0fCkW9kYO2dhv0CMM4Cn9bq1ljVTlQVRiQgtjz+qCR1Qq?=
 =?us-ascii?Q?rYiqyzzXtRWQpsJX2T7V5ocZTnZ57eVJ6qGegG/+gq28oxsAsSPVJX2sEn7M?=
 =?us-ascii?Q?VgrtUZO53KxG5ptdZG755PlS+a+v74deblZTSoEEzoTwgof3civwiB7kOIl/?=
 =?us-ascii?Q?SXfUCLIoN1B+YP5UwnFnOMLqw354tpTLJRAIqplOKEN3YlxcJblRRGDvuKEm?=
 =?us-ascii?Q?iMLVODeCBbyVEax1OQq9ZidRX8Y991ettn/scZHHpHd751UWjYKH6+yl44jB?=
 =?us-ascii?Q?NQsumtxtwRdHjy9c3zzZi73cOdVbPRYpfS8s3/OXWkoQRj1e8flFw0i/Yp4J?=
 =?us-ascii?Q?GwV1ik3IOSZftiFhnnqXMV0OsLNiUvt5Uwsd4d9vHHSDFzTNzusMx8zL+vrO?=
 =?us-ascii?Q?MROcxTFCsOcvROrzJcheytcS5Iguv9xNOhHAuWwDiX2rdMc+O2R3lUJkANbZ?=
 =?us-ascii?Q?oXrsk9bhXH9F9NVLGRf6OaaycLzh64X1TC+H7x8ifwiP4oKUbY5dZHe3yhH2?=
 =?us-ascii?Q?3d/kNwkGwZw1QzLCLuTb7xRLCWcq2pYFbmuoHMLBSnF4f4eIh4MNkXcVxWL4?=
 =?us-ascii?Q?3ZlNZlEGTY9K4ZSeSpAEuQDEXhGkhdjAohANKX2Mv6jZQAwy4xikbifytJTx?=
 =?us-ascii?Q?kHCkB72He3Y43WP2g6FPmUnk9YZiQkYsGxObrr0lTLFgkAPnjOqKH2VVTofB?=
 =?us-ascii?Q?BjsFtc7GAEOc7pw10Rq+0VQDjwRTZl8ho2RBukMEFBlq+TkASwtr22wNRscH?=
 =?us-ascii?Q?2tjhfcwU6cAL4Pixm8W/bPLlTvOEr2zowsXgYNaLRu6D1mUossVx1w7BzfZ0?=
 =?us-ascii?Q?L6m2XphKoAAvSSNAnPxRIIHJErvLKWY2IUyKdSsQWOdGjR80VThSAzOHoWZe?=
 =?us-ascii?Q?ZzqUcwUa6qI8LlTmBkxcGzWMsZ2+XEHDxdKNC9OiLwRwwS0e1VX5pFP2E7/u?=
 =?us-ascii?Q?h1DBlTMaPp82Oktnty4SyqEp9l7sFVxNdftDJhgrQe4xNbyFCMSTwOvZBNMU?=
 =?us-ascii?Q?TIiEr87TgodPgrvC2qmbrFHqjPjuOObHCOwVxMvwMpAH8AySQJNwVthcSFst?=
 =?us-ascii?Q?OlffTpTVN1OWWAn1G/Ey4Huc2qCh81NmDz0MHRFo80XMdbZ17bFs8LO6ZRwP?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdae1f66-006a-4c75-32d7-08dc5e57fe9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 20:58:41.0986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I06w4Gy88uzBtOAjXlUWbO7zdmxftS8cqqvZbrcmg1RD9sxoMvzV9UexavEzalAx7RucOpMIrINfDVZmXqMYkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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

On Mon, Apr 15, 2024 at 02:10:35PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates vm unbind all flag functionality with suspend and resume.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 8857265a9..0598bd4c4 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -35,6 +35,7 @@
>  
>  #define USERPTR (0x1 << 0)
>  #define PREFETCH (0x1 << 2)
> +#define UNBIND_ALL (0x1 << 3)

adjust this and feel free to use:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  
>  typedef struct {
>  	int fd_xe;
> @@ -219,6 +220,7 @@ static void close_fw_handle(int sig)
>  	close(fw_handle);
>  }
>  
> +#define MAX_VMAS 2
>  /**
>   * SUBTEST: %s-basic
>   * Description: set GPU state to %arg[1] and test suspend/autoresume
> @@ -291,6 +293,7 @@ static void close_fw_handle(int sig)
>   *
>   * @usrptr:	usrptr
>   * @prefetch:	prefetch
> + * @unbind-all: unbind-all
>   */
>  static void
>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> @@ -308,6 +311,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		.num_syncs = 2,
>  		.syncs = to_user_pointer(sync),
>  	};
> +	int n_vmas = flags & UNBIND_ALL ? MAX_VMAS : 1;
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> @@ -363,12 +367,14 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  
>  	sync[0].handle = syncobj_create(device.fd_xe, 0);
>  
> -	if (bo)
> -		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
> -				 bo_size, sync, 1);
> -	else
> +	if (bo) {
> +		for (i = 0; i < n_vmas; i++)
> +			xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0,
> +					 addr + i * bo_size, bo_size, sync, 1);
> +	} else {
>  		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr, bo_size, sync, 1);
> +	}
>  
>  	if (flags & PREFETCH)
>  		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> @@ -420,8 +426,11 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
>  
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -	xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> -			   bo_size, sync, 1);
> +	if (n_vmas > 1)
> +		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> +	else
> +		xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> +				   bo_size, sync, 1);
>  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
>  NULL));
>  
> @@ -630,6 +639,7 @@ igt_main
>  	} vm_op[] = {
>  		{ "usrptr", USERPTR },
>  		{ "prefetch", PREFETCH },
> +		{ "unbind-all", UNBIND_ALL },
>  		{ NULL },
>  	};
>  
> -- 
> 2.39.1
> 

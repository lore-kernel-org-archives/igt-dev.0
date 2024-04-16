Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C23C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 01:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B054F112937;
	Tue, 16 Apr 2024 01:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHg/reqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C4E112938
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 01:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713231005; x=1744767005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RMja4gTBNvXxfBnC3vrm9vMR3ujuCaBBSg6xFALtcTQ=;
 b=UHg/reqF9A3/EBDF4E61nzpR/SInpdMw8DIXEEFcGuMlON/YnZ4IWV9f
 EmELlzoKXjDJkxDucVaKwFXoryKz373NnfLuMcaUVfTHMqWO+OAMMyM/H
 DjdM8YrRoBfemZB4OXou7ePDG9CeqgB7B4yH+KCsVeeNvOMg2ZBMgorfZ
 Gta2pBAhe3U7hu1xBadavWHBODsUBS+uR1NecwZ0B4f0hoGhTx37SV4qA
 d3xkspGljbUZsgy6TjvKYumTryKIcdDxYq/QQsSyAoek7qQZ92UUl+LZo
 7gQMryTFIrzUU/IhF/wlDIW7/AgM1kxXx3J+c4ShuJhPRW72F0BqWlU25 w==;
X-CSE-ConnectionGUID: SFzJ7I5WRI62VkJlNkOe7Q==
X-CSE-MsgGUID: Zpm0Nsi2SPq6+u3jV3r3zQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19356288"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19356288"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 18:30:04 -0700
X-CSE-ConnectionGUID: 1z7Puk/RScy5WkSU9dcVdw==
X-CSE-MsgGUID: cLCGEMjjSye0TKrrk0PIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="45380244"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 18:30:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 18:30:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 18:30:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 18:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3xsVY9KDNUrML1o1QvWgm9HMTvDI/jXrITepFq4WOYYdct0uEJMtNDPlQqT0OvROR8iauQzW58vVtGyyhO8VcShaNzP7QoMeBiZ6zgrGNz+UwjqTYFD1FED8tKm4UM30D+xX6OFFCF7WIn7kyBLmyB5WdD+6QYWE3y1p4Uj/LOeBsO0JzSb2/GW/tpZrrKQ6Up6/yofEWZUrOU4ZaUsBfFEz9VdEm9OJDN+OxXEzmZMfy6ngY0T9eEhfKPHeLzj5wFUzngaJqoESLDEqKghhBB4NcQ767pzhWMp08MdUScdOvDGFRmSwQ3nQUJ4Ro/dmrPDkpOVCwARE4fFz06v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUhp2/SjtjgJiqi+vtMRG/P+YRYkUvoYUF7w0yRd0tM=;
 b=XIEjGrOJoH2G1Ti8F3/mYNOOjqIJ2WAGy3dFcqoWh6MOruWOj4mxduQk4XpJVI5rP1NGFU2GtihEC3GULAo6394/Mi56JOeG76/wHsD64dqrjQS0k154xvZruKVohAgzcvP4tmnUuPEclSyjQF9e5v8DgkBPv/7AgMca/k39+Vo6OhKJgA5gnJ1w8LcEQChHRNWw1CGANmYuhamRRF29I2X8RcHLsinp0OBOrrQSwsrIdsZFkmUI+WzB91IJ6OlOsPoUlwF+c/j95z07WZ8syKpPpA1cvdL8JL18beHJPDgIp7N8GH656vRFpXRlPTD9gjguwdvliUyacGA4Pz+Npw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Tue, 16 Apr
 2024 01:30:00 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 01:30:00 +0000
Date: Mon, 15 Apr 2024 21:29:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_pm: Validate vm-bind prefetch
 flag with suspend and resume
Message-ID: <Zh3UlC5aunACNHKm@intel.com>
References: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
 <20240415084035.2603-3-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240415084035.2603-3-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f10138-7ffb-480d-223c-08dc5db4bb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z98PO5WvkZZiZ5rtIp76vSYf+t0Gka0qGHxHSYZk+siaSWCQWqF/yx7yP2qEq3sv/pchQ99Ys/GnzWf9r7MlmgydH8SqbLowJ27Q0eYDjOxUU0zzhDMt+XADXtFAdOFv4Ycx7iK7D9AkxGngk6nTJfDpN3q4ZHKv7g6i/m1TYUOA1+S7BakEJCLHo3Uiwm7C5GI+HhnzPyeePhWJNn2YX2dZWFUWDjSsq04/p2MzltkCrZEi6zP07oc8bhYcgDfHRUiHARaQku1ZmaU3pvw8sXsYNQTGRkZBJljnECxDDaEEb8LOSbWkyf39X7otDKR6I3N6v6KIXR65ygvxXY1PRnUHNtSnr/GOHItJ8+MdtBiLnl01W/7pV5MsEIdX02rMFNTMEOfD5J4KzTqq9HLGhDl92aHQZr3IR4/e2NlmypBLbeRvSld273ya7p/UMtsXY2NqrWJsvmcOs0ULLYF+8h4lUdJs/IlyaaIhRS3g3CiY+wYxM8pU9E5cQxUy3J67aNfTAvz1qJpVqn1ZzX225xThipbeE38yYLFAL2sgiAWUAdwdocT8cP0wTfaRHkeM3QDEOvMRBJepGfL6I0rddbKyqgGK0MmtDyWwHLizt10S6g7ZM7lP4r/QDiTUVBb+A8vNKQNCyqI6kM+KdPwoVC2iy1QH6YQ9DzxP9DXsHFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xHbh8LUqpLUWp+yC+jjkZKWChJIqOJTfMe4hqadGn5rIHrJ+wdA+qtKRQ1pQ?=
 =?us-ascii?Q?nG7N7KU8nJeJmCMuqF9dFpWMjUA4uNhzWHWgLo4lwr3q6cTmVUzkuSiagJyb?=
 =?us-ascii?Q?xMbZUedmLvhbczkeQGm2g88ayy7+l0xvieu4lgrFVmY9b+kMOZasXTTbsq8j?=
 =?us-ascii?Q?D6rDvIUpAJR6w1VxnORxhsuNw0/KzXwLjbcmdyB+fbkMuRjhJkWd9cNOd6me?=
 =?us-ascii?Q?Mq96xOLuoRwV0a1Y5GTXWwjKMu0yrvwP3Jj7vmq9bFPH/fOokGlf3FsmTy6d?=
 =?us-ascii?Q?/ov53JbEc60594EnaYXRK2xA1KAFqCDnjwvU1+uSHe6xe48cNR68PCWbhoVl?=
 =?us-ascii?Q?uzwKa++zobcKx+7EfQszgTaRDagsAw7BoOpw8yFwi9CT9b2yvftl4Evef/FV?=
 =?us-ascii?Q?vBEzfxfq/6iLXtVg08QEcx50M6RDYmD7tSWCwQsoaXmSIfuJP3C7Va1foMZn?=
 =?us-ascii?Q?7D9LyIDrZmOA8uHW+uUKFcx8GlujjVqFzcrJcp+qLPegxJszlMtBmlEjBpab?=
 =?us-ascii?Q?+vNqFQi7+IvrsOFN4oS+/qyI/UwnCYQYcWfm0PEjqd8wLspJ/ZHrRu3oH5cw?=
 =?us-ascii?Q?Na/d8eHLICT530+LMJpamaWw9upVk8brZjofib/17JspNcbegCbGeW3jXXNA?=
 =?us-ascii?Q?P+0Y2BKIj4eEieqQxhbM7RXehEJPGxNcH7tk8B5jkUuxZGPgOW2fha5vleYT?=
 =?us-ascii?Q?1/MMqfK3Q5AFeVdgXwje5qEiieN28A1S9NN51ziknqBmQyoqffhB6Ev6Rlxc?=
 =?us-ascii?Q?8QW0RJeZZ+y78WpB7THRGTFMkkDFBq3+bq/iHR738D9LAQOS9JAd/ymvcf+U?=
 =?us-ascii?Q?lIDtLHZ8ccXBWEqUJZ2zsNYjyTdvll7wZHd+KB9VNxyMX8uKr3pB7jFRwhcg?=
 =?us-ascii?Q?PpXjZ5c44dCu9QjtclEIq9m2aFWuX1J/sbPkfmEo2sesSnJgchmkmEwVzcou?=
 =?us-ascii?Q?aYclXYaAcFNeeyL1t6Qk2mHuCFpG8ydQusgE7rQmCb77lUv0Ihe1kgfdByT2?=
 =?us-ascii?Q?aCKLAVZEwTDifPr1kseCryFYYLS6xM1N53BanIRTML9pZFpcwIpKawA6QJQ7?=
 =?us-ascii?Q?1xcpIOVVE+JWXyKJer16RzbCpU0hj+vDMNYV3nLlabvPsmLBv6vVT26eX6XT?=
 =?us-ascii?Q?vUPa67VitCeLZd1oKEESHvbuM1bXa5i3tXsJ5Zy3giQZ99pgIDWB+idFDnRq?=
 =?us-ascii?Q?LgEtP09ab2Efu3uNdcEAsUar24VD2vKJJ0CSo7abwvbcpWDW5TB1JSRh2mnO?=
 =?us-ascii?Q?8BsJfa8VVqnB/4wuZ4ISmG/zp5hUpM3k3kEKoaOPFzAadhFdkMqfOsduEPAq?=
 =?us-ascii?Q?ak6goUJrMUtRBEchTfSC9RYK8N3/YJA4L1pB3g+oTiUILOoY7sf6BHiWYhpb?=
 =?us-ascii?Q?exW05KhMUegptHKr5K/YzEJRwvJdv+qx+JQiAeYjRpdZzHVV3x/FaxgoKSp9?=
 =?us-ascii?Q?w0WCSdJgfB/2vdlXAP+PkJRRv62Eil5BLN/C1Av6ULtzrS+8VEBx9JKV0VTf?=
 =?us-ascii?Q?1FayVKDhIi3LdEwIq+OFiNFYE9A1ynIbeAsTvKAQKm+XYgl0/7Ywv7spb7ee?=
 =?us-ascii?Q?1QaHGNYb3UHKTclEQn420/BRmaiqrwUgHlVRg2HSLhzndib0raxmcmJ41FN+?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f10138-7ffb-480d-223c-08dc5db4bb63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 01:30:00.1090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRdLwgxtN+PXbgEyYO8tExYnJYUCS0GkE+xI4X8RDUnchkLQyIeU08uqn9brZoCAgkRBMr8TO3Y8hEXRqA1Oow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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

On Mon, Apr 15, 2024 at 02:10:34PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test functionality of vm_bind prefetch with S&R.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index fafd7a52e..8857265a9 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -34,6 +34,7 @@
>  #define MAGIC_2 0xdeadbeef
>  
>  #define USERPTR (0x1 << 0)
> +#define PREFETCH (0x1 << 2)

what happen to the bit 1?

>  
>  typedef struct {
>  	int fd_xe;
> @@ -289,6 +290,7 @@ static void close_fw_handle(int sig)
>   * arg[2]:
>   *
>   * @usrptr:	usrptr
> + * @prefetch:	prefetch
>   */
>  static void
>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> @@ -341,9 +343,15 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
>  		memset(data, 0, bo_size);
>  	} else {
> -		bo = xe_bo_create(device.fd_xe, vm, bo_size,
> -				  vram_if_possible(device.fd_xe, eci->gt_id),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		if (flags & PREFETCH)
> +			bo = xe_bo_create(device.fd_xe, 0, bo_size,
> +					  all_memory_regions(device.fd_xe) |
> +					  vram_if_possible(device.fd_xe, 0),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		else
> +			bo = xe_bo_create(device.fd_xe, vm, bo_size,
> +					  vram_if_possible(device.fd_xe, eci->gt_id),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		data = xe_bo_map(device.fd_xe, bo, bo_size);
>  	}
>  
> @@ -362,6 +370,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr, bo_size, sync, 1);
>  
> +	if (flags & PREFETCH)
> +		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> +				     bo_size, sync, 1, 0);

anything else missing here?
apparently the patch still failed badly and I lost my machine now...
will check again tomorrow with some debugs.

> +
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
>  
> @@ -617,6 +629,7 @@ igt_main
>  		unsigned int flags;
>  	} vm_op[] = {
>  		{ "usrptr", USERPTR },
> +		{ "prefetch", PREFETCH },
>  		{ NULL },
>  	};
>  
> -- 
> 2.39.1
> 

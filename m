Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F947C47DD9
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 20:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5679F10EBFD;
	Mon, 22 Jan 2024 20:53:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6902610EBFD
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 20:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705956802; x=1737492802;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5ETtDrCfFy1VOWlq02ow3pfY2nJDffZunv+WrD/LNTA=;
 b=KjA2HpLesRocmkMXTIiwI/mqxR2n2HfPhaPV5zxCJsDF2MpGP68NfCCM
 fLhys0yegnNsNvhkmtD1qEcw2dGPvYK95v/sSrsJa21rJeiBQ3LDB/ImZ
 NDRRHXbf/n9hgFUoekuxlZckCuaPKLfeYtFEMU61oR9AeJqYn7VPaFJw2
 z6czCuJUF8mbUJLnvPqEBYVx0932e0JHSBTWVXhrStSPcXQfuPQKfHNb8
 V1ZYw9oy3lTByDPxsKO1YlSArBGWTlrDdpdWHmwPlvo0DGxGAQsnxEcXi
 Fm/mZ13YJdvDhEy/3UppSA1I4N0P8+48/kQKOV4sQQ/6r7BKV182GdmVC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8722440"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="8722440"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:53:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="929102604"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="929102604"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:53:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:53:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:53:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:53:20 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:53:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuazMrzlT6pI+CEM3T5hnOKcmCbbvaCyyET0EyHwGXx0Wbup12zrcVo+Ym544fNAsxuLDKS7tvPGIwHY7HHnzPoNYULDXdId6tlgWWCitIWIP8z1wMjs+hweujg8GCAfAhXkqs4hKDHkP2ZZDvUGGUriH1e2RCFjFmf/vx5hjY4TkcOxpqikjyDSHBYndHsk6kAjn/SkZJRccPIH+3ZTWwhQxtODFgGXjNGxmgIzl61WYViYYov6BxhF0SE/LjfIDRwl1J5PppT7HFnsgG7y7rYTHRnYSoT/mXrHJpAwIhoG7oc5kN04f8eL6MWFs16Mxjnn5qOVyrRbWeqbh7/YhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2YEascpDYuO2svNR1C3PHQZKcoRGc4BlnezD8Sd90M=;
 b=b0hZO4WWAXoMeY3BSX3ACtfw2MfMVY3yDtdGn/rQ7++jZtjlbVCJLwcg5oXKu3dDzLrjJhfkt34H0pQlP7lG+Pj/KNaL2mz07COXS2CMqKxRiqLbzJgJ0IZLFYfKByypvM+3lgCDskUZ7kJe1J4dYbunMEkkM2lWSemYcqMr9KCtKPUDMv/V0GlcpsWWhGfL4HKqgM74HjRflw1tEqGTFcjNW5KUkkKPJVVu0wD0mqHfaPBbEBJ+5vJC2eRU/a808yElKAMRdmGPG4t4H0nIkCHRQxVA0o221jZy/AbXWE+RtzC8vJzYlqdMs3G7fyzYbFPHe43TtsmFhken6h0H6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5196.namprd11.prod.outlook.com (2603:10b6:806:119::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Mon, 22 Jan
 2024 20:53:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:53:18 +0000
Date: Mon, 22 Jan 2024 15:53:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v4 1/3] tests/xe_waitfence: remove invalid_engine subtest
 from xe_waitfence
Message-ID: <Za7VuyV3BDU2Z1EK@intel.com>
References: <20240122024543.456795-1-krishnaiah.bommu@intel.com>
 <20240122024543.456795-2-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122024543.456795-2-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: SJ0PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa2f280-8c34-49ba-1978-08dc1b8c2975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OUHCh2DiVY0UYFZ2Ji4dHRXW3u2QUW2In7qJCW1kr/1gR2RwQpYb29hk65ZDDJ6LZ6Lyrc58Un6IAp9DPDDyjl/oZ9DhVSfkL8XQMWtCpaWB5eZby29AstXj1tbOeWYtnMW+7Auq7Co6qt14wOoF7Vm+7PH461ZHYn+6y2Abo+mqhle7NMUla3qUJwhoj/yDjoP2DOH7oe1Q52Ar3v3+SgMKmpmphoiBPIL+YZMp40qjNW8ZviV6BfhgBbS/TgqV9gw+VxzTGWe7gdO20codhZdMXQmlvdnZfSdYV7MiRmyTmlUuHLuc2lUVN04O39nn/o84dAVDdCcvNTyQrPHJZJXKYy9gyHIVsZs2t+gZUZDj4n9PaXwRxHGoXBZRV/cnC4+NFFCB0tUAwr706UsCheWCvlH+oSrT96fnYxktxrZHCY5+ZN9Af7Eu0/ubhko51MirGc6wzpE5gs3Irxw6/Znuxg1K0WRBLqoxTE1dgWI8wCaTe68nqypfSTekGlKuyU9EDup4U3dlpuFlhhDX/1fs2PqvPTSPDHWfvcgHS6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(8936002)(86362001)(8676002)(2906002)(4326008)(6862004)(44832011)(966005)(5660300002)(66556008)(6486002)(316002)(6636002)(66476007)(37006003)(66946007)(36756003)(38100700002)(6512007)(82960400001)(6506007)(2616005)(478600001)(6666004)(83380400001)(26005)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGdSWEd6V0czVlVoVW5nWE1pSStjZzJkT2pDV3p0WjNoWGVJc3VLMzBxRXAz?=
 =?utf-8?B?Tm1idWxEcll1Ly9oK0greC9ZTHdXRmk0MXpYRHhYaVBOankrZUo1Y1hFSUFW?=
 =?utf-8?B?L2s1OTV1RlZzdlJDa3REcncvV3JQYXNTak9nZ2FXZFRQNmZzYnlJZWhIclB5?=
 =?utf-8?B?MVFGUmNIbEdJcU5FVERlU2V6TWZxVEhYU3pVdVREaDloUTZxcEVJbDNjU2pU?=
 =?utf-8?B?UWZCWGFucWdSODMvL3huYWg0cHJneUhFQzhEcCs0TW13THQ3TnRjMys0UWg0?=
 =?utf-8?B?K2FxWkJFcmlJZU9JRWZnNUFRbDhGeFdzZUFiMXlPQ0pnNVV2cEZnMy91UG9p?=
 =?utf-8?B?NXBlUzBocjlLUTRnNHNqOUZsVFdZVyt2UGJRWmZ2a2dFc24yTWpEUlNDOFhx?=
 =?utf-8?B?NW1WSi9yRGdoNitwMDd3eDJsM3FHMEgrdWppMFVqTk5VOFdoYzVTNWtkdXdJ?=
 =?utf-8?B?a0VBL0l1QVM1OUtFYWJTVUJDa3VDdGpsWk9CTHN6d085UVFGYlh1ek5IK0gw?=
 =?utf-8?B?UjlvMXNwY3FBclAzMElVTG1VMEV0NjY1OXc5QWVVOENlaFBKeEIwZFJlb2lq?=
 =?utf-8?B?MXVXdytRbzVXd1ZKVm0ycGUzMmcxMHRxamxBMmM5blV5OE11RlRqSlF0RFhX?=
 =?utf-8?B?TmFUV09xVGZJbXBEbnBiKzRTM3NWVm5FZ0h6VGNoNFcvTEtmOUdNU0NyMWRN?=
 =?utf-8?B?RWdxNEdwU21Wb3NYSTluT25nNlE0MWcxK0JvRDZEdXJvNUl2WEtUK0NrdUhR?=
 =?utf-8?B?WUVVK24xVW9lc3NlTlZhbllPU3BnU0ZLNkppeFdxZWxJOFFvVWJmUlN0eFN0?=
 =?utf-8?B?V09OQkdvR1cyK2FnYytMMWV6K1k2YTdUVzRtZzhjODJ4UFVYeHJTWElYM0Zv?=
 =?utf-8?B?dDIxZG5qZjQrWFFNdHRJeHUvUVF0VmxyMTdtcWpZY1FsN2RmMzkyNkRmVit4?=
 =?utf-8?B?RGd2T1NhRzdEcHdRRG9jNHhpanlVaGVwVGs2RGVRYzVmcmhzd1NlZHBubzcr?=
 =?utf-8?B?UkFuMzUzM000d21uZnl1eUo0bUh5TVJqYUFMN3FRZTYvQjhGTGx4b0YxVDBl?=
 =?utf-8?B?TmplcGJkWXFIZGI4Z05vR2RYcU43UEJ1QmNQSTZ3Z21zMlFLdlIzS2wvdUpv?=
 =?utf-8?B?cXZ4VDJmZENLcDlBVWswRTcxOEd1ZHlvRXprRjU4cWRxVEV4YThVMHB2OVJI?=
 =?utf-8?B?dVB5dXVpWTZ6YjNobm8vK0w3dEg5Yllkbnd0THFmS0xEMzRpZ25IUEhka2hu?=
 =?utf-8?B?U1JreStWaHYxbTJMK1N2RjNvV1FiRTkzdzYvUHRTV0V3WW1oQ2JlQ2czQkFG?=
 =?utf-8?B?VjkyOVpmUS9OUUFMTW1iNHdINkZSeDk2eEw2NkE3Y2NQM2xYN2gyeUpIcktq?=
 =?utf-8?B?dXA4K3JaNlUzR2I2eW9wbHZtTktmbHIzcitHbzlvMUhKMzVDQ0tNNVZCZEtj?=
 =?utf-8?B?N1RXQndtT29FSjV3QjB0T085cCtIbE9VTXozeXJWa3Q2clkwalhUK0VFRnNm?=
 =?utf-8?B?Uno0bEZ3YTB6aXB0cDlUM1JON0JMMGFxcU9RenQwYnc5RE5WbTRHMTJiRzFi?=
 =?utf-8?B?M1pOa0pJV1RJVFpNVWszbmFvb2U0Q09hYjIzMjVYUzFaQklocXQ4V3NKMUdP?=
 =?utf-8?B?OS9ZeHdZbTh5UWhTUFU0WCsyL0tFdlZCcHV0T1BtYnJrYnJyWHlsamlueThG?=
 =?utf-8?B?U3NKQW9lV0JIdm9jRUl6T1o0R0tFUWdBVnBaVmF6REhHQ2FHajFYZHczc3o0?=
 =?utf-8?B?d2tPOU00WlltRDU3SmdFTEtBQVQ5QXJzSHE0dUg3ZWpVT295NGw4dlVmK1RC?=
 =?utf-8?B?b1JFUml5Qy8rekpRcnFLNWZYSm9wYXJQcXpVb2RBNWpOK2ZjcGtsTGdhMTdQ?=
 =?utf-8?B?d1M3aVRIMmlMYlJZeW9SY3JJRklwMk5KeXIxeVBxbStxWURqS0xjZlRQS01T?=
 =?utf-8?B?WGNSWUhubWlvRjM3ZENzN3l6N2tISVJCUFY3Mm80M1J1MVlBZW1uZVgyTFdU?=
 =?utf-8?B?OWRWZjNINkVNbjdTOHl6aFpRZkpRZ3orbHhkb2E5bUY2bHNRRVJnZ2NTWStI?=
 =?utf-8?B?Wm1LTXFSdnFWUEV0VkFjQjNlK1ZnZDZkTzNYWUYxREd2YU03K2Z1Wi80K1hH?=
 =?utf-8?B?Z09TWmZiandoNmprWi9oaWRNMFMyc004bXhTWGNMRGhHcGxxN215dzBndEY1?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa2f280-8c34-49ba-1978-08dc1b8c2975
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:53:18.5893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iW847dKu0jLHh1nlXwTYmXJM5sqezI1U9URFbEAyzQOLPpHYEfZ7zhGTOzOTa4IKsv15TPthDd1alJiId0hBCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5196
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 08:15:41AM +0530, Bommu Krishnaiah wrote:
> engine and instance members are removed from drm_xe_wait_user_fence,
> hence invalid_engine subtest is invalid and removing it.
> 
> kernel implementation:
> 	https://patchwork.freedesktop.org/series/127365/
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_waitfence.c | 30 ------------------------------
>  1 file changed, 30 deletions(-)
> 
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index 7ba20764c..dfdb97fb5 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -151,9 +151,6 @@ waitfence(int fd, enum waittype wt)
>   * SUBTEST: invalid-ops
>   * Description: Check query with invalid ops returns expected error code
>   *
> - * SUBTEST: invalid-engine
> - * Description: Check query with invalid engine info returns expected error code
> - *
>   * SUBTEST: exec_queue-reset-wait
>   * Description: Don’t wait till timeout on user fence when exec_queue reset is detected and return return proper error
>   */
> @@ -206,30 +203,6 @@ invalid_ops(int fd)
>  	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
>  }
>  
> -static void
> -invalid_engine(int fd)
> -{
> -	uint32_t bo;
> -
> -	struct drm_xe_wait_user_fence wait = {
> -		.addr = to_user_pointer(&wait_fence),
> -		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> -		.flags = 0,
> -		.value = 1,
> -		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> -		.timeout = -1,
> -		.exec_queue_id = 0,
> -	};
> -
> -	uint32_t vm = xe_vm_create(fd, 0, 0);
> -
> -	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
> -
> -	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
> -
> -	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EFAULT);
> -}
> -
>  static void
>  exec_queue_reset_wait(int fd)
>  {
> @@ -329,9 +302,6 @@ igt_main
>  	igt_subtest("invalid-ops")
>  		invalid_ops(fd);
>  
> -	igt_subtest("invalid-engine")
> -		invalid_engine(fd);
> -
>  	igt_subtest("exec_queue-reset-wait")
>  		exec_queue_reset_wait(fd);
>  
> -- 
> 2.25.1
> 

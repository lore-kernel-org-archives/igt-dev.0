Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2E2C47DD9
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 20:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666CE10ED16;
	Mon, 22 Jan 2024 20:53:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA3A10ED16
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 20:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705956814; x=1737492814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RK452qtQdXyyIrnyHSEYf8rpTF8SsFojYQDZRRuSc4M=;
 b=UOOw4PUfvfoupG8Kh+6Mt7bWemocANmrI4AL5ZtXYlnTDtxyzJup9AfZ
 pdg6w3fEdS6u2YBnJQso+qvTOK7Dst0FFn2WcDk9luVWd41mViREGfgAQ
 6MxSuuzH8K3JK0eAed3bCwGPF8vETXm8kepq/8AhdrdaGPxNC9z+ACtpo
 V9E8Og0fKCb11vXW1z6o/UrWT8X13hlHbhQYBLLDbqJ71Vbx2uRxfCLO0
 99laVbqIZezNzPFMqXrfaKn1EOSpEWVf9m9dGjGou28F3jyFgIC8ml7Hc
 PKRPhpf272e5fuZ/SQ4XpyaQM5JQvCcW5RNQcvF9SnPftLHiCn9Edmn9A g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="19892471"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="19892471"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:53:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735300702"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="735300702"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:53:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:53:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:53:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:53:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPLjh5bNYOdkas96RA9wzVHqH+B47TQytZObCF82qKuFZ1TtR/Qde13B298wF3Tks27xazvYJ8kGEnrbz2gRTISP12KP1sNLD0JqD2ekvmquKOylLS1NJOYzfTKRcDcZRDRFOF4MbwoB0rEkuCnr1xXNhCj0M40UqknG5CJ5N/xpazuOPqD8Uogj3CpDLpjhCysMIj6lS/+G3SSTKdS4NJ5umNse50US5rpeOPzuz0oZ11RNxQC5yzyxaSgklm/38ieGqwjYN5JinQz0RJbsiGJYJrWgjZuPMP5RmIDGUTbl6WyYFCNI97o3LU0xcp6mUazJNfPcHpgP9LJWbDogpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gw2T3IiAgsRiud6Bgz2dD6d98KIouXQy4AMN1Lze0xY=;
 b=QPtfnc2/TkhJoF+8Guljplwvb/fYsQanHIYWCt/ouT94pAJzkDrXTHM8xx3gvQRh49lK9ho/ZZmOBnv+MsXdX9EzOEnlYdno85JIxw/PoG2pJUefhgtD4oUaqB+YaTxbc5QwaIfmGM/Hd7Xw/VqBIU0WRKXM+WvNrXM/e/jZMiaI4/iwh/h32MdMdDTMeEnJw//p8BvbN5TfkCTasuaglPsb5eKOWl3jje/C6qu3tdKzCoyoH5gOWaKlXQyxmylH8HLhx8MdKLbnsuYVPy4zeHOB5j3PKA1Ig+aa3T4OSuNLMk/atm/LgbobpzQzBVpAiIPC/HtJZbWLkSYzyCMT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 20:53:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:53:30 +0000
Date: Mon, 22 Jan 2024 15:53:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v4 2/3] tests/xe_waitfence: Removed drm_xe_sync data in
 exec_queue_reset_wait
Message-ID: <Za7VxwYK3Ztgyvdk@intel.com>
References: <20240122024543.456795-1-krishnaiah.bommu@intel.com>
 <20240122024543.456795-3-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240122024543.456795-3-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: 126d6f01-f748-48d3-50d5-08dc1b8c30c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p41an/5ZQUAGV5A+O+QLY6zvFdNBXE/HMj/VvQw4viZCcAxnWGmw8e2fcs9jcxrfus26GyeQIgaWJz2ImQcNmEjdyE5UVn9GJ29u3c8qUkKqedESbYNNOkYXQ/2WG5LfvdfKE5Fk5NmGEt74O2gt9zftV2lvZ/ldHQi6hnLjWnn3pOYeixPkHoWsp4NzoDJP4KbecrSudGSSEhCeM+jWPiUiXxfNxU5ZzZZECFQp6DsNLYi8ICLoVRlb4G2Jg3tvi2b8WaqYHJL/mh7q3cpaTb0B0s/TNskaohwJbKnsE2rWusqUs/pdOxL1UirbFcvQdw4fyY0ZI0TLW3z+PnEwx4OElq7buuDmwEY5cnIaaX4hPrh9+ZUp110q+yz2Bct8cQ26nJDZbpjxjiu2QZg6yprasD2EFZEsRJm8ofUqlnKOjhI37UxFyPoU3a+B8S4WmQAAdthBY7vu+/MqrZ4bRSykjh/Vxto/IW1G58MLYq/qdaqmM4OusyHrwrCpHxGSK0YarjfsGZfIyZokpNq2QJ2aAAEKEKDloNpRO/RviDh50s7g7oP7pzGxtrson9Ye
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2616005)(6512007)(6666004)(26005)(6506007)(83380400001)(5660300002)(44832011)(4326008)(8936002)(2906002)(41300700001)(6862004)(6486002)(37006003)(478600001)(66556008)(6636002)(316002)(66476007)(66946007)(8676002)(38100700002)(86362001)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GmyDlCHRE+2Eg74HsPI7HSnjqA4efLnKk3q0pAmuLahtwV7DTmVbTCR5eBvd?=
 =?us-ascii?Q?Qb21NNeJirnBQsMqr3TpuMAgeHk7s1Ri6MLnuzxGqacyli39Ium7Y+qF5tNl?=
 =?us-ascii?Q?Pqpa00hHO1iM+HZgZjg3EabUNBU9xayF5fhNyapkkRMk3wSr9VtBDz5BCvNz?=
 =?us-ascii?Q?dG+YE11B3CGUMaxW0jJiPUQig1aAgYGcxHk7s+NzpyF5DmsK852Mdp9q7TUH?=
 =?us-ascii?Q?QYZ2GnQ2XDfyFnTA9c7hUUD42pHKQDPiOMK7gmIR1ypwd9suJcalYXmNfW+t?=
 =?us-ascii?Q?roPcN5ixcUtscmNDl8WUMGabYr/Z38uUqNzoTzhVTFnM7tMdIhXtZLycWNbL?=
 =?us-ascii?Q?/DGFgAHwcQI6CpUjynGxe6o45I2XMMT5oclCkgnUK3GM3p9PeQ26WDrWpymj?=
 =?us-ascii?Q?/Lki3KfvFCRwVBGIitbPLhiAn4zjEfu/MZaMlzob5yc7ri1y0xMwzqhv80Eb?=
 =?us-ascii?Q?EVOhjxGGdlEecReIObuBDFWJkPligm+UbI5593JxIF9X0bGLxl4ypdkb8yqM?=
 =?us-ascii?Q?8rBq6FBqWwz/3jOOD/dCqVRBY5whfe1i90VH2X2dRXtrcmQ9AwWNPVePBDp+?=
 =?us-ascii?Q?5hLA7FLQjgnea3PxGOAOZD4tjayo19At59fvQAJnRrlEQvF3fae8jJqSO+ok?=
 =?us-ascii?Q?25jcmBuCjf0Ltsclgs3DHbK7GkSFeN28A2iIs2r+G03RXvsJuusX4Y2bk+Bd?=
 =?us-ascii?Q?NWNeJeMmJqdslrxBSD05h8zBKhscAoGF/8u51kIoGqxJ22FNUuUUy1a4GwJD?=
 =?us-ascii?Q?crfxysfMXCqYgJ907JfdcRltccyc7neb4pWv1X6C84WwZWPZcZPgf8ZVqX9U?=
 =?us-ascii?Q?qRcYhEEDe5RxygQCCxpYKl9JkDdtgLFBO5MQuF5aZncM0m2oT/JUBkifnHFm?=
 =?us-ascii?Q?FsSq0+wprs8zDER1OZB+GyvoLgcDj232+PBZnmOsE/7zWEMDac2O3t7YVMgH?=
 =?us-ascii?Q?iiZ7zaBNeec1eWg+HiBe0LBwErIzfU0vKAmLM5Sr9ztgVj73BhsLqRYujU2g?=
 =?us-ascii?Q?McIQBj5LJmwpDKhOoL4MOXuYuhoUiUg/V8lmAFX5ru5sMmIp77rQOmTsHaH5?=
 =?us-ascii?Q?N27NlnI01/l1Nm/CoIwG1dtOhV0jTUO0aiiv7hKXluimBVq7zUjWcAhCnGis?=
 =?us-ascii?Q?5fUG3FX5PpYkBiRrt6LjLAeUSjNU1ZjZUWHjugq6uIcKa9b/Fgk7CkzEUbwW?=
 =?us-ascii?Q?Og4ClYCqG9UfOuQZ6NHefgWKwR8a38b4wS59gfJ5on1Hq/N9BnhA7oTApWIS?=
 =?us-ascii?Q?J5vPz/2/1CT9R9jb+6d96XteGjaEN67JCalHkvQ2882h8Njx5gP0PT4TF40P?=
 =?us-ascii?Q?QZ4Nyxdn+Yk120GPWgN77QocmcrVIQOSwYgCbIDLBnBD7WHkf2sGCIy16qmq?=
 =?us-ascii?Q?3yRcghz+d4qIY6/uAki/ks64xowC14aiM0XeGpNDaWHEAlMg88hgf98amsD2?=
 =?us-ascii?Q?cGSjyKlHCqJpCWQCZWqXpcF+9iqfPVMl+HCKWM0Tiy2vXkVwSQhASKFUqw5U?=
 =?us-ascii?Q?pTPfUKWSOjyNDbf74oVqg46rez7uqd73K1UKZHMwGb1euGKedsxvvrPiIb4y?=
 =?us-ascii?Q?Ngce07HfYZY07xyENfqKwWyqO7Vobw9Bhc7eRfnThRPQmY+BL3suXObz8FrR?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 126d6f01-f748-48d3-50d5-08dc1b8c30c8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:53:30.9218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TdoPo0RvFsRkPyXRJIqnasCm1wicZf2a19zZaAHDX4w6GVIi36wvbDH/xD1/qKenkfI52olX2Tpi+748UWImw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
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

On Mon, Jan 22, 2024 at 08:15:42AM +0530, Bommu Krishnaiah wrote:
> drm_xe_sync flags are declared wrongly and drm_xe_sync data is not used
> in this test, hence removing drm_xe_sync which is unused.
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_waitfence.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index dfdb97fb5..e6354b3ff 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -221,16 +221,8 @@ exec_queue_reset_wait(int fd)
>  		uint32_t data;
>  	} *data;
>  
> -#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> -	struct drm_xe_sync sync[1] = {
> -		{ .flags = DRM_XE_SYNC_TYPE_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
> -			.timeline_value = USER_FENCE_VALUE },
> -	};
> -
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
>  	};
>  
>  	uint32_t vm = xe_vm_create(fd, 0, 0);
> -- 
> 2.25.1
> 

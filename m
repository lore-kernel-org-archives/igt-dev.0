Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6350FCA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 20:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE5010E20A;
	Fri, 29 Aug 2025 20:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2eWNXzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896E410E20A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756499189; x=1788035189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c+4sp9L9TqU/7J8Q/301AZjNl+NsB5M1UqcH4OyEx2U=;
 b=l2eWNXztxMVD2Lmk9FdmXo3UUDxb5BAn2T1Fwbv6ee9qJFsVGaSbbo0/
 DwchtSL6TE5swCkYmjS7biY6v1ralnRDip0OnZwxvAXOmByGjvHN5XoMb
 iMAcEUkIGrXlPJmmpbVGrBE/FT00LvPSm4LRQphvEvf4dwlzSMxnqKUFU
 S32RbioVdKuvajL1lXxeSio5Bh9u9qPEIawHO9XCh/PAS9VFuFG4znlt3
 8DTRVPCDqSx+jod4H6M/wqwnLO5yTWCfCudQ4CLrF7kfomnDce/GKCP7+
 GIAkMOAfdodV63Su6oR5/nadh6Hqb44ndBXr0jme81ernIhKa+/i8dNEl Q==;
X-CSE-ConnectionGUID: DKhO5g5+R560kG+I9PORPQ==
X-CSE-MsgGUID: RF5BghGiT9eigmSRQT1jHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62628114"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62628114"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:26:29 -0700
X-CSE-ConnectionGUID: Q7gyPbxmRYSAF/oTl9mIRA==
X-CSE-MsgGUID: dau0xkvqRC20sL1qEp2ScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174636992"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:26:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 13:26:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 13:26:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 13:26:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1lczYQyjc9dMda8s40u8O8i/6hPF8SXlJzxyhld219BxmPe0NKTlIWG1YruFJLL+kWpJDUBYHuDJTzpLlSpq5i6G9ee3NwBmdgABR2zoLnhe045Qesy1XZYAENG8aq/ftVANW7wy9YyvQxdFg9aCcclBBBceQbsZEBL1csYPQjV0baRwZ2biS91NelvwMcBXG9zKf55ILrREtSzB3I9yBGBiuE2GzyOCQ47sFqck2DdG/YsxFiAyFtG9K8EL3sHiv6M4eOu338H8UiALTY6G67k9bSNMo9eE6cGLO1c2yfyIF4rYG1Rsc+r3eLeR2Cmwz1UFskt6WewSAEn3I+psA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqVc3el7Ny7leAaen4VKeNsdbp5cZ7KHAV68V7WZ57U=;
 b=Oj9gUDS8kV8+R4qcH1IXwUzDObZw5MHyrGg5yFLR25wOMN2thTx7+V7KqTi9EFUFuvzJOeaMNsIwixeGczRBC52Ijq41cGib2GebhSAx57lBZHorf4gKVH/CXp7ABQlFt6iAzucrE0ndTQdGzcb+hBc3SinQnztVTVla9bD6v/oEr55TwOZVARKZijH9OmGYXX6jdrh+SjqTtL/ouybY9/bjp2hwmBt/xWyG0h9/Oq3f4FgMKMeduLpgUoehvlvvg6dwDuj3jAexK7yZ9zjqUnOZ5E69Pve4dAme6/Ntx7CtFGUyLz1YIfrKSnyTEYZhMmtjHZShEqHGz+HujBS0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 20:26:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 20:26:15 +0000
Date: Fri, 29 Aug 2025 13:26:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pravalika.gurram@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t v5 5/5] tests/intel/xe_exec_system_allocator: Add
 atomic_batch test in IGT
Message-ID: <aLIM5NV2tX8JKWsJ@lstrano-desk.jf.intel.com>
References: <20250828165817.97661-1-nishit.sharma@intel.com>
 <20250828165817.97661-6-nishit.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250828165817.97661-6-nishit.sharma@intel.com>
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: b3923cdd-2756-4aff-1077-08dde73a4d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2gcH+14wrwIwhSgpgZliQge/1yczKnC7JgBU8kttQSlO+/1SMWDohdy9d2m7?=
 =?us-ascii?Q?GjMwGgJ0KPlcpsukHKRMmOM0MQHkXxPkl9XzL7GuX/lfA0Nd4Yy9xowU5WsH?=
 =?us-ascii?Q?x2ZYAA04oLxzOiIkRd64xIew+hehoFPEl46LGi7ut2XFKtpjQaczL+kgwxhP?=
 =?us-ascii?Q?5gATcgeFH9/Xvr5YAvHSdFQo04ttdPfaGuR7/4iBj74CV35zPO9flrFdRnU4?=
 =?us-ascii?Q?td7Dbwi12zKIShqH/flk/c3xRw/EZ9EwCSF+rRBP6o+spK+jpldcQRgEddg6?=
 =?us-ascii?Q?GEm+56IyUk6WyZcu4t7f/R+cNa0cn89NcadojDvvMWGd1x/25BAYWagLyBvv?=
 =?us-ascii?Q?YXVVQWrgpmZTRZG5g48n0ijRWxtHo+LORZzqLfD2M03//XIJLa2AtGxg5C/o?=
 =?us-ascii?Q?8q/E1Y1794y3BZWZzUJtSVasPeHZiEJmndeuVAZz/tTTXHt034fijI1IlT4o?=
 =?us-ascii?Q?0wTP5HWsAy+jLebzKIXLmPcFDN0N3dtyUNgYCeVPPhBCIBdIjjJM57M5M0vP?=
 =?us-ascii?Q?n8DjkPyKs9zmyNk5OXm7x3vp/orM5yQCa3nBZ0hqmBchWA7W5BoOTE7c1Z94?=
 =?us-ascii?Q?YjiFSvsUd+92vuuWJvALqu16oMEDZf0NlqgmQLU/STR/cBDzzPpFEPCqj1yc?=
 =?us-ascii?Q?8k2Ea4MK5WzK+f2ttdbExsFgWpwlc3TWWBgBrhINgXMxdmLuvP2r7lxdvX+F?=
 =?us-ascii?Q?yqEqP/sGCkJKaVIcxjC3/l+UQYNGCDBMOcg5CIAym5SohY7NBUz35Wti14b7?=
 =?us-ascii?Q?k8ad0Gs0IqtaHNOCnxuoI/qETfg8Xt/pvGCjRwLJEuCV8pCaSt6bxnIB3T58?=
 =?us-ascii?Q?OBfIJFZrt14c3i0X9p3Pm1iAw/ScgADmOwjrmappWdIhhbm3HSVtVq3jQvVN?=
 =?us-ascii?Q?3mi8zG8hUdmW4aor0R/8Gj6HnM5nHe93/4zWF02UFi20hausnILmmEX53FfP?=
 =?us-ascii?Q?V96p+VPECXgqSEd30bYTn1jKo1qiNj7kr7ur2hOVJT+IOYmStP0JqzpRl1e/?=
 =?us-ascii?Q?UENRbJ2oGTx+keZ4H8xqGNwIwfHMykOC4Yib15x7eg/GhpioDDJKo3pbQN2/?=
 =?us-ascii?Q?ppkIXNxGTGIjUBIIYEvPC4y5t5cBdy+M+qRxC5/xl+yW6tUHg5C0AKT4zOor?=
 =?us-ascii?Q?zAR3MlEbhSw6B+z7qd8S+FN0WSa4k+2SqRBUK3s5eEGNvG9r05Q9Y1f2Xx7b?=
 =?us-ascii?Q?ak5X3n34yE/vdkYB5LyvgcvYWAmiWMBggooCs9v46jjBPBK5s6QEzAzdMHuG?=
 =?us-ascii?Q?eZJ/2gpVNdbXtTxD0BJOwtr0r8h/CM6kOWVc63aFpzaGKH5k3cNyjn2NwqBY?=
 =?us-ascii?Q?i9u6XuVck3T16Qe2Mqy9SO9YdxVendp+svBOLwBaWuSbU4cpK6VOM4RBpCNj?=
 =?us-ascii?Q?edMo+8r0/wz/jv+F3VZ7lbunqpQJYfPXKxFhDUb7RDIE6BICOJE+zigYzvn1?=
 =?us-ascii?Q?PVzKsvCUvxw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MnCLF+KhvfE+7o7r80EjFvEbQtPlUS1VzHax+i1ZhNTPIh+mxl5OuYcqjLhv?=
 =?us-ascii?Q?CWHBcsVPTONIsfqTfptmBGW6cXfuZrD5IjAti/2+7pzPzoo9R9rAsoNeMZzX?=
 =?us-ascii?Q?tU2fvrNJfY4sblInGuky+2e8De8a1ncDx1SbFpuvfcq5OTE8KDCS3EleXrg9?=
 =?us-ascii?Q?YnEm8/eN3YM3iRHNeC4bJixlxy0IQNlOAUY18Za5uSJzmz5WmZRLr7gYSCKT?=
 =?us-ascii?Q?4sc4Y8RHG4AMkIVAYvtbrPhBPT1A5Q2HvLP60HFrXSi2ApRriiWQrchXDW2x?=
 =?us-ascii?Q?qxUWtn5ZfDN/fWMLQksmwMcPgLPLRY0wLAOJHTv0pNxWxdtDRtI6R3qDX0hh?=
 =?us-ascii?Q?IXHZXLuJgNApOaQs8iDyrSCGnbEKK9CXYELJyFSCVc4/OdNqr6IiJMSkL6aQ?=
 =?us-ascii?Q?G9sqUBciQ3xzAJuRWMs6XnyXtsNZhrG8VBRSI1gSU1MJKBlCtvIvkhSVZAAd?=
 =?us-ascii?Q?xxQVSVM38YF0D06f5me1YNFyL9SCFWy2wMnLUn/peganmBPCi09KbGl6Guw3?=
 =?us-ascii?Q?vyS67H5tMrNKju31ZGYugp2kbyaJ4bMw11TN2ilERQYYE+ILCGskGTA2I3bz?=
 =?us-ascii?Q?qOxw1eWRJfoYbFKZ797oPFYAtJNTog0Sn7N4Mb92kTyH2OfHMv439nBAOf3V?=
 =?us-ascii?Q?s87oUCNs6h5sfZbeQBs1YB3fJhSMtTSfLJMLgIJxL42yqioe8PoU+Pe/XZ96?=
 =?us-ascii?Q?Ua/AB0r+DztvTtR5ZTdPxssBBJt1NDQXAJsLDFY/caaAQStQs1Im+ZYydqw0?=
 =?us-ascii?Q?soQ2xBO9KMcRC6oDXZJf5Gc+agV16e3+9UE6hQ3oAp7jbT8PtwPYrZK5mv+6?=
 =?us-ascii?Q?w0wlmhX+apbMJGO2Mf/D7idPCst0b8dQD1lIr6Vzme5I93MD6/tGFHDKUhxk?=
 =?us-ascii?Q?13E4Z+ou/Oaj09eS5RRm29IlhAxE9gbS90urRq1tTc+4SAio3WQMlBNV04wV?=
 =?us-ascii?Q?8/FPkNavXVn41mVpoDnPx8Wj5wy4qDSMTAAnZmi1sYQkkSJyqqxNtmnU9DWY?=
 =?us-ascii?Q?+dHD25Qq31MJe9/wUzwUvJMNBOSqLqLCDgoEH5qGDmS5sDqryhi30IL87t9T?=
 =?us-ascii?Q?meLI/BSDgNHuPS1eQdGCCqHCNac1upfvQaMs5kTvYknj6NGz8RV9dnpFRfZd?=
 =?us-ascii?Q?OO8WF8CZho1eP2h0pIKFPUeVNhcPsc02F7PAGko4z+OZRlMxh0PJ+YrAueKx?=
 =?us-ascii?Q?0ZYzLHWzUzat1tKlc+B9zYYylOP70sZUNs+Masx8xlBoQJihOTwV4Ro2BWIH?=
 =?us-ascii?Q?t1YRtJpjetMpIplgxXNlnyuxKL1LD1rgrOxBZHuILoTobOAn+5y9YcnxZceR?=
 =?us-ascii?Q?E1LB/89DvgnV8xeimCqUbfsLdZDApTmX4UpxTffF1AKBRhthfi901SlSMZOq?=
 =?us-ascii?Q?SVysjezJtjUr6LUF1NkMjsNgYHyIu1e90VyGdmmKqnD3265l1OtshsLoBUqj?=
 =?us-ascii?Q?nH50o3nA9VvE70cOogTVI6dDzRQkn71F28f+zWAI6QfpwVkRvz6FRryOevjG?=
 =?us-ascii?Q?qjwZeFZQrHJKOY+MiFDMyvk1BPu8ndeTG3cYltKSxnlyYhmsh2kVbjpiT5s5?=
 =?us-ascii?Q?UQDx2vTIChZO/csOMAOHzs1oJqNpHr10JIYdTW7DWWeMRVIdhYPDsVP047SG?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3923cdd-2756-4aff-1077-08dde73a4d8d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 20:26:15.3395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJ9k8Nq6xK2duEcVcqO/awxNoV1ZVdlOPxWMHXXMmQqDgJ4eBASEZu30RRLqGooPbQE0H+WL0Fi6QWg+U891Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
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

This is not how error checking in done in IGTs. We just assert success
where is makes sense. So in this page all xe_vm_madvise functions should
return void and all the in base library that calls the IOCTL, assert
success.

Matt

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
> +		}
> +	}
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		drm_close_driver(fd);
> -- 
> 2.43.0
> 

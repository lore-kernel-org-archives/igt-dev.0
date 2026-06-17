Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15389CD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 17:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F1010EAE2;
	Wed, 17 Jun 2026 17:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neLMWFuJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE57710EAE2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 17:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781717623; x=1813253623;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C5V3ZWrFZ7pKzO45y/6B3sIzZ7KbCa2jaJEUYEdFZd4=;
 b=neLMWFuJH3BaaMWbev0hDBWed8OwrQE3EIONy2tN/rRn+r/zGfro9Msb
 cDgLihIIEmjLZmcUr7tjyhSRHLIeq8kkHcN2fdxTOx8w9HafZgetsGCdV
 jsAiCMU7HwyWCywMwexESQVF6HTw9lahQ6oSGc0LjpoDvnzxqePi5k3Ge
 cTFPBB8lr86TYvUIHDxMTC0tEUy0DdvHU/YGNfYjFn8QhJq4R4IBZ7Ogu
 FgntcaPWn959IvjUCk+XP6j6ke40DkG1JPygsIYpySbigErtHoYQfLtAw
 5oJeqL18KZAH5c2QSI6DGBOoRUd81qCK0+8IA+fJhBEWqpeh7NOmBhvWb Q==;
X-CSE-ConnectionGUID: COK1C7BeRiajxWqCnUuHZg==
X-CSE-MsgGUID: fUUDHoAKRmqSoJXdLGvrRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86448125"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="86448125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 10:33:42 -0700
X-CSE-ConnectionGUID: 04+BMj5KQemGqtwl038xMg==
X-CSE-MsgGUID: efP+0XXWT8yOv009e2oVMg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 10:33:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 10:33:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 10:33:28 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 10:33:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuHRFs9GGM5X/dfG1QWsOihj4HhVU++DnK6tfre7NhKQ/sYa69ULvZQNBzSTZVAfuigRFeo4sC9Kd7NdsI36LiLuPiNvv+TolUTTl34DjMkSZdxzptL43Gq6lLhXzyDL4zeV7xBkTmbiq/iRVmbfG9hlLMiXATbSchQSaVax5RKX/CW0znVUz1mviqUIWTWXt8caH8T6N85QbVlwma0gmulr3QUQDIUT+JHKiPsoUXdqiGKaFtnXDKBzGw6PBrZY3jaPmlpvYWfwylYa2byN/NxnoR3NgfwcksLdWMSF0RXVx5YANcAuaaY8kamOwDsyFqvNLrIeCE5+cMFNcQompg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezinl82BkPhOqDUoxs5WMqtQr1z+rMIZ1n7CS1jHoEY=;
 b=SZ37juksEzeTjCnDH/fKN/k13feorLrtDGiLz5gRcgtD35CxH1WPG9gzIcxVYDkm6MCji3elboALdi0mNe9rWrcSb8ksp8XSFz0af07I4sTRQI6GLWx2qdHUxfVKL60q2Xw3u6GTnBfEV+ZxZwEI3/zEg+nfVTp/G2MBuR7uDwnLghe29LN+MQOo/PIdW6/hkuccsZSPuwMx5LoSxv6MHdd7BWaOomtmPRrrmfWODQJunQzwLrFZfDjYQy0nJpHKDYubTg0DMl/71mv7U/2OISSOE8GIugx4n4zGDEXe6ymvjQ5RrFtIR2+mkA4KkZ9uCl76oEzZXCA2qR+F2OZFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 17:33:24 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 17:33:21 +0000
Date: Wed, 17 Jun 2026 10:33:18 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <zbigniew.kempczynski@intel.com>, <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t v6] intel-ci: Add SVM,multi_queue tests to Xe
 fastfeedback
Message-ID: <ajLaXigIlpbgWhiV@nvishwa1-desk>
References: <20260617094235.3017-1-venkateswara.rao.muppidi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260617094235.3017-1-venkateswara.rao.muppidi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: af0bf6b2-31aa-4139-10f6-08decc968698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|3023799007|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: Mxjq9t1qZwsYUM7oAtJ8c78S41qOLYT40zelwnRzbVE1JcRc8vUZPMIumvmjQiJMkYhM6QHWxT5tEucF7Dk21MIs3xvwD3fnIKZDT//RCzB7KsJjdQCCkpCYuWO+GtPlyI5KYhrO0wvIzqLQhvq9cX1okw9TBvqhOs5wq3/qsRGkiQrboEfD1RI8uShgzL/N7N6MAsmL3S2cBN/C+ZOT6rhb3U2Adq1DlK/+QpOAFr7z3fcPLmJKAUUSRT1LCiBkHDHnELHkvHu8YZtQARxkLS+YamXrUtAuDRBeZKc9b/IbbUFb5ZWvhWWJRY7fQqCleMME+743G3gqCibBarMPXZPGhyS0tpu/SIEUGH17+qrIc5t43ZkW3B6GjwE80d41WciN/d7RUg5SZRrPE++0okhpo6wVY6i6zuzsQhDdDY4mkYPXtdct9BjbpUweAE/EnjM1a4tCz1awSuu/iX/pgr41P2NDAedbUQQfjhh9PEwyR6d/BUAgyjqvmZ38KKtXrBhj6H43jXh9vsijmuTzDRArCB25rCUv4hFXLjlLgxslDaJMAQmFe05zMgf5ei1O4GcID7mDy8PEGEKrg7/r1JZ4Rz/+3D8sj+YaOKLGExTlTd5DphXwiUyLkxK8BfudO+Cg6XwkmVGji04x4X0ICZ6vmT2MlctyfIcOrEJ6ODNp0xy7iCoSV573stvQmONC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(3023799007)(18002099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Y7dA8cMBTFEAZL0Rcx2u6hOWxEoS/snM7iWJr7weEVpqG0utQ5FKKbEUmYP?=
 =?us-ascii?Q?BYTGcJvlEdt6InMQFF2cyTZLnov2BzVQMLHcWinriTNZaNbBnCfx2NEFrBxC?=
 =?us-ascii?Q?587pARUKQJaJUGGo9ArrledKrkOXeajecSU8ApYnX7H+uuxCV5FwnVjukz6j?=
 =?us-ascii?Q?qzp5abCiOVfeXglpZicfDMTzJKKhLm9JHpcvkGa/g/WMup/kn6pz9Lo/RncY?=
 =?us-ascii?Q?ztPrv0znIJtsLEKG//MgZxH8vNcMmAYMxDc8724icDYf+M0KEVi1Ed4jHD8P?=
 =?us-ascii?Q?YXRtks+FQCqQxzJV3q2H8iG8uAwtI3fVOUlnNwYM4UHTyPtSTixCmbv4loTY?=
 =?us-ascii?Q?1RLRWie6KJIwaAnyOnwnkT3El2lhGEreruz3JSIc2jC+n58bYAT8Su9gPU+P?=
 =?us-ascii?Q?j2DwT+O7mTHdM9MfttYU4Pao69PMz115A20KNxBUTqCXeH890zBaGep6kw7C?=
 =?us-ascii?Q?/OPzm0JowFJqBTE/XOBZxMhecWAdxVkPITEWecqZRXwlAX8tpQT2lKxL2zf1?=
 =?us-ascii?Q?lBiHKjdgUyAF1IzGnfy5K8tupo5kuYfF04k8g0XiQ3fKYR2DESAJGD3fR8eZ?=
 =?us-ascii?Q?X7BOqbsvr4VTU7helv4KYzqhMQlpzPRRFNRC4hUHUQLsEgK2ZyXbrTsOsmld?=
 =?us-ascii?Q?ki63qJ3dR+5RP8pO4t6tSJxSiMHlrLvBb3/Ob2XLVC7SxCE/dT/tIbZgpTHu?=
 =?us-ascii?Q?G4ELcFJok8qGQdW9SUOG5nFTU6F/N47kT23hISrihHemgE8Hiy5oQp6wFmLe?=
 =?us-ascii?Q?y5fuu/HWBgc3swWi2cvGVM4+OGXHbvLtYy3I6TAV3vYS0ceLnkLn8yvH37z5?=
 =?us-ascii?Q?AIbXI5SzZgfLnUYZwEvdfoTRR1MVkYtdK2r1IQ0HjEbjq8ZLoFSNxEUgkSLe?=
 =?us-ascii?Q?eoFrJd8e7+yFV27wQ/4dF3t8zVxs0uMQo1zW2FsSL5/2iwcepELEPiiUZE7M?=
 =?us-ascii?Q?+oBasLjxd4OJ2JnzL5WOQC1sh51osGY6xM39pmwfkVyh5VfYSmfZ+nx8nwWu?=
 =?us-ascii?Q?ZrdwEoJjveoegA3FusqUNQQA2RbErPcvALk9vt4QW+4zuMRBE65hhC1ZHVmT?=
 =?us-ascii?Q?yXx+Mv3hITV3K8fLx7uwmLxkMuqlzWpI2CDpOkq6MkdDiAym92W0aliPT7vs?=
 =?us-ascii?Q?j9Ti21/vDsfBeCFIrLmgDGP3MWIro/Q3L4i7JIWZme3e9DAW3wpNTxRJ10jW?=
 =?us-ascii?Q?rqwfINbnqRtn6uDVCelPIUkqynx4ZdZE3mz13HcjY8kpev7vnTrgyi1Xscwf?=
 =?us-ascii?Q?WtsJa21dQqS6+6zfYF7+jvGIXIdrlwYXuteUQZo+/PFx3rwtiOIQICNBVT8R?=
 =?us-ascii?Q?APPPoHvuRToWO9xt9bubqU2g9N6g8m8yFuSXPv7MBgscNh2/uCPi/CUFi0Tc?=
 =?us-ascii?Q?2nf2PAEGPASUG1oqR3N6lQG5LIKy50+4ffPcY40dkXpDVFjP83XEqRWGRSr7?=
 =?us-ascii?Q?4cmSpwV8vasc25wJ+3ooLr52nenMAStihxseIC4+XN2k87lW56fg5PLueOHU?=
 =?us-ascii?Q?p6psq1ayakZ6+L8kL4HDuXkzFOEbEaqIe10A+I9sMrBMWAQ2RlyJS4GhsJFU?=
 =?us-ascii?Q?ghJh+OS+6es5ppnyzXzo2Yofa00U3z0/xRMqzijMNU8Rp9en8+c4e+TDcGe3?=
 =?us-ascii?Q?XIATk90mSCRpHyAFXnlZstMoba+OZHFW2GKVxxXmXQ2tQHyz/Y3Q66/EAQVY?=
 =?us-ascii?Q?LwImtfs7t2cbgi5/TLcGThWIHg5Sd9GquYJeXNX9pB6kEKNFAGST7TtAhOBM?=
 =?us-ascii?Q?Z4JdzxLe2q233vOsoj1pw43sJ29AA11YnK7U1Mew6DxtsKg3zBLy?=
X-Exchange-RoutingPolicyChecked: c7GuIwwDSRL/TDlFndtEbgn6Pg/CpozC6HSclkGfpESfGVMI5zdXEKge7aO07585Rt9DG+9wWEzeIbS1LTpIzFLhM+9EM4K/j1rLksVImocf5luU5yE6dfbDXsTVpguvRahyL5bddhqx+OD4gCDOQYPkBORo6Xh/s5xFTGB8qTrCN2nu44txQdSq0WkMG3RQj3ASj1wBc3lHnt+Ue2YrwwR1OVHFQyFGzEADy1aHJtA71ppM50b7RFE3hkxj6yN08LWKCi0mIzMyzYk41iLNT3diZHpETc7kXC6GKHua3kQAuua6vp0ql9YjyC6//Iibcg+pFEwUzlAdvUCVQTGUcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: af0bf6b2-31aa-4139-10f6-08decc968698
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 17:33:21.0231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DR8qztOTpssNGcNiLVYbKGIm4K6dMYxF/UgOp/m35XJ5cVKZWdlYcJCb2SAZVBGf/pdbrbjbE8zAHCI7JI65mbPUAWvJ78Ho3XaBCyvsG7iU/aK0/B/popCGyeDKhmXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
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

On Wed, Jun 17, 2026 at 03:12:35PM +0530, Venkateswara Rao Muppidi wrote:
>Add  SVM, render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
>access_counter, fault_mode,multi_queue tests to fastfeedback list
>
>v2: add eu-fault-2m-range-device-host test (Francois)
>v3: corrected s-o-b and From
>v4: Refine SVM tests by removing the race test, adding remaining SVM tests,
>and organizing all entries in alphabetical order.
>v6: Remove twice.* tests and add a new set of SVM tests (Francois)
>
>Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
>---
> tests/intel-ci/xe.fast-feedback.testlist | 38 ++++++++++++++++++++++++
> 1 file changed, 38 insertions(+)
>
>diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
>index acff025fa..c3a400bf8 100644
>--- a/tests/intel-ci/xe.fast-feedback.testlist
>+++ b/tests/intel-ci/xe.fast-feedback.testlist
>@@ -69,7 +69,11 @@ igt@kms_psr@psr-cursor-plane-move
> igt@kms_psr@psr-sprite-plane-onoff
> igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
> igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
>+igt@xe_ccs@block-copy-compressed
>+igt@xe_ccs@ctrl-surf-copy
> igt@xe_compute@compute-square
>+igt@xe_compute_preempt@compute-preempt
>+igt@xe_compute_preempt@compute-threadgroup-preempt
> igt@xe_create@create-execqueues-noleak
> igt@xe_create@create-execqueues-leak
> igt@xe_create@create-invalid-mbz
>@@ -129,11 +133,43 @@ igt@xe_exec_compute_mode@twice-bindexecqueue-userptr
> igt@xe_exec_compute_mode@twice-bindexecqueue-rebind
> igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind
> igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate
>+igt@xe_exec_fault_mode@invalid-va
>+igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
>+igt@xe_exec_mix_modes@exec-simple-batch-store-lr
>+igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
>+igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
>+igt@xe_exec_multi_queue@sanity
>+igt@xe_exec_multi_queue@exec-sanity
>+igt@xe_exec_multi_queue@few-execs-dyn-priority

xe_exec_multi_queue@priority test is needed here.
xe_exec_multi_queue@few-execs-dyn-priority is not needed here.

Other than that, multi-queue tests added here looks good to me.

Niranjana

>+igt@xe_exec_multi_queue@many-queues-basic
>+igt@xe_exec_multi_queue@many-queues-basic-smem
>+igt@xe_exec_multi_queue@many-queues-userptr
>+igt@xe_exec_multi_queue@many-queues-userptr-invalidate
>+igt@xe_exec_multi_queue@many-queues-priority
>+igt@xe_exec_multi_queue@many-queues-close-fd
>+igt@xe_exec_multi_queue@many-queues-preempt-mode-basic
>+igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr
>+igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
>+igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
>+igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate
> igt@xe_exec_queue_property@invalid-property
> igt@xe_exec_reset@close-fd-no-exec
> igt@xe_exec_reset@cm-close-fd-no-exec
> igt@xe_exec_reset@virtual-close-fd-no-exec
> igt@xe_exec_store@basic-store
>+igt@xe_exec_system_allocator@eu-fault-2m-range-device-host
>+igt@xe_exec_system_allocator@fault
>+igt@xe_exec_system_allocator@madvise-atomic-inc
>+igt@xe_exec_system_allocator@many-execqueues-free
>+igt@xe_exec_system_allocator@many-execqueues-malloc
>+igt@xe_exec_system_allocator@once-malloc
>+igt@xe_exec_system_allocator@once-mmap
>+igt@xe_exec_system_allocator@partial-munmap-cpu-fault
>+igt@xe_exec_system_allocator@process-many-malloc
>+igt@xe_exec_system_allocator@threads-many-malloc
>+igt@xe_exec_system_allocator@threads-shared-vm-many-malloc
>+igt@xe_exec_system_allocator@twice-free
>+igt@xe_exercise_blt@fast-copy
> igt@xe_gpgpu_fill@basic
> igt@xe_gt_freq@freq_basic_api
> igt@xe_gt_freq@freq_fixed_idle
>@@ -176,6 +212,7 @@ igt@xe_query@query-topology
> igt@xe_query@query-invalid-extension
> igt@xe_query@query-invalid-query
> igt@xe_query@query-invalid-size
>+igt@xe_render_copy@render-square
> igt@xe_spin_batch@spin-basic
> igt@xe_spin_batch@spin-batch
> igt@xe_sriov_flr@flr-vf1-clear
>@@ -215,6 +252,7 @@ igt@xe_waitfence@abstime
> igt@xe_waitfence@engine
> igt@xe_waitfence@reltime
>
>+
> # All tests that do module unloading and reloading are executed last.
> # They will sometimes reveal issues of earlier tests leaving the
> # driver in a broken state that is not otherwise noticed in that test.
>-- 
>2.43.0
>

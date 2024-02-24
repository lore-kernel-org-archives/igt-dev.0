Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A995DC5478C
	for <igt-dev@archiver.kernel.org>; Sat, 24 Feb 2024 03:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1320110E08F;
	Sat, 24 Feb 2024 03:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhQl9gJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83B910E08F
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Feb 2024 03:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708746069; x=1740282069;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kt0Dab8mBtsKJHoyXdVN8kLnni2cAo3k5tBiX39gjWs=;
 b=IhQl9gJw50vMwc+0QSfqHJi5/OgQQyhXwk8+6fextIjiDQz7/e05gGNv
 cJeytlOkVtRpU582t76msIeF23fZxn1goRJ513nbInJzFFViNk9OYy1Ep
 NE/G0HHD0mijHjaa75//hlWuWCf/GLZzYxnNYhRFtCOSaYZ0zuSCxA0/M
 BzQEI/EpxuzY5Fp4X4VMAVWD2YigRE5F6GMN0MwN1q7etQRkLja1IbwMd
 6D/REonhtomheLUV5/rjDTCIHYXk8XS9psCgwHbAOSvXsLeKDkF8Zv4m4
 uTAY2dC3X7a+PCavsPv73BpQiDa6JidPq6eFHYT9LnZ5mSMIUYongnjHa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="13647692"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; d="scan'208";a="13647692"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 19:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="5995159"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 19:41:07 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 19:41:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 19:41:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 19:41:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 19:41:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4/NjepsIlpxKpC4bWIFBAIVAsaYyA1eLw3BUXP5oPkwwCf8hXWYoQGX1EFRsd+RJ1nFQltchCNtxPmrfiV0ilJozLjlurllFCwOWWhqXwoHDbcgLKiITD2sb/WqDaFglouiEf7iArtoTORDMLGocCtZEM+jJtWHYyiIOIrlN+6KBUE6iLIyIOzH2g7y5vdfaXutAmmewj2IU7ldWvJe4/nu1DuTljWD5EzCTp6fCAxORQgEt6TOwIFSFjy3dXtTxDc2pmQaTuZPTD4qnCJulQ0R5HpbXlxgQmI8xr7h+mLX+Tdw41h7dTN3+vVQM4pBqy2w2A2Tzf18Tpr83/Kf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHeEuKfSILQgoalvVYpHjuftMqRfnqypdpJDwqkRfbg=;
 b=ngkkwJy9fQLPJZJAXz5sDPp8/bayyjCXsx3ev/UUM3jJp+MFaNiupflgdT8+bszhkPfbYjilPnUBpd7ZdPZnz7L2Xz0KRApkcE/+bpHQffxxKTXWkDZO3M7nWF7E50HsDUK2igzT/EQtcQYwNeHuP+msamBZ65UVDnCMTQudAgNgHq7YefzuxjvGFrWgVr89gEFGhluVvk8NL8UBpLKcyaLzDSL5oxLUdWXKBVEW2PewbCNhPeHeIfcAwADCOJ0msjkZhAC/GyP88vypi+yTKDLUrOJxuhyH8LY1ce8k3gz+UPtHFqtqs3de3XZQ7pQBhUVvsHOAWsiHaek/bTdsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8011.namprd11.prod.outlook.com (2603:10b6:510:24a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.13; Sat, 24 Feb
 2024 03:41:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7292.036; Sat, 24 Feb 2024
 03:41:04 +0000
Date: Sat, 24 Feb 2024 03:40:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/xe_spin_batch: Correct xe_vm_bind_async
 usage
Message-ID: <ZdllLKLxAQPYzg3W@DUT025-TGLU.fm.intel.com>
References: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
 <20240223230407.1712361-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240223230407.1712361-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fdc477c-f2fe-4117-f7a3-08dc34ea6d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ipEIiIAkpkmO37NZVj+1B183VlFVdwNILHPEEITLgfc753gHq5N7I2kBJ1tePrgEpNohuSkOgSl1jHk97FhHb3uoQIPBi6/dTIrgBH57QGtjb9/iffUOhndViyCqFemrKPul7OYKDr4BzcnT08dMvgQiCSMw1c50zSDew/QrNH2c/TOHb/xSjLeyHNcvfUCRLdN8nVtH3Ew7naDfIuuG4rwhtvmCExZFtHdm5NyXBkmcDK1nZ7/5yhMPis4gmQpUboagaZUsnH1go8xn2nFjw5H2vKEZkyfUtNqpO/mUhl4rO7cjq8sEZtsIMYfPF9WNQz9qqKvEoTZItunJp9q5Mb9xImC3EwfoBoH6/UAO7dlCB5XM0UItk/1qRFGgbuEwE21QFqigg/sh2jzLawO/6miYEk24MiFztGYbI+n4eVGm34H8P7Gv2Tyjuk58JMqPrZBhzEZiRDXJd3F716dTeD1EAt9fZkvF0XRBdvCRaQv/TujGeCbmgVETKfpTEoXb4j/+KdFuGv8RKFFk8T6HHJbNMRVapl0NkNBd6JpBhI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W1R8spFV8BqCvoIUtadUSbosK8LNaKxDvNxksSzEkz/ytyeXDjfVj1QOQaRS?=
 =?us-ascii?Q?jaRBQKzKbOKZxf1LCvWEwL2OnjUFQP3+IW8dFVgenBoO+DdOXxn6Mg20mDB3?=
 =?us-ascii?Q?MKk4mrO31+H9TFHHMNkw44LGHyPYl2kVdFdwqyKCLsjnLBzSZJUInu/bTfSI?=
 =?us-ascii?Q?aKPD9FLmPIiMFHN9E104cTC8oS5PFbAIm0ybJNjPILxejGvbSP6LEzqmL980?=
 =?us-ascii?Q?LdKyQyyMK5HPPAGWp6VI3e1LBQpbsueCevfhjYXsA8VpCDBRdsyxRFO3UEqe?=
 =?us-ascii?Q?9CEiaV+Ta7xlvYPQBjCxUPhsn/0SeG3Oes7iXFk3ohZ6gQBhIzXPTJt8G2RA?=
 =?us-ascii?Q?ISviNsdpSfvj5gb7vSU5UuEMwC0iCF4xDi9UeZygvO+d7T5T04h9zWCTDx2B?=
 =?us-ascii?Q?6HHznEZBwE+R5oueMAQp74ets5gd9DsiIRef1XTtG6ta5CSh6m02j//26Vaw?=
 =?us-ascii?Q?8XjhbqXO9vFJmfDTPwzgnTSRIf7zGeyMe0H+B82CdNmC7zzOgYxOHjg/VkHv?=
 =?us-ascii?Q?0HMriGM4nbBoa3vZbbUKrZT6hcfshDZXvTZ4BgK17F7/DxWRdin+QEme3t+/?=
 =?us-ascii?Q?s6cVZY4zHoyHLeQvztD/5if3jAd6/1NT2+7nZ+9ZidmaxbKu/Ct3Oyb4WKn1?=
 =?us-ascii?Q?kKsBVTWiAa60dETeDwUKK1mzTaxrgmTWEv+0+l/3pwKgjfqmmx4BDeALkO51?=
 =?us-ascii?Q?NQlG1PjxHTVIngVTjFQRRGWibEVIoo14w6Sc+A7a9XfqI0Scr9in+bCVSIuD?=
 =?us-ascii?Q?dPpU7x8qc2e9qA2ZDSUSafY0WFwxPLdocmn8fLTbGryR2kNTMKEy21ua0Jhc?=
 =?us-ascii?Q?Bmh3L5VLsOmSYj/Pqx+2eb2FWMSrJgANponlIvujVIFD9tYVvs8gvrrsqOvA?=
 =?us-ascii?Q?Q9E+Yco2vIWWLiKrkvJ375tzQa2M9RKAtR3XCuIhOecX+frYpNlMLutBEd4M?=
 =?us-ascii?Q?yyHmIljeykGc3hR06XJ/+Ph15sM/42j14nJe96C7E7iywReYd4kSb9Be7bUW?=
 =?us-ascii?Q?qzMbwOOTJD2n+AdftOOq6Zk/44F18s6qpXk/sJ+2okefVSsg4Ih4XW8aN0O9?=
 =?us-ascii?Q?TT5dlyuL47/5UScQZNuy0RxMEbDfOluoLh18SFPuavRxG1NPlRrfEN1Ytrkd?=
 =?us-ascii?Q?8CDIoQkftyUDNAzhTRzwwEHYBCDN8YYqB4i7D9OhZ/P4MNEPKVqbIEOKZldo?=
 =?us-ascii?Q?y9+uscEth1Bk6cpSF3799iYLfcUJoLMmOdby1qDNg5Yfmm6kjbDHq4chYzOB?=
 =?us-ascii?Q?PwvtCawEZC8H9OHh9AY3kjoPRad6DDqXTeMqktBv38uEDAt4gxFwkwkwk3Ac?=
 =?us-ascii?Q?oN2f+7fZVAjlIMPUSJBvi8a9C30Sd5mpY2wTR21cry9CYFL8IKntWXbyL43h?=
 =?us-ascii?Q?h5eKHMJdmSPgoRHAiu8+BEC9zITUNhWWmitg73tZJmwy69HQBJ4kX/jnwBer?=
 =?us-ascii?Q?QDBJYY1wE1Yv8kEW3YxJ73sr0ensPmaTtuUIvl0AQOXF/dgzBs6Xaf+fkCvm?=
 =?us-ascii?Q?c9WZLWae4Ji3l5V1tg4E8PwsImFeBtqE7eJTuNbEV2gBctfoIw7VkJjdDLPO?=
 =?us-ascii?Q?x+Bn5/e6eT5WRAH/P9wQSdYG34zZHabJY6WmhApyAmm3Zhbc3P2xoHlEfYl0?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdc477c-f2fe-4117-f7a3-08dc34ea6d58
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2024 03:41:04.3469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX0jCNF+7MXipjOysg1ceX17QM5guT2fINeoiEpDq+984fD/fNamcTWI8gqcBZZqPA3P2GamIYq+Neg90t5ZBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8011
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

On Fri, Feb 23, 2024 at 03:04:06PM -0800, Jonathan Cavitt wrote:
> The third parameter of xe_vm_bind_async is the exec_queue id, not the gt
> id.  Set it to 0 in the preempter, as there should not be an exec_queue
> at the time of execution.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_spin_batch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index c183063507..faf569baf8 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -198,7 +198,7 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
>  			  vram_if_possible(fd, hwe->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
> -	xe_vm_bind_async(fd, vm, hwe->gt_id, bo, 0, addr, bo_size, &sync, 1);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
>  	data = xe_bo_map(fd, bo, bo_size);
>  	store_dword_batch(data, addr, value);
>  
> -- 
> 2.25.1
> 

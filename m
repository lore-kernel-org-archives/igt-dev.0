Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7ADCD1288
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 23:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DB510E41D;
	Thu, 28 Mar 2024 23:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eP6ErS4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D3210E2B6
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 23:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711669880; x=1743205880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ntNV7aMizIbo5fNjftCL6oanjfwLj+Tz5gMPig1vdeg=;
 b=eP6ErS4s+irxQE+ObZyROawHymYETg0Xr5LvoHIrXeyuduCtQ5Fb/HLG
 1HXk5sjZFCroWDQ+wAT60l5QAtJ3zES/HklzDFAU635umJj3dUUtcHkTp
 HYtsodMQ8otlL/W7PImuP9l5+vcBF4kJNyRf43ZmAOSASPyojeBW1kir/
 EQhhzGOqh4JuX0Xpxfr7XoNUHfRFCxPviIgduQ8OMKybBZnxAKyIwGHvx
 PqftD1YUWC9NytZtwFJvVTtfluTgtfqMRZvEY0B6LMLXW/L6AxoeaP+ru
 Dy2aueW0zfOVo4W14T4AhLU3t4YCSVMx5ByWRDy7AmBhWVEfZPwoyI/bL g==;
X-CSE-ConnectionGUID: qQz3/miuSgSG4JnIhrdwvg==
X-CSE-MsgGUID: +q9v1RcmQ/yquOcItdCqwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6794382"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6794382"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 16:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16863767"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 16:51:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 16:51:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 16:51:18 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 16:51:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFf2CuyH0MrK5doMIUf+bcPm5SWC7kduOVbZgLawW0A/gyV95m2ljUkT9KI03y95TmhA+6Fih1TTZWxFBjSt4ehdCWTLPy3yuc3qjT/kVGu1XhBzXuC9xWfzhDGU0ZIrYGAcCLMeJ/ddiwF4+FhnSxr5V9c/pg9r3/wI9Er85g2PSYlRNEiMVZ/4kfpW5SZ44gfHcXUOW+ceJypyDXwZrjUBuVvi3MPrvrEWx93VT528MTAeAWymz8Cf5BFu2FYWt1j6bMehesothWwUIghDJWneVnh1s6WRTp3KZtRu5UqU4067ZptEaRgOmnXIljbj5nTkGadZsvghE8EGmHZ3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fs8hyv0Dm7FH30pEbGJoT75iD64Mc9E/LUT/OKoMFZQ=;
 b=OA/eu8Vj2BNBms7ex4hitmDFKd+tSkv6AOtIjIu5MGc8qJTiv+c96MNaf6MnnlZpibs/4qb1CkYqPgoefxFQcPqF1UnFfDc3qDwFC3EwUYbeMimIOelaU+24BImB7uZD0FVG778uDxcQR1oxzOevG8YBUTGB64yoAPaBvvdTwvMF8k7tlzxKWNXlgxLWcoGqfxPr1OV0Qz5WHq0ie+BtY1uabxe8proEkFQ7jFuAcZmMF4p6rx8g45YOBSL/hn1Ku0etF61zoQPHFO9QzUEQBEibtXgm2Xr12OW0UsBe0On/Z29kBzf59g609H/mTQzM7d7AH1ebglf7FUA+RpebFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7106.namprd11.prod.outlook.com (2603:10b6:930:52::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 23:51:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 23:51:16 +0000
Date: Thu, 28 Mar 2024 18:51:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t] drm-uapi: Align header with drm-xe-next
Message-ID: <d7opzat7v7agddwklsmh5moykv3srmmvzjki76nza7nu5vzf6c@l6hsfnwpb4dj>
References: <20240328173243.7-1-francois.dugast@intel.com>
 <857chmvyy7.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <857chmvyy7.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:217::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7106:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6UWg1KvgDCtym9SP3VZVkoD+w64NXGtqz4x2x8W523x0WTXyzxfOjd02RClMbbwLM+OFKuWPOiEvQlBSImvdtAH5j2Yirjuk+88RnlkvgSSRlJEr1kqbiBp6eHtNYc7dS03QLEEZiutybuTFfFqfwXbq7KAsp0RNRAraYESPJ94SZpc6VS6iaRXRjP6tXv83TQY9PXNZKIJZL3ovmYEPwR3QxlU3lywQ4kikSmH+qUl/rLydrVCrk7HHQpSC5sHHEQSRitB0Kd4UJL3aTagC5dpk7nFSGo4STmyb1qUaIyUGkyyRruPsUbfA8k8g3ylnWO6lB5YDfTvJcS3DG54Np0Z0G6143UoPNr1f1D9rQjgcFNpTY13VdyOwfDsHuL8gvlc029y454OprK5kuiENt0ou7tFp3QswV4qP6wtfpTRdsLXbGOWVE7x+GH1hOnYsshK1Ny+xfE6MDb1ZiPu+Bxvsxj840+Zfau1X6pt8RhF12JLYjG30Ftp/9CH0LL/w1vXW7fG7ORFnHGgLtnML2/LchOwkSQRn1AoZEI0bw0SB7myVAJRbOm66cnX555aGg9f/YMNKSP/a8cHfF77voyilG99QRZmNlbEXiMxPLIVNkX7umQ1gAtZqZudEPPLnho250rOTnyp7wYRMyzGr5mR7LfCbFWNmlR4Hlh8dh4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XFdoRlc0yD11syog/bjpFOmyHoxXLAqLj/Deizx1qYmsvaLpQcLI5vjHE82z?=
 =?us-ascii?Q?+piABvt7PpUwLoskxSg+bQUgRwwltRp08uA7sbJrunb7ZEOAeXB2kV0ByXFx?=
 =?us-ascii?Q?wuvlrj1CR844Z8bxKjJ0vG850Nc64gXae5w2st56/g8B6ajbsn3jZ0JoCnTo?=
 =?us-ascii?Q?24H1k8ozjIhNBBLzCX58/hTKjeRSMq/PEM7acPl6iMDcxv4tEaVL5xufQ98x?=
 =?us-ascii?Q?5TeEQ+K7dtZiLZYf/1WGz+HD5Zwrq2z1kN3UK4w1lqMiTtxtS530fLvfXolH?=
 =?us-ascii?Q?9qXaE2c3MvuD/jTqJtbQjjXGw/Si3QhgoaajCmNzsVjVGxFT9s6WFQ4QgAIn?=
 =?us-ascii?Q?1Ospyx2oMGg+vObNRaFeu1fQgg+/CSCl/zjNcT5zS5HtllLCHcReKWQIO7bT?=
 =?us-ascii?Q?wbDeNzvswSOLjV4eU/BbtLC1u+huUV/EZQB1fTA2m9NQbILI2Y8ZGNPoqLR/?=
 =?us-ascii?Q?dl+DTtMOz84QQM4sZFnBQDVUgfsbaK/IMwHN51D9fpzR5g2zvkxecOlYoRuN?=
 =?us-ascii?Q?4IDPvBei0WHudkDrTKagMjxWJhD54PngHN+YScRjX4iK+HGZD5Bl2Qq/B9Xs?=
 =?us-ascii?Q?Kg9duJzTygouXIvDpAZx5uKxE2/qLlZY3m8VjvSuCyWEi3ZQ4UGN3dLl0kUS?=
 =?us-ascii?Q?OiJmVy4INs1zfriqcOKdLcvRO5yaBKfyHJ9U+vc/4X/N8Dc54f2YnCH0MPSi?=
 =?us-ascii?Q?FPIZmU7/Z/Gj80A7kTO5D1vtSHj7TmRBtY36oa9i4y+5HUM1/Xi3v+c6qkxW?=
 =?us-ascii?Q?UQ7X62dZ/aIRMvCZvZ1hUeYUyW6htrThxJfo0Ip5DAofrbPKNAuDcR8uSWwD?=
 =?us-ascii?Q?0QIGNJg0Ukkk7xIw4nYfSvcvsRUvJVji9Uk0YQIsBn3om4D/qPGJUc2Z2Cqm?=
 =?us-ascii?Q?bcLctzd2Mlq6YucnvDBeYuKxUt4CP97/nYHCmZZAIMqWPI9tAWug8hwQ3UyA?=
 =?us-ascii?Q?hIyMQFY8CJTRZIjLPca35SNyxPnireazIxUphtvUrvqWnx6xFYoO8+Kv+/3x?=
 =?us-ascii?Q?9kSXQVZl5pJvbD0fqvJhdebVW16yrcS4t+yYPDjzbeU8Z7iHa+U23AH2+8+F?=
 =?us-ascii?Q?wOFiX616U+sZixH1ymRaUGPvyxSQuMNkb0G+v5cYI0XjQj9Xyhr65YO70XBF?=
 =?us-ascii?Q?VkEv79U4RPw/KV9eqKUksAHOxcHFAgRaDYpAO6988JFlJcZZLDHYtdX3HYVq?=
 =?us-ascii?Q?/fmsF+wV9bnqB1lj4+hVzmvWKtpjksYBiu4Co49w2G4kag/Ax4tZgODWK+gH?=
 =?us-ascii?Q?b+DGApnRGSV1S56RD3qET7TqMBO9tsDf5kMCI/91e8p4DHgcPltwrdgpDWlK?=
 =?us-ascii?Q?gfl4vN3gKwh2tOKRNr11iUeTUli89/x6z67vC7G0lkujTBJt4OtXkVgp/5je?=
 =?us-ascii?Q?Zrjy3A7N9bNpnXNvsohXqnhDIJ6TU1bovRDxFmt79kCdohrzigphZV57K2iU?=
 =?us-ascii?Q?nUbFWPTnZHvbSakn0GUu1IsYmXIbTsvgsU+tNIhtpn/KyJuRR8zoynoYJSYM?=
 =?us-ascii?Q?Mqy7f1Kh1rVq17A48ErJgFJnWLvi17HphtCryN0o3UdZNqCb0MCldc1QTL2T?=
 =?us-ascii?Q?5J2RDZwUJM4ICmkWwCUKZKSnQx38Q8VBIy2F4u3PCkVHbRpkSU3Yp/J01sKi?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f90bc5f4-5f03-459a-29fe-08dc4f81f513
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 23:51:16.2401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbyeXR0oam9hSHU07heaaqjgIBpV4IUKc7oISLijuaKLlFrZZ9IFEqxPQYTvZB5SMZuDA4o0Km1bfPgArT46+CBtu9Y388X9OPCkcz9YGBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7106
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

On Thu, Mar 28, 2024 at 02:17:04PM -0700, Ashutosh Dixit wrote:
>On Thu, 28 Mar 2024 10:32:43 -0700, Francois Dugast wrote:
>>
>
>Hi Francois,
>
>> Currently xe_drm.h is based on drm-next with some additions from
>> drm-xe-next.
>>
>> However some uAPI updates brought by commit ca4607939 ("drm-uapi/xe: \
>> Remove unused flags") were mistakenly reverted by commit aef5f4742
>> ("drm-uapi: sync with drm-next f112b68f273f").
>>
>> Ensure xe_drm.h is now aligned with kernel commit ("drm/xe/uapi: Add \
>> IP version and stepping to GT list query").

missing commit hash on this one.

>
>Let me copy some people and see what they say and what we should be doing
>here.
>
>Previously we were making sure that IGT uapi files in include/drm-uapi/
>were in sync with kernel drm-next branch. I am not sure what the reason for
>doing this was. When we were doing this, any definitions not in drm-next
>were put in lib/i915/i915_drm_local.h.

I think it's because drm-next was the one covering all branches.
I don't see a reason not to take the xe one from drm-xe-next when we
need it. We just need to be careful when sync'ing.

>
>So should we be doing this now even for Xe or not? Or we can just keep the
>IGT uapi headers in sync with drm-xe-next (or drm-tip)? If not, we would
>need to create a lib/xe/xe_drm_local.h and put stuff not in drm-next there.

I think the _local.h  should be used just on special occasions, when
e.g. implementing the tests and the kernel side is not merged.  If the
kernel side is already merged, then IMO it's better to take it from there to
avoid typos.

Lucas De Marchi

>
>This patch syncs IGT with the uapi header in drm-xe-next. If this is ok,
>this is:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>
>
>>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> ---
>>  include/drm-uapi/xe_drm.h | 19 -------------------
>>  1 file changed, 19 deletions(-)
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> index 4353595a4..91ea92035 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -871,10 +871,6 @@ struct drm_xe_vm_destroy {
>>   *  - %DRM_XE_VM_BIND_OP_PREFETCH
>>   *
>>   * and the @flags can be:
>> - *  - %DRM_XE_VM_BIND_FLAG_READONLY
>> - *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
>> - *    MAP operation immediately rather than deferring the MAP to the page
>> - *    fault handler.
>>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>>   *    tables are setup with a special bit which indicates writes are
>>   *    dropped and all reads return zero. In the future, the NULL flags
>> @@ -967,8 +963,6 @@ struct drm_xe_vm_bind_op {
>>	/** @op: Bind operation to perform */
>>	__u32 op;
>>
>> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
>> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>>	/** @flags: Bind flags */
>> @@ -1085,19 +1079,6 @@ struct drm_xe_exec_queue_create {
>>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
>> -/* Monitor 128KB contiguous region with 4K sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_128K				0
>> -/* Monitor 2MB contiguous region with 64KB sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_2M				1
>> -/* Monitor 16MB contiguous region with 512KB sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_16M				2
>> -/* Monitor 64MB contiguous region with 2M sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_64M				3
>>
>>	/** @extensions: Pointer to the first extension struct, if any */
>>	__u64 extensions;
>> --
>> 2.34.1
>>

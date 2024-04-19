Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5809CC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 16:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C083E10E071;
	Fri, 19 Apr 2024 16:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpSKDnWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9AC10E071
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713542546; x=1745078546;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=lSbizhWHVrDkQKBkkSHxpDlwj0AAWPIHibDDzB9x3sc=;
 b=EpSKDnWTGtpiSr078Qk0TwJTZ1WPDWBk2TmN3y9ZlCQxQyjmdjz4LNZG
 e5whqb71iocyYjkfPgJG7RizUwrfyp0TBUNOGJ0iQtr5reZtW+C3t5VNF
 Z0bL02s1+tBy6Xx3qpoBoLS9x8ScQiWpmaBSJvvXijlHBkmSHQmk1TKWC
 HKsCGJTV7akC92nCHlo+ztc07XbFIc36Enw1eKunjNsdk3+7A3DyoB3tt
 LGz+UQiDmNWqP6zMMIV60ykjlwxxHJQzLWKbeqJoaLRLkF5WIfdXbykbE
 arrKCS4WhwcfMm+qEockT4WRfn8+ldwicZn+PTwbmYKLLas0KYc6uGAn0 g==;
X-CSE-ConnectionGUID: ha4CPnwRR/24IdmP9+Dk1Q==
X-CSE-MsgGUID: CbaaNkg0QcGCue6Gbztn2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9306789"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9306789"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 09:02:26 -0700
X-CSE-ConnectionGUID: XuEOo4hYTe6zIvsFZqob/A==
X-CSE-MsgGUID: c9JhVj5eQ7mGVr2bB3p/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23823669"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 09:02:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:02:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 09:02:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 09:02:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hE0rW+6T/tm2sgK62zg1p0UxZe4b1zZLQXSR2e2bqV2qlQYZ5JvXrIyb8B1FZDZV6cYCH3BXuIBehqo5jyb1u4E6MfEcBSwMmrTYPgXHxh0dc57E23UIO55mqBzE8Bvu3FeeNHViIK5OnLxCii4DczzfZ2iq9DaiC8jUYUpi+DRwIlfuhB4lSqrcvfanfJZ4bOSysC1nSURN1HbKGMhZxLn3+C/rOf3K+/puVbzy/xz45ZgD2o4NcizK9o7K2hF9hwSLkVSWbeG7rEpqAeCcbaPx6t6xbbCTCJ2YbBl7l9pbHDQCePNKa59fwpOmTCmB3L9RhicN7DAN5X29gdyPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWjdMX2WGXuTfXIXP13BUp+wMH/1VIL7FfIFpGjLZfU=;
 b=TAoKPJqvsPOojDTg7/MK5Iylabb0UF8NHeFBfiDVXto4JrAYhpdLZahx3+J96+xNLWjN65UZnioscRbdTe/roGEItcAcxU+pRUulFiYe0Zwbg8+E+10avyfp9W+XWWr12+8VDbSSwT2na32DNNHGfS0HZqv9BGiOoIaBJo8Z9LhCv0lPMWca9GblaMIl6jDp5SC+CTSrB0taBL0Jts7K9fU64TpaFZkVOGoT2yK/6Q+9B/oykYuCFcD1zyE5o47qayJK/lBryzpuY8R9hKgNld7dcYcBNNsnmFRLDwop5oUVptKDyitJlzBZJSjyInj0xVho8wMCnT5xEjkcauAnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.31; Fri, 19 Apr 2024 16:02:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 16:02:21 +0000
Date: Fri, 19 Apr 2024 11:02:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Francois Dugast <francois.dugast@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t,v1 0/4] L3 bank mask
Message-ID: <6sb4yw75bkgziatc2nr6qacggj6krf7ux7djjq6yeuelxag7s7@2srany3jz3h6>
References: <20240417145049.7-1-francois.dugast@intel.com>
 <sx44ek2wi3megbrlu5pxzny55n6didg7kwopygzzywgcjs5ic5@wq56mdm4s4wi>
 <20240419131452.syac5sjam7ramkt4@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240419131452.syac5sjam7ramkt4@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 838e1861-5f69-4957-5010-08dc608a1865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O/7Wi60q3nSz0dj7PxiSiMuN8lX/5pm7sKjT77Ppq4RAa/1UYmEme0VdbuNT?=
 =?us-ascii?Q?9eApa5JHvsNbHG5D0SrVSFUZDCUxttuPtEBB5wYcXkNUYGv0KFf3zk/hV9M3?=
 =?us-ascii?Q?Vn9rdEhE50Ucq5N0kl7hfUfTNrVGzPm3U3OO7RPb9ktmLPqjwDik+anx6Vxf?=
 =?us-ascii?Q?tmIZz5VhIVP8hVbTpNXTIX45/z1tH7ZxZEObiSAAGMNO3Lp8Lm9Q9qPtEQ/v?=
 =?us-ascii?Q?/tK3Cl+IUcFlnBUNhWasSeKJyEccFvt0QvmAVY/mxGk7pMQioW4L8nJuDrWD?=
 =?us-ascii?Q?H+K0IMQhWOfrQZu6+QcxefsWJeTyG98bjZZK/mfnk6195spD+iWAVoWHf5lx?=
 =?us-ascii?Q?7saZmNCFryHOQ3nuC6ES+f4kmxVSp4dJjHQD8V7DbRCLqtQ06UmADzKV22BX?=
 =?us-ascii?Q?NqFtpotVtFbesqzTbIoFqMlVPVQQeapXs/BH3yJQqFduGMMAzxkBHkxw5+Xi?=
 =?us-ascii?Q?XUZIR37dZauuFpOyWSRYR4S1PMy5Qqk4mdKVpHSidV0wKeRzUzakj8k277oX?=
 =?us-ascii?Q?T4kUMqbT/gorYQQris8oN7p+QTea9+ldTHLT0gk2QaBTkU+I0zTqZJe5Uf72?=
 =?us-ascii?Q?v7duyngPy7bXIHE4Ys45jvATo+56um2WKhqDWBwEe9xV9A3sj9M6vfl3CA8E?=
 =?us-ascii?Q?yf0K3gCTGtfMFcU9kwa19tUeK0YSimmebm8s7WFKf9iturKi50n8jDduMoBX?=
 =?us-ascii?Q?CFpQomKGJGeC1CX0pUdom4pKd6Bm8z6/Rzx7tPTzKKVjCA78DIFB38pYQdJZ?=
 =?us-ascii?Q?FoU0Hu0EJ1DthaLZCRFTW9F3dqKbrMb0/vzJfO25joRksS2UQVQg4fkUePer?=
 =?us-ascii?Q?gTjujNb56KPQknyYtu525BbUC+WbWe0DQKWWDcTt+h5jqFssn01DAA2vQdO7?=
 =?us-ascii?Q?xTC49qqBJKBjTDaoxloMKgVwL1HPHonsHBz71WqMvwf/xOU9QUZ/e5bK1jF9?=
 =?us-ascii?Q?mBQVEqdGE0qj6GJh4Lmzr9ggVQeJ4sc7fIsgpIoi0Qo8jRmWHFjINEveTwLN?=
 =?us-ascii?Q?SZ94VL55oldmbtujFRZ7Sf21vb0MBt0UaNUVyKDJIEyQ9LjzMjtA8X0hdCCy?=
 =?us-ascii?Q?Wtd/Gig8RNLw5EwKVSJEgdNpTBGYoj57+XqQz4AYYZASUL26esQnL7pTvi2O?=
 =?us-ascii?Q?7qYY2D6hVs0Kjs9NYUI8lWS1kUJR/r7b/RS/arrEyGuSeIhINFpkhMKtgGjp?=
 =?us-ascii?Q?KSKcvSUkSimNgTt3YNtNGvtjN1G+3xXVr1tM+YMK4wP/qmek7JWjMr8VFD8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?saJYjoQqN7DyUvQp8EhehgoNdvVS8qkoKRjXg2vqU9G6z5apl7+nu6bJc4br?=
 =?us-ascii?Q?DyMyTuxR4Abz9Mp2m6Yd3uRpKzL4gTX0d5XzcliUNWt9rvkpK+D07CHMZB9I?=
 =?us-ascii?Q?wImnsEfDC/7svs4Rnsx3uf63l0CJEee8IZbyAQ9DkkjSetJ+FiaH8NTXLG5S?=
 =?us-ascii?Q?Wo+br24vnsZQBuDEo0sm9z7CcBN5sn1TTbd8Z06S+hnWZTms9edVKQpnHERA?=
 =?us-ascii?Q?vlVsZO8C7v4OBm3yBKhUsO6HsYVLZI/n66uxHr4mSLxMt/lO0xmgIEHT2dOn?=
 =?us-ascii?Q?dpD1z7uWrxFeBmQ7XdajLo+zAkNUnW6r+OELiDeFIFr52DbcVqhDKGP4ROzu?=
 =?us-ascii?Q?FeyeBaytgfjf7IoYuQdk3M0ex1y7ambPAFniUMndj8lzYuQ709VuAcvnbrZm?=
 =?us-ascii?Q?ztrvLe3HgWLXVmBzpnz/rRjyStJuNLfShg7K8Tv7TiOMN/bfjB/CXHukxYu/?=
 =?us-ascii?Q?TgOllfQhulKgBm9mrP3/5izJfW2SSc85m91OCex4cw7eJmzx3BlWDZGZCgbw?=
 =?us-ascii?Q?zuOpJnpNLVPGMrmkj05g8NBYAJ12ScQ7mpBx1ZKWs7ptkdN7pVg5otQyGThn?=
 =?us-ascii?Q?Zzmw4gSaM5tgAQ5/+XQ8VXYyFCWwn6ykktD7J9PtErn7GlJc5w1Hbv9Cphm7?=
 =?us-ascii?Q?uQQCQRq+4H/HyfzYw1wr4gl2omO82I4ddi+iMpoq2wobyK40dMm5TszLS/oW?=
 =?us-ascii?Q?gJwNA5jNRjimWpT+Cw7OnNoatM6Du31ueL/D25gKhns/ypURrVGBXvxm1mde?=
 =?us-ascii?Q?cw+sd+562DEq07XFuL88GaQs3dRo/JqK4lcju+v/pGXQLzgN4oscyablgYKJ?=
 =?us-ascii?Q?pg/jLunnuyveKk2ruOWBhMaJysAcciSLNgWveQa6T6bjSHijbd0fItFmjfWe?=
 =?us-ascii?Q?7L2LYLZQvFBMr8VrETQbyCyOLhXLw9k5Ys2Yqv6ky+GXZdGmOHw23GLzaMGR?=
 =?us-ascii?Q?9pNJu9cgtg1B3+KfLtgmlKoeq/ito80hsmfRvu25S4rBEVeLbwsgrcy1+5/v?=
 =?us-ascii?Q?qsxy8qI6W911FvHJpEo9lHbMr2tOunCgX5HM5HqtE7xmZvBitajQvmran4I7?=
 =?us-ascii?Q?67zmogBSDmQnbT4j3mpdrL7q0fDTyX6zoLpFgHYYdmjk8ebFgNaWdRG+1cwa?=
 =?us-ascii?Q?ubb5LfZssfiKiZiTAdjeZUoVvwRQEd0MsFDhf6kkDHu7iOd5vlIYwZfB94Kp?=
 =?us-ascii?Q?oQX61cgG/TTvwaZPJ1EYSYUwlwCISPXYqs2cTHMayKf8rQo30CKh+7FsVVi+?=
 =?us-ascii?Q?b+PMorQSDLlkfFDs9wBu9PmipuPmMwhC0r4WaAfHP1uEly8x/YDFeufY1afp?=
 =?us-ascii?Q?5xGqnEpu+uCWWQPVC2CmozZhZtoM+NWdA+8bruDpViCDAHPlFopV2RinwEab?=
 =?us-ascii?Q?bsYv2Zmc2oBPa9vRRl6Izer/z6Rk9J/Z1MZZoybZDsL2Ec3/2UgN8TZgY2nK?=
 =?us-ascii?Q?pgPfQb4V27T6Oy5EkvV1OVY14nhKt8xRX6Xxa7iMBciMvEQ8lgkqHbKTLlR0?=
 =?us-ascii?Q?nMHYPBxDzioBsfZf37qcVAJ50u8bXYcDHh5zqZtLDHmE6UBQTbEvBo6c1iX1?=
 =?us-ascii?Q?FViCJ0ztbC/nXnpeWGmC8WL4+d3/DhLdCt39NKXVuz4CehQ0GxmYbyiMbsAQ?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 838e1861-5f69-4957-5010-08dc608a1865
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 16:02:21.2383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CFi3FMh1VCeKvsAhifWX3MicopDMHnCLJC4QfK6gr6UJrU1mPOxus/rXZJ8QCc1+RVwP4NFJ2mBfCBnd2e6/CUsGfV18flEElWhC+oY63s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

On Fri, Apr 19, 2024 at 03:14:52PM GMT, Kamil Konieczny wrote:
>Hi,
>On 2024-04-17 at 11:07:54 -0500, Lucas De Marchi wrote:
>> On Wed, Apr 17, 2024 at 02:50:45PM GMT, Francois Dugast wrote:
>> > Align the XeKMD header with the current version and add the L3 bank mask
>> > topology query proposed in this KMD series:
>> > https://patchwork.freedesktop.org/series/132075/
>> >
>> > This series first includes some patches to align the XeKMD header which
>> > have already been reviewed but not yet applied, from this other series:
>> > https://patchwork.freedesktop.org/series/131816
>> >
>> > Francois Dugast (4):
>> >  drm-uapi/xe: Align header with drm-xe-next
>> >  drm-uapi/xe: Define topology types as indexes rather than masks
>> >  drm-uapi/xe: Expose the L3 bank mask
>>
>> no, I don't think we want to merge these as is in this series. It can be
>> used for premerge testing, but this is just reintroducing the same
>> problem fixed in patch 1.
>>
>> I applied patch 1 locally and then did a diff with the current
>> drm-xe-next:
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> index 4353595a4..0b709b374 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -518,9 +518,9 @@ struct drm_xe_query_topology_mask {
>>         /** @gt_id: GT ID the mask is associated with */
>>         __u16 gt_id;
>>
>> -#define DRM_XE_TOPO_DSS_GEOMETRY       (1 << 0)
>> -#define DRM_XE_TOPO_DSS_COMPUTE                (1 << 1)
>> -#define DRM_XE_TOPO_EU_PER_DSS         (1 << 2)
>> +#define DRM_XE_TOPO_DSS_GEOMETRY       1
>> +#define DRM_XE_TOPO_DSS_COMPUTE                2
>> +#define DRM_XE_TOPO_EU_PER_DSS         4
>>         /** @type: type of mask */
>>         __u16 type;
>>
>> @@ -871,10 +871,12 @@ struct drm_xe_vm_destroy {
>>   *  - %DRM_XE_VM_BIND_OP_PREFETCH
>>   *
>>   * and the @flags can be:
>> - *  - %DRM_XE_VM_BIND_FLAG_READONLY
>> - *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
>> + *  - %DRM_XE_VM_BIND_FLAG_READONLY - Setup the page tables as read-only
>> + *    to ensure write protection
>> + *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - On a faulting VM, do the
>>   *    MAP operation immediately rather than deferring the MAP to the page
>> - *    fault handler.
>> + *    fault handler. This is implied on a non-faulting VM as there is no
>> + *    fault handler to defer to.
>>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>>   *    tables are setup with a special bit which indicates writes are
>>   *    dropped and all reads return zero. In the future, the NULL flags
>> @@ -1085,19 +1087,6 @@ struct drm_xe_exec_queue_create {
>>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY              0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE             1
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT    2
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT           4
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER           5
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY            6
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY       7
>> -/* Monitor 128KB contiguous region with 4K sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_128K                                0
>> -/* Monitor 2MB contiguous region with 64KB sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_2M                          1
>> -/* Monitor 16MB contiguous region with 512KB sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_16M                         2
>> -/* Monitor 64MB contiguous region with 2M sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_64M                         3
>>
>>         /** @extensions: Pointer to the first extension struct, if any */
>>
>> I seems we don't need patch 1 and 2. We only need the commit used to be
>> closer to drm-xe-next.
>>
>> include/drm-uapi/xe_drm.h should always and only be updated by copying
>> from kernel from specific commits documented in the commit message.
>>
>> WIP changes while the kernel side is not merged should be moved to
>> another header. Traditionally we used LOCAL_* defines for that. But that
>> comes with its own problems as it's more work to  go find them all and
>> drop when we sync the headers.
>>
>> What about doing this?
>>
>> Add include/drm-uapi/local/ to -I in build system *before* the non-local
>> one. Something like:
>
>We already have similar solution for i915, located in
>./lib/i915/i915_drm_local.h

which I mentioned above with the LOCAL_* defines and below
with the header we are talking about.

>
>imho we could have it here: ./lib/xe/xe_drm_local.h
>
>Regards,
>Kamil
>
>>
>> meson.build:
>> 	inc = include_directories('include', 'include/drm-uapi/local' 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
>>
>> Example content for
>> include/drm-uapi/local/drm_xe.h:
>> 	#pragma once
>> 	#include_next <xe_drm.h>
>>
>> 	/*
>> 	 * Local definitions - delta with WIP UAPI while the upstream defines
>> 	 * are not yet merged. These are supposed to conflict whenever the
>> 	 * upstream header is updated and break the build. That is intended.
>> 	 * Commit updating the upstream header should garbage collect these
>> 	 * local definitions.
>> 	 */
>>
>> 	#ifdef DRM_XE_TOPO_L3_BANK
>> 	#error "Already defined by upstream - remove"
>> 	#define DRM_XE_TOPO_L3_BANK		3
>> 	#endif
>>
>> The ifdef + error could be optional as it's harmless (and allowed by
>> compiler) to redefine it multiple times to the same value.
>>
>> Thoughts?
>>
>> If we don't want to decide on this and you only want to unblock this
>> test for the kernel addition, then maybe just do the same LOCAL_
>> approach currently being used. See e.g. lib/i915/i915_drm_local.h

^ here

The problem with that is spreading throughout
the code the "#include <..._local.h>" and then removal in follow up
commits.  A single -I.../local/ avoids that.

Lucas De Marchi

>>
>> Lucas De Marchi
>>
>> >  lib/xe/xe_query: Add L3 bank mask test
>> >
>> > include/drm-uapi/xe_drm.h | 27 +++-------------
>> > tests/intel/xe_query.c    | 66 +++++++++++++++++++++++++++++++++++++++
>> > 2 files changed, 71 insertions(+), 22 deletions(-)
>> >
>> > --
>> > 2.34.1
>> >

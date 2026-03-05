Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CED6F30924
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 09:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C6810EBD4;
	Thu,  5 Mar 2026 09:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqusPZGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B89A10EBDB
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 09:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703168; x=1804239168;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XYmubEtZgiEf13LVvtJp0lWQZDKiQSodJ3td5103gN8=;
 b=AqusPZGyKnB4hv+oeP3EWhxe0Td+gdBUV2Q2KWfxoOEKF3T+eXwo/eV4
 zaJkwtQkRHr6QXiEIdvCz9xK4EoVvHffDV9rIIXfi0WoTsm0brEHNC10l
 hmF3+lZYeCyYsX1YAisq7/Ceyxp6K3QVCmh/4RvbjOYhtviJHNaO/XRax
 bpxgpgM8LUIOCbqiGlLvLCGo2kQY8F2riBjEEop38XrUpi+fRYhbfuTgQ
 Ijm1NmZ5GWR5Y1ECR3sRuFS56nw6A03byRFu523FakotQ0S3lY74Slt/m
 txunZfVfj77P/dWgreKc/6Wn/D6W3M0G6jhrki+V1TISLcqDfIc4JNXNj g==;
X-CSE-ConnectionGUID: jNDkf5B+QuiIMHb7R2kksw==
X-CSE-MsgGUID: hxypJmABRGKWD1sS1Cr7Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73906349"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73906349"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:32:48 -0800
X-CSE-ConnectionGUID: luB3oXRMTai8fKfA5F2/ig==
X-CSE-MsgGUID: QLJkLBE6T7+aomiD+FuXPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="241643796"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:32:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:32:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 01:32:47 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:32:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loL5ypPeIz2DTztJCxbMjDvXD/uvvX0hrTDX/tZJBwVr0mOVNKwtamv9Vll0s6lLsDgWhaNM0gCVAnS1Va3Ja1BMr/84cmoEZbnVoRZShnyLMyxfBAnVRakFV3WL//1yZvEazrm67FU4ChAyCOaDKSNLwbi2UYXmMXS3u0MoYPIbZunZBeuFjBGAkyEssbZLxqDOwH3YF0WIdEIq7tdSh5Bd8U9vavBgt1H6biNR6q2VUU1aqoqRntWygafuOqL+Q2/0NHsqEcdnsffvEDq1AGnvmfU0ufM45+h5GzT/JAXevFwPqCDtGlw+fDHkMIOt2soU8SHxrYoohcDWaJn6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVG0pnmYNgHIwd4ik/CGbPZ7txt7ZamwQAbJ+yMwIUc=;
 b=ZEUG5LA68bFWM4eLH/4dHGLIF/k/24VKE3pesMsiOdHWiN2ryQuMiDN5YZD3S7jYXS6LH0++Hk2cz8hdAlV2OFZpu7U6SoDnWmLHQE6NRgbmI5xgpFFY4849dayFcv7MvAtTfS4miZovNhpg7JOAkayaErJN72DKNzpX4rpWMvhtkB4l8PXsX2q8Rv0qUxldCVihjMVUWDlq5xsuAcliY0Fnlfp20sS7W6ZnfVwVfXGVHKqjNA/vI0z/CF0+HkDd/33E0QZoCQ7nKhhXMIOpA8Qhs+w60e+osphMqJ8B436McsEJixCewXHbdZWB/Ri1mEmFf9p6vye8j0paAPQB4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA0PR11MB7884.namprd11.prod.outlook.com (2603:10b6:208:3dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 09:32:44 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 09:32:43 +0000
Date: Thu, 5 Mar 2026 10:32:35 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/5] tests/intel/xe_exec_system_allocator: Fix
 compute array migration size
Message-ID: <aalNsyGiOa-YhpEZ@fdugast-desk>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
 <20260128173412.1319610-2-francois.dugast@intel.com>
 <jp64zuwo26deddnpfohmpkx6yu6z2jvleugjisb5bfz74crxbj@r2g4h6jemhqd>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jp64zuwo26deddnpfohmpkx6yu6z2jvleugjisb5bfz74crxbj@r2g4h6jemhqd>
Organization: Intel Corporation
X-ClientProxiedBy: DU2P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::22) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA0PR11MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd7c2ea-ff10-47f8-479a-08de7a9a2708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: bermkwBq700loUgdMADeBxvSaMxp3Ctirmxp9Lpj2LqK260omiZ+CG2ATFyZU9rSxpXNpxssJSTe6M+NSMZbjVd43nwhCYAVj0qvZ47SgEgCOzB8+/jI//53vtOhuMjXBhYvrJwAS35WrlaXaHRXT2r5aA8344GfEUgqXI4sgHcfG2xWdZJVZh4dnMgk5vPcz3IJifHa8cIrNfmyf7hHvsQGKOvOhnntr/zcKn07pIMmrNuZgxbGRyr3LuginTOy/RBS2++WOtaIghcddsW6URz6c3vHTa3NNynMecfAzDp99DBtQy9Al50VGOwzv11Zy7tUg6byCBtRx7e/zN7+jG7LvfF3v1V9C3ofkWV3xmKhlFlKhdpSclPge5NJF1E2uG262pT4Yld/FoRF1qBj+cVT72u3bg+irSupdutgbqDpXVrxChqTepQWMWHjaAUPVYxE3JAbX7unozz3hNabqPijE9N64pCNYP8guIRaSAlfC/+YIUYR4tcv9urT7x2tddVIlXpU71+TsGHh+VzTP8B1MsofpRFoGDi5t9OyvrBFtLEdA8HE4vi03eZrgJlmpe/ZMnWvoTbatk0jcRIzV6eHa3SJZLsHrzzB0CLuyHNgY6KaApnD24yrkVpg/lwnuMsbCkOOCK5IKQq+0bLnoySmP9MfvXWVfofO/vzRvA8G1f+K9ILmUcZycfK8yObpJulaR9bS2XPOIQjCc7uL9/NoFFqPOSqiq/UmWtPn9Bc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG12T3lyNHZvbVJpRDhza0tLdjVpeFZoejFxYUljOWxsd0Z6YUlzdldHS2Ns?=
 =?utf-8?B?YUViQUJ4bnQwZGVmVWJqRFVPWVo5NEdKM1o1RmJoN2VZWlI0Q28xVCsyTGlS?=
 =?utf-8?B?WHFpUW1vR1hUcFJCKzIyYmhSeUEzU0FreHduMGN1M2twUWxoK1NONHN5anBx?=
 =?utf-8?B?eGNLSWlMMTRMUTgyS1IwNUwzTlFSRi8xb21WTnlzU3FHbEVFQWFqWjRJQldu?=
 =?utf-8?B?NEJCay9LenEzTUhHbXRBRUtRM0NiNjg1YUduelM2MDkwQTJJRVl6SFpDbFEy?=
 =?utf-8?B?SFZpS2djVlEvZ001Snlwd3MxdzB2bTFpVENDUVhzcFBJdVVDUk1qblJ5YnFz?=
 =?utf-8?B?VTBRQXFvMDh4YysxQ2Y0QVlpOWZwaXgzUDNYb3p1b0dRQitWY2RNK2d1WUtY?=
 =?utf-8?B?eUFGVzJGbGFCUXh1aVNSZWZpc2VDZ01aV0ozWEVudVZGeVZEQmF0U2R4ZVVE?=
 =?utf-8?B?cy9Sa3pycTB6OTN4UGh4c1RuMGV5aHU2REZTUVhOY2FuY1Qvd1ZwMlg3dDcz?=
 =?utf-8?B?S1FhQ3N0YUR1OTJQRWc4c2ROSlFic21xa2FMdzFuZVRMOUJsM0JLeXV6UFRu?=
 =?utf-8?B?TjJXTzNuS29XU0puV3lPMXRobTBtdC8wQnVwcUc2UVFjbVI1aUgvR0JHNEJ1?=
 =?utf-8?B?NndrSG05M0RRV2VYcG5ueDdCOXM5L1o3ZlMrUmJLVFhHclhnYzViTHdGR1dr?=
 =?utf-8?B?bk5QSHY0THhPQXA5aUtOc2tDVnF0RXk0bWl6aEtDMXA1L0drMmVZWXJXVlJ4?=
 =?utf-8?B?U1BzeWROcVV3KzNrNkM4ZDJobDBBY3BCT0dZdngzYUJHOUdkTW9TQ2F0WUlJ?=
 =?utf-8?B?ZUtDd3lRQlJSWTdJYXdUTk9QWjUxTktPajZ3Q0FxZWJRWGpBVklwWlNwdlNC?=
 =?utf-8?B?cVpXRWNCYXVja3JlUXpKbWF1QzBEQlNxOEhFbWZCY1k3c0ZDdmxPc0ptWVRT?=
 =?utf-8?B?NTZNUGFJNWE1b2YwbzZNS1Q5Q0x2QTFtQVhwc3Z2YWRIRlJrNytrVWQ0VHE2?=
 =?utf-8?B?UzFDaTh0ajNhZGVMM3lIOUtPaW50Ti9HR08wdVJNYWF3SmdLYnYyeFlsUE1s?=
 =?utf-8?B?Rk40UUFLZFl1T3dRYU5xNHFKcmNDRzN6cWR6ekdGZmhYSmV5TEdTSWtuaEJN?=
 =?utf-8?B?QlpvR1pZcjhQZXpqYm1TK2diRHIwQSs3QUxxbTJwK1J0Z3lBQVdyVDJyczB1?=
 =?utf-8?B?Y29yTVB5MDNieHNLbU9DZ3Q2YVZzTmdEWnN3SWZvdCt3amh6OE43KzZMWW1D?=
 =?utf-8?B?SHhaU3BUQVlqd3gzTWpzc1JmeFdXK08zMjBNc2hzRncxVytrUWtFb3JmWVQz?=
 =?utf-8?B?R3pJN2NPMS9BUGJ4cSs0aGdOcGU4eHVuTEJlekNyUm9lWXE2WVNJeFFmN0ND?=
 =?utf-8?B?OFBwcDFiUUJNYWRMRFJLZmZRN09WeVo2VkZmcXczM0M2Vk11bW5yWmN1Rk9E?=
 =?utf-8?B?U1cwdExBZlJKYkpLbWdLeWlCUG53N3k3OFdKaHJZRitKUkRCSVRYZGpxcEtM?=
 =?utf-8?B?aUdSdTI1ZHlsSWFOVDRHeGliNk53TmNIbUNTRElmcUFoeVN3TFc3cHNRZjhD?=
 =?utf-8?B?M3JSWjBCSy91eVFBTGNoL0xmWDVJa2VScDdCVnhYcStXblNGZnlWTHVoQXdI?=
 =?utf-8?B?Zm94UW1zaHJEajljbndzeXRHTi8vK1d5OVBsQkZHaTRjQklBUithM3BUZmx1?=
 =?utf-8?B?bStPSlVmSEZTU052N3Y1YUVOcDN6c28rV2k2bzJvRmMrSkpqQzBkdXI2S2pr?=
 =?utf-8?B?dzRkS3VNL1o1bGpXN0RRNHZxRVVQTUhlYm1jb29WaFlsMWRXazJlNW9PWjlY?=
 =?utf-8?B?TWFZQ1p6bTNJdzkzT3lhQStGa1NEcHhiaW9VYjRGVkNva0JLNnBaSkpYTWNz?=
 =?utf-8?B?SFhhdFFwOS8yWnhoSmNCVVdlUkpDQ1pEeThBb1drUGs0cStWQTIzd3JhbHM2?=
 =?utf-8?B?ZGNXbkpuWGNZQUhYbEtKSGFDVEJsamIvVi9KVDZDSkhiem9ZUTF6Nmk3S0lH?=
 =?utf-8?B?Mzc1SWRwVXliU28wQzRsRVhiWFlmT3pKdU9Kbng0STFoQ1p5K1o2djBqb2t2?=
 =?utf-8?B?WXBYOFRKZEFXR1UyeVhGWkEyeUM3NVNEZFp3T0Q1RGZzRVMvKzllbHpYbXI2?=
 =?utf-8?B?dHJKZEpuVFBUaXh4RFQwaEFwQTVuODRkSnZsNE4xU1VFTHU2bkt3b0t2V1lu?=
 =?utf-8?B?Z1dMZ0ZXQW45RGNBTFRQVlg1Z3Y4TVlDaUNyM0I2NjRQYTNoU1FUSVgzSTNH?=
 =?utf-8?B?bUZ3dVdqU1crU1ZBK0RaM3pRSkZtcHpMdzRQdFZ0UDJ5UzlKclFabnVvQmhm?=
 =?utf-8?B?NDVIbzZLNjdvUkFSTE9PQ2paQi81YjNJTTdCOVg2TEZhU1d3cjNSSS9HNTly?=
 =?utf-8?Q?2KVea9pXlIMIpbRg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd7c2ea-ff10-47f8-479a-08de7a9a2708
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 09:32:43.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0ZpAGSiU9hP4pKnCj/ShNwpymsgldLNzgb5rsl3tc2EQRlxqeuLd7GQ5pno9HpBy0ailM0ATFmQdDrHFQi1ehQipeI7f+Dm7YuEy0VvBHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7884
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

On Wed, Mar 04, 2026 at 05:13:15PM +0100, Zbigniew Kempczyński wrote:
> On Wed, Jan 28, 2026 at 06:29:06PM +0100, Francois Dugast wrote:
> > This fixes an issue where the migrated region size when handling the GPU
> > page fault did not match test_compute()'s size argument.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 412ad0384..23a429f24 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2220,7 +2220,6 @@ test_compute(int fd, size_t size, unsigned int flags)
> >  		.array_size = size / sizeof(float),
> >  	};
> >  	float *compute_input;
> > -	int i;
> >  
> >  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> >  	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
> > @@ -2228,7 +2227,7 @@ test_compute(int fd, size_t size, unsigned int flags)
> >  	bind_system_allocator(&sync, 1);
> >  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> >  
> > -	compute_input = aligned_alloc(SZ_2M, size);
> > +	compute_input = aligned_alloc(size, size);
> >  	igt_assert(compute_input);
> >  
> >  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> > @@ -2236,8 +2235,7 @@ test_compute(int fd, size_t size, unsigned int flags)
> >  	env.input_addr = to_user_pointer(compute_input);
> >  	env.vm = vm;
> >  
> > -	for (i = 0; i < env.loop_count; i++)
> > -		compute_input[i] = rand() / (float)RAND_MAX;
> > +	memset(compute_input, (rand() & 0xff), size);
> 
> It might be rare case, but 0 may also be use to fill compute_input.
> rand() % 255 + 1 would eliminate this possibility.

Sure, will do. Thanks for the review.

> 
> Regardless above nit:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew
> 
> >  
> >  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> >  
> > -- 
> > 2.43.0
> > 

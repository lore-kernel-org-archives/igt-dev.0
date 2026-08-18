Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AACDC5DF81
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 18:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B24610EC37;
	Tue, 18 Aug 2026 18:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCKYmLAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488C910EC37
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787076144; x=1818612144;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/p29aJ1oNWuLog03nJKb845s6/+eAw9osEmvoZKYLVo=;
 b=XCKYmLAZpgJLjK32XptN8IDj3o4VZWFZj5pEUaxSxXFRL4IuJfVYQVuW
 7/FQUEHlUjz87oJY7WBCz/GtYhe+Jpcirvwssf8aNLSCt498r753vs2jv
 8c6elDf9mll4HJaqGClnAl52aY0BgH9L7LDPDLuyoYeqxLeEwvZiDOIhy
 CNRUNZWPiTGaWZQnzlenyU2AmuVkzbKZJNptIWMlbDLKKezeZ0QHbaNPE
 SaJmJ/81uHIhF/bpiITT7F8lQka757S52o5YlCglHn0N9cpAARyiUhpwI
 Oil7kuswnWUF+1gw5v7FuLCX2L2WRz52LM3N3O9DnEBD6izQq6g2xuHHB w==;
X-CSE-ConnectionGUID: vIe81PJJTUC+fZMv1Zg36Q==
X-CSE-MsgGUID: PeaWA4hPTsKPAMQVeXZ76A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87433230"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87433230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:02:24 -0700
X-CSE-ConnectionGUID: ve2zZp75SDGzmhuHMiPWEA==
X-CSE-MsgGUID: AijvjJpnTi2A9zCctvA9Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="268807293"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:02:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:02:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 11:02:23 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:02:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILHUo2sE9sLVN4opMXJB3TNamV2yfQslV31Tjt/y6TeLqRuWDE2U/uxe+OzmVQ+0YQY40LRZOkqQk5/caVZBN2abr/Cw8IPbyCUQJk5+vGpj+ut4d9gOdWC5kFRVhgbmk6wPiyQp227qAflP8Lm6Nx9pttv8aNBEIiLXmVJ2Thj9vyKg/vJTYp3Y6X2fmstetfFhsbmET+yvkWi/WSidq67WjW1GYenguE0Hlla6LQC822hvUIdu+KliVf2uxNHiBo0ajUM70Iz0M5f28jguK4cTtyGwI1S5boZpDp/7GpqrpT7DSY7YzFaFVLJLQMDdzoh+pWz+H0H0T/K1TDBOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcrN2dbFRj8I8VZ9keeqghFYAA2vMShhWkW6wVXGBCM=;
 b=tn1uSXyWfUd/4M2mqKCnbzRyzXGHZdbcKcm9JfQ+uh9ymnVuKcFkU06hXZhC+r2qDSS6xik86TsJMI8dyDckaqve8PQY36kFAQHCR6Mf+ejSg4ROENTyD/uankZXqVcMYEfYWlsk8NTMTU4bZFbex/fkqdiLqCSruw9KKino63kFdrfFQhP3KdN/fasUmA19GMNrLVSuEmmaUS5YZV7EG3ccToowGzWRZir32GkNKsfmRgRGAP/NA6HRDSntsQMtZ2TWMOU7wUqz0B9U/iB2X0YenEplk4i6mVcCoS4+G57zTU7jrVEi/1a7/4IAX2QZDa+tXhrGKA+NwpeipSbcuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB8477.namprd11.prod.outlook.com (2603:10b6:510:30d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 18:02:19 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Tue, 18 Aug 2026
 18:02:19 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 04/10] lib/xe: Cache workaround information in
 xe_device
In-Reply-To: <20260729215814.GD7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-4-0c147eeefefa@intel.com>
 <20260729215814.GD7790@mdroper-desk1.amr.corp.intel.com>
Date: Tue, 18 Aug 2026 15:02:15 -0300
Message-ID: <87wltnb93s.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc61b76-3f81-40f9-0ea1-08defd52d81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|6133799003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: V+ExeV1EyQnhb3hgeDfN2OHzqNWRi6h+ljoKxH+WAapjsrtdOFBgBhLwenVLNA0EJEAqSkZ3y4KBEL36cPw003AGxZtooo+PENViCdUD1ahYa0OKhYxM+dBvoPKoXksbpEmUuamx2qjHBAXB0Jmsz2MovdMhKGk0iEpwPdA8+xkSJfeszvrl2QBDWPTtx2SvOgoNkkAaGmk4sifEIaySa1TtLrtmwHyzHf/Ch+j1nnN21TUE41USHyRhHkwcOENWOLgxQFIDhEJ4nOXnWPfwUXZYyACdAil2MOr1bxi7iTyy7g+DciKCnI950bJObcyfvuJe1Vdq1meYkAz47W0JAs3WId7rf/gQtbk47SYS5z1rTyOAgyoP3d3Yvf5LYLboAxmtB8FOjFnqA+2k8IHYkeKU6CE8AlgzdlwvSW1d/QO5qDGgY4mIFPsGLlMePQ8Atb58VE72G/F1nIqa6s+YZNozWudxylwlUWW7DVTdK8gdx6P786+ppPbBx0okNaZ2GbzZl+guSiP6AmB5M9o0dgMBbF51Lspv+JSPT6Sdx//DcvvXTZVbW+Acx7fIXrVaHudyy+73Rn/1jHA8Uus5eezOUbgLnWmzRFcpfp1GI++CjC1J7/aaUUS9TA2HfwGeHYCIfsaIO4EVpOn2KanX0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3EVYhsu791EO/TjsM23w6ivRZX130b33EDC+hxaiD0OncJho3xbbnqEHZZ60?=
 =?us-ascii?Q?mlkug/WO+u5ADNw7XHaR9IFuqxbSd5wQECxt3bcr/jW/P9Rp9JIyQwN8eRzw?=
 =?us-ascii?Q?arjZCdEs/7sPHZ4whlMi460U9OJeKjHxA4O7WQJESBFYsMQnsk4BJresZLLf?=
 =?us-ascii?Q?I0jG0gWvXhaovq1sDEpcw1U0e/mLfIOgGpD/irlRdl7oJpBGOn2IPsp/5eo9?=
 =?us-ascii?Q?FcdyZETUr3ApNsobGfp66o/s3fqMQ5+kjaTgmDCcy4FOavaNZY7C69aCL7MW?=
 =?us-ascii?Q?SwKKmCLufPYeOxBouQe3lgGtbazvDFyFzs7qtoiW4aAbQ6Khv5B43hj64k2t?=
 =?us-ascii?Q?n/vCqE4zA6D0raA/YGL1GVm5tSMt5lw2RbsGbgyFVpOyjGk6cTQ98f/rTjgu?=
 =?us-ascii?Q?z2eJ4RK/QA1sywj/NjtBwV5vuEGiYWeOXz9LwQb5MY/SuQ5AOsJb5lhQq8wo?=
 =?us-ascii?Q?HwpGy/sYeVUfApLhj2KmZtoV+UTI1UGJBEn9yUrJgRXK3+IpGHsGwXB+M/5H?=
 =?us-ascii?Q?7xXd5lCjo8QtniZvBSJPo3+p8ANMRAvQ4pxI5BjnxKQxOmVwiCGV8Z4x9P5g?=
 =?us-ascii?Q?j21PUsjGiaAicRlwk0kR1Z1u+KrIkBm8UFm1CQXsmsvHpFpZPTypsr1vDWaf?=
 =?us-ascii?Q?JSvQZFtUJUAD0fn/2MgalAPCmPxJzAwqEc8kEf+Ei3T20CiW921eBVALzECe?=
 =?us-ascii?Q?mmITid6yujmXjWWcrDEtIqm1QfSP8o6iIES8Foak1ecoqsA4ULIyAxjPZSPK?=
 =?us-ascii?Q?eA4ZL5cSo0cvf90S1dysMg8lGrXBXArPFXVCSA20ORuHw85eK1KgJmhc4j5D?=
 =?us-ascii?Q?I/HT+e36s1FH3eXPwF2ayhLzz44BuqfYu7aEN4bCI8OyW3RgtZ+da68yMtMU?=
 =?us-ascii?Q?qYxFnaf6q00GPg+CY0jvdN28AHjSCHtJ9eKsJGzPwnLu2uW2TuPEqhxibBSn?=
 =?us-ascii?Q?TIptU9Jwbh09erFxdFNbyuY5xP88a0jY2FdKLzmyhp3UHJ4TqhRwPuelIO1q?=
 =?us-ascii?Q?6jUtMHWTzHepsoe/BxekU/uVwqqSz4PBg6SNVlfgPlJmZYKRAe5vrcuddcIP?=
 =?us-ascii?Q?b3WR+gOr79P5ILftBSYZocU03pkOFqGBGNtKVT7RGgEg2C1K+AB0eeuUZd7N?=
 =?us-ascii?Q?67yrXOek/JLIVvjUX985gE35Ls7aB7mQRdm/v8feduCTr514E59ODU91nKQg?=
 =?us-ascii?Q?1DWdi8MsAt7JOQg51eby+t1c5niYTIwPFGccZEM4YyuZO9ThLOo3HTH6n/nr?=
 =?us-ascii?Q?RPERIGJNvyxJcirTG4Z31k1elzeEK/WayBlQaoIGihAnQtH/MVbPtFn1oi8K?=
 =?us-ascii?Q?abvJzo2T6ACa/88erO2G2nnhx9MDuvAIdk/NcttiyWG/MlRZU1QeuUD90IiM?=
 =?us-ascii?Q?6QPh7QdLSAJzz0prHv5C7qMtkqrbBMbqAQZpiiSQ0sst8rrlKq8WJSRI2b8H?=
 =?us-ascii?Q?+PWmsTx2WqJ1sKSLaTeKbx6UwXEbMQ9U7RAt1wY5FOGk6L3+hpNaX/CTbIUW?=
 =?us-ascii?Q?9OKll8FrzmIWEmV9keYPUUS+jBdhwuA90G8/GCmX3TwMYF2srJg8HQruhjy1?=
 =?us-ascii?Q?JUEFa0/MWuWnnFT1qnzp4DFY8uhsVGXnllXSmZchhYHN/3I3mJcPzhj7JfPq?=
 =?us-ascii?Q?nky0wLPtCiXedV/zArDQZTGwZO3ZGTN/TaUdoqZ1fpZfy9QgMQLiESoL5d43?=
 =?us-ascii?Q?7xeIxS9J2t8WD38gNUKk6F3bNJ4o0Jdn6liQM7FvEPQz+wEezZuG86H5aH9A?=
 =?us-ascii?Q?MoAdh+/jXQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: LuLpdcu+Y0aU0mWcrToGX5ieqFgYAlp2ETHpVEJ3u9m1TSeICL2Yu/nUWOAiJ1Ka1LnS7ttk5CSDYPF2RXkKtVs/tfFdKLY7RDzhc2GXeLZw6M9WF8UXYqDRNvSKNFxQP7UZLiKUQud6N8XLZF0sEbh4jZjTikJ5rLpdk7dEKHmABdLjU5ZAnEhIoZMllqoqcN4POlk9cZU6Tx2hwbXspwovrjleo3NYfpndHjHvSl0WfZn8BVZlBVruTHq5hyvSWUTSEOjrbZHaXnBl5e5FppdNXLw0qHbcMdO7GtDcwOcmHejTf3ahYw9ZvFS1LJkCVvDhUUVgSDJQcJ8LafwPeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc61b76-3f81-40f9-0ea1-08defd52d81c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 18:02:19.1257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FE8eCHJfynFPBlMlRJh8FGQ6LcY2CBJCCvuX1uoYvA/USYwNrxmsPj4jYXlVGes4VDV1zp1Pl9Bwge4TH23cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8477
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, Jul 21, 2026 at 03:59:57PM -0300, Gustavo Sousa wrote:
>> One existing inconvenience with xe_wa() is that it needs to dump from
>> debugfs every time it is called.  A more concerning issue is that the
>> dump will fail if xe_wa() is called from a context without the
>> required privileges.
>> 
>> We currently have only one user of xe_wa(), but shortly we will have
>> another user that will need to check for a certain workaround in a
>> non-root user context (in test cases that use igt_drop_root()).
>> 
>> Let's resolve those issues by ensuring that xe_device_get() caches the
>> workaround information.  Tests that need to check for workarounds in
>> underprivileged context will need to make sure to call xe_device_get()
>> before dropping privileges.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  lib/xe/xe_query.c |  6 ++++++
>>  lib/xe/xe_query.h |  9 +++++++--
>>  lib/xe/xe_wa.c    | 37 ++++++++++++++++++++++++++++---------
>>  lib/xe/xe_wa.h    |  5 +++++
>>  4 files changed, 46 insertions(+), 11 deletions(-)
>> 
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index 68e60ddc75a2..ea095b207534 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -28,6 +28,7 @@
>>  
>>  #include "xe_query.h"
>>  #include "xe_ioctl.h"
>> +#include "xe_wa.h"
>>  
>>  /**
>>   * xe_query_device_may_fail:
>> @@ -377,6 +378,9 @@ static void xe_device_free(struct xe_device *xe_dev)
>>  	free(xe_dev->vram_size);
>>  	free(xe_dev->eu_stall);
>>  	free(xe_dev->pat_cache);
>> +
>> +	xe_wa_free_cache(xe_dev);
>> +
>>  	free(xe_dev);
>>  }
>>  
>> @@ -441,6 +445,8 @@ struct xe_device *xe_device_get(int fd)
>>  	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>>  	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
>>  
>> +	xe_wa_build_cache(xe_dev);
>> +
>>  	/*
>>  	 * Populate the PAT cache while we still have sufficient privileges
>>  	 * to read debugfs.  Forked children that inherit this xe_device
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> index 59330d80fd1b..f70476945dee 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -80,6 +80,9 @@ struct xe_device {
>>  	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
>>  	struct intel_pat_cache *pat_cache;
>>  
>> +	/** @wa_cache: cached data for xe_wa() and related functions. */
>> +	void *wa_cache;
>> +
>>  	/**
>>  	 * @multi_lrc_mask: bitmask of engine classes supporting multi-LRC.
>>  	 * UINT16_MAX if not available (older kernel).
>> @@ -99,10 +102,12 @@ struct xe_device {
>>  #define xe_for_each_engine_class(__class) \
>>  	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
>>  	     ++__class)
>> -#define xe_for_each_gt(__fd, __gt) \
>> -	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
>> +#define xe_for_each_gt_from_mask(__gt_mask, __gt) \
>
> The gt_mask changes in this commit don't seem necessary/related to the
> rest of the patch?  We still pass xe_dev->gt_mask to
> get_wa_debugfs_dumps() so it doesn't seem like there's any change of
> behavior related to this.

The difference here is that xe_for_each_gt_from_mask() will not attempt
to do a xe_device_get() to get the mask.  Now that we are caching the wa
data as part of xe_device_get(), using xe_for_each_gt() would cause an
infinite recursion.

--
Gustavo Sousa

>
>
> Matt
>
>> +	for (uint64_t igt_unique(__mask) = __gt_mask; \
>>  	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
>>  	     igt_unique(__mask) &= ~(1ull << __gt))
>> +#define xe_for_each_gt(__fd, __gt) \
>> +	xe_for_each_gt_from_mask(xe_device_get(__fd)->gt_mask, __gt)
>>  #define xe_for_each_tile(__fd, __tile) \
>>  	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
>>  	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>> index e4e1b0bb7972..0f4d2edc0795 100644
>> --- a/lib/xe/xe_wa.c
>> +++ b/lib/xe/xe_wa.c
>> @@ -22,14 +22,14 @@ static void free_wa_debugfs_dumps(char **dumps)
>>  	free(dumps);
>>  }
>>  
>> -static char **get_wa_debugfs_dumps(int fd)
>> +static char **get_wa_debugfs_dumps(int fd, uint64_t gt_mask)
>>  {
>>  	char **dumps;
>>  	int gt;
>>  	int debugfs_fd;
>>  	int count = 1; /* Device workarounds */
>>  
>> -	xe_for_each_gt(fd, gt)
>> +	xe_for_each_gt_from_mask(gt_mask, gt)
>>  		count++;
>>  
>>  	dumps = calloc(count + 1, sizeof(*dumps));
>> @@ -45,7 +45,7 @@ static char **get_wa_debugfs_dumps(int fd)
>>  	if (!(dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
>>  		goto err;
>>  
>> -	xe_for_each_gt(fd, gt) {
>> +	xe_for_each_gt_from_mask(gt_mask, gt) {
>>  		char name[32];
>>  
>>  		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
>> @@ -112,17 +112,36 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
>>   */
>>  int xe_wa(int fd, const char *wa)
>>  {
>> -	char **dumps = get_wa_debugfs_dumps(fd);
>> -	int ret = 0;
>> +	char **dumps = xe_device_get(fd)->wa_cache;
>>  
>>  	if (igt_warn_on(!dumps))
>>  		return -1;
>>  
>>  	for (char **dump = dumps; *dump; dump++)
>> -		if ((ret = debugfs_dump_has_wa(*dump, wa)))
>> -			break;
>> +		if (debugfs_dump_has_wa(*dump, wa))
>> +			return 1;
>>  
>> -	free_wa_debugfs_dumps(dumps);
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_wa_build_cache: Build cached data for xe_wa().
>> + * @xe_dev: Xe device where the cache will be stashed.
>> + */
>> +void xe_wa_build_cache(struct xe_device *xe_dev)
>> +{
>> +	xe_dev->wa_cache = get_wa_debugfs_dumps(xe_dev->fd, xe_dev->gt_mask);
>> +}
>> +
>> +/**
>> + * xe_wa_free_cache: Free cached data that was built with xe_wa_build_cache().
>> + * @xe_dev: Xe device where the cached data is stashed.
>> + */
>> +void xe_wa_free_cache(struct xe_device *xe_dev)
>> +{
>> +	if (!xe_dev->wa_cache)
>> +		return;
>>  
>> -	return ret;
>> +	free_wa_debugfs_dumps(xe_dev->wa_cache);
>> +	xe_dev->wa_cache = NULL;
>>  }
>> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
>> index 4ff897196545..f0a826553df8 100644
>> --- a/lib/xe/xe_wa.h
>> +++ b/lib/xe/xe_wa.h
>> @@ -6,6 +6,11 @@
>>  #ifndef XE_WA_H
>>  #define XE_WA_H
>>  
>> +struct xe_device;
>> +
>>  int xe_wa(int fd, const char *wa);
>>  
>> +void xe_wa_build_cache(struct xe_device *xe_dev);
>> +void xe_wa_free_cache(struct xe_device *xe_dev);
>> +
>>  #endif /* XE_WA_H */
>> 
>> -- 
>> 2.55.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

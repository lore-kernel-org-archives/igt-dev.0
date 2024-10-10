Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AADCF11F5
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 13:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D0310E8F6;
	Thu, 10 Oct 2024 13:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3kCE293";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D36910E8F6
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728566549; x=1760102549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BRcBL44aR0hUN8rHCEEOVeVI1h88WMaUbzFxl9tN/mc=;
 b=M3kCE293KF4oVwfkasQEn8RgbGpNS9gMfWygiCaJ7GQPnDlrHJt+Zr4P
 ijsG/hX2zHlsh0M/FgagHrVrfZl5PJ+wGq9DnbNV0NSbroGdX4+yrnxHL
 NEXMJTe8tJb1Ty9q6RriyabHVufSDigoFG44gveOlcj/3THVA0uM4ZKfm
 5GQwyGdOqwNHl7RL6iO7u/RtgJMhNTGT0LlWo2rR/kiOV4NxAbOMSubso
 v0bkeGYpMQx2hBk525lmbfDQtoPfijD8itCVlixDpgeUaWO4re6biVTY7
 yIauwNUnJRIMG/+yN1jFOg6tSu8bJU3vSfO2xPcwOd7kMv+E5PSALqXtu A==;
X-CSE-ConnectionGUID: YcfqgwagSVuHZvOEmC92/g==
X-CSE-MsgGUID: uMim5hSXS/ea/CH5hp/fuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45436419"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="45436419"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 06:22:28 -0700
X-CSE-ConnectionGUID: gO7Z6lOsQpm1MMmS++QMXQ==
X-CSE-MsgGUID: JeNewjLQRpS4kUQ3Q5g7eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="81406476"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 06:22:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 06:22:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 06:22:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 06:22:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 06:22:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJPHddlBUvHNST4RWIefwR/Uxs0IoEfXum8m2iHEjrmdKcOrznYTl+c3huywXa/7XTVsrIPDPtQ28e57iz7mt4zCOyjo+9WMutqO8KaEOxg+TbUNd4mnWXT6bzbNBvDTsRS3/NSSJlbz75QbhQd38RWbVPY4/vqfAllAo0dgBjJ9Xx6lVwse8OttCB9IhhSDbiaomYfF1MfP+pFyeXnMngiVfzp5ZQRRjASyaw5BknUUf/bzoQOKcWCULYlyWXpC6pC0/U5+e0G5LIPB87btdVlLLkypWdTo+I7JWYZLQET2aJt0dFxopZ6Mccy4/pc2eN0jpW3GqDlPtCWOq5ENoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEKwFOiksVaSFBXAEbyG7VBU/vbYQfCTbUGXdKvVLmU=;
 b=WnyN/H/yfESNfB2Gz4QerTIlVYc404UFYqIWXQM979GkbDdfVEHjeWm5i5f8S5tB5IQIyxLo05bKfrqfi8beQufqxz/5SRAImy97eik3fTg4ezBOf81OcSmIEIRpqYGQrHj+ceCz5m7M+jHG6kGYFJ0IQQqeom410fdG1vmHgiKAOi+oCeis6d87iDVq/o+yjhGEVKRmFDouwNxez5SqTAZPGcc3SIiqlj+qh1nJpdz/oUaSAL/H2Y3ZgFbHO647ZGAFk9+84qUeIxvz96LEUnydauK5jbxssseDn26Zo2qXnsynyj9r+KOVGm4ID/LFbC0zYX21kxk2MHoXUT5Sww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 13:22:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 13:22:25 +0000
Date: Thu, 10 Oct 2024 08:22:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_module_load: Handling of
 snd_hda_intel
Message-ID: <pysj3s54bvt7qxojfo2wfsyy5grqbl6m7n74fpbvqpout5v44g@blecmduiokst>
References: <ffa2bbcb-edb3-4610-aec8-bcd6a3b8f106@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ffa2bbcb-edb3-4610-aec8-bcd6a3b8f106@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:303:b4::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a6f81a-0ddd-4e27-9ade-08dce92e94e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RkY/yyTeH1bbfaUWkomOmHmcI1qbLazEt19te2zytqD1cEfYBq9Yp8ihZ7e8?=
 =?us-ascii?Q?haQCPVbGx+qdKU8WsOh8T884CUEh7Q0lH0uPfiGoJf9Yjq2FDBeJjN7FToC2?=
 =?us-ascii?Q?t4m8RSG1B/eh2rZcFf9OKcWF7Sq5WGigZyibLxjq+WSA+TgVQQHKolAt/xm6?=
 =?us-ascii?Q?Fl8wOwXObmyvDRPUROu9u3SqdLaNuzHpAuIttPFb7umax+xR+Q/1aSZdBELd?=
 =?us-ascii?Q?wKTlFNkRy0/cgbdPWy7HHVywndkMLR1UwE4+Kt3APp6kWZr6lIIkGESpGyx5?=
 =?us-ascii?Q?PDvPYrJ+psoI+RPTxlWtc8Hizr9z0VGyXtqBhtQit4m+B2wGiMS7g4u1mXtV?=
 =?us-ascii?Q?vbG8fmTXkSpqpFh2PlEB2MGVrj2K3afypWKjktf1proBbAILYmjlJJGq0pPZ?=
 =?us-ascii?Q?2uLkSlRB7H0o7Maute7ArwHiRGUR0FrRjDCtfJmulClY0AwIIMPeS9o9A6kg?=
 =?us-ascii?Q?h21Wi3PoWS3zLgpjdUZsclEt4Dy4JX1QDnm7JTjwkq8NyoiQdrMMJpX/OD6S?=
 =?us-ascii?Q?Z0MB5k1k99sH3LSWqxSb28oGgzi8WQkpXffd3hgNfozkSW5dxF4RyaZwa008?=
 =?us-ascii?Q?9CvSGGewyaPc9VUsvv1AsAnf+xd7XrBYQVBqZv+4mIosThy6I1Cc7hMSHEyC?=
 =?us-ascii?Q?2+n0ZtqPmfUYo0CWudIWMfgkbMwbTzD8bOEkQKTIKyTGJ5l7AudYMAqUCV7w?=
 =?us-ascii?Q?zpCUFoNZxY+8B/7WNU+q6RwrHXu5qIvXxu65Ye13taB1AfdB1sBNZ3BqIke5?=
 =?us-ascii?Q?seVces6q13OcWOkNZgQBW2mphnLrbPG381OQNlwozENkLSq6XzWOflWCbXPB?=
 =?us-ascii?Q?t5AVSX3hrNJLswiRj+Hhv5sUOo2ATiAOLHJcyTBkpRNLF3D9xsh45acjXhKD?=
 =?us-ascii?Q?71GSBIMiBUmEjy33UL3+FtF4vKD8ldAMhGHCzKJsEPJOpdt0fRLxAX3/jYa/?=
 =?us-ascii?Q?ihYAZAmAa/hWG0qLhj/FyYENq21UMmko0oBF+flDsjG1GZNN1bs/a/E8pvja?=
 =?us-ascii?Q?cXazuNPmsGbo6srybric8hsf3zbmHs9GBUsox+v4SgXqUMUIMy6RW4bF+rgO?=
 =?us-ascii?Q?SH4iWjGlwZZPCiX2r95U17/me+Ecu7UbBSYgt9jBj/87UFDbZJBsyH3p6uHk?=
 =?us-ascii?Q?PzK0eIwHbW95NcUGfJHg7DA2P9ntOK10yYKAG85oeyv6Abzm6uJ6fQ7LtUmP?=
 =?us-ascii?Q?fmkcnNt9idI1oZZfQyv08Zk+N3iWmfTKRl0U1Bh+V6BnHas3UjS+r6kp/MgV?=
 =?us-ascii?Q?KyEM/IWueMgGYss6GK1OkNXRAFtZuNEYSrX1wVOHSQEuGiruR13mi3QO0/nv?=
 =?us-ascii?Q?ukQIoXeNG0c9Awavo0rz5cW+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ysf9u3AaIUp029I9z/uAU9Z7vPjXtJVXBcd+Rc5FxqDHdTarp/V2HNbAKc7U?=
 =?us-ascii?Q?k3wXRcZj+AKlVLIqBeZTDUBBd5LU2eLwhVcfwoxC2ZZGDCOXbH8A3KtRSGmx?=
 =?us-ascii?Q?ksgCo9hNyiejW2nNEvKnB277jeDFSt5nfzTdzkGsm57lXgrtJ6Rz4fMHZ9St?=
 =?us-ascii?Q?7IiWw1r3P4my0dNh1mw/ARafPzW26L+tB1yYoimDrtnNnffc+nqZ8EOmnfdM?=
 =?us-ascii?Q?FJP/MCTDF4DucZkYFsM/CMWnUHV0zfWo4yejW729Jksg2UaOck7dNJhzGvuE?=
 =?us-ascii?Q?TDkuQ3dU4jCMTJIJToXn+y1I9C8fhSARZ7R3+X8uLXiQ0xgnprvrvqHgPnsK?=
 =?us-ascii?Q?QB8jnJYVVMGZBhF8SIsJ9DETDpxt3pNRvyBu6DNqDf/YvzpqNq86DS0/bhB2?=
 =?us-ascii?Q?JAKmxBR7pRku28RUGziUIw4QCH1+LUMgrJ0czAL81Wm7BhMH/l14bScI8NfD?=
 =?us-ascii?Q?V6oYfXCyfaTcMI4oY9lGqgKqu2IIty6Z4GkRdEIXYHVK7ACMrsqdxHUk1C0q?=
 =?us-ascii?Q?pD9L7MTnFKSrf/s5dzPTpORzjqk9Ah1wzXESEFU7hCopPNa54VPQLfEKNIR9?=
 =?us-ascii?Q?sw8Ig18lGtJZJo44Q684qabpKinluwDPcoIyLenMFWS6Z/edmaJIucwC9io6?=
 =?us-ascii?Q?lcTrtpG1m89LekbKwi+pGx0bz+BKG5SpuG7udA6ddCQa2NbBWPvE6Ly9GFoU?=
 =?us-ascii?Q?Qcc9Kw6OLkpLAEGVEP0SLnUw69RiY5P+hp63ZNjvnXDVHi7q2Q7TlAjUZl5q?=
 =?us-ascii?Q?4Beun+qJDygcFbQiDlkMdTv+alaxIQle9+5YNuPM+WHnnPi2YPu5cBGfunWw?=
 =?us-ascii?Q?Iyp76I5cZbSYLPU7ri+c2hSrWI7l1EzN0zNAcoKZUIJSKVOuUUEubzGyyQSi?=
 =?us-ascii?Q?oX4qHIuVeLwgIEBYlnS7+Smai0zcAvarSvJZ1esU4j0Dd9zN8NNa/C514udG?=
 =?us-ascii?Q?qcDbHZb8p0s7UX0IakPFHaTwLyEdYyFFBeGQM+Nxg2JnSCmdzWx3hZAGUV76?=
 =?us-ascii?Q?0EIUW5/FY1t7qhL1ZCH2lDCEpnGpd6TY2A23y3i7ytKQzJoje1tTaUVutbDB?=
 =?us-ascii?Q?oehiVlNymGUhDdkhJL3haL8UOD7q/W3iMsFQyIe+cRg3kFzg7hPH+8h8nZiY?=
 =?us-ascii?Q?YymdWCc/3hq5E9HpWAXwQWNHpw20XAVmU9Z298CJKWnQu03HGWjOdcvxZxx6?=
 =?us-ascii?Q?GoK04iILtMzRBa0dRM34KJZBH/U0shhEu+myM6aExZaZ9OZvT9qt79cgMWG0?=
 =?us-ascii?Q?Z8zPFfK/uca98BEyee2YrHMMQd1VmRnYJRvqbU6+Nm1WTVy86AqC33qqIX9o?=
 =?us-ascii?Q?lrGjrRm5js9EjgpsVSAAw7dfs33S6Z6hzEtxAl+QuTADZyvmcpHtf2n6NXaN?=
 =?us-ascii?Q?lTwikSoyKTtBfaU/t2BzY+USW5gQdwEDG0IHZZyEZB1vsRH+SQnMHoqD1wUT?=
 =?us-ascii?Q?oDNQ3NlF71IEMpbGoHbZsT+EcDn8FEZXqVGcmI6Q6LcQSLk9pttZ+evHCQIa?=
 =?us-ascii?Q?iJ8vcsegDb6fJCkwaFccS4IM+A4CM1JujTiriEKFKJsaC8RS1SmsyVZrA569?=
 =?us-ascii?Q?pNqEIE2mlMS9d4kYI2WCnH99WfYeT5oHflfKewe3KGVBABn9kuF9rmqn0bRy?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a6f81a-0ddd-4e27-9ade-08dce92e94e9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 13:22:25.7296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euKNwbp/stcXDDCMi7YtOta5ko5JcZm5zd4RFE+nFkany9NZBlecaU6gxhrgYBhh5HJGfI9t2aia1oy0a6NFv0u0nh58J5tyGPgarEYhthk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
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

On Thu, Oct 10, 2024 at 11:42:02AM +0200, Peter Senna Tschudin wrote:
>The problem: Running the following test-list twice fails on the second run:
>igt@xe_module_load@load
>igt@xe_module_load@unload
>
>The load test will modprobe snd_hda_intel, while the unload will not rmmod
>snd_hda_intel. Then running the load test the second time will fail as
>snd_hda_intel is loaded and marked as an "unwanted_drivers".
>
>It used to be the case that snd_hda_intel could prevent module load and unload
>and we needed to take care of it in older kernels. This is no longer the case
>so remove snd_had_intel from unwanted_drivers for this test.
>
>cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> tests/intel/xe_module_load.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
>index 30259fc26..83e37430f 100644
>--- a/tests/intel/xe_module_load.c
>+++ b/tests/intel/xe_module_load.c
>@@ -94,7 +94,6 @@ static void load_and_check_xe(const char *opts)
> static const char * const unwanted_drivers[] = {
> 	"xe",
> 	"i915",
>-	"snd_hda_intel",
> 	NULL
> };
>
>-- 
>2.34.1
>

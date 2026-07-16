Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53034C44512
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 21:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0FD10F3EC;
	Thu, 16 Jul 2026 21:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWSPQkrG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEC410E266
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 21:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784236906; x=1815772906;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4+If+wKBQedPkyEajSJvwnvsQOgA8B3nVcecFBeI+j4=;
 b=iWSPQkrGXqwjBCslrEwLBIcIt4RLH4evnx0YlkWW5GMsnmMBOyHnDccn
 kUARlanBKOVtwVCRmWKIF2CSbAAB0pOOyOzK1FjEDZUTV+Iv0xJNANGPR
 Bm/mJNnmXOFCL2y/jn9k80g3WHECcnS/Kt/SEPnwhHlNDOD3pjwtWB4cW
 BMCFKHAL0FOuDwINcP/o0Zq/aWjUoyNYXKTe0b1FnvZygjNbr9MwWSf76
 YtsMEt+PenvTVesFmRrnzyKiBkmcUA0O1gQlz3pHsN/wNwrJ8jyc8mhc2
 oygT2U1bcpEd1NY9Pgvw/48zyIHBmVt+iJ/uqxflYBJEJLQXSOzh4GEDh g==;
X-CSE-ConnectionGUID: IjPzrN9aSz+ac+XralS8Rg==
X-CSE-MsgGUID: rSP6opDvSIe+uxDSjjl9PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102333958"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="102333958"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 14:21:45 -0700
X-CSE-ConnectionGUID: 3odGkra+RiSJl8q2QKE5lg==
X-CSE-MsgGUID: +rlp+WFdS3Cu+s4oI5dI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="260432459"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 14:21:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 14:21:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 14:21:45 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 14:21:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0bfSZyDBpmQ/2N2pGMzWOudFsgSWyYZouXpgt1fXzrMiTCgFuxzuC0sHjrv4mz5jqWvdFJAvHYBLAECUFINgyAB7z7uNJFI7aHEmlcpPowDl4fYSeZzR9XDAnNUdT4BJOv6Z4baH5JUlfK46QkUfkIfzkr95xP7Hd4gN13ryXlkwYrUEVwSNdixOpVRY17fWBPjEfc5tW6ZHUeTb5G6FXyy6bUW5ClgnkT000sfejc4oh0ygauU3sSwRj9xk2fYm/T78d2+YuamquoXm2NYn0MXRrFeRVdAlfgi1U6LOxHPoDyI7Oda4z81Jn/XJTJnuIvh2tNiZunJlFetYxR3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFZuOFGYxSNvU/qNMwCvxPeKmMCjYaqOp7kbeQE2rI0=;
 b=g3GnduNcrmtlElkj1afE0zCWcJ/qsfa4Iv89WQv3I7hbUT6AVNdCRhE+iv3n4RhaAFcCiDN70h5cc97Rdqmn6wG+S85O1C6sQbYkVyjwzGSxwC0yROXcXia4+hiHbsZ4l26kTjlVxYp7Z3AYbjCBstjOQ2cQh5OihDHXW/V70Stdlyl/Swl5FpgjDYif8LOzvK/Cu+IsUJ6SN8sPqLauCyO/TbdXCTh7LlGe4BhL0saT+FhZhBIew7xQnwOIYVdzhxXAHF00ni7JcskrSNCydDtUZAo+e7cXSmo1Wa0yE97b151K/Ni6OyWTwZovPHOJ3E1s93kVTDzpuyZtMBg4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ0PR11MB6720.namprd11.prod.outlook.com (2603:10b6:a03:479::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:21:42 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 21:21:41 +0000
Date: Thu, 16 Jul 2026 14:21:38 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t, v3] tests/intel/xe_exec_multi_queue: Check PXP is
 rejected on multi-queue
Message-ID: <allLYoe5L1aoKjhG@nvishwa1-desk>
References: <82d8609cce6a2e22be972e9e917011b90c5e6f43.1784234143.git.jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <82d8609cce6a2e22be972e9e917011b90c5e6f43.1784234143.git.jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ0PR11MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c617e16-ac60-41c6-7ab9-08dee3803af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fqVKCS+VsTisx4dhNyUcbPCxRgChURn19H6JyucgCt0nBbTo8RlwNLIeW5JN7f6KoxOPXiAHvwzIuMBKfr9KquOpS7nTbidHSnFYeUopIuymxKronDpGiMzhqntckx0YMyR8622shtsgjJ+4z/Mw2rdh94eq45v5YtLNOkE3ml+sMsZEbkOMg7rYqo/1fvpvlkZZrZ8R6gB2/eIxjdKMW2dVXx8Pa7YIaoRCJ+6uCclkE1m6kstKT5Ritl9ByEq0w2otYEv32cXj791EelZy3gjEP/OxNJoZO77Vzn5G0jQ/j3Iv+RgwqWr7tpZzZXOSckuH4hIs7nuq/S/yNU77LoIb/6hjkimdTI39sWloJX40YrNqkloCjix2waotWisw+ndy5bMdN1WNcY5DU2y1dBeu0tEoWq1UlXGjcAk4CRsKxT+X23rVQS8XDebDzZJMCKeuY5ebOIKNZsAsopzzOm1exTmFNYk0nOf1Lder8StdxBM1ieKq5JXcoz6wASMiUoJBWlCyLwYoXHc30phxOttO11C9OC98MBEftUIzgmhqzO3FMMKHMprAgV/g2Bll5fxxLrfHYG6q/kwnggoO4KDyasYqw8Ijwlaz1sT+2xD76Hlw86eR4Q/QkuSHL9FHbhxrabOJ3RspmJBmsGm/SB2nFg7SpatUHa/XxB2cJng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5HGBtsZOL9BpJvZ11yYx+zHgQeHaKnJ9sa2/4qhGkes0MWWmtz4ogXW0wWK?=
 =?us-ascii?Q?eGTSlUQVHiD5AsD6nW9XONz2G4XwvDnEsoq/KhWVMH4w1TGc9n+IymAvBsbn?=
 =?us-ascii?Q?JyA2J/+XW1F87EMmhsmO+mjkmlQfeOqR7aewC0VjhvNeuRihaUGo+tSKLAcv?=
 =?us-ascii?Q?JmE5Td0ncbEtiTPhBzNrWPU6MMKxvDXxQi0AcQAsOW9KIU6fwpEVRIJUn+SV?=
 =?us-ascii?Q?mP2ZcX9c9jGcjOaL3QRRCax6RSWRTgAhQrl2KpmqUFCVIzIVmhMIwu+OB3Aw?=
 =?us-ascii?Q?PghKbTnY/URfsUD3b3rgSRIXGodXfrntl9zvLxvk7RZJLoNjwFgNlo7CzXke?=
 =?us-ascii?Q?DGxspeZ2f6Cv2GYSpxhLrEqcCQzuv8AwJsMwIETZnzXpWU1LUnDuV0ZBlYTs?=
 =?us-ascii?Q?qXVny+1zN0oADuTsYGlxFtAxUrXGCf9IyiV7ZDnydKo7HZGk9fwWo3Qwf5Rr?=
 =?us-ascii?Q?78FiwFmovSyP8WfQJU2BQ3e8hwXrm//bxs2W7XSgcMRykFHSSKXcx3JH6L7k?=
 =?us-ascii?Q?lQmhhgxl1HekRJD1JtZXwsN6J2z8pM1Ql8/IML8oJaQs2pvAGzxXhtTSA6mX?=
 =?us-ascii?Q?4rBhnGfXpc0FUlQch5U7KCPeo6o18SQlQaG+fsuwJjX/vrfv4QJMqX2zzmjk?=
 =?us-ascii?Q?5Y5oCW11pI4kxnwgRysaE48Cen2JtIZABgZRtwRvhOWVDfD/GsY74C54byuB?=
 =?us-ascii?Q?uXjZ5PiQai4l/rZ39WuhHK/16SyY95vAK8S9lDaTy430AvjRSO1AyFSGBrXb?=
 =?us-ascii?Q?NdCTQUtKywaqYxKqbof449IWn1J9MXsKHBh4Oroe+IvPB2fz8lD4wAZB1EoD?=
 =?us-ascii?Q?T4Bt2euBdRxyoQ+Si1GJAceu109sw/5zWMOtXVoDsU0SxOpWKStdIGcLhZrr?=
 =?us-ascii?Q?Dw4d5tORhpYRYj9kPzLhn5icNTOJLKBygWpp4m1wjjQeqSmMQMwr8TC0O46e?=
 =?us-ascii?Q?lKBRBPdVXX9Lon2xSqorL/EO1SvMdkwhW3M5v+A+3Ci5kERfFWPDKF3RNukf?=
 =?us-ascii?Q?bO+9k60YbIpXiSCvxlo7pP5nD+4Vh29PWXJ/CKRvnyA1Oxv5UVduu2wrKi2e?=
 =?us-ascii?Q?S+K1+Bj+U3yo14z8Lkgm0RQ5NIjtGo4zvvnriePRHHsXEVmryAkcuB3phhVF?=
 =?us-ascii?Q?d+IrvRxXQjYRiMfg/glJmRv4kwZ9ckFOZlCX+8RqxkBirUJBnSiKPYHiJiwu?=
 =?us-ascii?Q?SWrpXGHtJlBmZZjbZCnxiMFngJRNsEpXlQlPzjdZO6t5zcCnsP1j/FCKLirP?=
 =?us-ascii?Q?jLuyoZJDocz0wLa4didQKvDZpFN8mEhCLIoPNDE9IPevFKb1Dr0mznoTELC6?=
 =?us-ascii?Q?VyyW8uATteybhCGRE8wD3kS2oKL562a/MA30Xa/GRJYmrM8ZFgE8vlFxRMLK?=
 =?us-ascii?Q?hVcKDnSeLvCbzKWUsbEi8HkyubQkojQk6GHk6uYxbStUp4laE04m9wqMDTmF?=
 =?us-ascii?Q?wEqV0wcHj4SbNlDoDqYoYfpVnsfb7qYIMtU6941Ry59HOIJP9wI7cWUAGW88?=
 =?us-ascii?Q?bg5n0laipt5KKkWQkrTOKSeHwCcJgrJl3dZbGjz6AyMSswpLGyd+EEcA64Vn?=
 =?us-ascii?Q?/6yaJA/53XKAUWGAH+46cohY11HxEVVTEGZZeACdgfZB7xcKi/uMj9ctgK/a?=
 =?us-ascii?Q?Q82WMk5MpUM1qjzL/zfAoAypDgcTGNHFUm0wS+832mODJdvQ1FrrCjebCevx?=
 =?us-ascii?Q?6xJRGC4jWHramZXTs3BmzafCuTiWGeQVO3eEYxsYmH0AZfujJhr0fD9wS+fM?=
 =?us-ascii?Q?jxV+86XxKmc8Kz/V2GxxPfAnNf1P0PJriEU1kPeqZsho5qp4+B1V?=
X-Exchange-RoutingPolicyChecked: X8WTtZhftGJXP8fhp7eYIX87b/qH2zgriA+3NHWwpJPZuHOtDXmCIC5aOSLNkqqlBh3sJSqnA6o3e4OdCbyDkBbPdothtThRh4mVXvZ6b26LnoEc6wVg2AwVD4TX3RhhYe21X+kOvdQGoNGjdj1Sin1aqN25ssPvidpMou2qk7gIyZ5ANgGRMMKt20Le5owgkr8LOGvS2D40Lx+uttF0cpYbkqarmCx2vWfMc10fNlbeuvxKUg0GZ9y9DVNTzugEmC9eprkYwJ6jBGrIEEMoPXfx8e8cdcYYPfKqi87QnHNw7IZwsnZX4sDNf0wqHiAo6wvZIEPNwX9ZLQ5/Jh5P8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c617e16-ac60-41c6-7ab9-08dee3803af8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:21:41.9149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KMmHLrnEBuVvfvhqv+LGEZ4796imbNc7APYoVmXInotBu0lJvge0SX5UPzCjIOc1Ju6ehxmusRNZVouNVUY1YMJFglwksBxPMlRyEy+BOM81xm4eY8IsSq6bYzTYgOX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6720
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

On Fri, Jul 17, 2026 at 04:41:03AM +0800, Jagmeet Randhawa wrote:
>HWDRM is the only supported PXP type and is display related, so it
>cannot be combined with a multi-queue exec queue group. Extend the
>sanity subtest to create a multi-queue exec queue with the PXP HWDRM
>property chained and verify the kernel rejects the combination.
>
>The multi-queue property is chained before the PXP property, so the
>kernel rejects the combination with -EINVAL while processing the PXP
>extension, regardless of whether PXP is supported on the platform.
>
>v3:
> - Assert -EINVAL unconditionally instead of branching on
>   xe_wait_for_pxp_init(); this ordering always returns -EINVAL
>   with the KMD check in exec_queue_user_ext_check() (Niranjana).
>v2:
> - Drop igt_debug() calls; use direct igt_assert_eq().
> - Remove redundant multi_queue.value set and next_extension reset
>   (Niranjana).
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_exec_multi_queue.c | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
>index 9b41f87c7..b9f72968b 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -65,6 +65,11 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
> 		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> 		.value = XE_EXEC_QUEUE_PRIORITY_NORMAL,
> 	};
>+	struct drm_xe_ext_set_property pxp_hwdrm = {
>+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE,
>+		.value = DRM_XE_PXP_TYPE_HWDRM,
>+	};
> 	struct drm_xe_engine_class_instance vm_bind_eci = {
> 		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> 	};
>@@ -119,6 +124,17 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
> 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
> 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
>
>+	/*
>+	 * HWDRM is the only supported PXP type and is display related, so it
>+	 * cannot be combined with a multi-queue exec queue group. The
>+	 * multi-queue property is chained before the PXP property here, so the
>+	 * kernel rejects the combination with -EINVAL while processing the PXP
>+	 * extension, before the PXP type is evaluated. The rejection therefore
>+	 * happens regardless of whether PXP is supported on the platform.
>+	 */
>+	multi_queue.base.next_extension = to_user_pointer(&pxp_hwdrm);
>+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
>+
> 	/* Setting other queue properties are valid for Q0 */
> 	multi_queue.base.next_extension = to_user_pointer(&priority);
> 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>-- 
>2.53.0
>

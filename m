Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A6BD7308A
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 03:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A71910E084;
	Fri,  3 Apr 2026 03:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEM5jdoX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DCD10E084
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 03:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775186539; x=1806722539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bIcJNJSE5Fak4KgEHUOc18Gcu76nMMIW39GxEJ3VvE0=;
 b=VEM5jdoXuIzAoD4G6bisLRKXft/EKi0bYcfabH8IdvGDY0XVVcOrElWl
 IyObkQudKht80Rk6/7Bh/82vLYbvOMI/BYPAhXI8YNWuKmpYBLJEipqkH
 zFwj+EIg5YXc3Hw9KdekQzJ5xrScXJEb8DMtDJZHA5Kjm8NPaB8qVVLIT
 F5drTsmIe8Lx9uEkGqr599xhH0gKy2N0J4M4vYtMJBmc3w1Ere30WFobP
 cwwd6+VSGNKhK8Pl0bymAh1sUI+h9eu54lDrQn6AOB6rb7ts9ygiHxtPY
 QhN7fvHxz7vGkJ/5lsnPCwdOLKRpEWhSYVCN1vX3IiYKpkMXvbeW6OVH3 A==;
X-CSE-ConnectionGUID: /SfXitpSS7+QrDWlZE3nwg==
X-CSE-MsgGUID: L8K63digQI+HOT3AtdLr0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76222247"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76222247"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 20:22:19 -0700
X-CSE-ConnectionGUID: 3pLU67rRQjGImbbCiOiTEQ==
X-CSE-MsgGUID: 9kn4lOokSVGcArGbUOyR0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="257620197"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 20:22:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 20:22:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 20:22:17 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 20:22:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsMjUfkZFsIASteJ8u8ksOHlKU2T8NTiHit74yiEC3IaQ0RDuHLG4p86BRdovqOJ6WHqOW9RiyuTD2Qjy7g3x4uqCDIdek/g+MjB9ELyCDDYWn6wXLtM1ykZmbs07fDI0y1hIT3kL94E/qsyMrfxA1aVF/jw6L50lKoHNTOl7vro4rzaUFmxX+4y7aE/PteG4ZYOf6/6xYRoy31aL8gj4gB1FRI3+oeRxEIKDFp/chmCWnv5yXfSy8vMx6LbBUJ3WlQl58t2FoN2TG7I1D1XKVERYB4HUR0Bwdy6ldrCFa7BwlQDtWfvCMw0t0nIbWt7+3hLfDIBdl41TKhhcGiVDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9mVIfZdDbJVhMgZDANAGkSGc4BYCLUQb08hRl/nKJM=;
 b=HWpCl9RlRtXHhxrpItk0O8W0nbJLaTecI/mubebzepyLGYGrkb4PJQTsD8ws40nEdUU8u6Fh2BfFnp8tdct40A2B2MfANX18OSLKm6OucsX+vYn7DUi1vxeWEH5c7P9hRP2/WZ3bxnZJl09NOEtkp4UynWrds7FpHXXTrx3tgmIt0BcsM62hTd7uaO16omJnO5oDthQo1domYodO2gwv8y8HJrp6odQ0SylxvIMX0TmR7siZ1iMZNg8Nj06fUynROwFb7K8v/ajhhSCpTpk+oTQ959ZO9MDiyPlDYae8ym45yPX+Lk2kx4sTt50e1FbGjt5JWinlfKwROr8HD2ku3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA3PR11MB9207.namprd11.prod.outlook.com (2603:10b6:208:578::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 03:22:14 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 03:22:14 +0000
Date: Thu, 2 Apr 2026 20:22:11 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] tests/intel/xe_exec_multi_queue: fix expected error
 for parallel queue creation
Message-ID: <ac8yY4EbPkjA1XnG@nvishwa1-desk>
References: <20260403014040.310758-1-x.wang@intel.com>
 <20260403014040.310758-5-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260403014040.310758-5-x.wang@intel.com>
X-ClientProxiedBy: BYAPR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:74::27) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA3PR11MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f206426-2ee1-48e1-f031-08de91303362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: BwME1cqBbP4OQKizqCZ7JM7xViTNBaNMczrogxvX5HogNPwZZZkw5YKxUoeiyU/JZs6nNdqkhGWSgbxp8IvIGZnK2P4RyPpMKtiWrxb0fhcfYb/NBYVxB4Dsym1iQ3EbyfE8r2KrdzvcvjAzg3F0kKqUuZsX6PzCLCSK5KGUC3f97TQ4me2yrUzE9hE+TJpwDFAKyDDQaD9CI3xhi3Dd+c93lqEUtzT7WnScSYZkBHrz6TGui2f0BnZ+ccl/JcXIVau9IcegHiLc34MObwGsfAmaYpa6ppKHMH/MN9Q7oXGkISRBnWck3Ss46w4Tt+g/9gBm5MCe11B3XNpxCMPHTksEwxCPvm2rSK+BTtDYfjkg1Q1W6dOASgzZQn9oM7b1do+5rd5M+zyy283Y9+yUZGbyrt/uliheEuDbVje9gTJIUYGLhopohQBwdzEHOtnDlWR/4o0H+u6a2UmYKI5pReF8b0PQurhkXjmsgYsNgqTCCBByJcNtJXCDRqT8BhJ1/FW+qfbNiL7vNQQjDC89CuMzcv8olRrFWb0ENFTsAbPIYXb5XjCdE3kwq+74Ih9MKmgXBQ/hV/xgk+O6ptam20+/tR4ksDtzK5Yw/FNXAvYyFFuKAskEa0EzHIpC7MqPMwiVJVomYlEdMLPTbCOdrHGbY0d025m9s3oAoHpISZivhiJ0go0Jtyicc/EiMV/V3Vbd6nq7vcDTG7drSLOR+cpABNo89oWjYVHUjNiGgxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qlsZ2IlV1jAgAcPeJGvTslpVGTT+nrRqCTEdONgYj6PtEVHpvan/usfX3bBV?=
 =?us-ascii?Q?/LNU/EpXkbDAAO40cEGNI9X/NZJu4J+TpYDDMsyjPXbQ93IMEKePFWOtc1YB?=
 =?us-ascii?Q?Vw0fbEEUan7V/HcXKBH5cLha4kysHopVeLqMlKBT2IqHlulByxFaEl8ipmuk?=
 =?us-ascii?Q?/gH50IIiex61eaWdm6qqbW1vYzsPYJDR/68qgguzJMOlNUml0tVYHx2zGNv+?=
 =?us-ascii?Q?N9lSR7sXyKFStMiREwA4fRUbKGDs/uajkvpJhsa1Xj4VsLfO6KUKeczskJIf?=
 =?us-ascii?Q?UUf4gKlHozhVOHxso3WWfGcAW7OL8uNRUzPMuUBcL6Lr3GQtqAmv7WlIEHsJ?=
 =?us-ascii?Q?5hmphmSKF/zyXZX6826UpJ4AFTr0dDUVP+VnQ1xjzf/VYkIejRj2xFXv9nA0?=
 =?us-ascii?Q?FVLq+dcw4LL149ddnz7YnOlM+PPmkz+NvHPEF0/vJiFtHXmdi5FoCsEaGn5x?=
 =?us-ascii?Q?7R1M89iHNSPqJXXQ4fshhAbEC1mPIiqGtgJUGNXmcxM/0tH+REFqdzOksna8?=
 =?us-ascii?Q?IplF4m/N7YdCIXQ0WCLNaGYYu7vP5/YPVk2Ktu1+mP7AJUoG5H45EulpxSFC?=
 =?us-ascii?Q?zYSB0OWzKrVszyp4DpavEfmap88Y/l4E63HjdZwKNrNDJJcsH+gvqFXov80Y?=
 =?us-ascii?Q?qJUwUwjl56hCH951lvYV3/iGZk5mShGAWS+Kp28HkDS4tHz8PreANt4ZOY9x?=
 =?us-ascii?Q?/2owiTRN98kjmOB6F0RFP7t3Rb350f2EfTHMEEUjQ8pryxXM05baItGU4WKP?=
 =?us-ascii?Q?zuEuov2a0/2G9tFAlg6m4P3eA0+i+Cwqyb01gQtosjjQkwzZbD7E2eliAYYV?=
 =?us-ascii?Q?yoZDJTd7hqEX3Um3/I9sDc38m42+AAMo1m5o+XRBHgd1f2XaGM+0I6+hgeoT?=
 =?us-ascii?Q?8QW9c6ydMSW8+PMTpJOAesIOOeiDqM/HKFF2/JDShqhpWEL3WUeT0gk0vkUm?=
 =?us-ascii?Q?kgkPfkW85+EsJSnbQ+6BImQdFFo2cnSmFtZl/uscsqLmGvp09a2oaezylPuq?=
 =?us-ascii?Q?gRiTu09LtDfX3VUKB1+P1uT1y50VtsFhPrazmgyLinhRTvYDGJXzMzYEamvq?=
 =?us-ascii?Q?5cSZkQCyaxc7Yguzz++8kOqtuve3wfoixYm0MOpSDw7ZzSd/tM/2/qbGxQKv?=
 =?us-ascii?Q?6Vujvo8rySD3o2tI5cOxv2bc5zyerfs6gTtI2cLifphptllo0Cx9/aNgDfeK?=
 =?us-ascii?Q?ExKgomFfcjjiruVH+Ov1yCqxrbNNRmQSEKOJmX9wGCumi6FAyILvMWuugiRv?=
 =?us-ascii?Q?XtN/6/WbkL9N68w92Ye2ryUSl3PKWFjyKyPty2y/SuDlb9NGbykThMsSgqZ1?=
 =?us-ascii?Q?f8FEBv1HvCPVWARtKeS4xWEQEn4Yg83W+teMtHAuZwvpXzwL3xioDJewx7PF?=
 =?us-ascii?Q?weYjN28IEoykxJOdGy+58J7/sk0r5Qpr7bRmRZwwOut7JadDtXYETWj0V75u?=
 =?us-ascii?Q?0cO01XCYvBxhjaTR7mg03f2AFiQv2xQprh5rEfSd+oWAAL4FIUkjzKtn5u33?=
 =?us-ascii?Q?gpbojGuKV7+VlrLnCcQsqOKcNQBicvYJIPKzM4JFOmOzZtGUSiohBQQlTdaD?=
 =?us-ascii?Q?sAqtjBDG6PBBu+zbZSZyxI5BvLBlDM9N3bDIh9X1m64DISnjVa9HYPOxDCcS?=
 =?us-ascii?Q?c+YAH+kSxRX9yWC+CidQ0kUA20cbG8FGxGziDE1pFVelZRa6NzNkv4JcyhLl?=
 =?us-ascii?Q?7YvnSAwd/s/p7vg2AnthrxmMIU+zWjZbtQuqs0wHQ/pi8gb8NMibMA0kEYSX?=
 =?us-ascii?Q?7zvmlKcDtBGd1xNOXx/ZJeGIOAViIP5t/KPzLU8mgFQOWOvUDyk6?=
X-Exchange-RoutingPolicyChecked: qpJcnuKE8FGPtWGo9TnOzdlZ98yUcUjtjdefoJWjHGIbpiExflqBhliQZy0pBki9Tr3QSf/Mzd8Dq7ErZdsfql3vqFOeMCYTLKSvqWsBVVEuZFQTC7WHZzRejwZlg7lyfQAD7R90RIipF8l/fu0e/JJErkaY7c35G7MOV1AdgcV7sLEgAC3xx9pXb/yFl4EZhM1SERsDhbRwYJbM3zU+ivdmMr+Q+aK0RZIIb8YL/GXctHV/ZBpl2JHS1XOpUPAzNnz6fpLpZ3l/qPNTxsbYKK++k6EFL404LM67CB20brncMNJx2Sopg/Dcne/RFRL72kqhW5ozbPdNaxuY89Cd/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f206426-2ee1-48e1-f031-08de91303362
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 03:22:14.1544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEarUgaHSmE7CCNWGNgG8bBACRiJwx8AMVLa+NBf8lLiLFj7S+ItWmh8pBXVxidshNa+/jOvEQK0Wru6o/3oCIAbg+Jz1ImuOrGaavjRCRGBCoLaEY/huBE3UaMduSei
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9207
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

On Thu, Apr 02, 2026 at 06:40:39PM -0700, Xin Wang wrote:
>Multi-LRC capable engine classes (vcs, vecs) are able to process the
>multi-queue create request and reject it with -EINVAL when num_placements
>is greater than 1.  Engine classes that do not support multi-LRC cannot
>form a parallel queue at all and return -EOPNOTSUPP instead.
>
>Use xe_engine_class_supports_multi_lrc() to pick the correct expected
>error code rather than hard-coding -EINVAL for every engine class.
>
>Signed-off-by: Xin Wang <x.wang@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
>index b5ded0633..dca791fb5 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -113,7 +113,8 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
> 	/* Multi-Queue can't be a parallel queue */
> 	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
> 	if (n > 1)
>-		igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, &val), -EINVAL);
>+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, &val),
>+			      xe_engine_class_supports_multi_lrc(fd, class) ? -EINVAL : -EOPNOTSUPP);

We don't want to validate multi-lrc error handling here. We only want to validate
multi-queue error handling. So, I think below would be appropriate.

if (n > 1 && xe_engine_class_supports_multi_lrc(fd, class))
      igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, &val), -EINVAL);

And change commit text saying that we are ensuring validating with parallel
queues only when the engine class supports it.

Thanks,
Niranjana

>
> 	/* Specifying multiple MULTI_GROUP property is invalid */
> 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
>-- 
>2.43.0
>

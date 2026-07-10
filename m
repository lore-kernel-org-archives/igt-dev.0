Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CF1C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 16:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8987410EDB4;
	Fri, 10 Jul 2026 16:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miHpwkxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2457910E031
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783699307; x=1815235307;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OZ7KT/t3z1rC+IJrNQBDrNf7yX5JB4kkxGScbkDy/fE=;
 b=miHpwkxZSanXtczuwIReVQOvVRJkZv31UMusQufuGY1FYl78+mPQ++7Y
 YCXFECgz7yT19C9kmWb72+TsV2n2WyswURKAgtru9Fw4XGVlKf39SQBUT
 6rPZdxkcsq8rt73366SR016Y0ApgJOrcaLd8pUsVs8G4DbpHMzt/rx47W
 sjiLELGKy9gCSbRd43cyk85wAfAO3e2HDvV+l63Xcf66Hhe75+Vy5J7DJ
 pOScRaeMhpjSmUTT9rtMvjKqgzx+nhXeAYDpfFqmvlVJ9qDRLZaAKCWA4
 8M/mml9dtHeX/rOKwlqifvDLGsOOLPgeyUKpNjfglXmb6nfrpZWC3Lkh2 A==;
X-CSE-ConnectionGUID: h2/XMzY0TPKcq05ykgZadA==
X-CSE-MsgGUID: SXx/EiBnRkqNMybbPoPH9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84368386"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84368386"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 09:01:45 -0700
X-CSE-ConnectionGUID: XLhGGYK5RTGMHoI7V/D25Q==
X-CSE-MsgGUID: 26JGSeiyS7yRJBzqsooV1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254417422"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 09:01:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 09:01:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 09:01:43 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 09:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxCSg0WcCgPYbFVzHPw+R066vqbxso3iAhvceqr3eMSDglGXnYY+ehyVi9w4uacaFxz2gMLOTRcVaaWZVIBCD0+cOqnuld+6KAm++kyym90WTiTjLudfLXv4449NqR2QXjocTcEz6tPKQQlwXPcbE0eNSjsY+HiVMxSJrs+jZXKMB4jTpcFIkJ6ZtjNbGHjB53JO2tCxn7CCksqv5mRETsPgDtukjl4o7Usiq0URxNqTw/Dgm9rGTxI6FPP57HxkrxNqNKp12izfOeLIL/2UuI/uJwr1ZK6j9axP9LwdmUIZPoB5neSNtTBuLKzdWvUDYW9F0EikMIcOBDccpthhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtLeLdObChy1DxmdVTAh5cnMG+vFq2KhKIpQU4jOIaQ=;
 b=eiIeM27zsGwV6UcYUu/S7FDvLRl/7ccidTHlsRxKUej03KhKyaKB1BNxCWRONHrWMG4tpdZIxZb5FgXjwv/nRvF2GMGoZt/GY6/9AjnWDjrK2TqcBmM8NI7ZesHTc1vjuuL94cSTVDcVQ949t806BFUPVwrmp4oW3E5Jl4XO23vDZITykOnpifQPsQ9UxWif3kVmEKzKRoexAvIR1copRB0wHKxsF6w1HiC7jejPbYgpzMQRyDGSUkACJKmHuMa0Tceky2lJR6EbTKzJPKuobM7dtIiwSntDMo/AshAw3GEc3VKsqU1kpu/mOSrHJjM6E8jEg6O3QVr7HXk7Vs7rQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:01:41 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 16:01:40 +0000
Date: Fri, 10 Jul 2026 09:01:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t] tests/intel/xe_exec_multi_queue: Check PXP is rejected
 on multi-queue
Message-ID: <alEXYZaujt1APgBd@nvishwa1-desk>
References: <4f88d137e4d769797789dae939455b918302793c.1783626314.git.jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4f88d137e4d769797789dae939455b918302793c.1783626314.git.jagmeet.randhawa@intel.com>
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cac8abb-5476-4607-fcd3-08dede9c8752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2oIPKLeQf4kmOVSdKiU8j3WTf6Ai7Nw92nEjWYu21lFHOWrdZD0igOxIPC0sqfZ9CNm3VjtvN1oaMRq2MQGrrB245tdQhx+AZQnCS6DMGerIj9zwkjDRLOfEyYj7px/JF4l6l+yurfOCI7/S71h7fczRmd44sl0c4wEr9Sf3GTT2JeeUl80cCLruP1aFtDnqKtpvK+8qMffEKn4xL+vFDleYz8945WNtnga6TaN/DyzIu28ThvzXiFpAGfKO3iIv7hMYoBYwCZe5HS5ctRIH9ItCxAZKK4/xCAry8VZg9kp5GWqDV5IDMuSP0697iEAiKBbJ6XhdWc2XfLpxPgh9lM38yKn0QO88ZaDdg89cuCVVDkuOUXz4Z83ZkJElOk8rW/fxyEPbYHnLYFqhWlr61P8YDsERF9zI34jI7WjDZWt52oD/UrCQxVV6ubkISr5tUEBaYHppMDQoI0rvlH4rNZBXM2aJSZxEHVkXfDH07lDjiK2UurjxKusD8GIdpjy1eRTAvuJNFUk54yzZ94ELkt2AyVrE3v3x3ARLiKZxClvT65tD5h0Ve81zTc+htIdMo28A3/fJXtRXxYSfgjjLjoFmySj8LNXQTGL5EFvGfXPKGD+m/TRUh4itE0P8Z2LstVB5G5cJ0L3ZpgYGgvBcfb84xRKSphWbo7IEn6quJto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oOh3NL4h8maVL+3UBdZK9xWWATenH+tCbPpXj98thDc9WliEFg27N7P0j6jA?=
 =?us-ascii?Q?GzSzqB9dtqMeKvsKWNpJGTNBJJX1E/ssCdNadgEAKTA/kfT6oWwGzYcsUpav?=
 =?us-ascii?Q?yM5PigFTq+2ztY++0KslPyWwhTQbSOGA9TZrshhZ4x/0EI2n3AIdDEa2LQH7?=
 =?us-ascii?Q?QdQJnsoFKgeUD7FmOsT3GiIVhubAHhlA8y8QOaDiaF8PVJBhPC2dyvj7eIsx?=
 =?us-ascii?Q?JTTzYKvH8baQ9Qp6ylh0kDj6Fi7ElgjuwMdrNns/PxtsKU/pnjmHod8wRZi2?=
 =?us-ascii?Q?5DMuG17yiScCqCmbInrl4vMWrJAq3uNpI0u27BmfwD47vZhLxqGOXWDSF9E9?=
 =?us-ascii?Q?XfpyJDibDTU9tN2EABmKdOzZVr+H7k5uY7MB4U5X/zpWqyCiD0S3rX27NnUf?=
 =?us-ascii?Q?gztCLcczeWRo9YR44qP/XGjXWzz+cv1lY2Zc/HCl+LqqocFVV3s2JdJK+8o0?=
 =?us-ascii?Q?jKN+ii8PtEcska85+45kqwcorXl0uzlUq5XdhEaqyalxtSB3ExrF9mnOtVmC?=
 =?us-ascii?Q?9OPYb6D1a62yrIONrjOb5z2pK9eNyOCFhOQ4M2zaSw0YPITxRKVgyNz/busL?=
 =?us-ascii?Q?QlE+8I0xnuaOUKthXi85OGIV2960YxVi7d7eQJkCeIr39d2mTcyTf8hFc7yq?=
 =?us-ascii?Q?9slhXtR1RGWOoxvbBbeP0i6VO6ukvofoBsqWrrBtBJZA/HzZjqHQ2mlKeVw1?=
 =?us-ascii?Q?8EYQPbcOfPmN2Uw0E09j6NSgSu5NwQrmFe/YiJ2SKpFm3aKJNLOXZ+vrZtqJ?=
 =?us-ascii?Q?fWG+X1FidI0WVHti52azgTyhsSVowUM3JU3wo1IddQyHfqIhxELWgqgR+Xbg?=
 =?us-ascii?Q?7CQuByVtPru620dlnunF7vsSvi/nM/YnVcstayInwrtNeCKt6Lwk6dyOn5Di?=
 =?us-ascii?Q?AN5pT3OJx7zCe5hOjcPSIMI8xiTriUQzr0DNbOchI3wgCnEU/T1CZWuJeL4t?=
 =?us-ascii?Q?W4MW+UB+XybRL9pFnoViGi8qwyAvr4UoeVXF4fMiVlGN6RmwAOhrlgnsojPf?=
 =?us-ascii?Q?xhzw3VywlqieYYiIw1IQ9Wlj1w1AB1Z56dV7QHwyEyLxM34YLJor/2zIctMa?=
 =?us-ascii?Q?OTAuNVdShCedIRU2Q9xMweCz/GYBK8IuDaajjB9h3L2YgotF4Oc9V4DWRx3m?=
 =?us-ascii?Q?C0VnWwe6fCutAmVafJL/mKBcCH4K4oDaPV0LpwKX81ClkdMfkKBjphzxFqLI?=
 =?us-ascii?Q?63hFnYpKG33kjMEGBcCvPE5VUJlQoFKOhkgtWpIUGFkWEbwyNWEloOTOSRGc?=
 =?us-ascii?Q?eXpNMZmENWtOH3n6syQg6g5RYLCP/eT/Aj2QIqxyNjFz2yOAI2eORGtIsxRV?=
 =?us-ascii?Q?VIl7qRtRJCli3dlLzp0Qw2Lfh3KoGNReWa5kT2Ik/F3xQanovoXcUHF3NEO+?=
 =?us-ascii?Q?jjBRIHMU8srL5AQBzxWYh+lab+P9pBjl5A+aZSD65AJQSxs1TGkkxVTV9P8t?=
 =?us-ascii?Q?pNb3MxWE8WeWcpdf7wsCbcUQvoqF5FSG/zzTKga1XsYs6sAb26pr6WPxcmLv?=
 =?us-ascii?Q?iuBvEUKm2QMNqvphhUo5djNsoh8EtG0uwuTJs78MadobQ4dHPtdXAdA+P0/V?=
 =?us-ascii?Q?fP0IefU99CKFefGUUSFlY+FUbjLm005F9dZ5ZXuLhOcTbd4ieGHgRowczLYO?=
 =?us-ascii?Q?2FbQ0CytYdirhigE/XuA31/GWs7xxe2iJY2SK5IxgBWd0gugZcHEcUrSRr3S?=
 =?us-ascii?Q?Ugyb1w6gIdlPYTb11/nfMl/59Vg7gJbD4hVEErstMYPfZFs8+BQzBdiYct1j?=
 =?us-ascii?Q?e5RewiJhFZzH4YNSSXyF2bZ3ZKtJ8oum7zeck4yqvsjLzdk+iyiA?=
X-Exchange-RoutingPolicyChecked: iFrg1uvGo1+JlrTGqkvask0tBv4F0SgVlNIn4464c/r8Obd27Cd9hhc9zDhB2+Wf1yB2ObSChlKLbsJbvtMrWAT0F0hFlhi6XxjD8BTcMEJGluimBd5ArPdbcIj9WyfU3sHgMuLR/p/TtrJizjzn8YHVUl74z7hWEOYYEVDPnyrzIf+/3cvIFVlCAvj0aSxNUWgPuDRwEUT9Mkvlyl71RGZmhZai/je4e1oE/woTQRoLI0w4+0+aXlgDvIhp4qkQ7WKAOVpPi1CGYcBC9ECFmKJMy+G6dWHTuTyRgO9+iGAkGnxxnJtJBT2u0DdRx4Wx1uZwDARiS8GJC9TotAJLnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cac8abb-5476-4607-fcd3-08dede9c8752
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:01:40.1966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +unemQDWwjC98VKxs4wpvmE1nhUwgt8wcJ+QJqBdsCi25LFIT0QIsgZRv+zkaWoG12v+TL908Dv5Y0MwOGejxxY5vr/t+y5f63MNytYoSKcEa40py/pCSepHbWePTzE9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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

On Fri, Jul 10, 2026 at 03:52:24AM +0800, Jagmeet Randhawa wrote:
>HWDRM is the only supported PXP type and is display related, so it
>cannot be combined with a multi-queue exec queue group. Extend the
>sanity subtest to create a multi-queue exec queue with the PXP HWDRM
>property chained and verify the kernel rejects the combination.
>
>When PXP is supported the combination must fail with -EINVAL; when
>PXP is unsupported the PXP extension fails first with -ENODEV.
>The expected error is selected based on xe_wait_for_pxp_init(),
>so the test passes on platforms with and without PXP.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 26 +++++++++++++++++++++++++-
> 1 file changed, 25 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
>index 9b41f87c7..21337b138 100644
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
>@@ -72,7 +77,8 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
> 	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> 	struct drm_xe_engine_class_instance *hwe;
> 	uint32_t vm, vm2, val;
>-	int i, n = 0;
>+	int i, n = 0, ret, expected;
>+	bool pxp_supported;
>
> 	xe_for_each_engine(fd, hwe) {
> 		if (hwe->engine_class != class || hwe->gt_id != gt)
>@@ -119,6 +125,24 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
> 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
> 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
>
>+	pxp_supported = (xe_wait_for_pxp_init(fd) == 0);
>+	expected = pxp_supported ? -EINVAL : -ENODEV;
>+
>+	igt_debug("PXP supported on platform: %s\n", pxp_supported ? "yes" : "no");
>+

Remove these lines, see below for comment.

>+	/*
>+	 * HWDRM is the only supported PXP type and is display-related, so i
>+	 * cannot be combined with multi-queue. When PXP is supported the combo
>+	 * must be rejected with -EINVAL; when unsupported the PXP extension
>+	 * fails first with -ENODEV.
>+	 */
>+	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;

Setting 'multi_queue.value' here is not needed, it is already set.

>+	multi_queue.base.next_extension = to_user_pointer(&pxp_hwdrm);
>+	ret = __xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val);
>+	igt_debug("multi-queue + PXP: kernel returned %d, expected %d\n", ret, expected);
>+	igt_assert_eq(ret, expected);

We don't have igt_debug() for other cases in this function. May be it is good to stick
with that convention. So, just doing below would be good.

if (xe_wait_for_pxp_init(fd) == 0)
      igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
else
      igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -ENODEV);

>+	multi_queue.base.next_extension = 0;
>+

Setting next_extension to 0 is also not needed as it will bet reset anyhow right below.

> 	/* Setting other queue properties are valid for Q0 */
> 	multi_queue.base.next_extension = to_user_pointer(&priority);
> 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>-- 
>2.53.0
>

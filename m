Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6BDC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 02:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D171122A8;
	Thu, 28 Mar 2024 02:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRjqL+Va";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8E71122A8
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 02:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711591525; x=1743127525;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=dhMalXxWXwQJaD4lKMN8oOs3J4yNnuk1WskdLKc56ks=;
 b=CRjqL+Va9BSTh0Ew1RJgIUa7y/ex05lhXZ8WhfNIq16ZmxJYWMINQxmV
 bKRBbkFMd0a5TIPmzQ8uWWhWB/CcKscJV/utGFzBznLILAiEmdRCiE3xi
 UEC+etZKaNnBrxJKU7OintlfJ+Q9ruDmyx6dnbp6TNQxXKF9pMhUr1AqK
 euW2rSt1ULxOlNIN6nXPj8b3MhEk35gkwYpE4o4ESqC9vMcmchOl/nQzk
 MaiZ398j+H1kq0e/5hAYU2rccH9n38i/KgjR0A5OlDDqTKMFD7uXlYnpK
 1FPB30AyYFfInkyB7qqfw3N3sO5Kd+2fDPYwUwFV3Ekb+XTMJRUAD3nq7 Q==;
X-CSE-ConnectionGUID: 7l5cP/jOTN+8BNLDMPdP3g==
X-CSE-MsgGUID: S9BIYGtERc2zbJ+fSt39Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6590057"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6590057"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 19:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="17113029"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 19:05:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 19:05:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 19:05:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 19:05:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 19:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDaUrIc/Ft5VKeRKQwqEVot38z6kUWLMFIZnvbnUmGfgmvdGas2aPBL6l8Irnbt9O7DCEJD78QA63RsZmCYTb07LZhBzL4gOzWUJiWm5P+YKQ0AvsZ8gIkxAGghPJ8CE80MeenVm59lsSDIVCgBsWgyfFTJTedN7DWmYYl9M1Z7axXRiOoEH1F56R9ym4uoyPadgO6hkUJz+AoTAi65E4MBjXy4r0q0qyoWgFXKCW2zUVlBJmY9Fx55vTixhL94Mv4cBQChFDPAYPu4yW7a8sDtkSsCUxsr1mVqzKjBvYTOE5CaLVVBv8/4faIlUOIYHrcCF1W65so997eO1LdpKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvXUYKejIkpnDxmnpHTjv8TSikRgEvkLBmvKCejqkRU=;
 b=CC/u1r71mQWBqFswhlEOms98cfET7rPrFC4kGd+ujOyrIMjyLtrNN1EHiLcabaM+xG2bInoLvgxdGZRwIbuTqWs/TYn8QLe/GhPj7VorZQ4vRrlqUDPP1qBDzq3yYUOGBrv6ywEpFkjzNp5DghgW0he0T80ZLFzXPjzr7pD97UulWi9GZKOOluw6+YPZBu7Cf0h0GsOCmzhoGClhg+L0pvxzZ2bOfwtE19+ccgy3wsxs0Z0HUn2EDPsC20ynlcgAW2nuzOYHQpPxmTklBNbhsOzZhqtTevTC/EGBa+qYbFG+9aGSdj1C8ej5xbTgznPiZFAxkZbhUFl8bh0Cw9JHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 02:05:20 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1%4]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 02:05:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240327234759.1473420-1-matthew.d.roper@intel.com>
References: <20240327234759.1473420-1-matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_compute: Don't require ccs_mode on
 every GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 27 Mar 2024 23:05:16 -0300
Message-ID: <171159151680.2300.15911375470977991669@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:40::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: 856f8795-1518-446d-8992-08dc4ecb8598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SYa2izzTZy4kUFAAcXJFz3GBDwv26ia9Loea+vhNHB0UE4iS3Ayu/nUqCCxs1bvG10RdgN35KbK20q+ekR24rPeWtlB5LB/ACeNzCI2rpaME0xW71127kEUd02/xLRbwndV4JD5sZoCZAGmXxJFz7eJhReqcChsqJRWE5atTfctu/ij75ScvyCqB+mXUa4P4YKwkK1KCA58oVnIKtikIl2d2DGwMGy5qQWssPKTd3IyVZQpBbYo1gs3DeHuFtVLAsNsoKfq7JO47ETeq1GVtMyq9gqRXIoZRm2hIupWsejuHmqy2I83BtIp9IB/RvQOCsXJcm/+ghvOrP+ZbpFgzuSU8Z8C0dW5ioiABxiymegDhgcjQiUR6Xlna1BEXKvtXG29ENlkqe6CYfVhlwswj2x3qeI+HuT3Vw0JT9JgN55jHGmSGsOZtot/Th6+6+gQnBMOJncg67Kqzt+1/Q5sIA9wF0/VPk6Qj027T1krD94F4Z8Qk5MJJU7OBCKD/lxlrN8B9W2wOQwzGZAq9+0n1/78SqNovCWtU5db+Cd3fCEWtWjFZmajnTt53Ei4LC4cxGAIKuGBcyeLv6kVh6xm68mSKYyHkpYRmC7kKkjJTZoRmYvWeh5MkSz6anftpRGWqnIWmh1IHAvNCvJg37RTpQNhHgj4bZDUu1zcklSIt3Eo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZQWW1mNlk3cFVhRnJkczZlM25NL294dmZCMDdYL1E0RzE4bzlDeHM2dmV4?=
 =?utf-8?B?ZmtQenp6cjFDOU1RNjB5cmxVaDFxUTNzb01BaEdoc2lWdVhnWldVWnNVNHo2?=
 =?utf-8?B?MUp4ZTF1Tm43dDZUa09PUmJQKzAySThxRWZuSUJ2dnh2dlFOekFIVUlaRlZV?=
 =?utf-8?B?d2l2cjBiVkZDaHp6TS9QeWkvNzBabzVlS3B4OFROMy9jaURsM25JMVhrSkhM?=
 =?utf-8?B?YVYwVWszZ1ZFT2MxamQzNFhreTVveXFVTzJ1bkJzZE03SWdweHowOXF2K3V2?=
 =?utf-8?B?MXAzVjBqOHRUdzFZYXlVelk4Vk1CUmxPOG51UTJxc21LdzVpM1hMeDIrZ3E4?=
 =?utf-8?B?Y3dCWWczR3MxbGJJSmVDUW5qcWN1YXpDM0JUaU1rUnRPYlJ2bG5OeWpiOERL?=
 =?utf-8?B?SHJFR2ZjMlI3WFBKQzR0VTQyOG9wQVBkVWxvZUtNV2F2QWhYN01uYVl1Q0Nt?=
 =?utf-8?B?MlFNOTRKWWRRTjFBZXB2dFY5RnFsT1AzbGc3M1YwZWY5TkdDTGwxRG12TTYv?=
 =?utf-8?B?VUZNeFZsVm1JV0U0cWVsekNyOWhxRkFaMWRhbTVzUTZhRzNMMHgramVvU0hJ?=
 =?utf-8?B?a2FmSEVLb0VvVzVld2w0QzN6aDBDWXowTldtazdKc2lSUG4wdlllWFJZY0py?=
 =?utf-8?B?SE8zY0hCZEg4d1BySE9pM0FhSHR1VnZMaU5lNFNWZWE4ZmYxTzZsQUZuTEdR?=
 =?utf-8?B?aUtVWnpMSVdhNmNVajNlMHlNbjV4SFdUSVFUV2FzL2tKdTk4MDJsTTAyTmZR?=
 =?utf-8?B?RU9oRi9pK2lyRkI5aFBEcThId3dFOGFSUEZWVzhNeUZ1bGJIZ2tTdEN3MWFs?=
 =?utf-8?B?eUJ0YzNoMUt6M0E3SXhXaUkrU0twckpUT3FYWDB3dTh0Q2tONWdpUkVHekpa?=
 =?utf-8?B?cXIxLytNRjN3QS9Sd3JENmRNcTBob1RvdXB5T21oRzR3Q2M0bHpZd0VodVNX?=
 =?utf-8?B?Zm5tUWUybG8wRjlOR2VlL0Evbkc4NmphWkV2bUpsZlNrMkFYc2gyamk0NHIx?=
 =?utf-8?B?SzIrWlRHN3VYUXlUaTRvM0NKenVSS1V6OVE3TmhUaFRvS2FGdXA5N0ZIZHJp?=
 =?utf-8?B?M0pRQU5relYyajExN2MxT0xaN0dVb0xHT2l3YU9ra1crL2t2SXZvUjczSW51?=
 =?utf-8?B?OFNLOG9HeHZBMUdhZUloQjdBK3FSSFZOR1d1cDh4MkdqZ215cllySWRqSGZm?=
 =?utf-8?B?V3VjbEtkTzZNMGhNREhUQlRuc0JRRmhKRDVTVnEyaU5SZUtYQWc1d2Q5QWNw?=
 =?utf-8?B?Nk9QanAyQ1hRNDRzRk00Wkd5cTdBaHJXUGZlVm81UFhYMnNMQmpUM01nd2Zl?=
 =?utf-8?B?WStnN2p2ZmZBN04xRjlBNzkvQi94YTVEejlzc1lCeUJma09FNG9VbmxBQTl6?=
 =?utf-8?B?bEowK2cwS2lpdzhuRlJUeVp3amk0SVFVRG1zclovTVI4RDBHQXp4Q3RmUXhn?=
 =?utf-8?B?ODd0SUZOUkVjTlFtdVpPOW15QzJnSkVoam1TVkFBdjIzT0I3YnZVT09scENC?=
 =?utf-8?B?R244eHhDZmlwalcvSEN2YlBJVWM4WXRKRDh1cmpoU05BUE9sQTBjZVVNekJi?=
 =?utf-8?B?ZC9xUEZZTURlb2dhV0YrSldRMHh6bXJSUEFrZGlHdks0UndOMGZ5MEtVaThR?=
 =?utf-8?B?MjA4eHJjWS9FRGh1NlNvZitVUThSQ0s2M2N4L3k4SXBtYWNOMVduNXdlS2Jl?=
 =?utf-8?B?ZDE5TXgxekpSRnlaM01xVzRwc09HUGhhbzFBeHlyNG1PRGZIZG5Dazd1eUF4?=
 =?utf-8?B?M2FSTkx1alFZMzNGVnVuM2tyM05RYUNFNlRMWkZKWjlLQlhzUS94NmlEa1NX?=
 =?utf-8?B?cTc3eFk2VXcvWHZnT3V1aExUbjBWK0hyK2VObFpMM1ZoWk0wMG44VVorcUJt?=
 =?utf-8?B?eUplWGthR25jV0kzdUp6TlVkd0FRT3dKMmVsNklIdVA5S3AySlpFWDVJdUI2?=
 =?utf-8?B?K1dXT2MxeTZNQXZuWU1FV1NmMUJrMEJXeHNuMWZaWGJBSEhXaHFEK1RBdWhG?=
 =?utf-8?B?L1pkTlY2UWJ4STRmNUk2b2tzREo0QWtVOWZyczVmTVNsZFZiZE5mRDBKbVY1?=
 =?utf-8?B?eTlPWDQrMTlmMzZ1OWQ2T04yUmFub0dxdEtFOGVVTFRZYzRMdmFpaTA0U2o5?=
 =?utf-8?B?Rkc3WnFUdktvNUhwWjNNSlNGUml0RVBsYTVsSHoraGp6N1lPNitKTVF2NFhq?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 856f8795-1518-446d-8992-08dc4ecb8598
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 02:05:20.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yH9ef7UzMd1s+gS2r9pkP2brnI233iMhMNzISTgkKty0gzjbIaGfTL2QSe22tkkrNflJmJbUQq9YlInKfLFaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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

Quoting Matt Roper (2024-03-27 20:47:59-03:00)
>On platforms with standalone media, we expect some GTs to have CCS
>engines (meaning ccs_mode can be tested if there's more than one CCS),
>but the media GT will never have any CCS engines and will never expose
>ccs_mode.  Move the igt_require() out of the loop so that we don't
>declare the whole test a skip upon encountering the media GT when the
>test already executed successfully on the primary GT.
>
>v2:
> - Make the same fix for the compute_kernel subtest, not just the basic
>   subtest.  (Gustavo)
> - Treat get_num_cslices()'s return value as a bool rather than an
>   integer for clarity.
>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> tests/intel/xe_compute.c | 16 ++++++++++++----
> 1 file changed, 12 insertions(+), 4 deletions(-)
>
>diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
>index e773e798a..ac6351276 100644
>--- a/tests/intel/xe_compute.c
>+++ b/tests/intel/xe_compute.c
>@@ -51,11 +51,13 @@ test_ccs_mode(int num_gt)
> {
>         struct drm_xe_engine_class_instance *hwe;
>         u32 gt, m, ccs_mode, vm, q, num_slices;
>-        int fd, gt_fd;
>+        int fd, gt_fd, num_gt_with_ccs_mode =3D 0;
>=20
>         for (gt =3D 0; gt < num_gt; gt++) {
>-                igt_require(get_num_cslices(gt, &num_slices));
>+                if (!get_num_cslices(gt, &num_slices))
>+                        continue;
>=20
>+                num_gt_with_ccs_mode++;
>                 gt_fd =3D gt_sysfs_open(gt);
>                 igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) <=
 0);
>                 for (m =3D 1; m <=3D num_slices; m++) {
>@@ -105,6 +107,8 @@ test_ccs_mode(int num_gt)
>=20
>                 close(gt_fd);
>         }
>+
>+        igt_require(num_gt_with_ccs_mode > 0);
> }
>=20
> /**
>@@ -118,11 +122,13 @@ test_compute_kernel_with_ccs_mode(int num_gt)
> {
>         struct drm_xe_engine_class_instance *hwe;
>         u32 gt, m, num_slices;
>-        int fd, gt_fd;
>+        int fd, gt_fd, num_gt_with_ccs_mode =3D 0;
>=20
>         for (gt =3D 0; gt < num_gt; gt++) {
>-                igt_require(get_num_cslices(gt, &num_slices));
>+                if (!get_num_cslices(gt, &num_slices))
>+                        continue;
>=20
>+                num_gt_with_ccs_mode++;
>                 gt_fd =3D gt_sysfs_open(gt);
>                 for (m =3D 1; m <=3D num_slices; m++) {
>                         if (num_slices % m)
>@@ -150,6 +156,8 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>=20
>                 close(gt_fd);
>         }
>+
>+        igt_require(num_gt_with_ccs_mode > 0);
> }
>=20
> /**
>--=20
>2.43.0
>

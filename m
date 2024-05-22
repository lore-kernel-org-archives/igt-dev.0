Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4960C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622DF10EEC7;
	Wed, 22 May 2024 14:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iK5LKZsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF4510EEC7
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716388431; x=1747924431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=o1MzXSYBTRkoLWwQFblv9quNApJVGCy/HHXSsrhq15w=;
 b=iK5LKZsTS7M5G0FuAxvTcFFJIsrkx2MkRXrT7iUUiKiNHRic6uESOrb/
 IRQeY3bBA/z4OKaacWm/QJtRqUBke1SzWwrbG49fByq+zSHUrCgBOxoEP
 1aFYNo+gSDhGFkcGLvhYEq0SyguphmFWtXACKzmXRCgzIbb1Dy66oGHkY
 sYp9AgEDlvLPgRChrVLykRXalSLzvhPooEGzOHX9dU9sHjOb9q60djvts
 BwJUL+Icy2fJaYLhX5hjwOOov1EbK9KrAyZNRFDjeuGae/kfRj8p9ub3H
 xI8rjKbE/1YkWdzFHiR9bltx3BkA9eMnas9J+c6iasU3PwuoO37mLTgZp A==;
X-CSE-ConnectionGUID: 6+UPWPR0QfCzwfZceXI9Mw==
X-CSE-MsgGUID: q0nYDNdCRuGs3ASXDBe26w==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16475493"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="16475493"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:33:51 -0700
X-CSE-ConnectionGUID: dq3kIEcBT6S4gE/5Te4aqQ==
X-CSE-MsgGUID: zdjqJv9cT/y5SSmm6psIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33888524"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 07:33:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:33:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 07:33:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 07:33:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJlBQ6GmTDqDud7zYgev/9WVTq71DTIca2Ef6yAheGlQrbCgpgpfzJdBhZ6eyrr57sTQCCxeYIBI4f32nJ1Y8dwes8ib2oinFP67KZh1l0dfbroWrL1VkYCUFNMOWvRFGJZdDCgxCyIEQzAq67O2zc3rBrf0/ggw1fePpiNIyZSOXUBLrUM+HqE73eoSiqaaXHnYYTKkuSm0gxyIiH4n1nuIA5pntSlX8GWrazgBY2e2oxCGtsAEf//6v4GSW3vPezddJoL+0I7w+0a++vp9CU+f+wXwmeN2ssIBp9IFpOomPmViY0sy9/f7y3MYOEp1Wgs6m5rZfet6zHnOvjIK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbQkxPj1hsRga8RQw9AcDFt+6FRiv+4VYuz+/FYriqQ=;
 b=c4mXk+WQfRfg4xdQJGSRtsbo1nNu1aXSAmvpm+CLGRwtgsnzNiQgslIzcNBDjQbd5zDM8Usk6jv4yzmLYrP8wQHvLQrvHiUl0eF0GZkK84i4xtQg3qjLkzJJQTzjv/6AqxLt2lb+M+FugB76cHFjgHV1zSHihzO1KwOGxTGIIZPJ1uz4WbKsdw10pGiutB2l4vancLqoYeMcVCT5rck4FoLATMwm2R1Pos/0Y1i0D1gt2boXwank3WbKHE8QKdTK/vlbLo18lhHOOyxBENz9XX1DFGP5RKNAt2Wn0vgKUC8g+46KIgh6cgKlYOvm1LHqxFusaQ/X+kLkQ+ReIbsoTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 14:33:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 14:33:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [CI 5/6] tests/intel/xe_pm: Convert mmap tests to use existing d3
 helpers
Date: Wed, 22 May 2024 10:33:29 -0400
Message-ID: <20240522143330.312014-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522143330.312014-1-rodrigo.vivi@intel.com>
References: <20240522143330.312014-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e1efc8-6595-4831-5b0d-08dc7a6c306f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bqOML3QJHqM6W1I5LHer8QLrQsW8IB/Wj80Mv4dgJb8g/tkDZvd0U9a2p+2p?=
 =?us-ascii?Q?XzQCaAXs0qyaUBIQuyRfySEdXAd5rpHefWXZUAk7TNklr90Hd4SMb7+AVtj8?=
 =?us-ascii?Q?zMsn/W/4SwfHH8qwWGAF1nQet0lk+NI7PHkH3UKtmP7U44tXa6FQY9KOM3Gs?=
 =?us-ascii?Q?TnBzHqtBegJpZZZ3ay+T+nuP6ZYnzl47DvKsx33qI/CjfpXtV9mWUgGx4WuU?=
 =?us-ascii?Q?sLMWVvHBW8+w0OPrYlEfPzooFMmbFCXq/9U988Ol/aYmRtW3ECkGUsx//5R/?=
 =?us-ascii?Q?Z3VvM6oW7tp6xU2wtp29487VAINb46eR6dS04BQUbiLrxL8pfhRfzaH33aue?=
 =?us-ascii?Q?juVFjYyoi/jJpRo+13oQ+lEcCRS2ofCFX7OqbiDO1CXwM7YXzHSJg9byHKUT?=
 =?us-ascii?Q?clkms9PKMqDlkgWJn5QC56/Wmcgl/PxxgAUKNrROUAAo7D1Hd0KoVQd3qeao?=
 =?us-ascii?Q?CIPgWHYEG5spdCcmfqhDqwlwh281JRhOebq7gpFPslAzVzfp0XirE6+nRBae?=
 =?us-ascii?Q?RmFljGN5PzWZFoTlq3fUlmjQ4HBn+lhI3NJnNs7tl2RZLBJFALO5zeg+30LL?=
 =?us-ascii?Q?DArveMi43OXgz1QMQB0Jdb8YiunB+G7rU5wokPrvPTyaWNZyIXhv0O1EHiNO?=
 =?us-ascii?Q?Rin0aFb5OAcQSnjJ1u2yorj9v1eKz8RO6vOy09f9Y7oyyKvEH7hoEVS5c0i1?=
 =?us-ascii?Q?M45O6AWQ7ZVYCXQl9UP4ODvKEOxfJ7mlBXrHVGEnXtwYTTWrd1n0kzjTfaIx?=
 =?us-ascii?Q?t0PUa7YngAjP9iMakSW5qFBta/K8HH5PqZRJSBEP0TnHkAi/Afs1QkZ3udO1?=
 =?us-ascii?Q?JaaVbgfk5zdukFj/9+0Lu8O2PSmMzcJ1ub+OOFOXKWA2/AkTCJwA+fIoN8kP?=
 =?us-ascii?Q?1fu1WKzB4Mkro5Co0qFhl5xaPV5vybliRzRiEhhXs8vDQd/M0xjD8Z876RiX?=
 =?us-ascii?Q?WXEVy3pAG7sMV+OKXttGXEvTd6z9N5ckV84psABonal1aysJWd9zuS9WWpR2?=
 =?us-ascii?Q?i5XS4MO33pkf6H+GXIEjHbZ1KpxmmZIXJyrS98cy/7kkNDgdI2fl6X/6rpJB?=
 =?us-ascii?Q?WAuW5kPEvMfL8Cpu32/9wAAxCBQbAPQaJ07o2go0SIuco4/C9ji62VSKSoCm?=
 =?us-ascii?Q?ghNRUi3AxfbB5TeD3Zm/VHWvofhl0LhYZHNFFOgtSgk85CspF4gnyJO5IW0X?=
 =?us-ascii?Q?H8JJ58I88dMs+r6dUbUgiuaJSW2af0OhfSpFE8uR2SYazFHIPfQhrrGvYjSF?=
 =?us-ascii?Q?ee4k/JaohgTXwFOZgUiZBNQpSe1mmAO4/R1GczlsWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GLwelxvPMpBaReOpR2jCQsbP8DnE4IiRcpeJiVHDGcY8fMfACrwH0W0AmF1O?=
 =?us-ascii?Q?pijB8PWGT1nPU4mE0eJQxxrbQxaZvtnw6yeD5ezxWNDjz5r+TyFKaAcmpsIF?=
 =?us-ascii?Q?K+0F8vflspYJlwoQoOYEbGFNHFjaRpJ5RC0Ngs3yi6PvGaEdza2fKey223MH?=
 =?us-ascii?Q?W8LI20gmF2Znmu+505qYYz7gdWIsG1IUVJ61mtkgw/L7bs1bucTczZ8+9gX/?=
 =?us-ascii?Q?7ocohB+iSkzbhrAeBwepgxa3S+Du1dg0r7AovVwvv3FdxX627kpxbL8R7BgV?=
 =?us-ascii?Q?pio7ngrnfs+M8FiHP0d/wP2uP/HblFGlt57D/lrLkQ4f7lPkW8Z72RFwRl/r?=
 =?us-ascii?Q?pKurMp5R4nc8wNy1dkygVS3iKK62467g98rANKifnKhh5VwInqCsAdlgAxcG?=
 =?us-ascii?Q?UQEktKIQYt8B1Di96Zn7U9Y53+R8HW+1z/oxQ+wOqYxrUBUeeakUzwhA+wWZ?=
 =?us-ascii?Q?t2VfXa3OVVpeswQ5hpcs/TeP1ysuB/X1h35/uGRykm8dqxVEuqYb3xytdiHF?=
 =?us-ascii?Q?JrEX5tibzePg4Sa23ic9g8lr8fccFmCikVcSLZCOlkmifiH0ib97850jHISI?=
 =?us-ascii?Q?hKAlVg2SpoxRhoy5BoyvDWFOmxbxBgkFUZsctr4MV1jDuY9QnZDif3VzHsg7?=
 =?us-ascii?Q?cZqZ0JRRbR3HJinlprQH2cA3tloYyT0q/v+KYiz2dePJh5Ch8PdR4w4SL085?=
 =?us-ascii?Q?qKzcLfdaU743K59nlnwy5JC7FkBa7dTR+bhDL2iLr7rbK+gMHzvsNx3upfN6?=
 =?us-ascii?Q?0MxuEWOryRatkBmZLpVSytCqtbB7h/ka4oklAZclUGzZKhjIT6vvs0zMwos+?=
 =?us-ascii?Q?sgRqsuY8lTBDBAqblho+ZUisFMeU5in1mk55ifcO8+W73Qb7w9pvsXG/hmsr?=
 =?us-ascii?Q?xfVecMLZ0Wg9EihFSQtGQKQgy8+jZZZpmgNSbROCq6eQTAkQ6NXuZmEXbDqB?=
 =?us-ascii?Q?NmvNr15pijYhWf0PRGIdtR1rktl2HkZHScttFXYKyqrVw+ZxsFk+eP7GgT17?=
 =?us-ascii?Q?9U+bgl1evQidieOgpEDjSso3a9AimVBHoTkLt+RrJB/tq5aa6os8KI9C04JU?=
 =?us-ascii?Q?T04yVgYceoj7bx4NhCnWCQ55bhYKsLA467Q0kIoyQ+YrOFCoA8l3zWu1Eirg?=
 =?us-ascii?Q?WWj+UYhhXca/fsse26TwGeiFTRWBC3vw7kIfFxdt0a6w/BtS+OzooqD73qTQ?=
 =?us-ascii?Q?1AMuL15dn4SiovxsUiqjePCDdOiO2s6uBv+uGd2AlLwLtaf59zrRWzak8LBP?=
 =?us-ascii?Q?HwzgTiI8Hm/SO0s1Jjq+wT88QGBCWbTz8CSyMvxIEwyLrch52WkcnVWT2JhS?=
 =?us-ascii?Q?XhQYcpdt3BptLSB4nTcWxB4+yG1x+KAqBc94YnSpv0S7NvVHbu2ekfpCp4Xa?=
 =?us-ascii?Q?wKgsMqTkHhngIt8i962im+pulX8VsUwC3WJtuMRPHG//H9hojFg1rhi/VM+p?=
 =?us-ascii?Q?R2TOHScWRm5L0JxSgeaesusVgWJAU3VdNOhIjntpXtO0wGGDnN116QdALVSZ?=
 =?us-ascii?Q?93J2Y9kdKfaww83iyD6goMbYyUgennPkGcVQ/DLVwjYFQDxlKGsYdcpKBj/M?=
 =?us-ascii?Q?GaSmCuQRejzKMUtMLvtebv4kDUA6lA4OqlgNCBFFiPdU/v5rg1XoHFldTncQ?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e1efc8-6595-4831-5b0d-08dc7a6c306f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:33:46.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3PZ+yhyHkeJd9OBYNQIGrO/W86WJbK9iRYWP3XVNwwG2Bl7XTqaNBFyCPdoYVByPNbzTucfNG89Pk9pGMu1mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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

Standardize d3 setup and ensure that it tests with D3cold and
D3hot.

v2: rebased
v3: rebase and fix description arguments (Francois)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 82 ++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 683f25969..438c6fe30 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -517,19 +517,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 }
 
 /**
- * SUBTEST: d3-mmap-%s
+ * SUBTEST: %s-mmap-%s
  * Description:
- *	Validate mmap memory mapping with d3 state, for %arg[1] region,
+ *	Validate mmap memory mapping with %arg[1] state, for %arg[2] region,
  *	if supported by device.
+ *
  * arg[1]:
  *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ *
+ * arg[2]:
+ *
  * @vram:	vram region
  * @system:	system region
  *
  * Functionality: pm-d3
  */
 static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
-		      enum mem_op first_op)
+		      enum mem_op first_op, enum igt_acpi_d_state d_state)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -539,7 +545,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
@@ -565,7 +571,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 	sleep(1);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -580,7 +586,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
 			   active_time);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -590,7 +596,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 			igt_assert(map[i] == MAGIC_2);
 	}
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 
 	/* Runtime resume and check the pattern */
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
@@ -785,6 +791,36 @@ igt_main
 					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
+
+		igt_describe_f("Validate mmap memory mappings with system region,"
+			       "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  READ, d->state);
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  WRITE, d->state);
+			cleanup_d3(device);
+		}
+
+		igt_describe_f("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-vram", d->name) {
+			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+
+			/* Give some auto suspend delay to validate rpm active during page fault */
+			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  READ, d->state);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  WRITE, d->state);
+			cleanup_d3(device);
+
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_subtest_group {
@@ -800,38 +836,6 @@ igt_main
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
 
-		igt_describe("Validate mmap memory mappings with system region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-system") {
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0, READ);
-			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-		}
-
-		igt_describe("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-vram") {
-			int delay_ms;
-
-			if (device.pci_root != device.pci_xe) {
-				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
-				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
-			}
-
-			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
-
-			/* Give some auto suspend delay to validate rpm active during page fault */
-			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
-		}
-
 		igt_subtest("mocs-rpm") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mocs_suspend_resume(device, NO_SUSPEND);
-- 
2.44.0


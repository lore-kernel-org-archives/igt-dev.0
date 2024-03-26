Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2322DC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 10:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A99F10E4FC;
	Tue, 26 Mar 2024 10:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFwDxVaS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C98610E507
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711447781; x=1742983781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=F4ZY0NRsJ7iEEDDCRfkTcuokoSzd9rKO6dxF07U6XCo=;
 b=aFwDxVaSQ2P2frO0h8IcyMSiB13MHZK6X6wrzWHSt5AuV22SF4Lr2pVf
 3i1CIzhMnIiobtHGaIVZ9OAUNMCRrYqhpEPtWFEuxfmyaeRx+g9HOWBel
 i+fZS99V/EHAGDvlF1h2hU1qD2p8NTVg8OSxWnbdaSaBorEsQ9QOzuS/J
 Lgrt+8PR/VXEA8G7t6qOLcKCTqD3odWIFpygGpdV3eovTK7xGQsfk344a
 WuZC7yXGjdkSNFFd8tezqCqdbRLVlrNz8yKa982rtUe4DxcMOolx/x+C7
 XizP5a9Id3CSFg3FlvrhuUo5btEBKBWA7YYxFEWFluij9/OzTwCTcC+qu Q==;
X-CSE-ConnectionGUID: UDkxC7AXSYO7u+RcfZMgLg==
X-CSE-MsgGUID: YLULOOp3SpaZu8VHj87ipQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10267954"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10267954"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20572154"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 03:09:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 03:09:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 03:09:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 03:09:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 03:09:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSO6Y7RDTuV6mROWAm7OraSWuHaxCVrKeKT0h+VI/Bsw4lLTlrdDuj6s3Eshd+D2iW27vvxBTkpS6sjjyIilte6X2z0EnSJD4Ad7hrAcTSxMRiqd0EfuUb/c8cMlmwiPO9AaxbHK7O8KBvvSM+3ZynOARIDrfnUaPeOKT+hLrIWJDC8r5zh0U8FYyv8WC8L7115Q2MpdM3OYxj96qrqwkFPVI2cWV6PC0sXOLywNXm6jtB5hX8YGZH3gt5bQp++n6u22nIKE5aqMZO06Oscv2uoylzv9C4axMDMmiQD/b0QZDIoNJtyeW4L+wMF/RfYnHVCJvL6qCEHLx7AINtZH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdVk8l9s1eZo+BQ0LNBsPK9JuPKYX3zmrPFsPcY+HOI=;
 b=Sp0RN9HV8RiJ8k92vyO6JkBEiYjtnYOTEEINCgKLQRsCYMESsXDuVlG+GYfeLal+/wtHm0yIoeyswiDi7Hj8e+1n/B/GDTbxKX7+cS/1U7cWBg/hCnEQms/Zpz6+7amC2IDuS119fM6yLlpSvXVmO6jxjdOUjKsjJsm8pr9SfC/dSx1FljBcSetT1C8HFJOlNQP+fCsiGAJ2gPKBRlERTohEncwcNVtXBfFh1lbj3H558d2kYf88WerAm4VaU0eaN+5Mu4SRhJh7q0rTEFkJprmWabwAmQ01xYfxVzQVZZ8OcYwRZvhOHtKDU2AY+tuLOSY+ZIgQEA1tl7QZMQFviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB8013.namprd11.prod.outlook.com (2603:10b6:510:239::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 10:09:37 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:09:37 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH i-g-t,v2 1/2] lib/intel_mmio: Map the whole BAR0 for gen12+
Date: Tue, 26 Mar 2024 11:09:20 +0100
Message-ID: <20240326100921.3539141-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326100921.3539141-1-piotr.piorkowski@intel.com>
References: <20240326100921.3539141-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB8013:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/fuOpu85UQhHQZWG+390FZTAZ0GElLw/SjSI23LFD5ZbRSRypkzmQECGgYjfxhA9dlBrt1VGFt4XJJxyMr/UAFBxBXm579mVPyryl2esq1f5tkgwfaXDjef/1o8iM/JwOSJe4m9aJcDDmZfOaET8Rh3/FziNaBUOtovuJa2RSW9RocjT4cwu0hVqU45H5p540tnwJ6qPgNBD+OtX8JOlHz7DU0KPwocgbFhQZd0ATfV1zWakmVKXE6BFy4A1ioPKuawc4/sq8scwsRmbR4koRA6Vg+ManEZK70508cTKtf1oyQfSu2uvHGpiiMxb+e1hxBm9IBPyjVVTkB+tWKfb1E+Ig/jpDwMNYX105kN2gNPFlUI3JP1L9685LazIbyOUywOULmljFr6Cg20sqcNukMFsQpQe3OrS0cFrHWsYpFzplIwsQahvW2XQp+NcaaxGpbVN2EmR2Lvyl1U90RGlwIUMFVkMKkkWxOfVFRnqBfWhoSkBShV4p3WGk9dvgi/IArD7wy2FvhzSHqXtCgqBmw1U/hC8e0DC7SIDrLlwDvEBgS8h+z8nSJaRyIAfj2afcjVpxG1BK9QNoKlms4m8pY0fuKQolGhb2+h6oPip77SoaSeP3wCSUq/fpUlx2sdyVoiin4tgj3qgsiTdV/ScSvV2omndMV2QhtDHoTJonE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmdRRkR6UWhGVEd5K2JBajJxeW55MHRJZ3loby9lcmxQOTJvWmphTlVYYmFu?=
 =?utf-8?B?S2g1czBsVWU3TmhqTnRDUGFsTnJiY3hsYlZwWmw5QzgvYVY3U1JkaWpSd09o?=
 =?utf-8?B?djNGN3R1S2phL3RPWDV0OHVZbFZLSE8zNXJzZ3RyNXM4M1Y0MzRaMGJDT21w?=
 =?utf-8?B?cG41cFBlU04xcG9LaHVXOFV5NkZiOGpqVDJvOWJNZmJRYkI3TERDMkRKaUtK?=
 =?utf-8?B?V0Y5d01kZ1NyVEtaT3p0VGFrRlcvemh0WUl1Q0J3aE1sNlJCRExKY1BlcjVD?=
 =?utf-8?B?cG9rNU5qN0Nudkt2NDU4czVObHIraHM2WnJ2QUxXVmJpNEVYSEhMbUtmSEh0?=
 =?utf-8?B?aHZhWGtYRWl4Kzl6cmdhQTFVdmFNRU5QWFhkYWZVWUZjWUZPT3B5SnV1ZnNP?=
 =?utf-8?B?bUJKaUtHcVc5ak9JbHAwUWJCek5VUThDTGVYc1lueTcyUTFaZEtwSUxtanNL?=
 =?utf-8?B?eFN1ZUpkYnlRT0dBbWVlb25Na1ZTcHZRN3hxbEVncHU1RXFsek5QeGhya25D?=
 =?utf-8?B?VGdIU0dWdU4weGpqRnBvM1ZROTNIQk5UQ1kzcU5oMCt4VFBIK0tJRVZHR3Y2?=
 =?utf-8?B?M0ZoK0s5Q0NiNUN1emUzRHkySmNqSHpZMG1PL2g1ZDhzV3o5VHk4emFtZDZl?=
 =?utf-8?B?NHcwOFFvdmxkL0tGSjBxTEpGUGNKM0dab2xWdmhSelhDSmVKbmVpYURlZXpy?=
 =?utf-8?B?TndHb3kxckpFZGRYaGxwbTdvMnhFSlRuZ2FLT1VMcU9JZ3ZSUC9teXVXTTB0?=
 =?utf-8?B?SFd6QmtLTWQxMW0wNlZ6dWM4Y1QwTUZIQkxLSXREN2t2dzg1RTZsR2Vaamsy?=
 =?utf-8?B?Vy9NRkZ4bkRRQUhrOUphSEE4aDkwUHN4RmR6ak5MN0cxUEszWmp1eHpmbE9a?=
 =?utf-8?B?V2tPR3VHM3NNamFpR0oySTFnMGdXY040WHNic0V4V2RLdUMzQ2JBeDlrTk51?=
 =?utf-8?B?TER3MUZEK1pTOEV0MCtWejN1Mzg1L2FUYVp4NCsrcVgwZkUwYXdUbWFxalRD?=
 =?utf-8?B?eDVKTk5aemhmblFkd2JCQVp4L00xWFZ4dVV4VFBzRE1RYXVQL2tmaS9lT2tt?=
 =?utf-8?B?MkFLbGtTREFxbElseWMyV1pmdUp0aFRrWFY2ZHVXZFhqWkpWNURTODVRMWpW?=
 =?utf-8?B?cGhmUWtZd29ZWlVibE5QV1VlNHJiSXV1Wk9XSS94R1hKMDczWENrdWxYVFVj?=
 =?utf-8?B?ZDl3MGFRQ3d5bTFCNFR2Yklncnp4UjBHWTlpYk9WU3pXQzQ0aXJESm5CdCtK?=
 =?utf-8?B?aitzQjFGdmF5ZkV6RVpGdE1yWEIrT0MxaTMvclh6dUk3S2JJYVMvUFhpb0dF?=
 =?utf-8?B?VGdrdW5IUzBZMTVnbmZudElpYVhlQi9raXJCa2RocWtrc3FqRDdROUR2ZERR?=
 =?utf-8?B?aDF6WnZ4T3MwUGo2aU8wOHhqYjdRN1UzejlyTTFaYWpuMmdkK2tnWjVhVWdv?=
 =?utf-8?B?bWFOcitoQzNqa1Yvd3VCS2V3NUlGYktPbnFvaDRaMGpIN3BXT2lMem5XTXg4?=
 =?utf-8?B?RUtuSjNZa2xKZFZRbHNIQml5UVRGK3U1bHNFQVk1ajZHRUgxa0RKcHJncDhZ?=
 =?utf-8?B?NERXTkhaUXB2MXc5Y0xIam1JdUtGWkhTZGVqZS9hZzF2VVV2d2UwNldMalpy?=
 =?utf-8?B?QVVORFhWd0JoaUsvNzkxQXNzL25YVEdIbHZuMlZ2dnlGM0EweWQyM1pBSnR5?=
 =?utf-8?B?cVQ0UEsvK2R0bHY3cFIyczJtSWg2c3A2ODN5RjU2dVFVcDFtWm1tQllIZzc2?=
 =?utf-8?B?S0hBZnhNZzZrVVpDS3l3d05IVzRPWkxrS2wwTS8remQ0azdGK1J4TDgxVEFr?=
 =?utf-8?B?RXpQZ3hVc0l3MHk0bXhuSjM2cU1wNmdnUk5PUnNrSDladFh1WVVvSk1pcFhE?=
 =?utf-8?B?WWFhcHkyKzBwcEJkWm1wYTIxYmlyZkdmVytVZ0MzWVROK1JROWluei83WXQy?=
 =?utf-8?B?azY2SE5pNExXNTRGNzJFZHBocFZlL01UOFI3cm5RUDQ4aFZNVkh3aTlBMEVp?=
 =?utf-8?B?UzhWZFJMVnNmdDB3NitnSFpKd1FvdFZrMmpYZ2tUaWZxcGYrcU4zTjl0OVJC?=
 =?utf-8?B?b2I1bmNzeDQ4TnZvSTV3MWJydFV6eFhnbE9VS3FsZEoxWVlaUDNEVm1OaFpZ?=
 =?utf-8?B?QVlEWE9LT3VDdXNVbHhMZGpvNTRaRFNPNEJTQWpiM1Z2Uk1kY3BoZ1lCRmQr?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6693c03-1374-4540-5cd2-08dc4d7cd7bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:09:37.1801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhqWeU8c2n1J1ePrR/eHBGdA6Y4Y4nAj9ahUQFG6glf1Uzxt4ZlDkBRKei14g+r9eZsCDBu/T4TKHJpk0bHOpnXUKSJ6AvaDiG0S2diUoAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8013
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Previously, we limited BAR0 mapping to register space only because of
the potential conflict with wc mapping for the GTT region.
For gen12+ platforms, the size of BAR0 varies due to the different amount
of tile.
And as for gen11+ platforms, we can already map the whole BAR0 as uc,
so let's map the whole BAR0, without artificial limitations.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 lib/intel_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
index 4b6820787..31975727e 100644
--- a/lib/intel_mmio.c
+++ b/lib/intel_mmio.c
@@ -154,7 +154,7 @@ intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data, struct pci_device *pci
 
 	gen = intel_gen(devid);
 	if (gen >= 12)
-		mmio_size = 8 * 1024 * 1024;
+		mmio_size = pci_dev->regions[mmio_bar].size;
 	else if (gen >= 5)
 		mmio_size = 2 * 1024 * 1024;
 	else
-- 
2.34.1


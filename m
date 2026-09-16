Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF854C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9A410E170;
	Wed, 16 Sep 2026 11:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyW8aIrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2082210E170
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789559553; x=1821095553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=36gNkTS4J8RsWKykYDByq5UdoAwobiy8GOuM1ONfBf4=;
 b=cyW8aIrBGJKluenVL50OFOhPpvhAYPEr9+wvIHXIkFh1VTYo3bhiDpFG
 E340n+WURJFOu2PBLcv/TLgeJiAv7ToFcPJum3csDTbxFoF4JH1vIBkyv
 oIWXzpD8DfbJXqdBJR9SO56/cmZbm1a1hZeJdfWWqRj596oypEy+b/cpV
 7Ik6vnyVdjjvnJ2ic1RP/y5A3HNyKmQIVPHgPzsdAaANWEcHmr/Fx+1IN
 IvNfVmK+YCZLh6dquLuqEoWfKbePDXRna3gya6erIVyr+aqQlKYqgrbmh
 YU68IMFb6pGvSCj7aw8/3ZQYzxOxk2VYps2Da4JIKYXWDi+A23kqzx25V g==;
X-CSE-ConnectionGUID: ypbqbWymSvW50GgFe1Qtfg==
X-CSE-MsgGUID: Ly2uUk9YS46xGUTouwY7aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89803681"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89803681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:29 -0700
X-CSE-ConnectionGUID: IHrtws2WRTqYkoD2pQS4rw==
X-CSE-MsgGUID: X+5VhQfnSRSoZOUqq5shCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="303205201"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 04:52:28 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.25)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1EUCKpBrv3hVAxHZ3QU2+TB480zZZSog7t+bpxItRsG7bWUChPkzC401JudR7ltKwkvKxQCRlck0O63vsdSfGYLUrFUO6ExezWuAUmny1osUkBE/eoCybJo4psWLCc5TBvSY9ZPQUa5qnE4swWoymdSDB7UijiKvXF6QSr6GSrOSMiFChMmeocub2wM1zOn5gDB+rWqwdPZDaRvQ1KE28doU5y3/zARnmRFLO+LkVORMH5TF7VK1f8YjMAHo84kX1bsnunKtofmTOVShnrzaGxC57QYZ/9qL6i8UZWy/6j1sG0EN7eX1REx07EGPifYRhn3Qmdd2/33gRYS9nVeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCQzYl72G7AWOm9wGPdteBJCUGMvXbXds0HSjWTR04Q=;
 b=YseMPZHHX1oU9MlZVernYe2ta8PXOrkK1wnqWSKwWTakbGtjRc3nZmKnLTAcnLl6X4ywFDHKa3Y8cZr31AWU6CM+GPBBAhLJLS5lJhxFFd3mbyy/lgikmgq1fjTdecgdydFj0iZer0khucQzz4Twf5Fefd7ldD8ISztNpszi8HPmbadHhZibni1s+Y9ua9E+rakM8WAVqMw5NGTJG2RnWnv2Y//bjqbkQUQh1/A3TfoL5CUy6QcGln14i8ZDGSGwI2OeejUlwD6S5lKcRVAu6pJdyPmyY8QUoTRfJukUHGyWk6wQ2rSaKOzB18o9i11bzrEaTx8Zp9xr9O8h1A4yew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS4PPF821BFB4AC.namprd11.prod.outlook.com (2603:10b6:f:fc02::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 11:52:26 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 11:52:26 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 4/4] tests/sriov_pci_config: Add optional capability checks
Date: Wed, 16 Sep 2026 13:52:01 +0200
Message-ID: <20260916115201.1973752-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916115201.1973752-1-piotr.piorkowski@intel.com>
References: <20260916115201.1973752-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0338.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::8) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS4PPF821BFB4AC:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb0ae45-ab3c-403e-cf8a-08df13e8fa51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: lMxpsApYkMXoLzpz7tN9cVNlGL05MVZZdhY65k8T4jbTPkArdjtawSYysAfsFbuxSdN8opFSvvCkGSN46bLk0AW+r11Gxzr186QnOapbYC5nnnUjnLRZs5UTpmlVRWfDXzVLn0b5F2zplKQCP7U0aEmAPQvUA+ZDaSre9Li7eJTf1lZ8+Gt/RdaJpuReORfhVT9fUSo9PwPKcEkrD0EdgV5/68IrBJGayCuRphd0LuO43Brz4EODSFJPvxczDhTgWzZRNXTD+A/0/Lx3TgW0A+pdUEiOKeuIDlMIT4IxU1JJVqaGydYxIXV9B/Hlp8fsT6U320tVDT9znvpjleW8khyp22tDAd7iFos70qJVo34Mye/V2uaad+YqgLFPhBXvxy+pFZ/9pkj06zVJ252J3wDT9Qkkb1Bu/lPKjH/ZSjrnpYncR23pFAwSVgj3WWkrkhOp2OsMwZo3T7DNDxDHjQwCd4MHF9WvNJJAxE9irHM8+95MtSiVMMe4nld/lt7CqIYZPQ7iYlpF+k/teuH4Az3kKXXi0isIwUvxC8pSH5jr5WzTeqBv+kbr9GWk5VsWc7XI1rFapKzZxF5RLW696EZ4BYhaHVK+s9T6IrENazD3eES87DRlVUJ+AEHSKzDFPn9SEDbL412IqGflW/MO77gdcera4H2nqf0kAxmwrrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmZxOGdKeGc0cDdnTXRSUTF4TzJqdE9UeEZKaUJ4MXZ6V1h5QzZJNG5rUDMr?=
 =?utf-8?B?Y3YzN1FDcEFVelZBbS9ka0R6UytsSkRLRy9tdkxhN0NLdHMxRmlsN0V0dzJt?=
 =?utf-8?B?WG9xVTg1VHAyakxDbUptbHhjeHl6TUhpbTdHR01wdkpXcUkwekNqTXBKWnZC?=
 =?utf-8?B?RjR4dkxFTlZ6VWNhREF4UzZEUDMyM3VRMjRtY1k3YjRnajNOOHRacHBSVUk2?=
 =?utf-8?B?VjhGNFIzSG5zckNVVkNnTDRKOHlwUVhicTlOeDlMQmRUNVBQTGVUc0FBb04y?=
 =?utf-8?B?dnY1R3E0S3l2b09RRkJFWFVPTmdVS2I3ZHQ4YlhLM1BhR29ScklBaHVtVGVL?=
 =?utf-8?B?cm1FeG83QzA5K1MwQi92WmNtbitJSnRSa2VlMmZPVXV3Q0lwSXczeU9WK1F1?=
 =?utf-8?B?TXMyK0tmT2FKTFEwTjNIOTZTQVVZT1RuNHhQbktlRHh5TDVna1lhOURDZ0h5?=
 =?utf-8?B?YVZYMllFc2t4dmswQnRRUWdvYk9JckFldnROdFVRWk1VV2RNVmNVUHBZN1o2?=
 =?utf-8?B?dzdYUXlBVzRhalF3UGM2V3Rsci9UcVlzVXA1b3hzQllVM0JIc2RjWGcrS01k?=
 =?utf-8?B?eHdVampNVWFFOWtlZ0RIL2lnM0dKK0ozSmJjU0hGRzVyelU3RDg2N05sSm93?=
 =?utf-8?B?WlF1QmZKSGdjRGtlaDBZeWZQcnVVT1FqN2R3QlRRLy8wRm1QbXdqUlRrc2g2?=
 =?utf-8?B?VHZjbmRSSkVZOElhczZ0NnRRdlNnbzJvSnhZMlVDMW5abEVqMXRzYXZKY0tI?=
 =?utf-8?B?ZGdmV21TUmJ6enVBN1JsWGEwN0J3cHM1L1U0ZW4wdC9JSmxCbkxucmJ2UnZP?=
 =?utf-8?B?VmxQU3dHemIwd1Q3VmFVcG5VcDkreTdzTHU2YkFjbGpyS1FyRzJWK2kxVjkr?=
 =?utf-8?B?MkhrV2h6NUc0RHY5L280STZEazA0NnhGRmpPTEZONnh6VHJpcGUvSnN1QVYw?=
 =?utf-8?B?SzZrV3FjalJmOXZUSXNzWGIxSytMKzdtY2YrWk5md3B2L3VSSmtabW9Id0x6?=
 =?utf-8?B?S0taUUU4RkozWVVJelZPblJhbXNPeHRBcmVUdGZpeldMU3ZZK3N5T1ViaEJz?=
 =?utf-8?B?dysrS3Fvc2Q3ZHJOaGxUV1ZXT2wxdjNxOUx6aUM1cmNqNnNQeFBrTmJYbkI5?=
 =?utf-8?B?RDlUUDRwY0FOWXAzRnVvOGFEdURSQTdNRVJTZHEwNVFvcVhES1A3emJqODV0?=
 =?utf-8?B?cmhnV2VyQUF4dVQ2VnByZ2FLaXhtSmdSa1dpbmJWWStBcWx2bVJvMzV1WnhH?=
 =?utf-8?B?c2tSM0UwTGNoNEVreGh3QTA4bE5NMnplT29lRXNDTy9qcHdVbTlnOXh2N3ho?=
 =?utf-8?B?aEMzY1NUUGt3L3pXT0xyWURVNDRMY2phSU40NDQyUDVYK05GbnVUV1B1VURK?=
 =?utf-8?B?dDJTN0pJSm9oWjR0cHNreSt5RTBEVEczRTQ2anArZTVpaGVRYXhiOVIwUDZR?=
 =?utf-8?B?amRLZWcxcWM1RFJhK3hnbTdrek0rT1kzRHNpNUhGUmhkQldxbHhhNUdGNXNl?=
 =?utf-8?B?ZmkySk5Ca2lXUzRqdENYK2t4YUozSGdHY281bUxYaHVpN1A5NTZ0eFJEMjZq?=
 =?utf-8?B?aGFOUkhwOExpMGdISVJFWFRPSnRHeUV2eFREZnlwaGNwSVRlTXJxYzRGNUt5?=
 =?utf-8?B?bFdic2RFVEpYN0tDVEN5TVhUb05RRCtqMnBDbTFqM3g5K3ZZZW82QjRwcm5R?=
 =?utf-8?B?bW1NNHdidGZnTWxjWEF5Nk1ObXNUVW51MkNDNTAyeHp1RmRma0pHWE9kK2J0?=
 =?utf-8?B?NDF6cUZmdG1Id09ONzBCUTNvUmFkbE9ZOXp6cHMraHF4UWZpTHI5Z1M5VS9H?=
 =?utf-8?B?b2orU0cxM3lDRVp4U3hRdUFyRjFYSjgrSy9scVMvV1dQQURxYXN3dXVNdzRD?=
 =?utf-8?B?cFgwZWF4eWVMR1d2ZGpNRG9MZk03aVVBUzR5QVRrbjkxVWhkR21RK1FNSjJx?=
 =?utf-8?B?SkMwT3htY2dXcUg3TkQwWkJZSXpOR0RRMkNkWGt6N2dGcHljM2lBbStPamta?=
 =?utf-8?B?N3JqQTZ0QVdVNzRJM291cXpwU0s3bWxnK1l6dHIwZ0dXTmFxRkxPb29PeDFC?=
 =?utf-8?B?MmJIUkduTmRHMmh3M2FyS215dkZodVNZaExWWjBJOTJ1NmUrOUZFVUtGanJI?=
 =?utf-8?B?dmlpWHZDbWpuYmZQRWQyVnpKYVNxWXRRTU5lNWs1ZFNRcGpUWWF2YklwVDZR?=
 =?utf-8?B?VXZQdE54Q2Y1eDRKcy8zaGg5b0I1QXJsdFJjdEtXUVRxMEFMUmFQUTEwbHB0?=
 =?utf-8?B?K2lhVzNsUWlVSFhDQzVjNHR0MUtNMmpqVllwN1kva1BMSzZLcHQrZmQ5dzhR?=
 =?utf-8?B?TWlHQzduVzNKSmo0aE5ISWMvbkNKMk5BWC9xV0J6SVM0WFJTUTBmbldOSWhj?=
 =?utf-8?Q?9nTJ8+B1MD9VtEMs=3D?=
X-Exchange-RoutingPolicyChecked: Ah+kPibeMn83sqbJnuHqY7WN2E0LAMnX5EniFI/X4lzZMU1MiEkTfhNLfgu8+c88dgkHPB2bJq6r7x5adZj7F9Qrzqz4Y7QqnPMZyu2/GS6pAqL8MvDlAkF75pBGzEcQzXZJ5Nb99rhACPg8ZctlBmuQo7nEZbe6lWzIZQ0MByG1YOF9/R+qMN+3/i7o+THU2qZYGcdXCTD+Mus6kUGGefjuLl8RDhN9X/74sIV8R7foM3cWGOm7gqY7hI47TDyg8lXTWjB/gJ34n24XUKM1bTpKeXBESEZoRhwaEu+imSdrQJP1a8aFezK9U1mjANy7EbN7Kw+WScViPRJkZIEdjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb0ae45-ab3c-403e-cf8a-08df13e8fa51
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:52:26.3764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/nYAG0sE35N/6BN3gEWXdTOyG0+MQ44G0w9ZnXD4bktaMxkRBWnlRruWgi6Gauv5fhdQnsWIcdO1YqFvqoKPMo2IzPOSZlOpP4aphpRGfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF821BFB4AC
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

Add subtests for the optional Power Management, Advanced Error
Reporting, and Address Translation Service capabilities.
Skip an optional-capability subtest when the capability is not exposed
by the VF.
Validate the VF ROZ fields required by the SR-IOV specification,
including Power Management Data Select/Data, AER status/mask/severity
fields, and ATS Queue Depth/STU.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GPT-5.6 Luna
---
 tests/sriov_pci_config.c | 118 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
index 9f8fd9fb50..590a9cd7e5 100644
--- a/tests/sriov_pci_config.c
+++ b/tests/sriov_pci_config.c
@@ -38,6 +38,21 @@
  * Description: Validate that the Current De-emphasis Level field in Link
  * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
  * and later.
+ *
+ * SUBTEST: vf-power-management-capability
+ * Description: Validate that Data Select in Power Management Control and
+ * Power Management Data are ROZ and therefore read as zero when the optional
+ * Power Management capability is present.
+ *
+ * SUBTEST: vf-advanced-error-reporting
+ * Description: Validate that the specified ROZ bits in AER Uncorrectable
+ * Error Status, Mask, and Severity, and Correctable Error Status read as zero
+ * when the optional AER capability is present.
+ *
+ * SUBTEST: vf-ats-capability
+ * Description: Validate that ATS Queue Depth and the Smallest Translation Unit
+ * (STU) are ROZ and therefore read as zero when the optional ATS capability
+ * is present.
  */
 
 IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
@@ -183,6 +198,88 @@ static void check_vf_pcie_capabilities_2(const uint8_t *config)
 		     lnksta2);
 }
 
+static int get_optional_cap(const uint8_t *config, uint8_t cap_id, const char *name)
+{
+	int cap = igt_pci_config_raw_find_cap_offset(config, cap_id);
+
+	igt_assert_f(cap >= 0, "Invalid VF PCI capability list (%d)\n", cap);
+	if (!cap)
+		skip_vf_test(name);
+
+	return cap;
+}
+
+static int get_optional_ext_cap(const uint8_t *config, uint16_t cap_id, const char *name)
+{
+	int cap = igt_pci_config_raw_find_ext_cap_offset(config, cap_id);
+
+	igt_assert_f(cap >= 0, "Invalid VF extended capability list (%d)\n", cap);
+	if (!cap)
+		skip_vf_test(name);
+
+	return cap;
+}
+
+static void check_vf_power_management_capability(const uint8_t *config)
+{
+	int pm_cap = get_optional_cap(config, PCI_CAP_ID_PM,
+				     "Power Management capability is not present");
+	uint16_t pm_ctrl = igt_pci_config_raw_read_u16(config, pm_cap + PCI_PM_CTRL);
+	uint8_t pm_data = config[pm_cap + PCI_PM_DATA];
+
+	igt_info("Checking optional Power Management capability\n");
+	igt_assert_f(!(pm_ctrl & PCI_PM_CTRL_DATA_SEL),
+		     "Power Management Control: Data Select must be zero (0x%04x)\n", pm_ctrl);
+	igt_assert_f(!pm_data, "Power Management Data: expected 0x00, got 0x%02x\n", pm_data);
+}
+
+static void check_vf_advanced_error_reporting(const uint8_t *config)
+{
+	const uint32_t uncor_roz = PCI_ERR_UNCOR_DLP | PCI_ERR_UNCOR_SURPDN |
+				   PCI_ERR_UNCOR_FCP | PCI_ERR_UNCOR_RO |
+				   PCI_ERR_UNCOR_MALF_TLP | PCI_ERR_UNCOR_ECRC;
+	const uint32_t cor_roz = PCI_ERR_COR_RCVR | PCI_ERR_COR_BAD_TLP |
+					 PCI_ERR_COR_REP_ROLL | PCI_ERR_COR_REP_TIMER;
+	int aer_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ERR,
+					   "Advanced Error Reporting capability is not present");
+	uint32_t uncor_status = igt_pci_config_raw_read_u32(config,
+							     aer_cap + PCI_ERR_UNCOR_STATUS);
+	uint32_t uncor_mask = igt_pci_config_raw_read_u32(config,
+							   aer_cap + PCI_ERR_UNCOR_MASK);
+	uint32_t uncor_severity = igt_pci_config_raw_read_u32(config,
+							       aer_cap + PCI_ERR_UNCOR_SEVER);
+	uint32_t cor_status = igt_pci_config_raw_read_u32(config,
+							   aer_cap + PCI_ERR_COR_STATUS);
+
+	igt_info("Checking optional Advanced Error Reporting capability\n");
+	igt_assert_f(!(uncor_status & uncor_roz),
+		     "AER Uncorrectable Error Status: VF ROZ bits are set (0x%08x)\n",
+		     uncor_status);
+	igt_assert_f(!(uncor_mask & uncor_roz),
+		     "AER Uncorrectable Error Mask: VF ROZ bits are set (0x%08x)\n",
+		     uncor_mask);
+	igt_assert_f(!(uncor_severity & uncor_roz),
+		     "AER Uncorrectable Error Severity: VF ROZ bits are set (0x%08x)\n",
+		     uncor_severity);
+	igt_assert_f(!(cor_status & cor_roz),
+		     "AER Correctable Error Status: VF ROZ bits are set (0x%08x)\n",
+		     cor_status);
+}
+
+static void check_vf_ats_capability(const uint8_t *config)
+{
+	int ats_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ATS,
+					   "ATS capability is not present");
+	uint16_t ats_capability = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CAP);
+	uint16_t ats_control = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CTRL);
+
+	igt_info("Checking optional ATS capability\n");
+	igt_assert_f(!(ats_capability & PCI_ATS_CAP_QDEP),
+		     "ATS Capability: Queue Depth must be zero (0x%04x)\n", ats_capability);
+	igt_assert_f(!(ats_control & PCI_ATS_CTRL_STU),
+		     "ATS Control: STU must be zero (0x%04x)\n", ats_control);
+}
+
 int igt_main()
 {
 	igt_fixture() {
@@ -218,6 +315,27 @@ int igt_main()
 		with_vf_config(check_vf_pcie_capabilities_2);
 	}
 
+	igt_describe("Validate that Data Select in Power Management Control and "
+		     "Power Management Data are ROZ and therefore read as zero when the "
+		     "optional Power Management capability is present");
+	igt_subtest("vf-power-management-capability") {
+		with_vf_config(check_vf_power_management_capability);
+	}
+
+	igt_describe("Validate that the specified ROZ bits in AER Uncorrectable "
+		     "Error Status, Mask, and Severity, and Correctable Error Status "
+		     "read as zero when the optional AER capability is present");
+	igt_subtest("vf-advanced-error-reporting") {
+		with_vf_config(check_vf_advanced_error_reporting);
+	}
+
+	igt_describe("Validate that ATS Queue Depth and the Smallest Translation Unit "
+		     "(STU) are ROZ and therefore read as zero when the optional ATS "
+		     "capability is present");
+	igt_subtest("vf-ats-capability") {
+		with_vf_config(check_vf_ats_capability);
+	}
+
 	igt_fixture() {
 		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
 		igt_sriov_disable_vfs(pf_fd);
-- 
2.34.1


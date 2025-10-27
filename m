Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65A1CCF9EB
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 16:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB9F10E4F2;
	Mon, 27 Oct 2025 16:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZdy7Zx0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7A610E4F4
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761581708; x=1793117708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qN6K9Gv4np54G9yTIQzvG/nccm3g/K4OTHh5c/R2UFM=;
 b=bZdy7Zx0vIVtKxmwnwz1pTPQV1cZg9frMFjf0k6TI7SdQK+bOdMl4Qyx
 btDv/5jhDCoQxUfGNfBUWeqqIvuTZ1t8q67f4ma2qjTeoSynjzW9K2fCV
 zctyW15Mzru/uRoWoIwiBDW9Mn4jn5HQQoDXxGXkI5gf8ilzrSPZiGRY0
 UVLGIqixLFzqc8Fo+9z1WcVAeYy/ixUMnZHe2W+LooeWBDdpRScw1j0p6
 xGW0EDP8zgctkyjsy1NIk/jPEo/bM55k+KKhp4QTn0aHnpOc0R88STomb
 f0ZnMNmRwTFxtYGjRzix3dFyTaakKBYEX8RJ02OdrivniPq2Qi0wmBxWP Q==;
X-CSE-ConnectionGUID: lMksr/BQQWqhwNc93pFyFg==
X-CSE-MsgGUID: +Y5LPlAnSmybGU9v5v9s3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67501033"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67501033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:15:07 -0700
X-CSE-ConnectionGUID: hhorXov5TFCJdvH99latWQ==
X-CSE-MsgGUID: kv83FUAFR8iMRSXhZLu95w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="215737591"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:15:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:15:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:15:06 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9xUPTMLea/UWNR0aDdtvw8i3hLX/8ISuHz3JVt9GLALu9u6QJxmO8EmtPteMMAKHP+xQMiZk35+ZAFE4xOEDBdCla907VeGDy1AvsEe/GrZ8UonUbsR0pqLu4QGw3Nuc9rw6x354sZe+PHx0rg6Qv1Euqcut0Wi2ka2ktc2YJ2bsFIoENs9zN8kXFNHtNqSsemXAcg5xbr+CVE9FYoXl2jsXXiYP1MyUf2Bf/d4y7Ob4Q38HtD9AdX5yylJpLotiz96tCnFA4rXo1u4Bh013CruLvG5yMFoRAb8x6POagvoTddInRUj/FgZQx3JFxpc7cp1sIBQCrsIZC/rvUNaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HHIvsuAmzcouVjlkt3XFFs+qykc68tJ6nt1X1X1/+w=;
 b=h2m7gngENQVcOOQ9SAJL04UamFGGgTVsF5uVKHJnA+dr4+F1cKp0ZR15SxUSujlY05pIIEv2/YHMHfUKd42dhWfFDY7EOhDzDP4jIs2T7VeUaZkSe2d/iZ2IU5XJ/+mjxFpPAhRp4J+mg6v+ws4rWb0f1zy83yLved3GyOIcR4k6Teov+VFEAFyIpWO1DIlT8VXPwveY2GaXszZL0bJCQWN9i2tbwjC2B00J+O/p1uaD0S1CUlsHyRv3d8lOXyeTuPSVbqX6XYHb021fqbvS3CbRSw+QGsTLd7OhU25WqhaaLZ4YQoMwPrt3lzgssE6b8i/lynGil4qDBSODAu149g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 27 Oct
 2025 16:15:03 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:15:03 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 3/3] tests/xe_sriov_flr: extend VF FLR test for multi-tile
 Xe devices
Date: Mon, 27 Oct 2025 17:14:40 +0100
Message-ID: <20251027161440.2906378-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027161440.2906378-1-piotr.piorkowski@intel.com>
References: <20251027161440.2906378-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0106.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::35) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec5a5d1-8ec8-4deb-45d5-08de1573fc8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWh1OWlzbWdNOUhFOXJOTDVRd2FRQjhzdTFwS1VHdmlSMFpiT1NOTUdVV0hB?=
 =?utf-8?B?VSs2aStsYmpsUStrazdGSVhubFhBdGloMnZSQ3ZsQ3VVT1RSdE1GcFJFM2h1?=
 =?utf-8?B?RTZkZU10aGt6WlcvOEtodFBRYUNLamFFZDdPcXJFQU9wbUFIWTZCL0NjdHNZ?=
 =?utf-8?B?cjBVQkxud2kray90bXU3NitwNE5URnZxVnFIVzlyYWZObHc0ZFd0emlvRWV0?=
 =?utf-8?B?Vlh2aFRSVG8wa2R5S2NDcVZhMkpzSHNTZVk5dUx2MUx3UDZseXBPMVJwNm54?=
 =?utf-8?B?b2JsbTR6WTFvOW1VcHlkNlU4d3dieUpHdU1ScU9UenNwSjZiUkJGd1lBT1lG?=
 =?utf-8?B?QWRMT1ZzZ0dpRkV4L1JBS2ExZlF5VjdpalBLMUErTTlid0EvL3dIYzIzVnlq?=
 =?utf-8?B?dGgyUjlCNHIxdUREblhMQWZRVWtkbXljMVpSdWpHclRKODNCYXE2dHhEYnFM?=
 =?utf-8?B?VlVJcGIvdmJzbTBGT1JCdmxqaEFmanJCeEg1c1NrWklsY3BpSlA1Z3pkUTAz?=
 =?utf-8?B?UTJmZFJjV3RmWEF3K1hMZmlQME5yTTRkOW45MVRJU3FCODdlM0xoa1ZFT2Ja?=
 =?utf-8?B?aEM1eG9TVytUNFdGSnVZaS9aTEdZdGFXMnBoOVRJQ1ZZVkoyNG1NdmFqZ0Jn?=
 =?utf-8?B?czJQOWtISjRtcE85SElsaHliZFlkNDFmNFVPTGlNQlRxL1h2UW1ZL0RiMGpp?=
 =?utf-8?B?TzNIZlJTUU5admtQOHhJQjFRelZHdkx2UUxEMXhQMEdGTXVwSXd3S004VEti?=
 =?utf-8?B?M20xU0szMDBNMFlQSUdzM09zU0ZOSHRxVkRJdXdTVmVVTE5MeDJ4ZWVxaWMw?=
 =?utf-8?B?Z3kwOHNrdWVIWndpNTNsY1JFN25HWkdQWnpSUENmdmtVN2tEQ2tjS25vaCtD?=
 =?utf-8?B?SEFhM2NiYzd6cE5GV242b1poYWc5NDlGZDRRNjFFRjB6QXR1MGQ1MVgxd251?=
 =?utf-8?B?RmJ0elhjVVVYU1gwbnpBNXIxb0hqTXdqUTk2SFk0VnFCQS84U1RUN0VQMGZZ?=
 =?utf-8?B?cndubmdJeXozaGFZTjlIaEk0VUZYUzU3YStUSWh2eU5EUTU2ZFhCNTltc3hZ?=
 =?utf-8?B?RldqbmRXMWU5YlV1TzNBRTZCTTBuU0JhN2lqbFJUYmZLT3pkNVdUSjBYbWVt?=
 =?utf-8?B?TFppcjJ3bkdZRkdVemV1ODZzYXJBVEttVy8vQ3RURW43aFozcjVjZk1PNXBI?=
 =?utf-8?B?SWt6YUFYTi9HL2dzaDNGV3NZQTZNdHB4M1MwUkJxVWJkREY3NVNQZ25oU00v?=
 =?utf-8?B?RzFOQnQyRjA1eWRweGRLREZyUVp6cE83UlBXTWpnejlSUXBJV002Y0YraTlr?=
 =?utf-8?B?ekhkQmFUdlpmVXFlbHBsTUFPTXByUldHdzV5bjVmWVhiaFRXWkEvdHRZbkth?=
 =?utf-8?B?WER0c0NqekRoTmhvUnpVamZHbUJ6a2V6RGo2bVEzQVNSL0xTUVBmYUNndFl5?=
 =?utf-8?B?SG9DLzhhbmRhUFU3RlVnZmIxOWY4bEpNQk1DWGhnaUZ5U3FTSCsrMllWbmVS?=
 =?utf-8?B?OU1rY3RJM2xRbm8wSTk2NWx6UmJVbUNrQzQybDFZYldLdmVjbnpjencvbU5o?=
 =?utf-8?B?dWw5MnVhUE9EelA4TUJ4WHpjbGNobjhjcFhlTVRtN1dOa3JwUW5tM2VoSU8z?=
 =?utf-8?B?blJjU0cvakVSN2lCZEhyVDZhSFNzbXdDbmZseTdtR3lFMnBPZVZyeTd0OW1O?=
 =?utf-8?B?OXpUNG1vd0UvN0EvajZ3Z0FUSVhHaklQSDlDdGdyd1NQV1dQakhYN3NMaS9y?=
 =?utf-8?B?ZkNZOVdpT2lMem9SRHNNOUgzZUJ4d1FRMkpTZUVYSHVyRmpJNi9kcE9WVGRj?=
 =?utf-8?B?Z2ZNTUtSZmozUnVMbWdKb0U2Wk03dTZxNWo4cXlKcEtHZVc2RlF1Ly9pTnhN?=
 =?utf-8?B?MmlKRDdrZDdkL0p2TC9FdURXb096cmJhQ1VFbngrdGpWY1JsaUJ4RnVzRkhz?=
 =?utf-8?Q?ieFVHkja5ZExuM+VSulVpNzPkaXWvw4M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE1qZjBZVzlDQTkwMGZ4N3orNXFxMXRVczl2V0xsU3dBNnlVdDJ0aGYxM2dC?=
 =?utf-8?B?Tnc5RWw4Z1czU1U3Mk5oTG1Jd2dzZzV3Tmk2TUo1SldINmZoOVZoSlBta2xk?=
 =?utf-8?B?VWtlWUhVMWtiTHR0a0hzWVJCR1RrMXRjQy83NEVqOVlTbWIwYWNZQ1JuTWFm?=
 =?utf-8?B?Z1FCTlp2S1V1SEwvUW1FK3BSdE4yam41WlN2Y2V6Z0cxOUZJaGVONXhQYk5H?=
 =?utf-8?B?M0xKWXFrOVZRb294bVorVEdPcGtPZkcwUU9TSVUzYXR3a3BuQXR2SFNiVEZI?=
 =?utf-8?B?Ny8xTU1CMHRDaWJrNzZLVm00ckRaUGhxNjdUNTZkZVcrZ1llamVRSCtMaDFQ?=
 =?utf-8?B?SytTVjlza01lU3JrMjEyWFZUVnZOOXEwSEpDQ28zL3ZTem9YM1lvMDh3U1Q1?=
 =?utf-8?B?TklLWHBTYkVGWlFsVEhkOGFXdXJQaXYrTTY2SVFBOWJERW9DZW43TzN4cUZ1?=
 =?utf-8?B?cGVjODZWSk5oU244MFVId3l6dk5SNEhRNnd6ZFJpS0FNVE1iVlNFSGJVeU9H?=
 =?utf-8?B?QVN5SXVEZDc4cFFWbVc3RTZaZXBISTU0QmxLcllmK3h1VWlYQlpnOW0xQnRM?=
 =?utf-8?B?V3V3eS9na2tHWWJ2RmJ5MWlNSWtxclBET2s3c0ZXTC9WQ05RZ255cDJPR1R6?=
 =?utf-8?B?ZnZYMUZGa2JzYW0zZW9WMit4bG9uQnM3RlF4OFpPb3VYMUNqbGFKV2x6WHVO?=
 =?utf-8?B?R3dkZ21xb3NWajZGU05BUEhGcC9mL2tndmQvQnJWVlpVcUxwRG9Ybkp1ekth?=
 =?utf-8?B?bThPMm9xMjJ6RUF4cnVnNmhTVWdNell5UVdyeHZuQmFlYkpnRFBjbzNQYVcy?=
 =?utf-8?B?cG1nejdpN2pQVTN5OER6dkpBUTlHcWNpcGovVnF3dXVNSFkrcTBtdlUyZEhX?=
 =?utf-8?B?OGhFTkdrMHlhWVhpMFllODBiVCtVRUovNkdvd1NUdVVFNENqY2k0NUZISHJm?=
 =?utf-8?B?UE1pN0hLbzYzTkxMTWM2djIrVlhKS2pmSUdPcS9paVlXNGdPMlhQWnY1K1hk?=
 =?utf-8?B?Q3JWbDVKM3cxWnZFb1dKQUkxWTVXcHZQNmxNc2Z1b0JhN0RpbnZxNU1sbVlz?=
 =?utf-8?B?UjdRUFFPVmZIZm91VDM1bzhaUHR4S3NYbWpYaWkxUXB4Vk5KV1pFZE9OUUYx?=
 =?utf-8?B?cE1KZTgrU1dvZjdpb0tWMmVpSGM5S2pDeVpPazRoVlBQMDl2ak5sbVRTaE5p?=
 =?utf-8?B?OHpRcnVTVkkvQUVLaUQ3MDQwQ3JzRVlXNFJtbmZaaFFQNjB5QzJRRGJtVDA1?=
 =?utf-8?B?dS9FTzRIRFVoaDZ3cUpOZGRxaldaSjJJQXR2K3E5SWxwbjk1SHNOeUdraGtX?=
 =?utf-8?B?WkFHejkxT3FHdkxlUG4vWlpySEt1Rnl3cHF5S2ZjdVdNeXMrbk9Fc0xoeDlE?=
 =?utf-8?B?cUVkck1ZMEpVbE9QZ0FwMUJCUEF4TWlNSFVvaEVKL3dnaHZOcXRtSk9SMDlV?=
 =?utf-8?B?TlhmQ09qMUVJVHlhZnlBRWhJblROckI1SDR3Qi9xNHMzNnVGbEJYRTd6N1dB?=
 =?utf-8?B?R0lRRDhJdkQ5RjVwa01CNWxwMHNJMmdHcllaTkNJZVB4bG4vcVNvczZGUlA0?=
 =?utf-8?B?RXluTmdibFMwWnBmYW1sUWZqUy9CU0FNa3BBMmtnUExsZkdLbWxEY3FuKy9s?=
 =?utf-8?B?QWNkZEJGbEtydkdHWDR4aFk4SzRxTHRaK3BYSUhRNHhVN3hMcmdkc0Jyb3ds?=
 =?utf-8?B?ZFg5VjBsM3ZQRHpDNmpJOEo1R00zWjEzN3N3d01UU0FTakkwWlBmdXJSYVZB?=
 =?utf-8?B?ZzFTbXZQN05lWWNISVpkS1BmTWRoWktIUXlQSUY5eU40M0dsU0NNTjJlOTVR?=
 =?utf-8?B?WGJBc2RLVm9vM3Z0YjQrbmJDVEQrd2lWY1ErTnVLNUE0U3dzY2JrbFFHOUla?=
 =?utf-8?B?OXdWV2s0SWF5Vm1SUGY2RUhnR1lUVVVRaGdMUWJ0Tm1PcGdCRmNEOWc0M3lV?=
 =?utf-8?B?dkx5aGRVdkdhdk5DeXRWQ1RNTnhNaC9BUU9xZHhBUyt0SVg2Q0lJeEtEYUQ4?=
 =?utf-8?B?MXlFL0p5d3RBQ0szTFRjMGtYQ25QYXhkUURPbUc2dlkxQXVPVnMya1paUGw3?=
 =?utf-8?B?SG80cnI4SHZ2clVmMmhma0wzcjgzclB3VzkrbFkwRkNRL293Slo0eHFaYkhM?=
 =?utf-8?B?ZTMyWWw1R29aS3UrR0NIZkVac3YyYTlHNDUzN1NQOURSemYvRTdvMzUvam1y?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec5a5d1-8ec8-4deb-45d5-08de1573fc8f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:15:03.8371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXUGh840VbBcu/kwZsDA7F5ToD92s1sVJ0+e7/ItIJIx9MFR8v2gFx70RO5olBvUY8lm8raByz9MXadvsInsPYILxMmeCBxqS2qEQXE488E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

Let's introduce tile-level iteration and per-tile resource management
for GGTT, LMEM, and register subchecks.

Key updates:
 - Add xe_number_tiles() and xe_tile_get_main_gt_id() helpers.
 - Introduce xe_for_each_tile() macro for tile iteration.
 - Refactor subcheck callbacks to include tile-aware arguments.
 - Replace GT-based logic with per-tile handling for GGTT and LMEM.

v2:
 - define separate data for each tile in subcheck
 - report the result for each tile separately
 - use igt_hweight instead__builtin_popcountll

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/xe/xe_query.c          |  45 +++
 lib/xe/xe_query.h          |   6 +
 tests/intel/xe_sriov_flr.c | 558 ++++++++++++++++++++-----------------
 3 files changed, 359 insertions(+), 250 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980..13391bd02 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -515,6 +515,22 @@ unsigned int xe_dev_max_gt(int fd)
 	return igt_fls(xe_dev->gt_mask) - 1;
 }
 
+/**
+ * xe_number_tiles
+ * @fd: xe device fd
+ *
+ * Return number of tiles for xe device fd.
+ */
+uint8_t xe_number_tiles(int fd)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	return igt_hweight(xe_dev->tile_mask);
+}
+
 /**
  * all_memory_regions:
  * @fd: xe device fd
@@ -995,6 +1011,35 @@ uint16_t xe_gt_get_tile_id(int fd, int gt)
 	return xe_dev->gt_list->gt_list[gt].tile_id;
 }
 
+/**
+ * xe_tile_get_main_gt_id:
+ * @fd: xe device fd
+ * @tile: tile id
+ *
+ * Returns main GT ID for given @tile.
+ */
+uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile)
+{
+	struct xe_device *xe_dev;
+	int gt_id = -1;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	for (int i = 0; i < xe_dev->gt_list->num_gt; i++) {
+		const struct drm_xe_gt *gt_data = &xe_dev->gt_list->gt_list[i];
+
+		if (gt_data->tile_id == tile && gt_data->type == DRM_XE_QUERY_GT_TYPE_MAIN) {
+			gt_id = gt_data->gt_id;
+			break;
+		}
+	}
+
+	igt_assert_f(gt_id >= 0, "No main GT found for tile %d\n", tile);
+
+	return gt_id;
+}
+
 /**
  * xe_hwconfig_lookup_value:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 715b64e2f..25f115ae5 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -86,6 +86,10 @@ struct xe_device {
 	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
 	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
 	     igt_unique(__mask) &= ~(1ull << __gt))
+#define xe_for_each_tile(__fd, __tile) \
+	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
+	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
+	     igt_unique(__mask) &= ~(1ull << __tile))
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
 	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
 		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
@@ -101,6 +105,7 @@ struct xe_device {
 
 unsigned int xe_number_gt(int fd);
 unsigned int xe_dev_max_gt(int fd);
+uint8_t xe_number_tiles(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
@@ -135,6 +140,7 @@ uint16_t xe_gt_type(int fd, int gt);
 bool xe_is_media_gt(int fd, int gt);
 bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
+uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 077ed15af..cf9422176 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -53,7 +53,9 @@
 
 IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
 
-const char *SKIP_REASON = "SKIP";
+#define STOP_REASON_ABORT "ABORT"
+#define STOP_REASON_FAIL "FAIL"
+#define STOP_REASON_SKIP "SKIP"
 
 /**
  * struct subcheck_data - Base structure for subcheck data.
@@ -66,8 +68,6 @@ const char *SKIP_REASON = "SKIP";
  * @pf_fd: File descriptor for the Physical Function.
  * @num_vfs: Number of Virtual Functions (VFs) enabled and under test. This count is
  *           used to iterate over and manage the VFs during the testing process.
- * @gt: GT under test. This identifier is used to specify a particular GT
- *      for operations when GT-specific testing is required.
  * @stop_reason: Pointer to a string that indicates why a subcheck should skip or fail.
  *               This field is crucial for controlling the flow of subcheck execution.
  *               If set, it should prevent further execution of the current subcheck,
@@ -79,12 +79,11 @@ const char *SKIP_REASON = "SKIP";
  * Example usage:
  * A typical use of this structure involves initializing it with the necessary test setup
  * parameters, checking the `stop_reason` field before proceeding with each subcheck operation,
- * and using `pf_fd`, `num_vfs`, and `gt` as needed based on the specific subcheck requirements.
+ * and using `pf_fd` and `num_vfs` as needed based on the specific subcheck requirements.
  */
 struct subcheck_data {
 	int pf_fd;
-	int num_vfs;
-	int gt;
+	unsigned int num_vfs;
 	char *stop_reason;
 };
 
@@ -100,37 +99,47 @@ struct subcheck_data {
  *
  * @name: Name of the subcheck operation, used for identification and reporting.
  *
+ * @alloc: Allocate resources for the subcheck.
+ *   @param data: Shared data needed for allocation.
+ *   @param tile: Tile index for multi-tile devices.
+ *   @param num_vfs: Number of VFs enabled on the PF.
+ *
  * @init: Initialize the subcheck environment.
  *   Sets up the initial state required for the subcheck, including preparing
  *   resources and ensuring the system is ready for testing.
  *   @param data: Shared data needed for initialization.
+ *   @param tile: Tile index for multi-tile devices.
  *
  * @prepare_vf: Prepare subcheck data for a specific VF.
  *   Called for each VF before FLR is performed. It might involve marking
  *   specific memory regions or setting up PTE addresses.
- *   @param vf_id: Identifier of the VF being prepared.
  *   @param data: Shared common data.
+ *   @param tile: Tile index for multi-tile devices.
+ *   @param vf_id: Identifier of the VF being prepared.
  *
  * @verify_vf: Verify the state of a VF after FLR.
  *   Checks the VF's state post FLR to ensure the expected results,
  *   such as verifying that only the FLRed VF has its state reset.
+ *   @param data: Shared common data.
+ *   @param tile: Tile index for multi-tile devices.
  *   @param vf_id: Identifier of the VF to verify.
  *   @param flr_vf_id: Identifier of the VF that underwent FLR.
- *   @param data: Shared common data.
  *
  * @cleanup: Clean up the subcheck environment.
  *   Releases resources and restores the system to its original state
  *   after the subchecks, ensuring no resource leaks and preparing the system
  *   for subsequent tests.
  *   @param data: Shared common data.
+ *   @param tile: Tile index for multi-tile devices.
  */
 struct subcheck {
-	struct subcheck_data *data;
+	struct subcheck_data **data;
 	const char *name;
-	void (*init)(struct subcheck_data *data);
-	void (*prepare_vf)(int vf_id, struct subcheck_data *data);
-	void (*verify_vf)(int vf_id, int flr_vf_id, struct subcheck_data *data);
-	void (*cleanup)(struct subcheck_data *data);
+	void (*alloc)(struct subcheck_data *data, uint8_t tile, unsigned int num_vfs);
+	void (*init)(struct subcheck_data *data, uint8_t tile);
+	void (*prepare_vf)(struct subcheck_data *data, uint8_t tile, int vf_id);
+	void (*verify_vf)(struct subcheck_data *data, uint8_t tile, int vf_id, int flr_vf_id);
+	void (*cleanup)(struct subcheck_data *data, uint8_t tile);
 };
 
 __attribute__((format(printf, 3, 0)))
@@ -154,12 +163,12 @@ static void set_stop_reason_v(struct subcheck_data *data, const char *prefix,
 }
 
 __attribute__((format(printf, 2, 3)))
-static void set_skip_reason(struct subcheck_data *data, const char *format, ...)
+static void set_abort_reason(struct subcheck_data *data, const char *format, ...)
 {
 	va_list args;
 
 	va_start(args, format);
-	set_stop_reason_v(data, SKIP_REASON, format, args);
+	set_stop_reason_v(data, STOP_REASON_ABORT, format, args);
 	va_end(args);
 }
 
@@ -169,22 +178,36 @@ static void set_fail_reason(struct subcheck_data *data, const char *format, ...)
 	va_list args;
 
 	va_start(args, format);
-	set_stop_reason_v(data, "FAIL", format, args);
+	set_stop_reason_v(data, STOP_REASON_FAIL, format, args);
 	va_end(args);
 }
 
-static bool subcheck_can_proceed(const struct subcheck *check)
+__attribute__((format(printf, 2, 3)))
+static void set_skip_reason(struct subcheck_data *data, const char *format, ...)
 {
-	return !check->data->stop_reason;
+	va_list args;
+
+	va_start(args, format);
+	set_stop_reason_v(data, STOP_REASON_SKIP, format, args);
+	va_end(args);
+}
+
+static bool subcheck_can_proceed(const struct subcheck *check, uint8_t tile)
+{
+	return !check->data[tile]->stop_reason;
 }
 
 static int count_subchecks_with_stop_reason(struct subcheck *checks, int num_checks)
 {
 	int subchecks_with_stop_reason = 0;
+	int pf_fd = checks[0].data[0]->pf_fd;
+	uint8_t tile;
 
-	for (int i = 0; i < num_checks; ++i)
-		if (!subcheck_can_proceed(&checks[i]))
-			subchecks_with_stop_reason++;
+	xe_for_each_tile(pf_fd, tile) {
+		for (int i = 0; i < num_checks; ++i)
+			if (!subcheck_can_proceed(&checks[i], tile))
+				subchecks_with_stop_reason++;
+	}
 
 	return subchecks_with_stop_reason;
 }
@@ -194,29 +217,34 @@ static bool no_subchecks_can_proceed(struct subcheck *checks, int num_checks)
 	return count_subchecks_with_stop_reason(checks, num_checks) == num_checks;
 }
 
-static bool is_subcheck_skipped(struct subcheck *subcheck)
+static bool is_subcheck_skipped(struct subcheck *subcheck, uint8_t tile)
 {
-	return subcheck->data && subcheck->data->stop_reason &&
-	       !strncmp(SKIP_REASON, subcheck->data->stop_reason, strlen(SKIP_REASON));
+	return subcheck->data && subcheck->data[tile]->stop_reason &&
+	       !strncmp(STOP_REASON_SKIP, subcheck->data[tile]->stop_reason,
+			strlen(STOP_REASON_SKIP));
 }
 
 static void subchecks_report_results(struct subcheck *checks, int num_checks)
 {
 	int fails = 0, skips = 0;
-
-	for (int i = 0; i < num_checks; ++i) {
-		if (checks[i].data->stop_reason) {
-			if (is_subcheck_skipped(&checks[i])) {
-				igt_info("%s: %s", checks[i].name,
-					 checks[i].data->stop_reason);
-				skips++;
+	int pf_fd = checks[0].data[0]->pf_fd;
+	uint8_t tile;
+
+	xe_for_each_tile(pf_fd, tile) {
+		for (int i = 0; i < num_checks; ++i) {
+			if (checks[i].data[tile]->stop_reason) {
+				if (is_subcheck_skipped(&checks[i], tile)) {
+					igt_info("Tile%d %s: %s", tile, checks[i].name,
+						 checks[i].data[tile]->stop_reason);
+					skips++;
+				} else {
+					igt_critical("Tile%d %s: %s", tile, checks[i].name,
+						     checks[i].data[tile]->stop_reason);
+					fails++;
+				}
 			} else {
-				igt_critical("%s: %s", checks[i].name,
-					     checks[i].data->stop_reason);
-				fails++;
+				igt_info("Tile%d %s: SUCCESS\n", tile, checks[i].name);
 			}
-		} else {
-			igt_info("%s: SUCCESS\n", checks[i].name);
 		}
 	}
 
@@ -269,10 +297,11 @@ typedef int (*flr_exec_strategy)(int pf_fd, int num_vfs,
  * A timeout is used to wait for FLR operations to complete.
  */
 static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
-		       int num_checks, flr_exec_strategy exec_strategy)
+		       size_t num_checks, flr_exec_strategy exec_strategy)
 {
 	const int wait_flr_ms = 200;
 	int i, vf_id, flr_vf_id = -1;
+	uint8_t tile;
 
 	igt_sriov_disable_driver_autoprobe(pf_fd);
 	igt_sriov_enable_vfs(pf_fd, num_vfs);
@@ -283,13 +312,20 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 	if (igt_warn_on(igt_pci_system_reinit()))
 		goto disable_vfs;
 
-	for (i = 0; i < num_checks; ++i)
-		checks[i].init(checks[i].data);
+	xe_for_each_tile(pf_fd, tile) {
+		for (i = 0; i < num_checks; ++i) {
+			if (checks[i].alloc)
+				checks[i].alloc(checks[i].data[tile], tile, num_vfs);
 
-	for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
-		for (i = 0; i < num_checks; ++i)
-			if (subcheck_can_proceed(&checks[i]))
-				checks[i].prepare_vf(vf_id, checks[i].data);
+			if (subcheck_can_proceed(&checks[i], tile))
+				checks[i].init(checks[i].data[tile], tile);
+		}
+
+		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
+			for (i = 0; i < num_checks; ++i)
+				if (subcheck_can_proceed(&checks[i], tile))
+					checks[i].prepare_vf(checks[i].data[tile], tile, vf_id);
+	}
 
 	if (no_subchecks_can_proceed(checks, num_checks))
 		goto cleanup;
@@ -298,8 +334,10 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 	flr_vf_id = exec_strategy(pf_fd, num_vfs, checks, num_checks, wait_flr_ms);
 
 cleanup:
-	for (i = 0; i < num_checks; ++i)
-		checks[i].cleanup(checks[i].data);
+	xe_for_each_tile(pf_fd, tile)
+		for (i = 0; i < num_checks; ++i)
+			if (checks[i].cleanup)
+				checks[i].cleanup(checks[i].data[tile], tile);
 
 disable_vfs:
 	igt_sriov_disable_vfs(pf_fd);
@@ -315,6 +353,7 @@ static int execute_sequential_flr(int pf_fd, int num_vfs,
 				  const int wait_flr_ms)
 {
 	int i, vf_id, flr_vf_id = 1;
+	uint8_t tile;
 
 	do {
 		if (igt_warn_on_f(!igt_sriov_device_reset(pf_fd, flr_vf_id),
@@ -324,16 +363,20 @@ static int execute_sequential_flr(int pf_fd, int num_vfs,
 		/* Assume FLR is finished after wait_flr_ms */
 		usleep(wait_flr_ms * 1000);
 
-		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
-			for (i = 0; i < num_checks; ++i)
-				if (subcheck_can_proceed(&checks[i]))
-					checks[i].verify_vf(vf_id, flr_vf_id, checks[i].data);
-
-		/* Reinitialize test data for the FLRed VF */
-		if (flr_vf_id < num_vfs)
-			for (i = 0; i < num_checks; ++i)
-				if (subcheck_can_proceed(&checks[i]))
-					checks[i].prepare_vf(flr_vf_id, checks[i].data);
+		xe_for_each_tile(pf_fd, tile) {
+			for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
+				for (i = 0; i < num_checks; ++i)
+					if (subcheck_can_proceed(&checks[i], tile))
+						checks[i].verify_vf(checks[i].data[tile],
+								    tile, vf_id, flr_vf_id);
+
+			/* Reinitialize test data for the FLRed VF */
+			if (flr_vf_id < num_vfs)
+				for (i = 0; i < num_checks; ++i)
+					if (subcheck_can_proceed(&checks[i], tile))
+						checks[i].prepare_vf(checks[i].data[tile], tile,
+								     flr_vf_id);
+		}
 
 		if (no_subchecks_can_proceed(checks, num_checks))
 			break;
@@ -420,9 +463,12 @@ cleanup_threads:
 		pthread_join(threads[i], NULL);
 
 	if (last_vf_id) {
-		for (k = 0; k < num_checks; ++k)
-			set_skip_reason(checks[k].data,
-					"Thread creation failed for VF%u\n", last_vf_id);
+		uint8_t tile;
+
+		xe_for_each_tile(pf_fd, tile)
+			for (k = 0; k < num_checks; ++k)
+				set_skip_reason(checks[k].data[tile],
+						"Thread creation failed for VF%u\n", last_vf_id);
 		return 0;
 	}
 
@@ -431,15 +477,19 @@ cleanup_threads:
 
 	/* Verify results */
 	for (i = 0; i < created_threads; ++i) {
+		uint8_t tile;
+
 		vf_id = thread_data[i].vf_id;
 
 		/* Skip already checked VF or if the FLR initiation failed */
 		if (vf_id == last_vf_id || thread_data[i].result != 0)
 			continue;
 
-		for (k = 0; k < num_checks; ++k)
-			if (subcheck_can_proceed(&checks[k]))
-				checks[k].verify_vf(vf_id, vf_id, checks[k].data);
+		xe_for_each_tile(pf_fd, tile)
+			for (k = 0; k < num_checks; ++k)
+				if (subcheck_can_proceed(&checks[k], tile))
+					checks[k].verify_vf(checks[k].data[tile], tile, vf_id,
+							    vf_id);
 
 		if (no_subchecks_can_proceed(checks, num_checks))
 			break;
@@ -470,8 +520,8 @@ static int execute_parallel_flr_twice(int pf_fd, int num_vfs,
 #define GGTT_PTE_ADDR_SHIFT			12
 
 struct ggtt_ops {
-	void (*set_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
-	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
+	void (*set_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
+	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
 };
 
 struct ggtt_provisioned_offset_range {
@@ -491,69 +541,79 @@ struct ggtt_data {
 	struct ggtt_ops ggtt;
 };
 
-static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
+static void ggtt_subcheck_alloc(struct subcheck_data *data, uint8_t tile, unsigned int num_vfs)
 {
-	return xe_mmio_ggtt_read(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset);
+	struct ggtt_data *gdata = (struct ggtt_data *)data;
+
+	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
+	if (!gdata->pte_offsets) {
+		set_abort_reason(data, "Failed to allocate memory for pte_offsets on tile %u\n",
+				 tile);
+		return;
+	}
+}
+
+static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset)
+{
+	return xe_mmio_ggtt_read(mmio, tile, pte_offset);
 }
 
-static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
+static void intel_set_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset,
+			  xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
 }
 
-static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
+static void intel_mtl_set_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset,
+			      xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
 
 	/* force flush by read some MMIO register */
-	xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), GEN12_VF_CAP_REG);
+	xe_mmio_tile_read32(mmio, tile, GEN12_VF_CAP_REG);
 }
 
-static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
-			uint8_t gpa, xe_ggtt_pte_t *out)
+static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
+			uint32_t pte_offset, uint8_t gpa, xe_ggtt_pte_t *out)
 {
 	xe_ggtt_pte_t pte;
 
-	pte = ggtt->get_pte(mmio, gt, pte_offset);
+	pte = ggtt->get_pte(mmio, tile, pte_offset);
 	pte &= ~GGTT_PTE_TEST_FIELD_MASK;
 	pte |= ((xe_ggtt_pte_t)gpa << GGTT_PTE_ADDR_SHIFT) & GGTT_PTE_TEST_FIELD_MASK;
-	ggtt->set_pte(mmio, gt, pte_offset, pte);
-	*out = ggtt->get_pte(mmio, gt, pte_offset);
+	ggtt->set_pte(mmio, tile, pte_offset, pte);
+	*out = ggtt->get_pte(mmio, tile, pte_offset);
 
 	return *out == pte;
 }
 
-static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
-			  uint8_t expected_gpa, xe_ggtt_pte_t *out)
+static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
+			  uint32_t pte_offset, uint8_t expected_gpa, xe_ggtt_pte_t *out)
 {
 	uint8_t val;
 
-	*out = ggtt->get_pte(mmio, gt, pte_offset);
+	*out = ggtt->get_pte(mmio, tile, pte_offset);
 	val = (uint8_t)((*out & GGTT_PTE_TEST_FIELD_MASK) >> GGTT_PTE_ADDR_SHIFT);
 
 	return val == expected_gpa;
 }
 
-static bool is_intel_mmio_initialized(const struct intel_mmio_data *mmio)
-{
-	return mmio->dev;
-}
-
-static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
+static void populate_ggtt_pte_offsets(struct ggtt_data *gdata, uint8_t tile)
 {
 	int ret, pf_fd = gdata->base.pf_fd, num_vfs = gdata->base.num_vfs;
 	struct xe_sriov_provisioned_range *ranges;
-	unsigned int nr_ranges, gt = gdata->base.gt;
+	unsigned int nr_ranges;
 
 	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
 	igt_assert(gdata->pte_offsets);
 
-	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, xe_gt_get_tile_id(pf_fd, gt),
-							 gdata->mmio, &ranges, &nr_ranges);
+	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, gdata->mmio, &ranges,
+							 &nr_ranges);
 	if (ret) {
-		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
-				gt, ret);
-		return -1;
+		set_abort_reason(&gdata->base,
+				 "Tile%u: Failed to scan GGTT PTE offset ranges (%d)\n",
+				 tile, ret);
+		return;
 	}
 
 	for (unsigned int i = 0; i < nr_ranges; ++i) {
@@ -563,46 +623,38 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 			continue;
 
 		if (vf_id < 1 || vf_id > num_vfs) {
-			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
-					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
-			free(ranges);
-			return -1;
+			set_abort_reason(&gdata->base,
+					 "Tile%u: Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
+					 tile, vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
+			goto out;
 		}
 
 		if (gdata->pte_offsets[vf_id].end) {
-			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
-					vf_id);
-			free(ranges);
-			return -1;
+			set_abort_reason(&gdata->base,
+					 "Tile%u: Duplicate GGTT PTE offset range for VF%u\n",
+					 tile, vf_id);
+			goto out;
 		}
 
 		gdata->pte_offsets[vf_id].start = ranges[i].start;
 		gdata->pte_offsets[vf_id].end = ranges[i].end;
 	}
 
-	free(ranges);
-
 	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
 		if (!gdata->pte_offsets[vf_id].end) {
-			set_skip_reason(&gdata->base,
-					"Failed to find VF%u provisioned GGTT PTE offset range\n",
-					vf_id);
-			return -1;
+			set_abort_reason(&gdata->base,
+					 "Tile%u: Failed to find VF%u provisioned GGTT PTE offset range\n",
+					 tile, vf_id);
+			goto out;
 		}
-
-	return 0;
+out:
+	free(ranges);
 }
 
-static void ggtt_subcheck_init(struct subcheck_data *data)
+static void ggtt_subcheck_init(struct subcheck_data *data, uint8_t tile)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 
-	if (!xe_is_main_gt(data->pf_fd, data->gt)) {
-		set_skip_reason(data, "GGTT provisioning not exposed on GT%d (non-MAIN)\n",
-				data->gt);
-		return;
-	}
-
 	gdata->ggtt.get_pte = intel_get_pte;
 	if (IS_METEORLAKE(intel_get_drm_devid(data->pf_fd)))
 		gdata->ggtt.set_pte = intel_mtl_set_pte;
@@ -610,16 +662,16 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
 		gdata->ggtt.set_pte = intel_set_pte;
 
 	if (gdata->mmio) {
-		if (!is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
-			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
+		if (!xe_mmio_is_initialized(gdata->mmio))
+			xe_mmio_access_init(data->pf_fd, gdata->mmio);
 
-		populate_ggtt_pte_offsets(gdata);
+		populate_ggtt_pte_offsets(gdata, tile);
 	} else {
-		set_skip_reason(data, "xe_mmio is NULL\n");
+		set_abort_reason(data, "xe_mmio is NULL\n");
 	}
 }
 
-static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+static void ggtt_subcheck_prepare_vf(struct subcheck_data *data, uint8_t tile, int vf_id)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 	xe_ggtt_pte_t pte;
@@ -628,22 +680,23 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 	if (data->stop_reason)
 		return;
 
-	igt_debug("Prepare gpa on VF%u offset range [%#x-%#x]\n", vf_id,
+	igt_debug("Tile%u: Prepare gpa on VF%u offset range [%#x-%#x]\n", tile, vf_id,
 		  gdata->pte_offsets[vf_id].start,
 		  gdata->pte_offsets[vf_id].end);
 
 	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
-		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
+		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, tile, pte_offset,
 				 (uint8_t)vf_id, &pte)) {
 			set_skip_reason(data,
-					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
-					vf_id, pte, pte_offset);
+					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x on tile%u\n",
+					vf_id, pte, pte_offset, tile);
 			return;
 		}
 	}
 }
 
-static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+static void ggtt_subcheck_verify_vf(struct subcheck_data *data, uint8_t tile, int vf_id,
+				    int flr_vf_id)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 	uint8_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
@@ -654,25 +707,22 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 		return;
 
 	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
-		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
+		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, tile, pte_offset,
 				   expected, &pte)) {
 			set_fail_reason(data,
-					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
-					flr_vf_id, vf_id, pte, pte_offset);
+					"Tile%u: GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
+					tile, flr_vf_id, vf_id, pte, pte_offset);
 			return;
 		}
 	}
 }
 
-static void ggtt_subcheck_cleanup(struct subcheck_data *data)
+static void ggtt_subcheck_cleanup(struct subcheck_data *data, uint8_t num_tiles)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 
 	free(gdata->pte_offsets);
-	if (gdata->mmio && is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
-		xe_mmio_access_fini(gdata->mmio);
 }
-
 struct lmem_data {
 	struct subcheck_data base;
 	size_t *vf_lmem_size;
@@ -680,6 +730,23 @@ struct lmem_data {
 
 const size_t STEP = SZ_1M;
 
+static void lmem_subcheck_alloc(struct subcheck_data *data, uint8_t tile, unsigned int num_vfs)
+{
+	struct lmem_data *ldata = (struct lmem_data *)data;
+
+	if (!xe_has_vram(data->pf_fd)) {
+		set_skip_reason(data, "No LMEM\n");
+		return;
+	}
+
+	ldata->vf_lmem_size = calloc(num_vfs + 1, sizeof(*ldata->vf_lmem_size));
+	if (!ldata->vf_lmem_size) {
+		set_abort_reason(data, "Failed to allocate memory for vf_lmem_size on tile %u\n",
+				 tile);
+		return;
+	}
+}
+
 static bool lmem_write_pattern(struct vram_mapping *m, uint8_t value, size_t start, size_t step)
 {
 	uint8_t read;
@@ -735,66 +802,51 @@ static bool lmem_mmap_write_munmap(int pf_fd, int vf_num, size_t length, char va
 	return result;
 }
 
-static int populate_vf_lmem_sizes(struct subcheck_data *data)
+static void populate_vf_lmem_sizes(struct subcheck_data *data, uint8_t tile)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
+	unsigned int main_gt = xe_tile_get_main_gt_id(data->pf_fd, tile);
 	struct xe_sriov_provisioned_range *ranges;
-	unsigned int nr_ranges, gt;
+	unsigned int nr_ranges;
 	int ret;
 
-	ldata->vf_lmem_size = calloc(data->num_vfs + 1, sizeof(size_t));
-	igt_assert(ldata->vf_lmem_size);
-
-	xe_for_each_gt(data->pf_fd, gt) {
-		if (!xe_is_main_gt(data->pf_fd, gt))
-			continue;
-
-		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
-								  XE_SRIOV_SHARED_RES_LMEM,
-								  gt, &ranges, &nr_ranges);
-		if (ret) {
-			set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
-					xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
-					gt, ret);
-			return -1;
-		}
-
-		for (unsigned int i = 0; i < nr_ranges; ++i) {
-			const unsigned int vf_id = ranges[i].vf_id;
+	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd, XE_SRIOV_SHARED_RES_LMEM,
+							  main_gt, &ranges, &nr_ranges);
+	if (ret) {
+		set_abort_reason(data, "Tile%u: Failed read %s on main GT (%d)\n", tile,
+				 xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
+				 ret);
+		return;
+	}
 
-			igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
-			/* Sum the allocation for vf_id (inclusive range) */
-			ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
-		}
+	for (unsigned int i = 0; i < nr_ranges; ++i) {
+		const unsigned int vf_id = ranges[i].vf_id;
 
-		free(ranges);
+		igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
+		/* Sum the allocation for vf_id (inclusive range) */
+		ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
 	}
 
+	free(ranges);
+
 	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
 		if (!ldata->vf_lmem_size[vf_id]) {
-			set_skip_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
-			return -1;
+			set_abort_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
+			return;
 		}
 
-	return 0;
+	return;
 }
 
-static void lmem_subcheck_init(struct subcheck_data *data)
+static void lmem_subcheck_init(struct subcheck_data *data, uint8_t tile)
 {
 	igt_assert_fd(data->pf_fd);
 	igt_assert(data->num_vfs);
 
-	if (!xe_has_vram(data->pf_fd)) {
-		set_skip_reason(data, "No LMEM\n");
-		return;
-	}
-
-	if (populate_vf_lmem_sizes(data))
-		/* skip reason set in populate_vf_lmem_sizes */
-		return;
+	populate_vf_lmem_sizes(data, tile);
 }
 
-static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+static void lmem_subcheck_prepare_vf(struct subcheck_data *data, uint8_t tile, int vf_id)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
 
@@ -805,11 +857,12 @@ static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 
 	if (!lmem_mmap_write_munmap(data->pf_fd, vf_id,
 				    ldata->vf_lmem_size[vf_id], vf_id)) {
-		set_skip_reason(data, "LMEM write failed on VF%u\n", vf_id);
+		set_abort_reason(data, "LMEM write failed on VF%u\n", vf_id);
 	}
 }
 
-static void lmem_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+static void lmem_subcheck_verify_vf(struct subcheck_data *data, uint8_t tile, int vf_id,
+				    int flr_vf_id)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
 	char expected = (vf_id == flr_vf_id) ? 0 : vf_id;
@@ -825,7 +878,7 @@ static void lmem_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 	}
 }
 
-static void lmem_subcheck_cleanup(struct subcheck_data *data)
+static void lmem_subcheck_cleanup(struct subcheck_data *data, uint8_t num_tiles)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
 
@@ -839,12 +892,12 @@ static void lmem_subcheck_cleanup(struct subcheck_data *data)
 
 struct regs_data {
 	struct subcheck_data base;
-	struct intel_mmio_data *mmio;
+	struct xe_mmio *mmio;
 	uint32_t reg_addr;
 	int reg_count;
 };
 
-static void regs_subcheck_init(struct subcheck_data *data)
+static void regs_subcheck_init(struct subcheck_data *data, uint8_t tile)
 {
 	struct regs_data *rdata = (struct regs_data *)data;
 
@@ -854,7 +907,7 @@ static void regs_subcheck_init(struct subcheck_data *data)
 	}
 }
 
-static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+static void regs_subcheck_prepare_vf(struct subcheck_data *data, uint8_t tile, int vf_id)
 {
 	struct regs_data *rdata = (struct regs_data *)data;
 	uint32_t reg;
@@ -863,32 +916,22 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 	if (data->stop_reason)
 		return;
 
-	if (!is_intel_mmio_initialized(&rdata->mmio[vf_id])) {
-		struct pci_device *pci_dev = __igt_device_get_pci_device(data->pf_fd, vf_id);
-
-		if (!pci_dev) {
-			set_skip_reason(data, "No PCI device found for VF%u\n", vf_id);
-			return;
-		}
-
-		if (intel_register_access_init(&rdata->mmio[vf_id], pci_dev, false)) {
-			set_skip_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
-			return;
-		}
-	}
+	if (!xe_mmio_is_initialized(&rdata->mmio[vf_id]))
+		xe_mmio_vf_access_init(data->pf_fd, vf_id, &rdata->mmio[vf_id]);
 
 	for (i = 0; i < rdata->reg_count; i++) {
 		reg = rdata->reg_addr + i * 4;
 
-		intel_register_write(&rdata->mmio[vf_id], reg, vf_id);
-		if (intel_register_read(&rdata->mmio[vf_id], reg) != vf_id) {
+		xe_mmio_tile_write32(&rdata->mmio[vf_id], tile, reg, vf_id);
+		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != vf_id) {
 			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
 			return;
 		}
 	}
 }
 
-static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+static void regs_subcheck_verify_vf(struct subcheck_data *data, uint8_t tile, int vf_id,
+				    int flr_vf_id)
 {
 	struct regs_data *rdata = (struct regs_data *)data;
 	uint32_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
@@ -901,7 +944,7 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 	for (i = 0; i < rdata->reg_count; i++) {
 		reg = rdata->reg_addr + i * 4;
 
-		if (intel_register_read(&rdata->mmio[vf_id], reg) != expected) {
+		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != expected) {
 			set_fail_reason(data,
 					"Registers check after VF%u FLR failed on VF%u\n",
 					flr_vf_id, vf_id);
@@ -910,84 +953,99 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 	}
 }
 
-static void regs_subcheck_cleanup(struct subcheck_data *data)
+static void cleanup_mmio(struct xe_mmio *mmio, unsigned int num_vfs)
 {
-	struct regs_data *rdata = (struct regs_data *)data;
-	int i;
-
-	if (rdata->mmio)
-		for (i = 1; i <= data->num_vfs; ++i)
-			if (is_intel_mmio_initialized(&rdata->mmio[i]))
-				intel_register_access_fini(&rdata->mmio[i]);
+	for (unsigned int vf_id = 0; vf_id <= num_vfs; ++vf_id) {
+		if (xe_mmio_is_initialized(&mmio[vf_id]))
+			xe_mmio_access_fini(&mmio[vf_id]);
+	}
 }
 
-static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
+static void clear_tests(const int pf_fd, const unsigned int num_vfs,
+			const flr_exec_strategy exec_strategy)
 {
-	struct xe_mmio xemmio = { };
-	const unsigned int num_gts = xe_number_gt(pf_fd);
-	struct ggtt_data gdata[num_gts];
+	struct subcheck_data base = { .pf_fd = pf_fd, .num_vfs = num_vfs };
+	struct xe_mmio *mmio = calloc(1 + num_vfs, sizeof(*mmio));
+	uint8_t num_tiles = xe_number_tiles(pf_fd);
+	struct ggtt_data gdata = {
+		.base = base,
+		.mmio = mmio,
+	};
 	struct lmem_data ldata = {
-		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs }
+		.base = base,
 	};
-	struct intel_mmio_data mmio[num_vfs + 1];
 	struct regs_data scratch_data = {
-		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
+		.base = base,
 		.mmio = mmio,
 		.reg_addr = SCRATCH_REG,
 		.reg_count = SCRATCH_REG_COUNT
 	};
 	struct regs_data media_scratch_data = {
-		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
+		.base = base,
 		.mmio = mmio,
 		.reg_addr = MED_SCRATCH_REG,
 		.reg_count = MED_SCRATCH_REG_COUNT
 	};
-	const unsigned int num_checks = num_gts + 3;
-	struct subcheck checks[num_checks];
-	int i = 0, gt_id;
+	struct ggtt_data *gdata_tiles[num_tiles];
+	struct lmem_data *ldata_tiles[num_tiles];
+	struct regs_data *sdata_tiles[num_tiles];
+	struct regs_data *msdata_tiles[num_tiles];
+
+	for (int i = 0; i < num_tiles; i++) {
+		gdata_tiles[i] = &gdata;
+		ldata_tiles[i] = &ldata;
+		sdata_tiles[i] = &scratch_data;
+		msdata_tiles[i] = &media_scratch_data;
+	}
 
-	memset(mmio, 0, sizeof(mmio));
+	{
+		struct subcheck checks[] = {
+			{
+				.data = (struct subcheck_data **)gdata_tiles,
+				.name = "clear-ggtt",
+				.alloc = ggtt_subcheck_alloc,
+				.init = ggtt_subcheck_init,
+				.prepare_vf = ggtt_subcheck_prepare_vf,
+				.verify_vf = ggtt_subcheck_verify_vf,
+				.cleanup = ggtt_subcheck_cleanup
+			},
+			{
+				.data = (struct subcheck_data **)ldata_tiles,
+				.name = "clear-lmem",
+				.alloc = lmem_subcheck_alloc,
+				.init = lmem_subcheck_init,
+				.prepare_vf = lmem_subcheck_prepare_vf,
+				.verify_vf = lmem_subcheck_verify_vf,
+				.cleanup = lmem_subcheck_cleanup
+			},
+			{
+				.data = (struct subcheck_data **)sdata_tiles,
+				.name = "clear-scratch-regs",
+				.alloc = NULL,
+				.init = regs_subcheck_init,
+				.prepare_vf = regs_subcheck_prepare_vf,
+				.verify_vf = regs_subcheck_verify_vf,
+				.cleanup = NULL
+			},
+			{
+				.data = (struct subcheck_data **)msdata_tiles,
+				.name = "clear-media-scratch-regs",
+				.alloc = NULL,
+				.init = regs_subcheck_init,
+				.prepare_vf = regs_subcheck_prepare_vf,
+				.verify_vf = regs_subcheck_verify_vf,
+				.cleanup = NULL
+			}
 
-	xe_for_each_gt(pf_fd, gt_id) {
-		gdata[i] = (struct ggtt_data){
-			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = gt_id },
-			.mmio = &xemmio
 		};
-		checks[i] = (struct subcheck){
-			.data = (struct subcheck_data *)&gdata[i],
-			.name = "clear-ggtt",
-			.init = ggtt_subcheck_init,
-			.prepare_vf = ggtt_subcheck_prepare_vf,
-			.verify_vf = ggtt_subcheck_verify_vf,
-			.cleanup = ggtt_subcheck_cleanup
-		};
-		i++;
-	}
-	checks[i++] = (struct subcheck) {
-		.data = (struct subcheck_data *)&ldata,
-		.name = "clear-lmem",
-		.init = lmem_subcheck_init,
-		.prepare_vf = lmem_subcheck_prepare_vf,
-		.verify_vf = lmem_subcheck_verify_vf,
-		.cleanup = lmem_subcheck_cleanup };
-	checks[i++] = (struct subcheck) {
-		.data = (struct subcheck_data *)&scratch_data,
-		.name = "clear-scratch-regs",
-		.init = regs_subcheck_init,
-		.prepare_vf = regs_subcheck_prepare_vf,
-		.verify_vf = regs_subcheck_verify_vf,
-		.cleanup = regs_subcheck_cleanup };
-	checks[i++] = (struct subcheck) {
-		.data = (struct subcheck_data *)&media_scratch_data,
-		.name = "clear-media-scratch-regs",
-		.init = regs_subcheck_init,
-		.prepare_vf = regs_subcheck_prepare_vf,
-		.verify_vf = regs_subcheck_verify_vf,
-		.cleanup = regs_subcheck_cleanup
-	};
-	igt_assert_eq(i, num_checks);
 
-	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
+		igt_abort_on_f(!mmio, "Failed to allocate memory for mmio array\n");
+
+		verify_flr(pf_fd, num_vfs, checks, ARRAY_SIZE(checks), exec_strategy);
+
+		cleanup_mmio(mmio, num_vfs);
+		free(mmio);
+	}
 }
 
 igt_main
-- 
2.34.1


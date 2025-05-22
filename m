Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57CAC54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 11:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2201110EB3A;
	Thu, 22 May 2025 11:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsVgZsbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BBD10EB3A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747914722; x=1779450722;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0V4Pl66AJtkXVuEg/4T7E+pQOeM7aj46GfvV9MA47GU=;
 b=QsVgZsbWUAWJowuf5HpM/LIcPMPkyua/NGO1s7rBZ8Dcjc1mZZAI0TLs
 mFiXypt+d2QRKeGlaKaRA+hcaysf2jFH+1L3DtjmOwswG9/FB/4XdZzs5
 EsSB5Wzk0ErOJfoXuCSM+atF9vrkS2OobgQbulN8nKRUIlQgpjVt96v6I
 /AgeCPPghi3AfJ4iLmrenyw2xCYr24plN11NajzoZ5cTnMaVOyFIFuHPb
 k6rloKZY/KnemWI+OqhyWWp6DR4z/TahYGObFlQAZthgOy0RrEbRwQGsJ
 gw+WduojbOB1riVEixjmWKcubglFGFJXEYsp4trImCga1CWnUgO8ULBp5 w==;
X-CSE-ConnectionGUID: m+sOGce3Q06t2seWXQCkNQ==
X-CSE-MsgGUID: +bFv0QUMRFS3E9obaWxt/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61280464"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="61280464"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:51:32 -0700
X-CSE-ConnectionGUID: e8W9GJXiTbKSPhZwj6FoEA==
X-CSE-MsgGUID: sDfrc8QFQSSU01njBiQtLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140440320"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:51:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 04:51:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 04:51:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 04:51:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ip9pbDWWBi+iclBOkrzNXclbJduu99iaslu17XEztPywyT/MZ2DR1kAfFDL6garzA3zEcFja10QMjth3wwnEF3YryaearD2h2dDJqGyWixWpCw81WI1RessahrnOr1jfeWWFTk99tgD+XUMIfh/x7sGMMiaYIs0hNHVf3G6oiki/lGllxAN/vzA9JrzssZQecTX6GvIveXmlG/7Jw7I+ONLFX0IxTQO6k+SwJ16owdS+/JrkFlvZy94XBsoyVdaWP+7KQJ9AJpOej3QKceShlCe4/d+Ekheipgl0Gm/HZle3kITaDvDS0Zb2PgRgqymoWWrxwL+Z/19mDanGXAwaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReA97KsSJpparOHWO7Cz3Y7imzgXHJVzuMwmOaY+m+I=;
 b=IFZboRn+NSNxT98zend0NXSWuBILhIOb2F2Iqt90IEWCkDAR/4gaaH/vvZcx+CBR4Q1sxIil15MRB+v82WUlY1j++wNeIMoxBxddjNtP/S9O/WoWr98yJpx/AzRbvRbsIhap3O5EcdQbMxDCBrPoieWYKP2rpa5fMy4d+8ZRtflZt+YUaxKV7HHHo5YHi6fdStnyJMFYLiRTg3tQeQgvwAZ/FtpCTRxM90tmpX2I7tWeZGW3Xk0RUOq1Fd+L/vEBNy1JJUuM8FzhT8Ue2uO4w3p4SHzcDv4mj1SBE6ssQ5ndRu/ByocmUB2OpfWmsKdVUs02EiwoL04nHNlFvEYm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB5922.namprd11.prod.outlook.com (2603:10b6:806:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 11:50:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 11:50:48 +0000
Date: Thu, 22 May 2025 13:50:44 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 09/15] lib/intel_blt: use struct instead of inline
 coding
Message-ID: <aC8PlOVDYYX2hwFy@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-10-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0186.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 57172a9a-f677-4b9a-e3fb-08dd9926e484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2h1VEQwSTJnNkh0R1RFd3pRclBNK0FBWkZoNTJSb1c1R2VqZFQ0NnNvT3Uv?=
 =?utf-8?B?d3MzcERzUExCUUdoK1dOMmtDVHJKUUlDb2JDb0xXR3dKNzJnMExSODJwTmxa?=
 =?utf-8?B?aHJXeVhLa3NHUTIwMFdTMDRIWnAvd2FBNk1Iemt0RDVIN1BZV3dNR3N5Y2Fh?=
 =?utf-8?B?TXF0YzdwQmVGOXIxeEVaL3FNNHdOWUNTUGlJaW5MS2tVZ1pXUFppWGg5VXIx?=
 =?utf-8?B?RktRWjRWS251QkVEVjZ5eGg5dmtDR05VQmw2RVZObWR3dlJiZUE5ajlFZWIr?=
 =?utf-8?B?bDJCcmZOLzZLK3dEWUdhaVdCNnZlNnBlSkJQVEdGcWNlNkRzSUZaTFQ2cVVT?=
 =?utf-8?B?T2pYR0JFUEVPb2NuUGNnV0VDV3JwOEVxcit0SHZsUFRmMlhOSWludVlMNkRa?=
 =?utf-8?B?QVVhcUJBek5ObFZaM3Z5U1dHMmZWVnI4N1FEeTJuRGxaWnAreklxRWRGOEl1?=
 =?utf-8?B?bXlxRDVQR0VhdnVPL0VHWjJycXBITE1xK2FlK0V4WmNSQ29WRnczdlE2a3Fm?=
 =?utf-8?B?Qy9YcSs4V3JKY1pFbUZSY3dseE1heHVXSHNXMVN3NCtlYVBDRkpybDU5T2pN?=
 =?utf-8?B?MHZlWXA3UDR4S21IUm55Q1k3TXJUaFhzMzN0Ylo2c1FxOUJnUkRzVElPVlZh?=
 =?utf-8?B?TC95WVBJc0FIVWFGbUpFbGt2eDBHbS82ZVdLbTNlSndhYWRGVE93YTNJKzRZ?=
 =?utf-8?B?RjVZd0tDWldXVnhXVHRGeUFrbkV2NnNTdDJWRTlsSGR2UjZwbGdLdDVZbTB1?=
 =?utf-8?B?cy9ITW0rZmM5M1ArcUY3dHhnUXV5RFE5QXc1RWtSNDc5MVBnVmNSbWRVRnVm?=
 =?utf-8?B?RUh5THBQdGZuQ2U5L05Zd1dYVUdJN1Nkd1FsdXFJLzFwZmN1dEJzWTB6NjRB?=
 =?utf-8?B?OXlHZTZpYzJ0R1pSYXJMMDhiNHJGWG4zWGU5Z3ZtcjhSRnN1djcyMkV4K3gz?=
 =?utf-8?B?alZNbkdrb3d0bXNIOW1oZ2tKb0YxUHI4VDRncU53YnZMMUcxUzVWMjAzeTBG?=
 =?utf-8?B?VkxIL21hVXNTSzJ3RTAxK2w1RUNETER2L1g0QnpLS2VOOGF6cnEzcHhZSFdL?=
 =?utf-8?B?THpvRVJqaDBjbFRsL2FzWW5XV0NCcDVFUUkzTWMvOXdCM3h6RUl5OVJOdXZk?=
 =?utf-8?B?R3pjUklhWm5QWWxBSFBIaVVqZ2drWFpHeXlwbkUvdkpzL3ZXZDFQNHIwcmtk?=
 =?utf-8?B?Y2djT3VPVHVrR3FEak9USDNRNUJibERWQURUTXNCR29lOHI2UUdDaVlrUXBp?=
 =?utf-8?B?czFjM2ltWUozdVcxem1kZnNuVFJlVXZ1eDFXMHl4Y3BmakdYTDlIK3JkK0VL?=
 =?utf-8?B?WHVwS0lFOEp0eU9rWGhoU2pZM1hGTWI3aDRHd2ZFYVJ4R1c5NlprQzMzekh3?=
 =?utf-8?B?UzhGeDdPMGsvUDNOQnZuN0VKejlkY25SWnliMzIyZWM3VU1oSVFPK3dWL0NF?=
 =?utf-8?B?SGZ1aHg4Sm04cEJudVBoUHFSTkR5TTlHcEtlYjM1RVcyZG9Bd3pJWFJXc29V?=
 =?utf-8?B?YW1YeHhCTVA4V09DUFVESUJEVnp2dWM0dEJCL21NSlJKNUFqdUc4aGdFRisr?=
 =?utf-8?B?UXZqMmd0YUpVbU1WVEVDdForNzJDWFlTTUVOYUU3ZEpnYVNQcEk2L28yNVZE?=
 =?utf-8?B?NVVsZkJ2YUxwZ3l3ZUd5QlV2dHo4b05zR0ZkWVdjeW13Zk5WSVJpaTh5eHBp?=
 =?utf-8?B?TndVbWdWR3pTbzhZZHUxTGczTDAyQWtUUTU1QkptTXNuTG9NSmpDQmNHdE8r?=
 =?utf-8?B?aWlIaGVpRVFSdlUyQk1RY04rMHJXRUZaUGwwNXk3bzk2NkppdHc4S1NWWU8x?=
 =?utf-8?B?RmY4T1dCa044emNxRmx2TXJjVStOYWZvMlFOWW4ydW1ybG8wcGtpTEo3VXds?=
 =?utf-8?B?bVFvTUttb293Z3VVVVQ4MXI0VEtrbHdic1hjcHUwOVlKTTEwYStjbk8xL0xM?=
 =?utf-8?Q?lSkO21WA3aA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlJ5TWQyZG5YNHZRQ3ZoYnJLclN2UWhwU2tTK1NPeHMwNEd1U2NUblNyTEF4?=
 =?utf-8?B?bmcyOTVqWTNDQWFjaHoyc2ZzQkwwNnBYTTI5NDI5dk5wUzNtT1pPWk5LRDRy?=
 =?utf-8?B?VGFENEVqUUxxVGtCeFo1dXBOc1dRdWN4RUF1SjlTN3FvWHA4YW5Vd0gwelFa?=
 =?utf-8?B?Y1VvNVFWZ3o3Rk1nNkY4RjYvUXpleUxHTHUvQUpHM3lMNlJjYlhlSU45TVpo?=
 =?utf-8?B?QjhrSXFMNDVubHlod3F3OCt5aWZNYW9hOXZEWW1lR1RzUHdXVGw5NVpOaHN1?=
 =?utf-8?B?VEprd0hJUStMR3plVWNxcjF0bFVGaGFTemg5aG1aZjdRVWp4QTQ3NmNWVldM?=
 =?utf-8?B?T1BwQ3hjWW5YMldiNU5KcVRQZnY0REpDWHlpUkpzNEoyUzRBVUN0RUlzbjV1?=
 =?utf-8?B?YjhFTVNZcVQ5Q2FPL0gwV2J0bXZ1aStoU3RHVHpFWlRLQTNoOWtiM1RhUlBK?=
 =?utf-8?B?VC9YS0xZTWtqT2JQbldaU3U2NTlMekVIcGJYOFNwQ2FST09VRGYxR24vUVBO?=
 =?utf-8?B?Z0tBQzlKa0tlWjVTM2dLa1Rwc1hKU1Vsbi9TTzh4d2QySkNaQjlSTXBKTk9P?=
 =?utf-8?B?QVhUWmcyWkFTakh4NWQwWUJNY083TUluNHQ2OS92ZlcrWlVScjFGUUVoc05q?=
 =?utf-8?B?NUovLyttUUtRZk1BSFNsZDdqOXF5SHc5dVplRlRpT1JNV2xHOFBDOE1EcXJV?=
 =?utf-8?B?a0xIcTlQZ3NRYzdPcnNTQVBpMnRjOTAwTTZ2R3FjRloyUm56MGd5dXlFWVc4?=
 =?utf-8?B?QlNTZkZBcVY0N3Fyd0lVRFhmSlJtZUo3T3A1QVlJZ0FlZ0lOT1lCSTM4aitF?=
 =?utf-8?B?Wm5aaWo4KzdwckhLbGx3U0tHRm5FdVJhTDl0RkNHNzJiZjF2S05lMnoxb2tj?=
 =?utf-8?B?QzlQOFhpZ0pEbmNEdW5TSCtlSGRmVGdsOHNPRFZ6aGVXVXl0NzJwNDlXc2F1?=
 =?utf-8?B?UTRrNWVTcFpmNVJkMW4wOEJsSEFTNXU2SnFWNFpQT3RNaldOeWx4eXZMWEdH?=
 =?utf-8?B?MXJZeFpsQUxTeWdtamVOL2t5YWxuTFhsQkN5Wmh6OHFyVVF2a2NkaFd2SHBB?=
 =?utf-8?B?OHZzcit2VjdHbVoxVkQ5QUZLeCtyMEtIMHZDdUt2TW5QSHo0UDdBYzdUN1Vw?=
 =?utf-8?B?L0I1UmpVMkRTSWp5YUErSXdrUVFSUjlYaHR4V3JLRytSRVp6bVpxOEdZQ0gv?=
 =?utf-8?B?dG53WXROeXFWa0s3UmNYSmo5Zk80cGNQY0liS0txZkI5WTlIdUhoWmNTR0Js?=
 =?utf-8?B?bVRuT2RGVjFEMEEvQklBajNKNUZDamo3NjhNK0Q1VU8rQ0JvY0hPWU84eTdw?=
 =?utf-8?B?Zmx3RXp2a3pMUVJWQkdnS3ZsL2dJb05BUFM1NHBBZ3JEQ29MRy9zNWpBQzRx?=
 =?utf-8?B?QlJNVUp0d0EzRk1YNldjZElFTlpYMUxWMGw2eHF5MXRVMkhvZzVCbGszMkZR?=
 =?utf-8?B?d0ExR3lSTEhSYmwyRENUdDZEMms0eXQ2SlVicE9MZ0pDOUg5M1NKOXpnWUhi?=
 =?utf-8?B?YmxObDBhRDhYR1ljb2g4UWRQcFF5bkcwTERMcHJuQW02OFEwL3ZZK2Z2VDlq?=
 =?utf-8?B?YkU5Z3dBM1BaVHBBTm1LSFdkZ1RSNkcwZTZZSzZ1NUc4bWRlaStyTFgrYzBp?=
 =?utf-8?B?Wjd6RFdsajl2dXpTcUhrSzk2TEg3QmM1aWF4L1dKVkZYQ3Q2T0ZsSFJYQjda?=
 =?utf-8?B?c0cyU3VNaEUra2FuallhY3VBNitCWnBJcFU3b3B1QitvNUxpWG11NzRSQnQ3?=
 =?utf-8?B?UnR5MjF3WEIvQ05SOGNiU085K2ZuN3ZBdzljM2hYYk9jVEtFOHEyV2dGbk9l?=
 =?utf-8?B?OXZDU3M1U1NsQmo5ZVpYbnhxSWNwMTJSRXFEaG93a0EycFZvRGdPWTdsV0Va?=
 =?utf-8?B?cFBXRlgyNFNlOE1zQUE0UXJoa0tqZHlYRnEwcmhtU3hNTEFjeW9sejF0VlBK?=
 =?utf-8?B?THpaZGxPMXRVVEVLUmx6UDF5cEdEQzhHVzBVT3VsNGRmWjlIYnFETjNjVGs5?=
 =?utf-8?B?TXJpTUQyanhWanBjRDV3RkhvcFdDcVplTlBaUXQ4Y0o5REJvTEZKcE04dXZ2?=
 =?utf-8?B?SmgreXV6MlJnZzk2STczdGo1WW53M3RqWmhLS2JzRFVoUm8xY2o1bFppaDRv?=
 =?utf-8?B?eTN1Q3ZkbCtlQWF5RHRmOWtFeTdSdWVRY3FiMXZROWJUUTdsWDJ0QVVPZFpP?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57172a9a-f677-4b9a-e3fb-08dd9926e484
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 11:50:47.9864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hirtaqT2CaXltJs0XFSA9RnbyhOxeOQwVbpABgk13FR10gYz1mvh9/x3BcDau93GJln99yD9BlzLjIGbZZ0jlr34Wyh75NpGYQN0JUsaMdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5922
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

On Tue, May 13, 2025 at 08:58:04PM +0200, Zbigniew Kempczyński wrote:
> Structs with bitfields offers better control to avoid setting
> unnecessary bits and get unexpected behavior.
> 
> Add struct for mem-copy and replace current byte copy implementation
> to byte/page adding iterator for insert couple of mem-copy instructions
> if user passed objects which width is greater than limit.
> 
> On the first glance order of assigning fields might be weird, but
> this will be used in consecutive patch which extends copy from linear
> to matrix.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Much cleaner and matches the bspec:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Francois

> ---
>  lib/intel_blt.c | 171 ++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 144 insertions(+), 27 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 04549ab42e..265f5ed50f 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1798,6 +1798,73 @@ int blt_fast_copy(int fd,
>  	return ret;
>  }
>  
> +struct xe_mem_copy_data {
> +	struct {
> +		uint32_t length:			BITRANGE(0, 7);
> +		uint32_t compression_format:	BITRANGE(8, 12);
> +		uint32_t compression_enable:	BITRANGE(13, 13);
> +		uint32_t rsvd0:			BITRANGE(14, 14);
> +		uint32_t dst_compressible:	BITRANGE(15, 15);
> +		uint32_t src_compressible:	BITRANGE(16, 16);
> +		uint32_t copy_type:		BITRANGE(17, 18);
> +		uint32_t mode:			BITRANGE(19, 19);
> +		uint32_t rsvd1:			BITRANGE(20, 21);
> +		uint32_t opcode:			BITRANGE(22, 28);
> +		uint32_t client:			BITRANGE(29, 31);
> +	} dw00;
> +
> +	struct {
> +		union {
> +			struct {
> +				uint32_t width:			BITRANGE(0, 17);
> +				uint32_t rsvd0:			BITRANGE(18, 31);
> +			} byte_copy;
> +			struct {
> +				uint32_t width:			BITRANGE(0, 23);
> +				uint32_t rsvd0:			BITRANGE(24, 31);
> +			} page_copy;
> +			uint32_t val;
> +		};
> +	} dw01;
> +
> +	struct {
> +		uint32_t height:			BITRANGE(0, 17);
> +		uint32_t rsvd0:			BITRANGE(18, 31);
> +	} dw02;
> +
> +	struct {
> +		uint32_t src_pitch:		BITRANGE(0, 17);
> +		uint32_t rsvd0:			BITRANGE(18, 31);
> +	} dw03;
> +
> +	struct {
> +		uint32_t dst_pitch:		BITRANGE(0, 17);
> +		uint32_t rsvd0:			BITRANGE(18, 31);
> +	} dw04;
> +
> +	struct {
> +		uint32_t src_address_lo;
> +	} dw05;
> +
> +	struct {
> +		uint32_t src_address_hi;
> +	} dw06;
> +
> +	struct {
> +		uint32_t dst_address_lo;
> +	} dw07;
> +
> +	struct {
> +		uint32_t dst_address_hi;
> +	} dw08;
> +
> +	struct {
> +		uint32_t dst_mocs:		BITRANGE(0, 6);
> +		uint32_t rsvd0:			BITRANGE(7, 24);
> +		uint32_t src_mocs:		BITRANGE(25, 31);
> +	} dw09;
> +};
> +
>  /**
>   * blt_mem_copy_init:
>   * @fd: drm fd
> @@ -1820,41 +1887,91 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
>  	mem->copy_type = copy_type;
>  }
>  
> -static void emit_blt_mem_copy(int fd, uint64_t ahnd,
> -			      const struct blt_mem_copy_data *mem,
> -			      bool emit_bbe)
> +static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> +				  const struct blt_mem_copy_data *mem,
> +				  uint64_t bb_pos, bool emit_bbe)
>  {
> -	uint64_t dst_offset, src_offset;
> -	int i;
> -	uint32_t *batch;
> -	uint32_t optype;
> +	struct xe_mem_copy_data data = {};
> +	uint64_t dst_offset, src_offset, shift;
> +	uint32_t height, width_max, remain;
> +	uint32_t bbe = MI_BATCH_BUFFER_END;
> +	uint32_t *bb;
> +
> +	if (mem->mode == MODE_BYTE) {
> +		data.dw01.byte_copy.width = -1;
> +		width_max = data.dw01.byte_copy.width + 1;
> +		shift = width_max;
> +	} else {
> +		data.dw01.page_copy.width = -1;
> +		width_max = data.dw01.page_copy.width + 1;
> +		shift = width_max << 8;
> +	}
>  
>  	src_offset = get_offset_pat_index(ahnd, mem->src.handle, mem->src.size,
>  					  0, mem->src.pat_index);
>  	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
>  					  0, mem->dst.pat_index);
>  
> -	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
> -	optype = mem->copy_type == TYPE_MATRIX ? 1 << 17 : 0;
> -
> -	i = 0;
> -	batch[i++] = MEM_COPY_CMD | optype;
> -	batch[i++] = mem->src.width - 1;
> -	batch[i++] = mem->src.height - 1;
> -	batch[i++] = mem->src.pitch - 1;
> -	batch[i++] = mem->dst.pitch - 1;
> -	batch[i++] = src_offset;
> -	batch[i++] = src_offset << 32;
> -	batch[i++] = dst_offset;
> -	batch[i++] = dst_offset << 32;
> -	batch[i++] = mem->src.mocs_index << XE2_MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
> -
> -	if (emit_bbe)
> -		batch[i++] = MI_BATCH_BUFFER_END;
> -
> -	munmap(batch, mem->bb.size);
> +	bb = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
> +
> +	height = mem->dst.height;
> +
> +	data.dw00.client = 0x2;
> +	data.dw00.opcode = 0x5a;
> +	data.dw00.length = 8;
> +	data.dw00.mode = mem->mode;
> +	data.dw00.copy_type = mem->copy_type;
> +
> +	data.dw02.height = height - 1;
> +	data.dw05.src_address_lo = src_offset;
> +	data.dw06.src_address_hi = src_offset >> 32;
> +	data.dw07.dst_address_lo = dst_offset;
> +	data.dw08.dst_address_hi = dst_offset >> 32;
> +	data.dw09.src_mocs = mem->src.mocs_index;
> +	data.dw09.dst_mocs = mem->dst.mocs_index;
> +
> +	remain = mem->src.width;
> +
> +	/* Truncate pitches to match operation bits */
> +	if (mem->src.pitch > width_max)
> +		data.dw03.src_pitch = width_max - 1;
> +	else
> +		data.dw03.src_pitch = mem->src.pitch;
> +
> +	if (mem->dst.pitch > width_max)
> +		data.dw04.dst_pitch = width_max - 1;
> +	else
> +		data.dw04.dst_pitch = mem->dst.pitch;
> +
> +	while (remain) {
> +		data.dw01.val = min_t(uint32_t, width_max, remain) - 1;
> +
> +		igt_assert(bb_pos + sizeof(data) < mem->bb.size);
> +		memcpy(bb + bb_pos, &data, sizeof(data));
> +		bb_pos += sizeof(data);
> +
> +		remain -= remain > width_max ? width_max : remain;
> +		src_offset += shift;
> +		dst_offset += shift;
> +
> +		data.dw05.src_address_lo = src_offset;
> +		data.dw06.src_address_hi = src_offset >> 32;
> +		data.dw07.dst_address_lo = dst_offset;
> +		data.dw08.dst_address_hi = dst_offset >> 32;
> +	}
> +
> +	if (emit_bbe) {
> +		igt_assert(bb_pos + sizeof(uint32_t) < mem->bb.size);
> +		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
> +		bb_pos += sizeof(uint32_t);
> +	}
> +
> +	munmap(bb, mem->bb.size);
> +
> +	return bb_pos;
>  }
>  
> +
>  /**
>   * blt_mem_copy:
>   * @fd: drm fd
> @@ -1884,7 +2001,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  					  0, mem->dst.pat_index);
>  	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, 0);
>  
> -	emit_blt_mem_copy(fd, ahnd, mem, true);
> +	emit_blt_mem_copy(fd, ahnd, mem, 0, true);
>  
>  	if (mem->driver == INTEL_DRIVER_XE) {
>  		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
> -- 
> 2.43.0
> 

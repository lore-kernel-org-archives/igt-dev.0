Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB889C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 19:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720D510E117;
	Thu, 10 Jul 2025 19:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkqX/Jbc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F08E10E117
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 19:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752175836; x=1783711836;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BuhuTBPW59GnQlrvDHMWYLn+ZSPxRJftXEV/NbtYrnY=;
 b=ZkqX/JbcdNwavHVtSSraI7E4HS0mFxiboHHxWmiNRwIzjHrnk1bAvN1U
 0Pn7/m9N/sRu/3l/PWTSejC3JRv/0grM1FL8ju0RyDoHIq/uG+pTvCXY2
 eXCHP43gJGV5k1mpmSGTJhq/iZ18XQUaRnkiIxX/LNiXF1QMDCpdhPDc/
 dm9E3y4KY2xm8O8vnAgAxiu6FINxd95z3Yh9mJ7WxM2TN4fDGPeE26deN
 INfhmLTWGK3sSKJfwarYvV7tOkwMLXZd/AU8BfbsCN9XkiLi2aeF424MH
 EC+eEXOOr3xoH8st/KXoNUwDz0e0Nj5bYNswKaFQJuIBW7ebY7l/YqgEr w==;
X-CSE-ConnectionGUID: NFd8Vc5LTwqpRBbK71NLPA==
X-CSE-MsgGUID: K3aVh1xRQaKS5Jd8+cUUPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="64726497"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="64726497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:30:35 -0700
X-CSE-ConnectionGUID: KN2obHkZSd22Na0x0vUKtg==
X-CSE-MsgGUID: lrS7LNsARA+M7AcZJmPtog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="160478552"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:30:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 12:30:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 12:30:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 12:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3wH/LiX1wJIAsQzCUTYRkuay8iUbaojzZbuWPPQw7nRiKY9/rNz0C3h9TUn6BHSwT9eyumF42AivsK4M73X6bHW84McX8iwsnbvl5D/wsfv7pbH+8q4OpNx2wXuY3OHuyxdFRo/9YDiHnDKGKZihxCDzVmconq84xmg2JOMGzrtzDF7w9mNt01mNCbkZ1dBPaPYO5O1SXqX4zhdxEB4aDOLe7KnPanfmxJXNVwhT2DpTbf45R1prdu6pZyJyyhhdNtA4sswQMf5eanGXYARdbmXjapy7Mxva8eST9dqfbFOVC6t76A7AhVbeYIJZ478ZLRWJamxodJwDBUaT4iuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsfLmLQbDTMeTdnA0/6vc4rc0FKjJNYNsO5xmMoGU2o=;
 b=fcZ2PgrX+Sfld6ea8O2wlgb6Fzu9n4jG2xonKUPB2w1yK5lHxv/Dvgod84hkymFA2Ur4G+KZxNHPgwgjgufznb66uzRrpGEvUk6GGJTB1DWEomtat1eJaL+RPrSiyt4MSSwLmzLdxgtQd+hZkwWRcns6zDtvcd51ST8XtAPSMw7Jsg+AhiFHkm62dbvqk67gU90zpHQtyWmAUGEfaVQJXCM5IUbYI9grgVKFQtKXLXqH70u9DmDuL1w6uVZyCB1vnO2VSMmHAGwoN0/xaCGVpZa2u8K6N7OVfabcRMux1tmLvvgDffX3L2+i/k9D4uXXa7ryA4huosM10W24BWFFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH3PPF5D8CD6E8B.namprd11.prod.outlook.com (2603:10b6:518:1::d25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 19:30:17 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 19:30:17 +0000
Message-ID: <76607229-60f0-45b9-b3aa-ab2c9da549af@intel.com>
Date: Fri, 11 Jul 2025 01:00:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5,resend i-g-t 3/6] tests: Add kms_debugfs
To: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <katarzyna.piecielska@intel.com>, <zbigniew.kempczynski@intel.com>,
 <michal.wajdeczko@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
 <20250708144039.53482-4-peter.senna@linux.intel.com>
 <20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com>
 <71154125-b7e0-43a4-8732-607ff2ac82f5@intel.com>
 <afe3c7b1-f326-4b76-9e79-165bd5da3da3@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <afe3c7b1-f326-4b76-9e79-165bd5da3da3@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH3PPF5D8CD6E8B:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a466184-3269-4b14-1f8a-08ddbfe8336b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHI3SExUOVdhZkd6VjVTWk13WEVDb25PY0VTbm8rQWF3d0lTQTZTMERJdnlI?=
 =?utf-8?B?bVJNUStHMnFyQTAxMXBjcHF1bVdNUUd4V3ZuWlF1UExGaTVjY2RXQS90UUZ1?=
 =?utf-8?B?YWhDYkFmZmNRSnB6OElnY2JVQ1FVVVlSM282MjVJRkoybGxwanZQdmp5Q1po?=
 =?utf-8?B?MDJXTW9Ma3hYNmtEUUFGVDdJUDZsUHRRK0dzRkpDV0FmczdnOTlqMnF6WHNR?=
 =?utf-8?B?UFdRK3BuQzBxaFk5blNPVS8vTS94SGhsNzdRd2E4WlhFOEhDMW45eXY5dXdq?=
 =?utf-8?B?SVRZRlRESXB3bTRCbGNvV2ZLcHZod0tLRDZ1b29HSTFDc0pRUkU2UXlYNG5O?=
 =?utf-8?B?eDU3c2ZCZWFnL0VqNUZPNXhMaWZEWGhCbElqcXVZV3RncWZyNTMvMS90Nkdz?=
 =?utf-8?B?cTYrVnZXQ00xOC9nWjJGSWNxQXNmN3dSRHA3Z2p5UjhCRHRKM0orSjNwaWlv?=
 =?utf-8?B?MG52NktlRmp4SnlaRzcwczZsenFLT2pmUnB2VHB1TTlOS25FaUYrMnYrdklr?=
 =?utf-8?B?ZnA4eTc2RmlLZTBHcUVnUXE2aGk3Rm9OSldOcmZGeVB2WFppUzhHaG5GelVX?=
 =?utf-8?B?cEdCSjR3QXlrZlZrbWFvakhmQ255QWo2L3hqcFh1a0QzRzVvRXkzamc3SnVQ?=
 =?utf-8?B?R1k5SFVKV0Q1MVRaY25Yd2xiK0xGZkxvU01BYStEWDNQRUEyR3k1YUppWmFT?=
 =?utf-8?B?NzJORks1dFZ1Z1hMdU0rQ01YTkJHZ1lxWGV6VHp3djR2U2w1T2ZDRitwR1lW?=
 =?utf-8?B?S3dhNVdQUFBmRTg5UURacDJTV1ZnTGZQaWhaR2ErNlpDVnBCSmh4dGY1MGEy?=
 =?utf-8?B?OU5DdXlDMVZKU01EQjVUTUVoQURqSno0UzBsUDUwcWZCdU45V2NlQnFNc1pR?=
 =?utf-8?B?aHZySDc2N3pMRkxQSFlpWUh3Wkc1aEVaMXBpemJUejcyS2s3L2MwVGo2VFNW?=
 =?utf-8?B?V3FWQUl1TW5wL0V6T3dZU0k2THMrbERiT1JnWGpVMUtEWXNhVHhoa1BScjNL?=
 =?utf-8?B?M1g0MjVEb3Q1Z1N5N3NNWUZaWmNZUkRQVG5pbjRidVpHZjZIYUsxbVRndFdx?=
 =?utf-8?B?Ylk5Wk5SY0ZRdWp2MlZub2RuOGlSclA4MlJHTGhwV0hmaXZXeDBQckI1Y3FT?=
 =?utf-8?B?Z2N5UHd5T3JFTzNOWUQxM2ZkSDEyaENKOHJvVDlIeWFzU3ZvYVNySERzVVNF?=
 =?utf-8?B?bkFicG9JTjNBYkFiU1NzdzNxMFhMbW4ydHJUUjd5MmtSQ0RwTmxLczFaaVMz?=
 =?utf-8?B?bi9QZXhSWkpVNGV6L0M4aUxFU21KUHpycHBYVXlobE04LzJUaXphRDhKOVFl?=
 =?utf-8?B?V0pZR1BsYzNITElyK2tUUFBFVHUxN29JdTQ2aEZ4ZnBId2l4T1ZlSW0waU1M?=
 =?utf-8?B?ZnA3eGI2TXQ4a3VsR3F1UGNJbjVubGxHSjQydnBsUFc2ZmdvSkd2SGZhck1Q?=
 =?utf-8?B?dXZwY0xGMHFiN1R4MWJmeXFTMVVaVTluOFRUTnpKQ1FQMXh2WFZ0dGh1dTRC?=
 =?utf-8?B?NFBKK2o2QXBZODBMb0lUWkhwd0NrMTVJQStJNUQrMkUyak5vMTEwVEcrU0Nq?=
 =?utf-8?B?NGF3bVJmOGVocUkycmpWZDJXYkFSMlV1RTFRTnpyU0ZFV0ZqakVLSHRSZWhR?=
 =?utf-8?B?T1VzWHI4UUNON2t3dzRkY1lNckNMRjVBeTAzMWhQUElRT3lYRGw4RlcvdCtD?=
 =?utf-8?B?cGE2OFhKN1NZdFFVelk1Ty9pZ1RZZEdJcitqK0N5K0JwK0NiblVqcXgvcE43?=
 =?utf-8?B?eDhTL09scXF1SG1IQ2RNMEcxSE5COGpOQ01UNkN3OWdUVEx6eWpoTXBVSk5j?=
 =?utf-8?B?dG12YlRUUU1aUjJCYXRHMm5UNWJvaWY5OHFGdCtlcFZSdmU3aENMd1V6S0VZ?=
 =?utf-8?B?QWF4bzRPMHViYjhudERrejJFRWN1RWJtWXJDU3hsVFRmM0QxZXhhUjdPZ2lt?=
 =?utf-8?Q?hAnlqWLtFTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZJQkJvZ1RBNWl2Mk1TSjdiMVV5b1VaSzh0M3lUZVlwWEM0YStKUFJ4bGlq?=
 =?utf-8?B?NFdpSnlHdXp1aEVxWW5yQSswYmZob1pZRjFJUHhxejl2ekdIU1kwWkNnVnFV?=
 =?utf-8?B?UU81eE13UGFuZTJjSEQ5RmFmTkhuN3hZQmdWalg1cUp6V0NXUHJNdUI0UWls?=
 =?utf-8?B?UmhiL2tBL3hQK2p6ZmdTS1BXc3AzbkdiR1ZSeWFRUktZR2lZRzBheHphMFE3?=
 =?utf-8?B?aC9FM0xacFlPNHA5VW1IenpBUFR5U1dLYUpOdFl6cHJOUUFDNU5JalVKaU95?=
 =?utf-8?B?TnhpZERQKzE0TjV6QUMrdUp6NWhHTDdyTENOVS93cjBrU1N0OVN4cnVMNVJ5?=
 =?utf-8?B?cTZ3L3lrRkNZc0JKeUh2TTROK1gyKy84cXh3cEZDclpyMGV2eWxnYm9Ic2pv?=
 =?utf-8?B?MUJ2REo3ZFlyU2doN2NxZk5sbGJyUUFjYnJoM29nVWpqZFJ4MXVIMzJXY25n?=
 =?utf-8?B?bjlhTGx4TFk1bTV0MnMwaDdhb2d1UGN3OGlyUHZGcGNKSG9RcGFOa2pUVkty?=
 =?utf-8?B?YVN1empja2JCbVhnQTlmTlBMV01sbWZnNUZJK1F3VDVWVk9TTDkvODMyTm9U?=
 =?utf-8?B?Zyt6Z0MyTENlVVByZVNxbGdOSDhQcmwzNGV2RWJLcTVka29VZWVkczU4NzRM?=
 =?utf-8?B?YU5GaHpJeEdsb3VGaGJPOUI4VERXTS9hU3c4SnRWNnR0OHFxQzZWSUJkWjBx?=
 =?utf-8?B?NVVOQ3VHRFRRNWVTRGl3SGNHZjQ5T0pERzFtQ0xIRGY0dG5pWmx6VHVZanpU?=
 =?utf-8?B?VE9QYkh0cjkyWnJSM3lKbi82RGk1b3RRMyt2RFhDaXhTc3FqTWJxNnZyZ2Jp?=
 =?utf-8?B?dm9vTktKbEpRbklGbHEwRHlGdHR3RW1zeUFTQ00ycldtVGdlRWhlMi9hMm53?=
 =?utf-8?B?OFZzNE9TcnBMaGIvY3Q0OHMwTkNyd1ZNM2dFU1E0cFRmd3EzaUdDYW55RE9D?=
 =?utf-8?B?aStWTmFrMjMzMmRtZHBpdmVHK0QzT2JsUEJUU2lKMkhmSkNWbGx2anU2RGRB?=
 =?utf-8?B?MGk1djJyZFlIL3pLVmpWeU5FT3pzQ2tPUnoxbU5vMldvODE2YUJwNW1hYzhv?=
 =?utf-8?B?K293VHg2cXFOaGZPcE1GVXBoVEthMktYeW1Ddm00SVNxeGJyam9OWUFZMk9M?=
 =?utf-8?B?UUhyRytPYjZSS1ZHSzNmNkJpYWt3NVlkUmVkcE9WS1BPN1ZLNmp1TUIwT29a?=
 =?utf-8?B?Q204SHFWMGZNYStjSVMvOWdtRU5ZVlB4blN1UDVlWnhWKzFRNy9ObnBGT2Vk?=
 =?utf-8?B?SUdTUXEycGpHSkJDRTBNbzI4eUVEem9keFdkb1pMSHZ5b25GYTR1R3JXdmRv?=
 =?utf-8?B?ZUtQZ1Y2d0pQcTJ3U013Mk5vSlV5a2dEZ0k3NFNTVGwrYnR6bFBCRS83cFpo?=
 =?utf-8?B?TDcvWVlSZDlQMTcwdlI1Qi9xenJWNWQ3Q1NwT3NsRjRvQVBTTUtUQkM5L1Fh?=
 =?utf-8?B?ZllqTDMwVHJONHZDbzE4MnA4OXRzOHV1RGVUWDc0SUdxL0cxL2NnbWFPTWpm?=
 =?utf-8?B?VXFTV3E2MFpjclBVbHlJWlZ4MnRRWE1IZWlOTmVZZTFrZXlraHFhTjdKZ29j?=
 =?utf-8?B?OXZIR2xzME5sS1BCejJlcEh5RlhkQ0czK09WM0hISytpbm42eU5UYW8veExE?=
 =?utf-8?B?TngwS0RyZGNrSW1oNVFiRm8wT0hsTC80Qkl6SWU1OUJqTFltVlJ1NXBiMGdJ?=
 =?utf-8?B?TkZJdUgvQmhrZXdYOGhYd09xVFZocTBtQXpJWWtoZlQxTDhGQ0h3VlZWTTlR?=
 =?utf-8?B?NVd6SVg0UWtUcGNTeFdmSnplWUUycWErbS9XL081VEVpS1JkZ2dUZFg1ajQ3?=
 =?utf-8?B?TVVaU0V3UHZrMHJJZjliN2EwWjk1dmVRalY1Rk5GdDlNbWpZVFVzTEhETTZi?=
 =?utf-8?B?elhWOE5nbnJrMG1NZ0g4UFRNbVM0dmQzdWJCcEd2a1lzdHlHNVpHLzFpMHRE?=
 =?utf-8?B?Vkd5c0dEaGZGVENaRlQ2V3dkaTZkclhiN0hxYmNieWs0TVcybFZDUDdCSkhs?=
 =?utf-8?B?Mm5BSjJ3MDNQYktIZ1BJZmRZaWNDclpiTTcxdnZLcXdkYWFnNDFLL1ZzMEtO?=
 =?utf-8?B?NHJycTU5N0U2OFA1SGVsVW1JMmpGWkpGanNsYmtTZnUzb2piUGNKK3lDS0ly?=
 =?utf-8?Q?A891Nb0+NI3YlOeAU/GBPeHN0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a466184-3269-4b14-1f8a-08ddbfe8336b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 19:30:17.7245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFlH/nOoIdbUcC8IApUUaNP7OXOUrVKRVs82fdefJ7xEQL+cZrjcARmeOpOgQ2ApcHH/mTejxD/sug5Gfi8Kyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5D8CD6E8B
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

Hi Peter,

On 7/11/2025 12:36 AM, Peter Senna Tschudin wrote:
> Hi Karthik,
>
> Thank you for your reply.
>
> On 7/10/2025 6:09 PM, Karthik B S wrote:
>> Hi Peter,
>>
>> On 7/10/2025 3:43 PM, Kamil Konieczny wrote:
>>> Hi Peter,
>>> On 2025-07-08 at 16:40:35 +0200, Peter Senna Tschudin wrote:
>>>> Introduce kms_debugfs that is expected to work with any GPU, not limited
>>>> to i915 and Xe. The test powers off all available displays before
>>>> reading debugfs files, and then powers on all displays before reading
>>>> the files again.
>>>>
>>>> Cc:lucas.demarchi@intel.com
>>>> Cc:rodrigo.vivi@intel.com
>>>> Cc:kamil.konieczny@linux.intel.com
>>>> Cc:katarzyna.piecielska@intel.com
>>>> Cc:zbigniew.kempczynski@intel.com
>>>> Cc:michal.wajdeczko@intel.com
>>>> Cc:karthik.b.s@intel.com
>>>> Signed-off-by: Peter Senna Tschudin<peter.senna@linux.intel.com>
>>> +Cc: Vitaly Prosyak<vitaly.prosyak@amd.com>
>>>
>>> Vitaly, could you help us and forward this to your CI testing
>>> team and ask them to test this on amdgpu + display connected?
>>> This should pass as it is a simple debugfs reading.
>>>
>>>> ---
>>>> v5:
>>>>    - use igt_dir_process_files_simple()
>>>>
>>>> v4:
>>>>    - change test name to kms_debugfs
>>>>    - use the wrapper function igt_fit_modes_in_bw()
>>>>    - use igt_display_require_output() to ensure there is at least one
>>>> display
>>>>
>>>> v3:
>>>>    - renamed the test
>>>>    - Removed reference to sysfs from comments  (thanks Kamil)
>>>>    - Updated description to match the display part (thanks Kamil)
>>>>    - Moved from "display" to "heads". Our CI uses "headless" to refer
>>>>      to a DUT without display and it is shorter
>>>>    - renamed subtests for shorter names (thanks Kamil)
>>>>    - fixed comments style (thanks Kamil)
>>>>    - updated CC list
>>>>    - changed the order to test first with all heads off then with all
>>>> heads on
>>>>      to prevent the need from powering on the heads at the end of the
>>>> test
>>>>      (thanks Kamil)
>>>>    - removed snprintf from test names (thanks Kamil)
>>>>    - removed subtest group (thanks Kamil)
>>>>    - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
>>>>
>>>> v2:
>>>>    - changed style of comparison to NULL
>>>>    - moved to a separate patch
>>>>
>>>>    tests/kms_debugfs.c | 151 ++++++++++++++++++++++++++++++++++++++++++++
>>>>    tests/meson.build   |   1 +
>>>>    2 files changed, 152 insertions(+)
>>>>    create mode 100644 tests/kms_debugfs.c
>>>>
>>>> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
>>>> new file mode 100644
>>>> index 000000000..7e10c4bca
>>>> --- /dev/null
>>>> +++ b/tests/kms_debugfs.c
>>>> @@ -0,0 +1,151 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +
>>>> +#include "igt.h"
>>>> +#include "igt_debugfs.h"
>>>> +#include "igt_dir.h"
>>>> +
>>>> +/**
>>>> + * TEST: kms debugfs test
>>>> + * Description: Read entries from debugfs with all displays on and with
>>>> + *        all displays off.
>>>> + *
>>>> + * Category: Core
>>>> + * Mega feature: General Core features
>>>> + * Sub-category: uapi
>>>> + * Functionality: debugfs
>>>> + * Feature: core
>>>> + * Test category: uapi
>>>> + *
>>>> + * SUBTEST: display-off-read-all
>>>> + * Description: Read all debugfs entries with display off.
>>>> + *
>>>> + * SUBTEST: display-on-read-all
>>>> + * Description: Read all debugfs entries with display on.
>>>> + */
>>>> +
>>>> +/**
>>>> + * igt_display_all_on: Try to turn on all displays
>>>> + * @display: pointer to the igt_display structure
>>>> + *
>>>> + * Returns: void
>>>> + */
>>>> +static void igt_display_all_on(igt_display_t *display)
>>>> +{
>>>> +    struct igt_fb fb[IGT_MAX_PIPES];
>>>> +    enum pipe pipe;
>>>> +    int ret;
>>>> +
>>>> +    /* try to light all pipes */
>>>> +retry:
>>>> +    for_each_pipe(display, pipe) {
>>>> +        igt_output_t *output;
>>>> +
>>>> +        for_each_valid_output_on_pipe(display, pipe, output) {
>>>> +            igt_plane_t *primary;
>>>> +            drmModeModeInfo *mode;
>>>> +
>>>> +            if (output->pending_pipe != PIPE_NONE)
>>>> +                continue;
>>>> +
>>>> +            igt_output_set_pipe(output, pipe);
>>>> +            primary = igt_output_get_plane_type(output,
>>>> DRM_PLANE_TYPE_PRIMARY);
>>>> +            mode = igt_output_get_mode(output);
>>>> +            igt_create_pattern_fb(display->drm_fd,
>>>> +                        mode->hdisplay, mode->vdisplay,
>>> Align here.
>>>
>>>> +                        DRM_FORMAT_XRGB8888,
>>> Same.
>>>
>>>> +                        DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
>>> Same.
>>>
>>>> +
>>>> +            /* Set a valid fb as some debugfs like to
>>>> +             * inspect it on a active pipe
>>>> +             */
>>>> +            igt_plane_set_fb(primary, &fb[pipe]);
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if (display->is_atomic) {
>>>> +        bool found = igt_fit_modes_in_bw(display);
>>>> +
>>>> +        ret = found ? 0 : -1;
>>>> +        igt_require_f(found, "No valid mode combo found.\n");
>>>> +    } else
>>>> +        ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>>> Add braces for 'else' here:
>>>      } else {
>>>          ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>>>      }
>>>
>>> You could see it yourself with checkpatch.pl with options from
>>> CONTRIBUTING.md:
>>>
>>> 0003-tests-Add-kms_debugfs.patch:99: CHECK:BRACES: braces {} should be
>>> used on all arms of this statement
>>> #99: FILE: tests/kms_debugfs.c:69:
>>> +       if (display->is_atomic) {
>>>      [...]
>>>      +       } else
>>>      [...]
>>>
>>> 0003-tests-Add-kms_debugfs.patch:104: CHECK:BRACES: Unbalanced braces
>>> around else statement
>>> #104: FILE: tests/kms_debugfs.c:74:
>>>      +       } else
>>>
>>>> +
>>>> +    if (ret) {
>>>> +        igt_output_t *output;
>>>> +
>>>> +        for_each_connected_output(display, output)
>>>> +            igt_output_set_pipe(output, PIPE_NONE);
>>>> +
>>> Please add some counter and abort on reaching max_retry
>>> to prevent infinite loop here. Something like:
>>>
>>>          ++cnt_retry;
>>>          igt_assert_f(cnt_retry < MAX_IGT_PIPES, "Too much retries
>>> %d\n", cnt_retry);
>>>
>>> Karthik or Swati: I am not sure if this is needed, could you comment
>>> on this here?
>> |I think we don't need a retry at all here. If there is a fail with the
>> first commit just try if we're able to go ahead after using
>> 'igt_fit_modes_in_bw' and if it doesn't allow just skip the test here.
>> That was my motivation to suggest to use the wrapper on the previous
>> revision of the patch.|
>>
>> |The only issue currently I see(that I just observed) is in
>> 'igt_fit_modes_in_bw' the try_commit we're doing is using atomic commit
>> by default, although there is no reason to have this restriction. So
>> ideally we would want to fix that in lib and then just have something
>> like below in this test.|
> This is getting a bit out of hand for me because I don't know much about
> displays. First you asked me to use a wrapper, now you want me to fix
> the wrapper. I will pass fixing the wrapper as this may lead to yet more
> unrelated work.
>
> Should I revert back to not using igt_fit_modes_in_bw()?
For the lib part I can send out a patch, should be a quick fix and be 
independent of this series. Would that be fine?
>
>> |if (atomic)|
>>
>> |    ret = igt_display_try_atomic_commit|
>>
>> |else|
>>
>> |    ret = igt_display_try_commit2(legacy)|
>>
>> |if (ret)|
>>
>> |    igt_require(||igt_fit_modes_in_bw(display))|
>>
>> |igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC :
>> COMMIT_;LEGACY);|
> I am not sure I follow what you are suggesting here.

Ah my bad, if we actually fix/update the igt_fit_modes_in_bw even these 
changes are not required as these would be handled internally in the 
wrapper. So we would just need something like below.

igt_require_f(igt_fit_modes_in_bw,"No valid mode combo found.\n");

igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : 
COMMIT_LEGACY);

Regards,
Karthik.B.S
>
> Thank you,
>
> Peter
>
>> |Regards,|
>> |Karthik.B.S|
>>> Overall code looks good.
>>>
>>> Regards,
>>> Kamil
>>>
>>>> +        goto retry;
>>>> +    }
>>>> +
>>>> +    igt_display_commit2(display, display->is_atomic ?
>>>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>>> +}
>>>> +
>>>> +/**
>>>> + * igt_display_all_off: Try to turn off all displays
>>>> + * @display: pointer to the igt_display structure
>>>> + *
>>>> + * Returns: void
>>>> + */
>>>> +static void igt_display_all_off(igt_display_t *display)
>>>> +{
>>>> +    enum pipe pipe;
>>>> +    igt_output_t *output;
>>>> +    igt_plane_t *plane;
>>>> +
>>>> +    for_each_connected_output(display, output)
>>>> +        igt_output_set_pipe(output, PIPE_NONE);
>>>> +
>>>> +    for_each_pipe(display, pipe)
>>>> +        for_each_plane_on_pipe(display, pipe, plane)
>>>> +            igt_plane_set_fb(plane, NULL);
>>>> +
>>>> +    igt_display_commit2(display, display->is_atomic ?
>>>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>>> +}
>>>> +
>>>> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
>>>> +
>>>> +igt_main
>>>> +{
>>>> +    int debugfs = -1;
>>>> +    igt_display_t *display;
>>>> +    int fd = -1;
>>>> +
>>>> +    igt_fixture {
>>>> +        fd = drm_open_driver_master(DRIVER_ANY);
>>>> +        debugfs = igt_debugfs_dir(fd);
>>>> +        igt_require(debugfs >= 0);
>>>> +
>>>> +        kmstest_set_vt_graphics_mode();
>>>> +
>>>> +        display = calloc(1, sizeof(*display));
>>>> +        igt_display_require(display, fd);
>>>> +
>>>> +        /* Make sure we have at least one output connected */
>>>> +        igt_display_require_output(display);
>>>> +    }
>>>> +
>>>> +    igt_subtest("display-off-read-all") {
>>>> +        igt_display_all_off(display);
>>>> +
>>>> +        igt_dir_process_files_simple(debugfs);
>>>> +    }
>>>> +
>>>> +    igt_subtest("display-on-read-all") {
>>>> +        /* try to light all pipes */
>>>> +        igt_display_all_on(display);
>>>> +
>>>> +        igt_dir_process_files_simple(debugfs);
>>>> +    }
>>>> +
>>>> +    igt_fixture {
>>>> +        igt_display_fini(display);
>>>> +        close(debugfs);
>>>> +        drm_close_driver(fd);
>>>> +    }
>>>> +}
>>>> diff --git a/tests/meson.build b/tests/meson.build
>>>> index 99d7d95be..1009bef2e 100644
>>>> --- a/tests/meson.build
>>>> +++ b/tests/meson.build
>>>> @@ -29,6 +29,7 @@ test_progs = [
>>>>        'kms_cursor_crc',
>>>>        'kms_cursor_edge_walk',
>>>>        'kms_cursor_legacy',
>>>> +    'kms_debugfs',
>>>>        'kms_dither',
>>>>        'kms_display_modes',
>>>>        'kms_dp_aux_dev',
>>>> -- 
>>>> 2.43.0
>>>>

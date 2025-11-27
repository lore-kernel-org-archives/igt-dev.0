Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F67ECFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 04:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2676310E061;
	Thu, 27 Nov 2025 04:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKYItvqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E32510E061
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 04:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764216836; x=1795752836;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jv3vtPt5Fp0nwoLIn/thuIkCxh0e9G0WhZ0YvFy10ww=;
 b=PKYItvqfMCr9lsgC4FzABeYy9M36cmDlNq6IcPEUf+ID27nsTnnrs6v4
 Youx4pebT0nuoA8QozH5U3/EALlwIBZxzq2sI7s4hKgKE4pWjBp49T0Yg
 al77OZbJLM2N5GKtZMLXpChcmcsam7rIaCyjWGTvDHaoZ+gNfpTqwDh2K
 jL9Xz562yhR+4KUBJFVRdIox8qGTuhJHq8DRfg4/3DAm5MrTOAF6ygXCc
 KpZ4j/wZawKlYc1lju33w/GLuexw5+Bhh9Mp8pYKxFS5lQJY8Jqqfykvo
 HG/o9bDG8vdjcsoFWMggpr5FyrDQuVRYyDQGPLqucXRwfN5Vb6SYmPJVi A==;
X-CSE-ConnectionGUID: EdGNqt3TTMCjSHlBnwI3+A==
X-CSE-MsgGUID: BZ3jQn5NRZijOf/Py6m8qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77624251"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="77624251"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 20:13:51 -0800
X-CSE-ConnectionGUID: yXautn5DSZGwmLNZKQqYWQ==
X-CSE-MsgGUID: ldjvFypZQTmwsqx507dmYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="192253118"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 20:13:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 20:13:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 20:13:51 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 20:13:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNHKtJFJbLvXsK67Z8+zsLjwQ7ak7Pf+iO2zkaLjOXPnt8O961rG4KMn0xUInoraGdH8Mw48QnZTgUUIypkANdW1CL+JEl26U3UQ206F3RNnuNfThfnLWa8GzwurqDsYVq43MKeJX0Ti23QOPAVBxYEJFW5H8cVjE6xwxs8yF9txuWfOBJptD/owzzNa1FzqZ63/wFRGrSgKAI24CZkLzU1LGUh8gCDQNQc1WHAyAo/efP+KU/0C+uITxbylKM3au31xvWNgxXHu8RztwJuqeWueGqa2r8j2m08IwWFF0q3ETjohGWS/Q9UjZC0lN6F6/wylWW810dW57x3uACbPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1DFNBN/jXRAaxgYPbvU4HEpEy/oQRtHmhjQS7G+q+E=;
 b=Bqx1WiIK+DWh5eWRwbXNB329s7kpG/B8IsGiyNwfKl+zTHNFKgkzTqTmtd6NUna52s0/b8IrQD/zSSbegC9OP9oxJReBr9Yc6DkBK+zziSfZu9wdMqmJYmvwPMn1AvxxCAgqadIIfP5MNzzuIz0hyQd859YvL+NMrvsomuC2AWq+jgdDK7aD1jHpYmBG68oAGN63FuXt7WfPgohQ8cjJEmBSNeTr9furfEmFsLJnDxGwlEy24XVEBbb7kQeu9Cdz7ILnPUL3THe05GkZdRztBhwTfn67KS0wBJQGr/tCR8kxksswbx//GCwAx0nrM0q1lELy85l4CWlMlWV1dCNzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 04:13:49 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 04:13:49 +0000
Message-ID: <0f6b3200-32a6-4719-bb81-3f81513d268b@intel.com>
Date: Thu, 27 Nov 2025 09:43:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/6] lib/kms: Add helper to detect presence of
 scaler blocks
To: <igt-dev@lists.freedesktop.org>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
 <20251121123134.1099006-6-swati2.sharma@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251121123134.1099006-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bbeb6d-4533-4248-5944-08de2d6b5da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1Roc2NGSVg2cVpaaCtJOU1UTnkyNm9FbWJXMGhWRmlhczUyTFAzNXE3V1hR?=
 =?utf-8?B?NjB1QXJMaFZJNWlheWoydG5EQnJuUlU1dm1kTUYzR0dWWEFYb0xMVGovS0sz?=
 =?utf-8?B?ZWxhTCtiREJMcGdVNUwxV2UrQkEwT0RUY3ExRmE5cit0WFFIbVhMRTZRbVFR?=
 =?utf-8?B?VVpqanlvbjgrelgrdzlBdVFSRnh0UTlQZjhNdSttUkphc1Q0RXBIYlBIVE5K?=
 =?utf-8?B?TXdOMTc4RTBMMFBINTYyMzZWWVBPdnNGbnVVK3JHamxLZnU5dXVxZ1IwT2hs?=
 =?utf-8?B?Mmd2QUZWYkRXWjBMNjIvcno3dGFTQ3dDenhlOXRjbytIZkYvaUdkVVZpdWR6?=
 =?utf-8?B?NUppeElJNXJKaElJRlZIQU5Sdlh2dU1oMUViYThFdURsbXl1UXJNaHJ5TjJY?=
 =?utf-8?B?WlpLQVZUWTN6dkFYQXRQNGx6TEt6aC9BNUdqRDNlWVIxZU9YUXd3ODVmekRS?=
 =?utf-8?B?NG5ZWS9FdXJYcE53emVFdExqU3VWL2R0eVlIUVZ2WStwUFVxaTdkWUhuWEZ3?=
 =?utf-8?B?VW9JeHg4UFJyQkt3UWtIUUtEVG9seXl0bmZ0bDJtRkp6d0hZMjdmc1ZoRmwz?=
 =?utf-8?B?UTVUQ2tqazJ6T21hTktLYlQ2MS9kZ3VJY3I5Nys5dTN6ZFRhYUNvVlNwNFp5?=
 =?utf-8?B?dyt2amViaTFjdityNkJ2bkN5clRVanBCM2xLQUdHd3RFMmxaOVBvQzh2cWd4?=
 =?utf-8?B?YlBlVW5jZFgzM2NqYjkzK0s1TUprbldVS05ubzAreElzZVJ4cmcyWjZoMmdX?=
 =?utf-8?B?OW1oaUlnSHloVHBrc0Qva3JnNzR5cmdrU24wSU9PZHl0TmZuUlcydlRGV1Zp?=
 =?utf-8?B?U2pNWEFxZU4xckdoV2toZ0pkTkFpQUNRRXEzOVFEelFsV2pRUnYyVU5KQWV6?=
 =?utf-8?B?RWtSL1NXclNObmhCR2NWaXVOTE9iQkNXb05rbGJoNUNLN3lhVUFPQXIwek8z?=
 =?utf-8?B?SW1rdnB5N3BPMS9tdDNsRWdvT3NIbEszRWtzYmZqOWJPMWRIa2RQcEtuUVZt?=
 =?utf-8?B?ZklCcjNHcGtGc25rOTVHRmxNbU5XVEdidjJXQVBTbkQ1RDZEcGJyRTVWVFJ1?=
 =?utf-8?B?SGZ0bUJQUDJoN1NTdXdlb1pmUDdCdFlIQWo0eUFDUGNHOG52WUdXVVFtcEVX?=
 =?utf-8?B?M0V1SHdmdHZJdjkvcjdwdVJadVN0TEZub2p0anJDS2MzckZOUlFsU1ovZjJq?=
 =?utf-8?B?SmUxQm5XaDRtL3FIMTgzRkJ3eUE5YXZaWWJjajU4Tld4NVNHbHVqQ2pQUUpr?=
 =?utf-8?B?MlpjbW82VzJhL2Nxb010c3UyalZ4aEFkZEhUQ1ZUdzZJeGNNU240YWFwekVD?=
 =?utf-8?B?RVZSbEkrRklPeFFTT1MyQWljN1BMTld2cncxcUFIODBPODN6UXRMSkFTeDJR?=
 =?utf-8?B?US9Bd2paRjBhVjVoc0VvNXNRb1BlL3h0THl0RDNKVXY5RmgyNXZ1UWVzdVBX?=
 =?utf-8?B?TFcrTmNXVGFZYXIydE1CbkN6YmtNLy8zOGJXMkNFSWdDYnNOcXdoenJiK1BD?=
 =?utf-8?B?czQwOHFNbVo0VDlLV2hzaXdwT3d6aHFSd3g5MkFTWTB2VnF4aDlqNHNuT1gw?=
 =?utf-8?B?dFNaRExGaWRGaHNXdmZoOU5Oc2dTSnp0cGV0Q1ZlL3hRcGFHcHlBOWQ0ZDRq?=
 =?utf-8?B?QkIrMmZnZCtvakZHdkt2NS9kcG1Rem5HaWJUR1FSYVAvUzVHWElTYmljVGpY?=
 =?utf-8?B?RGp0MEpOT2swRDFmQVdxR01UR0pteUJJTE1EMSs4TTNJOW12bGFEaVNTaUoy?=
 =?utf-8?B?TjVyVllFTVViSGJhZUxYNjFUek81S2djNEg4NloyTERoVWg3Y0lXZmFUVHBP?=
 =?utf-8?B?NlduYlN5RlFoeExEUGJyOFozOGpNRXplOHdTYkpMSVdjb21lcGRWNlFhS3Nn?=
 =?utf-8?B?K0ZJcVNIcnZ0VHpvTEpQYXZIMk0xUFRrMldOSzdBUTJrNkxzWVkwVlV1cDln?=
 =?utf-8?Q?GfjJn7lluxnWSZNjLfv3THRAdGIWwID6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3J0dFBUQ2kvR0VpL1RBcTVkbW1EczBPbGlqQTVucTNyTi9NSmhvSjJZRW0w?=
 =?utf-8?B?SXR6TjNmRitPUnJmVjJmbG81MkJPV0sxU1FGRnN6MUxVWGptWFk5ekgwTS9Q?=
 =?utf-8?B?VGJNZUlNcmwvTXJNazZCejNMeWliVmV0QVlGMC9QaHNwSG11NnZIcHhPWkJl?=
 =?utf-8?B?T1owNWpZalh3NUttVTI5cDR1d1FGOWRYQVB4NmhmU05jT1FHNlhiQ1dSN3Bj?=
 =?utf-8?B?Z1RNNk52aytZdlRqWTdyUTFvWkNMN1hHYU1nQ3VsQ3Z4Rm8rVmI5cENseWxk?=
 =?utf-8?B?ME1MYjJxbFBFRUxpcG43MU4rWFd0bjlsaU56S2ZTM056cmZDdjFzY1hBbGZF?=
 =?utf-8?B?VkRFbGJ3a2k0eEk1S0QwRnZsdkxtcytJRzFlYU9oVmg1a3FOWkZQSnI3NHRx?=
 =?utf-8?B?Wk1sOXFjSUY5aDAyakxmOExRQVJsalFwSU9ablhXalJFdHVFNGtSOVgyb0gw?=
 =?utf-8?B?Yi9PRkxXYzVFaVAvYTZ1TXdJNUlDaTdoa1lWS2ltOFB1cUE1TzFJK0s5MElv?=
 =?utf-8?B?Rm5sL25oSkhwZGxNVmxWNlNmdXlOaEhVVnd6WVIyUCtiSUVGZ01NVW8xaHFY?=
 =?utf-8?B?QndIMmFJR0Q2aTZZc1BDZ004QVkycThaeFVxNS90QkFBMDRoTlBkelFVYUd5?=
 =?utf-8?B?N0F0QytuR0RpT2dKQ3ZOUEZqOHd1Q2UrenNJYjN1V3pVZ3FoOVlMbUsrYUF5?=
 =?utf-8?B?T3dIQzJGT0xEWXFLTThIVzJzbXQreWJyaitSajRsVEw2TjFFUU9WS2hhS2Zj?=
 =?utf-8?B?cGo4L1lEUDQ1MW9lbFp0c3pUbHpqWnVtdUI1cjZwTjZGSXl3ZG80VU5HUlpF?=
 =?utf-8?B?YTUyamlLRTUrd0VHL1BJcHhTNnpvN1JuSWJuNFRJYjdKTHZXTnZ1ekgzRjNN?=
 =?utf-8?B?YUd5NzNFS0E1VHhGUk1hQWphSVNVUHE2Q2x5Z3FoaGFxdmVlUXJPNGgrV1Rz?=
 =?utf-8?B?YmtFUFdBNlh0dUc3UWk2WTZBOXhXZXhKNytpZ3F4N2t0T3g4cnk1UFBGQW5j?=
 =?utf-8?B?U3NFd1BoR3pMc0t0T0RzWkEzdjJTVVEvU1RGaUFvaW9GUDFRM1gxRjZBanNT?=
 =?utf-8?B?WVh2MXVsSHR2b1J6aWRHaE50bFd1SExKUmxYM3NCUGJTdkpMV0I4ZXdyb3pk?=
 =?utf-8?B?Qnh1czZsMGh6WDdZb2NwTkJna1pnS0hZTVlUd0syQ29ya2RUWFRXaVZpVVk1?=
 =?utf-8?B?WVRvb1pjK09DWjdDNk9nTmFuYUp4alZDcm00cFBTcGVCMHBCN0VPMlBhTFlR?=
 =?utf-8?B?dm1XbHlpUnhPU05KUDBTMCt1RzVYNkhNRG1qK0FxTzhpdVNJN0tNUzE5eVFW?=
 =?utf-8?B?NFhaeUNycDB1eEsvQW1kWjc2ODlWdGNtVUl0Ui9ZOWh3Q3QwSnRKS3N3cXh1?=
 =?utf-8?B?UlYyWUdkd0ZGSzF0c3F3TzJibmluRnV0RVFwOCtJRjFoRUxCSkFSM0VtVWFG?=
 =?utf-8?B?TTI1eDJmcFhyV0NxVlkvM2dsY3hwcHdnVkV1NU55c3FMMVFsSkYwclY3TFFC?=
 =?utf-8?B?dklPemgwK1RoQjUvVmN6czBoNnF2QUhiUm9QNnk5ZmFuT2xHNzRLaWNwem5G?=
 =?utf-8?B?SjVJV204MlhaOWhuT2VIMWs5UFVCaXlEbGViUFA3a085RW5Kcm9Jd3lDRldH?=
 =?utf-8?B?ZlM2Qk9LcGxwaDM5SUZxMG0zN0ltS3NnMXRNRyt3L1dYRytVOEVhQWJnT0Z3?=
 =?utf-8?B?eGpvQkZsVFlWelF0UW5ZSXpaeGdtWk5NWmhLNzU4bmdJd0tvZUlpSzhWb3Fj?=
 =?utf-8?B?dXgvT00zbXBKMlh4ckVFUU8yNXVJT29rNXp6TWJQVFN3RDBJb0NwL29xbm1T?=
 =?utf-8?B?ZjlVWjFFMVRnQ0FlMzZvczRnY1RqNS8yTDVrMDdvaHU3TWsrOUYrL2Zmak10?=
 =?utf-8?B?clNSY0FaYzh4VWFGNGt5L3JUWUJld1VzQlg2MWRrSG1Dck56RVdLYlhJeEhk?=
 =?utf-8?B?cWdPY3RLcGNjMU81cENDdmo0d0oxcllhREptclhLWU10RFJQd2QrMW1rUWFS?=
 =?utf-8?B?OFZFU00rQzJINW1uQmpJNVNPbTR0cDlHcmRiOHRjQ2tjMVM2ajZXRXg3cExn?=
 =?utf-8?B?djZ1aG1rT2NYSVRKZFVGcEhHYWZWaUZWenBSQ28rakVqckcrOXVpTHBSNVEy?=
 =?utf-8?B?SUx0OFU4VFQvTXI3NEh0RE0yMnJOc3ZiZlNSMVh4elBHd3JNK1RJSmNTUnc4?=
 =?utf-8?Q?fQcjiS3RbNBZgtCFzdZJWww=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bbeb6d-4533-4248-5944-08de2d6b5da8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 04:13:49.2568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4p5/nT1BgqWHVmIKchA/0mD75v27buXuYvpA6JY9qQy/upA6e72ebHmCOlfTZHpqPhbJQgoU7gG9MBMNqkfo3/EJJw6+oLoal4xACkD9dQoNj70b1/zjQ+wAwOhPrkp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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

Hi Swati,

On 21-11-2025 18:01, Swati Sharma wrote:
> Add a new helper, has_scaler_block(), to query the presence of a specific
> scaler block (scalers[idx]) in the per-pipe section of i915_display_info.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c | 23 +++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 24 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a75323645..ec636b8ca 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7094,6 +7094,29 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
>   	return num_scalers;
>   }
>   
> +/**
> + * has_scaler_block:
> + * @display: the display
> + * @pipe: display pipe
> + * @idx: scaler index
> + *
> + * Returns: True if the scaler block "scalers[idx]:" is present in the
> + * 	    i915_display_info debugfs output for the given pipe.
> + */
> +bool has_scaler_block(igt_display_t *display, enum pipe pipe, int idx)
> +{
> +	char buf[8120];
> +	char *pipe_loc;
> +	char scaler_tag[32];
> +
> +	sprintf(scaler_tag, "scalers[%d]:", idx);
> +
> +	pipe_loc = read_pipe_info(display->drm_fd, pipe, buf, sizeof(buf));
> +	igt_assert(pipe_loc);
> +
> +	return strstr(pipe_loc, scaler_tag) ? 1 : 0;
> +}
> +
>   /**
>    * igt_parse_marked_value:
>    * @buf: Buffer containing the content to parse
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index f7ff0b17e..13b1765af 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1280,6 +1280,7 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
>   bool igt_check_output_is_dp_mst(igt_output_t *output);
>   int igt_get_dp_mst_connector_id(igt_output_t *output);
>   int get_num_scalers(igt_display_t *display, enum pipe pipe);
> +bool has_scaler_block(igt_display_t *display, enum pipe pipe, int idx);

Please rename this to igt_pipe_has_scalar_block() to be consistant with 
other APIs.
>   int igt_get_current_lane_count(int drm_fd, igt_output_t *output);
>   int igt_get_current_link_rate(int drm_fd, igt_output_t *output);
>   int igt_get_max_link_rate(int drm_fd, igt_output_t *output);


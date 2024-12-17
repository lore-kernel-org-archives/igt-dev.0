Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6164E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 11:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B5310E2DD;
	Tue, 17 Dec 2024 11:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6MiXkf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B8810E215
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734434639; x=1765970639;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oOKpNkaUwTjV+sEXTtHsX3zuZ9+sj5GAIRodeNlv5OY=;
 b=K6MiXkf76z4Rb+QJlZyNZyol8/J8OnGiAOGohvXoguW0+otTNkZHxs+N
 TGILwZPZCwOqCPnSlRWNqB1YkBhL58OOs5A+SG5/3yLfhbq0nReNmurzP
 v3Z7IRBBH9Sf6LX6lefjN0cVhm5C/9vJN7TEaxu7HOLNUQRUskbG+Z08b
 eTnXvaBK9RSxsvdEdkRdJ9BdZuR9gxUif19TX57GDa+7lRoafj2C3YDST
 EYOGegQ3usx51wJssv6aKX3AAz5zXT23p3OjNefn/Gf/eoh/xSfOXbxiH
 1eitbfURgoGWneOTnHWddILJ+ZBzpn4bgIGgGAlx6iRShC/qK1Oay5V6w w==;
X-CSE-ConnectionGUID: nWOQhcxWSii3tqxYrNYy5g==
X-CSE-MsgGUID: yLbWYy9vTJqCtAz5wSVcog==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="37700411"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="37700411"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 03:23:59 -0800
X-CSE-ConnectionGUID: oZ8oJKy2SI6CxOdfrXCnXQ==
X-CSE-MsgGUID: ox/SER0ITvuAWfM5JAGCYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134844188"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 03:23:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 03:23:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 03:23:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 03:23:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCotAq/X0ZKv+H+8fUNbS4j1RrRWBQYpPthH8G+CctTKq2aDeOy36GPHsI14ILc6wnWciOa2rd4DpnbWdoQP745sy78p/4izYlK7kdNnc15PO8tMLGyO2j1W03poNYSyDyhXHaz8/m9DSg2qzwG862HVoVmS5BFTlVXacspG++xasO+RKhlRrAe06KKA9bK0bGt2HxycbKN9wo15xmX4vOelYDd4ykxR4bSdGkW43WBzAveR8A/mmYOpGCfcsg+Wwo3rram3vkPmu0Cw8jcv8XQuVi+MgdvtHJMZKDUlECJKO54nzkJrN+dlT7B6nJf6h150Z3DWxAcvtUkS5VnhWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GesnXPb1XyVy10TdaEIlZyY3Shd3QeKXMTU/pCTZN9E=;
 b=KkClV0Lz+vaqvkQjv/k2qZih9FkL+BJZ8ueauT3RKkRLnv7WFARMlcuVQri9N9Ke94/pYv3xAOLcoX0o3EXxxqZV+itOJbW+YaYG39r3kjp4IsLiQgwP5n7XfOxdwZt5vqGgng4hgEI0/vr6XbVlExOmDSRLiMlPjoeAl7g/gTKaWQ0YzwHlAWAKxXpMrGyr2lRGscDW5xxQnhVRRVCdEcrh8QO8Cil1lvS3yq0i3Wwwmp2RA+8TOcu4W2GEy4j+61VV72oa6R916cTeDu6awD3g9ZUN+zU0n1Y6A2msTj+WL/RlVUHn79cuAozRuJ8V+GIuD7Ub4I1kbUQqYLOc3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 11:23:56 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 11:23:56 +0000
Date: Tue, 17 Dec 2024 11:23:46 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <andi.shyti@intel.com>
Subject: Re: [PATCH I-G-T v4] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <j7ixar3v3rpgtrrk5af76snc4ixtnjfiyir7flbunccjqgyyy5@carwpi3crpxi>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
 <a3evoug4tajult4jtj5c4vn6plfh3db6mkvg3hludtqrptwy4u@khgd2axkfwpw>
 <xarj46jl7t23hkexmp2wrkxh6q6yioplpl2hggfxio6wr5sjvv@3ygotnvwalhs>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xarj46jl7t23hkexmp2wrkxh6q6yioplpl2hggfxio6wr5sjvv@3ygotnvwalhs>
X-ClientProxiedBy: DU7P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::28) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 961bdf52-7eca-439c-7d12-08dd1e8d4ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFlzeU9QRXRJZU5nUURyMHhZVE1vcWUrdDc0RVlDNndFaUNsZ2VlTlIzRXhK?=
 =?utf-8?B?Sm5jS3ZzTlp6NE9ObUlrdUptME05T2E3YVhHbjBjR2d3VnJrMGJmRitlR2Yw?=
 =?utf-8?B?akZOUVMxWjF3UVlGTUNGVkIyM2JxcHFUOWVEczVEYUFQSDRzRGFkVXZhM2My?=
 =?utf-8?B?ZWlIV2JsdWhhcDdMUE5vaHlXdmRXZ213NHU3dW5ETEZGYzZPQzl0RUlvNFNk?=
 =?utf-8?B?bTRBdTBBS0d0QWhFUlZXZk1oMEZObW5qeTZ5aGhIeExvVG1nUlRvSmZQRDA0?=
 =?utf-8?B?TklOWWgwNWVPMTNWc1UycHUrS3BJVWw5WDNvSjVDWTdkRjlKbW5iRzFCSmhB?=
 =?utf-8?B?RnZuRFpJaVBkTmhoUmxGWS83a0EyeGk2N1Nyc1hJaDhTSHd3TnY5blJMNnJH?=
 =?utf-8?B?VjExeDdRd0NtSHgrRmlCNDJtWGkyeHR4L24zclpSRnJESDBaamFoK0J0N2di?=
 =?utf-8?B?bnZXYnZLNGJpUDFSNjRpTGNOV05ET1hWdGtSSG5tRTEwOFVSWEt1K0RCL1Vz?=
 =?utf-8?B?REFIUkJ0UHB1b2JtcVZDWTVnMTdYRnJjYmtBQ0txcXQ4WThlK3ZUZDM2TS9B?=
 =?utf-8?B?cjVNQldrYU9kMmpTWE9yZlBZOTFCRjhuWGhld2loazY3TFBMazhuSFlERGpH?=
 =?utf-8?B?SkNNWU1SOWxhbXVXN2ZDaGlrVW9Ja0JKUkwxSXVzdlNYRzBUZEd0c3ljQnY5?=
 =?utf-8?B?UU4rY3VZRVlPTXBmS2NtcHJKWjJiaDQ5Z1hKNEZsNnR3WFBuaEFsUXFHM2R2?=
 =?utf-8?B?MkR6ZFNDMU5PQUE1UkpZdURLOVB5cWlmREFVRnE2NDluZTRnZW1BYmRiVTJz?=
 =?utf-8?B?VXlsR0JaTmJIaWNNSzNFY2diY0pqZm8yVkhKbWNDR3Z1T3NtcWZDUm8zZzU4?=
 =?utf-8?B?RGN5TjFCWmp0SFBZS2lVMkREQUlrelBNcW05ZkhzeVNYZ1JFeEt1bDJ2YnFa?=
 =?utf-8?B?TnY1bzFxQ1dGZ1Nyb0FxUVJJTEJmYm1Rdk1xNkorTllmSDhSdENQdE5nNUtz?=
 =?utf-8?B?K09WZVZtYys4SXJZMmY1WGlqeUpaMXlJV0ZKOTlsVjVVWEF2b254TnVoZlRU?=
 =?utf-8?B?V2R1ajIxYXZTeURadzdsdnlaWitJbGJtSlpJK0VPYnl3K3c3YWw3eUtiK1hD?=
 =?utf-8?B?QUNnV25wU0V1QjNuZHVVMmVYNzZaeVoyb09VbDVtOHB3ZUM2V2lKcGdjNTlU?=
 =?utf-8?B?NUFETUFYaC9PdVdOOHNqRnpCS2loT2IxemlQV2NReGxSRk5lODd0ZHdpYm5q?=
 =?utf-8?B?YWhoOGwwNGdGMXdBWmt5ZENiVXNnRG1BRStIOXRlNjVvWWVJd3VBL0IzUmc5?=
 =?utf-8?B?czV0eXBqZlNLVldXVGNVcEdKLzA5N1NwLytubEloSkVNc096Qy9OQkI4bVo3?=
 =?utf-8?B?MnlDRDFEcElqekY2bGFEaERCRm9xMDFra1NDRWh5R01mN2E2QzZZTUd1Zk5n?=
 =?utf-8?B?eDRPOGdlT3FDWjNuT2M1UmxDeFg4ZEpnZTkzbkZqdldrMjdjMi9CNnhzdzAx?=
 =?utf-8?B?Nm5nbkprUFp6UzdWT1d1SWxsTUkyZEI1Z2d3RWQyUytuSXpYMGpmQVRBYWll?=
 =?utf-8?B?dzVSa2tNNERMTGxSY0I1T0dVVkM5ODhCelNTVWhLem92VU9FNUF4WHkvV3hT?=
 =?utf-8?B?emNpL0ZwMW1PK25QNm1GdTN1YXN2UThSZURyazllL0FBSDE1NGJ2Vzg1UDM1?=
 =?utf-8?B?VDdqM004VUwrbjBMZkQ4cjMwTmw3VkNHa2J5aGFqL3QzVmgvZFVQaWJKeUV2?=
 =?utf-8?B?NmtoRDAxTXE4anBOblVZWFhqZUNhZldsUDZUOTRHSmFNZ0l0enlhQXhmbmhQ?=
 =?utf-8?B?WlpCMm5wMld2azNRSTBCTVBXZnFhZWQ4Vlc4Ym9oNDd1VzJJN3ZaZkE4MXd3?=
 =?utf-8?Q?Fpm/Uzbm69tOz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUo4bmltZ2dDN01NZlFVcG96YnppeFpYcXc2ZGZ1U1NYckU1VFcwNEtDM1p6?=
 =?utf-8?B?aWFSWSsxTVZEUDBQQ2QzZXhBVGc3bWZhN0M0N3NSQy9Rb0E1dFFlQ2ordWhF?=
 =?utf-8?B?S3hXOXBwY3pjanRpZGl4WWdYRzZmZ1BRaDEzZEUzUUx6Z3hQdzVrbzRvKzhh?=
 =?utf-8?B?OHhRdjlZQjkrYUdxbEZSM1FLZk9CNzhWNTkzc3d1MFB1UGR6cmNSRWMxOFJE?=
 =?utf-8?B?WU1QTzFkL0NBcTB3d09jQjNwN2tuNG9YelpLQTlwdVh3RXBLbzFBWlV3RU9n?=
 =?utf-8?B?OFNrMGVSSFZqOGxFdXBKN2pSVlVzSGhoNTRBTXBSL0VaTlVBSDF6UytOMGdW?=
 =?utf-8?B?bGp4SXBlSmdTTWdLZ2RaUVAwaW5IVkFkY29lcm9sYTJMZmUrZTV5L1dZTnRL?=
 =?utf-8?B?VjZIUkJ2Nk96Z2xqci9KWjRwM0NkWVEzZ29mQjdFTkIvSVlMNHFFZmxlVW5Z?=
 =?utf-8?B?ZEU3aXlKMGlqOFpWK2Z0ZFV6OXNSamoyZmZENXFFNnVSMmVRVEtidFRSaVBo?=
 =?utf-8?B?QXZJRW9UWWUzUFRtWFpOdzFKbGFVSWZlR1FkTk5qWCszazdoZCtsY1lETzRG?=
 =?utf-8?B?b2YwNHNaY0d0QjdTMkNwTm1GTHgzTXBqYnFqZXBYUkg4N0ZHam9KbkhCdVgr?=
 =?utf-8?B?aXBLMm4vUTNFRlF3c0NhKzh4azF5NHF1SXNxc2NBbnVJWlpCNEl5RVQwUWI3?=
 =?utf-8?B?S01LVUFGaWFFMEJMR1RKVWt0N0FySlZxWktLTEQxRnE3Q0hKWkRsSnlHS09q?=
 =?utf-8?B?YlhvRGxhdzZQTTA5UzhnNG9RWWdXODM0RXlqM3ZZNDc2WHRJUFp1UmsvSDJ3?=
 =?utf-8?B?aE1SSVZSTjZPcTJjYTBSdUZTU1hXWmZYOUg1VzFyWkRxdk93dXZCWkFXM2g5?=
 =?utf-8?B?WDY4M0hDSlVoRVNxUkpsYmhpSVBWeVVvcjJ0VktMNUltcnJKWWMrMGprNm42?=
 =?utf-8?B?T0pnaFFBYTJtVUw0by91bnlqenFQTWpVUTJ3NkNVY1RjRlhpVUQvVkpMM0hF?=
 =?utf-8?B?dDZXMEdhSFR0Y0J5RksvZE1uTzRIZEpnOHJlUFQwYkVjN001Mkl6ZS9acm5R?=
 =?utf-8?B?RGlObDU1SmpkZmpqTDJ6OWNSRkd1QVR0UVI4eC9HN0RTZnoweUtRWSsyKzlT?=
 =?utf-8?B?RG0ramxrb1pmWHhSblBZMzlIaUxBUjV1MWpacDlQWllBRS9GbjJQUCt0ZEpX?=
 =?utf-8?B?V1p2bGJXa1VGRTYreGVIbW95bmxQM3daazBvYUZDdDJpU21IQ1J6K1FPdHNh?=
 =?utf-8?B?QThlWFF5RGNlT0hRZmNrZUROTWRMSXc4T3hsZXRaTEUwTWp1b3p1b0xCT1Fn?=
 =?utf-8?B?NnhPa3BubFRORTF0UmlFbzA2NzM2bU9JTnZ2VWEyM0pHejh3eW4vekJBWW03?=
 =?utf-8?B?OEhrenl2T3FlbG5BNTF0bXArdUlESkpkTHVlUWVnY2RMRTBWcXc2aVB3UnVB?=
 =?utf-8?B?UXlLUnQxakFoYy9XZzVHU1BXcm5KaXlacTJmdU5qY0VCU2tUTDdtakVMR1Rl?=
 =?utf-8?B?UjBaUWdKN09yVElPOHBBM1F0cENkQWFGT3BtbmluSEkzZWJNS2VPTk9pYldm?=
 =?utf-8?B?NWo3cGUvenZIWHZQbDhDYmdHSlhmbW5hYjZsaW5sRjQ2cTJuQzBCd0pWSG5Q?=
 =?utf-8?B?THlKOFVjRS9SOTZzNzE5cEZkTlhxTEl5a0hTVGNQK2NKc0o5VFJ5YUFRcktI?=
 =?utf-8?B?aU03SGFNUGtCeUs0WDhvaTN1ZUdva2lhVXREMFl5cVNBVHdTNW9nZlRnVXBF?=
 =?utf-8?B?eFRleW1yWDUzeU1Oald3RDlHYkFSY0VDNHdYS1YyeVcrSk1zTEJhcmFhTm8y?=
 =?utf-8?B?emNRalRmM2cwZGtqdUVSMFpGR25iNlhsRXF2b3gxZ1diTlZFZE15OUc1Y1Uv?=
 =?utf-8?B?Umg3dkxUbldRb0NyeVptNWJFK2swSkRPb1NybzJPWmhjbTVmbFFNVUtMNFJM?=
 =?utf-8?B?U3VSWXNGdFlCQXBJU1dwaHdkUUtFRUZnOHlaSmcxTTFTdElQVlFQMTVsVlN2?=
 =?utf-8?B?YkdJVWhNNTgyaUNaL1lNM3JKajBtT045bGtvWE52d1J3YjArUWJlY20yZ0NX?=
 =?utf-8?B?Uk9aMWNiYWRQY2ZkM1hNclZWS2crSjB0OVRST09mcXlmMEhKYzArTVBNMFV3?=
 =?utf-8?B?czJ0ZUlSQXBRMGxIbU1OOE9VOVhyYTJJV0dGY2hJMGJrSVY2M0xJR3pIRTh1?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 961bdf52-7eca-439c-7d12-08dd1e8d4ac7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 11:23:56.2972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYBMzF9BIGF3kyMhirvWwOGDGSPHhSvn3zoIF+61jH+O7Nff+4fQhFpkZNigvsUtpKYvYep/xhiAZt1NtjXDAMJhsrvyIdYFMDF+0yeoyG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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

Hi Mikolaj,

> > >  	for_each_ctx_engine(device, ctx, other) {
> > > +		/* Wa_14014494547:DG2 */
> > > +		if (IS_DG2(intel_get_drm_devid(device)) && is_rcs_ccs(other))
> 
> The test fails when both rcs and css engines run in parallel.
> What I overlooked in first patch version, was case when both of 
> them are running as background spins (initiated exactly in loop above).
> So now the test passes not only when one of the engines is tested one,
> but also when the other ones are tested.
> 
> > In previous version of this patch there were also checks to confirm
> > that:
> > 1) the current engine is one of the two types,
> 
> Current engine doesn't matter now because even if we run test on rcs or
> ccs, we will know for sure that the other one won't run in background.
So the idea here is just to disable running rcs/ccs in background for
all engines?

> The tested engine is run later in the test and not in this loop.
Does that mean rcs/ccs will always be tested separately?

> > 2) the engines are different.
> 
> Cc: Andi
> 
> This I'd like Andi to comment on. What this check did, was that it
> allowed for tested engine to have both frozen spin and normal
> background spin. Do you think that this background spin should
> still be run or is it negligible?
In that case testing e == other makes sense. Thanks for explaining.

Krzysztof
> 
> Mikołaj
> 
> > 
> > > +			continue;
> > > +
> > >  		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
> > >  		context_unban(device, local_ctx[num_ctx]->id);
> > >  		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
> > > -- 
> > > 2.47.1
> > > 

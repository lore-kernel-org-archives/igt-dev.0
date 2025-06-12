Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B27C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 21:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA7410E1E1;
	Thu, 12 Jun 2025 21:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFxPoOAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB2210E1E1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 21:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749763680; x=1781299680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Uq5qSCb320D83JpbTHeNod7/sAP0XqgG7BsYU++K8Dk=;
 b=VFxPoOAD7QEALSZ1Ebqfy8U1AiiosIPcxPlpyucJ2o5Q6Ksm4/ygJuad
 T5V58t1H0a2QR5CssDUW0ZGmP3UTPTIXt2GMOgbNBLprFPrgyKGJ0mRq8
 WslDSXsSCMN2PHKfUSF0kb77z5qmleUC49uiQ/+Gz4zJRQuoxzSWVz7je
 MkbSHut+2/K5e4pi+ro+DfKA6OycOYBLtK4pbTBpofvUFwzawFRVM1J3c
 Pgt6pNPHq06WBYEaV7p4wnl96lnFzdEY8f/WrV3xZttYOfjuXEdgY+Jun
 Jep2xO5w35/IemFXXgqqso9lNpAVlRLlO9pnQ1EuPqZw2ZSIG8ACHLk3w Q==;
X-CSE-ConnectionGUID: HuYb1qIYQKy98sCPNTSK0A==
X-CSE-MsgGUID: mUazLNAxQP6N8VYj2leV2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51075340"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51075340"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 14:28:00 -0700
X-CSE-ConnectionGUID: GwJ35LdRT7yTnM1KpUzFow==
X-CSE-MsgGUID: HiIRQlkrSsKoD2IRVdf/jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="151456224"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 14:27:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 14:27:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 14:27:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 14:27:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRrC9sjk398HMPt3q8zGWI/4gG2budK3ZXy+EuB57dKNVy8lnP/btdHMbVzbuvOUt/lvpDF/0U0ax9wG1nEhq6jQGXhsghkvLXaArNv4ORdZs+a4Aq8z4WCH1K0caY42cx2PWWzu7G3HwtByLfifeuj2BnqZrZpbRr770ber+ZFvz1MCAWE52HQoCTHwlZqzZp46tP6dj2ADUn3PHAszWpIYkqzV/sq0mWo7+rsSs7zBoe28zzJciH4/mh8cvJ2DS7tQ3VU1sxNrKNS3S9hZp61OsN4c3xumaVB241fxRq2va+r/LI2TLfJSW8s8bckZKpRiuUWdvKffH56ZOE/MpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq5qSCb320D83JpbTHeNod7/sAP0XqgG7BsYU++K8Dk=;
 b=KBDcAQA3NVXJ5xhoI6QI8UakpaRNz8JSTED4BKiQywQCiAVIAA4WPRF176OWioNo2LgYWwIKfNHCI18LMJCOSgYGRqNZz9Yi+wGvcQAveozoLxccwFbOLHcP/LZBZe1GKKlvI0ctYyI53crUUhwaKHYlVyYQMD9lpLnBZ0bkB+7XIT4IEOTVv6YUrqvz6Ht6wP1NSPTQWICGIEDvwKkZTEhcYxuBlHSUSwX/EStIiVJuu6+CAlSR21fDCXy5sKjy0lPiec02/xrI+PG1ozYr4L3mAHOq8Tgc3HRhrP9Hwb4pNRvhFqP2wNBhEOR8fu1SopD7udqR5BRgkSdJweghXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6240.namprd11.prod.outlook.com (2603:10b6:8:a6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.30; Thu, 12 Jun 2025 21:27:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 21:27:57 +0000
Date: Thu, 12 Jun 2025 16:27:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_configfs: Test engines_allowed
Message-ID: <dbsf7jsexhgi4zzeoi6pulzva3p3wxkcjbo62qkbn5w2b5h2et@kysxrt3xwfrg>
References: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
 <20250602-engines-allowed-v2-2-52bffe717766@intel.com>
 <aEdjcGxXjGZ5okbL@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aEdjcGxXjGZ5okbL@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 189d0ebf-1680-43c7-9eb1-08dda9f7ffaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sgvjoyqLCGqKFi9MsJJIjXxmc2gEjOdx0vm+u1alh8gQ6FIBTsW4F7nCopaL?=
 =?us-ascii?Q?6js0IZar+ntGy2nc21ZzqkwZrq2TKvFMPNZHPOhIZ1fcNBfWXaf/4d4mnpQ6?=
 =?us-ascii?Q?iIZhF3vf5R9kNlQSicVbNidIy3TyLmfjB/lJGEX7Eapf5snhue9hEzerVwK1?=
 =?us-ascii?Q?m8L83yfVPUmZskfsiWP/PkUPGorrDcdPjv/CIabo8VCooYRWekKgpj1VtLBX?=
 =?us-ascii?Q?PcHd1gyzcoh2OxX4J60SucSCDSdG3pe5/wuImV2hFhmwOSOwdJTBv+eXdNKg?=
 =?us-ascii?Q?77DlZU9l4tLlff+w7lfgBTrTvz8oMBIDHoxyoyjQM1LBwCBwI7yt7pNf4U7e?=
 =?us-ascii?Q?0a1xVsX48XNfLva+XmWYyIqvyiLoFOi6KhmJBLiQ1wf31NM1q00rM8aFmTko?=
 =?us-ascii?Q?adquH9kmqGgMuErkYGY/6L8qwR8kV4M6saroW5XtEfv6ADlGoSJgp/GGavsU?=
 =?us-ascii?Q?4JUcIQyn6uNnDJ+yi6UDFpFS7JL1xwr36TXoxqRxXjC9Mg+kyPxOVEzvFZsD?=
 =?us-ascii?Q?gZ+UBz7k8v2bzV328Bgs/d2fgNUGi5l7dJaWvkbJN8jkoBkDfOdv3Wq8x54c?=
 =?us-ascii?Q?q/csHzmkLLqZHt/UchMeREwf/JxFFWnKA+tFZy21AvSrJuMtGUYs5vmcuib4?=
 =?us-ascii?Q?ApDjiOnSG9S69HPtTeVszUODZZ3wVQXe9AdyYYujgqpe8eM+rSDW3lHliQC3?=
 =?us-ascii?Q?/ksejt7GX4SiMKULzeH+eUtiYpVcGdrKxr2JBpbEk9ctN2tXwIbEVVAzyGJb?=
 =?us-ascii?Q?YNIjLgdA8rsOXWRz+lEcg4Z4H5JzUjTUHeTfW0WSoJ7LXzxKv4AMYvcAlrJj?=
 =?us-ascii?Q?HK14HyYlFk25D6J772ow7ZFQ8zreRcJlEXWs9tQlO2OzJYeowtD458QHpeEM?=
 =?us-ascii?Q?glkraiCkbaDY1AIrcVJwyHekvnmKx17Qdu2i40wwyYb/XZ7Gdcr/uD+XIzYr?=
 =?us-ascii?Q?LDo8G06120c1HPmOfidG5HuLv2vUy661oSMlqaCGyxk2nwJTNJr6XsS0P8zB?=
 =?us-ascii?Q?0F75f1qpMSFRU1b8kE36EGiEoMMg8hUcmz4XlMjuWHZRvBzOy7otyKMzX4E4?=
 =?us-ascii?Q?1p/L0oW/JqT/9qzYfUa+gluyr2f8VO4uZBOv+RBCXAaVSavv4/ViLCFMxPzh?=
 =?us-ascii?Q?teA8EO/U7BdNJmAPS4iJzHO6a3QPK7ucDytHmrKzZD07nvtKhUJJ/tHKvlWY?=
 =?us-ascii?Q?oh8p0w4LLxEhN/Big1jYf+2+zxdTo+txjS3sJK/bafFHc1Z1zwCEOpKmolvY?=
 =?us-ascii?Q?0M3Aa8aWJP0QghlE+VJn5dJYaNWpJnFVxArdBlEsWy2S1o/GxiyLRpLlzj5A?=
 =?us-ascii?Q?7LaIG+RERMbceLwDiW3oJI+xKf5ETHkOj0M7VTU5KONiNh3m9kJKEbfPSD1J?=
 =?us-ascii?Q?MSDBylOs28LZ1hx2rgynb1j6zhTdMrpHyQs2mVWxsrbglehKqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WrpHcSH5ppMnuG27Vi0I+VkpOOdKQmhV9ihXsRX4sXmlrwdECBj1wyFuOofL?=
 =?us-ascii?Q?YrZREASCxrjpnrb8LzlpBLZpBXkXfvchCishkJRu8OrxxlimoPBkxKRvF06C?=
 =?us-ascii?Q?3dNB7uZvVv90clOTpQBpPBa14djIJkrMvEg10akIaAsyFDH2KpDi+yD5OIcz?=
 =?us-ascii?Q?XmErVJcRYfLt26uc674LMYx073D9di0jTGAVEfHfHNY9hfob4RDRZ89Q+Akm?=
 =?us-ascii?Q?jDBXmq1RHwUryOSUdAp6iUcAePR5/P3Q4sEsK2U7p8/UZbyZfyQYuFRDgM0n?=
 =?us-ascii?Q?0ekITI942e9E/UXYw7doH/kXe6U6J/jEP0XPaDpht4dZWglDeVBJFTDrLrKo?=
 =?us-ascii?Q?/eXMLIAh+sIcTOpVZcIMidABMH5EPFGZUtO4PhgtiSfPtfi0SbuZz5j0ougx?=
 =?us-ascii?Q?RiP/Qrj/bKZHdbTHLJryDwrfhgX/czVXkNTWOORQ1MhzyHbFtmoBdyEdvMnW?=
 =?us-ascii?Q?TPZ409CrpSBFnQN1UMFWR9ALjexBvSNUwgMTTWOrj0CbTLFPMB9rw5kq+X2u?=
 =?us-ascii?Q?gdU9LQ/zdOk/IuYyIcBNcLSzDHeWlPsXlLeBjkwjsxeTgJicuX5KLNEO7QsN?=
 =?us-ascii?Q?E5vTM1uIRtiyd1MFaSg1bdMlea6WhuHhfQ7l6Egm/dyrBdyatR7giao55+Tt?=
 =?us-ascii?Q?Tq1wGnlWOi1Ty5avf0EvSXEYTj2oGpq0L0O8dKfgeRQznQ33ROfiQUTphvRf?=
 =?us-ascii?Q?X1NpEq507fuMtTE2zN/vc01rIwSbjJ/XwjpegZoaLzVOaK0h27vaQdGROfF/?=
 =?us-ascii?Q?95QAQn3JTF73SXmoJwUHHmrVGt3X4Kkik/kd6W+kJFYyz0QUItzlsDPF+ZGi?=
 =?us-ascii?Q?Xpss+7IXA/LQB85MQ3BTY8dT1FGc8tPBvU4108k88AnaOQli6iJkAYr5wBlu?=
 =?us-ascii?Q?/pWx5y2dF8Kwh8wgZuUDdffaggobaQ7z/YgV9pxiBvSNteiPYxYi2uDjGx5d?=
 =?us-ascii?Q?2EPKypSill7YUhaeshQCv7vcY2gY8ueavDCskmA4R33+rZcQ/Fpo6oqIUKeN?=
 =?us-ascii?Q?cg1Z9dBuMtn4VQ/d7Z4By3lg93pCgKi9VpRt6STYmkicuhbvcQTCw4AwCU23?=
 =?us-ascii?Q?rq+NgOFGUwIFOMdNcyApJOubr7ySqKGdSjdI7hSjzjtHTWyvkq2GbbkZTHfF?=
 =?us-ascii?Q?bssgz5O1pT/DnVx+49nCdK6zthIFHTFqLLm4t1NLrq4HZPZdbB0FenTxzIgR?=
 =?us-ascii?Q?YS8dwOIw3ABHaAobdpFHoXwbj4o/2olR6jDtb/3xakNeNyArhf6pSKQnJr3w?=
 =?us-ascii?Q?KTLRJDP5o6IK+6zQihcUeoDnUusSTm+Vu5B9hOKbuErCM9pq9TXm5cA/KQnL?=
 =?us-ascii?Q?YPxruDPzSYsknJTgLLFoUP60y9vdOBPKUkxzbQ8Jx2Qba5Q+J0Wvu2fcDrvL?=
 =?us-ascii?Q?QMb/ugV92v1wkOvu0ny2RMzmbsEUPXc0bF9VMHNKXbvRzWWIpClMqX5PzYnG?=
 =?us-ascii?Q?uxLVwlltK3NcEkYJEzHlcWvCa1+B0FsEZQGIcr7PClKLGK0xXhjC9N+zPZqQ?=
 =?us-ascii?Q?W0ErpcgxLCYHkO6Pi0J2eka9+rsOKwse2HPfFYEvg94TzHDiOEAED1tJ5yO7?=
 =?us-ascii?Q?elDXINrl41BA2c+UGpkDE2EbyOM5bcIVk+5PMDKt0JlmZEjtRLtmNS9XYioK?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 189d0ebf-1680-43c7-9eb1-08dda9f7ffaf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 21:27:56.9819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8YQJINb6fLc1Zt/R8DnistWKGE0KKyGMfDmWM2DYTbaQnOjRdUZmfp0kmOPeATbqYljT9O9xG5DFt5VXytY+YJZrk4hXsuTQnSJvtrNhfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6240
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

On Mon, Jun 09, 2025 at 03:42:56PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Jun 02, 2025 at 09:24:45AM -0700, Lucas De Marchi wrote:
>>Add tests for the parsing of engines_allowed configfs. This doesn't try
>>to bind the driver and ensure only those engines are available. That's
>>because the engine uapi instance doesn't necessarily match what is used
>>for configfs configuration. Maybe we will need an engine map in debugfs
>>for covering that.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>LGTM,
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks Umesh and Riana. I dropped the first patch and pushed this one.

Lucas De Marchi

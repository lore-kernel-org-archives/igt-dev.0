Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA453C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461C910E15B;
	Thu, 20 Jun 2024 23:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVh2NLT1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA9D10E15B
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925146; x=1750461146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KWJgqZVmEIgXHWHSkMGkmP31zONRobhLPSDgmMa9Ghg=;
 b=FVh2NLT1Rp8QYP5ua8CwO/a83aeCTxcb9DOgt3KLvu/BdgH5t7oYEwdC
 MTiKarLfUXqU0fburVjAGiiSuhNchH3MWCKDIKYhu4gs5cl4AvKxAAWo3
 /2F6Pw5Cyb3n0HNrFZj2lQjNOMS0PkCncp0bjLuqA2KZGd35CqI+R+rTq
 Huas7SsRau7CFcfRG2+CV5A2GYKqIeXo6LMpfipR2UK0rxl0POKPD9Py7
 p5DmUTdxDIUO/cSYsEBiNRasTgbAPLWWhmGJj7iNzEqyysp509dywXJ96
 iwLg0TG2nb3yPMBug9YG2Fx3p8I8jR8fS2SD+brGdiRxdw/PGciO5Axg6 A==;
X-CSE-ConnectionGUID: LAZEO2T5S766jvrWr3pMtg==
X-CSE-MsgGUID: C8i5y/LYRh2BxK6T0soXPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15769046"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="15769046"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:12:25 -0700
X-CSE-ConnectionGUID: VDL1g2PdQy6kpdSpGisODQ==
X-CSE-MsgGUID: trkD01hDQ6S45yLtErbtyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="73141513"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:12:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:12:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:12:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:12:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwDTjZbKAbsFRUZHYpT0x4q6J5o/L+VLSoxMxOo0BQXxuyAtneZHXNAdElRxgYzF3fxni+yNd9z9WlJnHavw8ZCqNkcnGEVA619hxZq4N3gEAYLsGBlWq58bvJNbclcduWfseN42N4cBA94Y++NGD6AVJZxd1XZGE+3E2a2VfYNCv851dACSj4C8V/YI9h1l7tSKImWkIMo0vVYtkYhsNmEItCm0fav41T+1tspaM2lsh2jK3q8IyzHQQEU8EuOd/Z5zG8hcf9IChYF9/KSXMLqsNhHkbz5XtigovhurJR2FVvftPQDeaXkRjiBk0gOEX3ZEHnGPFryKKWNh0Mr0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gKJO0OjS4tSVrtsnj4ENIZ/H8C6mmvVdxK7gyJEzWY=;
 b=OyqppI3SMfsJ+Z7+NXkYAcG91velhNB5q9CDFuVu9/Yu30ivaP3Gspq1gLXdcTg3wxpCkV0YGIASXDPUEs3eIQF/JGsTvtkGGvmxN5vVrZBy0czgWcLaU1QfAqdtcOzB65pgnp6le+kVC2wicO1nhZO+PlcAtkkG3KhvCZ6q1v4cAl/qT6iGfNWKycjaE9m463Prnadlux8e6BFEtExA6VP1VU8ULGpeUHv8Ripo5RGlIVDCpSXCWvkwGD89rVCoTKTxNoWIfR2kyfOrt9/wpw6d943orwj8ZBJIn7L2oiMV9vCjEvtxsclcft4FNsleG32uagzfqIyXjs05ZLmiYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8697.namprd11.prod.outlook.com (2603:10b6:408:1fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33; Thu, 20 Jun
 2024 23:12:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:12:21 +0000
Date: Thu, 20 Jun 2024 16:12:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 11/28] tests/intel/xe_oa: Add some negative tests
Message-ID: <ZnS3U05pztf5lm3G@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-12-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-12-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0142.namprd04.prod.outlook.com
 (2603:10b6:303:84::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9ae8c6-6ff4-4e61-aeb1-08dc917e7033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVlsakRCUCtpa25UOElDYXB4RkduVnZXOGozSVl6amxLR3pnNWVhTjFGQ3VT?=
 =?utf-8?B?RGJKVElPaDNmWUsyNWYzSTlCZDVEbzBLQlYvT1BYbFVtUDFnN2p6aUd5d1pv?=
 =?utf-8?B?aloxV3pDdkdMc3hRZTlyaG1EN2lWSzIzTU5VWGMrTUt4OUFuOFB3UGZMRk80?=
 =?utf-8?B?K0tPcVkzbmY1ZVhvcVFVTGpFZnFsVVMvYVo3MGFZcEl5M09LdnpSLzc2TFVX?=
 =?utf-8?B?Lzh3TEVIZ0JsMkN4bXNPMERPb2lDeURlL09ESk81QXNMYm5IcTNOdStoZ0VE?=
 =?utf-8?B?NzdTRkdIT08wa3FqL1g5dEEvUHVKd0QvNHdmRk9jNXJ3bXJ6V2RrdjEyeTYr?=
 =?utf-8?B?NmgrQVY0Q2xkYW9sL0RVZDd1Z3ZFL3Z1akQxVTUvUVQ0cnJCTG9yMFZDMzRh?=
 =?utf-8?B?cnVheUJ3UnV2YnBvK2c2eG1yY2Q1OWg2THJGQ1VQZVhpc1R5VXAzcXY4aHRN?=
 =?utf-8?B?TmxFTHZLSW9jaVdBaHBhZU9IVE9XbjFtWUE3STY3TjJ1MERUVUNXTEU2V3lj?=
 =?utf-8?B?dVE4aE5BS2F1aGw1NWMrSGdhR1VpQ0ZoeXJ6QzYyUGF1djgvdUpYZEtBM2E2?=
 =?utf-8?B?NzYyRnhQdUxNeHpkOUVKNnR2ODVyU1FOWm4zWEpXNStZR211UzFEdDJKVG9I?=
 =?utf-8?B?NllkNzBuWjlXajRzRXgyNXlqNDhvWDlMbENxVnNJS0lVbHhIQmpKVXgrTjE2?=
 =?utf-8?B?QzBCRy9DdStVR25ZTTVCbVhya3lpa1Z2ZmdDdVZhb00yY1F2NnJKTlRmakp2?=
 =?utf-8?B?cUppTmdxaFEyakQ4T3pYR1dpOUx0NUFDL3ZIZFBqUkJHcFdnUjZyRnNvM0h5?=
 =?utf-8?B?Y3BpNGZVQlA3N3ZLYWtwalRzdFBOczlIVjd6NWF0OHVCR01IOFM5dVN6cFZ5?=
 =?utf-8?B?b01YQU5BVVVpdytSRm5XSHhoZ3hrNk5TeHhES2pJQU5mNkVZWGZFUEY1ZGRS?=
 =?utf-8?B?RGtuaERuemdlYnUwcEFyajJXbnBsbGVVbkt2ZVhFdVBWTVNRV0pkUmxBMCtN?=
 =?utf-8?B?NSsxZTBLeExSbXZJdFpYWUxLcXZNM2c4UitDTmY1ZVVyOVhXUnNlS3JBVFI2?=
 =?utf-8?B?djZZRFBuaTYzc3dlRzdWM1kvUUJwNHRoZ0IwNFIyNWVBRGliQ2lKL1ZKTFlG?=
 =?utf-8?B?OXRpSGFxT2dHbWhjWmhZMFhtWlFKNDdvTFVXNUFEd1FxUGQ0TXlNZWw3bGhP?=
 =?utf-8?B?TG9DeENlTzFpalJLdUF0bzJDMHhFbUlTRmxiS0Y0b3g5b05HRytDNDdPK2xz?=
 =?utf-8?B?WE8wTCttQ0RKaTNJR2Z1aUtHeUFrT090NGloNzBSZkVUSUFtRHFhTTZRS2Jh?=
 =?utf-8?B?RDdubXBRZWg2L2U3dDMydklUZ1gvYjV6dS9hMjlNYTR5dnU0UFdoc0RTVHVD?=
 =?utf-8?B?RmZsU2EvcSs4WDk4TWdBZWZnTldHN1RJSzAvV0l3SlpSWVdGT3VvOWIzN05W?=
 =?utf-8?B?dnk2SEFVSFZRYkY1SStSU3dabURMTURKUU5CZUFPSU8vdFg1aTFpVEJYK0lh?=
 =?utf-8?B?cFFSYXJUcy9uOUlHNFdMbE95aENjM0VEMG1CL1grSWZNMzY1bjlmaHNiQ0cr?=
 =?utf-8?B?RDV1RGlZaFRGN1FoS3ArcUkrQms3OWdVc1NEYlhlMWxxay9aQTM3SnphVEZl?=
 =?utf-8?B?ZFU2UUNPSnJyR1BKcWJTZ3NxbjdSRXNEcU9pbWVIb1RFdE1OQU9Bd1BtSUM2?=
 =?utf-8?B?R1VOQjQwT093MGRVOGlJZmswR2U5SmdYcVNFSzNFSTdxVG82QThzMGdvTUwr?=
 =?utf-8?Q?xHFnpghg5VAY31Lq1tC4FQ2Rfz0ku55AuhA7K3N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTJyWFQramt4a05xdU9yajRCYnhQWkoyQTF0TTd4QnNPUXltY0RXTW1aUWlX?=
 =?utf-8?B?NFZrU1ZkUm1Ja0R5V2d0L0xmRkdIN3Y3ZXJDVC8zd1Ara1VueWx5ZEllWlRI?=
 =?utf-8?B?YlJqb2hlbjVZY3kraVdrV2FkTEh6UXdudE5zb3NXRmVrcUlDN0RjZGh6UzJQ?=
 =?utf-8?B?MGtISTQveXp6MkZyOXgrY3hJTkMxbDZ2TmhFSitlQnMyMEZvcFhNaEEySnFC?=
 =?utf-8?B?aDVzRWkzQzg0UWhOR2RIbGszSE42ZzhpZktsdFNMZThVNC9xU3J4SXRJQWNs?=
 =?utf-8?B?MHdDSldtbTVvM21ibzRHek9uOUZNcitoWTZxMHdCd2s3WGl0VFpHdVBRcVJB?=
 =?utf-8?B?U2lmaGJGM2dwQXJSV0NWTXVlMFE3L25CUWpHeTNLVG5ybm1Nd3Axa2tPblVC?=
 =?utf-8?B?eHRtWHZVTW56ZGx4RHN1YUpTcFpaRDdsWklsQ3NJN2hRemp5YXFLcFM3ZkpX?=
 =?utf-8?B?Z2hoWk9MRUNuaVQ4V3d3VWZQalZWcW5PSUVFa2xqQzBDaVk1UFlYdUFzclE5?=
 =?utf-8?B?ZVhhMDFrOGwxSWJ5eGtYUm5qWWNFcHBhMjBFVzE0REtlc2VjbjVYSS9QblNV?=
 =?utf-8?B?bXU5WDFBZkowZGlnaE1RNnNJdmZwMm5TRi9CVUFkOUhxSDlLS01ydnlTYjlx?=
 =?utf-8?B?c2daVWJKM01WcUMzMytNQ3YrcG01QzlzZkJmdmVFbi9scHhaLzdyMFZJLzNp?=
 =?utf-8?B?d3d5UlFIL0NrK0lib3cyTzVabUZZb0tSZmNtajQvSllGcXdZM25NR0dmU3V5?=
 =?utf-8?B?bDBja0pCa0c5Nm9tMVNaaiszWlhQYlJVQ3kwdmlEZDJ2VkhhSFBvNUdoMGJ3?=
 =?utf-8?B?Qm14eWV5RjZGMllJYnpFZEVOS055ZFF3R2JuVG04SWVXMnRScVFmbExUQ211?=
 =?utf-8?B?U1ZMY2NZZWNxSElIOWNyaUg1ZmZDbHRQVk53eDdSUGZRZlZIdUxhNjA2MTVw?=
 =?utf-8?B?SjdsREl6ck1ZeGF3NGpoaUhzMUpJZno1Vkk3bzhMNlZOWUVwQzJIUGdxRE4y?=
 =?utf-8?B?ekhDY2NscUNOVFBlQlorTEhLcDhTTFFrSmRqMlNSRUcyUnpZR1BaanVTTGFL?=
 =?utf-8?B?YWNmMTFyRysvK1ZFTWk2Z0ttRk1pQnRsYTRxbUR4M3lSTFBYdTlYbCtZaVFU?=
 =?utf-8?B?WXhyZHZGb3l4WHVVYnlNUDZ2dWlDdUJOL0Y0ZDVwU2QvTktLTGdQL1hGV1c0?=
 =?utf-8?B?Qm9qOTE2aWFkR0RjSmZRdWw4bEpheDJjcmNCbHcySkpCejFUZDQyelVqYklr?=
 =?utf-8?B?NGp0T25MdjF3TVZaaHFnVHNuU3JzVnpBRTI2T0E5R0ZqRS8rQWd2M044MEQ1?=
 =?utf-8?B?TERFeFM3SW5haTk3RFJ0UXdKSWNlYVYwR3A3QVNoWUpnVVB6Mm1tMFIzQ0Ra?=
 =?utf-8?B?R2M1S3FmZlRIMDZKY3B4UFFyN045bWIwTjVITC9OZEpFOEc5SXU5SG40Y2Fn?=
 =?utf-8?B?S1JxZHQwMmk5T0hFOUFjbXZlTCtocU9UdEVJdWxBNGd1TFpuMlhnWDc5VmJv?=
 =?utf-8?B?K1JPYWdPWWNZUXRtTnNvSXoyWTNiMkhvUkxkWlVTZDBnLzRyQ0pWTTZDV0l3?=
 =?utf-8?B?NmxzdzdiSkJ2SmJoajVYVmNXOVhlM1o3UEJYRW5taHFBZmp0VEVBV0xzZFBE?=
 =?utf-8?B?dkdGN2NCcDRKejZJcFUxV0ZlTFVrWDlPZDRlWmhXWDhyYVhlc2JiUEx6L0Zm?=
 =?utf-8?B?M3hVcFJ0QUZkbTlWcDBTRjBicmo0NVBQY01XdzJQSVkzT21OZG5ZYjZtNisw?=
 =?utf-8?B?aVZEMVp0RTVrRkpYYjBKYmI1NVVJREY5UGxQQ2tHdnR5VmM3QitKRmZlTE9N?=
 =?utf-8?B?NVdxUXdsMlN2cEdOWmxwM3QrOXFMT0VqeVdYRzR6SDdCVTZ2dUVvcWlKZVlM?=
 =?utf-8?B?cDFMaUw0NUZldzJUdG5MRnlaSGZQWmRoWHd2SnZCZlVIMUxrZWUvODJrZWEy?=
 =?utf-8?B?TTJWV0VYZ1lBcnprVnBpRmFKNlo2RUhWMzZ5cEVieXAwK3ZGYTdQZUFETThx?=
 =?utf-8?B?TXJldUd1T0ZwZXB4eHd1WEFlRGpHcTAwRlRhOXE0Q095SFdKamlqOUplZEJK?=
 =?utf-8?B?NUxlSzNmNFNmY1RXNlBQbkk3UmRzNmFkWUlGN0E3b2Jjci9rVVkrWmtyR0FV?=
 =?utf-8?B?RDBvRzRVWDV4NkxDR0lUVUFRclRmWldUR01nRTNya0doS3Q4TkErQ0s3cSt6?=
 =?utf-8?Q?bUUwsMtHH2TZYLe38QbYLBA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9ae8c6-6ff4-4e61-aeb1-08dc917e7033
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:12:21.5235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlxE3DiXLvfO/z8MOi4tWQ1WnFw+/91tFbGeyZTjtJGd90nxO6U0A8XTpKWADd7OB/Lfpu+C2aM2eXv/ee7XgFa6deq+D5/5kijh9Cpecm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8697
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

On Thu, Jun 20, 2024 at 01:00:36PM -0700, Ashutosh Dixit wrote:
>Add:
>	"non-system-wide-paranoid"
>	"invalid-oa-metric-set-id"
>	"invalid-oa-format-id"
>	"missing-sample-flags"
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 192 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 192 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 5c872b74b2..97bbd13674 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -301,6 +301,7 @@ struct drm_xe_engine_class_instance default_hwe;
> static struct intel_xe_perf *intel_xe_perf;
> static uint64_t oa_exp_1_millisec;
> struct intel_mmio_data mmio_data;
>+static igt_render_copyfunc_t render_copy;
>
> static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
> {
>@@ -548,6 +549,166 @@ init_sys_info(void)
> 	return true;
> }
>
>+/**
>+ * SUBTEST: non-system-wide-paranoid
>+ * Description: CAP_SYS_ADMIN is required to open system wide metrics, unless
>+ *		sysctl parameter dev.xe.perf_stream_paranoid == 0
>+ */
>+static void test_system_wide_paranoid(void)
>+{
>+	igt_fork(child, 1) {
>+		uint64_t properties[] = {
>+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+			/* Include OA reports in samples */
>+			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+			/* OA unit configuration */
>+			DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+		};
>+		struct intel_xe_oa_open_prop param = {
>+			.num_properties = ARRAY_SIZE(properties) / 2,
>+			.properties_ptr = to_user_pointer(properties),
>+		};
>+
>+		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>+
>+		igt_drop_root();
>+
>+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EACCES);
>+	}
>+
>+	igt_waitchildren();
>+
>+	igt_fork(child, 1) {
>+		uint64_t properties[] = {
>+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+			/* Include OA reports in samples */
>+			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+			/* OA unit configuration */
>+			DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+		};
>+		struct intel_xe_oa_open_prop param = {
>+			.num_properties = ARRAY_SIZE(properties) / 2,
>+			.properties_ptr = to_user_pointer(properties),
>+		};
>+		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 0);
>+
>+		igt_drop_root();
>+
>+		stream_fd = __perf_open(drm_fd, &param, false);
>+		__perf_close(stream_fd);
>+	}
>+
>+	igt_waitchildren();
>+
>+	/* leave in paranoid state */
>+	write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>+}
>+
>+/**
>+ * SUBTEST: invalid-oa-metric-set-id
>+ * Description: Test behavior for invalid metric set id's
>+ */
>+static void test_invalid_oa_metric_set_id(void)
>+{
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, UINT64_MAX,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+
>+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
>+
>+	properties[ARRAY_SIZE(properties) - 1] = 0; /* ID 0 is also be reserved as invalid */
>+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
>+
>+	/* Check that we aren't just seeing false positives... */
>+	properties[ARRAY_SIZE(properties) - 1] = default_test_set->perf_oa_metrics_set;
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+	__perf_close(stream_fd);
>+
>+	/* There's no valid default OA metric set ID... */
>+	param.num_properties--;
>+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
>+}
>+
>+/**
>+ * SUBTEST: invalid-oa-format-id
>+ * Description: Test behavior for invalid OA format fields
>+ */
>+static void test_invalid_oa_format_id(void)
>+{
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, UINT64_MAX, /* No __ff() here */
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+
>+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
>+
>+	properties[ARRAY_SIZE(properties) - 1] = __ff(0); /* ID 0 is also be reserved as invalid */
>+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
>+
>+	/* Check that we aren't just seeing false positives... */
>+	properties[ARRAY_SIZE(properties) - 1] = __ff(default_test_set->perf_oa_format);
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+	__perf_close(stream_fd);
>+	/* There's no valid default OA format... */
>+	param.num_properties--;
>+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
>+}
>+
>+/**
>+ * SUBTEST: missing-sample-flags
>+ * Description: Test behavior for no SAMPLE_OA and no EXEC_QUEUE_ID
>+ */
>+static void test_missing_sample_flags(void)
>+{
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* No _PROP_SAMPLE_xyz flags */
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+
>+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
>+}
>+
> static void
> read_2_oa_reports(int format_id,
> 		  int exponent,
>@@ -791,6 +952,37 @@ igt_main
> 	igt_subtest("sysctl-defaults")
> 		test_sysctl_defaults();
>
>+	igt_fixture {
>+		/* We expect that the ref count test before these fixtures
>+		 * should have closed drm_fd...
>+		 */
>+		igt_assert_eq(drm_fd, -1);
>+
>+		drm_fd = drm_open_driver(DRIVER_XE);
>+		xe_device_get(drm_fd);
>+
>+		devid = intel_get_drm_devid(drm_fd);
>+		sysfs = igt_sysfs_open(drm_fd);
>+
>+		igt_require(init_sys_info());
>+
>+		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>+
>+		render_copy = igt_get_render_copyfunc(devid);
>+	}
>+
>+	igt_subtest("non-system-wide-paranoid")
>+		test_system_wide_paranoid();
>+
>+	igt_subtest("invalid-oa-metric-set-id")
>+		test_invalid_oa_metric_set_id();
>+
>+	igt_subtest("invalid-oa-format-id")
>+		test_invalid_oa_format_id();
>+
>+	igt_subtest("missing-sample-flags")
>+		test_missing_sample_flags();
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>-- 
>2.41.0
>

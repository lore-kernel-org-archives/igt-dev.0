Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F16AC3ABBE
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 22:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C1E10E222;
	Thu,  8 May 2025 22:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmjDm6VQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5FC10E218
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 22:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746744290; x=1778280290;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u6NOUmSWbA/mmV1XLOfNNlewJwBeWK0TYapga5tYOIM=;
 b=PmjDm6VQHbi+TvTt/p03P8vzHW8njvWz/QEgrTFgsbVEmrVn6X90nWl7
 6wkX0/4D76n7FXXn0/fmZ3/I/e5iU2xcrUGRAYM360zbsjyZGBj4hiTx0
 xtfrV4FoNxU3mjg1sqSIDGKQwP8uXda23kg4KY/gnkSIojgINsPDFTpAA
 bMj53PO2uXYrqM6YpvBwmcOwlpaXRS76cNs7rHJYmSho3RmTRwJXP9y7v
 nsSrs3iePPk7GwOnZcjTWGNCY8dtkEn8N0ExcJzSJLffMZTC1O4U/W605
 F04vDznR7hN9Ugkb2NhcMVTeoxCnk3/np7aFLPlB0ztJIFNFqDYGpqcIr Q==;
X-CSE-ConnectionGUID: I+7H8CIfRx61lPNYXvq9MQ==
X-CSE-MsgGUID: RpJ7qVSTTLqgdnw4B3/x0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66088076"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="66088076"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 15:44:50 -0700
X-CSE-ConnectionGUID: 0+M1tyUUQderLSzjpVwtxg==
X-CSE-MsgGUID: z1jfTxr9Qk65VZPnSFMHVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="167373316"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 15:44:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 15:44:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 15:44:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 15:44:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXSUFVb0KCXKXc3c5sTh9tK6rv33h/aDco2/38m9NbVEOHlNVDu34mAFE4ZeNQ7Z6h8hZ6AvQ/UqpgS9FoZ9SdZLGgU7WDwue//I06NIENB9qovNlleDbv+aNQ05VZXr3CDCfNCrnxXFa+sgKl0ISrIEuSD5e4h6S9uN6S5M78V6hHFDh1wXEu9rdpbC9pMupstUs3udvZ+XTFFf1KyQB0PWHI7fUlVnxZCYk0e52SkBRJinfZG3lL9V6XyaHDjhhX4lkiQSUW4T4rsW1XabG/CrRZUbyKxbmhsbla/mWtRdipqwqfq2twsfHE+FggFIJmPoCP/Dv0sbz4Fxk6XhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAPVQNECKPmPzlhF3pBKDUPCgZDQQDJ0/ctnRLZ9J0s=;
 b=IUucQ+S5LwadnJikr5CQ2XDvFW8QEh4GQsdcNDFmwt/LKFdRJAEWGzCGOKFr5Its+tD+McitLtmuE4xQwa7klXd+Wgt3ll42cpz5gph5YTcX+QLRNDd8p0MOa7hZOfsgqTyoT2s7i3NeLw4G+ltdiVRfCzaJbofFiytPmC7eSL/Sy1ms1ECkokKTCQ4D+QVB8GlRPoTOjAe1fvi79DLeV/MlVcK28HOzKJ8zGZdke5RqAUR/oCkM+Ghw6HrDEH+qrjby5dGubzARmF7NN5ONu8Veu//g/JFEwAhzv/zlLbniVG5jCYOYnBk9Xi+RjLHp3cxGbnKbdGoW6JwiYoCXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB8513.namprd11.prod.outlook.com (2603:10b6:a03:56e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 22:44:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 22:44:41 +0000
Date: Thu, 8 May 2025 15:44:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 2/5] tests/intel/xe_pmu: Move descriptions of
 tests to the top of file
Message-ID: <aB0z14KhmxqZdKOm@unerlige-desk.amr.corp.intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
 <20250508055006.734259-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250508055006.734259-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:303:b7::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 17aebdbe-cf6a-4e80-b66d-08dd8e81eb9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UklyY0hHZHpBa1FZZEh1L3dvTmhyMlI3dUNkM3dHb28rUTB4MWVIS1ZoeURW?=
 =?utf-8?B?c0JINGp6Sld5U3dKUWh6QnJzS1FsL0tyMmc1aXNsOEh6YTNkQ2J1eXFrd1NZ?=
 =?utf-8?B?cHBacWJ5MXVMbVJZV1JubXYzSkFFdWd3eFBBTFovM2ViVEVOVm45RTBidDBT?=
 =?utf-8?B?eHFySXlXSWZCMGV5WmJHQmR5ai9TMzRBV2lmYVZmMkU1S0FNdzJJWUVjYzkv?=
 =?utf-8?B?WFNLcnNBZytyUlFKYm5TSmcyK3RIWW5DNjNhYXhXeEVmMGFvSVhxaytHS0h5?=
 =?utf-8?B?aVJFM0FFVklmSEttTjJGd2diNDFweE03ZHJ1L1FzTWRueGM3ZUFVcEdoSnR0?=
 =?utf-8?B?L21TLzluZjMwdDBDZElGYmZRY3RSUForV1R4SHZEdm1aNE11UHpwT2pPRHkv?=
 =?utf-8?B?ZzFjUUJrT2FBTFlBdGw2VDFrRGJyWHlzSmo5SCtlL2Z4WEhkb1c1aFdsam1y?=
 =?utf-8?B?eUIwT1NHVUZjWFV1ZmxpK3AvSnRxUW1JcTJ4aktwRFJxZ2JVVHEwQnpIU0JG?=
 =?utf-8?B?MitVd2ljbnpmRkFwZDBRbzhLOEtwYjZiL1dvOUJTSytnWHQ1cFpWbURnRlZq?=
 =?utf-8?B?MzAvQXN6VWxFUWRjTDZwM2UvTHR2dXB2clhJQVBQelIyVVlTYVBYTE9KaFZB?=
 =?utf-8?B?MEEyeitYMHN4ZkF3Q09SZVhyQWJrazY0Mk8vRTltRmVXdmNhV0V6VXgxOEd6?=
 =?utf-8?B?ejhabkpSc2J1QWFhY1pqU3QweS95ZGtHS2RiZmJZcHNCdFMzN1JKcnl3RWFq?=
 =?utf-8?B?a2tjdU9UK1dKR096eFd0RzhHZWp4bWRRVHVNNEFIRURFa3FobUJzRW1DUlY3?=
 =?utf-8?B?SklNTkRaVUttS0JPY3RsWHpzVGx2WEJ4TFUzWEhVVm5RTmRDNkFscnVPQUpp?=
 =?utf-8?B?bnBpVWZ3VkErZGptR2lkUHJzOHpNbUtxZlMvK05UZ0lhMlc2cFhFWHJWQUl4?=
 =?utf-8?B?ZnI3U0xVRm9yVHFWWWdKZUtnNHNodHRONDBVeGZLeFU5eCs1MWl6b2VLaStT?=
 =?utf-8?B?QWp6Y1liY05VTXVXVk9Ec2hpQ2o4ZjJQdkw5cm01OGhXMzg3R210RWFnL3JZ?=
 =?utf-8?B?SjRMSzhyc08yWEJ0S0daQzJEamZYR0RwL0tYU3V4bVB4ZnEzVG9jMmlyWVBF?=
 =?utf-8?B?U2VRQ0JqQjZ3WS9rMU5zaXJ4Q1U5UWFKS0VzbnN2NXlES0NEcE0zVlVha3JX?=
 =?utf-8?B?ODk3bXh4VnJvTmNoUlQxWmNXNlpHUHVVczBHeXBvNi9FVGVFMy9ES3pXT2hK?=
 =?utf-8?B?UzRvZkQrdHFnSXZQZi84MnlYWWNvT1N4b1pzYldWKzVtenkzZU5sK0VJbGc5?=
 =?utf-8?B?RFQzZWliMUNqTkJ5dUdvTGw3d0Z4TTBlRTREY1o2eEV6bSs3ZU41a2tQbVIy?=
 =?utf-8?B?TWJuYmVRN0s4VU00enNSYW1URXZBQWtzSXZla3g3M3prOEpROHBmbnJWd0Nl?=
 =?utf-8?B?T0l5U2hZTjRvdnV3UEZwZDgyVXIrOTRZNEFyZnFCa2ZwRStBZitILzk0ZFpo?=
 =?utf-8?B?dm0vY29RNk1DeWJURm13WHN3Tm1YTGdGM2RuVEw4RGdiMFNFMkladE5MNFVx?=
 =?utf-8?B?M0YxSnBVaStTRWxLeVRCbGFhU0NHZnFlRFI1UWtFdVVKMEx1aWN6Y2VPaUNn?=
 =?utf-8?B?YysrV2txMTZLQ2VKS2cyak1SRUZzNFNuUEVwalpQcHN3S013TmxQWjJaVDdH?=
 =?utf-8?B?Z1JoN012Q1FsOXNad0pDSER5OXBtLzBMQ2RmV25RbWFiaVFNWmpBbU5zOXln?=
 =?utf-8?B?TTZRTnVkSU5XNVRjQjBNZ2d0YkVwVEw2QWI1cDVTSXhvcHhaUWJTcFY1WmFK?=
 =?utf-8?B?TTgxYldBakNFMjdQWXgzYVVyRkZGTWRTUkR5ODhrVG0vcXRiY0kraHdLZmFJ?=
 =?utf-8?B?c1cxK0dUOFA3M1V6dHA4eUFxM1MwWGdDTWhFZE1tMUpKZ2NqSU9DYk1uYkpp?=
 =?utf-8?Q?d2JQDRv/OGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJzWGRBVXV0dzIrRkRzZEIzdGxncUpXaTlxR0JtWkNHSGw3RnBHbFlXa0RV?=
 =?utf-8?B?bS85YS8vYjlJMThBTlEzbFR5T3RybEx2QmJmb2dVdkV2TkRDRjJOS3dDYWFz?=
 =?utf-8?B?WVVxMUw1a3duemxQdnZpTTlQNys0U1U3NzJHOTVpYjFveWtRZkhPMGw5bVhj?=
 =?utf-8?B?VVJ3TFVpTGFXeGd4eHhCMDJLTWxPNnExNldha2pwN2gyUlArSjVqQ3F6Q0E2?=
 =?utf-8?B?ODVubm13dUVCdWRyUmFzdDZKNGdRRUN3OERVQlNidWliL2dIeWlOa3NPWi9C?=
 =?utf-8?B?aGZXa0U3K1JTSzZ1b242YzIxK01NamtPVWtzd3Nvd3E1OWQ2d25pZzAzQkNZ?=
 =?utf-8?B?NzU1a2pDblhTZmxJZjAwYXRZQUQ2YktTRHpLUDFmZDVFNUJhbzJDcFQ2R2Jp?=
 =?utf-8?B?TDJUSHN2RG1PRDhVMHRMbUc2b0ozend4YWJyTWJjN3BWMTdZNUNCaG95ajZ1?=
 =?utf-8?B?dHNEWU54ellMK1FPVy8vRk4zTkdpM04rTnJjdklKK1FlNm01d01aZEU5UmRl?=
 =?utf-8?B?T2dsam94ZU41MkdOVmtKV1NVZWx6OGRBMVJVVXdKdDkxSWFzZWQ3bVg1NmNO?=
 =?utf-8?B?dElDRmRMZFFOT3VUTVB2WWpHc0lLOVgvMFhzaE96QTJhYU1CWWRDMi9CZE1q?=
 =?utf-8?B?RTNvM3dPUUZkVkx1T0txOWxYRlFOZEs2a0xWQlNwUDF2Q2xPcER5Mnpzalg2?=
 =?utf-8?B?MGdKc09GbUNrT3hrQWpHSi83RXpNaEZTdmh6dU1qK005NWRZQkt5UG9QL2xN?=
 =?utf-8?B?eS9NeVFOMVhhRlZqVE9udk93eXB2Z1F6QW1EYVI0S1VyZy9RWXZDUys4MHMv?=
 =?utf-8?B?d0VPUFRmdjhZNURLMXB6R1Y2bjhtbHJCTkhDRDRndVNwQzY5eUhSdWhSSFcx?=
 =?utf-8?B?d2gyaDJZcFY2U09rdnVkQXlmc1hONXVhS1NQSE1vNkx3WXpPN09tTnhkQzI0?=
 =?utf-8?B?OW51VmVxbEhkRDVKSzBaNGt3QVBLZnl4eVNsU2VKaVloWVZWT3UyTklKcnlU?=
 =?utf-8?B?L2Rudjdrc2F2YXZhOFVPRWtPZjB2RDI0RUpta2lnOGlielUwcFozTUx2bUlD?=
 =?utf-8?B?MlI2UmRGVDNjY2tJU3hEWFBZNkZYUUJJNTlZTVRaN0xRUTIwUDU1QVNMTFRB?=
 =?utf-8?B?Qi9IVlJKWHpLc2JrRmxDSGc5d3BQTXU0a2VhRUwzL0dYbitiZFpvUmY5TjJw?=
 =?utf-8?B?aHhjMVJRSUlpankvZ0VZVmozSTdzWjBVaFF6cDd3SERKYUxSSS9kUmcwYTEx?=
 =?utf-8?B?UjNYWGR2NWprc0FFZ3N1U2srWmlYRHdWcVNUUEZNdlVoRm16RUZwSjNqcTNI?=
 =?utf-8?B?ZFBRekFUMVViK3B5bjd3UTY1T2FYOWNXM3JHVnFpcCtpZ2M2UTVNdEZkY3lV?=
 =?utf-8?B?RXMyUFNHdHN5Q2VEa29oUHhWNWNqaEQxbmFhRjFaMll3Q0hPbmJFZ21CcjY4?=
 =?utf-8?B?T3BjYnZaWEl0eHduVFJleUZzWGU2bnBXMG5uQzZpTWxnbW9mdnQ4OW9kdHlw?=
 =?utf-8?B?aWpYYnIxL3hzODByelgybERKcTd5a051YkYrUFpjekJOTXU4VG9ybzNQYVlw?=
 =?utf-8?B?c2hkUDYxcDlETzNZWXBzWm5wMmFwdnk2U3BYTGNqOGNxU2J0VElaRVNJZ2ww?=
 =?utf-8?B?bnlpcjFETDJhb1l3L1ZyTHMzUzNSNFlVM1h2VkpnM2pZR0hRSmlSTkgxTE80?=
 =?utf-8?B?L2cvclpHL0daaU5zY0RsTzN2Y3pFeDdJVVVqSzczcDFLdHlBZk1SSVFFK2lS?=
 =?utf-8?B?cmpmcVZQRVU3SGxyTFBwdDBLb0p1TUpPZlNEa25iTDhlTlY5Rkpqb3U3UUtk?=
 =?utf-8?B?Qkkva0xDLzlkNERSZWRQQmdwSEthSWpMYk0vczFyMDZlQVZkaEl6dGUzZWVG?=
 =?utf-8?B?TUNzMHZlTFg3Y2tuVFJCQ20vcmFpU1JCNGFVNVZ0QStjLzFvc0JUVUc4SjJ3?=
 =?utf-8?B?aFlhZ3BoVmFvWjNuaUhCdWQ4WGxvYWhmVUh0ZkZ2UzdzdWlkWmdNTk1jMFcz?=
 =?utf-8?B?RS8wSDR3djhuQzJWSWU0Q3pMQnQ2a3FMcDFUM2dlc2ZOamFiSlZjbWpTVm4w?=
 =?utf-8?B?WSt1OFNpby96L1pwZytRSGs2U2ZkV1JHcEtJakpHOFBzdXArUmVwYUxKa2U0?=
 =?utf-8?B?akwxSk16QkI3NnpwUjM5OGMrdXpvc013VzZaTmxxSkpOWnd2b3RDVndXT2hI?=
 =?utf-8?Q?9w9Bt/bcJkmdk1JXqVIUr1Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17aebdbe-cf6a-4e80-b66d-08dd8e81eb9d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 22:44:41.3390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6/epd6FzhapVvNKiEHtA70je/U4FckmTJHvWh+LNX08cNxIrbZNHDIJIPo6yGlrhBAodTpl6uUpje245ptHZAH/2bWlNbN/ympvExO8ylM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8513
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

On Thu, May 08, 2025 at 11:20:03AM +0530, Riana Tauro wrote:
>Move descriptions to the top of the file so they are in
>a single place
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>---
> tests/intel/xe_pmu.c | 58 +++++++++++++++++++-------------------------
> 1 file changed, 25 insertions(+), 33 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 03a966708..1ad927822 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -10,6 +10,31 @@
>  * Mega feature: Performance Monitoring Unit
>  * Sub-category: Telemetry
>  * Test category: Functional tests
>+ *
>+ * SUBTEST: gt-c6-idle
>+ * Description: Basic residency test to validate idle residency
>+ *		measured over a time interval is within the tolerance
>+ *
>+ * SUBTEST: engine-activity-idle
>+ * Description: Test to validate engine activity shows no load when idle
>+ *
>+ * SUBTEST: engine-activity-load-idle
>+ * Description: Test to validate engine activity with full load and trailing idle
>+ *
>+ * SUBTEST: engine-activity-load
>+ * Description: Test to validate engine activity stats by running a workload
>+ *
>+ * SUBTEST: all-fn-engine-activity-load
>+ * Description: Test to validate engine activity by running load on all functions simultaneously
>+ *
>+ * SUBTEST: fn-engine-activity-load
>+ * Description: Test to validate engine activity by running load on a function
>+ *
>+ * SUBTEST: fn-engine-activity-sched-if-idle
>+ * Description: Test to validate engine activity by running load on a function
>+ *
>+ * SUBTEST: gt-frequency
>+ * Description: Validate we can collect accurate frequency PMU stats while running a workload.
>  */
>
> #include "igt.h"
>@@ -140,18 +165,6 @@ static void check_and_end_cork(int fd, struct xe_cork *cork)
> 		xe_cork_sync_end(fd, cork);
> }
>
>-/**
>- * SUBTEST: engine-activity-idle
>- * Description: Test to validate engine activity shows no load when idle
>- *
>- * SUBTEST: engine-activity-load-idle
>- * Description: Test to validate engine activity with full load followed by
>- *		trailing idle
>- *
>- * SUBTEST: engine-activity-load
>- * Description: Test to validate engine activity stats by running a workload and
>- *              reading engine active ticks and engine total ticks PMU counters
>- */
> static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>@@ -203,10 +216,6 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 		igt_assert(!engine_active_ticks);
> }
>
>-/**
>- * SUBTEST: all-fn-engine-activity-load
>- * Description: Test to validate engine activity by running load on all functions simultaneously
>- */
> static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks;
>@@ -274,13 +283,6 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
> 	}
> }
>
>-/**
>- * SUBTEST: fn-engine-activity-load
>- * Description: Test to validate engine activity by running load on a function
>- *
>- * SUBTEST: fn-engine-activity-sched-if-idle
>- * Description: Test to validate engine activity by running load on a function
>- */
> static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int function)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>@@ -344,11 +346,6 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
> 		assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
> }
>
>-/**
>- * SUBTEST: gt-c6-idle
>- * Description: Basic residency test to validate idle residency
>- *		measured over a time interval is within the tolerance
>- */
> static void test_gt_c6_idle(int xe, unsigned int gt)
> {
> 	int pmu_fd;
>@@ -382,11 +379,6 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
> 	close(pmu_fd);
> }
>
>-/**
>- * SUBTEST: gt-frequency
>- * Description: Validate we can collect accurate frequency PMU stats
>- *		while running a workload.
>- */
> static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
> {
> 	struct xe_cork *cork = NULL;
>-- 
>2.47.1
>

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E09FC83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 04:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2947810E332;
	Wed, 23 Jul 2025 04:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeSe5uGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7F410E332
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 04:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753244278; x=1784780278;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KDshJgBr8j9c9/cMI0jwpZiDdHaSU9HKh2g/40jd3eo=;
 b=LeSe5uGTV4PvZqZiDXR2tiO/nz+oUbJ6APPkbRv1NNhLdNES7cnvUWCJ
 aCGG2AdrOAaPWgxeyd36c7vGpit73o5XfBB7ViOSLRwZGnMKQBseMdf9F
 T3dYhQ5TlMBzngvfvfsRn2BmJmIeV21aMQXXn1EDrVo+FZ2PrZ0Of9Ij9
 qWlZ9CcMq+0b6pT0w0vNB18MuPsaqfWjKFjppRqlf0yblSjxw4PP3bDJE
 NUePv5/X+CcQiWYRuensIAIn2HFiDClE/LTjdXbdlgzF/cx54wa0d13Ol
 YM4sZJuVDhiyL3HbD/S3as29K+jHvRhrPOqC4B2NIobhIVoXSR4Ac1SDv Q==;
X-CSE-ConnectionGUID: Hdxyf+qIQt+C1XemunRUNw==
X-CSE-MsgGUID: 0lgQjL/ISV6PSASi1Wy9Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55467564"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55467564"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 21:17:57 -0700
X-CSE-ConnectionGUID: hiOUXeh6S0eJZtH2VcBxug==
X-CSE-MsgGUID: nnhYHE3OQBev8PVpDTUtlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163369041"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 21:17:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 21:17:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 21:17:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 21:17:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPFKJlqV3I83tE3F4IK/Fdo7o6leOyn2OWuV7Z2s709EJmNIfz6vibb833He0+gL0U5D193F5LCih+veEevQ+RfmO9ocOQRr3b91kmEiWlXmgj7CuK2bo9kOVWk7eCOH6GtHtrx3JeGFpGw4h5VmdG0f6TjRAcq8Fx3rScw/CrmLiGsqD811BJ6dKWnP1wwM+Oc6+WWFsrW/TzUUUuVdHor7T5G1WEp+TALyWa2bEOROgWZ9rUBOguPQ02/hiqB6mi6SERNFenxUTsvA4q5MHYCGIS3gIewooF3tQYdZ/tEsb7rcPt+xaE3CuwW4aQ06Y29nx9hhuH1S0+GyDY+60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqUGZvDs9M0HUxgBny5MyjOdUaIbNN3skb+iw+IBOns=;
 b=nbL1JiYmN7FQpqaqYDI1fnAt2uMAsz+RTXAxcS+9msX6SuF7jfW2e56sGcqHYl5gjKgUNuoXh9/LLcr9Qhnuae90v5LQwLmSkzd3PdruM/YUmdVKYatubNSHRqw5sJW/tup1HikIqGie9hBnXRB5R2ZbDX8/YDJmoFr2Y+7L623zSpd521GvYUc39rzrEs3DoC6L0MSA5GDC7NikGHXF2gAPqz04+OUxGlAKdIP4XEefvavRbh2sCGz4fN3zK0KvuyZe3R+R+ot0xg3h4wtymyDu5Y37Jt0FR7cIh5DrjPspHkFhpEH6KLhzNR1sR91+HD27IyQvAebHOGeH4c1EYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.28; Wed, 23 Jul 2025 04:17:41 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 04:17:41 +0000
Message-ID: <b06913d2-98d2-4ce8-8c97-45047c199749@intel.com>
Date: Wed, 23 Jul 2025 09:47:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_frontbuffer_tracking: Reduce
 test complexity for simulation
To: <igt-dev@lists.freedesktop.org>
References: <20250717093633.1293628-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250717093633.1293628-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::10) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|CY5PR11MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf4c444-1902-4874-a622-08ddc99fdd92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mjc3dkhxU2JtUythcVNxNmIwVU1Oc3EwanllYlg3bml6SW5UZlRjOTFvWU5M?=
 =?utf-8?B?N1NWUU1RSS9NREtvVzFFbTVKelBzdHNHWnlWdkdENUNKRWpxei8veDkxaHhq?=
 =?utf-8?B?UEVJMHdGNzhCTEMzU2FOWC8zTHd6Z2ZGUmxxRHNzN0kvWnVKWEhlMzNPSmI5?=
 =?utf-8?B?bkhIeFcxVzhrVG1wRGgxbVc2RVNBWHhvL2xjZDhmdWlDUjZjRFd4K2xyTVgx?=
 =?utf-8?B?NEdZWE1JNlR2L2lGZjFhQnUwaFptK2l0cVdZeWJlS3ljOEJGSDNMcS9CdGtz?=
 =?utf-8?B?ZnJtZVArdFhxc21aR3hJbHR0OFkrRk9Wd2E4dWRIMSsxSEdPMGZudWkrcUVV?=
 =?utf-8?B?eENSUUpXZWdmcjBZOVZEY3V1TVNGSmNPOUJPUVNWSjhPbEozb29OaC9qczE5?=
 =?utf-8?B?b0FTK0p5M1JhNm4vR2FLWHlQUzFUajJhQlMrZ091eVRaLzBZUWlJRjhNWDNE?=
 =?utf-8?B?RnRFS042TDJjcHRnMklzMTE4TkpzMDlJRkF3YStFYlNDaHBWYURHcUIwSmdh?=
 =?utf-8?B?VFZJZjhiRzVFOWM4aWROL2srVSt1dmVSMFNUQjcvbEE5QVhQTlFqUW14WUxE?=
 =?utf-8?B?TVMya3VYRmdLaEdFeGk1NUxScVBJWUwzczJtOWFxWW91MUVYT3MrM1pLcmlm?=
 =?utf-8?B?akF3Smp0VWNFMytpaUFtQ3U3eDJJZUNvd0lsMi8zaHIvNWxtS094ZFVWK1lP?=
 =?utf-8?B?MFBiei8rTXNQYnhabXRXaEwzMnp3aURIclIyTHcyVW5jVzVWYkNrWmtlVTBD?=
 =?utf-8?B?TVFWeU5yR3NXTDM1LzB4TXR1a2FxK2FPVUVQVmE1S3ZOMXF5bGxDaHE5dDJt?=
 =?utf-8?B?S3BPRzR6M1NtSUVaZ0t2bUxvRXNPV0VuSWo4RUJaOHNPS2lrZUVsU0VnV1Rt?=
 =?utf-8?B?SUw3L1E2Q1NLNk1jcUQ0RjQxNEJMMUs4SHFUWGtoV0dxQkhaQjM4R0Rqb2xW?=
 =?utf-8?B?cDZtd2daZ2VLa3QrcEZIR3J2aU5YempDKzUyRHdoVXVvcGx4ZjF6dVZZSWJL?=
 =?utf-8?B?blA4UnFxaUhRbzQ4VHhHTTg1Q3VOK2RZRDArdGpoVkNNalFKTXZhUjc3ME5Y?=
 =?utf-8?B?K0NwNTVSRE9YM0RrT1NmNlREamNpRno0aXBkU3JZQjgybWFOazNsR1Aza3Rx?=
 =?utf-8?B?VFh1Rjhvci93UHpQZkkwdzRjZ2dBTXdSRXNmVGMzbUxOYmcwTWZtR2VReGpH?=
 =?utf-8?B?Q0kwclFndjg4MVhPQldoZUJuQTJHWmdESVRPVkYvT1hOL05meERhdEEwRkR4?=
 =?utf-8?B?Z1RsZ0plZVc1dHNnNVpFaTRYS3pOd3RIUkovZktLSW5PWHBNOHlYUmFVcmov?=
 =?utf-8?B?L1E3a2N3eUVKYnllRmxFQ2o3UGtBOThtVUp3NmlUVy9lbzdQR010ek83TWl0?=
 =?utf-8?B?WkVocDI5V25WWlZSRmZNRUtPTjhNVTkzWGU0aG9xOVRoSndyc1AzdVNuU2U3?=
 =?utf-8?B?VEc2ZjdmTktkR0o0ZDdkck5udEZTMGtxSngyRTYrQUI0Tk9qbUkzZjljNEV1?=
 =?utf-8?B?cjZJVUR5VzYvUTgwWGhXT2VuY1M4Z2Z3RktQM1ZzakZxb0QxKzRnMXZnWTU3?=
 =?utf-8?B?RUVmdEtKclhCSyt1Ymg0Rjl5TjRJcEFtbGlrRnk0cFo4bHBzam40NWtmT2Fp?=
 =?utf-8?B?NWNVUk1HZ1RzU2pKTkozUGl0WllMMWZBUVFUN1NIT1JVcndHalFtcWg3c0dO?=
 =?utf-8?B?RURRZ0g2WE1NdHZVbUk2NldtQ2tUVVYrazVsbzBHNHJYQkZoYmNvMlhSTGxn?=
 =?utf-8?B?cU9qaUFpbnhMbHV2N0F3Zm8yQTFEQnV0L0tDaDB4aEozb0RYUTUxY25Idmsy?=
 =?utf-8?B?WG5qVFhuV202OEFlZ2JHdUhESVlFblNFSXZmQ2trVHlNNkVuc21TZkFhS1Rt?=
 =?utf-8?B?dU13bm1zSDFsQkJQL0EzUGpTTXlWQ2MwQ1lCSUUxNFlYeVpzT0tLc20yYWI4?=
 =?utf-8?Q?XWsn2XhhJ4Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG9CN1VCcFRJdzRobXgrMkFIbVVQQVBoOFZIbUFIeEVkUUZIczlFQTFKNy94?=
 =?utf-8?B?TXRtOFFueDB3azFoNFp0TjQ5NEI0RHlKTU1RK1hIb3RrclFxcUV3enNUQnlY?=
 =?utf-8?B?TUZDZTNLb0o2ZldwaTZScUNsbjByTEplRVRTSllXL1dLMllJSGpZcUxicFlR?=
 =?utf-8?B?NXFCZXp6S0Vta1pNdlYvLzhZcHNLNTNkSWFlNE5pQXVNd1pUMUxXd1BiNjR4?=
 =?utf-8?B?bWkvS29OTGFwUzdoZ1FLQVk1VFJFQXhTZDJKU21aempBc2FwZkwzRXFQUUtt?=
 =?utf-8?B?ejZvTW1pbUVzWlJJQ2s4TWRxNkw0aTB0bWp5bFJqN3NZV1piQlcrUzBFMVMv?=
 =?utf-8?B?UGJoWHhtWmo4UGZjQzFBSDhWcGZ5RE9veTNKcDJBNmovQmYrMDNXYzdodkRj?=
 =?utf-8?B?eG9SUmZvdkVXMGY1MjdtWThPM0N6VWgxWk5Hb0FCODk0Sjg4aHZ4elJvTVpt?=
 =?utf-8?B?b25sSERsMDZjVDVPU0htWlh5dU0vUWdvcm5sKytWSlljM1k1aHlMOVNha1Jy?=
 =?utf-8?B?UWhodlM0R1NPQ2dIQ2pLODdZVUxjbUFYZVhML1Zvd0FGSndsYloxT3QvbGJ4?=
 =?utf-8?B?OHhSZ3BsRGF3cVQvZmVEbW4vbHUyenFDbUJjRnIwd3JrdkQreEV4cGFFVEdp?=
 =?utf-8?B?cmlCa0pBd0J2SC84VVBLM1VJT2NNbXBWWmNSZ1RYNlYwMWlXYWFqWmhEcGdw?=
 =?utf-8?B?aWhHS3NPR0tLalNMK2I4bXc0TTNLQVlselk4SDh5MTRSeTZiYWdrcjZqSEE2?=
 =?utf-8?B?bzJVSzRZZVFoRkpQK1RaeVdiS3ljRjI1NVRmVFRwdHU5OWJWNXdheXFHNFNj?=
 =?utf-8?B?ZWQ1UzBFZzlBMlhNV0IreWZYdXBrMVl4ZkNEOFZaZzhoTW96MnljdE1Gem8w?=
 =?utf-8?B?cEd2am83cjY2d2JVMkdxcEoyOHZpciszUDN1QmFxMHJOazRCZUNKZi9tS1ln?=
 =?utf-8?B?b3ZHNGp5ZFJVQTd5VW0ycWFGemNtNDR2all0T1p5bStkWHMveW1CNnhsUVBh?=
 =?utf-8?B?ZFVycmQvaWFpaE92akhIbk9KZTJPR1hnK0RFd0RjbXVnYThSR2lWSlN0TFpS?=
 =?utf-8?B?WjZQRjlRM1VjSWZDTGlTaExjQkNVMVBJeWtkdk5mMFBKSlhyOUdaK3pKd0lt?=
 =?utf-8?B?WnJnaXVwaEloeXVEeTNCbnAxSEFxcmVQVmt4RHhEdXpVRk9aK3JTWmFnL3B0?=
 =?utf-8?B?UGd2NHVjQ0Y5MEVDME5nU3NiSHFjdE9TVzJMUVZLM2JRejZkdENRTEhPUmJr?=
 =?utf-8?B?R0hreDNCNXd3WDh6Sm9SVitCQWNvN0htVXNqNmJ2aEtiMlh0bXZZdG5DdTBC?=
 =?utf-8?B?YmY5c1o3bkNaZHo3L1VWNjI2VTN6U20wUDk3QWpIN1pIaTRvS2Y1TlRtSmYy?=
 =?utf-8?B?K0RrVWFYOFRPRnYvS1duVkFOU2FPSVdDM2R0SThUaEdFWXhiaE5ISXFHZVhn?=
 =?utf-8?B?Uy9aTlNXUExWRU5wMlhvZFBhczRjalZJckd6L0N5Q2VCa2IwYnluYjlLVzkw?=
 =?utf-8?B?VGY2cjJaeWkwb0R3cnZiYXNrKzY3M0hGQzhBaStvc1BHdlhMbVU5bmlpa3o5?=
 =?utf-8?B?TVYzTFZwbDV2MnNQS21yL1Z0bWRWVC9ROGlmeU1rdS95ME1PZ292cVpIaWk2?=
 =?utf-8?B?N2UyT1R1dEwyWXdCL0lIa3ZtdDhkZGQ1QkJqOXUzVWZVYUo3OUNyWS9BSmVq?=
 =?utf-8?B?eHVLMzVQeCtvR3NMbnFvWFdZNjBQOVIvTUxxLzBVaWo5SHJ2dkdTdVBxTDJJ?=
 =?utf-8?B?Zm5SNW9zb3J3MlBBQ25oTmdkTGNWRUd0c21jUDA5bzZxTzN1VlBHeU9KUENa?=
 =?utf-8?B?ZEs3K3FEL3hyMlJJWk91OXNEclF4M0t3VkZJZ2lQTnlwamtoL2o3TWdKSmtp?=
 =?utf-8?B?NGtjbGxTcTRJVEtzK2VUKzdLTitDbVNPVFNOMGRDR1BQSHBZMG41N1F3Q01n?=
 =?utf-8?B?ZktPcVQwYlJFajVYZVRrMzdUdURpY1BVdkcwYzFQTXY1a2xMRnozSnlnWUVP?=
 =?utf-8?B?djRqTjh1OGY0ZUoyU0g1WUdibzNoNDU2cnBxL0dES1d5bk1FOVo3QTNzTklD?=
 =?utf-8?B?bFlCaHBkQzRKdmg3YjRMWjhKOWxvK2NQVDVzZFRBNW9rSnIrZE90eTJJc3JG?=
 =?utf-8?B?SUUwQWY4WnZucWF4bUVnaUdWZXAzeUN4d0JMU001NTdEbmxrVFhUdjdLSXNV?=
 =?utf-8?Q?4+6tf0LreCXxgXtnHA/peq8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf4c444-1902-4874-a622-08ddc99fdd92
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 04:17:41.2199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdrH+TvAKiyOjuZVJ5aLbauOcxmFBUIrsoFqPXJZoKWbo5brgVSxzNUiucx/tEo7dxg/hkd0YSviGd4hL8jkJztzXFCsGY4PNQlin0k48MmFq9BG9+FmAla/K7x7sxNl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
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

Hi Pranay,

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

On 17-07-2025 15:06, Pranay Samala wrote:
> Reduce the number of iterations, draw_method combinations, and limit
> execution to a single pipe to enable this test to run on simulation.
> 
> v2:
> - Cache igt_run_in_simulation() in a global variable (Santhosh)
> - Reduce the duration of the loops (Jonathan)
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 66dcdc281..061e996cc 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -890,6 +890,9 @@ struct test_mode {
>   	enum igt_draw_method method;
>   };
>   
> +static bool in_simulation;
> +static int r_max;
> +
>   enum color {
>   	COLOR_RED,
>   	COLOR_GREEN,
> @@ -2858,6 +2861,7 @@ static void multidraw_subtest(const struct test_mode *t)
>   	struct fb_region *target;
>   	enum igt_draw_method m1, m2, used_method;
>   	bool wc_used = false;
> +	int draw_count, pattern_rects;
>   
>   	switch (t->plane) {
>   	case PLANE_PRI:
> @@ -2874,8 +2878,11 @@ static void multidraw_subtest(const struct test_mode *t)
>   	prepare_subtest(t, pattern);
>   	target = pick_target(t, params);
>   
> -	for (m1 = 0; m1 < IGT_DRAW_METHOD_COUNT; m1++) {
> -		for (m2 = m1 + 1; m2 < IGT_DRAW_METHOD_COUNT; m2++) {
> +	draw_count = in_simulation ? 1 : IGT_DRAW_METHOD_COUNT;
> +	pattern_rects = in_simulation ? 1 : pattern->n_rects;
> +
> +	for (m1 = 0; m1 < draw_count; m1++) {
> +		for (m2 = m1 + 1; m2 < draw_count; m2++) {
>   
>   			igt_debug("Methods %s and %s\n",
>   				  igt_draw_get_method_name(m1),
> @@ -2885,7 +2892,7 @@ static void multidraw_subtest(const struct test_mode *t)
>   			    !igt_draw_supports_method(drm.fd, m2))
>   				continue;
>   
> -			for (r = 0; r < pattern->n_rects; r++) {
> +			for (r = 0; r < pattern_rects; r++) {
>   				used_method = (r % 2 == 0) ? m1 : m2;
>   
>   				igt_debug("Used method %s\n",
> @@ -3248,12 +3255,12 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
>    */
>   static void move_subtest(const struct test_mode *t)
>   {
> -	int r;
>   	int assertions = ASSERT_NO_ACTION_CHANGE;
>   	struct modeset_params *params = pick_params(t);
>   	struct draw_pattern_info *pattern = &pattern3;
>   	struct fb_region *reg = pick_target(t, params);
>   	bool repeat = false;
> +	r_max = in_simulation ? 2 : pattern->n_rects;
>   
>   	prepare_subtest(t, pattern);
>   
> @@ -3263,7 +3270,7 @@ static void move_subtest(const struct test_mode *t)
>   
>   	do_assertions(assertions);
>   
> -	for (r = 1; r < pattern->n_rects; r++) {
> +	for (int r = 1; r < r_max; r++) {
>   		struct rect rect = pattern->get_rect(&params->primary, r);
>   
>   		igt_plane_set_fb(reg->plane, reg->fb);
> @@ -3301,11 +3308,12 @@ static void move_subtest(const struct test_mode *t)
>    */
>   static void onoff_subtest(const struct test_mode *t)
>   {
> -	int r;
>   	int assertions = ASSERT_NO_ACTION_CHANGE;
>   	struct modeset_params *params = pick_params(t);
>   	struct draw_pattern_info *pattern = &pattern3;
>   
> +	r_max = in_simulation ? 1 : 4;
> +
>   	prepare_subtest(t, pattern);
>   
>   	/* Just paint the right color since we start at 0x0. */
> @@ -3313,7 +3321,7 @@ static void onoff_subtest(const struct test_mode *t)
>   	update_wanted_crc(t, &pattern->crcs[t->format][0]);
>   	do_assertions(assertions);
>   
> -	for (r = 0; r < 4; r++) {
> +	for (int r = 0; r < r_max; r++) {
>   		struct fb_region *reg = pick_target(t, params);
>   
>   		if (r % 2 == 0) {
> @@ -4100,6 +4108,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			opt.tiling = drm.display_ver >= 30 ? TILING_4 : TILING_X;
>   
>   		setup_environment();
> +		in_simulation = igt_run_in_simulation();
>   	}
>   
>   	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
> @@ -4184,6 +4193,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   
>   					break; /* One output is enough. */
>   				}
> +				if (in_simulation)
> +					break;
>   			}
>   		}
>   


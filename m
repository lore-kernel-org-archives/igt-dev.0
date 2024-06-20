Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F075BC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F65B10E870;
	Thu, 20 Jun 2024 23:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4B1NMdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233C610E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718927020; x=1750463020;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bcOhn2PFZIOOZ+rr65Efr6niPufNSeFIpcCvY0w91F0=;
 b=J4B1NMdYj6pb2wiFylPW9EJutHOGiiunnafiCDLq5EFJ6qkgAzA4qdJL
 6de0kLDPU5seX14ToTQmsGA978pJ4RvXqX4tvYf8RQBWBhwYvhepp2PTY
 5gr/ekK7quBSaH2vXYKrZV2ed+XwaA/Zboryq3w/Ta105GAQS6D/xEFUi
 S+uWA1RoBqi1QsgyXFDDSbpLhRDPCy3/FGs0HYX07GTBoNhynMSoUbLge
 xhG31citdjoUzvuSsAbXbRBNjdBFBDvRAnoj+DywV7D4kTBoFugUT+DFk
 UVZIEqRsJen3o7ohi6TUTDpTvFad3eCwIcItkIGhn3Ri0QZq6b7g8+F2u A==;
X-CSE-ConnectionGUID: sKeYy8CwTVqrdHsImcgaMw==
X-CSE-MsgGUID: 2k4/iAXJRduWmFXr1KQ3gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15771237"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="15771237"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:43:40 -0700
X-CSE-ConnectionGUID: VzqS58o6TfqvDXzyK9n5BA==
X-CSE-MsgGUID: 286XUn/aSGKbxD7Op/qCaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="65653428"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:43:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:43:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:43:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ime1mbHhJmLnouyzFX9FPWQd6oXKoZH/P/D4g73t7XTtHS0HkM/m5uLChvTuAsH/ohzbEIiQkfWhlusFEVHclVRQk32uNRvjtG5jlutTMe8fBHuT1E+xMvnw3gZD3YTGzTGInP6tkFf3+Gr08yWrT/1xTSaStlS6fJj9FcJEC1TN+UNXz397UDgLkWgBPIB0wLpa42OJTt44pJ72nVd/sWsL/4p44T8VnBy9GTOD2CtigrTjG3p4hu5K9o4scke4Pk3n7q0YQgjox3MTs5/kLbHpy5uBZ+o8TfIqV0tfBAwlxiCdgNslg/OrLRWo6BkyZtM1roplbly4VpRCQA1Kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CP8zNX02vbycT7Wvwbh3fce67BvSyiIcEgDb0G32P4c=;
 b=d2573O1b37Rm4VHlyEEeeIvia+0U/JOWyjSvHqtpfjQvPn4U+LNsc/MTiwT8mCpfqYm9Ns3HBNI1LC090onSeGTXNnI4lAfHbdBEHbH6CoCkAwK+IsByGQQJ5Xd2bKOn99hfinS529vwRttiSNed/HAvvVoSIn1oNWQ9ZUI8qgJ1WDwSiG3sPftg1E9TYCd7Sw+KB3GTDawCg5JElUzo7i0YBde4gMsU3lMv7fisB0V8XipZ8iAsRwnlbnzoSM51zoj+UZwZVzSD5yRbxJM4BIyt5ySRO9Kx+kSJz72c8KA/y3CD/kQndYyhlE45SjcjABXoXzpSmJ5nZc4C/iNgGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Thu, 20 Jun
 2024 23:43:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:43:37 +0000
Date: Thu, 20 Jun 2024 16:43:35 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 25/28] xe/oa/mdapi-xml-convert: Add support for
 576B_PEC64LL format
Message-ID: <ZnS+p0LW5Yc5pIDl@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-26-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620200054.3550653-26-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:303:b6::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: 843997b8-fbcd-4194-4bde-08dc9182ce2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFJwZ2JxTVMvWmZuTmNycmVBYWZZNDV4SHJmbUJaN1VxYlc2ejdGV05RTk85?=
 =?utf-8?B?TVRXdTZmbWVRL096YlBXcUZieFBKQ3VZeUs3OWhEaE5lZXBWUW9pRUZTNFJM?=
 =?utf-8?B?S1ZnaHpjMDA2T3ZrZmNsVTBQaDJIWGxYTlFIMGR1RkVmWS9JWjBrYys3c1hj?=
 =?utf-8?B?VUlMVkJoUzdNQ3JkMlhUNE1IMnFoZ1pqTGFJalMzenM1UmNaUE1ETGpxbUxE?=
 =?utf-8?B?a3dzdTdmWUtQdGxUSlRlV2prU2U3S0NFdHI4T0ZwQlFPYkQ0ZENzOVEvbWVl?=
 =?utf-8?B?Q29UQm5JL0xGTEFXdDJ1VHExc3JPazIydm9RM1dpYldnU3JiUi9WVnpqNU4v?=
 =?utf-8?B?b09aSWgzK0VXV0ZwaWF0TzlxS0lvSENsMFcxUkp2NUs0cFFudnd2WEdGZ2tl?=
 =?utf-8?B?NVRxRC9OY3V5MGwzQ0I3K0R1U3JzWkVXd0lCYVlteHFVTHN0Q2VHSCtKaWt3?=
 =?utf-8?B?R0JVdHlSNmxxVm9zOFEzaFZOU0RQMEliL092dVkwUWY2TXlpSlc2M2xpNnFZ?=
 =?utf-8?B?RlNpdjdDMitpMDNieGFmdHdYTjE0SkdLT3NvS3pHV3JUblArQ2EyY1Z1NVRV?=
 =?utf-8?B?MmNsc0lhNkhlbDl2Y3RwSTFVZGNRd05DS3RwZlgxRzZiRytjQ2NpKzR4NmhK?=
 =?utf-8?B?elljR3BkSU1iZk9RUjFsR29ZRnhiVnRqM0xXYjE2MUFhdlJTQTQxeHlub2tR?=
 =?utf-8?B?bERDYUZjNWNyOWZvWmZ6SWlPWG1HOUV0dDYvUHBoQktrbDlGUVV1eFNXWS9i?=
 =?utf-8?B?N0cvWEI4QTZEc3hMY2hCMVdLd24rN0lJWjRTeGcvRTg5VmpOUStRcW9wWWFG?=
 =?utf-8?B?Rm16bGMvSlQ1S3l5Ymp5TWlQemFWS2M4RmdLa0VJR2MxMDZ1ZUVCY0hzMTdx?=
 =?utf-8?B?emQxaCtIcnN1YkpMZjl3VnYyYnE4YWovWEMwbmh2bjFkU2ZxTVdZYzgzdFgv?=
 =?utf-8?B?Q3VzQVNCaTFTVVRHRWxqZGM5N0s0YS9NWUV0dU1BS2xsT1pGTDRjYmJXTHBH?=
 =?utf-8?B?bnFvdFlnQzRCZG9XbnB4ZlZMVUhyQURqaUJ1MWxsWEtYY3cxY0hpWFZoV09Q?=
 =?utf-8?B?RUEzMThSRGxRUlZMRFl6ZDhaR3Q5VEorT2FDc2VqNTVPS3cvcldCNnJFU2Mw?=
 =?utf-8?B?UE14NTBQZWJzNDA0QkpBMFVRd1BVYzNEMUZ1b2NEU2c5OEhTMjhvRVNoUWI1?=
 =?utf-8?B?Rmkya0ZmeEIyMXZHQkpKYlRERElwK2t5VzZWUGFjc2NQRGMzcnRvakt0NGJQ?=
 =?utf-8?B?Q2V1VHE5RnZHaWJ6ZFpGUFFOTTVVempXNDg1UUYrVWhiOThOV3B3MUhiQXlU?=
 =?utf-8?B?cXgrVEJwTEZYMXhPY3pXSDBaKzZrR1hraTY0STFjRkl3MHh6eW1DTnlZSFRh?=
 =?utf-8?B?b3BNTjhiR1U5LzZGcHVOdXFVK0NDRTEzUWlpSTFGT1Y2UFdqa1VTN2dWa09i?=
 =?utf-8?B?WDdpZlJESWRhZ1kyQTBLMGZSNmhJYmJ0a0VELzlTMnM4T3RDSnZQbjVXdks5?=
 =?utf-8?B?S2EyQ0pLVVo3R1J6Y2dHQ1FOdWcydm12VXY0Q3RUUGh1UEsxb2ZydjRVZW45?=
 =?utf-8?B?ZSttMXNaeUtUVm0yLy9sMVFkUGtUTHpBUkVxcU9xU2Y4YW16bTRWdWxjTnRB?=
 =?utf-8?B?MklPQlMxZWh2cDZsRzZ3U2NITFhrTDRlOFMwOUJ4WFdGRldRTStLbUJFMVp5?=
 =?utf-8?B?Q1YyZUF6TXErQ09JTm9naUw2SUV0Q1hvYTNENForSWlkMWxlZExENWpTUFJa?=
 =?utf-8?Q?wH7K8g9PObtHKa9c+TJewxvFM5kdFCRzU8dSVPd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlJUitVdUlmeGlFN29sa0Vhc3NTRTdYS1NYeFdIczdDZm5jckhESUhGYkZH?=
 =?utf-8?B?TXdoWmtzSXFUZWpoUGxGQ1FZYjRMT0FQeTNiWU1pZmRyZHFMeHQ4TEpsZ003?=
 =?utf-8?B?SUQ4cG9tN1RwU2dzWFNpY1NZMFFMNzZYRnFVbEJ2R05Nc2VrV0NvTmpWZmJE?=
 =?utf-8?B?cHNxOU01d0NxSWIwVFJIcDJENGhvV0hxZjF2N1lNOFdjS2NWek5FY1VJSjN3?=
 =?utf-8?B?ck11RnRkT1p2TFpHWFVxRGUzMnpwME9iQUFiSEJGbjljYUFnWXBoNnFMR1Jy?=
 =?utf-8?B?aXh4bURURUlaZjNHUDdTNXRpZmxGZWhONjRKamo3SmZOdmhhaGVmOXBuVFhy?=
 =?utf-8?B?b2E2QXprcUZ2akYzczRjZU9tdmlXWjM5Y0thSktoWU1tU0FhR2Q1WDVDdlJR?=
 =?utf-8?B?cndITTJ4NHpmTjhIUzRTei9YejBlems0bDJGb1NMSFQ4Z0cwanJxcm5WM3FG?=
 =?utf-8?B?Nms1bDcrUnlFTDNlL1ZWdCtsWS9xVFpBQllLRHU2RDdPTGQvODIvWWNQeVli?=
 =?utf-8?B?WDZ2TVlCWnZaL0E0SzlkTThyY2pzVm9RV2lyZFkrMk92Z2dJQUd6NEU4dktR?=
 =?utf-8?B?eW5BeEduMEJjeGdTRmN2NW5uUVc3ekpqOXJZcW0zb3R1N2VQNEVTaWNXa2xE?=
 =?utf-8?B?d1MvdlcyNWcwNjhEcWtvSk9takc0WTdmNEYwZmFDSW5ZOHRxdjhTODdDbjBH?=
 =?utf-8?B?dlBLS3RpSVFRa3NOT21tRWN2czNVME5BZmlvaVF0SDg4Mml1M3ZPSy85TXBk?=
 =?utf-8?B?UmJ4Q1ZDamU2SnIzelg3a0VhY1dKeGZVejhHc2JkUlFnZkJQZmMvZVNqQlBZ?=
 =?utf-8?B?NmpyVWFLMStESUhwRTc2cFJJdWV0K3ZxQzNJT1IxS0xtTEExbjA4WUlKVEhU?=
 =?utf-8?B?RUxaK2x2NG8wUGwvblkyZTRIYUFlcGIwaW9ySFJ3QWtCRTVTRVN1cnhQQzZR?=
 =?utf-8?B?Q2x5cktZTlMvb0JmYlRPYkJTTnNBZ0xqUTI5bXlRTUJnQzNwdE5nV3RFeUti?=
 =?utf-8?B?TUx6RHcvUnhjT20yY3NNQWV3cCtjS1M1ZWVGeTJ1UTJUdVR3cm9HbHp2YnFV?=
 =?utf-8?B?N2FxS3ZseEVBWnE1d3EzbWkxcUVHZmJwVU1jT2tpdGR5Z3QzbXhsVFUyeVpE?=
 =?utf-8?B?ajI1Ly83SXdYb3dCNTh0QURGaS9WMlR3b29mZEVwUitnWjZadS94ZUptaWV1?=
 =?utf-8?B?OFF6TSt5QmM1NGNET0JueUUrTnRMRkJMTG1DWkc5K3Z5KzhBcmUzUmVLcFIv?=
 =?utf-8?B?bFYyTEhhVWlpQW5LalFIQkMra25ERm9YWFhocmxubWxsWG5YQUUxNXZGYU42?=
 =?utf-8?B?amN6S01tVmZFZ1RvQUkzb0hzd3ZrZHVTcG9BYjE0clhuZ0RxV0h0NytiT1A0?=
 =?utf-8?B?OVpKeG1LMXhyK2xGZUlzQUk5OXkyYU5KTzJxTFlIWEo0cEFVS0JkWlVNZnU4?=
 =?utf-8?B?OFcxaXpreU5NdHFyRnV4NTVHM2ZXbW56cWE3SHBsbUNzaGQ1N2xwWUFlc3FM?=
 =?utf-8?B?cjBxOCsvSVlmOWhxZVhUUG80bGFVNDZ1MmZPLzNNOTgvMWRvZlJMQmhhNWJK?=
 =?utf-8?B?TVZwYlE5cUY5VVZWWW11bENNdUkwU29odnpVczMvWi8yTHlmR1NVZTgwa0FN?=
 =?utf-8?B?NlMzaGV6eTFSelpmeURsNnR5Z0o2VTVXZFpvQ1I0VzJXQlgwMk1RRFpOb2ZS?=
 =?utf-8?B?djdYcWIyc2sreGYzaTF0d1I5T1hXNCtDRUxuK1JuSDZUOTNNVDRaUjFGUGkw?=
 =?utf-8?B?bHNEQ0xpTDNBazBUbFNRM0VCd2JYcm91S1cwTHdjMWlpMHlKcTNNbWQyL0RP?=
 =?utf-8?B?aHprc0JkajRucXU4RDlHVGJrNVlVcGEvVnN2VWNvZUdES2hKK0R4MVRyZ3Ux?=
 =?utf-8?B?RlExeDRRODIxQzhBNFNibldZa0l4ZFNjNVp6NHpkUHlRTlZIRUVkWXpPU0lo?=
 =?utf-8?B?Wit5YWhWNzJWU3g2YjBkSkRDVi9aT1EwMTNwZTRmWEJGNHR1a2JKbGxxdzQw?=
 =?utf-8?B?VTROV05kUjluak80U3c5dXlSNjUwb2RMcHpqVlhiNkEzWHJ4VUpab3lhM1V0?=
 =?utf-8?B?QUtmSjZ4aTd4cGtiMThRaEp6azVPY1ZqaHFUVFBpQlhkWVRoUG9EUy9jdTJU?=
 =?utf-8?B?Z3BRU0RkWjZuOU9KN0pud0Izb1dST0RsUll1anlRQ1Z1dzRmMjJicTRPZXE4?=
 =?utf-8?Q?SKGsghWZk36QSBamLqtq6Qk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 843997b8-fbcd-4194-4bde-08dc9182ce2f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:43:37.1610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LI6yvhxJRrcNXUGLlj7QP2xd3lZ6KNVE77RruJe3gizDeIZLs+AhGzcOAnsLmp5Rj2SMLRTrhd4VpsupHBJsC801g/BqMHXnhAM7Jas8t7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Thu, Jun 20, 2024 at 01:00:50PM -0700, Ashutosh Dixit wrote:
>From: José Roberto de Souza <jose.souza@intel.com>
>
>Xe2 don't use the 256bytes long format, instead it uses a 576bytes
>long with 64 PEC fields that are 64 bits long.
>This patch fixes the xe2 definition and add the parser for this format.
>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/xe/oa-configs/codegen.py           |  5 ++
> lib/xe/oa-configs/mdapi-xml-convert.py | 76 +++++++++++++++++++++-----
> lib/xe/xe_oa.h                         |  1 +
> 3 files changed, 67 insertions(+), 15 deletions(-)
>
>diff --git a/lib/xe/oa-configs/codegen.py b/lib/xe/oa-configs/codegen.py
>index f078ef9498..51498f803d 100644
>--- a/lib/xe/oa-configs/codegen.py
>+++ b/lib/xe/oa-configs/codegen.py
>@@ -128,6 +128,7 @@ class Set:
>         return self.xml.find(path)
>
>
>+#TODO add SqidiTotalCount, L3BankTotalCount, L3NodeTotalCount
> hw_vars_mapping = {
>     "$EuCoresTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
>     "$EuSlicesTotalCount": { 'c': "perf->devinfo.n_eu_slices" },
>@@ -159,6 +160,10 @@ hw_vars_mapping = {
>     "$GpuMaxFrequency": { 'c': "perf->devinfo.gt_max_freq" },
>     "$SkuRevisionId": { 'c': "perf->devinfo.revision" },
>     "$QueryMode": { 'c': "perf->devinfo.query_mode" },
>+
>+    "$ComputeEngineTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
>+
>+    "$CopyEngineTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
> }
>
> def is_hw_var(name):
>diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
>index 575b53e955..602a3965af 100755
>--- a/lib/xe/oa-configs/mdapi-xml-convert.py
>+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
>@@ -149,12 +149,10 @@ mtl_chipset_oam_samedia_params = {
>     }
> }
>
>-# FIXME: everything except oa_report_size is incorrect here
>-xe2_chipset_params = {
>-    'a_offset': 16,
>-    'b_offset': 192,
>-    'c_offset': 224,
>+xe2_chipset_params_pec = {
>+    'pec_offset': 32,
>     'oa_report_size': 576,
>+    # TODO: Not sure about the configs below
>     'config_reg_blacklist': {
>         0x2364, # OACTXID
>     },
>@@ -183,7 +181,11 @@ mtl_chipset_oa_formats = {
> }
>
> xe2_chipset_oa_formats = {
>-    '256B_GENERIC_NOA16': xe2_chipset_params,
>+    '576B_PEC64LL': xe2_chipset_params_pec,
>+    # We only care about 576B_PEC64LL metrics in Xe2, entries below is just to
>+    # surpress warnings
>+    '256B_GENERIC_NOA16': xehpsdv_chipset_params,
>+    '128B_MPEC8_NOA16': mtl_chipset_oam_samedia_params,
> }
>
> chipsets = {
>@@ -209,8 +211,6 @@ chipsets = {
>
> xehp_plus = ( 'ACM', 'MTL' )
>
>-xe2_plus = ( 'LNL' )
>-
> register_types = { 'OA', 'NOA', 'FLEX', 'PM' }
>
> default_set_blacklist = { "RenderDX1x", # TODO: rename to something non 'DX'
>@@ -298,6 +298,46 @@ def read_token_to_rpn_read_oam(chipset, token, raw_offsets, oa_format):
>
>     assert 0
>
>+def read_token_to_rpn_read_pec(chipset, token, raw_offsets, oa_format):
>+    width, offset_str = token.split('@')
>+    offset = int(offset_str, 16)
>+
>+    if width != 'qw':
>+        assert 0
>+
>+    if raw_offsets:
>+        pec_offset = chipsets[chipset][oa_format]['pec_offset']
>+
>+        if offset < pec_offset:
>+            if offset == 8:
>+                return "GPU_TIME 0 READ"
>+            elif offset == 24:
>+                return "GPU_CLOCK 0 READ"
>+            else:
>+                assert 0
>+        else:
>+            pec_cnt_offset = int((offset - pec_offset) / 8)
>+
>+            return "PEC " + str(pec_cnt_offset) + " READ"
>+    else:
>+        # Location in the accumulated deltas
>+        idx = int(offset / 8)
>+
>+        if idx == 0:
>+            return "GPU_TIME 0 READ"
>+        elif idx == 1:
>+            return "GPU_CLOCK 0 READ"
>+        else:
>+            idx = idx - 2;
>+            pec_cnt_offset = str(idx)
>+            pec_high_low_text = "low"
>+            if (offset % 8) > 0:
>+               pec_high_low_text = "high"
>+
>+            return "PEC " + pec_cnt_offset + " READ"
>+
>+    assert 0
>+
> def read_token_to_rpn_read_oag(chipset, token, raw_offsets, oa_format):
>     width, offset_str = token.split('@')
>
>@@ -374,9 +414,6 @@ def read_token_to_rpn_read_oag(chipset, token, raw_offsets, oa_format):
>                 return "C " + str(idx - 48) + " READ"
>             else:
>                 return "{0} READ".format(read_value(chipset, offset, oa_format))
>-        elif chipset in xe2_plus:
>-            # FIXME: skip all metrics to retain just the registers
>-                return "GPU_TIME 0 READ"
>         else:
>             # For Gen8+ the array of accumulated counters is
>             # assumed to start with a GPU_TIME then GPU_CLOCK,
>@@ -405,6 +442,9 @@ def read_token_to_rpn_read(chipset, token, raw_offsets, oa_format):
>     if oa_format in ['192B_MPEC8LL_NOA16', '128B_MPEC8_NOA16']:
>         return read_token_to_rpn_read_oam(chipset, token, raw_offsets, oa_format)
>
>+    if oa_format in ['576B_PEC64LL']:
>+        return read_token_to_rpn_read_pec(chipset, token, raw_offsets, oa_format)
>+
>     assert 0
>
> def replace_read_tokens_with_rpn_read_ops(chipset, oa_format, equation, raw_offsets):
>@@ -905,6 +945,8 @@ for arg in args.xml:
>                 mdapi_counter.set('NormalizationEquation', '$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV')
>                 #mdapi_counter.set('DeltaReportReadEquation', '$GpuCoreClocks $GpuTime UDIV')
>
>+            if mdapi_counter.get('SymbolName') == "ResultUncertainty":
>+                continue
>
>             symbol_name = oa_registry.Registry.sanitize_symbol_name(mdapi_counter.get('SymbolName'))
>
>@@ -992,11 +1034,15 @@ for arg in args.xml:
>             # XXX: As a special case, we override the raw and delta report
>             # equations for the GpuTime counters, which seem inconsistent
>             if mdapi_counter.get('SymbolName') == "GpuTime":
>-                mdapi_counter.set('DeltaReportReadEquation', "qw@0x0 1000000000 UMUL $GpuTimestampFrequency UDIV")
>-                if chipset == 'MTL' and oa_format != '256B_GENERIC_NOA16':
>-                    mdapi_counter.set('SnapshotReportReadEquation', "qw@0x08 1000000000 UMUL $GpuTimestampFrequency UDIV")
>+                if oa_format == '576B_PEC64LL':
>+                   mdapi_counter.set('DeltaReportReadEquation', "qw@0x0 1000000000 UMUL $GpuTimestampFrequency UDIV")
>+                   mdapi_counter.set('SnapshotReportReadEquation', "qw@0x08 1000000000 UMUL $GpuTimestampFrequency UDIV")
>                 else:
>-                    mdapi_counter.set('SnapshotReportReadEquation', "dw@0x04 1000000000 UMUL $GpuTimestampFrequency UDIV")
>+                   mdapi_counter.set('DeltaReportReadEquation', "qw@0x0 1000000000 UMUL $GpuTimestampFrequency UDIV")
>+                   if chipset == 'MTL' and oa_format != '256B_GENERIC_NOA16':
>+                      mdapi_counter.set('SnapshotReportReadEquation', "qw@0x08 1000000000 UMUL $GpuTimestampFrequency UDIV")
>+                   else:
>+                      mdapi_counter.set('SnapshotReportReadEquation', "dw@0x04 1000000000 UMUL $GpuTimestampFrequency UDIV")
>
>             availability = fixup_equation(mdapi_counter.get('AvailabilityEquation'))
>             if availability == "":
>diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
>index c16177ec8e..f6f2768b00 100644
>--- a/lib/xe/xe_oa.h
>+++ b/lib/xe/xe_oa.h
>@@ -275,6 +275,7 @@ struct intel_xe_perf_metric_set {
> 	int b_offset;
> 	int c_offset;
> 	int perfcnt_offset;
>+	int pec_offset;
>
> 	const struct intel_xe_perf_register_prog *b_counter_regs;
> 	uint32_t n_b_counter_regs;
>-- 
>2.41.0
>

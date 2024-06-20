Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1150DC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD6710E8D0;
	Thu, 20 Jun 2024 23:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4AP8mw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA2A10E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718926874; x=1750462874;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YvwDj5I3PR4AA8mfJ+J6NWhq2dyY+D4EjhQ0/pQqpN8=;
 b=J4AP8mw5iBLP/arLf/lt4mPJemzCbCTnysx3KYrbLqabK6R1hXikL6Og
 2AefGM8y5jXVh/zprkB5dstG3I+PwunQvE0WChykm+MQyTOGfbmUj+nLN
 yFo53UDfzZtQhEATteEGNlXAl6jzsGPKmzSM24gaY1i33d4lCj1mO8YdP
 Xcq/0sMLjfrciFcKLlLBvT5tZOzKd8mXdRjZrUQcy7mKfMj+fptx8w3sj
 pPBDfmsYdZ39yviIF7zxFGmaSpuMZdB2SQ/2P7Admykh15Wo8qbioSh6I
 AEpLElx2wwTcbG+vE0cNOG4pWcCFMloXMXoRm5cDfvpZaV16YJbUrvhUd A==;
X-CSE-ConnectionGUID: Ow1JIU62TYmJt7Ye61rHlg==
X-CSE-MsgGUID: deZfw3sBQVqSk9vKdmuuxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15770947"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="15770947"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:41:14 -0700
X-CSE-ConnectionGUID: RRVPf6L6QQCBFXKVirznqg==
X-CSE-MsgGUID: BXAmqFyQRfKkpQJHKYPnAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="65653222"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:41:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:41:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:41:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:41:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRcLxXUzhwzT+DozSwwBW8cS2GhjGtpg9LR4WwtnWlFAxxKnI2IKQUwmZ31gencV94wgNNP/eXjNGQAEgilgotJT3zeSY4/PhwjT0ECAc6S6ugv4WxxiQgqi2jb4jL+8N+LFQiEnRPCtjqhkc2vi2bTtMuwfx+zvTFClevUk90LnxLddmFtlY7o8YKvfQN55n+QMBeitKxaOh0egUV1jdzfPfY/YdvqirU0kshYK3IEZzl7Y5bS6rWrsr9QSf5YF0QBDEs1T21Mxt6X6PnPXk+OiznpEZojplPtgdvhDUwZ02DTAAxaQO0tq9Lodn0+jJVQMrbtaKna5QjqpTpnqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwUZW7UXa7ZKQSfry6Piz6XNydQp8r+jVmUgCGNT2Js=;
 b=nOPs5gIDqC1osSeETdY66QhAXNO4I2LE6kLKcFPoN7Zx23eJ9xt97fIxzELGTEtawrpR2lQp6eh+wzD9x8QfzQPbcPM6E3qP7wUkM+hFdI/am8E9G/Gi09bFgricIqoqyJb/gusjtXlWZr5EMderT9gqLjc7yEpc//Dyo+bCBmlvO2KCMGg97StFxRwgRlqCojN/gc7Ai0/veu8XzEBD6eJmZWSugpQRfPyB8JAC0kb2Jqh+7KHh5DU1uJ5ywocM+w0AZ+DebYxYu9nUDG2QggczZjVFASNi3kLiv5P7O8nTrHZlCtfYNBpAX/4nHY8iAOAfREt36wPQ+N8jbf6aqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:41:04 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:41:04 +0000
Date: Thu, 20 Jun 2024 16:41:02 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 22/28] tools/xe-perf: Add xe_perf_recorder
Message-ID: <ZnS+DvumpQHfjTMv@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-23-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620200054.3550653-23-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0326.namprd04.prod.outlook.com
 (2603:10b6:303:82::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ccf2da1-2181-4d8f-d85f-08dc91827355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUdFeWU4R2NFVEp4T3d3MEVZcEF4SkcxUGtWTSszeHRSMi9qTC9oU1VNN1RK?=
 =?utf-8?B?STVxTTFEM2UwUmUwb2E3b0FuNTRYRmlKSlV6bVVReWtyTjlPVStqQm5iV1hM?=
 =?utf-8?B?RTV6TE1IdndXYzIxdWdZbjZZRWZuZXAzc2ZRM1doL1REdmRZa004ZEVYcEZL?=
 =?utf-8?B?ZTF0YVR4SERGWGtEMFc0clBxanJBaWtIcmtNL2dXRFRZeXpEQTdpUzRSZlNa?=
 =?utf-8?B?aXBmSFRGcHErakxMNWN3VWxkckl4NTBxMHhGQ0ZZREpuNElDdkd4dUpmMVVz?=
 =?utf-8?B?Ry9iRWZ4VzJvRmtwTXlKckNLdkU5emhhRWttekM2QmljaDkybW5uenAwMlZV?=
 =?utf-8?B?ckUrVDM0Ykkwc3Y4WmgvRDBvZ2gzaFpPaEJvSjZlREgxckJ0Tmx1QjFNY2F3?=
 =?utf-8?B?ZFBTTnBDL0Z3MXZZQjVwM09oRWwwSHNPb3JobTZvdFRlSGd6NUJvZVB3Z1d5?=
 =?utf-8?B?YzNGb0J2UEVzemJySXdqODNlaUhlclA3aU1JRExRSzhDWGZ3ckt1cnNPY3F6?=
 =?utf-8?B?TVlEK1FyOXJJVXRaaGxUaTA2V28vTjdTWDNMc2JHTVVXN1c4d0Q0MFN5bkJt?=
 =?utf-8?B?cUpiYUY2dVVtMWF1UjI1c1B2QVdjZUVRWVFiNXRYQWcydzdhamxEbWVyM3JK?=
 =?utf-8?B?OWFTWDFDaTF2dC8rMXk1RWNzUU9KUFJIQnRqbU9zWXhmaXJ6ZUF5RUw5Q1lm?=
 =?utf-8?B?U3NrdC9YU1FKTEg1bldqN0kzUXp0ZCswekNXMWhUNGhGOWNyVEliUWlPZ0p1?=
 =?utf-8?B?SENVbkN6eUU2TGNURXg1eDJoVVNJM25Fd3hsRnpsZmZ3emMyekIrbkU1aGlY?=
 =?utf-8?B?NWFLVUY5MjFkdFNFZksrM3dTc1VTNDE0aTNmamFFMTZLZjBwN3pJaGQ0RnAr?=
 =?utf-8?B?bzFveUV1eFRXdDJNakNyYkI0ZXRXVld0RUJ4cUg5QUFWYm1LT2tVS2VTNW55?=
 =?utf-8?B?WGpxUklWbUpicnNQeVA4N3B4RUpSTXBpd0tibjRmL3NiVDh0NVdvRVdZaUpt?=
 =?utf-8?B?Rk9xQlExRDY2eVBOMUd3SmkwejFEaElhV05YZ2JiVUpEVitvQkpGQ3YyWHho?=
 =?utf-8?B?ZWxCcTFESVY0a0pDUXdiSXExU0lqUkMyeXFTV0JLazR0ZlUxa1BQaFNNSkNn?=
 =?utf-8?B?QzJ5RGJ5YXJ3eGJiN0Q4OG1nQk52K2t4UVJZdzYvVGExaGpDcnFHYzB4L015?=
 =?utf-8?B?VUNYOXZOVHZMYXk5ZzI3eXYxTDcyWXAwclVkRG11cVdoUG9LZVdHZm5iSkx4?=
 =?utf-8?B?SnNhRFZYRDlnWjJCL0pHRDdPRmpkRWRaNkNrbUVFeFJkV2RlQUNmS2QvTVJM?=
 =?utf-8?B?VTVhNmR3YjdqRzU5TVYwV3Y0OGhvK1FRK0J2cW1ZM1Q3aEhqOVBKb1Y0elVp?=
 =?utf-8?B?L0R3MW1pclBQL3d1NHBaMjNDbDdSZFRWdzMySlY2RVJSeERackdoSExqbndH?=
 =?utf-8?B?SE50RHdNYVgxMkdxUmZnQm9obzlmSnVaMTVDVmlHVXlqakU0YXdDQWRmQVgv?=
 =?utf-8?B?VkhldFM2U095Q0huODJGYW9qLzlJOFpXRHVKUklVN3VjNUdneHlLV2pkWC9r?=
 =?utf-8?B?RGdzdXRmd0VlNVFiR210bitMbGZTUTNWbWRqbkh5UVBGeVRWTGVvdEQ4M3ps?=
 =?utf-8?B?NURGQzk2K0JXNDFPeW5pWHJLbDdQU0t0Tjh5dWZ1Q0lFQ21XQVRtZE94TFVG?=
 =?utf-8?B?OXEyQzZaNG9oZ3lFZ2hiOW5tbW1wOVR3elljeVkyNkIvb1l5UUZtZ3lHcXk1?=
 =?utf-8?Q?+fxkq59h2oVkBqPXoCnmHauri4HwFkWsyP50HOM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU1pblRVQTdrdUNjNEVibkYxenRVNUZVN0pjQVpmWHM0V0J2QjFDYnJGc0VI?=
 =?utf-8?B?WkJFZTNUWk9sTk9CUERTbWcvV3ozVVEvRDl6YVR1dWVid1hhdTU2N2hiRnhu?=
 =?utf-8?B?WFBTZHJCMDI4WDd4aVljRk81ZGlibWJCb08vVmorVSt2emE0dUdDNCtzYTVW?=
 =?utf-8?B?WEc3ek0yQmVaRU4vTHFmd3Nrd3pjRjJZVFpjMHdESXFyeXY2SmFQSkpHcDRt?=
 =?utf-8?B?OWRnUWROOVRicTk0TTBoYmVleTEza0Z2aUdQY24xUzJJV2wwOTdPSTIzL0Ru?=
 =?utf-8?B?U1lLUzVUeWQ4SVhnRXRFcWJlOFM1bE10d1VqQVMyQUVZb2pnYk0zYlBQWFQ4?=
 =?utf-8?B?N1hoNTNFTWlDY1R0T0lZdEdNam5raVJ2bk5NY2tMcE1SclY1dDhTbGt2NnpV?=
 =?utf-8?B?THhUb2ZSR2RhY1kvNGphdWtBL016YTdnZXN6ZlEzZEJtSnBwQmNBWDltOHJm?=
 =?utf-8?B?VWtVQ2FIeHV0MFlBRktxRXp6YUgxdjZjSVhaMXJzcmFUZ3hSWVRuOWREaWtG?=
 =?utf-8?B?WVJNYy9PUmxTdTF1Q2tkdXNzU3dXVFd1TTFNcUJXbE9lSWtpRkxiYXNYT1VT?=
 =?utf-8?B?WUlHK1N6bm9yQm9DbmU1RUIyTXZtRys5cTIrZEx5UnVWRGgvdmFjVTE0UUZp?=
 =?utf-8?B?Z2RDQytPVi82RUI1Rk9nU1pUV09IRmhJV3NLVFRzTTlRRHQ0R25SS1cxOEZt?=
 =?utf-8?B?ejhDVDRKbDdlQnQ1MFhUWWIwWHVRTHdPcFh4UGZOZjFrR0UwMWJCWUNFU1Vv?=
 =?utf-8?B?MURrWEV0eXh1amRHaWpkMXdUb3d1RklJQ3NIWUtoTksxZGwvTVlSVVd2KzZi?=
 =?utf-8?B?TTZoWlNZWlFTMGZWbUJvZEExRGdjN0RoZUtNR1p1Uk5ZVzZtNXVKWUpzUEZH?=
 =?utf-8?B?RG56QVltRGZmU2FqTEg1SyswL1pIdWkyZHdnYjI5UXU3b1oyOHI4amp6cWRN?=
 =?utf-8?B?UmowaFYrdzFCTHN5cEk2UklWdzNNMmFXNnp2QjlyaTZxMVVjZVFwTXVYUlBN?=
 =?utf-8?B?c2JXRzlNenh2Qm1CNDNIQnZIME9oTDhhNU9pcHJ5cmYxcHowR3ZHNS92OGpL?=
 =?utf-8?B?RE05WXd2WTJVY1JwS2xJc0g1VVdrOThrdkptNnBlaGJtd0hpdlhvdmxqNnpN?=
 =?utf-8?B?dlRJN3psalFXTGpiSXdhcjMzcWVBcnN3TFlnSE11V2k5Vjc2SE9WR1lsQWpl?=
 =?utf-8?B?RkU1ejlYVHBMU2xpZVVsbkpHeGtOU2xLTE1iNzFMY0gwS1dvdjFpK2VHNzlL?=
 =?utf-8?B?dGJjRFM2WlJ2OU1hZ2czUnZJUUVBNHlYWUZiVGtVeldydzJ2d29MaExNMmMr?=
 =?utf-8?B?NEF0cU5iWENjTFhsVlVhbGxhMnFMREZ4eFZZZmF5Qkp1Zk4rVUFqV0EzZk1h?=
 =?utf-8?B?TUc5ek5mb1BSUVEzTUZUb1l2OWJCeFpNdTMyZWpNb2c0ZVVWN1ZiMGNLNi9v?=
 =?utf-8?B?cEtJRkVZSGxzb1ViNGhMVllqVUpjSkJ2VDZWZUR2YmcvL1hhdVJBa0RjelB3?=
 =?utf-8?B?QVQ0NEliNDdydHhueWpZaXlZQyszaEc0d2c2QjczUlZISUllMmVVa3hSb0NK?=
 =?utf-8?B?bDUvWVRQR1FWRVptZ1JlMjdkSk14MXFTRHpmYzliNlFTUlpjMWlrWXdVRUtK?=
 =?utf-8?B?T1F2b2ZwT2toZUJ3SXJtMVMzM09IajJkWjdrQlBSSFVURUdCbnFKcHl5T2pD?=
 =?utf-8?B?WFU3MEtJdXlFNjdWTkh0Q1NzU2N5NjUwa04zV1hPdTI5cXhJcFR4S0NqamxE?=
 =?utf-8?B?SVQwbjlCcEx4OEljYWx3MEp1UGE2U3hlazgzWmNTQW55WENNNUtpM1k0UmdP?=
 =?utf-8?B?QXUybWUzTVU2eGxteFM0Tkh1RHoyK3krTkJ4QWtZUVlrY3liZVVsY1ZOTkcw?=
 =?utf-8?B?eWVNQkt5QmNqRm1HTlhFOHdqVFVnWlNGTE5Hem80UmxqaU41dHdTMlRQYXg4?=
 =?utf-8?B?cFBvYjk0dXpSTy9DazVkU3VPTEx5cFRaYlFsRi96b0gzNllNTzNXU0s4QUsv?=
 =?utf-8?B?eDFYbzZaZkJwRmdYSWJYUmtYREpEdi9TaTd3Z3l4S2pPa2VFRnhGSVNJTHZI?=
 =?utf-8?B?cGJGbHpPbFV0NzdoTGVySjI3YnNsN2dQUk5WU0gyUStQVC96Zmh4cEJYdm9s?=
 =?utf-8?B?V2h5MDlIYVpyZmVTWmFmMXcrSThDaHBuMGVyRXlqQWRUWkZrVHpHUGFvejE5?=
 =?utf-8?Q?78KxNKmdFu8AGTtPR2tZGAM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccf2da1-2181-4d8f-d85f-08dc91827355
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:41:04.7871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p57DkfNcPcUQD1IaRN7GW8mwAenc2Y/9O9nAP/TvmKlW2+tOx3Z0NVAiQsm1oKrGBCB64mDXXdTyUPdFd34r5vK29nXEumkuFb6k3V4erUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

On Thu, Jun 20, 2024 at 01:00:47PM -0700, Ashutosh Dixit wrote:
>Add xe_perf_recorder. The recorder exercises the Xe OA uapi to capture OAG
>data in a specific format, similar to i915_perf_recorder.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tools/meson.build                         |    1 +
> tools/xe-perf/meson.build                 |    5 +
> tools/xe-perf/xe_perf_recorder.c          | 1227 +++++++++++++++++++++
> tools/xe-perf/xe_perf_recorder_commands.h |   31 +
> 4 files changed, 1264 insertions(+)
> create mode 100644 tools/xe-perf/meson.build
> create mode 100644 tools/xe-perf/xe_perf_recorder.c
> create mode 100644 tools/xe-perf/xe_perf_recorder_commands.h
>
>diff --git a/tools/meson.build b/tools/meson.build
>index 1656355eef..c02c020d0b 100644
>--- a/tools/meson.build
>+++ b/tools/meson.build
>@@ -113,4 +113,5 @@ if libudev.found()
> endif
>
> subdir('i915-perf')
>+subdir('xe-perf')
> subdir('null_state_gen')
>diff --git a/tools/xe-perf/meson.build b/tools/xe-perf/meson.build
>new file mode 100644
>index 0000000000..a5f59a67fe
>--- /dev/null
>+++ b/tools/xe-perf/meson.build
>@@ -0,0 +1,5 @@
>+executable('xe-perf-recorder',
>+           [ 'xe_perf_recorder.c' ],
>+           include_directories: inc,
>+           dependencies: [lib_igt, lib_igt_xe_oa],
>+           install: true)
>diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
>new file mode 100644
>index 0000000000..bd2d645fa1
>--- /dev/null
>+++ b/tools/xe-perf/xe_perf_recorder.c
>@@ -0,0 +1,1227 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <assert.h>
>+#include <dirent.h>
>+#include <errno.h>
>+#include <fcntl.h>
>+#include <getopt.h>
>+#include <inttypes.h>
>+#include <limits.h>
>+#include <poll.h>
>+#include <signal.h>
>+#include <stdbool.h>
>+#include <stdint.h>
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <string.h>
>+#include <sys/ioctl.h>
>+#include <sys/stat.h>
>+#include <sys/sysmacros.h>
>+#include <sys/time.h>
>+#include <sys/types.h>
>+#include <time.h>
>+#include <unistd.h>
>+
>+#include "igt_core.h"
>+#include "intel_chipset.h"
>+#include "ioctl_wrappers.h"
>+#include "linux_scaffold.h"
>+#include "xe/xe_oa.h"
>+#include "xe/xe_oa_data.h"
>+#include "xe/xe_query.h"
>+
>+#include "xe_perf_recorder_commands.h"
>+
>+#define ALIGN(v, a) (((v) + (a)-1) & ~((a)-1))
>+#define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
>+#define MAX(a,b) ((a) > (b) ? (a) : (b))
>+#define MIN(a,b) ((a) < (b) ? (a) : (b))
>+
>+struct circular_buffer {
>+	char   *data;
>+	size_t  allocated_size;
>+	size_t  size;
>+	size_t  beginpos;
>+	size_t  endpos;
>+};
>+
>+struct chunk {
>+	char *data;
>+	size_t len;
>+};
>+
>+static size_t
>+circular_available_size(const struct circular_buffer *buffer)
>+{
>+	assert(buffer->size <= buffer->allocated_size);
>+	return buffer->allocated_size - buffer->size;
>+}
>+
>+static void
>+get_chunks(struct chunk *chunks, struct circular_buffer *buffer, bool write, size_t len)
>+{
>+	size_t offset = write ? buffer->endpos : buffer->beginpos;
>+
>+	if (write)
>+		assert(circular_available_size(buffer) >= len);
>+	else
>+		assert(buffer->size >= len);
>+
>+	chunks[0].data = &buffer->data[offset];
>+
>+	if ((offset + len) > buffer->allocated_size) {
>+		chunks[0].len = buffer->allocated_size - offset;
>+		chunks[1].data = buffer->data;
>+		chunks[1].len = len - (buffer->allocated_size - offset);
>+	} else {
>+		chunks[0].len = len;
>+		chunks[1].data = NULL;
>+		chunks[1].len = 0;
>+	}
>+}
>+
>+static ssize_t
>+circular_buffer_read(void *c, char *buf, size_t size)
>+{
>+	struct circular_buffer *buffer = c;
>+	struct chunk chunks[2];
>+
>+	if (buffer->size < size)
>+		return -1;
>+
>+	get_chunks(chunks, buffer, false, size);
>+
>+	memcpy(buf, chunks[0].data, chunks[0].len);
>+	memcpy(buf + chunks[0].len, chunks[1].data, chunks[1].len);
>+	buffer->beginpos = (buffer->beginpos + size) % buffer->allocated_size;
>+	buffer->size -= size;
>+
>+	return size;
>+}
>+
>+static size_t
>+peek_item_size(struct circular_buffer *buffer)
>+{
>+	struct intel_xe_perf_record_header header;
>+	struct chunk chunks[2];
>+
>+	if (!buffer->size)
>+		return 0;
>+
>+	assert(buffer->size >= sizeof(header));
>+
>+	get_chunks(chunks, buffer, false, sizeof(header));
>+	memcpy(&header, chunks[0].data, chunks[0].len);
>+	memcpy((char *) &header + chunks[0].len, chunks[1].data, chunks[1].len);
>+
>+	return header.size;
>+}
>+
>+static void
>+circular_shrink(struct circular_buffer *buffer, size_t size)
>+{
>+	size_t shrank = 0, item_size;
>+
>+	assert(size <= buffer->allocated_size);
>+
>+	while (shrank < size && buffer->size > (item_size = peek_item_size(buffer))) {
>+		assert(item_size > 0 && item_size <= buffer->allocated_size);
>+
>+		buffer->beginpos = (buffer->beginpos + item_size) % buffer->allocated_size;
>+		buffer->size -= item_size;
>+
>+		shrank += item_size;
>+	}
>+}
>+
>+static ssize_t
>+circular_buffer_write(void *c, const char *buf, size_t _size)
>+{
>+	struct circular_buffer *buffer = c;
>+	size_t size = _size;
>+
>+	while (size) {
>+		size_t avail = circular_available_size(buffer), item_size;
>+		struct chunk chunks[2];
>+
>+		/* Make space in the buffer if there is too much data. */
>+		if (avail < size)
>+			circular_shrink(buffer, size - avail);
>+
>+		item_size = MIN(circular_available_size(buffer), size);
>+
>+		get_chunks(chunks, buffer, true, item_size);
>+
>+		memcpy(chunks[0].data, buf, chunks[0].len);
>+		memcpy(chunks[1].data, buf + chunks[0].len, chunks[1].len);
>+
>+		buf += item_size;
>+		size -= item_size;
>+
>+		buffer->endpos = (buffer->endpos + item_size) % buffer->allocated_size;
>+		buffer->size += item_size;
>+	}
>+
>+	return _size;
>+}
>+
>+static int
>+circular_buffer_seek(void *c, off64_t *offset, int whence)
>+{
>+	return -1;
>+}
>+
>+static int
>+circular_buffer_close(void *c)
>+{
>+	return 0;
>+}
>+
>+cookie_io_functions_t circular_buffer_functions = {
>+	.read  = circular_buffer_read,
>+	.write = circular_buffer_write,
>+	.seek  = circular_buffer_seek,
>+	.close = circular_buffer_close,
>+};
>+
>+
>+static bool
>+read_file_uint64(const char *file, uint64_t *value)
>+{
>+	char buf[32];
>+	int fd, n;
>+
>+	fd = open(file, 0);
>+	if (fd < 0)
>+		return false;
>+	n = read(fd, buf, sizeof (buf) - 1);
>+	close(fd);
>+	if (n < 0)
>+		return false;
>+
>+	buf[n] = '\0';
>+	*value = strtoull(buf, 0, 0);
>+
>+	return true;
>+}
>+
>+static uint32_t
>+read_device_param(const char *stem, int id, const char *param)
>+{
>+	char *name;
>+	int ret = asprintf(&name, "/sys/class/drm/%s%u/device/%s", stem, id, param);
>+	uint64_t value;
>+	bool success;
>+
>+	assert(ret != -1);
>+
>+	success = read_file_uint64(name, &value);
>+	free(name);
>+
>+	return success ? value : 0;
>+}
>+
>+static int
>+find_intel_render_node(void)
>+{
>+	for (int i = 128; i < (128 + 16); i++) {
>+		if (read_device_param("renderD", i, "vendor") == 0x8086)
>+			return i;
>+	}
>+
>+	return -1;
>+}
>+
>+static void
>+print_intel_devices(void)
>+{
>+	fprintf(stdout, "Available devices:\n");
>+	for (int i = 0; i < 128; i++) {
>+		if (read_device_param("card", i, "vendor") == 0x8086) {
>+			uint32_t devid = read_device_param("card", i, "device");
>+			const struct intel_device_info *devinfo =
>+				intel_get_device_info(devid);
>+			fprintf(stdout, "   %i: %s (0x%04hx)\n", i,
>+				devinfo ? devinfo->codename : "unknwon",
>+				devid);
>+		}
>+	}
>+}
>+
>+static int
>+open_render_node(uint32_t *devid, int card)
>+{
>+	char *name;
>+	int ret;
>+	int fd;
>+	int render;
>+
>+	if (card < 0) {
>+		render = find_intel_render_node();
>+		if (render < 0)
>+			return -1;
>+	} else {
>+		render = 128 + card;
>+	}
>+
>+	ret = asprintf(&name, "/dev/dri/renderD%u", render);
>+	assert(ret != -1);
>+
>+	*devid = read_device_param("renderD", render, "device");
>+
>+	fd = open(name, O_RDWR);
>+	free(name);
>+
>+	return fd;
>+}
>+
>+static uint32_t
>+oa_exponent_for_period(uint64_t device_timestamp_frequency, double period)
>+{
>+	uint64_t period_ns = 1000 * 1000 * 1000 * period;
>+	uint64_t device_periods[32];
>+
>+	for (uint32_t i = 0; i < ARRAY_SIZE(device_periods); i++)
>+		device_periods[i] = 1000000000ull * (1u << i) / device_timestamp_frequency;
>+
>+	for (uint32_t i = 1; i < ARRAY_SIZE(device_periods); i++) {
>+		if (period_ns >= device_periods[i - 1] &&
>+		    period_ns < device_periods[i]) {
>+			if ((device_periods[i] - period_ns) >
>+			    (period_ns - device_periods[i - 1]))
>+				return i - 1;
>+			return i;
>+		}
>+	}
>+
>+	return -1;
>+}
>+
>+static int
>+perf_ioctl(int fd, unsigned long request, void *arg)
>+{
>+	int ret;
>+
>+	do {
>+		ret = ioctl(fd, request, arg);
>+	} while (ret == -1 && (errno == EINTR || errno == EAGAIN));
>+
>+	return ret;
>+}
>+
>+static uint64_t
>+get_device_cs_timestamp_frequency(int drm_fd)
>+{
>+	return xe_gt_list(drm_fd)->gt_list[0].reference_clock;
>+}
>+
>+static uint64_t
>+get_device_oa_timestamp_frequency(int drm_fd)
>+{
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>+	struct drm_xe_oa_unit *oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
>+
>+	return oau->oa_timestamp_freq;
>+}
>+
>+struct recording_context {
>+	int drm_fd;
>+	int perf_fd;
>+
>+	uint32_t devid;
>+	uint64_t oa_timestamp_frequency;
>+	uint64_t cs_timestamp_frequency;
>+
>+	const struct intel_device_info *devinfo;
>+
>+	struct intel_xe_topology_info *topology;
>+	uint32_t topology_size;
>+
>+	struct intel_xe_perf *perf;
>+	struct intel_xe_perf_metric_set *metric_set;
>+
>+	uint32_t oa_exponent;
>+
>+	struct circular_buffer circular_buffer;
>+	FILE *output_stream;
>+
>+	const char *command_fifo;
>+	int command_fifo_fd;
>+
>+	int gt;
>+	struct drm_xe_engine_class_instance eci;
>+	struct drm_xe_engine_class_instance *hwe;
>+	struct drm_xe_oa_unit *oa_unit;
>+};
>+
>+static void set_fd_flags(int fd, int flags)
>+{
>+	int old = fcntl(fd, F_GETFL, 0);
>+
>+	igt_assert_lte(0, old);
>+	igt_assert_eq(0, fcntl(fd, F_SETFL, old | flags));
>+}
>+
>+enum xe_oa_report_header {
>+	HDR_32_BIT = 0,
>+	HDR_64_BIT,
>+};
>+
>+struct xe_oa_format {
>+	uint32_t counter_select;
>+	int size;
>+	int oa_type;
>+	enum xe_oa_report_header header;
>+	uint16_t counter_size;
>+	uint16_t bc_report;
>+};
>+
>+#define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>+
>+static const struct xe_oa_format oa_formats[] = {
>+	[XE_OA_FORMAT_C4_B8]			= { 7, 64,  DRM_FMT(OAG) },
>+	[XE_OA_FORMAT_A12]			= { 0, 64,  DRM_FMT(OAG) },
>+	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128, DRM_FMT(OAG) },
>+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAG) },
>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAR) },
>+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256, DRM_FMT(OAG) },
>+	[XE_OAC_FORMAT_A24u64_B8_C8]		= { 1, 320, DRM_FMT(OAC), HDR_64_BIT },
>+	[XE_OAC_FORMAT_A22u32_R2u32_B8_C8]	= { 2, 192, DRM_FMT(OAC), HDR_64_BIT },
>+	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, DRM_FMT(OAM_MPEC), HDR_64_BIT },
>+	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, DRM_FMT(OAM_MPEC), HDR_64_BIT },
>+	[XE_OA_FORMAT_PEC64u64]			= { 1, 576, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+	[XE_OA_FORMAT_PEC64u64_B8_C8]		= { 1, 640, DRM_FMT(PEC), HDR_64_BIT, 1, 1 },
>+	[XE_OA_FORMAT_PEC64u32]			= { 1, 320, DRM_FMT(PEC), HDR_64_BIT },
>+	[XE_OA_FORMAT_PEC32u64_G1]		= { 5, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+	[XE_OA_FORMAT_PEC32u32_G1]		= { 5, 192, DRM_FMT(PEC), HDR_64_BIT },
>+	[XE_OA_FORMAT_PEC32u64_G2]		= { 6, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+	[XE_OA_FORMAT_PEC32u32_G2]		= { 6, 192, DRM_FMT(PEC), HDR_64_BIT },
>+	[XE_OA_FORMAT_PEC36u64_G1_32_G2_4]	= { 3, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+};
>+
>+static uint64_t oa_format_fields(uint64_t name)
>+{
>+#define FIELD_PREP_ULL(_mask, _val) \
>+	(((_val) << (__builtin_ffsll(_mask) - 1)) & (_mask))
>+
>+	struct xe_oa_format f = oa_formats[name];
>+
>+	/* 0 format name is invalid */
>+	if (!name)
>+		memset(&f, 0xff, sizeof(f));
>+
>+	return FIELD_PREP_ULL(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, (u64)f.oa_type) |
>+		FIELD_PREP_ULL(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, (u64)f.counter_select) |
>+		FIELD_PREP_ULL(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, (u64)f.counter_size) |
>+		FIELD_PREP_ULL(DRM_XE_OA_FORMAT_MASK_BC_REPORT, (u64)f.bc_report);
>+#undef FIELD_PREP_ULL
>+}
>+#define __ff oa_format_fields
>+
>+static int
>+perf_open(struct recording_context *ctx)
>+{
>+	int stream_fd;
>+
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, ctx->oa_unit->oa_unit_id,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, ctx->metric_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(ctx->metric_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, ctx->oa_exponent,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+
>+	stream_fd = intel_xe_perf_ioctl(ctx->drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param);
>+	if (stream_fd < 0) {
>+		errno = 0;
>+		goto exit;
>+	}
>+
>+	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
>+exit:
>+	return stream_fd;
>+}
>+
>+static bool quit = false;
>+
>+static void
>+sigint_handler(int val)
>+{
>+	quit = true;
>+}
>+
>+static bool
>+write_version(FILE *output, struct recording_context *ctx)
>+{
>+	struct intel_xe_perf_record_version version = {
>+		.version = INTEL_XE_PERF_RECORD_VERSION,
>+	};
>+	struct intel_xe_perf_record_header header = {
>+		.type = INTEL_XE_PERF_RECORD_TYPE_VERSION,
>+		.size = sizeof(header) + sizeof(version),
>+	};
>+
>+	if (fwrite(&header, sizeof(header), 1, output) != 1)
>+		return false;
>+
>+	if (fwrite(&version, sizeof(version), 1, output) != 1)
>+		return false;
>+
>+	return true;
>+}
>+
>+static bool
>+write_header(FILE *output, struct recording_context *ctx)
>+{
>+	struct intel_xe_perf_record_device_info info = {
>+		.timestamp_frequency = ctx->oa_timestamp_frequency,
>+		.device_id = ctx->perf->devinfo.devid,
>+		.device_revision = ctx->perf->devinfo.revision,
>+		.gt_min_frequency = ctx->perf->devinfo.gt_min_freq,
>+		.gt_max_frequency = ctx->perf->devinfo.gt_max_freq,
>+		.oa_format = ctx->metric_set->perf_oa_format,
>+		.engine_class = ctx->hwe->engine_class,
>+		.engine_instance = ctx->hwe->engine_instance,
>+	};
>+	struct intel_xe_perf_record_header header = {
>+		.type = INTEL_XE_PERF_RECORD_TYPE_DEVICE_INFO,
>+		.size = sizeof(header) + sizeof(info),
>+	};
>+
>+	snprintf(info.metric_set_name, sizeof(info.metric_set_name),
>+		 "%s", ctx->metric_set->symbol_name);
>+	snprintf(info.metric_set_uuid, sizeof(info.metric_set_uuid),
>+		 "%s", ctx->metric_set->hw_config_guid);
>+
>+	if (fwrite(&header, sizeof(header), 1, output) != 1)
>+		return false;
>+
>+	if (fwrite(&info, sizeof(info), 1, output) != 1)
>+		return false;
>+
>+	return true;
>+}
>+
>+static struct intel_xe_topology_info *get_topology(struct recording_context *ctx)
>+{
>+	return xe_fill_topology_info(ctx->drm_fd, ctx->devid, &ctx->topology_size);
>+}
>+
>+static bool
>+write_topology(FILE *output, struct recording_context *ctx)
>+{
>+	struct intel_xe_perf_record_header header = {
>+		.type = INTEL_XE_PERF_RECORD_TYPE_DEVICE_TOPOLOGY,
>+	};
>+
>+	header.size = sizeof(header) + ctx->topology_size;
>+	if (fwrite(&header, sizeof(header), 1, output) != 1)
>+		return false;
>+
>+	if (fwrite(ctx->topology, ctx->topology_size, 1, output) != 1)
>+		return false;
>+
>+	return true;
>+}
>+
>+static int get_stream_status(int perf_fd, u32 *oa_status)
>+{
>+	struct drm_xe_oa_stream_status status;
>+	int ret;
>+
>+	ret = perf_ioctl(perf_fd, DRM_XE_PERF_IOCTL_STATUS, &status);
>+	if (ret)
>+		return ret;
>+
>+	*oa_status = status.oa_status;
>+	return 0;
>+}
>+
>+static bool write_stream_status(struct recording_context *ctx, FILE *output)
>+{
>+	u32 oa_status;
>+
>+	if (!get_stream_status(ctx->perf_fd, &oa_status)) {
>+		struct intel_xe_perf_record_header header = { .size = sizeof(header) };
>+
>+		if (oa_status & DRM_XE_OASTATUS_REPORT_LOST)
>+			header.type = INTEL_XE_PERF_RECORD_OA_TYPE_REPORT_LOST;
>+		else if (oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW)
>+			header.type = INTEL_XE_PERF_RECORD_OA_TYPE_BUFFER_LOST;
>+		else
>+			return true;
>+
>+		if (fwrite(&header, sizeof(header), 1, output) != 1)
>+			return false;
>+	}
>+
>+	return true;
>+}
>+
>+static bool write_stream_data(struct recording_context *ctx,
>+			      char *data, ssize_t size, FILE *output)
>+{
>+	ssize_t format_size = oa_formats[ctx->metric_set->perf_oa_format].size;
>+
>+	assert(!(size % format_size));
>+
>+	for (int i = 0; i < size / format_size; i++) {
>+		struct intel_xe_perf_record_header header = {
>+			.type = INTEL_XE_PERF_RECORD_TYPE_SAMPLE,
>+			.size = sizeof(header) + format_size,
>+		};
>+
>+		if (fwrite(&header, sizeof(header), 1, output) != 1)
>+			return false;
>+
>+		if (fwrite(data, format_size, 1, output) != 1)
>+			return false;
>+	}
>+
>+	return true;
>+}
>+
>+static bool write_perf_data(FILE *output, struct recording_context *ctx)
>+{
>+	char data[4096];
>+	ssize_t len;
>+	bool ret;
>+
>+	while (1) {
>+		len = read(ctx->perf_fd, data, sizeof(data));
>+
>+		if (len < 0) {
>+			switch (errno) {
>+			case EIO:
>+				ret = write_stream_status(ctx, output);
>+				if (!ret)
>+					return ret;
>+				break;
>+			case EAGAIN:
>+			case EINTR:
>+				return true;
>+			default:
>+				/* Not expecting -EFAULT, -ENOSPC, -EINVAL */
>+				assert(0);
>+			}
>+		} else {
>+			ret = write_stream_data(ctx, data, len, output);
>+			if (!ret)
>+				return ret;
>+		}
>+	}
>+
>+	/* Should not reach here */
>+	return false;
>+}
>+
>+static clock_t correlation_clock_id = CLOCK_MONOTONIC;
>+
>+static const char *
>+get_correlation_clock_name(clock_t clock_id)
>+{
>+	switch (clock_id) {
>+	case CLOCK_BOOTTIME:      return "bootime";
>+	case CLOCK_MONOTONIC:     return "monotonic";
>+	case CLOCK_MONOTONIC_RAW: return "monotonic_raw";
>+	default:                  return "*unknown*";
>+	}
>+}
>+
>+static int query_engine_cycles(int fd, struct drm_xe_query_engine_cycles *ts)
>+{
>+	struct drm_xe_device_query query = {
>+		.extensions = 0,
>+		.query = DRM_XE_DEVICE_QUERY_ENGINE_CYCLES,
>+		.size = sizeof(*ts),
>+		.data = (uintptr_t)ts,
>+	};
>+
>+	return perf_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
>+}
>+
>+static bool get_correlation_timestamps(struct recording_context *ctx,
>+				       struct intel_xe_perf_record_timestamp_correlation *corr)
>+{
>+	struct drm_xe_query_engine_cycles ts = {};
>+
>+	ts.eci = *ctx->hwe;
>+	ts.clockid = correlation_clock_id;
>+
>+	if (query_engine_cycles(ctx->drm_fd, &ts))
>+		return false;
>+
>+	corr->cpu_timestamp = ts.cpu_timestamp + ts.cpu_delta / 2;
>+	corr->gpu_timestamp = ts.engine_cycles;
>+
>+	return true;
>+}
>+
>+static bool
>+write_saved_correlation_timestamps(FILE *output,
>+				   const struct intel_xe_perf_record_timestamp_correlation *corr)
>+{
>+	struct intel_xe_perf_record_header header = {
>+		.type = INTEL_XE_PERF_RECORD_TYPE_TIMESTAMP_CORRELATION,
>+		.size = sizeof(header) + sizeof(*corr),
>+	};
>+
>+	if (fwrite(&header, sizeof(header), 1, output) != 1)
>+		return false;
>+
>+	if (fwrite(corr, sizeof(*corr), 1, output) != 1)
>+		return false;
>+
>+	return true;
>+}
>+
>+static bool
>+write_correlation_timestamps(struct recording_context *ctx, FILE *output)
>+{
>+	struct intel_xe_perf_record_timestamp_correlation corr;
>+
>+	if (!get_correlation_timestamps(ctx, &corr))
>+		return false;
>+
>+	return write_saved_correlation_timestamps(output, &corr);
>+}
>+
>+static void
>+read_command_file(struct recording_context *ctx)
>+{
>+	struct recorder_command_base header;
>+	ssize_t ret = read(ctx->command_fifo_fd, &header, sizeof(header));
>+
>+	if (ret < 0)
>+		return;
>+
>+	switch (header.command) {
>+	case RECORDER_COMMAND_DUMP: {
>+		uint32_t len = header.size - sizeof(header), offset = 0;
>+		uint8_t *dump = malloc(len);
>+		FILE *file;
>+
>+		while (offset < len &&
>+		       ((ret = read(ctx->command_fifo_fd,
>+				    (void *) dump + offset, len - offset)) > 0
>+			|| errno == EAGAIN)) {
>+			if (ret > 0)
>+				offset += ret;
>+		}
>+
>+		fprintf(stdout, "Writing circular buffer to %s\n", dump);
>+
>+		file = fopen((const char *) dump, "w+");
>+		if (file) {
>+			struct chunk chunks[2];
>+
>+			fflush(ctx->output_stream);
>+			get_chunks(chunks, &ctx->circular_buffer,
>+				   false, ctx->circular_buffer.size);
>+
>+			if (!write_version(file, ctx) ||
>+			    !write_header(file, ctx) ||
>+			    !write_topology(file, ctx) ||
>+			    fwrite(chunks[0].data, chunks[0].len, 1, file) != 1 ||
>+			    (chunks[1].len > 0 &&
>+			     fwrite(chunks[1].data, chunks[1].len, 1, file) != 1) ||
>+			    !write_correlation_timestamps(ctx, file)) {
>+				fprintf(stderr, "Unable to write circular buffer data in file '%s'\n",
>+					dump);
>+			}
>+			fclose(file);
>+		} else
>+			fprintf(stderr, "Unable to write dump file '%s'\n", dump);
>+
>+		free(dump);
>+		break;
>+	}
>+	case RECORDER_COMMAND_QUIT:
>+		quit = true;
>+		break;
>+	default:
>+		fprintf(stderr, "Unknown command 0x%x\n", header.command);
>+		break;
>+	}
>+}
>+
>+static void
>+print_metric_sets(const struct intel_xe_perf *perf)
>+{
>+	struct intel_xe_perf_metric_set *metric_set;
>+	uint32_t longest_name = 0;
>+
>+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
>+		longest_name = MAX(longest_name, strlen(metric_set->symbol_name));
>+	}
>+
>+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
>+		fprintf(stdout, "%s:%*s%s\n",
>+			metric_set->symbol_name,
>+			(int) (longest_name - strlen(metric_set->symbol_name) + 1), " ",
>+			metric_set->name);
>+	}
>+}
>+
>+static void
>+print_metric_set_counters(const struct intel_xe_perf_metric_set *metric_set)
>+{
>+	uint32_t longest_name = 0;
>+
>+	for (uint32_t i = 0; i < metric_set->n_counters; i++) {
>+		longest_name = MAX(longest_name, strlen(metric_set->counters[i].name));
>+	}
>+
>+	fprintf(stdout, "%s (%s):\n", metric_set->symbol_name, metric_set->name);
>+	for (uint32_t i = 0; i < metric_set->n_counters; i++) {
>+		struct intel_xe_perf_logical_counter *counter = &metric_set->counters[i];
>+
>+		fprintf(stdout, "  %s:%*s%s\n",
>+			counter->name,
>+			(int)(longest_name - strlen(counter->name) + 1), " ",
>+			counter->desc);
>+	}
>+}
>+
>+static void
>+print_metric_sets_counters(struct intel_xe_perf *perf)
>+{
>+	struct intel_xe_perf_metric_set *metric_set;
>+
>+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link)
>+		print_metric_set_counters(metric_set);
>+}
>+
>+static void
>+usage(const char *name)
>+{
>+	fprintf(stdout,
>+		"Usage: %s [options]\n"
>+		"Recording tool for xe-oa\n"
>+		"\n"
>+		"     --help,               -h          Print this screen\n"
>+		"     --device,             -d <value>  Device to use\n"
>+		"                                       (value=list to list devices\n"
>+		"                                        value=1 to use /dev/dri/card1)\n"
>+		"     --correlation-period, -c <value>  Time period of timestamp correlation in seconds\n"
>+		"                                       (default = 1.0)\n"
>+		"     --perf-period,        -p <value>  Time period of xe-oa reports in seconds\n"
>+		"                                       (default = 0.001)\n"
>+		"     --metric,             -m <value>  xe-oa metric to sample with (use value=list to list all metrics)\n"
>+		"     --counters,           -C          List counters for a given metric and exit\n"
>+		"     --size,               -s <value>  Size of circular buffer to use in kilobytes\n"
>+		"                                       If specified, a maximum amount of <value> data will\n"
>+		"                                       be recorded.\n"
>+		"     --command-fifo,       -f <path>   Path to a command fifo, implies circular buffer\n"
>+		"                                       (To use with xe-perf-control)\n"
>+		"     --output,             -o <path>   Output file (default = xe_perf.record)\n"
>+		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
>+		"                                       Values: boot, mono, mono_raw (default = mono)\n"
>+		"     --engine-class        -e <value>  Engine class used for the OA capture.\n"
>+		"     --engine-instance     -i <value>  Engine instance used for the OA capture.\n",
>+		name);
>+}
>+
>+static void
>+teardown_recording_context(struct recording_context *ctx)
>+{
>+	if (ctx->topology)
>+		free(ctx->topology);
>+
>+	if (ctx->perf)
>+		intel_xe_perf_free(ctx->perf);
>+
>+	if (ctx->command_fifo)
>+		unlink(ctx->command_fifo);
>+	if (ctx->command_fifo_fd != -1)
>+		close(ctx->command_fifo_fd);
>+
>+	if (ctx->output_stream)
>+		fclose(ctx->output_stream);
>+
>+	free(ctx->circular_buffer.data);
>+
>+	if (ctx->perf_fd != -1)
>+		close(ctx->perf_fd);
>+	if (ctx->drm_fd != -1)
>+		close(ctx->drm_fd);
>+}
>+
>+static int assign_oa_unit(int fd, struct recording_context *ctx)
>+{
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>+	struct drm_xe_oa_unit *oau;
>+	uint8_t *poau;
>+
>+	poau = (uint8_t *)&qoa->oa_units[0];
>+	for (int i = 0; i < qoa->num_oa_units; i++) {
>+		oau = (struct drm_xe_oa_unit *)poau;
>+
>+		for (int j = 0; j < oau->num_engines; j++) {
>+			if (oau->eci[j].engine_class == ctx->eci.engine_class &&
>+			    oau->eci[j].engine_instance == ctx->eci.engine_instance) {
>+				ctx->hwe = &oau->eci[j];
>+				ctx->oa_unit = oau;
>+				return 0;
>+			}
>+		}
>+
>+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>+	}
>+
>+	return -1;
>+}
>+
>+int
>+main(int argc, char *argv[])
>+{
>+	const struct option long_options[] = {
>+		{"help",		no_argument, 0, 'h'},
>+		{"device",		required_argument, 0, 'd'},
>+		{"correlation-period",	required_argument, 0, 'c'},
>+		{"perf-period",		required_argument, 0, 'p'},
>+		{"metric",		required_argument, 0, 'm'},
>+		{"counters",		no_argument, 0, 'C'},
>+		{"output",		required_argument, 0, 'o'},
>+		{"size",		required_argument, 0, 's'},
>+		{"command-fifo",	required_argument, 0, 'f'},
>+		{"cpu-clock",		required_argument, 0, 'k'},
>+		{"engine-class",	required_argument, 0, 'e'},
>+		{"engine-instance",	required_argument, 0, 'i'},
>+		{0, 0, 0, 0}
>+	};
>+	const struct {
>+		clock_t id;
>+		const char *name;
>+	} clock_names[] = {
>+		{ CLOCK_BOOTTIME,	"boot" },
>+		{ CLOCK_MONOTONIC,	"mono" },
>+		{ CLOCK_MONOTONIC_RAW,	"mono_raw" },
>+	};
>+	double corr_period = 1.0, perf_period = 0.001;
>+	const char *metric_name = NULL, *output_file = "xe_perf.record";
>+	struct intel_xe_perf_metric_set *metric_set;
>+	struct intel_xe_perf_record_timestamp_correlation initial_correlation;
>+	struct timespec now;
>+	uint64_t corr_period_ns, poll_time_ns;
>+	uint32_t circular_size = 0;
>+	int opt, dev_node_id = -1;
>+	bool list_counters = false;
>+	FILE *output = NULL;
>+	struct recording_context ctx = {
>+		.drm_fd = -1,
>+		.perf_fd = -1,
>+
>+		.command_fifo = XE_PERF_RECORD_FIFO_PATH,
>+		.command_fifo_fd = -1,
>+
>+		.eci = { DRM_XE_ENGINE_CLASS_RENDER, 0 },
>+	};
>+
>+	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:e:i:", long_options, NULL)) != -1) {
>+		switch (opt) {
>+		case 'h':
>+			usage(argv[0]);
>+			return EXIT_SUCCESS;
>+		case 'c':
>+			corr_period = atof(optarg);
>+			break;
>+		case 'd':
>+			if (!strcmp(optarg, "list"))
>+				dev_node_id = -2;
>+			else
>+				dev_node_id = atoi(optarg);
>+			break;
>+		case 'p':
>+			perf_period = atof(optarg);
>+			break;
>+		case 'm':
>+			metric_name = optarg;
>+			break;
>+		case 'C':
>+			list_counters = true;
>+			break;
>+		case 'o':
>+			output_file = optarg;
>+			break;
>+		case 's':
>+			circular_size = MAX(8, atoi(optarg)) * 1024;
>+			break;
>+		case 'f':
>+			ctx.command_fifo = optarg;
>+			circular_size = 8 * 1024 * 1024;
>+			break;
>+		case 'k': {
>+			bool found = false;
>+			for (uint32_t i = 0; i < ARRAY_SIZE(clock_names); i++) {
>+				if (!strcmp(clock_names[i].name, optarg)) {
>+					correlation_clock_id = clock_names[i].id;
>+					found = true;
>+					break;
>+				}
>+			}
>+			if (!found) {
>+				fprintf(stderr, "Unknown clock name '%s'\n", optarg);
>+				return EXIT_FAILURE;
>+			}
>+			break;
>+		}
>+		case 'e':
>+			ctx.eci.engine_class = atoi(optarg);
>+			break;
>+		case 'i':
>+			ctx.eci.engine_instance = atoi(optarg);
>+			break;
>+		default:
>+			fprintf(stderr, "Internal error: "
>+				"unexpected getopt value: %d\n", opt);
>+			usage(argv[0]);
>+			return EXIT_FAILURE;
>+		}
>+	}
>+
>+	if (dev_node_id == -2) {
>+		print_intel_devices();
>+		return EXIT_SUCCESS;
>+	}
>+
>+	ctx.drm_fd = open_render_node(&ctx.devid, dev_node_id);
>+	if (ctx.drm_fd < 0) {
>+		fprintf(stderr, "Unable to open device.\n");
>+		return EXIT_FAILURE;
>+	}
>+
>+	xe_device_get(ctx.drm_fd);
>+
>+	ctx.devinfo = intel_get_device_info(ctx.devid);
>+	if (!ctx.devinfo) {
>+		fprintf(stderr, "No device info found.\n");
>+		goto fail;
>+	}
>+
>+	if (assign_oa_unit(ctx.drm_fd, &ctx) < 0) {
>+		fprintf(stderr, "assign_oa_unit failed\n");
>+		goto fail;
>+	}
>+
>+	fprintf(stdout, "Device name=%s gen=%i id=0x%x oa_unit=%i gt=%i\n",
>+		ctx.devinfo->codename, ctx.devinfo->graphics_ver, ctx.devid,
>+		ctx.oa_unit->oa_unit_id, ctx.hwe->gt_id);
>+
>+	ctx.topology = get_topology(&ctx);
>+	if (!ctx.topology) {
>+		fprintf(stderr, "Unable to retrieve GPU topology\n");
>+		goto fail;
>+	}
>+
>+	ctx.perf = intel_xe_perf_for_fd(ctx.drm_fd, ctx.hwe->gt_id);
>+	if (!ctx.perf) {
>+		fprintf(stderr, "No perf data found.\n");
>+		goto fail;
>+	}
>+
>+	intel_xe_perf_load_perf_configs(ctx.perf, ctx.drm_fd);
>+
>+	if (metric_name) {
>+		if (!strcmp(metric_name, "list")) {
>+			print_metric_sets(ctx.perf);
>+			return EXIT_SUCCESS;
>+		}
>+
>+		igt_list_for_each_entry(metric_set, &ctx.perf->metric_sets, link) {
>+			if (!strcasecmp(metric_set->symbol_name, metric_name)) {
>+				ctx.metric_set = metric_set;
>+				break;
>+			}
>+		}
>+	}
>+
>+	if (list_counters) {
>+		if (!ctx.metric_set)
>+			print_metric_sets_counters(ctx.perf);
>+		else
>+			print_metric_set_counters(ctx.metric_set);
>+		teardown_recording_context(&ctx);
>+		return EXIT_SUCCESS;
>+	}
>+
>+	if (!ctx.metric_set) {
>+		if (!metric_name)
>+			fprintf(stderr, "No metric set specified.\n");
>+		else
>+			fprintf(stderr, "Unknown metric set '%s'.\n", metric_name);
>+		print_metric_sets(ctx.perf);
>+		goto fail;
>+	}
>+
>+	intel_xe_perf_load_perf_configs(ctx.perf, ctx.drm_fd);
>+
>+	ctx.oa_timestamp_frequency = get_device_oa_timestamp_frequency(ctx.drm_fd);
>+	ctx.cs_timestamp_frequency = get_device_cs_timestamp_frequency(ctx.drm_fd);
>+
>+	signal(SIGINT, sigint_handler);
>+
>+	if (ctx.command_fifo) {
>+		if (mkfifo(ctx.command_fifo,
>+			   S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH) != 0) {
>+			fprintf(stderr, "Unable to create command fifo '%s': %s\n",
>+				ctx.command_fifo, strerror(errno));
>+			goto fail;
>+		}
>+
>+		ctx.command_fifo_fd = open(ctx.command_fifo, O_RDWR);
>+		if (ctx.command_fifo_fd < 0) {
>+			fprintf(stderr, "Unable to open command fifo '%s': %s\n",
>+				ctx.command_fifo, strerror(errno));
>+			goto fail;
>+		}
>+	}
>+
>+	if (circular_size) {
>+		ctx.circular_buffer.allocated_size = circular_size;
>+		ctx.circular_buffer.data = malloc(circular_size);
>+		if (!ctx.circular_buffer.data) {
>+			fprintf(stderr, "Unable to allocate circular buffer\n");
>+			goto fail;
>+		}
>+
>+		ctx.output_stream = fopencookie(&ctx.circular_buffer, "w+",
>+						circular_buffer_functions);
>+		if (!ctx.output_stream) {
>+			fprintf(stderr, "Unable to create circular buffer\n");
>+			goto fail;
>+		}
>+
>+		if (!get_correlation_timestamps(&ctx, &initial_correlation)) {
>+			fprintf(stderr, "Unable to correlation timestamps\n");
>+			goto fail;
>+		}
>+
>+		write_correlation_timestamps(&ctx, ctx.output_stream);
>+		fprintf(stdout,
>+			"Recoding in internal circular buffer.\n"
>+			"Use xe-perf-control to snapshot into file.\n");
>+	} else {
>+		output = fopen(output_file, "w+");
>+		if (!output) {
>+			fprintf(stderr, "Unable to open output file '%s'\n",
>+				output_file);
>+			goto fail;
>+		}
>+
>+		if (!write_version(output, &ctx) ||
>+		    !write_header(output, &ctx) ||
>+		    !write_topology(output, &ctx) ||
>+		    !write_correlation_timestamps(&ctx, output)) {
>+			fprintf(stderr, "Unable to write header in file '%s'\n",
>+				output_file);
>+			goto fail;
>+		}
>+
>+		ctx.output_stream = output;
>+		fprintf(stdout, "Writing recoding to %s\n", output_file);
>+	}
>+
>+	if (ctx.metric_set->perf_oa_metrics_set == 0) {
>+		fprintf(stderr,
>+			"Unable to load performance configuration, consider running:\n"
>+			"   sysctl dev.xe.perf_stream_paranoid=0\n");
>+		goto fail;
>+	}
>+
>+	fprintf(stdout, "Using correlation clock: %s\n",
>+		get_correlation_clock_name(correlation_clock_id));
>+
>+	ctx.oa_exponent = oa_exponent_for_period(ctx.oa_timestamp_frequency, perf_period);
>+	fprintf(stdout, "Opening perf stream with metric_id=%"PRIu64" oa_exponent=%u oa_format=%u\n",
>+		ctx.metric_set->perf_oa_metrics_set, ctx.oa_exponent,
>+		ctx.metric_set->perf_oa_format);
>+
>+	ctx.perf_fd = perf_open(&ctx);
>+	if (ctx.perf_fd < 0) {
>+		fprintf(stderr, "Unable to open xe oa stream: %s\n",
>+			strerror(errno));
>+		goto fail;
>+	}
>+
>+	corr_period_ns = corr_period * 1000000000ul;
>+	poll_time_ns = corr_period_ns;
>+
>+	while (!quit) {
>+		struct pollfd pollfd[2] = {
>+			{         ctx.perf_fd, POLLIN, 0 },
>+			{ ctx.command_fifo_fd, POLLIN, 0 },
>+		};
>+		uint64_t elapsed_ns;
>+		int ret;
>+
>+		igt_gettime(&now);
>+		ret = poll(pollfd, ctx.command_fifo_fd != -1 ? 2 : 1, poll_time_ns / 1000000);
>+		if (ret < 0 && errno != EINTR) {
>+			fprintf(stderr, "Failed to poll xe-oa stream: %s\n",
>+				strerror(errno));
>+			break;
>+		}
>+
>+		if (ret > 0) {
>+			if (pollfd[0].revents & POLLIN) {
>+				if (!write_perf_data(ctx.output_stream, &ctx)) {
>+					fprintf(stderr, "Failed to write xe-oa data: %s\n",
>+						strerror(errno));
>+					break;
>+				}
>+			}
>+
>+			if (pollfd[1].revents & POLLIN) {
>+				read_command_file(&ctx);
>+			}
>+		}
>+
>+		elapsed_ns = igt_nsec_elapsed(&now);
>+		if (elapsed_ns > poll_time_ns) {
>+			poll_time_ns = corr_period_ns;
>+			if (!write_correlation_timestamps(&ctx, ctx.output_stream)) {
>+				fprintf(stderr,
>+					"Failed to write xe timestamp correlation data: %s\n",
>+					strerror(errno));
>+				break;
>+			}
>+		} else {
>+			poll_time_ns -= elapsed_ns;
>+		}
>+	}
>+
>+	fprintf(stdout, "Exiting...\n");
>+
>+	if (!write_perf_data(ctx.output_stream, &ctx)) {
>+		fprintf(stderr, "Failed to write xe-oa data: %s\n",
>+			strerror(errno));
>+	}
>+
>+	if (!write_correlation_timestamps(&ctx, ctx.output_stream)) {
>+		fprintf(stderr,
>+			"Failed to write final xe timestamp correlation data: %s\n",
>+			strerror(errno));
>+	}
>+
>+	teardown_recording_context(&ctx);
>+
>+	return EXIT_SUCCESS;
>+
>+ fail:
>+	teardown_recording_context(&ctx);
>+
>+	return EXIT_FAILURE;
>+}
>diff --git a/tools/xe-perf/xe_perf_recorder_commands.h b/tools/xe-perf/xe_perf_recorder_commands.h
>new file mode 100644
>index 0000000000..528813d2dc
>--- /dev/null
>+++ b/tools/xe-perf/xe_perf_recorder_commands.h
>@@ -0,0 +1,31 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef XE_PERF_RECORDER_COMMANDS_H
>+#define XE_PERF_RECORDER_COMMANDS_H
>+
>+#include <stdint.h>
>+
>+#define XE_PERF_RECORD_FIFO_PATH "/tmp/.xe-perf-record"
>+
>+enum recorder_command {
>+	RECORDER_COMMAND_DUMP = 1,
>+	RECORDER_COMMAND_QUIT,
>+};
>+
>+struct recorder_command_base {
>+	uint32_t command;
>+	uint32_t size; /* size of recorder_command_base + dump in bytes */
>+};
>+
>+/*
>+ The dump after the recorder_command_base header:
>+
>+struct recorder_command_dump {
>+	uint8_t path[0];
>+};
>+*/
>+
>+#endif
>-- 
>2.41.0
>

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021C0C2BA18
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 15:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8890A10E6F4;
	Tue, 18 Jun 2024 15:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKSVDZQf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6701710E6F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718725146; x=1750261146;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SycekAVFH4Qz499sPaY7zWXS5IiFxN1C+qqjeFe1Vsg=;
 b=TKSVDZQf624WAAj/KSi8dTtX/Is0RD0nSO7VV2ltZ66uZPjFeF64icJ6
 S2c+QILIQnSYeN+B7UeRFJulAAAF7/72pnrBrfAL5No70MEc6Rpuu5DFb
 z+qQzWLdSPgX7X57KXopleFP56sDkVBdxjlwCqxBKRAJ/LHT0TE/5vQKO
 0cwS9t09XB53HtPiuiv+bQJN/FCnEmsSaH13eFKzbXuiHOzwCJ0e0irR7
 2Dt/7l+zvKV83ywjGm6ZGBuUUA534cDMb6AJcpY6Z1LyaI8OISbMUuNCj
 yWJLK4mFk51q3DtPzwiqc9nIW1Ch3ke6O722yWbAYSL6QVa8RTefKb5s7 Q==;
X-CSE-ConnectionGUID: yvqx5aktT6CjZYyL0w5dcQ==
X-CSE-MsgGUID: E7W9mQI5TV2qZWyAaTr4+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15732568"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15732568"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 08:39:06 -0700
X-CSE-ConnectionGUID: aq8vI7ynTGaAe7FYz3zfZw==
X-CSE-MsgGUID: cu+iWe7dQx+fK1QP9FUebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46562625"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 08:39:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 08:39:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 08:39:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 08:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhiOjLk4/iI1Uawu6Oz68E2xh9E/KjdrxkCSW3I2eHkHVq8KZqx6wgSQ0u7IzmTGTm0amsrNkmJEQ+qCbkYgcEAWMVnsj7XovACZSbhuiqjr/ZzaHmS8QmAlAwhiGvHP41NyhS6BH1UMM63WivxCpEraCgVDr/KX+0pgrfquIDsXTnl9mwlqNr8i5To+TQ2qS/ByarBFqlv8t6KhDsmqCcOe3nJd6hfQ4v9Oseg4hUrfWHP5vNafqOUTW5eLNa/WNXAu41BwoxDDF5vUs+CGp4XM3DuP62Jk+rhfKPaqsXIyHJC9pZUCc/9ZZBnhLSB3QwprXtneALw54e6m5omvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPXWQEhxodk7krJWsmB1mlmIBnYRhILYs8wfnW6B8Ss=;
 b=gi0Y3ssMOz85wPOjGIOFEvHxiVV1R4GDZ/Y1RHRahapYx4TygjWw6pg9AY5+PmxhuRyFPdOpjjW8dWzBdwmPIYmU/INKd1e04WeBNLV0P2lPUoOkiha1X09eDnxKVVrVcZup3VHHTeJFAg7wNpKRHEKsyGW9kf+P4q0LKqDuZ/QYIX5V/MBKSFLyg13px5Fjk6NoPTNcdCV+Tqpr0GjEHm/2VwRyPiXbCxbYdkrio7MvsfMlzIpvB0JdJtNOHl+sGNgbvnScu5GdSuaTolZb5a0ftJLv5mlTipOMxh2AAxzy+2L8FGRgr0BU0Mce7Z2jjiHCMZ2ZMD214tk0Ji/c1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB6428.namprd11.prod.outlook.com (2603:10b6:510:1f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 15:38:57 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 15:38:56 +0000
Message-ID: <def098e4-4ac5-474f-93cb-5912050803f3@intel.com>
Date: Tue, 18 Jun 2024 21:08:42 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_start?=
 =?UTF-8?Q?ing_with_=5Bi-g-t=2CV2=2C1/2=5D_tests/kms=5Fvrr=3A_New_subtest_fo?=
 =?UTF-8?Q?r_CMRR_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>, <lgci.bug.filing@intel.com>,
 <tejasreex.illipilli@intel.com>
References: <20240607124840.3405928-1-bhanuprakash.modem@intel.com>
 <171871565688.103670.7978292811736456413@a6498e030952>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <171871565688.103670.7978292811736456413@a6498e030952>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0220.apcprd06.prod.outlook.com
 (2603:1096:4:68::28) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e1c534-875a-46a6-0e2b-08dc8facc403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RndvQjZBU3IwUjE5SE9LU0tHa3hTTHY2aXdZdStWVldicndEWm4zbDFLMThz?=
 =?utf-8?B?SlFGVGN1NUowOFo1UFIvN2ZSbS9DQU1BdEphcXZ3K0JWV1ZKRVpjNnE3T2hN?=
 =?utf-8?B?Si9mZXpYZEpiRDBKYlY4NUlxaHUrMHNPNHBEYnlHRThzWkdqSWxQbUpqMkw4?=
 =?utf-8?B?c245Q3h3eS9mYytid0pBUGlOa3UraU9GZGp6b3N0ejJLNjdZOHJzV3FzOHlF?=
 =?utf-8?B?TGxMSWZlRGV4T3NINTczbHhzR1JTN3ZWYlRoeEpjdTZsRThPTUJEZTh6bjlB?=
 =?utf-8?B?eEx5MFlpaWVwZUg0VkFMWFhBWEt3VUUzQ0FHZlhlNGNlekxFa0dRQkkxcTZP?=
 =?utf-8?B?d0pWdVFYUGZsQitVemhNK3FFdll6LzUxZ1lJbHhmVzhDU1ViQjNHODF1OW5J?=
 =?utf-8?B?Q05IT1NuOCt2Yk9Md0xZeGpnRE51bjJPL0FtZzhiT3BsK1FlVXlmYkJGeG0w?=
 =?utf-8?B?VGhBdHUya0N1emE2RWJ6ZWdoTGJ3R3VGSkhsVk5iaCswNk5BYVJlR3ZMcktj?=
 =?utf-8?B?cmVyTk9INnMzNkVVWTA5dklCZ1dBYTVrM3NQMHZqNm5ramcvTlN3VUVtcHE1?=
 =?utf-8?B?aVIxMlZra1hrMXRpcUcxUTlJNUxBSSs3MzJqK0VBSDVvN25PMlBCNFA0NlJt?=
 =?utf-8?B?Q28rSndPRXpIazErUng4a0FrNmt5TVlWVnY2aW5DRllCNWkwbWhCMU5MNXV2?=
 =?utf-8?B?eDk4QnRGTXkxK3NwUVBaSjBaL21jSmhlTUc4S0F4QWhBSWxRTHc4RU9WTU9j?=
 =?utf-8?B?RDNmNnNJamtkdWFKSnErMHIxTGpFWDZ2SGJhcGNPVTJYdThwVmVMSU9pMDgx?=
 =?utf-8?B?RzJjcFB0Sjk2b3g2bkhDMkN6ZUR4aEdtYldrMkdiK0dMRUNkTklzV2VQTVRn?=
 =?utf-8?B?d0NuN0F3Y0VIZU1WUjNIYklzQ0RWRmVUVHJGQXFIQ3J6N1BaUndoL3lzaWpO?=
 =?utf-8?B?NTVxQXpqVElsc1FjL3hNNVZna3dSYmlYTWZQU0VtMDlCYVMyY2NVeXp2aXNS?=
 =?utf-8?B?SytHSmdzazB1TXRiQ0ZPREc0L2JiaTFjZGVHR3BHREQ2elZQVkM3NkhxU0VV?=
 =?utf-8?B?VTlrOWJSd3FQSXcwMWZ1RGRJMFliMExYVS9WOVpWR2hXbXVNMUJzNytYT0Zu?=
 =?utf-8?B?ZGxGb3FNWnF3RzlzTWhSWmdHU3YyQXpucC9zNHBBSWN5MVZDcXZQYUlpOWJ3?=
 =?utf-8?B?YUt2SDVOZEpoVVpkMVltSVEzU21xVVVMZU9DR2pveTFqZm9QZ2g0Tng3VHFU?=
 =?utf-8?B?TWUzK3RmRHhVdXN4dHJhNk5FcjBRWVVyRVhwUGd5cXFoeHZsT21JREcyR1dl?=
 =?utf-8?B?WHo4cXY3Yy9RYjl5OVpoVlRBdU5MVmtscmVSNEl1WnIvblJSWjk3R0VsVWNE?=
 =?utf-8?B?RVAwSUJNMGc2cmVrdVUwY0pUT245bTF0bWpOM2t0NUd4UXpxMGZxTjViMExO?=
 =?utf-8?B?bmcrNzU0aDY2VEJPclU1by92YStPTCtmbEJpeEp1bGw3UndDN3NQbjltMFIw?=
 =?utf-8?B?TSt3d3h1SFV5andQVXFlN1hYaS9CRzF4TUppQ0JvQXlyMlVSZkgxVGc0N0w5?=
 =?utf-8?B?TXAweFhRbnphMjAyaytIWHFYUGdaK3JYMUJxWFRsdEtSZGJnUHd2RVNDRUtY?=
 =?utf-8?B?UjNOTE1KaCtYVTBBSmJrYzJjUXZrT2NXRWlQU1l0eE5OMUxFMXdYL1FFV0RJ?=
 =?utf-8?Q?QtjukpA6au9Ix0D0JLLB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eThiL3NRcElBT3VQNDV0ZzVJM2hldjh1U2hiWkRITHJwZnpSUzJubGJTYkRz?=
 =?utf-8?B?dUkrUVVreXJDTmRjZHdRdnVnMzlEblRQK1ZiVFl0UWtSOU5VMXFQUFF0cDcy?=
 =?utf-8?B?QXF3Z0hUdXhicmx3ZVBGaVhkZDV1Vmk4N2hYYWQwdzRlaGEyaThneDZCSVRS?=
 =?utf-8?B?c0FyS2RJN3dSL1V6dUhTeTV0TkN2Sm1NL2pvV1NzNkpJK1ZPZzU3dURLMWxn?=
 =?utf-8?B?QWo3R2FWY25Ralg1V2xXd0Y3VjN2eWVPZTlNdS9hSXNtbTZZTTh0TmpYL0tM?=
 =?utf-8?B?RkFzTFN2OTZhTWZuU2UyRzY0Vy9RK0NPWHVMOWg2VDBQTi9tS2tJak9kMlRF?=
 =?utf-8?B?MjNVcEFGcnRtSkJxTVVmVlJoQUZtQUhHOVBmWkJGWFhDN2RxT0dCZ1laS3FD?=
 =?utf-8?B?S2F2THkwaVVkR2syK09Kc2N5ZTdjK1E4b0ZnT3lnWXdkVzl4d1NiTENTRmN3?=
 =?utf-8?B?Rk1INkk3OHR1cUJDY1Y4NU93eDREVyt2UDNXRVpXYnpIbXlBdjRMd3YxV0Q3?=
 =?utf-8?B?cmgzWk5zSUlyZmx5VE1sUnVuclFMa0VxQTFEMWQ5YjVHOXY5Vjg3NlFadGx0?=
 =?utf-8?B?elEzK200RVhCaXNCV1hkQXdyS0t3SFB0Z3JOM1JKT0QxRVFrVCtXVHhiaTVM?=
 =?utf-8?B?SUhQUVkzVDU5OGhuR29uK3VRVm1nVkxmUktFN0V0bFRUTC9QM2RFcDVkOGds?=
 =?utf-8?B?elhvcis3Zmw2OTRlekM2dnlIK3pWN0IwZUFjVXhCdGNsejlIcXd3Wmxpc0wy?=
 =?utf-8?B?VnVHWkJ1emNSdGlQNGVIcDFFN05jdm1TSWtsRzE0UEhUUkdUdWt3cVJySWho?=
 =?utf-8?B?TTRzQXpuZVBVaXJpdGN0cmVDeDFSaWNlZTA5T2x5N0Z5MTVuZmxUU0NuSFVN?=
 =?utf-8?B?ODYzeHpoWEU3L3pRelZxWTh5dXNhT2xtbFQ4U2RLWFhVeTBiUTh0QkgvOW1v?=
 =?utf-8?B?UXkyejIzVmdhdmJ0cmNmMTZ6bVdReGs0dTBvamFsSkJtais4RE1Rc1dqWWhE?=
 =?utf-8?B?VzhKMHMrcW50aml2Tk9DZTVnTU04RWJJOXZXTGZrdXVFSmxGaEFSV2hyRTBz?=
 =?utf-8?B?YTlkb0pRcDFwRXNhL1I2OFNOc0ZhdUpIVzdkM1ZFc1dmT0ZCbGNnMTZmUDhR?=
 =?utf-8?B?OXFiUCtWbTZlWC9VT3liY2t6bkt2YnRITzR6VkloTERKRmdnSUZ2RnE0c09H?=
 =?utf-8?B?VFhGTURSU0UvK2RsSW0zQ2lzczN4WUFmTUhScW9CNnM5ay91R05KSlhBS3py?=
 =?utf-8?B?aVMyWCtPUTR6SnZNTWpFVFhDNkcrdVpmY0RORm5ObEtTdm1ZcFNwUkl2SXc3?=
 =?utf-8?B?WTRTQmNJN25lR1FCOWlVRFZwbytQSXBqQWFXd0ZCeWI2UXZwaThPNzc2Z3VM?=
 =?utf-8?B?cUxwOWFoVGF4dTAyK3hCcUx1bDhCYXBLWEVSeW4wdWprU3hRR01TdlpSSmsz?=
 =?utf-8?B?djN1ZGpOTU5XZ2hWNmMzTTVBUzE5aUZMdFNSdXZwSjZZQWw5TndENWxNKzJM?=
 =?utf-8?B?U1FQbUliUk1KM2lNWnMvSWNPYk52K1FEWEFJZzdSVkNKZ3Z0ZytWVVZoV3JI?=
 =?utf-8?B?QUxTNkU0TTlvWDgzeGFXQ0hSd0ZUdEVnNEx5MmJXNFkySnJ1d1RHcXRlN2JJ?=
 =?utf-8?B?eEsrcVRVbE4xVFQxVXh4NGUrUGwyRWl3VW9CK0Y1VE5QMk5LT3IxTk82Q3VB?=
 =?utf-8?B?NWF1TWZ3dVlFbGVLaFc5UlBHWWVFdVpQTTViU2dmTWRTVzgvSWY1ZWlaQXlu?=
 =?utf-8?B?aVY2K2t0NTNCUzIvbHgzbjQ2TGRLSThzNkZma3NpdTRHN0hTYVlNdUNJV0FT?=
 =?utf-8?B?UkhhZTlMMjN1YUJzcnBiN1diVTNZTnRnSnE4ZEZ4MGdZM05tY3hucjVhNzdB?=
 =?utf-8?B?N1RBTFM5RENoa3loSWJueEtVOHZEOEVZRzI0Y1FxYzUrdG5ieEFhNVIxSkJk?=
 =?utf-8?B?ODlIY0crT2Q3UEIvTlVLZHBHMCtPaEhrWHMzY1o2bnZlS1JkeHIxZDhjYjdW?=
 =?utf-8?B?NGkvMzhFc3p3ZGhoSHpVL295d1lzTXlzcEo5MUx6Q05pdnQwYm1NbEVJTjJr?=
 =?utf-8?B?bEdweEhBS1VxWEZYaXJtS2RxcXRKRjhrQWlza21Hb2NyNFpoQjhpdDVxOFZR?=
 =?utf-8?B?Ump0MmdSZjMvRXpveWlZTjZSekxwbWNHNE9SNnZxNkhUaVN1dW1nR3l3ZHlB?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e1c534-875a-46a6-0e2b-08dc8facc403
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 15:38:56.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVdlrZE4UoiqZFlF9bKmHVxZ8nugCuYfOU6thWszMHq/2nCrBr1ybKKQUWYs9ElGVERQB3+XMUyyNqw6yAj/udujqWGKQVj9hevwV6UNE3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6428
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



On 18-06-2024 06:30 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,V2,1/2] tests/kms_vrr: New subtest 
> for CMRR (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/134606/ 
> <https://patchwork.freedesktop.org/series/134606/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7891 -> IGTPW_11269
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11269 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11269, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/index.html
> 
> 
>     Participating hosts (41 -> 41)
> 
> Additional (3): fi-kbl-8809g bat-mtlp-8 fi-elk-e7500
> Missing (3): bat-dg2-11 bat-arlh-2 fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_11269:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:

This failure is irrelevant to this patch.

> 
>       o bat-dg2-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7891/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1.html>
>   *
> 
>     {igt@kms_vrr@cmrr} (NEW):

These are expected skips, as this test is LNL specific.

Please help to re-report.

- Bhanu

> 
>       o bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-dg1-7/igt@kms_vrr@cmrr.html>
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-jsl-3/igt@kms_vrr@cmrr.html>
>       o {bat-rpls-4}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-rpls-4/igt@kms_vrr@cmrr.html>
>       o bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-adln-1/igt@kms_vrr@cmrr.html>
>       o {bat-twl-1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-twl-1/igt@kms_vrr@cmrr.html>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-dg2-14/igt@kms_vrr@cmrr.html>
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-dg2-8/igt@kms_vrr@cmrr.html>
>       o bat-rplp-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-rplp-1/igt@kms_vrr@cmrr.html>
>       o fi-tgl-1115g4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-tgl-1115g4/igt@kms_vrr@cmrr.html>
>       o bat-arls-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-arls-1/igt@kms_vrr@cmrr.html>
>       o bat-arlh-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-arlh-1/igt@kms_vrr@cmrr.html>
>       o {bat-mtlp-9}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-9/igt@kms_vrr@cmrr.html>
>       o bat-arls-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-arls-2/igt@kms_vrr@cmrr.html>
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_vrr@cmrr.html>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-adlp-9/igt@kms_vrr@cmrr.html>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-adls-6/igt@kms_vrr@cmrr.html>
>       o bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-jsl-1/igt@kms_vrr@cmrr.html>
>       o bat-arls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-arls-5/igt@kms_vrr@cmrr.html>
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-adlp-6/igt@kms_vrr@cmrr.html>
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-rkl-11600/igt@kms_vrr@cmrr.html>
> 
> 
>     New tests
> 
> New tests have been introduced between IGT_7891 and IGTPW_11269:
> 
> 
>       New IGT tests (1)
> 
>   * igt@kms_vrr@cmrr:
>       o Statuses : 40 skip(s)
>       o Exec time: [0.0] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11269 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>   *
> 
>     igt@gem_mmap_gtt@basic:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@gem_mmap_gtt@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_render_tiled_blits@basic:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +8 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840> / i915#9159 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html> +32 other tests skip
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html>
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *
> 
>     igt@kms_pm_rpm@basic-pci-d3-state:
> 
>       o fi-elk-e7500: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html> +26 other tests skip
>   *
> 
>     igt@kms_psr@psr-primary-mmap-gtt@edp-1:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077> / i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8809 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809>)
>   *
> 
>     {igt@kms_vrr@cmrr} (NEW):
> 
>       o fi-pnv-d510: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-pnv-d510/igt@kms_vrr@cmrr.html> +1 other test skip
>       o bat-atsm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-atsm-1/igt@kms_vrr@cmrr.html> (i915#6078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078>) +1 other test skip
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-dg2-9/igt@kms_vrr@cmrr.html> (i915#9197 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197>) +1 other test skip
>       o fi-kbl-x1275: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-kbl-x1275/igt@kms_vrr@cmrr.html> +1 other test skip
>       o fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-kbl-7567u/igt@kms_vrr@cmrr.html> +1 other test skip
>       o fi-ivb-3770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-ivb-3770/igt@kms_vrr@cmrr.html> +1 other test skip
>       o fi-kbl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-kbl-guc/igt@kms_vrr@cmrr.html> +1 other test skip
>       o bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-adlm-1/igt@kms_vrr@cmrr.html> (i915#9900 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900>) +1 other test skip
>       o fi-ilk-650: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-ilk-650/igt@kms_vrr@cmrr.html> +1 other test skip
>       o fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-bsw-n3050/igt@kms_vrr@cmrr.html> +1 other test skip
>       o fi-cfl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-cfl-guc/igt@kms_vrr@cmrr.html> +1 other test skip
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-6/igt@kms_vrr@cmrr.html> (i915#9792 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>) +1 other test skip
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-adlp-11/igt@kms_vrr@cmrr.html> (i915#10470 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470>)
>       o fi-glk-j4005: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-glk-j4005/igt@kms_vrr@cmrr.html> +1 other test skip
>       o {bat-apl-1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-apl-1/igt@kms_vrr@cmrr.html>
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o fi-cfl-8700k: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-cfl-8700k/igt@kms_vrr@flipline.html> +1 other test skip
>       o fi-blb-e6850: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-blb-e6850/igt@kms_vrr@flipline.html> +1 other test skip
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-dg2-14/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-kbl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-kbl-2/igt@kms_vrr@flipline.html> +1 other test skip
>       o bat-arls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-arls-5/igt@kms_vrr@flipline.html> (i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>)
>       o bat-rplp-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-rplp-1/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-rkl-11600/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-dg1-7/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-jsl-3: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-jsl-3/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-adlp-11/igt@kms_vrr@flipline.html> (i915#10470 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470> / i915#10501 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501>)
>       o bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-adln-1/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>)
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-dg2-8/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-jsl-1/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o fi-tgl-1115g4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/fi-tgl-1115g4/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-arls-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-arls-1/igt@kms_vrr@flipline.html> (i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>)
>       o bat-arlh-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-arlh-1/igt@kms_vrr@flipline.html> (i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>)
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-8/igt@prime_vgem@basic-write.html> (i915#10216 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@i915_pm_rpm@module-reload:
> 
>       o {bat-mtlp-9}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7891/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html>
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o bat-atsm-1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7891/bat-atsm-1/igt@i915_selftest@live@hangcheck.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-atsm-1/igt@i915_selftest@live@hangcheck.html>
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
> 
>       o {bat-mtlp-9}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7891/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html> (i915#11009 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11269/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7891 -> IGTPW_11269
> 
> CI-20190529: 20190529
> CI_DRM_14963: 5a093f17293ae50283f19372263a7595ed50bc34 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11269: 11269
> IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 

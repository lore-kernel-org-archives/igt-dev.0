Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B68CCAC58E
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 08:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016F810E28A;
	Mon, 15 Sep 2025 08:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgKlpi5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1210E28A
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757924144; x=1789460144;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=6U9lO0SU1jK+4MJ7AGK6E3SgcCI8OcnohbO+RSi0mUc=;
 b=VgKlpi5APOjmnnKD0NtE7Tf6ojyQDs2hJoimBDKnZ8XNdnAO+oKUjPw6
 q20i8/QQaF3PLwLrR6KQavCeg83K2EvltAOtVBeeWQTWZ51XYooJkTNqq
 5GdOqXAxWiyPqLyYRXv9XbPhamFZaFrJWVSKEPb9kBZH/gSQ6bZl0oaFM
 r4zCi80yHXJL9spvXE2Gtfvs5c8+9l8+0zzYg5gEbWiupuRiKNf0F7jqF
 KkCZ0KidgKiusbOx3VjXjjTlIjvLva+wtTJglawpU2hVuKKQdtPcIbUKR
 bb1uIoRCVzMO39YInPKE/hXsavZoi7cVIC8S9caEYOaN9NC4B1SX52BXq g==;
X-CSE-ConnectionGUID: IUUWxsInS0+SZ7y/CGZnKw==
X-CSE-MsgGUID: tWIOa6u/R7eziL2i7goqnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="70789250"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208,217";a="70789250"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 01:15:43 -0700
X-CSE-ConnectionGUID: rLuuSWCDSb29rgaJPvyjOw==
X-CSE-MsgGUID: hCv6rYxzTPOrQDBYZBO8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
 d="scan'208,217";a="173845866"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 01:15:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 01:15:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 01:15:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.79)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 01:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8xL1Lei8hG00QjFpsDUFKxzyuYgX3FdpXPD4QDa23mtGLeI7Q8U/JXNLOMH4LlNXjRUOBSmj1EN9xlxFwUL99werBk6VAgYQW0RxaH1Av7rh366bzLkOkofO3fzKAxoiAsz73CHAx9TVou40lAt/8cdVeqCDAfSbIB9QvH45sceL1m7JlNMbPFVBKnoQ53VdWpkzXUtkLj0QlTYL8vbnF6Z3rVgb1d7H2WaquTXb4OHdbTjkwZLoNLq27Y9lYuHH2WY88v9+Dj8k9GJh5pSGQEhuSUJ74uA3NtHN+VTrPWZ42O583nqGzrqOALi+/e2bn4kw7ydPQYqf/hX/oWnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arHirr6GuniqJJrwKCVsg8/pPCnTQ/s+7D0ndI2HIRo=;
 b=yEh8mZ9+ppauhra75ufUPIKdTv+hxKc7udNrjt7L+Kky+VYcO3jJdH+vwkAjQDjYhbNWPrj9rmVfJl1xWR/VL4znSw5A3zrfz8XkNw+xx59ngboSeWvxDatQc0OCpvDFNZOFOiDgcNwUgUwbfX1K2keGTjj5FOr9hI8kO7hv6NWm3oXCy1qMpgwX1NvlUshv/vJnB9eq6YOrZ5VN/2Xsq0XdulOudZcYRMj8tJUvDnrH8/KsyQ69LsDBlEU/Gnw2+2mKVkNV+habOkBWM2BimVX3MbKJBLtWK2h4iL6UvydLzm72UFOKi897mvu5YfmUSm54z0Sj4OHaMZ8Ic8DUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 08:15:40 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 08:15:40 +0000
Content-Type: multipart/alternative;
 boundary="------------mb7L9IHI6rrQzyXsxRfvjKGB"
Message-ID: <0104c62c-c8b3-43da-a43a-17a0cce47ee1@intel.com>
Date: Mon, 15 Sep 2025 13:45:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tests/intel/kms_draw_crc: limit formats in
 simulation env
To: <igt-dev@lists.freedesktop.org>
References: <20250910090059.351698-1-swati2.sharma@intel.com>
 <20250910090059.351698-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250910090059.351698-2-swati2.sharma@intel.com>
X-ClientProxiedBy: PN4P287CA0090.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::6) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b765219-c066-4043-4539-08ddf4300e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dC9nSmtyT05OZlgzMzZORFRYUytDQXNtc0x5dzlBUzVpYk42SW45Z2VpV3A0?=
 =?utf-8?B?bEZLTGZQV2thNGNGRzVrcXhJV1R6M2l6YjREZCtVT0d3eGpEcFB0eGxodDBS?=
 =?utf-8?B?OWN0c21XY3ZocExpM29ZMjBpK01VcEFkc09uNmRrTUFSUnFrelhOcFExdC9o?=
 =?utf-8?B?ellHcHBueTFjcGpDelVIQkdab2NmdDhxQjdmTEVRLzI4RVV4MWR0Y1pTTndP?=
 =?utf-8?B?Nk5FMDdmeThNSzFPeEVVU2lUK3Q0eFVuZGpFTHQxd1M4a2NQVXhPYjZYUFJU?=
 =?utf-8?B?elkxd1Y3U0RsaVBOUzdrTlFzWW4vUk9MMzhxK2JHRmFSVGtvNSsrVVBHYW9F?=
 =?utf-8?B?R252bUxhc1RTcEJ1bXJxYTZySzJoUXVZWFQyV2RreDZXeTA1VkFrektNaVcx?=
 =?utf-8?B?T0FlTHoyN0ZxS2Y1RmZ2N24yc0p1YkhQeUpUT01zMmwvdHJUNk96aVpzL0tU?=
 =?utf-8?B?SnA0cGxNajJhSk1EVkhkT2hudUZHSktiZmpZczBxcy8yQ3NrZFVqVnpDQWJk?=
 =?utf-8?B?dzVzMW5HakwrWWt2YXFMOGFtSjV3NXljMTdYS2lpV0VlbnBydzJiWkZxRDhw?=
 =?utf-8?B?SmpDUWFWV0RhYWJoRDR3YStpWjE4V1hCUHFVbHpvTmpQci9neWRRNFcwZG1G?=
 =?utf-8?B?Ujg5cmh4dC9oS3pHYlAzVThSMTZnTlZWZVJhMFFqdXRZSDczVHl3a3VwMDZx?=
 =?utf-8?B?eGtjOE15dFY3anFNd2R6OC82VkZtS0xmeUg0bTNkeTFWakI5RnhnY1Nsbm1Z?=
 =?utf-8?B?ZXJBWTVibjVLQ0ZpQmgwdmtTcnhnZFFMTDAxc0pjaUh1YXRnTlB3TVNneDF4?=
 =?utf-8?B?cTU2ZDZjYk1jYlhDNDlzS2s2NiswVFlsSnZlZU1reTFESGNQbm8ySWljVEx2?=
 =?utf-8?B?Y0tOempBcTNVMU5OZGs0RUJlejF3UkdCVVlnaFNreVZLTDJpaFFDTG1yQUdO?=
 =?utf-8?B?cFozTmFsSk41eUhMV1dvZUVQOGs3ck5FQWVtUmtiZjNwUjJ5blplSkowN21N?=
 =?utf-8?B?OHVkTkZhdFM5R1UxZERldkZnQzZsZ0xSc1pOWHlITXVsUm9uOGZBSjlCeGNY?=
 =?utf-8?B?MWRLbTI1S1pkc2RjQ2pqTEJTVEkvbjVuKzJlTFRYeHc0VFQ5TGtjUGpiaTBT?=
 =?utf-8?B?RDB0MGFqTk9IcGora2o1NlRDejMzdWxraGZJc2F3eXlnOFprR2pscDI3M0xk?=
 =?utf-8?B?RGJkSkFnOVRLQ2ZhNjJqcFEvam43aTZOaENqcEVuQUVSaXZXK25NdVFsM3Vq?=
 =?utf-8?B?M2cwMWNUbWFRK0djVUpjWHA4MEE4Z0YvVGNIYS9RdEVPeEJlaUtRN3RXR2FI?=
 =?utf-8?B?c0N4blZiU2Znc3hiZS90eVd0a2ZmS1dBcTRIeUx0RXZ4NXdKWElWZmFrV3Nz?=
 =?utf-8?B?RXhNNWVoR05LZ0RBVndHcGpuSDBHVE5yU3FLVGJFUDM3TE5nTjRUNjJiSlRv?=
 =?utf-8?B?emc0b1JkcjlSUHpwMEhDbmRVc284cndJcXNqOTl3YS9UcTJqTENZNTlQVVZT?=
 =?utf-8?B?YTJtQmgyaXJWVVN2K0V2azlQOHRPNUlxVWdLZ3FuNmZCZ0ZDeVUvM2s1TzJ6?=
 =?utf-8?B?blBFTmhkcldRbWh4ZzZtWFZCZEpPVmNQOHpGTWJ4VXFsRC90YUVSTWlqRTJJ?=
 =?utf-8?B?M05lRm1lVzZpQTlUQkRNSmhsRHpTUmdaS3MwZlJnL1RzWWJIcGdKUm1oYzF0?=
 =?utf-8?B?L2dlQ25mbjl6a2lmTDNNUDRRMG9VZFJ4aHUvb3J4U2xyRDIxT056Z3lmK29V?=
 =?utf-8?B?bWtkTVgvalBsT0lKMElkNmZ6YU50QWRRNnA2U0R2Y2hsajZtRDkvQ1Z6N3VS?=
 =?utf-8?B?OFpsYkU1MUV4VS92aTVyYVlwd3VEYVR5M01HMDdTMSszaDZxekNVQ0xvS0kw?=
 =?utf-8?B?SmZZa2lsTXpFdkdlREJmdGM1dEtDZWNURU0vVDhrb0tBbnBlWFZrN2svUG1Z?=
 =?utf-8?Q?UP256EGiBls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RitLcHVEcDJjSVRKL2J4bEFNZmxFL0VaWVdrNllOblFEeUY4WmYxQnpoWGkw?=
 =?utf-8?B?SXpvK3pxTHJUc2VGa29yYUxNUFltaEV0TVJQYTY0REhDcjBIWGdKNUQzR2RU?=
 =?utf-8?B?cWdmVDQ4YTdid1c2WXRaajFFSldVNld2Z04zcC9TVWx6Vy82WW5UY29nbW5S?=
 =?utf-8?B?OFZZL21WOFFqcTQvaVFraFh0VDVHU1ZWdlErMVBSaVcrNy81OGViT0RJWDVU?=
 =?utf-8?B?cFNoSVB2cEZBYmw2N09SdEpLdFFjcnFDR2hnOTBVNWlUTGk0S3VlWWRsRFB5?=
 =?utf-8?B?K21ndGRncElaMmZPQTFJcFVqVXplK1JVL1RqYWNlK0tHSWV1eUFyWHJEYWJj?=
 =?utf-8?B?KzZWY2xWTXJvWkx5UExxTzRVK3JhcitKSm8xeDZpTzFCTkhKQ0tsRTF6am1p?=
 =?utf-8?B?UCtKdE5KeFpTYy8vRy9NRWlCUTVjVVZCbmJIL0NFOFltNVRpeUl1UnpqUk5X?=
 =?utf-8?B?YXJ4c2VjMDJDeUw3NXVPWTQ5dkZlbnlIUEo1TDliMThaTERnMWJvRnptamNs?=
 =?utf-8?B?MjdWay9ZdldGSkRyRHVoYU92K0xCVWlOZ0ZQdVQ3a1N0b3FhWnl4UzFGTkRO?=
 =?utf-8?B?c0RDVmh0VkV4UzY5YndJaUIxRThwcTlpMWlKY1gyU1I5MzE5UmppRnoydHJv?=
 =?utf-8?B?dlpBNkh4NEdZVVc4UTFjb1NFWkF2UzdRRzhmM3FjS0xyems0b2t1TldhVjNx?=
 =?utf-8?B?elZPMXRCeldZOFJWbnBWUEhSeDlvdFhlRGFOalo2YUJrTzBIM2l6MktLS2Ir?=
 =?utf-8?B?T3V4ODUxOVNtU2FHQVhBeDczdjU1UVprakFSNnJUSFhOdlRIMlR3dW52T1dm?=
 =?utf-8?B?ZXVVa3oxRjNneWd2Tk9TZW9qWmlua05qcjJEZTh4YkhIS0Y2aHNjYU9QWkcw?=
 =?utf-8?B?aDdQeFV5T0Y2QWxmeS9tNEFrcHE3UGFjb1hFM2ZhTlM0Yld6UklmRTNWNG9O?=
 =?utf-8?B?Y09uaXRmZzVrZlFObU56TXJMVTloajZqZ3ozc1h2LzZQTTNRMC9QRUU2U0FO?=
 =?utf-8?B?bW8ybjVaUU1EdVNtZTZQbHlIUnFzazVIa3VicU5MVXdIcHBWek1GajBIUlBn?=
 =?utf-8?B?RzhXOVl5MHFJazVMQ2szYXhHekVDY2szVEEyMkVVbjM2VmprajFaWjk2aHY5?=
 =?utf-8?B?NTRhS21wejMyN0NrYk9zSjRFNS9UNmpVdjgyTVcwMXNlcEhQSi9iVEtuUkhO?=
 =?utf-8?B?K09xdmRkQ2pJNmFFcEdDZUxCUERZVFhUbUdmRmh2N2M1Z3lQdzhKV1d0dDJV?=
 =?utf-8?B?aXYvUlBCd0NRb3NxdEZpMzlYMlpIaGRzV2JlOUNDMGhOeDd6dERVVFNtdWxO?=
 =?utf-8?B?dzV3emN2U3YvVDQzWUpLU3I3Q1QvZ1VseXhod1ljUjNvMElZWnRHdjJRU1Rm?=
 =?utf-8?B?RGhEZjdvekdPSjBHVGJaOW9zSXp0cWtjcmNOZVk1OHdIWCtCNGVEV0hic2NH?=
 =?utf-8?B?Q3hDNmIvSy9Ud2FzUnZEQmo3TkNxWkhSK2xCQkZtd2ltRVNxbzV1VWE4cDkx?=
 =?utf-8?B?NzlCZm1rcVREYS9seWRPR3loQk1BUHkrbFgvNkhCT2JRZTNQYmNKTzhYT3ll?=
 =?utf-8?B?b3UxQUFVQ3JYaWN2WktYL1dvSklueU1LT3BSVTJ1blJ1ZlJKOXBLQTB5Z25M?=
 =?utf-8?B?RjU5QWpVUG5KdEpHNHZJWU5aR2xHK0tZMGFGREVWQWMwL0NvTEVINkRuYU9I?=
 =?utf-8?B?blpHQmhodnJSaFgvUTVreDNlaEM3WGpOUU82UWdIN1lmMlJqV0Noc3RlNUw0?=
 =?utf-8?B?ZFdwVkNsc0pNdTR5dUtIODVWMjBLQW1OYmxydG9SdS8xM3E0NTNhd2htaG5F?=
 =?utf-8?B?eU5IMXlhSkdPVGNQZDlwZFgxckhxYkg1MzcxeE4ybkwyeXAzRlozK1RBS2FJ?=
 =?utf-8?B?M0FkRFB3RzV4Z1JKMFM3VTVUMEdwckpnN1pYZmRLYlFWMDNIVVJ5TEFSeWZO?=
 =?utf-8?B?Y0VSQWl0VFhodGREcFcvUDlPQk95bjdxdXk5MXp3TGhGRzhjQjVuMjJGOThT?=
 =?utf-8?B?UWErNkdzWlBCaGc2M1J5R29Ea25kOXd1TkhMNkJJUWZDUlZnYWZHY0pCeWQ4?=
 =?utf-8?B?ZXExb2lBUnM1SXp4UWplSzlxTXlRNmlYVGRMSitRWDNyMjBvbzVpL05BQ2dH?=
 =?utf-8?B?UmJHcVZHeHZkK2p3bzJkNDJzM0xicTJCanhkbTlvWFdWWldEOGhKT1oybkta?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b765219-c066-4043-4539-08ddf4300e7f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 08:15:39.9814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4m05+9IMg7wsgMWJOOEDJbz8rRQWpoGHihkOGbMWH5iePfofJNg53yiEZ/BOfG9tMew/x7z7u05KC9C5nMPwg2I5CYonRB+3xaNi/mxvOFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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

--------------mb7L9IHI6rrQzyXsxRfvjKGB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Swati,

On 9/10/2025 2:30 PM, Swati Sharma wrote:
> Exhaustive format testing in simulation provides no added
> value and only increases runtime. Restrict execution to a
> single format to keep runs efficient.
>
> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
> ---
>   tests/intel/kms_draw_crc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index f172c8d6c..4877e757c 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -359,6 +359,13 @@ igt_main
>   						      modifier_str(modifier_idx))
>   						draw_method_subtest(method, format_idx,
>   								    modifier);
> +					/*
> +					 * In simulation env, limit test runtime by checking
> +					 * only first supported format instead of iterating
> +					 * all formats.
> +					 */
> +					if (igt_run_in_simulation())
> +						break;
>   				}
>   			}

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   			if (!found_supported_format)
--------------mb7L9IHI6rrQzyXsxRfvjKGB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Swati,</p>
    <div class="moz-cite-prefix">On 9/10/2025 2:30 PM, Swati Sharma
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250910090059.351698-2-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">Exhaustive format testing in simulation provides no added
value and only increases runtime. Restrict execution to a
single format to keep runs efficient.

Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 tests/intel/kms_draw_crc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index f172c8d6c..4877e757c 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -359,6 +359,13 @@ igt_main
 						      modifier_str(modifier_idx))
 						draw_method_subtest(method, format_idx,
 								    modifier);
+					/*
+					 * In simulation env, limit test runtime by checking
+					 * only first supported format instead of iterating
+					 * all formats.
+					 */
+					if (igt_run_in_simulation())
+						break;
 				}
 			}</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20250910090059.351698-2-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">
 			if (!found_supported_format)
</pre>
    </blockquote>
  </body>
</html>

--------------mb7L9IHI6rrQzyXsxRfvjKGB--

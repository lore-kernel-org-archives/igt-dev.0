Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B211AC2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 04:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6498210E178;
	Tue,  9 Jul 2024 04:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfG1c3Rg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D00110E178
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 04:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720499768; x=1752035768;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9pxSgclqw6u3DUEOh0ljbBlIWT50NIEoOeKtBXSOmtE=;
 b=PfG1c3Rg7K5Aa+RyRp8HBmeiVj1ZcJPXFKkCs0LubFchE1pGyE1kp3IA
 zQ72vzk4A+yC/XREzMKVD4QxSaX5HT5RXiiaONmDK0RO5UT1A4pvSzOL3
 Qvmy75dGrwKbuSTyM0V13aEAFhQ4JNghcDVowHOJpTI2ywVl+J4YhdwSx
 ILfhnLLk9WQ+9oHxQ52XjBqRQqyKlr8NYJbLaJnUgQQ92jszyQzrb49m7
 BY5xg90V6LLLP9hzsKvS+obzIJAabS+olsOb1ask6rVVLUFT6Xx7Ywf/G
 EiZadc9neiHmh/dN6M/EDdiOaxF9vAfs30DeFbSrJUpEReVmRSgIoKKBS w==;
X-CSE-ConnectionGUID: 9p029FG6TO6MdkK7PUyuvw==
X-CSE-MsgGUID: 3SHd2gR9STSby2gYGAJOCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28890487"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="28890487"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 21:36:07 -0700
X-CSE-ConnectionGUID: LiMl3Jm3RsaJ62vvSzY88A==
X-CSE-MsgGUID: 5fVNO4t3SEK92+/Ynd8uPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="70916026"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 21:36:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 21:36:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 21:36:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 21:36:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 21:36:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkeXBcHh0v715D/DGILA7I27+5xgvYZfDjohttTZ5uUWwHiFfslm+wAi3dxbkWO6z2S/BgXqSCvKtiEXl4w2t6Yv8fp+wrGqnwuAb0SA1RsoT+0G+LuQzer2yO7l2CvLCVMPCJg6XQQrpcIokFBBeaTepWwGf2ladpeVPGb42FKa+xqmtTzX+7zevJU4jzUrFwb2PKtcQf20rX2YWT1jp3UWobfv7BTLsOWkGDjJuCiD+ui5ve9y4m/OX6kdUiq1j+Ci2qpDYSu6x6B6wsrQrxjcYxvLfAceeHBEc2dnKzzZiZydrfWqKXv3ZwHWXGDqX1GLMhBFHpLE17T0qZqJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kZVJ6BtCJ7uNxolVsRgClLUYMA/QqYLrFvgczaD9QE=;
 b=hMaZvCsfhaGptWqUj3AzP65i0m4hzY3b5CrmqdP0hEn7UahktE/wIOoz+vT/sfTV32ck6jhC/u2VL6xxpaTONdGRzJ+CpUmg/Oz79wmEDkcH0ppWJU5JTjn6jB845+lA99WqdWm+bLcxqPiti3GF/QjhhxU7mO5A1hoVxfHzuIGn5+Ire0Je5aj0tKou006jdhtJvMvJly1QdvsWf5V9HQ2VqWmOlgy1r+c4jE0UzjNCZfZcgvooBU9YpicrWuZUEmPyPQs+JCqaJoap5urz7Gp5k2PlmadKfbkHTV/KoHLvZUf//UI3bEylvI0ErcqyOJtVIyT0lfPD/2k4aNBAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 04:36:04 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 04:36:03 +0000
Message-ID: <c06ed29e-2a9a-480e-b9a0-eea05b0ed932@intel.com>
Date: Tue, 9 Jul 2024 10:05:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_scaling: Improvise the scaling BW
 issues.
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240705195820.411421-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240705195820.411421-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA2PR11MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f5717c-3c65-4bc0-665a-08dc9fd0a42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnFJLzJkZ1c1YjU4L3U0emdXYm1LMFR1djFBQVdjVFJxejY4YWtqY1E4Ykp4?=
 =?utf-8?B?bG5uQUk4NlYwODlTWSs3a3JRbkJQUm4ydG8xTWt1NS9nMVhaOEVzRjZGWC9r?=
 =?utf-8?B?cEhoTEw5ZFg4TmpGYXZVQ3VCeFYzYXlUR2hMZncyMTd1Ynd3Q0ErZkVldWtC?=
 =?utf-8?B?ZmRUZUkzOVErdFlJaktQZ1AxT204OWFSSHlaMGV4TjBWZWF1OUNFblpzUmhI?=
 =?utf-8?B?Vkh0c0ZGVmZpU3ZoT2Y4UTFjL1drWDArTXVKb1BVcmFZMjJ3RTNsMmM4VnVO?=
 =?utf-8?B?R0pHcjVRcVdGU2NuZVJlaGFKVklxWGlpRVkwSzg3dmRNamNaK1MzekVuQkFG?=
 =?utf-8?B?UitnVndGZWpMQmsyYm1qZVA4cHBpcDNqanVrOWh4U2wramN1azFLVDRIY2Vr?=
 =?utf-8?B?a0xGSlRIdTljd3I3Y3ozV2NDRkJlSkxjem1IamFWc3QzM2pHcmF2Mlc0cUlM?=
 =?utf-8?B?NWNkTlRXdi8yMlhUQlZUQnZFeVJaUzcwY3FDcDdUQ3oweklkcDg1ZVhFSmNX?=
 =?utf-8?B?OUR1RFEvcWtrSHB2cFNsYi9HbjZOQ2FoNlVrVS8yazM1d2UrMTVpZ2hPN3BB?=
 =?utf-8?B?TzhLOUxvM1BjQlNTWmtxL1NMb2xMQnBrZ1lFQS9BUUhuSDhmMGdOaElDZ21q?=
 =?utf-8?B?b0p2Uis4WisrMXhON2VYbURCTEp4ZGRxT0FVWW5OS1lHRytrNmRqOHpzOU82?=
 =?utf-8?B?RjEzb2duYUZ4RFVpYlZrVHNkbTNCZ1k4cGhXbWFiYURMVWorSEtkYTFCUVkw?=
 =?utf-8?B?SWlGVk4ySjdyN1QwQk9TS1JnOVJURFFxbnNjNnVmbnEzQWxFdjBoV0IrQlZx?=
 =?utf-8?B?bVU1QmpUaGdsNXYyMlFtaklJYVJ4UExvV0tnWHZQaUs2Zkx5b0RPaklsVkl5?=
 =?utf-8?B?MmZVL1dkaW9iZHVOQkl6YUlHQTF6RjcvOUJLRnhkVU1PUnAyK2duV3Jud2ZK?=
 =?utf-8?B?QjhySTNFQmZRVnBBSUc1RllnejZ0eDNzN0pTUTJRRVdsbHdlOXQxazgyREdY?=
 =?utf-8?B?ZllBdUtsV1RaTmd2TUJOb2lDMTlSbmNOQXVDNE9nR2JXWjZqaFpoaFRheThC?=
 =?utf-8?B?SCs0c1F2SGlBTkk4YnhtdFViSEtjeWFZNEQvWmhkYWo5V2NoU2l3S25zcjdO?=
 =?utf-8?B?c2xIRnlITktiSkpVQ2MzZGlwR2YrUElIL1h3MlJwYStEYW50K3NlTXlvOHYv?=
 =?utf-8?B?ZjRqSXpqM3ZnQ1gxTjgzZmZKS1REQkgza1J5dDhvM2x0NGRRaWdDR1ZOY01J?=
 =?utf-8?B?QmV0d2Y1UXhVa3FHWGxWcWNDUmZQYUtTc24wQ2x0eDdJb1RQaVc1d0YrbU02?=
 =?utf-8?B?bE5HN2NLdWlRREd6dkp0M3RrdWlYd2IrZHN0TVpyVmdVYVNjNzhzNDlSR1Y4?=
 =?utf-8?B?eXNGd2hIZnp4R3psMDlnQm1zMWdJRDFybll3emR2NXRTWUpaNXhmL2RLWStj?=
 =?utf-8?B?SGpYNDVhZktEN1B3bXhvTW1CTmdhbVVTeUdzNUZFWDdvZm0xT1VsSFR4WVlv?=
 =?utf-8?B?ZWVhNUVucndRMmRlL1lxNGJzT1NtL28zNjVMREJrSitPNW1wUHIxL1dQYXVu?=
 =?utf-8?B?S1ZUb1poS0FIbjZNMm5xY0pHWDNLVHYzN1ZpOXVCdFpIVGtrdUpIUmtLYmls?=
 =?utf-8?B?QlJMeDF5QkNGdGtDYlVheHErZEl2aUFwYkFoYkY0QlZGckJ0NzYxL2hGNDBR?=
 =?utf-8?B?SzRxTkNqZkdTellrZHV6ZzJDRWhwSGJOYUhUVnpLYVlCK0dORFFKNEdIWHpZ?=
 =?utf-8?Q?Fyvxg7mKjXdlMsqb1I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXVFVEpaWDl1U0FFN2Q1cDZKNFlsbUJzcEpFeTdPNWdFWVZkSSt3aVVkVCsx?=
 =?utf-8?B?LzRUU2s2L3NMQnZjOEdvajJUT2U3K28rSXhHckNNcWhha3drdjdlNTNpdGVG?=
 =?utf-8?B?UHNMbVJKa1FhVExBSW12SnpyS2czYkh6SmJtM3BsUE5mbW9aYXpsU3Y5eEYz?=
 =?utf-8?B?NzRDMFMxT2RMbExqNitZT1d3djlWUGoxNGJkMkJ2bVhjODVoVGdzNFk0NHlY?=
 =?utf-8?B?SlFXRzU3N3J4Q3ExUGJRRUZ3cis5V2tWV00wS0pJbklhYlFpRmYzcHFOUVdC?=
 =?utf-8?B?WWQ1cnZDei9rZHNqZkpwcEZ3QjJ2Z2tYd1Y3Wmd6VitXL0xZd3J3eXNGNzM5?=
 =?utf-8?B?aGRCZStiM1IxdXJJUHhyQU8xRmFFNWdEUlg1N0d5U0plQ1R3RUY2Z0Zkdm0v?=
 =?utf-8?B?ZHRKMC96amMxSlVsRmpqZS9GOWVkcnRsNXFRR01paXNKMVE1dmVQRzZ4TnRs?=
 =?utf-8?B?M3JSaEd1Rm95V1lrb09ZeVk5QmZHdjVNb0RVR0ZGZG5qNWtJY2JNclAzYUFt?=
 =?utf-8?B?OFNKMkp0RC9UeU9XaGd2RE1yMHZvZFNSb3N0RzFmM2EyWGZHVjFFYXh4UGFG?=
 =?utf-8?B?Q0dkZmtidk9Cc1JwaDJSdXdSSkdlOHhKbVlNSEt4V3NjemNpZjNOL0R2eDFW?=
 =?utf-8?B?alpLd1dpbk9USEVDSGFIMHdBN3R6YTdEcE5XazVxVGgwNTZRZ1kxUnkrd3g2?=
 =?utf-8?B?RkpLazdEN3Z3disySHlMOWluWmFNeTlpd2lyL1FobENYSkhtYm1vN1pab0wr?=
 =?utf-8?B?MWNwL01WUmQ4T1hpOXUrSHkxNkVhdHJhVzdWMzBvalpVUjhieTFITno4NTkx?=
 =?utf-8?B?ZDdnVjJobHppMFdKN3E0eE1wWGZURWQ2UVh0VzhJUUg1aVhENnRpNEZQTEhh?=
 =?utf-8?B?QjVEK0lVMlhrYWt5QkZvZjRXWXRTbkc4Mi8rMlpaWUtWaUNhZUhGVjN2K2dE?=
 =?utf-8?B?SXpKUWUwWFN0YlhCLzZUQ0xySS9qM0syMGtHY1RIdnVkS3BZSHM3blg3bE9u?=
 =?utf-8?B?cFhxajdNV1dac0JXL0ZxVlU0Mm1tQ0ovRVdDQm1OS3FDOVE3cjc2WFl2ZnJO?=
 =?utf-8?B?V2d0eS9vdUs4Skd4RUFqK1ludi8rN09CczlHWkl3TVdRUjdza1Zqc1FoWkp4?=
 =?utf-8?B?bEhCZjlBazJ3elhMWmZINFE5VHJVcWZqQUJWWVRZRDZ1cmNVMGpJdTRzcnJR?=
 =?utf-8?B?UER0VjdUVXNHdlR1bHZYYWVIa2FlU0ltWjFhSVoya3U1WjJxL1NHaTdyRnFT?=
 =?utf-8?B?dk4vekQ0ZTNkM25lSzJXRHVBaTZQWTVQaGlUS21hM2J2TzBnTmFBMFNRREZ6?=
 =?utf-8?B?M2tvazdKeXI5ZUh5Tk9aZWQyZVF3dXRoOTc0TmJyL0tQMGgrSFhyeGwxcVox?=
 =?utf-8?B?TU9qSjVzdEQ5azFWOGR0MXJpM241SjhwZ3lqNlgvSnZqRFdvRVpzMVc3TU5D?=
 =?utf-8?B?SW5nYlovMlA1eCswOXlzREp2MldsejM3OUlBOHdzdHYyaTZFLzJWWHViLzRH?=
 =?utf-8?B?UEZOY0ZTRkYxZjhFU2hyOUZTRWVsVysxUVhaL1NqRlM3U2FlcW1qS0hrMndG?=
 =?utf-8?B?RW5HcVFxVGpPM3BiYkFPMmx0S3hOT01PVS9MeCtTei9OVFdiWE0xVTFDbkFD?=
 =?utf-8?B?bHg0VDBjQjhxYzNIZm5ya0FLelJWTFF3a1dvUGtKL3VmUHNyMFV5dzluVE9I?=
 =?utf-8?B?cHpXdlU4b0pNVTlkUDVha0t1WUoxbVFTVXlMeEYzaFpmQ1Jwc0VKR1pWOHpz?=
 =?utf-8?B?S2JGVHJPejBlUUd3L3llTXpET1YzbG5vbTdMYUtkeFplRC9hd0xPZUlvZ3R5?=
 =?utf-8?B?c0V5K3hVeTI0LzNwWk4wRUg1LzZHVXoyV043V2pzZ1lvTVdtS0d1R08rcGM2?=
 =?utf-8?B?TWxZV2xuNEJtTkcxYmh5S3RiaUpUVmJiSFBVblNWVXdSeHh6VGtoQUNjQjIx?=
 =?utf-8?B?blZqNnUxbVYxZDh2WFVBOG9teTR6ZloxQWR3Y2V5MUxWd1EzZ1dnR2s2WVZB?=
 =?utf-8?B?T1NlVDJ4NWd5Zk9Sd2NLc1IvVUVSUWMybSsxcyt5dkNyRTVVTkpYcGpYR0E2?=
 =?utf-8?B?ZllmaXNsTEl3Y09hU2VMQ0FLS29sUXROUUoxeHJISzNQNzZXQVFMRXlkVXJK?=
 =?utf-8?B?VmpyOUcvRlY3WW1qaWJHb0VXNzZoVDEwNEhuaTB6d0ZhRnBKSStkczRJV0Vw?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f5717c-3c65-4bc0-665a-08dc9fd0a42c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 04:36:03.9244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njNCfdiQ2HTCzjsXL+oPSRKxJcH0x5x1LhEPaTkLfwfTyVkYEEwDAsimcyUsm2fKcBf0fzPf48b60uvqC+0FqA6aKGziPex2qPL2UBeQvnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
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


On 7/6/2024 1:28 AM, Naladala Ramanaidu wrote:
> 	Description:
> 	1. We observed many tests are failing due to Bandwidth
> 	   issues. To elimate this failures we change the least
> 	   working modes.

Please mention what is the problem faced and why this change is needed 
to fix this.

Also, lets have a generic solution instead of a solution for a specific 
config.

As I understand some of the tests are failing, as the mode which is used 
seems to require bandwidth that is beyond what can be supported by a config.

So a possible solution would be to try a lower mode from the list of 
modes, instead of just picking 1080p.

Aside from this, I see some styling issues in the patch. Lets adhere to 
coding style: 
https://www.kernel.org/doc/Documentation/process/coding-style.rst

Regards,

Ankit


>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 72 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 67 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 3f63d3cf4..22983710f 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -197,6 +197,9 @@
>   
>   IGT_TEST_DESCRIPTION("Test display plane scaling");
>   
> +#define MODE2KHDISPLAY 1920
> +#define MODE2KVDISPLAY 1080
> +
>   enum scaler_combo_test_type {
>   	TEST_PLANES_UPSCALE = 0,
>   	TEST_PLANES_DOWNSCALE,
> @@ -210,6 +213,9 @@ typedef struct {
>   	igt_display_t display;
>   	struct igt_fb fb[4];
>   	bool extended;
> +	double sf_plane1;
> +	double sf_plane2;
> +	bool flag;
>   } data_t;
>   
>   struct invalid_paramtests {
> @@ -579,13 +585,31 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	drmModeModeInfo *mode;
>   	int commit_ret;
>   	int w, h;
> -
> -	mode = igt_output_get_mode(output);
> +	bool mode_support=false;
>   
>   	if (is_upscale) {
> +		mode = igt_output_get_mode(output);
>   		w = width;
>   		h = height;
>   	} else {
> +		for_each_connector_mode(output) {
> +			mode = &output->config.connector->modes[j__];
> +			if((MODE2KHDISPLAY == mode->hdisplay) && (MODE2KVDISPLAY == mode->vdisplay)) {
> +				mode_support=true;
> +				break;
> +			}
> +
> +		}
> +		igt_skip_on_f(!mode_support, "Unsupported Resolution \n");
> +
> +		igt_output_override_mode(output, mode);
> +		if (d->flag == true) {
> +			width = mode->hdisplay + 100;
> +			height = mode->vdisplay + 100;
> +		}else {
> +			width = get_width(mode, d->sf_plane1);
> +			height = get_height(mode, d->sf_plane1);
> +		}
>   		w = mode->hdisplay;
>   		h = mode->vdisplay;
>   	}
> @@ -593,7 +617,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	/*
>   	 * guarantee even value width/height to avoid fractional
>   	 * uv component in chroma subsampling for yuv 4:2:0 formats
> -	 * */
> +	 */
>   	w = ALIGN(w, 2);
>   	h = ALIGN(h, 2);
>   
> @@ -603,6 +627,10 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	igt_fb_set_position(&d->fb[0], plane, 0, 0);
>   	igt_fb_set_size(&d->fb[0], plane, w, h);
>   	igt_plane_set_position(plane, 0, 0);
> +	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> +		      "Unsupported resolution parameters  %dx%d\n",
> +		       w,h);
>   
>   	if (is_upscale)
>   		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> @@ -847,11 +875,27 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   	igt_display_t *display = &d->display;
>   	drmModeModeInfo *mode;
>   	int ret;
> +	bool mode_support=false;
>   
> -	mode = igt_output_get_mode(output);
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		if((MODE2KHDISPLAY == mode->hdisplay) && (MODE2KVDISPLAY == mode->vdisplay)) {
> +			mode_support = true;
> +			break;
> +		}
> +	}
> +	igt_skip_on_f(!mode_support, "Band Width not sufficent for Multi Plane\n");
> +	igt_output_override_mode(output, mode);
> +	w1 = get_width(mode, d->sf_plane1);
> +	h1 = get_height(mode, d->sf_plane1);
> +	w2 = get_width(mode, d->sf_plane2);
> +        h2 = get_height(mode, d->sf_plane2);
>   
>   	igt_plane_set_fb(p1, fb1);
>   	igt_plane_set_fb(p2, fb2);
> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
> +                      "Resolution not supported by driver\n");
>   
>   	switch (test_type) {
>   	case TEST_PLANES_UPSCALE:
> @@ -904,7 +948,17 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   	cleanup_crtc(d);
>   
>   	igt_output_set_pipe(output, pipe);
> -	mode = igt_output_get_mode(output);
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		if((MODE2KHDISPLAY == mode->hdisplay) && (MODE2KVDISPLAY == mode->vdisplay))
> +			break;
> +	}
> +
> +	igt_output_override_mode(output, mode);
> +	w1 = get_width(mode, d->sf_plane1);
> +	h1 = get_height(mode, d->sf_plane1);
> +	w2 = get_width(mode, d->sf_plane2);
> +        h2 = get_height(mode, d->sf_plane2);
>   
>   	n_planes = display->pipes[pipe].n_planes;
>   	igt_require(n_planes >= 2);
> @@ -1308,6 +1362,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> +							data.sf_plane1 = scaler_with_pixel_format_tests[index].sf;
>   
>   							test_scaler_with_pixel_format_pipe(&data,
>   								get_width(mode, scaler_with_pixel_format_tests[index].sf),
> @@ -1333,6 +1388,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> +							data.sf_plane1 = scaler_with_rotation_tests[index].sf;
>   
>   							test_scaler_with_rotation_pipe(&data,
>   								get_width(mode, scaler_with_rotation_tests[index].sf),
> @@ -1358,6 +1414,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> +							data.sf_plane1 = scaler_with_modifiers_tests[index].sf;
>   
>   							test_scaler_with_modifier_pipe(&data,
>   								get_width(mode, scaler_with_modifiers_tests[index].sf),
> @@ -1382,6 +1439,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.flag =true;
>   
>   						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
>   							mode->vdisplay + 100, false, pipe, output);
> @@ -1402,6 +1460,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.flag = true;
>   
>   						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
>   							mode->vdisplay + 100, false, pipe, output);
> @@ -1422,6 +1481,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.flag=true;
>   						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
>   							mode->vdisplay + 100, false, pipe, output);
>   					}
> @@ -1442,6 +1502,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.sf_plane1 = scaler_with_2_planes_tests[index].sf_plane1;
> +						data.sf_plane2 = scaler_with_2_planes_tests[index].sf_plane2;
>   
>   						test_planes_scaling_combo(&data,
>   							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),

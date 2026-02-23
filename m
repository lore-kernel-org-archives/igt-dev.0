Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F77EEA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 11:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E046210E158;
	Mon, 23 Feb 2026 11:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoUsCi8E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526C310E158
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771845372; x=1803381372;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mpj2LLg3fzyHZ1WCNqgiucf58khnSXN6NFt2FYbR0sg=;
 b=LoUsCi8ElPTuv7z0RBrNaYjFS7UKRdp2mesKan7xkdGWlu8wOeWjjsWk
 rkROha2gqThPusYxDJty0P6UED7DAP6OwuRsxMFDWLpxiAvV9Xul+Nmxl
 q3XG86pQoa+rvijayof4rdjIE+fEF6LTvwdWFA5yF68udOl5U4DcPF6TI
 qje+bScmpfZ/0jEJVGUfOWpABJPM6fHXrLBbqmqynEkfh7AsUHjmtONHM
 IDMBhh7jHBxFk++AVYz+//BcDYk7ioBTYmzmp1MI+QXfh5kECGMVF8Swp
 E3bUUubZUe6nSG2I6oy0f2/97B9qVT0yJbYwuQeyMbc8Thkfc5BtllYp0 g==;
X-CSE-ConnectionGUID: kzMFa/nkRieQI/APtdyl7Q==
X-CSE-MsgGUID: x5KyvU7YRReQJEV9LXlOtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72045970"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72045970"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:16:12 -0800
X-CSE-ConnectionGUID: Oh4rRB+eTVS+sYmKfGS9Aw==
X-CSE-MsgGUID: qKfX2qAoSwurm8ZmqTcPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219078178"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:16:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 03:16:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 03:16:11 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 03:16:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXcII3uNQ1XlNqub6nisKvnH9BqyNploiBJWUypVn9HDv57yIWKpepQm1V37k7b5JPZjQf4dj0nVPFyfrTpOTXMmOgCvqs1bolsy+vtWvuMBWNUT2lPL+GYdN3QAjr+JGnb1xOEyGc6PEyZDAIGd/f8XaFteEWAk7TphQGoz1wFWgWH7b3OUX9zJSBHDGb11dLGxaeVcN38yC+8m3qSSipE7nAV57CvLV10SON9bseiTvnPY2HnwyqlqulHhSYMEAC7bXLzfDfeiVnzhrLR4N1/xpiPg9G63Y1cvR+MpGlLhGqthIs9jJddN3AXUtSvuZcKJDYMDI6mVj+iee0bvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FXidtYlBYG2ITe5zbQaO92snUQGLOCG0Y3aHnXN3cU=;
 b=VaI5LaGiAXQLMwzkqPmLeUVqNi0uuVN4NUxk8/+0Q3WXWhSrGhS2O5kI/gOcj6PnjBJw1+ITDOXyRqso8TvhGtEzoxu+hISWrpS10QQJZbIvCnyrvZFDZHltMP59mPLq53jDFCMNUfipIsSptKEOkaHhSekDcsH+1jzcApELyHGGpG8AJnbfFZz2PDVv0k4wgvsoYFsqKA7C/VPN4a8DpGPLBnx4Ao+wO9+QxMKZ+w1wXLPUxPgy/NxOocrjV2HDVFYaX5ypm1AwNRKV/8wZk8zArb2Khb6AxQ/iUZ6rGxOAJdzkQELDbdnZ7zmp1xGjOjq40XFx+ZRG9szO6zvM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by DS7PR11MB7784.namprd11.prod.outlook.com (2603:10b6:8:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 11:16:08 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 11:16:08 +0000
Message-ID: <2c82ba5b-b38c-46eb-8956-710836fdbc85@intel.com>
Date: Mon, 23 Feb 2026 16:46:01 +0530
User-Agent: Mozilla Thunderbird
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t v5 1/4] tests/kms_flip: test suspend on one pair of
 pipes
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260213084930.252273-1-michal.grzelak@intel.com>
 <20260213084930.252273-2-michal.grzelak@intel.com>
Content-Language: en-GB
In-Reply-To: <20260213084930.252273-2-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::16) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|DS7PR11MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e4fd26-d80b-4bb3-95d5-08de72ccf186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUp3bDBSbmd3K0ovRExhRGU3Nkx0aTNQRjl2NmVZMjdDVFN0OUVvM2IvaW55?=
 =?utf-8?B?S29VbEhybUFtMU8xcnpFVjRRaEFpZTcrbVN5Q2Y2cFFxc3N2MVE3dVVZd1NC?=
 =?utf-8?B?dDlsalMxSkthdm4vMXdvaDhtWEU0NmpJWlAvS211WDg0VENmT0d3UWlvcUlL?=
 =?utf-8?B?eEJpTGNtTDg1VTJTbFljWitxaHFJVExzUlMxTVBHZTBoQkFNQ1BOQ2JaTFNk?=
 =?utf-8?B?M3IvK1diQlhXUEh4ZUNiUlVXdVZ0VlJPbVl2ZEd3OTcyVmdGUmlGNXlRU3Y5?=
 =?utf-8?B?SmZjcGdqcm1makRjOVg0STJaMGdlUk5YUkdsV21tSlYzeEx0QWwrKzFGWlZS?=
 =?utf-8?B?ZkNycFJwd1g4NzZwKzZVcmVSOHVvYk5tcFpJaFhlejBqRUE5N2FIR1hKNU5O?=
 =?utf-8?B?aElzMnZqZHMvU0pYSEU2NENaOW5NVzlhamxYeEY3L01iSUdKYTNHVHVOL0pz?=
 =?utf-8?B?ZjFyWW84S2FTbkhuTnh2YTc4dzQybUpyZGkwSHlQckdpQjF1Q2xGMjVLeDhY?=
 =?utf-8?B?bnVvRHRPaWVTWE0xMmQxU0N2U3RTdlRHOGRaZEtUZjFBNU5yWThtQWFZUXh3?=
 =?utf-8?B?ZEt5YjROaVU4Yk96eDZUR3p6bFQ3aHhyeERmL2EyaGxROXRtbTAwRGpQVmp0?=
 =?utf-8?B?WWZ4NHZHN0dac2dtRm13bGo1TmdhZ2t5L2xPOURpQnRra2huUDVjZHk3TnZW?=
 =?utf-8?B?Ri9ISnU1YXhKMFl5VkQ0RzZlc1QwR0d6Z2ZEMXNseVVBZ3VJNU5RMHVVV3pT?=
 =?utf-8?B?MkRnRjJmREJMZmNoVHJWNDlEY0d4QlV0OUhhTmQwVVFHTGdpc1JTS1VkMVJN?=
 =?utf-8?B?QUxFYVBkdm10cG5tOUV1VklKMXZ4M3NZZ1doYkZLeFZudnFhUkVPR0JNUnQw?=
 =?utf-8?B?M2p0ZTZJUWJSVThFaGd3OGZ6QjJHVXlRbks1UXZCSWxpNW5jNFV5Zm0rVkRO?=
 =?utf-8?B?dUQ4L056MmhrdG5sV0ZIamlhVXZ4ZVQ4V2VKeXhoc0dZeVBhNFphWmp2QWhl?=
 =?utf-8?B?QXZWcTlsU2MrdWhIOE5EZktJVlVNUmFpQXhjZHJLSzlWSXFZSEdwSFVDeTEy?=
 =?utf-8?B?eXp6R2lGUTRPckVwUUoxblhpSlB6L2ROdUV5b3FVUUR5clhQbTQ2eXgyRkhE?=
 =?utf-8?B?S3NqejNaM3pMQ2hYZGpHSFowNi8ySGU0UWlGZFVGdXJTMFpIcUZkYmtUOEkx?=
 =?utf-8?B?ZHpPUnZ1M2wxRk14SWwvTldJL01NbDlJL1NBVlNmb1MzZ04xMFBrSnpCZjRB?=
 =?utf-8?B?YTc0Tm05QU9WdjdGMDdwbVlSK29rNkpwWlk0bjRRcG9qWlg2U3ZYNzY1eEpL?=
 =?utf-8?B?cjI4N0dzR2VqM1Byd1NORTVSUWlEQkQ3R2R1cVJUdjN4MjlxT0ZjR0lmSzFp?=
 =?utf-8?B?RUZCUzZzYVZ6T1Z0RzViOTN6NUxmU1RsNzFlSUdLdTFSWldCSW0xTzFqZjA4?=
 =?utf-8?B?em5KcUl0eVE4OWc4TXAyS0hkbHRiOWJ2WlBzYlQ5cVJXZW1YT1FIaE9Qbjhr?=
 =?utf-8?B?YmZiY0xvbWVSQzZzeDFMY1p1Rmh0WDZLc0lQZ2JXMjdzRTNBcldXRlR0UmF2?=
 =?utf-8?B?UG9jMTJhZDRWaUFtcnRKUFZENTd6QmFPcXRsQlJSSGZ3ZDBra25WWGVKODBr?=
 =?utf-8?B?ZSsva01sN01QUzdDTWVVd2traE5rTGxIWkljV0Z4SnV2L3llSFNtUkRSbVZ5?=
 =?utf-8?B?ZjltYUZ1dnBueS9QZzNRaGEwNlVVemFTYmRFVTg1Y1hScVp6RzVPWWZrdzRu?=
 =?utf-8?B?QndPU2NuOHRTRlJFYU5mQzJDU0RYNzVwY3o3Tms0QzVBaUZrMERGZGJmandP?=
 =?utf-8?B?N1dVcmE3eDl1S0NWaVJzNEtIVXRieTZMRnNRancrRDRLVUhBR3FBeDNVdWxS?=
 =?utf-8?B?TmprMERrcitvN2QycC9qTWM4VGpLTGhHSlQ3OFkrSW9GS2t3OU9oZFN2eTFD?=
 =?utf-8?B?OUVPUUluWFVza2VSSkZkZ3JoVUluU2ZIeGU0OFBrdEZocHdvMlA0VnFQMytR?=
 =?utf-8?B?WGNvdWJNWEtOemVXNjRiUTBhSXErbUNBeTFtVU1reUtkY2lFQnBtckR1YWNL?=
 =?utf-8?B?anNJVVVxMDNQSzhNaUZ2L0NFb3NjOGtaYVpISklINWVZRTRBRzFOTW54UGw4?=
 =?utf-8?Q?dOsw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHZXbk4ydjZSTEcxZ1Q2TnI2Z29wUExMTzJvYVpkYlU5ekdGREI4OWdlWjBV?=
 =?utf-8?B?ZlVWN3FWUTVJbE5JQ2N4ckEyN1JneWNJekJrdDNyTkU0ak9qV1FEQnRmY3VD?=
 =?utf-8?B?eUxFZ2R0RStOK2tGaUt0NXB4WHZ2R3RnQS91dmc5TU1PclVLYTZwdGZ5Q1hw?=
 =?utf-8?B?L0ZmNG4xaXBZNk1mRSs3S01DaDhkOUIxYXBtTUlPTE9lL1hYRW5KYXN5TjBF?=
 =?utf-8?B?UUdQclZKdlRaNzZhTVg1cm9McHA5VjhpVXVPbDM3RWx0WmZEditMcHNWNXZv?=
 =?utf-8?B?L1E3bEpydGJOV0NoWDRZcm1GVXZIS1pQM3hSamxJUCtEK091R1JvWE1qakNZ?=
 =?utf-8?B?ZXFnN0YwSWtlQ0djQmFTbzl4by8ydnJFQjBOd2l1VVdZSVBkNTRockZYQ2k1?=
 =?utf-8?B?MkdzQlRrL0JZcFhpU0RvN01Ea3VoeE95d3NIK2lCNFovbTNjemVWaWtSdEpo?=
 =?utf-8?B?TVhUODN4TzNqbXk3Ni9QSjd1Sk1SSHZMNFhhd3dqQXdSU2hlaTIzOHZOVUlD?=
 =?utf-8?B?djlRa05sQXR3ZGxWUWp1clNoR2MvNHBydExCYUYzTTB3SU1KbGQ4aW1kekdv?=
 =?utf-8?B?U1N1ckhaa0hlS2hiNyt6K1J0UGtCSDJwZjF4Tk9jcHdVZVFzU05hdHN5clla?=
 =?utf-8?B?RitmYWF1YW90WS83cExFMFdsa2hsNXlpR2IxaU41R3BzMXpWTDFYTFVKSzdZ?=
 =?utf-8?B?OWFQTmpVeXAwZDZ3aGwwdjFpdUM3TnlOaEc3K2QrMDZEcDRzVlhIRnRpZkE2?=
 =?utf-8?B?TGltVVZCMmFydXhWWmtPUExlVzBnaDVzaXV2MmhRNWJ2cE15OE16eFJGc1FO?=
 =?utf-8?B?S2d4WnhuNUVJOUQraXhxQktwUjlSOS9QOVlUTDdRZkVIVmc3d2tJd1B3Uk1Y?=
 =?utf-8?B?c0draFFSZ3FkMXRPK0VOUCtIS2h3TDVMdld2eE5QZGhiK0hLclU3eVlqazVR?=
 =?utf-8?B?NTZjaWZRTTFYQzhtNU1USVlRS05GS0NPd0ZMUGpjMThFOE1zcVNXQlZNZzRP?=
 =?utf-8?B?TmZzdzB5WUxwb0R0K1k3SGN2SitHL1dMRzVsenYrME5HV1c5ZzlMWFk1bDdX?=
 =?utf-8?B?ck9zczZsbWdBaUplR3JUQUttbVVXR2pac3hKdTRkcVZVQmltaUZudmJwQnh2?=
 =?utf-8?B?TUFnUG12V2lBK1NoNkEzNWtFMjBjOTRiamZBM1lUZUd0NmRRTWRvMWkvZGx3?=
 =?utf-8?B?WnBtcWFmNSt6L016S3BreDhqeUE5bE9OVFRZSUpzVkpFK1p2VTRZVlJMSUhV?=
 =?utf-8?B?dFUxbzlQa0JYUnh2aFJwUGtSQ3NqSzZhQWxqWURBNjgyVGo3SFpjQktUcElj?=
 =?utf-8?B?RlNVMjIyZ0huQlB1aHBFRnRuM1JNQVV3REhwTWZZS2prcGRpeFdJaU93d0pC?=
 =?utf-8?B?K3NDL09HSDlQeS9SQzN4RGdnR0plRU5aQW11VVAvck5YanJyVHR0RStza01J?=
 =?utf-8?B?c1luT3VRaEdDaE5hZHBJNzRLNWVTZlZEYjFRRm01UUhObDE2UlJ3MWFhSktq?=
 =?utf-8?B?T2FPUlVKVnovUWdhcEEybGVmZUljZ292cmhaTzhDTnBOVUlTNzVwYiszNnYv?=
 =?utf-8?B?Uk9ucDFwYXpZaTVMUFkzMmxyb2gyNlJYbWlOOWJaK3RlbERaMitoUDZBU3ND?=
 =?utf-8?B?L2lzQmxJak9DajllY0podURYTml3aHZtelgya0NvQlBFdmZFSFJwUjhDRXpH?=
 =?utf-8?B?ZTNvUmg5V0d2RGw1bkJNMUVhaktvNWxndDRhamhITmtoRnZ1emxqMkIrNExj?=
 =?utf-8?B?MytvT0RBUnBJK0JFYnlUb2YwREl4SWdnK1ZOMklZM3N0QzdFQ2xqb3VUU054?=
 =?utf-8?B?ZlpFOTFucFVyK1F0V21KNG56MWpPc0puSWJkWEJvL2ZVSjBqcEJjUXJpdEdK?=
 =?utf-8?B?WExjUXZJOWtteUdTZHNUWTh5YWRoV1JMSkMyRVQ4eWZhNm5iQlVEWUs3V0lj?=
 =?utf-8?B?bG9iN2hpdWErdXZKMVgvYWZDR3NPK2pzWUdRbmtDNTZIbG8zZ0QvbTYzcWJT?=
 =?utf-8?B?OW9PWjgrVzU0OS9MWFNCVW53ZEFUY0lrVDBLbXZmTm9NUVNSbCtBMHR5aWN4?=
 =?utf-8?B?VVBBcEt1L0FHN0ZuODRoNHdIdTFpbHlvMTkrSEhCMVFVL3RGWFZzQkh5aU80?=
 =?utf-8?B?S0N4NnIvdFZNbDU3S1NSTklDeXJCU3l6NThwRTdkNEpYRVhMZmxDSExMZlpv?=
 =?utf-8?B?RUJaeXgzUFZtMXBQeFJnaWtxSjF5VjhpbnBpME53S0M1Z3dZOXVCbkM5TVNZ?=
 =?utf-8?B?ZUZuZFI1N3FGdUhnMHl1YVhrVXE5WXdDZGNpMmUrRGdiSkdLczRBNlhOcHBk?=
 =?utf-8?B?eDN2MDFiMGhsNHB0ZCtOdlBSbWtpMUlwSFBOemN3dzFNSUk0bFhBdFpzY3M2?=
 =?utf-8?Q?QaAFzncr3EiFXY0Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e4fd26-d80b-4bb3-95d5-08de72ccf186
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 11:16:08.7904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH5E9LiPHDLYbo2XNwRND2UcTml+evJ68XhUIXWZ57R3GyqJHwq4bGwoeALUmQphDONOzmCMW9nZfF6XFi9kYFWTmmk66/L6O52Q51n7brk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7784
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


On 13-02-2026 02:19 pm, Michał Grzelak wrote:
> Currently, every pair of ({pipe1, pipe2}, {output1, output2}) is being
> tested in 2x-* subtests. Since suspend shouldn't be tested per pipe, it
> causes unnecessary overhead: with 4 pipes & 4 displays it runs up to 36
> tests. Given that each suspend's dynamic subtest can take up to tens of
> seconds, total duration of the test easily exceeds timeout.
>
> When testing suspend, for each pair of outputs test only first and last
> pipe unless it is said to run on all pipes.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/kms_flip.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 49a5f4ed1..8bda82627 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1918,6 +1918,12 @@ static void run_pair(int duration, int flags)
>   		for (n = 0; n < resources->count_crtcs; n++) {
>   			for (j = i + 1; j < resources->count_connectors; j++) {
>   				for (m = n + 1; m < resources->count_crtcs; m++) {
> +					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
> +					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
> +					    ((n != 0 && n != resources->count_crtcs) ||
-->looks like needed to crrect n boundary check from count_crtcs to 
count_crtcs-1 to match loop range, plese check it..
> +					    m != resources->count_crtcs - 1))
> +						continue;
> +
>   					memset(&o, 0, sizeof(o));
>   					o.count = 2;
>   					o._connector[0] = resources->connectors[i];
> @@ -1963,8 +1969,8 @@ static void run_pair(int duration, int flags)
>   					crtc_idxs[0] = n;
>   					crtc_idxs[1] = m;
>   
> -					/* Limit the execution to 2 CRTCs (first & last) for hang tests */
> -					if ((flags & TEST_HANG) && !all_crtcs &&
> +					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
> +					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
>   					    ((n != 0 && n != resources->count_crtcs) || 
-->here aswell..
>   					    m != resources->count_crtcs - 1))
>   						continue;

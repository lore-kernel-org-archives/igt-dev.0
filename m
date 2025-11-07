Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FCECCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 11:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED39110EA87;
	Fri,  7 Nov 2025 11:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJ1zIhpP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E74210EA87
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762513662; x=1794049662;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ghUutVRkKk8q+p8qm1y3xEUuHTtPB4uLV6jwXNtfaMA=;
 b=AJ1zIhpPWjBGT0kZaQZ6KgHZjyuRHMBAVUYWBRxh8NY7uXxflwX3Bu/x
 n8ZL78jCMA/GfL0lEI/fewi+j0KDo0Gy94n6U88Q+RagGKKiHWWHXCnfa
 0Ts47zYATZkT/aM5CWgMRoQf2A8MUq79y8yW5p+n0RH4dCuNUl8tpmmVL
 +EKUDpl1wkF6kJBHPSZyrDZWCG/edu37aYuV3Qp9aCNZeLUb1i12nHymL
 a8zK4aH3TyWf9Ji0KUOdQv5oro2ESjMc8FuuvsQHnTBE+js8V0Q5BQzC8
 XljReKvxCPxVLzAPdYelIEoK22/dQv3ZYPWz09nwt2brxm08Pz5ywAcVu Q==;
X-CSE-ConnectionGUID: tzB7WXN5RrKfGmE3sqLH2w==
X-CSE-MsgGUID: egmB+jW/SY2QaV0XWEcCRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75353410"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="75353410"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:07:42 -0800
X-CSE-ConnectionGUID: mdslJQxcT2egrhOSgVmyoA==
X-CSE-MsgGUID: vXbfR8AgTx2t/7sN5AwRNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="188734061"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:07:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 03:07:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 03:07:41 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 03:07:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqBLJMlfAsPrHcGdoplFnx77PsF2416gMlRmCs2DTdiayMa0yoSEg0KbWX3TRrM5GXeeyPB3RYYrxAwWOTw+nSG1ybYkty7YaNYVjHidFc0d0kLmPy3uz+FWn3ptPGUUm7Ufyrk6RV8/LGIUps3e44VygwKPIjfROtl2f9vLWPc8QB0g/g2wWEiILMAzy1OoP7qs8CjTTpDnKYzfAuYUR84n/dMSEa4hBtW/6e2+IcRHM8yL1YBvC4DRkLN0MsSn4q5GF3hijEai6fTLsmU3IX3cFW0sgafeE2RdprlFfmXKEasVXhdFgTgqhN/ieb6I3jExOJp+udxrmNt2uzkr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmiB0/X4gH1FrjHbHaWPtZ6ejzbRPGsWab9mIQJmEHU=;
 b=PH8vu3AuJazdpQl0k59rQNoO6FvyDXiMnR8NCXpeoIZkHjuH9EbDPiONXcUjLTicju4lsTSnFWoUdIeWUGwZPOt43OdU6gXhKcbB1DgVeFYohbP+lMqwcrR0lyj5lH2xsWgCXTaBIBdJMYylCRNPLwJ2+VwWUjoNwuYYyAf0jeA7vStRz3rv1ayxusQEM0vY3PDn3++RJjFlNq366r63JeDVWUe62oVGqlvmzK+N6MtgtU0mYgGs7grubn5WC+RlOBQbCJEhG2d3H9BttM7p2ktn91zQwMMjb7ZIEcybY/fcfsRZMfaERhjaviGV4iFlKvMIY6g55f83/9HD1A16+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.13; Fri, 7 Nov 2025 11:07:26 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%5]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 11:07:26 +0000
Message-ID: <14a45301-1e9d-4887-8939-07222239b766@intel.com>
Date: Fri, 7 Nov 2025 16:37:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/3] lib: Add NVL-S support
To: <igt-dev@lists.freedesktop.org>
References: <20251106153419.1741989-1-shekhar.chauhan@intel.com>
 <20251106153419.1741989-2-shekhar.chauhan@intel.com>
 <20251107003741.GF3905809@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20251107003741.GF3905809@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::16) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|DM4PR11MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb30325-1a11-46bc-c6b6-08de1dedd543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmlHK04yLzd3VU1UNUdPM0p2QnAxa3ZsZ2lQTGVuMm9qNzF1MVNIeDh0NERL?=
 =?utf-8?B?T1l0QmNQS1JHcldTTTVTZFZDRzI3RndSRHRBTGVzUUZnbHdmWElya2tYSlpK?=
 =?utf-8?B?VDJ6VW54SEJxRFJLTUI3RWc0SWEwOXVnTW9VMDk0RGtYZE9VajI2dnUrMHpq?=
 =?utf-8?B?VEdNaERVMi9iOENPY2YxQzd3dnFkWkwvVXRnMVVxUmo4bnpSdTlqN2lwN0Q0?=
 =?utf-8?B?ZGNuR0M0VEJHdHNoVFZGTVlmdmhEVWZaZlV1UWxHM1BnVHVoaVd3V2d6cWl6?=
 =?utf-8?B?VzJYY0lnWkFyZUs3TnEwY205aFp1R0NOQjlYUCtCdUU0Mk1oTU5EWXNROEw1?=
 =?utf-8?B?VEx6aWg1MzF4a00zelZqcXcvb3BJcVprbWNhcCtSRE1zNjRuTWJKU202R2hT?=
 =?utf-8?B?MGVoMHFSb2dOYnlpQWNxQzZUNnB2UlF3aWNrUDVNUHE3SXd5TkJ2emFySjlq?=
 =?utf-8?B?NUFHcTdWbUVWdTRWTllPeWtsS1FnUlFyYllRMG1qcGlMeWRoUllQdDRySFl0?=
 =?utf-8?B?WERBeGpvRHhiRG9Dc2txNUUreDBaU1BraWV1aXJydkJ1ZHhmUXZRQTFIL2Y5?=
 =?utf-8?B?Z0lnK0hYOVVLZWNiajc2dStwNVdkTFJBV1NCV3RkbStEL2hsdlMyU0hVR3NV?=
 =?utf-8?B?ck9WMkhlWndLcllPREVqZkdtZU9YT051Q2tmRTZURGUxSWtQL2lFMTNpWk9P?=
 =?utf-8?B?UlBLM1FNY1A1Q0NGaFJmQ0JSejZHNzMzNEJJbHZOZjVpNFEvQndJQ3Vsdlcz?=
 =?utf-8?B?K0VMaHYwcGVkSER2SjZPdEdzcDJkRFNxcWM3Y2RaR21JQjhMRmZ2d1JSamJG?=
 =?utf-8?B?bW5RRDlRaHdjQnExY0pza0lDSWovTEJmazRlTTV5azlPeXpON2RTeGYveUFR?=
 =?utf-8?B?ZmVFTGtVcHdYRFVpTm1nYTBRT1RtNnoxSzhsVlRyMnFGSDRUWWZvTFUwZnZF?=
 =?utf-8?B?djkzZVVXQTRkSGFkNXBSNGlXTEdNckpDbTVFRmJ6Tko2Sk9VWEFSLy9ZNDN1?=
 =?utf-8?B?Wk5CTmhmRGZuaXFlS2UyVTZaWmsyREhGZkRGd2RCb1NEeEs2TW5IUFc1MXlQ?=
 =?utf-8?B?WXRMSVN2cWVrN3FOenRyT3JQdllQSm1vbjVJNW9pQ0FjUzAyRS9hVkJQV0Ri?=
 =?utf-8?B?MllLQUNEcWhUeVRkbTljckdvZitjU3JZZzQ0bGI3WG5aOHJ2cFB6SDQ3c090?=
 =?utf-8?B?QXNuemVMK05yZldyOE1JSm9VN3RlZmJoUWJOYjZMSmVINGtCcTdBVGNOOExL?=
 =?utf-8?B?RDc1V3ROeVRBYko3SUMwcHU2QiszKyt4WTd1WUhFdFdhdjkwUHVCeVhtNVJG?=
 =?utf-8?B?TDZUTzRyV3N1S3M1a2VUVEFKOWtHaU1nR2g1MTlZeCtlT085RUVndmpVSFBm?=
 =?utf-8?B?SVpjaUtSUnRSUk1xNGE0TkZIcXM1YXlqQ2NmZzY5Tm5EV0FGc3lRMVB5NUhD?=
 =?utf-8?B?ZC9xOHNGTHIrMFdmVGloV3oyVUE2RkMyMUx6U2NPelpCTFUxMDFOVXhZTmZn?=
 =?utf-8?B?dzJaSU5FOFVnVkM3K2FudzVwdUh2OEFrNGs5dzM2SkdTcGdPeXNMSzU2YmFN?=
 =?utf-8?B?RFRyQkJwQ3p3Z1c4R2tBSVk3eWxwZ0RWL0lVMndqbWdzRGN6bXJWSm05dGdw?=
 =?utf-8?B?blQwZkNieW80Nk9vY3lhODJUalNJSHFIRkZxT0wvYjFQVTJNanIxMWZiWmhD?=
 =?utf-8?B?aHdJS3hzQVNVNXYzWHZCS0t0SCtBdnd2UmhaK0JwL0llQm9VRS84M1RyUjll?=
 =?utf-8?B?dE9iVXlvZFZNRmJabVREbXZVbjVGNzFSV2hOa1JrSzdCeEgxSEttUnAvdEk3?=
 =?utf-8?B?aUV3cGRuTTRYc3V4My95MkV1Nm95UEFSdHhORFNhRGtlaVM2VVRteTk3Q1Fy?=
 =?utf-8?B?VWt5U0xRcENUcTZNQStjMVVXU01KdjNMZ1ovb3N3WG01a2VmNmVFS2NQSTlx?=
 =?utf-8?Q?pdawy1gjbrTEP+Tz0PqLiVnMUu/XtgF/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djVHR0RDNnUzZDUrenQ1YWp6MkdmQk1TOWxLdS9MM25wL2ZBaDUxRVVaZ2d1?=
 =?utf-8?B?d2xTWlc2UUM4TUJiNXJuaG5OZTBxc3hUSkZOTFdwK1plTllSRmhSQ0JZM0RS?=
 =?utf-8?B?RnJsRFNZV09ta2VwTUtQZ2Z2QUpvYWR4R0QyMlNXYXRzTVBSZzRLU2dSM2FW?=
 =?utf-8?B?akR5cnJtRzh5dUh0RCtUT25PYVVDSUFlMDE3M3E5ZGczTWdMTFhWM2UvcWts?=
 =?utf-8?B?eW9CTktNdzBmSGRNV053MDdYTXM4R0kzNzBrZmZ5KzluZXBGT2ZEQ0JRZ1Rh?=
 =?utf-8?B?dS9hNi90SlF2TFg0QlZ0ZkpidG95ekZ1NlBJa3lnSjE5RlUrL3gyaGwvd1NK?=
 =?utf-8?B?cTJFWjJXTnBENWhVMkQ2NS90aXhYcTRKalgvcUUvYk9WenhET2ZmM05hSzkz?=
 =?utf-8?B?NXNmK2xQMG1OWGVOT1lQMFl3V2s1M1pGV3FnQ1kwYXlhNC94RHZWQnNOUTBR?=
 =?utf-8?B?U2ttb2RHNmgyUzgyaG5FNlltc0wxaWpuWUorRzhrVld1K0xFR082Z3h2S2Nh?=
 =?utf-8?B?VHdoZ29yWXdWbTVXZVM4STh0QWdQM0tLQm9xUFhuRkxuTXRPeEkxZmRoNEhi?=
 =?utf-8?B?OEptUDRiV3BTdlM5bkxqWU11cmRKeW1CNzY2cTVHNTVQVHdYaTFMVGJjSUR5?=
 =?utf-8?B?UjBWOHB4b21JRHo2aklDZU5JSENXMjdOT1JRRzE0eVlLVUxNWHhSMllmT2VE?=
 =?utf-8?B?MHo1T0taZFA5TlpqWi93bFhaVTU2bUhtTGxhYUc5WkEzaDNNdXVqRzRXdElq?=
 =?utf-8?B?b05TbkJxUVJKMmhXVUpYaHFwQnVEUFIvdmwrRUlXOGsvY0tGYmo3cmZla2lw?=
 =?utf-8?B?ZlZtalRJdTA3OFFiQmM2eVIzZnRwU3RsYWxzTmhiTWQ5eFl2OGNzbkxvR1l6?=
 =?utf-8?B?UDlaZE9ZVTRvNmhxa045SjBYMHhYMWdLallCNG1hM0pSclJmRlkxS0tyU0Zh?=
 =?utf-8?B?alMwbVo5ZC84S1pIU0hpei8vbFFSSDFPMmpBazVDeG4xemRhcmZHZFZ5S05h?=
 =?utf-8?B?WnBKWElwRVM4OUkwZlk0ZUc0djh1VlIrYlNMaStyMlE4YVVNRmp6OGJQdGRv?=
 =?utf-8?B?em42ak5NbVF4VnJMZTRGZ1YzWXBiTFFRa1g0VExiWWMvYVRGd0FoMU5ScGZJ?=
 =?utf-8?B?S0xRUncrSmY2NTlhSzNMbWtySjd5SHB2VjNNMVVzY1lRazRmVXBaSWZaTkpZ?=
 =?utf-8?B?MmIwek9YS1hOWUlhYVNnUHZwUjJJUWVOTDJWbGE3Z0pOaDcwUmlRd2VFSU9J?=
 =?utf-8?B?bFdWS3NpcGtVazNHazhWbVI2SXNmcEZoc3NXTnFnRWh1S3RHSTg3Um9SS2Qr?=
 =?utf-8?B?U2JTVTZEcFdKQyszZzEzM3Z4UTY3dnB3bGNBVnpoTE9idmNKVlUvaWVWWWx6?=
 =?utf-8?B?aHkwRHh6WFVoZ1hsV0FlMUJpZ3dNRHpNMzdvZ3hVRHBqc3ZFa3FFQS8vaVhT?=
 =?utf-8?B?eStIK2NaTFlsWjJ5QkxtL1M2UkhRdG85eWRrWVJKd3cwTUZZRFlOR3RDZ0ps?=
 =?utf-8?B?alNQV05mYXcrczR1cXJBbldOQ04wNnEvcXJhRnRHTGppR3VnMlczbHZ2bGJH?=
 =?utf-8?B?OVRCTzlQOVhQbWdBeERrakZpUTJSYWNtdzFDamJZNGFDeW4zaGZTWXBHak1N?=
 =?utf-8?B?dEt1QzdRYTdtUW5PYU9oRkZKSEhsRHNYZWNwbFJvNy9YRUQ4dkU5dEJ5Rk5l?=
 =?utf-8?B?NFJBNWFWWnpJVEN4VUEyUml3SVhLSUNRMkhEaFNzSTdJTlBET3BOKytqNk9H?=
 =?utf-8?B?ZmxWdzZ1UTc4WTFMaTBjWWtFRC9pS29CUGNhUWxKNC9zUG5JMGpKeEpjandT?=
 =?utf-8?B?QlNKV1NhNHZDWmRHT2JoTTEwdUk5Z3ErMDArWTZBUFlFK1lNc285ZFZYaktL?=
 =?utf-8?B?Y2FPL2FRZHdIVXVSVTBpUkRmdW1vcG9NN3EvcUhRRjlBem5SRkZ1TnV0Ui9Z?=
 =?utf-8?B?SXpya09LM0hsOURRamZIdVRRTWdnK0l4U2lUWWhoWnFmYVVzTXBydDZTV1U4?=
 =?utf-8?B?RUdnVFdlRUs0Smh5MURFSTkwRkh4MXBVTFVaYjdOczFxczBiamViNHpTbHdI?=
 =?utf-8?B?MVFvVElZUDd1SDdJU2NPZ1p1UDlaS2NXSUtUVjZ6OFZvSHBERjJrS1VIMm55?=
 =?utf-8?B?NGVaMGhtWXpselhZdDBiUS9QSWkxbTRQMjJFQ1hnNDl6ZHFSS09mNWlxWU5v?=
 =?utf-8?Q?1TPAehB6Q+KjlnqBEHP1Vlk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb30325-1a11-46bc-c6b6-08de1dedd543
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:07:26.0798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNU4cXCpy8RmZ6mPpORdO0PXmEQe7Xf3Mr37SlscBaB6KkO6Gle6bNfW1por5ghVMD63kjw8+G0oH5IDUvaymNMaM6+hW85UDZB77NOARTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
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



On 11/7/2025 6:07 AM, Matt Roper wrote:
> On Thu, Nov 06, 2025 at 09:04:17PM +0530, Shekhar Chauhan wrote:
>> Add NVL-S device info.
>>
>> v2: Fix indentation/spacing for PantherLake and Novalake in
>> lib/intel_chipset.h (Kamil)
>>
>> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> ---
>>   lib/intel_chipset.h     |  4 +++-
>>   lib/intel_device_info.c | 12 ++++++++++++
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>> index 2f6bf788a..70ea78464 100644
>> --- a/lib/intel_chipset.h
>> +++ b/lib/intel_chipset.h
>> @@ -93,6 +93,7 @@ struct intel_device_info {
>>   	bool is_lunarlake : 1;
>>   	bool is_battlemage : 1;
>>   	bool is_pantherlake : 1;
>> +	bool is_novalake: 1;
>>   
>>   	const struct intel_cmds_info *cmds_info;
>>   	const char *codename;
>> @@ -209,7 +210,8 @@ void intel_check_pch(void);
>>   #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
>>   #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
>>   #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>> -#define IS_PANTHERLAKE(devid)  (intel_get_device_info(devid)->is_pantherlake)
>> +#define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
>> +#define IS_NOVALAKE(devid)	(intel_get_device_info(devid)->is_novalake)
>>   
>>   #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>>   
>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>> index a853f9ab4..fe452d50f 100644
>> --- a/lib/intel_device_info.c
>> +++ b/lib/intel_device_info.c
>> @@ -539,6 +539,16 @@ static const struct intel_device_info intel_pantherlake_info = {
>>   	.cmds_info = &xe2_cmds_info,
>>   };
>>   
>> +static const struct intel_device_info intel_novalake_info = {
>> +	.graphics_ver = 30,
>> +	.graphics_rel = 04,
> It's not great that we keep on adding graphics version and release
> numbers in IGT for new platforms.  That was supposed to stop with MTL,
> but we keep making exceptions for "one more platform until we get around
> to doing the cleanup."
>
> I know Xin, Ravi, and possibly other people have been working on the
> necessary cleanup to get proper version numbers without ugly hacks like
> this.  Is there any chance that some of their work can land soon so that
> we can handle versioning properly?
>
>
> Matt
Myself and Wang, X are working on it, by next week we will try to 
complete it,
Instead of waiting for this patch  shekhar can submit his patch, we will 
submit our
patch on top on it.

Regards,
Ravi Kumar
>> +	.display_ver = 35,
>> +	.has_4tile = true,
>> +	.is_novalake = true,
>> +	.codename = "novalake",
>> +	.cmds_info = &xe2_cmds_info,
>> +};
>> +
>>   #define INTEL_PCI_ID_INIT(_id, _info) { \
>>   	.vendor_id = 0x8086, .device_id = (_id), \
>>   	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
>> @@ -657,6 +667,8 @@ static const struct pci_id_match intel_device_match[] = {
>>   
>>   	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
>>   
>> +	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
>> +
>>   	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>>   };
>>   
>> -- 
>> 2.51.1
>>


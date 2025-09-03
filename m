Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3367DCA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 14:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2CD10E8AC;
	Wed,  3 Sep 2025 14:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+sQteUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E4F10E8AC
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756908702; x=1788444702;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EkuAwRMpJTX9tAP1nbbuupPh7cyjUsOdI8AWeMy+97Q=;
 b=O+sQteUawOHp2B070rk8lm8cpwS3Z24QMd+B27agLgMDfLn1OVPXJUBz
 4fo6RdgCj/qGnc/wqFaH7Ilz9VGifwPOg2GDgfWrVMKKYzN+Ay6Yi6ICO
 qJSIDK57fM22KHxJIUH8FTdoWqJlQqGQns1nd2LUuwRr8I9Uy8UHcWlFe
 iC2fbzh/sd6hM9qbBiWwiM+Feivu3HBqvxWh1BShz+k9XXdpzNn4bc0yj
 7WIQi9jecdn7rAm6Q04gssXKvsltNr3gCaY7Cl8d9Fa/BWP3lLP+kDspm
 84K8V1MDldlSe5lkXg3NygPptV8QRc5R8a86w7yaSoKpMb6FuFIH39T3p w==;
X-CSE-ConnectionGUID: noN9EEOwRlGGUfZ9hU7R0g==
X-CSE-MsgGUID: B/7L1Z9bTuCmPxtVj5EHXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="84651457"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="84651457"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:11:42 -0700
X-CSE-ConnectionGUID: T3zr3aG/R0iiOha+3o7rkQ==
X-CSE-MsgGUID: XfmjKaXHSgC6E0tC34lMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171481293"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:11:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:11:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 07:11:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpZ6klPws7hSXA7p5CAEef5IYHmAkBDUmbNXflRnUlz5+ZDhwgZobnHwKWmNMSV7s6/a9XVXy5bZISiDUO8vpChDZMb09tmorh08bHJIujo7Dim8zKIhZQpuI/CBnCb3GKINU4h9acAmB7KC3P0zLmlilTq84QuwrOqBhM5B5/hHSAEkiGed9RgHa+HfEAXDQg9kzZPRm5f4g7KWNB0puHZz4PRxCsBaFHWZcmYW6uJyITkZvnjgAG+UwdwsEPnAQ0kDwpPa3V9Qhg/H2F7dwTaUPJFmRoaYPMMD0ieoMsr/L5QtQVaTD2DzEturbhkmQjf5tdVX1820w6OTwk6B9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfRsvYmkuKVZ4XXwpo74o9p9oSqzhwO0OVHKknP6PqQ=;
 b=J1N9OgEEsWnk4qjRNAOyUH/ULtMWJTpyVC1WxchJC1Gi5Pel6w+sAOLXXpcc4aKc6tGDwoC2Ffi2tSRSC5bc2Yj9aDdKn+kDGw/crAQjI+6PfPJEWlYtM27eukNdB6VoFPs7cv1eeNri2yQQ9p/GmvNAMDedvQsPDLXZc/LGKU96QcBfhnuyHKnqJb//D0W6Gve4+i7Na12WSLkDCepIjghNEFv+RTFq9cZZO3KwMrIm3DQv9RP9DDyc4pKKbyTBErJi7c+AND9+BUCGFB89sGNCg9GVmEt3GNwmibPbb8jN3US5t2nVBh9RUVEjFrcjCdkmDkGUdjRbIsrioh1owg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 14:11:33 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 14:11:31 +0000
Message-ID: <00802a7b-d936-416d-aa58-19d7d40fcd2c@intel.com>
Date: Wed, 3 Sep 2025 19:41:25 +0530
User-Agent: Mozilla Thunderbird
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH V10 02/30] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-3-alex.hung@amd.com>
Content-Language: en-GB
In-Reply-To: <20250815040659.3321102-3-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b6488a-9478-487a-52de-08ddeaf3c838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0ZUb2oyU0FLZ1pUdlFFQmI1SHdEVE55NllXSWFOd1UwVitydW1rVWltVjlB?=
 =?utf-8?B?RkFSWDFiRDdYQXZoOThiLzZBd2xjL0RpUCswSGpYS0MyYityMGdWNDh4WVVR?=
 =?utf-8?B?ajF5L1U2YWZUSWhFendIL3VCZmwraGx1aVVFMmI0clFicDVZd1g3OEpBUWRr?=
 =?utf-8?B?MHUrY3FvWnk2MjdGZWJZK2w1aVBMY01uUEFZeVE0bW93Z1pYRUNOTCt4VkVS?=
 =?utf-8?B?NVJld1A1VXkzRWJxQk4vVmFJS25Lc1lOSFBMdy9iU1hDWEVUYUtFT1V0WEo5?=
 =?utf-8?B?ZDFqZDQvbm9UZ0h5aGRUSy9YbGRsR1lLRnoyZ0UvdDhZcW5IRmNCQ2RDUDF4?=
 =?utf-8?B?eWIwTVZoMlpKN29YNXRnMEdyVENiVm95dDlCc0x1bHgwTG9KRC9kZ0oyVnor?=
 =?utf-8?B?UGN2ZUxRbitzRDY1U0hJWURab0psSjIraTkxV014elRta3pGbHV0c3JydkQy?=
 =?utf-8?B?SjZ2cGk1bE9QUk1RK3ByTHNLMzNBNzNoWjFrUzBHMGQ2VkdZeGYwcnZrTjE4?=
 =?utf-8?B?TldpVEJGb1JBaEN5VDdVMy9zNmlSNktXdmY0azd6bVpFMElXTXl2c2FLQ2ZN?=
 =?utf-8?B?ZVVYNUJoUkhZVGxtL0l0NzdWNE9oaFZOSlN0UFJEYmtwZXFVMThOZ1hoYzMz?=
 =?utf-8?B?OVNQSk5ORUtQeDFDRGJhVjAxRmg4V2FwdmJVbDh2MFZScGdjQ21YM0toZUdt?=
 =?utf-8?B?NGFpcGg2bDF3YTdUUTQ3SUdZVGFkdVVlKzNTTDdpSmdXclhFc25ZT2huVGhX?=
 =?utf-8?B?aHRYWVdMYjlvUFppWXJNcnoxQ2dXWWZxVFEwSVMrMU9rNjRVbVRZbEJ0NVl1?=
 =?utf-8?B?RmpGSGEvdjZ0a2VmQWNUSkZNSnF4N1Z2S3JyT1lEOXlqTjhVbDJWdjNoN2Vz?=
 =?utf-8?B?NWhUd21YKzF5cWlic2lzYm5rK2tMREZLQ3YrclRML3cwWmJZU2lwSGNLMVFM?=
 =?utf-8?B?eU9XK1R0TFJ4Rm1heTNka05ZSDRRRHk3dGFBUVgyRGp0d0psWGlRdDJwckZh?=
 =?utf-8?B?U25rbys1SURZUmljVWNJOUlYQnNPU2FZbnhodXQ2b3B6S0F5V1dhN3E5NHo5?=
 =?utf-8?B?SVcvNUFDZ044cnZxZmRHY3dHOUdwTFpRTUs0Y0JBTTRsWnNXUmRVK0Vpb0l6?=
 =?utf-8?B?Qm1MWEt1Nk9GQWN2YXI2SmFKbDZraVpHUnpMbUNRa0pSeGpLdGxGS0dJVFRt?=
 =?utf-8?B?ZjhWenV0L25xTldRclNiSk01ajlZVGorUUdTRTNXNHhEc1JWYm9DTXpQUzRn?=
 =?utf-8?B?R2FMT2VvTDN2Yi9hZ25VdTByanVLMVRMWjBQRFBuUTRkc1NvNTRsWE53R2Zn?=
 =?utf-8?B?RHJnT1k5RzcvTzh5VmhHQWZBZ0xQYXY0SEN6UDBVaVhubXY5cVVRZ3FVVTc1?=
 =?utf-8?B?bjFCZ1dvVlBOczFrUDZTSXdGTHRnRXZXaDlDSHJIOEhiUnRlcFFsQmR5eW1y?=
 =?utf-8?B?U1gxZ3BlRVptWngwUHUzNnBDUUlUVnBMd0JHUUN6T2ZwUmNnN21VZGVaUWZs?=
 =?utf-8?B?M0xkWkN6S0cxaGY5ZW9NOEgwanhHUG92MFRQallLSXNLLzNldldjRHQ3Rjkr?=
 =?utf-8?B?b1lZa2tXTmRHVGVqKzVySytBM2hOTUxvMUROaXp3d1gwcHNmLzVlVWl5cjFJ?=
 =?utf-8?B?L0RzKzMrek9ZOUJCUnE3b0FTL3NpZ2xMYWlWdFZndkYzMG0rT05kVmFFSitD?=
 =?utf-8?B?UW15T1RBUnFKaVI5R3cxTXpqamQyb2hTa2h2UnpsSFNzTVIwY1p6b2prQmJD?=
 =?utf-8?B?L1ZoU0dHTmNqc05hSWEwdzZIcGViMXZWN05Wb09FbFVENXdvQlcxcytuK2NZ?=
 =?utf-8?B?SVJJRExzVFlJUnJhY1QvSXRKWC9aVjFXTTYrL2JpelJqYU5zeGM1ZitDU3kx?=
 =?utf-8?B?d3JGTTd3ZVYyaVU5VHZGVWQwNTNmb25aNDlMNnJWT2o4Y2xwOG1oQUtySmdv?=
 =?utf-8?Q?/MjKD+s4tVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2s1cFMxUkp4NXFPNHM2aUhEaGM4ZDBOWkhwT0p4SUdTUlhmemZ2RlVZY2JF?=
 =?utf-8?B?bU44a0hYWWIyZERTbDVwcXZnMVRPcE1wZkxFS1c1enAxRlNtbzdiQ3ZOaFVL?=
 =?utf-8?B?ZXdwZzRjOWY1VTNaZzMrdGJLRlZhbzVjQzJ0aDhrVkNoNWpQSXgyUVhSbFVP?=
 =?utf-8?B?ZVJZeHRsc3d2enJ5TGlMK09zR0tycUNsajdxT2RxSFRxbnc5SG1ZQUZMRVhB?=
 =?utf-8?B?c3FxNE5BWk5oME5xYkMzQ0hRVFFhRkZSMTBINDNMNm9mTGo1eVpRRWdLTHp5?=
 =?utf-8?B?MENHZ0sxZW8rVFVtVXIwTkZXOG5wd2piR2dCbEJ1QlFyUTIxK3kyK1JDa1hP?=
 =?utf-8?B?Y3pVT01NMGhjTDgxZ2lHdWkzQzhmS0p3dVAvcUE2R2dSZnVjR0Vja2tBUmFp?=
 =?utf-8?B?NkxEUXFqeHpLcXdKRzQ1NXQ5aXdUZnR3R1craU1XVGdoNE9QRmJuNFh0MVRM?=
 =?utf-8?B?VDdKMWcyL0dhTFV2U1VHUElCeHI4L3Rza1Q2ZEdiVDRGQkhCR3BlaEJ4UVFh?=
 =?utf-8?B?UEpMT01VblRKcHlFVmlHbnRiZFZlalZ5dEl0WSt2WGRoTVhZK0VHb29yQUNl?=
 =?utf-8?B?U2NtMktFUmpON1J0Yit3NGhaS1NqSkJQSm8xeThhYjZMSzI2Yk1xZnFYYVN5?=
 =?utf-8?B?c0hVbjFPaWdSR0M5NUNXbGprYmI0NFhBTHBhOHhxWWtaTjluVjRrL0N0cmh0?=
 =?utf-8?B?Z2hZTVNLd0RKaFMzV2JhT3B5NGFJRjFyYm1reEdTdEw0VmZkTUhqcWpaKzI4?=
 =?utf-8?B?Vy95ZVdLNGJpc25QVTNXK2Y0bkUya3IyY1NNUThmVFZhODJUcy91ZlJuRzRk?=
 =?utf-8?B?QXdFaklKZDIxVTZDcmRmYVBpeXdFNlRUYUFzSXVZbUhFYjFnNXZoUHE0UGlk?=
 =?utf-8?B?MjRpaitTWTZzdDRFZGZoRkNYalM2aVdRUTJ1UUpJNWtjZ1paTXY0OTFZZnpT?=
 =?utf-8?B?eTIrY1NoR0Zvays3enRHcTB5RFQzTElVN0VJaW5lMmUyNno3UnoxK3ZzaWpT?=
 =?utf-8?B?VzVEY2xwR3dlK1lLRDBwSjZ1aXFkMTM0Wmx3UUhtaEE2dVlxRXFwMEE5MkFH?=
 =?utf-8?B?SUpIQmlJMWpidGY1REZvZ2tpTmVRaWVtVmFJR1VDcTdhV2ZFLzNGQktXbkcv?=
 =?utf-8?B?K3ZzMzgwMzdVV2JsQnpDOTV3a1RSU29nbGJaTG14UGpuNGNpRlpCM3lLelNS?=
 =?utf-8?B?T2hWL1NROWNySkRldmZnQVBoNXAzNnpHb2U0dHByK1F2QzdvSzhDTi9JTGJn?=
 =?utf-8?B?b3ZYQ2xGMU5veVYvOW5sT3prT1RmNFVvdEhGaTZwdjc5TTFjaEJ2S3V5NUFo?=
 =?utf-8?B?S2lRZEQwaXppNnFFbk8rcXpsR1RJeXc3Q3FPRXliVnlKMTF3M3ZCRUZMVlA5?=
 =?utf-8?B?ckcrMXlQVTIwMnpMTXM5NXdzekl1MVY5c0lOeWZBVUpqQ2tJd3pDekFwaldp?=
 =?utf-8?B?eDE3eDI4aTVjbDJoNmxBVWh3N0cwUm9aRUo0b3habGM5NmtqUDRiVU9pVm9D?=
 =?utf-8?B?OThkaWJodzFHUjdXRGNkbG1UTHowenJZeFAza3JvdmI1TkUvWnd6WGVXQ1B6?=
 =?utf-8?B?Tk5UUWVlUmZ5aVdlRG5Ud1pYK040TDd0RVhxUGo1VUx5dEtKbVdhdWh2eEpK?=
 =?utf-8?B?NEVrWEZhcUVpQnUvZmxDV0tZa3NYN01GSUtiT05OdzRKSkJGNVd5TG5neTFl?=
 =?utf-8?B?UDk5VTFlYkl5SlVrakNjbFN0bkNPSnNycXBrWVNVZFdkaThDRk8ybVF4eDFR?=
 =?utf-8?B?MmRhZ2ppT1FzSXJoMFhBQXZ0OVlFYkhabVRkY1haejhkOW91K0ZmajdUMWk1?=
 =?utf-8?B?T1RmQUdvaC9NTlhwL05zQWFDcEREcndIYVBLL3JzekZTb3BoeVZEQVpwa3NO?=
 =?utf-8?B?M01RTEJ2NnRRS3RBNHhYNFZzeUpRM3k0djdpbFRiTGVYM1N2ZTR4Y1NVTXlv?=
 =?utf-8?B?eEk2eURQNGlBUjZxblN5MlIxUUpNVjVSdGpYVDZnS1NFQU56TGxyMnBoeVJG?=
 =?utf-8?B?bVdpQ0tPOFlPdHNmYnhOcEM1MkdsMytNNU43T2puYko5L2daRFZJRzQxSkFL?=
 =?utf-8?B?L2E1a0Rwb0k1WEdEYXg5NFNtNy9YVjN6UUdCQS9lZzAxREJISlRTZ0NmMEps?=
 =?utf-8?B?T3pKODZFQmcwNE9RL3E5SHNHNjM0ei9WQStCZXBXaFI0YmQ3YlE4b1B1ajBJ?=
 =?utf-8?Q?KNlY0y1uWiWAa7bozU7nvT4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b6488a-9478-487a-52de-08ddeaf3c838
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 14:11:31.4903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6lB7zoBo0KIgXXjLJAEvAblyVBNW9LKDxUk2Qdv5Mr3Ej2NZNN6pKTRaIZ33tOEU8kVx/j09gE3T6P5dWS+dotl+Wi5ZaMkjDOkGxm/ElY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
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



On 8/15/2025 9:36 AM, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> Setting the COLOR_PIPELINE plane prop is only allowed when the
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set.
> 
> Setting COLOR_RANGE and COLOR_ENCODING is only allowed when the
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is NOT set.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   include/drm-uapi/drm.h | 15 ++++++++++
>   lib/igt_kms.c          | 63 ++++++++++++++++++++++++++++++++++--------
>   lib/igt_kms.h          |  1 +
>   tests/kms_properties.c | 20 ++++++++++----
>   4 files changed, 81 insertions(+), 18 deletions(-)
> 
> diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
> index 4e4f7c2c3..6b9af3348 100644
> --- a/include/drm-uapi/drm.h
> +++ b/include/drm-uapi/drm.h
> @@ -869,6 +869,21 @@ struct drm_get_cap {
>    */
>   #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
>   
> +/**
> + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
> + *
> + * If set to 1, the DRM core will
> + * - expose plane COLOR_PIPELINE properties for pre-blending color management.
> + * - reject setting of these plane properties:
> + *   - COLOR_ENCODING
> + *   - COLOR_RANGE
> + *
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + *
> + * This capability is currently in development.

This line can go now.

> + */
> +#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
> +
>   /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>   struct drm_set_client_cap {
>   	__u64 capability;
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 7191bf92e..a9641eba4 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2545,6 +2545,8 @@ static int get_drm_plane_type(int drm_fd, uint32_t plane_id)
>   
>   static void igt_plane_reset(igt_plane_t *plane)
>   {
> +	igt_display_t *display = plane->pipe->display;
> +
>   	/* Reset src coordinates. */
>   	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, 0);
>   	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, 0);
> @@ -2561,13 +2563,15 @@ static void igt_plane_reset(igt_plane_t *plane)
>   	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
>   	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
>   
> -	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
> -		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
> -			igt_color_encoding_to_str(IGT_COLOR_YCBCR_BT601));
> +	if (!display->has_plane_color_pipeline) {
> +		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
> +			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
> +				igt_color_encoding_to_str(IGT_COLOR_YCBCR_BT601));
>   
> -	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
> -		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
> -			igt_color_range_to_str(IGT_COLOR_YCBCR_LIMITED_RANGE));
> +		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
> +			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
> +				igt_color_range_to_str(IGT_COLOR_YCBCR_LIMITED_RANGE));
> +	}
>   
>   	/* Use default rotation */
>   	if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
> @@ -2982,6 +2986,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>   		display->has_virt_cursor_plane = 1;
>   
> +	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +		display->has_plane_color_pipeline = 1;
> +

If we do this here, we will be taking out the legacy properties out of 
the equation for all IGTs (say kms_plane.c). So any place currently 
setting COLOR_ENCODING/COLOR_RANGE becomes dead code. Other than that 
probably harmless?

>   	plane_resources = drmModeGetPlaneResources(display->drm_fd);
>   	igt_assert(plane_resources);
>   
> @@ -3609,6 +3616,29 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
>   	igt_assert_eq(r, 0);	\
>   }
>   
> +static bool
> +igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
> +{
> +	igt_display_t *display = pipe->display;
> +
> +	if (display->has_plane_color_pipeline) {
> +		switch (prop) {
> +		case IGT_PLANE_COLOR_ENCODING:
> +		case IGT_PLANE_COLOR_RANGE:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	} else {
> +		switch (prop) {
> +		default:
> +			return false;
> +		}
> +	}

The else block makes the last return statement unreachable. We can have 
something like

static bool igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
{
     igt_display_t *display = pipe->display;

     switch (prop) {
     case IGT_PLANE_COLOR_ENCODING:
     case IGT_PLANE_COLOR_RANGE:
         return display->has_plane_color_pipeline;
     default:
         return false;
     }
}

> +
> +	return false;
> +}
> +
>   /*
>    * Add position and fb changes of a plane to the atomic property set
>    */
> @@ -3628,6 +3658,12 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
>   	    igt_plane_get_fb_id(plane));
>   
>   	for (i = 0; i < IGT_NUM_PLANE_PROPS; i++) {
> +		if (igt_atomic_ignore_plane_prop(pipe, i)) {
> +			igt_debug("plane %s.%d: Ignoring property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
> +				kmstest_pipe_name(pipe->pipe), plane->index, igt_plane_prop_names[i],
> +			plane->values[i], plane->values[i]);			continue;

Could use a new line

==
Chaitanya

> +		}
> +
>   		if (!igt_plane_is_prop_changed(plane, i))
>   			continue;
>   
> @@ -5222,12 +5258,15 @@ void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
>   		igt_fb_set_position(fb, plane, 0, 0);
>   		igt_fb_set_size(fb, plane, fb->width, fb->height);
>   
> -		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
> -			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
> -				igt_color_encoding_to_str(fb->color_encoding));
> -		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
> -			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
> -				igt_color_range_to_str(fb->color_range));
> +		if (!display->has_plane_color_pipeline) {
> +			if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
> +				igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
> +					igt_color_encoding_to_str(fb->color_encoding));
> +
> +			if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
> +				igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
> +					igt_color_range_to_str(fb->color_range));
> +		}
>   
>   		/* Hack to prioritize the plane on the pipe that last set fb */
>   		igt_plane_set_pipe(plane, pipe);
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index f140ad91a..8ec39fa85 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -508,6 +508,7 @@ struct igt_display {
>   	bool has_cursor_plane;
>   	bool is_atomic;
>   	bool has_virt_cursor_plane;
> +	bool has_plane_color_pipeline;
>   	bool first_commit;
>   
>   	uint64_t *modifiers;
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index b30387888..e646b8184 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -101,7 +101,7 @@ static void cleanup_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *o
>   }
>   
>   static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
> -			    const char *name, bool atomic)
> +			    const char *name, bool atomic, bool has_color_pipeline)
>   {
>   	if (prop_flags & DRM_MODE_PROP_IMMUTABLE)
>   		return true;
> @@ -111,6 +111,14 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
>   		if (atomic && !strcmp(name, "DPMS"))
>   			return true;
>   		break;
> +	case DRM_MODE_OBJECT_PLANE:
> +		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE"))
> +			return true;
> +
> +		if (has_color_pipeline && !strcmp(name, "COLOR_ENCODING"))
> +			return true;
> +
> +		break;
>   	default:
>   		break;
>   	}
> @@ -164,7 +172,7 @@ static bool has_additional_test_lookup(uint32_t obj_type, const char *name,
>   
>   	return false;
>   }
> -static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
> +static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, bool has_color_pipeline)
>   {
>   	drmModeObjectPropertiesPtr props =
>   		drmModeObjectGetProperties(fd, id, type);
> @@ -183,7 +191,7 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
>   
>   		igt_assert(prop);
>   
> -		if (ignore_property(type, prop->flags, prop->name, atomic)) {
> +		if (ignore_property(type, prop->flags, prop->name, atomic, has_color_pipeline)) {
>   			igt_debug("Ignoring property \"%s\"\n", prop->name);
>   
>   			continue;
> @@ -230,7 +238,7 @@ static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt
>   		igt_info("Testing plane properties on %s.#%d-%s (output: %s)\n",
>   			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
>   
> -		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic);
> +		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
>   	}
>   
>   	cleanup_pipe(display, pipe, output, &fb);
> @@ -244,7 +252,7 @@ static void run_crtc_property_tests(igt_display_t *display, enum pipe pipe, igt_
>   
>   	igt_info("Testing crtc properties on %s (output: %s)\n", kmstest_pipe_name(pipe), output->name);
>   
> -	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic);
> +	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic, false);
>   
>   	cleanup_pipe(display, pipe, output, &fb);
>   }
> @@ -258,7 +266,7 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
>   
>   	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name, kmstest_pipe_name(pipe));
>   
> -	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic);
> +	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic, false);
>   
>   	if (pipe != PIPE_NONE)
>   		cleanup_pipe(display, pipe, output, &fb);


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314C9C28B2F
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 07:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7B110E973;
	Fri, 14 Mar 2025 07:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHWVrXnO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF5210E972
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741936311; x=1773472311;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XbKzujhzCdpgKLw++XsQ+DGoyZpbKKokNlhpmUzZwGk=;
 b=lHWVrXnO47nvfq3sgaaU6++plRtoSTBBLjLrDR46mPHIUOG/EY5avFM6
 /jE5R9sn4sbkUDc9I+7B7t2aqIyv5RhHXilR0JvRKUUnnHC5NOXT3Y1NT
 Q5RnuT0qiELB49D+nFW6qTyVhX9TzXq4HdHdSgN3c4URW14UZtytkf2cA
 7zkNcsaE1asRFgRJeh4qLM0SEVr+/hNlU3269XrTr4fjvfpOSbrQA0Cnt
 4Dh63ujArbSCfXLZv76D3fsS/HE02Q1HRzXb7phUtjjX3jQHvXS8tUFWN
 GReqenu88L9d1Q1jyHeRAP7fAGzuL2wHnh6WBQbBE0bkBmXL5EjdNnY47 w==;
X-CSE-ConnectionGUID: xx1X2yLXSDyHhk5XMrt6RA==
X-CSE-MsgGUID: nEeTqiL8Rs6vrizxkhuOmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42325928"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="42325928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:11:50 -0700
X-CSE-ConnectionGUID: hSvYBSkKSBexRBqqhAlptw==
X-CSE-MsgGUID: Vlu8IYijQEegUW4GweAfNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="122110364"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 00:11:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 00:11:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 00:11:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 00:11:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NO2d2KBXq5U6YL4CIcQlT3HIhF0T2usAfNFHg7NQmh8+bPK/lyUOmH/vW5zGX+pg56OrgabMu9r2/QIPSDMtKN7Gs2PZUnyJnAfNobNZ12Txg5T7fsgJtGaRM6rPsTKuCXr+ffs5Eid34vOlqA2m/lzf73B3/Pvy2QpIi4PBTd5ZIGBDkl7Cx/oNlQyunvTnPRchvCrwQhGwxaCo3S5S8ArweI0w+8KAY0SVOFUk7CovTlw3TJSqxNt6ViuG36HHqbo/EL84VCuLygJDhxeKsjwcxkNgQGq17ljO+M+cJRORnjUti2im9xV8yiw2NCgjnm/E/qqC83DtsdhgoYAoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00m3PcV9RbP2wrHtY7k3tZZQGAtdXGIp5Pa9egzUwNM=;
 b=oEeac4tvZsjRSIvfHLkLb7OwxMqsMPa68ttCks6lQGF7sIdM72plqRc/Be9V+ZJiSVKQzMAA4EDiHiEEP05RH555a4smlOK8epSbx2tqIsT+HgkVFdWP9EdCmFRVX963eqKggIeKqfPcaa2gp9XORimzzRYBm07rwH8rGID2Dw2Q3z213F1IDVITE5exyY61LTPEvAMMO3JQrtDiZ5SZ52ySLNeO8ZuwRNg1+4uD+hcqj14p8k4IrTM7EkTeuz4so61d5Cjz370B8jaCOTZrUBGcWlt9aCNa2iJ3xVCT9QXaA3PBrwJYE47im3pMElpWS0WFf8mbrbigq2Sg1rQSZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 07:11:34 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 07:11:34 +0000
Message-ID: <65457de6-5e39-416b-8cea-a7d95c8daf64@intel.com>
Date: Fri, 14 Mar 2025 12:41:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_oa: Don't limit sync tests to
 render engine
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250314002058.220854-1-ashutosh.dixit@intel.com>
 <20250314002058.220854-3-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250314002058.220854-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef71b2a-5ce9-4384-cd86-08dd62c773fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUlMTzJseVBtRDZKTFNJdmlFTTVCRkpnRHNtNGFaWno5VWNEL1g4QUp6K2dk?=
 =?utf-8?B?enNMZVRVQW5jMDdvK1lOb2NESkZLQlg3MThjSlJvRkRrZXAySCsyRTlGeWZa?=
 =?utf-8?B?RDRpMndjbTFjd2NqL3RHelcybzVLYmN0TitnVHc2bDRQdWdYdGNiNDR5R3Fi?=
 =?utf-8?B?UHY3VW9jcjk3VUg2Z1JQWGF2VUVuMXRTQkJMUE1zdkRDZjdzMWd3OWNSamwr?=
 =?utf-8?B?a0NpeHpoUEVwWEl1TkZOTDV4SGFXTXhaWTNJOEJ4SGQzZ3cvU2MvWHhTcnlR?=
 =?utf-8?B?RGJMS2RxTXZjcWNTbWV1UTdtTDlaOTRtZDVyM2hRNG1GNUdwbHNSbXM5MUho?=
 =?utf-8?B?bFQ5SmxlSS9aSWZwaVd6NUxORTN2YjJTeDF5WFlUeE0wd2FEaFJROG9MTCtN?=
 =?utf-8?B?VytVVVFURmZIdFJVWWRST3cyT2lwNlhOcXRWQW5KL1plSXlGRGFSOTNDK2hq?=
 =?utf-8?B?L1FJM0tjVmM5Q3ZrWWpmaW5qYkhxbkxyaXZLUDl6RXo5ZXhYM0FwbFF2aFdZ?=
 =?utf-8?B?K1pqOG9ocUxrMXVSQWZvcEhxWmpUZGg1YUNadXV1LzhMTGdIUHlQNUlvZ01v?=
 =?utf-8?B?L3ZWZ2FYMXBaUFVhemJNRk5XYXJqbDNETitIUldsK2NtY251b2dvVW4xOVZi?=
 =?utf-8?B?Mjh5NHozREF2SlI2MzhNdFQwdEJLa2Y1R3BsU3hjd0xkMU4xVTFqY29wTm80?=
 =?utf-8?B?SzU4NlEvWHJrWUhFUFJCWmU1S2hkeW96b1VhN1VBanFpcTEzUWkrUDBOYS9u?=
 =?utf-8?B?R1BFbVVRYWYyVDdkbG5rRzhHVzZMZC9JUzV6OXVlaGluVXJYMlo2U2hGMXFE?=
 =?utf-8?B?ZHZybHZveUQxVGhwL3NyYTArN3hzblFjNEdiS3ZEUWNPUStKK3FBYk9VOFpv?=
 =?utf-8?B?UTErbkpzaTQ0ckNlTWNhSytKVEdDdEQrZG1rNWZRbnlrSWowNkFoQUVsWDlZ?=
 =?utf-8?B?S2dFekxOcFVQbDdyV3ZMbnBCRy9XdytSeXlsdWUvckxXeE52L2FBdE5mZ1hY?=
 =?utf-8?B?UHFhQWtlS0tZQUtmWlpUZ0sxbnc3Q0NFWEIxck1VRzFqRyttZ0dNcktuVCtr?=
 =?utf-8?B?Zkdyd1F1Vm5RZEkzeStjZ01wR2ZMcHdWZjZ0TFE5cVhSZE5SRHVEWCs2cE94?=
 =?utf-8?B?eU05TWQzeVM2OTdqRjBLZVZqYm9ndG9WVml2U2pvMkxjRkcxblFKU3A2cVZj?=
 =?utf-8?B?akpwTjl0K05OcTAya3JXejZnUWlQR0lRdlFxaFVpb2tqOFc2Nno0WkJreExJ?=
 =?utf-8?B?WXJxcmxZd2RLK1pMLzk3cnRsVlNLUGZZSjFxMVNManFSWk04d0E5OGluZXVH?=
 =?utf-8?B?UUwrd252eUJiYWpmYmxRVXhtV0hKUVJmYnZMWXZ0VENHUUJEVmpGZXJaUXlr?=
 =?utf-8?B?ckppRkl0dWFwUmZXdmVxYzJFd3B1L0VNNERadUVqMHdhdW1sT3hSdFdTZUJt?=
 =?utf-8?B?RnEwZW90d3dMVFhlemZFTGVEam1ySGlUc2owa3Mzb0RzZDFMaUZpWGFEc0lz?=
 =?utf-8?B?NEF2NjRkRlcyanlaRUc3RjFLQ3hHbmU1cVZTaGdpdXRpWG5zSlpYT2I5Tml2?=
 =?utf-8?B?d3g3bzhpUmlZR0phZHI1MURwYjA4YnJNTmE0cHRnQ1pPS0FjdFBiVHlWYVJp?=
 =?utf-8?B?YkpzMU9lOFZvQWZPaWxqMGUxei9HWVRQZ2w1S1p5MStXaUpWTHJ1RGU2SVRq?=
 =?utf-8?B?L2ZXcmFxQTFoRzJSYXBkVGFUZ1FlMEJUUFZWNUluZWhmQ0Y1RE43YWdJeFNr?=
 =?utf-8?B?T21iVDBLTzI4VWRPVmhMbFpWQmtZM0lwdElrYS9OTmdZU0h1Y2JUSnJmSERB?=
 =?utf-8?B?aVA3MlExbWJyTVZnWWpFSHpUaFBwelV3K0RsTjBOb2VLNHgyOTlLUlU5ZE1n?=
 =?utf-8?Q?h94NvQrYjG/kp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1gxRjlubXZqeGszdkp0ckJGUW5EczV0QU55SVY1cERNOGZoTVNQcFc0NzMr?=
 =?utf-8?B?TWI3MmtydHFLVnlnTGpCWHdCSk8ycFZtQWxNakdXYjQ4L1llZzNyMmhCa3Bq?=
 =?utf-8?B?bzBibHBXSWUvbitVb0QxUnJyU29MWG03ejRaRDhxbnZoUTNnWFdKS3g5bGRs?=
 =?utf-8?B?anRJV05EbVZ6aHIweUdpaDFwTy9ENFFnN2hhdHJqOWUwUHY0OXZvV24yMGdX?=
 =?utf-8?B?bE1mZEJ2K3p4K3lsYWlXMUNkTk8vZFF0UklMcUZOWEMyS1I2aDJHbDBpRHV2?=
 =?utf-8?B?djFSWjdZYTdYaGs3UldiYSt0U2ozUTNuWHZaaThId3hMa2VLNGFoTytWbWdV?=
 =?utf-8?B?ZFlwb2IxNk95L3lMRjJIUHZidG1zUG10VFdHUGxPUlhqYldtL09vdlRVM1dY?=
 =?utf-8?B?VmlNU0l3SmlyVHpIQWlqcTJNbUR5Q2txRTArUThidDRFVHFERE9EZnNGR3lj?=
 =?utf-8?B?Z3U3M29DbnN6cDJqOWZ5Ykh3UEZLb2xIWkNwRDBjZXZYSnNZaFdGZ2ZPcFVP?=
 =?utf-8?B?M2dIamhGZFhlRmVDRDhHZHZJcmpJNkhlK0dudlhqcllkY1FyTGp3cDV1Vk5i?=
 =?utf-8?B?RGFrMytJSW1RS1RpM3c5Ung1UXZYdkZ6Z2tpTE9rSlVZajBpU1lyTnFRVFdm?=
 =?utf-8?B?NUFNMFphWHJkb1RHYmQvaEUra2hKaDcrN2lYTFROU3ZYV3dkVERBTGZPS0c1?=
 =?utf-8?B?QVhXZzByS1l3UksyV2NweVBhbXh3bFRQSS8vOG5tdmdpcm5jRHNsdWR4WGdF?=
 =?utf-8?B?blVXNGx0RHRUNU5lRHRlSDlsN1BqV0JidTdFZFR0YWxTYmpIQURaMXFxRlZy?=
 =?utf-8?B?VlNRWDFGTEJoeEhjMGh5Vm5mR2srdXBmTWNGRTJ6ZzZORC9YZTBIWEk5QUg0?=
 =?utf-8?B?TjZXVFZMR010SkYranBiOU0xWlZhOTZaVmNreFJaeGRieTZtSzVpWUlORGxw?=
 =?utf-8?B?VEZVT0pCZ2ZTa0p3SFRXYzY2eFVHT2lsMGZlbUFsMTBYYzV4amNpbzVySWxG?=
 =?utf-8?B?WEd6UmszODhLb0wzeU5Eb0JyN3ZZdy9SckQ1MUZlajZVWXZsMHcyRDRJbDFl?=
 =?utf-8?B?MjNFcDhIaVRxaVZZS3VqRmtlNFZkTUVQYkNWNlhuQ0NrcWw3Y3dyVFhKS3Rq?=
 =?utf-8?B?MEFibnhFUFFaK0RpWFU2RkNaQjUxODYweTVFcDUzMmdrMVE0blFxZGdaQ1Ni?=
 =?utf-8?B?K0h3cDladmZMbzVVY0RFYmtKWlhvVm56S3QyNUdhZDl6RThmSDRkSXh0bVdJ?=
 =?utf-8?B?YWZUN21NYWRrNi9ta0lxb3NaVUI1a1VJbXdIZmxUQ1VLbTRZZmhSMHRodUFF?=
 =?utf-8?B?MGFQREx1U3ZYWUJzSk5iSUQrODBtNVdZdG5WQ0VQL05BMkJQZnRqKzRNRWlz?=
 =?utf-8?B?dmlNOUN1ZDFXRDc1MHZEUG9YYnZxdFREZzBCMFhwZjdiNUswRXMwUkZyZnBZ?=
 =?utf-8?B?WXM1SzdMMVlySEMwcTNnekZBT0JoMnZnY09oM0U1QSsxUXN5dm9JYWVSOTFv?=
 =?utf-8?B?aGJ1MTJqZjNIbGZaY0pZeWNHdHoveGtrby8wOTF6eWpqOFNrYXlGWWl3UjdF?=
 =?utf-8?B?aUVmRlRNQitrNTZKOWpQVWZUSmd3dXdiRVQ2VG5ZQ1JZNkNvTWlNdS9FSE1M?=
 =?utf-8?B?RGpWektrUXpnVXl3bVVtOG5vZndSbFR1NDBZVTlQVHVlUVVLV3NiZzJvZ2JM?=
 =?utf-8?B?bm1wZFFyTndRUkFFbXpleHVYMm1HYml6bDliQ1pHWmRER01nQzNoN0R5V0VT?=
 =?utf-8?B?ekttUlFjNDlJbGVrdm9aV0t1cGZXOHl3SjBINzlOaW45N1B0eU5oRzJpMXMv?=
 =?utf-8?B?WTFmQXRZKytmbWM2a2dOYmdtVmdsMUV6U0plTktweG5WbWlhMDJ3bXltVDIv?=
 =?utf-8?B?NXVoVWdHMXpVaVJFaFQxcWZzUGRoL0lrUU9QZUNxUS9VWVhXdUgzaDBjR0F0?=
 =?utf-8?B?dktXVzM5TEVWQmI0dWc4eDBxVmNiOXZhQWdSV1djdmVZUkc0VFgrdWFPUFUx?=
 =?utf-8?B?SHRUUm9jc2JZQlRJUkRScUtYTUd2UDdnaktJa0hFMTNiSGgwNWd0eVRCWXNS?=
 =?utf-8?B?Wk04UEVwYlFCRERYdDExZzVDYjlHUVNnZUtyOHNIU0ZqS1A4Mk51VkxxS1Zz?=
 =?utf-8?B?ZStCczBBaDBSQTh0ak52Y0xMczgvOGFDMzZYcjA4bkY2UjBlOG5IQ3F5RDVr?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef71b2a-5ce9-4384-cd86-08dd62c773fe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 07:11:34.5534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/nKAWw+CkDDB1VdI8gjuZ6+abK8k3Mkwx/s7MG7I26qdcav8JBBPih9wUbXd/AEWI7arL6iK9V5PYOn8PqMePwcnSUsL7JEMKk00oV3uy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
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

On 14-03-2025 05:50, Ashutosh Dixit wrote:
> OA sync tests need not be limited to render engine only. Extend them to use
> any engine using __for_one_hwe_in_oag macro instead.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>


> ---
>   tests/intel/xe_oa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 245481f8a3..2c48623a3b 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -4905,7 +4905,7 @@ igt_main
>   
>   		for (const struct sync_section *s = sync_sections; s->name; s++) {
>   			igt_subtest_with_dynamic_f("syncs-%s", s->name) {
> -				__for_one_render_engine(hwe)
> +				__for_one_hwe_in_oag(hwe)
>   					test_syncs(hwe, s->sync_type, s->flags);
>   			}
>   		}

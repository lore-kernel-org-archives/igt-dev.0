Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622BCC78829
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 11:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C1E10E0A4;
	Fri, 20 Sep 2024 11:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3g79SKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3FD10E0A4
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726832804; x=1758368804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F2GzRnq7gFAQWvcDOgK5sVK7uemhF6tWDl9NR+iDjFg=;
 b=R3g79SKMt7cwBxcjGS5l6v8WEPAkIVA+CC1hezLuCEsmdn/87Cv3Rlz5
 mp9GWXIwCTCW2Xki/WBQGY+c6bdjXVUiMtG2V/05kIbstRbq5d8HOlpjy
 o00V6NcYhpYqGhxRO0WdXEVoUUNKENC4d25H9ZIetwIDW95VMvNzC0uRW
 9orkG8fFuw0oJVXo2Gveh+L2v04ewG2lcMJOw+4dnsa4pkdu8bq0y/mGY
 ao4YpruejaU5A5hKxu9fKy4O6KkcLorVn0zTeUSrcNWqR7OByjcmjnOD1
 aQJNclATWNC9DV9fvsx6Y0Rt5bRzQB1aDd+hkst43I7jotmVTTQtAH90p A==;
X-CSE-ConnectionGUID: zRlAJLwSRvymh3gtaZC4Cw==
X-CSE-MsgGUID: aj9ZWWdMQFGI3JazaeyuCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36403136"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="36403136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 04:46:44 -0700
X-CSE-ConnectionGUID: XRujRbMYQgaly6nEi9/kBw==
X-CSE-MsgGUID: 87ESQJ2aRluPDLku5WHhbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="101111667"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 04:46:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 04:46:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 04:46:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 04:46:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 04:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3a4fNNZGAcAUXAxTmwQrP/V/c/7Fy0+RQ1DbH/l7TggsDXbzi94TKFhRdPxpXO7Cieb6EPIuK2Z4M30JcWpJwkh6NRjDNIDsG3WBu7m+vQzaEIVA1gWilDOlmd0hM5RBTgdTzk8nxqW52zCC/O6k7oWLdVBqQCN/OhqE/pTEJlazH9MLDqQO7nAziGVQxMJVuy1jXD5kwbTHL9UDaH3ZWlp1AWf00DlkqDMrGZr8BFWaoJCnDhKuIaHtlWBX1dBpCyU7LdbNs5kuNh/pGScU0gWm5OIz4CMELKHbtMSA+kIfGlpimAFoi5CfdbZGCdktbJw81xGbpWeqzVSeT78lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5lgGara8QJTH1G9SKyFveVVniG6SFZjtNdAC7jK8fU=;
 b=rKL/LU+bSnzrsqqWh8M4QsSd+xZl4tHOcuddn/bBUBawlNIUgU0AAqeLTPId/5C1gS4hVn9oRLpFmPVc/oc4OfKIu9FShhVd5s7vcOvzeBlhEcL0X1lHO3NZ4X09aavaUPAVGNaTplXIP2hLFG6E+b56R9guX5JqPZxwfFo61pIKs5vaj5/U5cu0s7vNgavO+lAmbmBeoUUgLM3vNTRtSPZWm+6b/JlluGowzsY0anzDiQr76agxFXwWLWUz/0w0zJcOeBSRtgd6Ib9phy0n+flmIyRuucMQEtOp3RaV6L4F/DjjNCekp/ijX09J91qrnrASa/GsK4sA8VhQq9I3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB8045.namprd11.prod.outlook.com (2603:10b6:806:2fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Fri, 20 Sep
 2024 11:46:40 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7962.022; Fri, 20 Sep 2024
 11:46:40 +0000
Message-ID: <dff59643-3f71-4ddd-8a57-6a27e5cbaa24@intel.com>
Date: Fri, 20 Sep 2024 17:16:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print execution and
 sleep times
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>
References: <20240920083315.1763178-1-karthik.poosa@intel.com>
 <CY5PR11MB6211A751A26CA560A3575536956C2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211A751A26CA560A3575536956C2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 044a313b-643c-4bfc-1168-08dcd969e416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXBWVW9RbVlxczI3NzB4elBlRzZSaUloSHFVSFdvSlJYNUdTbU5hRmlSRDdu?=
 =?utf-8?B?RHV4MzNCT2s3M085ZkxvdnN6d0hQUHk5cy9LZ0RFZFNVTkxsU3RZcGRHSmQ0?=
 =?utf-8?B?L0FldFdVcHN3UmprMUc4bGZmWVpGZXhCNXB5TUlpd2hrc2JCVXcrcGlsN1R2?=
 =?utf-8?B?My83M0N6TkZreUJ4MGtrMWNBbnRZTGRJT280QU5FUFNWelpwaXY2L2YvNmRY?=
 =?utf-8?B?OXRFOUNUN2k1V0N6WkpxTWZDY2NEaXBicU9XS0NnbzFBTzczcFhmajVYZFZr?=
 =?utf-8?B?eEN2TnpFT01CVGdxSDZOR0tZckpZRThuRlBHTXBGQlNYOFVDSVQrV1lNa3VG?=
 =?utf-8?B?SjFOLzRKV1UvTTNjQTRCOUJiTnRWSW5oQnVvcUpnTDNoYWxxMEFzaHVjbXRV?=
 =?utf-8?B?TXp5K2xQRHFyQUVQbE1uRWtRVWovenMzeWZEQVBUbGNGOGpMZlVMdWtqTU5B?=
 =?utf-8?B?Z1JqN0tVd0hYRHRrU2QxSjExTlBJTEk4a3hXQ01TalNjdlZITU8yWHFFeEtl?=
 =?utf-8?B?bENTNHo3SXo4WVprbWY2MmRkWmtVc2NsMFgwNStTbkxHMisyWmN3TW5Pbms2?=
 =?utf-8?B?eGp3RzRBZWx5bTJjUlNKSmRPUEp2VCtKT2NMM09OTWtaSzhVUlV3aTFSZm4v?=
 =?utf-8?B?alluYVp2L084NEdRTm5PODBEeXp6UkNqai8veG5Rc2lBRjJ4cnNSMERlSTdw?=
 =?utf-8?B?OTNoM1JyTWY1U3Y4UnBDVHRRdUZnajdPMFM5MVBadzNrTExzNG5EbEhZTU1n?=
 =?utf-8?B?SXZueU5ZbFZkcXVkQlRjMzhFUWpuZll4SktsWmNwRlllaExManFIbTNhbnc1?=
 =?utf-8?B?Zk11MkI3Q1lTUm9DamF5Rk9LVnFKU0pPaE82K0t3ZG5UMnNjbmNxOXhRZnNu?=
 =?utf-8?B?UXJDQXdsZG5PekI2S2ZiUGlGMk5aM20rOXR6NkZQQTRlb25ZbGlVcXU0VlFJ?=
 =?utf-8?B?YzJaelUwSG52ZVBNY25rb25laXB2TjFEaVJkMzZobzRnWGlQYjkwcXJQYXd2?=
 =?utf-8?B?YythL0NIbW01LzlONWEvdWR1M3JTc0lWRER0b0M3bW9SVzhDZE5IeHczdkFM?=
 =?utf-8?B?QVVHV1pYdnRpb1luTXZXdkswdkNSRXhCaWsrMEh6RUd4VzVKMGdsRlZaRmZR?=
 =?utf-8?B?ang2MVdDS1RWNWp5OWVrOWFKOUhEK1RSZTNWN3JlUkE4SDMzZE5Id05xeUNY?=
 =?utf-8?B?ckdKdTkwcC8wUnhSelJyVmh2d0t2UW9WZ2dPY20wcytJU3Y2blNxYTNYUUR1?=
 =?utf-8?B?NDY1T2JpWUtuakNaYlY3OEttN3VMSUxQeExhN0J2d3pDc0syTjZVSmsrdXRw?=
 =?utf-8?B?L3JSL21oWDdyTkFJZXFPWlVuR3lJQjQrT3crS1hPNEg0dEg3WUY5SUlucEd6?=
 =?utf-8?B?UFBwQzdKQVpKdklwL1JKUGxsNEd4QkhlTzdSNExBVkNZVmtJTE0va3RJVWFE?=
 =?utf-8?B?eVBld1h6TGxNY1NIQ2FzQjlDcHB6eUE1UmJodkIvVTIyaFFpd3JKWnpoU0JU?=
 =?utf-8?B?NVdVSGJkMGZ1MEpIS0tiR1BXQ3NObndMK2t3R1ZoV2hMcGRMSW9nL25mU3Nx?=
 =?utf-8?B?SFZxclBIS1hMTm5tZytqWnBrczU0MWtBc1dzeXIza3pkUXBJdnlXYkltMVdY?=
 =?utf-8?B?anozdDQ4dHZ2V3BvVG5sWDY5VUNld0JaQnI2SE4xS1BGaTlROTIzcWtaaWFK?=
 =?utf-8?B?NVBlK3ZzeVJuTERkTUNDTjQrQmpVZXdoajVSUWFMdS95Q1lyT0tPN3hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVo1R0FUdjFpK2NCRDQrM09PeVU3RnZnQ2dVcG9Kcmk4cGFKWWpyL1A5SllK?=
 =?utf-8?B?SmEzRm8zbERISFZBbFNhdkNucXVvM1ZYRld2NWtCdS9vYW1DMWxGM2NoRlhL?=
 =?utf-8?B?c1J0VGpCZGVOR0RYaFFDV29RL2JxekFXR01vVytXZWRmWjl5MHA1VG5qME5x?=
 =?utf-8?B?ZzBnY3ZtckJpUXE0RGtxRmdYcVYySGJtb2FYcE5mencxanVjcnJHK3VSajZl?=
 =?utf-8?B?TFFteS92My9OSDV6bSt4MUoxNVYrVzE4UHZPVkZCc2cvMnQzWmYxUmxxQ0pt?=
 =?utf-8?B?Q3lEK29zY3lmOFFLcGtFaGJBVUlaVkhIb2Q5dnRnbnd3czNGTis0Y3BDZFFo?=
 =?utf-8?B?bkF2dVdqL1NWVzYzQWFPSHBoN09hMytOemk3cFVjRkR0ZEhyQzhYaHRlT2d1?=
 =?utf-8?B?emFWQmJFd1FPVVNwak1xdXZyeHdlbWJldnNhMFJGUzZTYXgyeUhJRWlWNXJK?=
 =?utf-8?B?QmsxM2ZSMDl5d3JrZVh3NEdsUUZYZXlFWmFHU0JONy9zT29kSEo1dzMxUEw2?=
 =?utf-8?B?UDBiakJ1Tk5BelY0ZytRenNmMk11aFNFUi9EUU15Qmp6aDJBOXBLVFZmcThh?=
 =?utf-8?B?bUMyeE16WVI1di9DR3BWSWJ6encyd3NaL2FiZU81c0xUdEVIVHAwRENXOHA0?=
 =?utf-8?B?RFJnbHZFVG9rUUNGeml5NHBXT3J1d2RSbXpXeU15aUtZRjZMenNNdlgrVXp2?=
 =?utf-8?B?K24zTVdsbXBoSU5TOFB0Y0lHNEhjRmw0KzdpeGx6Vk5GNmhyVWUyRmoySzRr?=
 =?utf-8?B?dStvSjZzSm5kdWxYVk9VMXNDQzJuRXBYTXJwOU9sNWY3SHovaHdlajRYdlpC?=
 =?utf-8?B?SlNvaTFiVWtaQTRhLzZ1cU9NZHZEc1dWbmZqK1ZLSklYOEhkRTFYdTZhODBp?=
 =?utf-8?B?YUdIaTg1cC9QS3k3WEpndWtRV0NQZDlJRDFzeVhYdFFrUDBLeHAyYjNDQ29C?=
 =?utf-8?B?Ky8zMFFGUkROaDAyd0x0UGd1OU8zYVJOalFBai96MVRZdGF3SXZ3MmxsWCt4?=
 =?utf-8?B?bDR3dGRvV3ZlSzJydkY4S2NINzNEZDZScUw2cHdqZ2RQUVUvZURWS01nay8y?=
 =?utf-8?B?bHVmaVMwa0IwaGlVS3lJR0IwUmJWZ1NhVCs1YXhjOHpQYTQyM08rMHFHdXcz?=
 =?utf-8?B?WXZmOGZSZUJsWmVMZWEyL0FhbFZYcFlOMnoxZHVFb2NVUE04SXNzTVBvbVpV?=
 =?utf-8?B?alg0Sk1TRE0wcVdKVlBpNFJaUURWaGVBOFAyRlc2WTJwNGwyYVJYKzh0M2t5?=
 =?utf-8?B?ei81Qi8vRHpEZXdNbU9MVzRGVC9PbWUwU1JqUXUvQXltc054VWV1dldlMVBW?=
 =?utf-8?B?c3JQNzBRb3ZlbzJLY0lnUzBoZkNNZVF5NVFKRUlJc3hNZFl3Ykt6STROM3lU?=
 =?utf-8?B?MXJPay9BdURDOURHQThQWUZjUFRUZ1l6NlNSK1pCVDV3S1o0a2VtblNWMWRy?=
 =?utf-8?B?TlhsbVoyeitvQWpRVnVaZ2NMMm9vdm1lOEJtN3VxY0UxeDk5Q01rSkdtanQv?=
 =?utf-8?B?dDZxSzdaeGVMOE5mMUJRNlJxcnNJcEt2YkJ6TFdIUVNwSFdwSzhhWmdlZHhP?=
 =?utf-8?B?VGlPTXhWWkZqK1VLUzJNcUFZcGdFT0NSWll4VlFWVzlZZXdlSUZINWdaN0FC?=
 =?utf-8?B?Z3ZmZjZaYm80U3ZjVWM1VlBQNGFjc1R1NU1uTVk2SU0vZzRaUVdkT3k0V1p5?=
 =?utf-8?B?eGRDSjUrY0htMHdEeUg1RW9PNUZSM01DbUJvTTZwOGw5ck8xWit6UUcvYkVw?=
 =?utf-8?B?ZlRjL0JmTkhVTVBqdDNaK05reFRFZ3JDRVlZZFlzcHNBa0dZeU9tTHo2QW9C?=
 =?utf-8?B?ampWOGlhMFVNVUdCYkRjdnl0dlAwT0pvZ0NFWHJhaFVZbHd0TFFSZEJXb2VC?=
 =?utf-8?B?SkozVUtsL2FVSS9WRW94eDcwVTdpY2Joc0RENC9RL1l1VXkwL1laSU1iejRM?=
 =?utf-8?B?ZmM0dE02YzY0NFN1YUtXQ1FYcVZIV0pSVm9iMHBGTHBtWkNvSC9aaDdwUEUv?=
 =?utf-8?B?d2VHSHNKVm5wUEthc2JtczRBTDRIcmEwTktBQ1A1S015WlZGamFBTFpBa3g2?=
 =?utf-8?B?cUpmL0tGZzdpRXFBSkEwNk9Wa3VuVkZvbXRSV09BbjUzSnpSUm1MdnBzTm1J?=
 =?utf-8?Q?hl1QaGRPy++DH37Yfm6jPYIVV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 044a313b-643c-4bfc-1168-08dcd969e416
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 11:46:40.4596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPgS40kWQCg+ddoCv/WYyPy96NdSja/obNRJfN79vJJnsLSMAVgjpm9zEXM+mdfDkem2iPUUO4dobtaHk4g2zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8045
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

Hi Karthik

On 9/20/2024 2:01 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Poosa, Karthik <karthik.poosa@intel.com>
>> Sent: Friday, September 20, 2024 2:03 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa,
>> Karthik <karthik.poosa@intel.com>
>> Subject: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print execution and sleep
>> times
>>
>> Print the workload execution and sleep times of the test to help diagnose
>> timeouts.
>>
>> v2: Patchwork test re-run.
>>
>> v3:
>>   - Assert if syncobj_wait took more than 1.2 seconds, as it causes the test
>>     to timeout because test would sleep for more than 120 seconds which
>>     triggers per task timeout.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c index
>> 0e687558b..343fdd694 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -139,11 +139,14 @@ static void exec_load(int fd, struct
>> drm_xe_engine_class_instance *hwe, unsigned
>>   		elapsed = igt_nsec_elapsed(&tv);
>>   		igt_assert_eq(data->data, done[1]);
>>
>> -		igt_debug("Execution took %.3fms (submit %.1fus, wait
>> %.1fus)\n",
>> +		igt_info("Execution took %.3fms (submit %.1fus, wait
>> %.1fus)\n",
>>   			  1e-6 * elapsed,
>>   			  1e-3 * submit,
>>   			  1e-3 * (elapsed - submit));
> We don't need to change to igt_info upon igt_assert it will dump each igt_debug log.
>>
>> +		/* Assert if syncobj_wait took more than 1.2 seconds */
> Explain by comment why 1.2 seconds  ?
>> +		igt_assert((uint64_t)(elapsed - submit) < (uint64_t)(1.2 *
>> +NSEC_PER_SEC));

Why are we checking (elapsed-submit) here when sleep is calculated only 
based on elapsed?

Thanks,
Riana
> Your calculation is based upon the igt runner per test timeout which can change.
> So better to stick with 1 second. Or better to get per test timeout via igt environment
> variable.
> Cc: Kamil
> Is it possible to get the per test igt timeout value in igt test ?
> 
> Thanks,
> Anshuman
>> +
>>   		syncobj_reset(fd, &syncobj, 1);
>>
>>   		/*
>> --
>> 2.25.1
> 

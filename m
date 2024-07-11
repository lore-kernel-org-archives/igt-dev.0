Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0380C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 17:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C54710EB2E;
	Thu, 11 Jul 2024 17:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nt48U3OO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F8510EB2E
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 17:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720719576; x=1752255576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oXR8iIiYGUqvrI+iGTy7P8iuhKabucv8idIn0AYDheg=;
 b=Nt48U3OOtbVgl7//A6d7Hyh3GVAcF0SkRRM+mxO8CvEfxVB5oyYKqVsv
 SAx9x+HO56x7e79ccf4AWD26xPBRMpY52X6L08ZNzR7lTEVmA0EJGfIF+
 3IBmkRjO/PL3i4j6r4LqFuUZHyRy0EAiOUd+6lVPDCVfFITZEKwLsGVnG
 tCyLlbAFoYBilQsPRKp3NfyVJX74ZRpK8UDZOnxnj1sX9V8IZCvBXyIcM
 md+EG1pcYl0sAv6K+Mp0EE36J20Fa3ENkeZiodX3R89PIf9+7VhdDZdSM
 ITZnV6e0ZR1aqlEwdgC6hnBA+eFYW/VnzwwZu0lfzjJqMASGdxf3L9tKw g==;
X-CSE-ConnectionGUID: CzRftQkETNmotppP10QGIw==
X-CSE-MsgGUID: no/dBSWeRqC+yWvx/QEkKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="43541749"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="43541749"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:39:35 -0700
X-CSE-ConnectionGUID: wyadcjaFQEWruWDaZrgu/w==
X-CSE-MsgGUID: LnpDEPinRka0nR0yEsFq0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="71843537"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:39:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:39:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:39:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:39:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:39:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiyfkoZk3GdjCQIUZ1LzLjLGxyCCNqCfKk+esUeZj6sODNCQEKMdDEt9Uf8wwb5AE8uJ9O3IMK+Sv8vZ+yf/1zY5oQlLAWOciq7xLjY5sU3lMmjzpHuA/m4qCnfdui5xMCUdMLbhjhMa0plQWmDar0ReGMp9zsmCrBxALNnomZsKxZozoRRCzSuVB7X+KFQ+ETjt3bNxgAMtrJjhKsbSHVKJ3Wwny2vWCfkxomyqUHH5c6v8cx8BRSockUOk4A5zNs2yHU5BRQue8So07XmrujRPQ4so1g1Yn6SvPvCXSpI9XEdLCGZi/wFfB5WBkaHNNrEmpY0uFmYY0/AKHxwuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8YYGk4HENSmAQJDQWJ2jbt386Xq6HkbGwP76gqKApM=;
 b=p8h+wQmKRncblGD+UT7gf3jVSSv0Rz0SlVolnOVhtF46xVkDOxJXgkzrKYDkNGKW1W/ihr9VQq2IuBo+BADgseYS3G++tuiiUJ8xR4VtSv4MThzVLsb4eu8k7yyL6oVHMJH4sfuGTzv5b1ms+/+/Ui6QPin+89D20IKOUkjroo4o9IjzSfPWkLOiFYQ52OMBCZToxZKYXDtsWkAghiD9eH1jb46kzvEathHf4P+FxMpPu+73jEyAA+06obIj52A3tLHt7KMbKdCujzJkNtvWCW6EHiK+N6wFODzpmmZxagdd/LHmQ+95wCdfymGRRecpRvAR+DRRWETNDA9zavphuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB6966.namprd11.prod.outlook.com (2603:10b6:806:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 17:39:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 17:39:31 +0000
Date: Thu, 11 Jul 2024 10:39:28 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH i-g-t v2 01/10] tests/intel/xe_drm_fdinfo: Rename basic
 to basic-memory test
Message-ID: <ZpAY0M6uBVka2lyR@orsosgc001>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-2-umesh.nerlige.ramappa@intel.com>
 <7dw4w7s2sxkf4axlllqtpgf2m4v7fkxpb5tfhlgswvwrvxtity@gnkyeyww3qcy>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <7dw4w7s2sxkf4axlllqtpgf2m4v7fkxpb5tfhlgswvwrvxtity@gnkyeyww3qcy>
X-ClientProxiedBy: SJ0PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 4141290d-4904-40e7-7a3e-08dca1d06b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkRJcWczLzYzb0VjdEFKSCt5N1dOT3FDQkNpWkxkYkNXUXRtQ1dMZFhEaWk1?=
 =?utf-8?B?Mm5kcWp3ZnMwU21YWkd3czVsZDJ6OGIwY1BYTG85eHM3OG1zOVRTaFlFWmVl?=
 =?utf-8?B?SXRmelMwY2JJeFZ2bHdvbWsxQWpOK2F1QUpYdHBuamR0TVFaTWMwcHVsL3g0?=
 =?utf-8?B?a0YvR0luK2sySlNYYTJLQzRVaGx1dW1lYlJtQWhrRXJSTXo5bXpyZkxDZEFq?=
 =?utf-8?B?T1RZMFcvTDc1OHB2WVg3Ykh6T2x1enpLSjhCQWtTTjZhVmxtZVVCTEJobkpk?=
 =?utf-8?B?c1U1QnlTdWtXYnRacXJyMGFJYTg5aDZvR2JtR0NudE4rK1Z0dG1Oc1UvOXNy?=
 =?utf-8?B?RWpyRUdVMGNYazViT05aL2kvaDdBQ3dmMk83VlhDejlIZHV2RlNLZ2w5dW9B?=
 =?utf-8?B?ME1KenZ4MzJlZ2lqRVo2LzdyQmEyakRFcy9VTkdjcmxvN0lFTjlXQkN3M0dq?=
 =?utf-8?B?QWpBTlRqeTlSR0krL0JOSUhweGpUbTNCcWRTYWVLZ01sckVvQUcvOWxTN3Jh?=
 =?utf-8?B?WlVkWE5nSkwzUzNkYjFncm1YSFZRRGE4TzlMdVZaUERwcHBFbWVoVXFyK2ti?=
 =?utf-8?B?MWEwZmttTFVuRXZ2QWx0WFNKc1FjNWR0VkpaM3NVN3ZJZ1FUaGx0dmt5Y3BZ?=
 =?utf-8?B?MlRkcHhFOU90aCt6aVhjMUo1bE9udGdjZHE4WkZ3L2RuUVAxVXJIUkF0NGZO?=
 =?utf-8?B?T0hRNjRneTNoRFRqM2xDZUN1MTJpV0pQNlp0ZjRzL0RldDBORm5aSTN4WWla?=
 =?utf-8?B?aTZrdnEwMjRTeHBoNnNYK1p6bWNqQlV4MzVuUmh5SHYzb2p3V0d1UDhvU1Vs?=
 =?utf-8?B?ODkzaXZaN1pMZVBmUEEvUUQzWWpJMHdjaGFkckwrS3ZTeWRDRnVnTTM2Rk54?=
 =?utf-8?B?VVNHU01JaXBCNjBLTVZQbUttRERyeDZpNW9sK0VhaUQ2WFJDdXZWNEZLeWNq?=
 =?utf-8?B?K0JzV2E0ZFd1NVpSdWNoK1VtTk5yTjQvazE0dE9heGxrL2hoZFpFQnhxT1Vr?=
 =?utf-8?B?UTZNWlJaVVMrc0RBYUJMR1Ezb25SYnBxT3pTRzE3UHF3bElDdlpaaTdtRWIw?=
 =?utf-8?B?aTRGTUhXSkNLTXA5ZGtDbm9KanpkeDhBZzJlQnp2c2taWnBDSFhaTkVrMGI5?=
 =?utf-8?B?V3lCOW5zNHlqRURacHI5OG1zVENhYWJIbFk5WGVDOFErNXI0ZXJna2F3b3pI?=
 =?utf-8?B?Zm1YZ3pDZytOaVZocXVYOXlwVTlJMmhON3p2Y0NNQzVwS0kyelRJakxBbWx0?=
 =?utf-8?B?emxoenRVWDVzM3pqeVFKTXVia2kwL2c0dmxxbmtlN1RwL0d0VWhQZFlTWSsw?=
 =?utf-8?B?TGtDM3VFU3VrUUFFaHh5Z0dIbDBqSzNPNkpHTG05WHJSdlREY2JMQnowTFdF?=
 =?utf-8?B?VG1yaFgybkkwVUF1Tlg3dDJZT2FBSmUxbXl2bnpvS1NnSkdNaDFvYk1OdEtS?=
 =?utf-8?B?MEllZEx0dVc1dFFuV0lvTkE2R2JhY2toRE9iMmtlTjd6ZHRwUTNmazFKWkw0?=
 =?utf-8?B?SXVJTkZlN05CK1pTdXhENmJNYkgzZHpMQUJLT2ZQQUFId1VaQzJWQTVjZ1hq?=
 =?utf-8?B?dVpndkYrcm80dUY4d2h2cXllV3FOSVpMYk02V2J0WG1xdVlaWXovTVl4ZFdi?=
 =?utf-8?B?OGJKTFdEM044NlVnMk1Ldm85SlZ1R0l0OVhwNzVQdnc1Y1E2SWhBdlpXdWt5?=
 =?utf-8?B?VDdYNDRyQUlkY0pheGJXTmpMKzJVU0ZwUVRScVFvVzN4NWNraVR4TnBEb3JG?=
 =?utf-8?Q?dDzwyw1Whnd7k10D0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFNyZ1lLV2s5VFZJSkIza3lKSVhJdXBRYzhPaTl6a1JvZXpaK0FvR3ZqZHhO?=
 =?utf-8?B?Zit4MWpFUGUyMTRkNFFoL3h6NHZLcWdwbmJNZjVSTGFkbGtDcGxjUnZKNzVY?=
 =?utf-8?B?Q1l3aVk2Zllpc3JIYmtuOHZ5YVJxRmdHb3MyUlEvU01ucFlWOVpEdW1nYmVE?=
 =?utf-8?B?V2pwUTBJVFlHVno0UjRIRHZTRC9ZRmV0R25ZRHF1ZXI3TjBvNTdrcm44cUNw?=
 =?utf-8?B?a09Qb2N5SkJwK0pLclUzS0F1YVEvRGljOHU1dlV0YzdRUlpxdmNCZjNqd0VQ?=
 =?utf-8?B?eHByaDhzcThCRUZJTVQvNmp1SGNXdGZSMnVMcXZjdEhuNlZqZCs0Y2tTN3Jl?=
 =?utf-8?B?bnp5dWlEYVZxd011S2QrUy9DL1NsR2FPcjlyYXlkVnlwcXdmbzc4QUl4MEpv?=
 =?utf-8?B?VUtBU0xWMU50cHZRRXM1L0o3WWczRUp4aEcza1lUd2d0b0czMUNrOEtxdDhD?=
 =?utf-8?B?TjEyQ0RQck1YNy9leW9qTnRyTCtRSE5YL094R3BzdDJLWHRhWDBOdC9MMmps?=
 =?utf-8?B?YktBeUN1dHJOdE5oeGJEYkF3c09GOXZUYVBYNExhMCtNUFhJQktJNmJDTGR4?=
 =?utf-8?B?R3FNb2g1RE4yNjlidEhWMGFjbXNGaEw0SjFKaXdQSmJieFE2b0ZRQ0FLQWVQ?=
 =?utf-8?B?M1luZVl4N2ErTldvdXc3NnY5eGVXTGVYOGNNR01ES2UxZDdXREM3SDBKV3c0?=
 =?utf-8?B?dDh0R0l4RjdSQmFPeVBkSVRCT3htdEdkR004SEJ1cFEvSlRHbkdia3hQdHFT?=
 =?utf-8?B?WkYwQnNzZ3NzNUVCakxOOXZteGtMekk4eHdWNXVwc3gzZ09LQUNVWWtmMms4?=
 =?utf-8?B?YTh4U3cwdlY5UWtyVXZodUNHM3g1RFdZZThPZ1BnSG9PWENKU3NWWU5obGZ3?=
 =?utf-8?B?Skg5YzdPaTBWYlFlbG4rYWs4RXVuSnA2dGNvQnFVR2pmYko5L0lmQmF1anRZ?=
 =?utf-8?B?OFhheHF3dXdEVC8vemtpSFByOFJyb0lXVU9ySldTOHh6U2k5emk2WlpzR3Zk?=
 =?utf-8?B?Tkt2VzZ3NjhkdW1UVFk5WHBKN09LdC9tUmNqUTU3NWFmdk9LazNZQjdQdlVn?=
 =?utf-8?B?OHorSGsrT1Y0RUhOVW9kMTRKT0I5Z2txUU1YRlU1UjNjVndRN0l6YUNIVWZm?=
 =?utf-8?B?aDNGaEE2Q2ErN0pIeXJZbnNtWllvN2hQQktLa3k3am54SFBreDFmSVdaZTlu?=
 =?utf-8?B?MXdTcmIwYnQ5anlWelBlS2E4d1dWN25Qc1BOYW9wYjlYL2d5M0laNzVsZWlu?=
 =?utf-8?B?bTF1VUZEem1ocUhXNEFBaXZEd1gvcXBUbEFHUUpyRENxaTJGWlBFN1QrUjFp?=
 =?utf-8?B?U282WlIyM3I0eFFpbEhzQWZTSDU5U09iZ1p2SGx6cWpSajB3N05EUjdhdmMx?=
 =?utf-8?B?Ym9JZ2EyNkFVSzZDd1dkQTZaZUplZm9pNGVZSjhQQnUzeXRndEU3Qlc4d1Qz?=
 =?utf-8?B?bjgybjZSZ2ErTHRiUk9MMTNocGtSVThUUjBHaWhSUS9RQm5rT3cySmhMdTNz?=
 =?utf-8?B?aG9yY05uNUFpKzBvZ0ZidWFhOEZRZUtsVmhya2YzSmUxbkc0SjF0cWx5U29C?=
 =?utf-8?B?SVBmeThNaVVLTkNIWWViTFl2WHhWd3hEanV2VDNicm1UVXFpKzdUc3p1dm51?=
 =?utf-8?B?ZmF4bVJnWVgxT3Ztam1NbGpZMGtvc0xzRzRPbFJqRWtobUVDRUxoeCtoY2NF?=
 =?utf-8?B?MCtzMUtRUHdOaGUzaFdYeHlXWk41eGQ4RVk3aHQ2KytmLzVxWmdPREFMNGZT?=
 =?utf-8?B?a3prYmNpY0FWTGFMTEl1c2UwS0l3eTRoQzdkdEJKV3VRRFFaWk94QnJ0eGR5?=
 =?utf-8?B?RGxjZW1lQXBUcnlQZzF5S2ZhcWVBM3duWjd3aURMRktPOFdyU1h2TDlhWXkw?=
 =?utf-8?B?QXBvRDk4Rk1ZakgxU0Yxa2hnbzJaOGh3NmpEV3Njc2hlRlFua1B5ZVlrUUpT?=
 =?utf-8?B?NnhZbWVXSVpSS2NFOFkxWFdDOE9tTk9kTmp4Q0ptQ3VhQUhZWXR2WDVnWTZx?=
 =?utf-8?B?T0xhRHdQYllwVU92ekRJQXZNa2JUcFUrbVJSK2pHUEJKc3VrME05R1JVWFo5?=
 =?utf-8?B?RWc3b21vZ1hzVFVXLzBPa1BrMHFhVmVNL2J5ZlZVNG1YZjhDbzFvRURqSEtB?=
 =?utf-8?B?eTRteWx0dTZDVDFkODJ6UDR5WHNGM0FNeC9PYWxaSTBBa0hRcGd3d0FsZ0tR?=
 =?utf-8?Q?TZiQKdRUigwd3fOGjhP0wx0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4141290d-4904-40e7-7a3e-08dca1d06b8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:39:31.0257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2VUIS0zNX9ssqjTes7b/58v2OQ/C+XYgg0ctBdrHZy4r2sjqGRSmZ3Vpd0VdDjgXww2pEEvDcmD0+clinpCrBYfcU/8HK1jY6wN3X0GPFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
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

On Thu, Jul 11, 2024 at 07:00:40AM -0500, Lucas De Marchi wrote:
>On Tue, Jul 02, 2024 at 05:25:23PM GMT, Umesh Nerlige Ramappa wrote:
>>Existing basic test is checking memory info in fdinfo. Rename
>>accordingly.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>tests/intel/xe_drm_fdinfo.c | 12 ++++++------
>>1 file changed, 6 insertions(+), 6 deletions(-)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index 2ceafba24..f0aa23e2f 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>
>I was also expecting a change to the testlist... but it seems we don't
>really have this there.
>
>https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=xe_drm_fdinfo
>returns an empty result so it seems we are not even running these tests?

Strange, for rev2 I actually saw these new tests run in the shards list 
and was expecting the same for newer revs.

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11334/shards-all.html?testfilter=xe_drm_fdinfo

Umesh

>
>Cc'ing some people. For the changes here:
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>thanks
>Lucas De Marchi
>
>>@@ -22,8 +22,8 @@
>> * Feature: SMI, core
>> * Test category: SysMan
>> *
>>- * SUBTEST: basic
>>- * Description: Check if basic fdinfo content is present
>>+ * SUBTEST: basic-memory
>>+ * Description: Check if basic fdinfo content is present for memory
>> *
>> * SUBTEST: drm-total-resident
>> * Description: Create and compare total and resident memory consumption by client
>>@@ -259,7 +259,7 @@ static void test_total_resident(int xe)
>>	xe_vm_destroy(xe, vm);
>>}
>>
>>-static void basic(int xe)
>>+static void basic_memory(int xe)
>>{
>>	struct drm_xe_mem_region *memregion;
>>	uint64_t memreg = all_memory_regions(xe), region;
>>@@ -299,9 +299,9 @@ igt_main
>>		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
>>	}
>>
>>-	igt_describe("Check if basic fdinfo content is present");
>>-	igt_subtest("basic")
>>-		basic(xe);
>>+	igt_describe("Check if basic fdinfo content is present for memory");
>>+	igt_subtest("basic-memory")
>>+		basic_memory(xe);
>>
>>	igt_describe("Create and compare total and resident memory consumption by client");
>>	igt_subtest("drm-total-resident")
>>-- 
>>2.38.1
>>

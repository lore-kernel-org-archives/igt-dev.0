Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5DECCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 16:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398F110E4F0;
	Mon, 27 Oct 2025 16:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J04tmYIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D6310E4F0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 16:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761581703; x=1793117703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TcOGLSpphZKCZjKHAva1xZYko/sLBlxqkzYNQMFdO54=;
 b=J04tmYIGHnQtZpdDlwFJhQlmNmz0xtlWcx8NkWvPAhluhVOsmGsHhoCn
 jOel2mw16xCCKpNUGe9+nV7tZZNQLWZgEflBLKDJe2LwlF0G5jaO6db6O
 b4FIdG6ihNfQVjMzkD8fRmGJUWMMXLqtP+gfy6zAWRV5YwvDgsFwAQPUb
 ojMuMMY3WVA7XQOKzWh6iKfisCV/JGduAbXF1Jj00GljzbtiN1kfVAZ3/
 Qlm1/RGqMsd8dCpdwio2OC7H7OmAOTWt9cH+EL1W7nXWll1nfhQ/dLhhd
 verGJrY9jW8UJ5AfhtgumDuGlb1SduOEF9Gve+R4BUXLTe2lAj0coEHi4 w==;
X-CSE-ConnectionGUID: VyhZh/fwSMK4JJxS0f0Vdw==
X-CSE-MsgGUID: WqobsvSES3CLhabDyhbE7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51242225"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="51242225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:15:03 -0700
X-CSE-ConnectionGUID: evKBMvo4QXeTtJrFhOfsdA==
X-CSE-MsgGUID: ypbYsbaPQTCwsNgySLo3BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185849381"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:15:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:15:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:15:02 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAZpF4cSbB7nvtaguJDE/g7y1DC0qEPXwp+xgehd52b48eYX2g6fewyZRr4VmsZ+X92/cDb+PBQEojy8c9x6u8TT6mome8aQ5mup44UNTAG5Cx+P0Wo2ZlaEtEdcvi/xXA51sScitIKYnS8OC9eTKekiwqKQ2OU+CumeTmr2+6dAkBDyuhf342rM3OmtPshcobdOzQU0JkEUHRpRAgnLlGCcJqh/xlyt2eIBvLsNHAR8RentiFYXzrQdmCJgIL/nmbpenjc1ba3bgq7LFlEgWUTh5SMu1PhW89EjRKjg/fELt3/sOhr6iCETeDXYD6lMQfEPfvfWr6/18CuMpkuAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2hTLqk16yuQT8+e3iWYAbcTzKcG7yNS0+6BbrmqKsc=;
 b=Pfw3roN2fIQOqkR8QH53KgQ2WMTVXnwXDllP0fOv6YCrMik4QqhVtE81t1eB+23+6yVppqcsLmIcSf5c2qU+fiSjW16Ser6FhYMKn+pNqv0j606wHxsUFbWwyr+R5nsF+mN9CxEs+AmFxwILGvTkjR2a0vday/Y0bGYG/pXg0L416TcX+Kx48MqRO4QOlgnM4zY1aytHibqcL4flci8N1W7j5lDTSMHE4Bkxv1rFGu/NTZregmxU/KRTKi1/E9o9BUuLNOL9U0a/P1VIwtvGEkiCrVPqd6dsfnO2RgOgZVeu9XBQM+HSsAwSS0Is8LFCxXbe1jh25ZyDyHOQJsaK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 27 Oct
 2025 16:15:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:14:59 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Jan Sokolowski
 <jan.sokolowski@intel.com>
Subject: [PATCH v2 2/3] lib/xe_mmio: Add init flag and helper to check
 initialization
Date: Mon, 27 Oct 2025 17:14:39 +0100
Message-ID: <20251027161440.2906378-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027161440.2906378-1-piotr.piorkowski@intel.com>
References: <20251027161440.2906378-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: ce89b851-21f7-4667-458d-08de1573f9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkZEWG9LZlo1Z0lyeEVWeVpNaEVaN1RqeFhuYzU3eHo1V2NSa2VEejFUd25h?=
 =?utf-8?B?azFacXZ1K29jWjY1d0F0NHNzVVBqcGY0RE1aVHRLSi9EcjdXUEdkZ0dISlI0?=
 =?utf-8?B?UEN0WTQ2T3NDV3lTbzVNSmNKNDJXb3R3ZEhEM25XUlpSSWgwNEl0WklhWTll?=
 =?utf-8?B?djJXUjU5RGFYV1NzOVJkUGIvRDBNdVVlTkp2VTJDcG1SWmZMVG1rZmp0RGIy?=
 =?utf-8?B?NWV3cUZqTUd5Y2tFbDFHWFFLM3JZbmVxNVlZQWRzTGhMU1JQT3lxdHRPdHZB?=
 =?utf-8?B?cUJCMmNybUdJSW85M0ZRbm1aZW0ySGhGS2gxZG1nRDJRQlpPS3V2OUVUclMy?=
 =?utf-8?B?cVRsYm1mMVBORDZmcHR3a0VoV3R6N3BaM0s3ZjZWWENGVzd0U3o4WlhyTEFW?=
 =?utf-8?B?ekJaL0l5WmQrQWhaeU5IcVVsMmZIWWV4NXhPTTdhc25hTmNqWWxub205bUhn?=
 =?utf-8?B?VWdGbHNaV05OS3F4Rkh2UHRBQlV3ZkJ4dmhBVDNoYXZQdUVGY0tiakVyRFY5?=
 =?utf-8?B?MU1CcjE5SHdrMHh0MmNRMGUvSEFZbEZJWVBCejZmNkIzRm95c0xRV0xRZmd6?=
 =?utf-8?B?SDhmT0VZTlQvdnNGNlNSTjVWa00xK21Rc3BiVi91VlRJREgwcGx0ZWtBbUhR?=
 =?utf-8?B?eVRpd0xzQVdGTXpWK1NtdElJSkFPVFdsRi85T202dnM4bmlQV3ZUQklvWDlL?=
 =?utf-8?B?ai94TkhhQzFlQmoza2dCZDBuSXNabzJCODdIbGNpTXloMlJlSXRrSUoycHlY?=
 =?utf-8?B?Q2FzeTBFMVZvTmova0hmUkVrYzBWdk1YOXRVejZaTzJYdjZMSThXNGd4RWJr?=
 =?utf-8?B?NzNMUEcvQmg4Y0xJTVB1cm9HOTFKcUtJaFZDMW5vMDFLSDJqeVlWY1QxeHFI?=
 =?utf-8?B?Yldwd0NuY1V1WDVMaS9ocTg1bE9OMUxTRjVWa0ZzZ21vRzJKa0Qwb0hmYVlM?=
 =?utf-8?B?YWRSNC9RUnYxdkYxMmRGUVlkSnJjQ0s0Qk5lS25ETlo0Z21Kbkp2R1RiM1gx?=
 =?utf-8?B?YVBkRHFsY0tsN1p5VnBRUklvSmNRYlh0S0JYVU92MFBVSFZmRkZKbkIxa2wv?=
 =?utf-8?B?V0VOcFZualdGTXJYVytLTCtIeFhOSi9aSGpweVBtNVNaVE1ML0kyN1gwZ1dG?=
 =?utf-8?B?S2tDQjBnbHc3Qlo1dVhYM3VDalNNcDg3KzR1LzRIM2ZLbmorc3lvQjJGRzQr?=
 =?utf-8?B?YUx3K0FoLzNKbjRYdFlmWjFkQmNMRFJQM3ZaZk4zdnFLTEdYelRQU3M3RjJE?=
 =?utf-8?B?ZytGZHcxbjh4OHZyTENxUVF6Z1p6bGs4YnVlaHIvZXEwMnVVbkdidk5JWmV0?=
 =?utf-8?B?K3NVWnBHVTRFei9naUttVUh6RnlWbFhpZkZpVy9VSWZkWS9weXNJMXJVbmFH?=
 =?utf-8?B?MXBES0dQS2dXMUl2c0xDNERKY0lJVkNDMXBXKzhFYXA1VWxzNk42WERlckEv?=
 =?utf-8?B?Z1BaMU42ZzI4MTZMSk9yRUh5N0ZzVjU4M1dWVDQ1enVJYUJ3aDhPRHhVWnM1?=
 =?utf-8?B?enFZUTJ4U3pkRXJNVUxFKzVEeVdoMEo2cWpvczVPcjd1aExUVlNRYksrZG1W?=
 =?utf-8?B?QzJZZ3VyY05IRk5RSzdRK1puY21JVGY2OXJpdHVqcmt6aGFFczBlWEJicXZk?=
 =?utf-8?B?V29MNWhSeTAzQ2U2WjRVOVpQV0hRUk4zbTRyNWUva25vWTZxRzU5bnBZOHVj?=
 =?utf-8?B?WGdlUmszaDVEK0c3VkJvTTR3WDJhK0xlbmQrWnVsWHhySjRuZ0NTQ2lxcVd5?=
 =?utf-8?B?R3JHdmZ0a3lvVW9YQVQ1U2MxYS90RU5DMllQQW1WejhnQW56bXliYzliMm5F?=
 =?utf-8?B?VlR5MS9lSTNpaHdZZlREcHQzYnE5V3AydGgyaWw3WldvYkZIemN2VmJtZWdP?=
 =?utf-8?B?V2ZVTmdxeHJFVWdSRkRpVVkwT0x4ZHZiSGtrUk56SVNLWnV0NUl1bTVGcEl1?=
 =?utf-8?Q?bfGbV2Z1LSdeglBJVCK1Yspa4wtkVD/e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTRTOVRFNGtGOTdBeXF2YWJSY09SR2ZNdDlzYS9XTS9DdGNYV09aM0xuU2VE?=
 =?utf-8?B?V3lCUFNzVWJ4aEJLNjFSUWp1ODZIb3BhWVF2SHVlQWFHRGFzbEhkRW5Bejl2?=
 =?utf-8?B?SGFjcHdiMFhNVXl1bG1oRHRENnN1VWZ0dGVuQno3VzVPTmpVQmZ2ZzJsaHQ1?=
 =?utf-8?B?T3JQbzdKbkt5TkJ1T0gxL2NvSmEyY01PUEtVRDNaT3pWTFJoTTdjSG5kRmVt?=
 =?utf-8?B?bDFDWFMvalBuN0s2R2wva0g3VXByKzIrK1J5QUh2elI2ZVBEY1JHZ3NvQXY0?=
 =?utf-8?B?Y2lta2JuamhuYUttdmRDZ2x0dkNTSlRmeVJISU1BN1FINkVjYjI0ZW9MRXEy?=
 =?utf-8?B?YnRLb0hTVFAxVnY1ajZYYVE4Sk9DdzFvVnVLbVd6YmF1YXF4cElYUFZ5Rnoz?=
 =?utf-8?B?OE0xT01xYVJTZEF6dEpCZXZVS3g1K0kxWkpBSkNBOGRnaTN4bWtHVkhzdE9B?=
 =?utf-8?B?RVpyRVlMYVYwUUxJallDcUFxTm8rUXpUb1NDTTRXS3l3ZWZuUGt3ZGpMOWtF?=
 =?utf-8?B?OFM0WUpSNm1RV3IvZG44WWZSQ1pOdjJDNkJLVEhqcHdvdVh5NnR5V0xDRk03?=
 =?utf-8?B?Z2ViL2tGWDJmdGdlYVQ3bHdLQ1pwYlVNSE1GblNkcFQweUtJVzhpZHJzSnJk?=
 =?utf-8?B?MmR4QkRPa0pydXRaYkZaK1FtQW81bzY5M3k3V2FQdDE1KzZwQVRoYzd4LzZ5?=
 =?utf-8?B?SGg2YkFIS295cytia2RhbUp2WjFqZWl6NXJ3UXdTeUN4MkRqZi95cUJmT1Bz?=
 =?utf-8?B?WVBiRXl0M3Fzc1lNcHJYSmhhTVFSY0MwQjlLVWtNNDA3dkFQdk1EMi9Ecjd5?=
 =?utf-8?B?WTJOaEc4M0xSekJPVFI4T29PRUR3dlQ0dlU3ZGwwTmtsanpTTmFyOWtmWnFp?=
 =?utf-8?B?WnF0NDNreE5WYlNMUnhjazNiUUljT01jU2IrRk1YeXNGQXk1RDFjVm9ZWVZM?=
 =?utf-8?B?RVNkMzlRSWoreWxMaEZCQ3BmTHMza0F2azI5YnlkU1J3cnY3aXhOUExaQ21K?=
 =?utf-8?B?RHU4dHBRVVhsdDh0OG01RmZ1eWpiSzBtdzN4RGJnakliQUlPRjFEYlFXLzBs?=
 =?utf-8?B?K1dxV3dPdkNlakF3ajM3eXFXK0IraHN1RHpwdm94a2h6Wk9JdUJkMGYrS1ZZ?=
 =?utf-8?B?SjZmYnZ1Q09FVHBYQnh6N2lNR0t2NVJqWDJWdE4rUUxZeGc0R2VkdFBGUUZD?=
 =?utf-8?B?RDNoV0NkQVFlM2FUUHJ1bmk5a2dGK25Fa29Qdkhxb2hseE9ZWm5BSW1hdXly?=
 =?utf-8?B?dDFhMDdZS2RpWTdTTjdOTGtoWmkxZ2duWnN0WVQ4NytLVnV3Zkp5OWJBNnFm?=
 =?utf-8?B?V1p1eHp2enR1OERIenR6QmU3VUhuNXFtRDJSOVpleEl1dTJEMlVtOVcxZkds?=
 =?utf-8?B?ZFFiem1lQ0loNkhrWXBOMnNRM3BTVTdXNnRXNDJtZGNwbzlKZ2hhT2ZMYkMz?=
 =?utf-8?B?RzJCTEVBYjVWeFdDOEtFMjdtVGh2Ukp1TFdaQjN6OXN6aHdkQ0UyVnV1dmh0?=
 =?utf-8?B?M0NLOXV4ZU1HS29kT3QvNm1Kdm5ieXM1ek1XNGRZTTlUbzJMTkNHOHF5ajlQ?=
 =?utf-8?B?REpVak5tQnhtRTNDbVlXSHNwenpSalVFekFvTGVEUTArWEtZMVRoMGEvU0Ns?=
 =?utf-8?B?dXdYRitCZ3BBTHp3RkdqeG5QSTZXRUJKdk1ZZk1Pb3NZakNQTFF5MFliRTVi?=
 =?utf-8?B?UTVZTE0zdUR4ZmVZc0lEcjdzZFQwem1Jd1loWHBlWndnQVYyTzhoTEdvYnFU?=
 =?utf-8?B?ZUp3OFpRR080NFJ4bUphRjQ3bTBtVEg5L3o4S3luM2RSZktaMjN2NEJzZCsv?=
 =?utf-8?B?dUt6aTZKUHZucXNUMXpQZ0drbFhTWWFwV1AxY1k2ZWxhZkRuWVJoKy9qNGdN?=
 =?utf-8?B?QkFCa3VhRldnbTJUdEtidUd0V1FkRVpzMlNuNk0remRnVWxQL3VCTFJEdFhP?=
 =?utf-8?B?cFY1VGkrSjl5ckZWWnNqZWNWd0pRNzJFZHR4MUxQekJSRWN0cCtwRTByY09u?=
 =?utf-8?B?YTdrUUo4Zlo0RGFxQks4VXZqMXJPQ2VtTzBTWTh6NWVrcG14Sk9ZMzdyMWlt?=
 =?utf-8?B?bWs3bVc1VnRVRGhDMTlsWVpnbWR6TTdva2FpT2ZqdmdKWHQzMFh0anllTC9r?=
 =?utf-8?B?Q0VLaUVMNEhaZ2t5T3J3OVJldGdVcWVjQlBEcEp1TEhQVGphTGdEampId0Na?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce89b851-21f7-4667-458d-08de1573f9f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:59.7862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAGSZRJJdZDnIhgJn0vQdjFWbruWigYA/7rq5ZodwhU3QsCxYOEp3jJgYryaaH/LK2v/MN2Xbx+fKU259cI7ffkFU3qrtvlJsL6YvUsj7gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Track MMIO initialization state via a new `init` flag and expose it
through xe_mmio_is_initialized().

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/xe/xe_mmio.c | 14 ++++++++++++++
 lib/xe/xe_mmio.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 8bc446fb9..43aa354ff 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -25,6 +25,7 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
 
 	intel_register_access_init(&mmio->intel_mmio, pci_dev, false);
 	mmio->fd = pf_fd;
+	mmio->init = true;
 }
 
 /**
@@ -39,6 +40,18 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
 	xe_mmio_vf_access_init(pf_fd, 0, mmio);
 }
 
+/**
+ * xe_mmio_is_initialized:
+ * @mmio: xe mmio structure for IO operations
+ *
+ * Returns:
+ * Non-zero if the xe mmio structure is initialized.
+ */
+bool xe_mmio_is_initialized(const struct xe_mmio *mmio)
+{
+	return mmio->init;
+}
+
 /**
  * xe_mmio_access_fini:
  * @mmio: xe mmio structure for IO operations
@@ -49,6 +62,7 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
 void xe_mmio_access_fini(struct xe_mmio *mmio)
 {
 	intel_register_access_fini(&mmio->intel_mmio);
+	mmio->init = false;
 }
 
 /**
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
index f15017c96..1710a384f 100644
--- a/lib/xe/xe_mmio.h
+++ b/lib/xe/xe_mmio.h
@@ -16,11 +16,13 @@ typedef uint64_t xe_ggtt_pte_t;
 
 struct xe_mmio {
 	int fd;
+	bool init;
 	struct intel_mmio_data intel_mmio;
 };
 
 void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
 void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
+bool xe_mmio_is_initialized(const struct xe_mmio *mmio);
 void xe_mmio_access_fini(struct xe_mmio *mmio);
 
 uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t offset);
-- 
2.34.1


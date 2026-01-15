Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EA8D4115A
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 10:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA3C10E1BA;
	Thu, 15 Jan 2026 10:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtgKKzFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ADD10E1BA
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 10:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768471811; x=1800007811;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dklOfCB7MSzez38M/dloAAwr81775ujhS95B1vVc8v4=;
 b=XtgKKzFTDMRpx+hxCf1+J7JbQNc1TlEr3AhoE0J1L4dzl3mIheo0fMeG
 rKP+oUlYy54PMOzDEMyT7f/DUk5nQ6sKmPEXiLolfpApk+SjpR/3q634k
 duTMcVjK5QdjkzSirDVKOLnP6fwg5jx6SK7B7BRx7v3UFRCfPWXsLVNt2
 v0oO9zS6TXsqyiq0cneIVu8XYZe5fYaYjchjszVfLFZ4DADEAK+iJhVrR
 yhqA60C6+4GUOQRYKk9/rVl8CDRr3SWCEG4ik6bp9pJOOgulMX0LDczn1
 ud9NHqDm27gSUYvD9OLmcZHq6xm5jz/ktUZEt9nOrjUc61b+Eqb0fZj0e A==;
X-CSE-ConnectionGUID: 66gpOT0sToGbUkVxl6d8rA==
X-CSE-MsgGUID: 87vF0eNURc68efXnNyfwOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80419511"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80419511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:10:11 -0800
X-CSE-ConnectionGUID: UCIs852YTneOhAULFR8IZQ==
X-CSE-MsgGUID: +k2mVFw2QP6FjCzxD2mV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204974450"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:10:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:10:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 02:10:10 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:10:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsQLhaBWrrbfFm/hCWDsTOjXqBN8FoxCKNcORHlB9HQpfnIckDZrgOucXbMkWqrZRN2e5O5SCKGnUCcM4sAWOGQiHqrrOeJHlrCa50tn30Qr8vuBHyFKWsXM4ExAa16YF3HATlehKTC5SYY5A3M+Du/DArpGbOWkFjambWeLIG1YuSj5NLaEL34cNHNATHLoyEc63SNKo2U4I6Rd+c0A2nwS0hNrNA3WbqnjPi+dTAz1mcar9kmLmUYUr3vSu7XEgPTrSUWKu3XuBu+7cLKtuaJFmO2Fs2gCST/JKh1Obd9z/Y/zc6F0/Q6nSvXcftdTNih0x2JCv6VTSEAtfaNJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jISSjzxRq+Zd7TJSYXJ8Xiu1LWEV6tLKxmWsubDQto=;
 b=A6/ACdtqYa9oTR9E7Ms6hphRyARgb4/a8KOkcIaHX/yuvw0YKaKZhD3F/mlEM9RN7brt/GRt908ePNEnGD2PYBR1csXGcwiMLf/BgUfF9Iqu9NzS9Cpfh1fT2Im59MsWpkth5atIWhFir0n8bRr4js75T1SHIwr9/abOU5AbF+5WsCBheO0oD9UcEbE6+zz71T+eTzSqHVnHHFGqGp+r8xN4phUM+Aqj9pjyzvbnYbEgEXz8SpiKfB420CIGMhwJGc6HrdsU2TJcOAAYFKKblaY3FxBP9c8w4i1+yMF3d5Loyx20nKzFqw0YMx7hDCIxD1CYRgj5tnXYBzSn2WqYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:10:08 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 10:10:07 +0000
Message-ID: <da19cee8-8deb-44d7-a7b7-741e8a98707f@intel.com>
Date: Thu, 15 Jan 2026 11:10:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 10/10] tests/intel/xe_sriov_admin_profile: Add
 SR-IOV admin sysfs scheduling attributes tests
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-11-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-11-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::40) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 3284ef2a-0e02-4702-36cf-08de541e429b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUF0czIxYkhPUzYydEF3c3VKa3NMeDRyMmN5dHNUUzZNS0R5Y0RscVNqVVIz?=
 =?utf-8?B?aXk5K09xemFmOWRhU1BnN0tNanR3UEgwSFRONHdqR2pnb1RFWlp1RGRzdTZv?=
 =?utf-8?B?NmdUWlBBYkZGeTRnMTdtVDRYQ0tacDBlTXJUaGU1QVVkYUQ1NzQzL0xXOFd5?=
 =?utf-8?B?ckxxN2IxcVUrTWV6RFIvd0pRQ2VWRVl4SHNVQjd0SDVBd2JmbHByM0dsTDJ2?=
 =?utf-8?B?N1YzRmhTV20xOHMzNDUvWjlEb1UvMWdaRmxWbmNnM3J4V3NWQ1FZZy9DR3Aw?=
 =?utf-8?B?RXN3S1hmRUxqRGozMUxxSXdhT0doTS9JS2RKMHhUaUh2K0pQeHlITklxNXp4?=
 =?utf-8?B?VmRyR2dCcTd6dEdYQWtZSEMwbXBpSFIwWDA0T3EvRTlYMmxTdXBGS1NIYllU?=
 =?utf-8?B?NEIzUHhIbmZJbDdpVlA5L3IyS3JvUmNvZGYrRC9LUTVzeU9YN2dDQ29IWko4?=
 =?utf-8?B?MzJJK0hhczBkaTAyb2VXL005Z21NZkxaSVBQZVUxblF0Q3ZlVTVOZXQvNEg3?=
 =?utf-8?B?dEloRjZQVG9SbHlKUjdSYytHY3hKSFZ2dnFYOWlYRG9Pd0V5KzhqZmpaaUZ0?=
 =?utf-8?B?Y0MyUmNWNnFlK2M4dU51VjFOT1NWQWJnVkVaTU1ndThMNnJFUGIzZkp4MlVw?=
 =?utf-8?B?anFuU1Fpa2hUcXowY2VPdzRKc2N4VVdFdXFxR1hlbXErVmprZVoySHpERTJw?=
 =?utf-8?B?SlVlbU9la0ZjVDFtZjQzVHU5TjZsWFBjZmJROHdybHdKbk10b09hOWVBS2tz?=
 =?utf-8?B?WmdObWFoWWNJUkUxWDdrQzhuRXAzQ1ZnWUNJN3ZRVE13UFZSM2Z1RG1PQUxv?=
 =?utf-8?B?ZGlyNnozcFdtdE81RGhiZlc1OFVPOUYzRGdsZ3IyNmYvM3lTdlVrSGNwSURH?=
 =?utf-8?B?bkZnR2hOSjByVWR5NXZscnJOUlFTbi9Ubk9rbkM1eHVHaEl2V2lrV2g2WVVW?=
 =?utf-8?B?RExMUDdTWXhsVXBFRmdSOFJ2RGZ4ZXVwdXNwR09LUHR3KzJXMmtZcUFtckMr?=
 =?utf-8?B?V1Fld3V2WThGTUhpR01BT2NGTWxYcTcvcTFHRndUOG1iNmc3b3lod281UkJF?=
 =?utf-8?B?ZGhZS3VJbTBnK2pLbHRSZWc3aVQ1N3NieERVN20xekFCTHdlQTJIaVRQSVRC?=
 =?utf-8?B?b3BNeE1QOUQvVHN4V0kySkkvakFHTHh1Ym44ZXo4c1lzWFdDVkRQM2h2Skp3?=
 =?utf-8?B?RTZLN3ViMUVvNE40NWNGVXVkdnRFRlVDUmw5dGZjRDEyWkh1Ly96Y1oyVVRv?=
 =?utf-8?B?eXpKejVQU3BoWmp3bFh2SGdiZERneHh4UUJKQkRGQ3hwdHFyaDVWSnNhK1pj?=
 =?utf-8?B?dUNxcnh4RkNVZzJrVVdYZVNGdWF6VGtjZDlxWlhBU0FjbDJaR2JPTy9lcTNx?=
 =?utf-8?B?cXRXQmJxelE2NThCdE5Bemx3MGo2ckxTSWFHZGptWTFxKzNEcTNUT2hKMVVj?=
 =?utf-8?B?YURxRHUxRVVDSmF3VEd1M3NhRmlOOEpWR0JQQXRBUHhpQit2RlA1cnpkSG43?=
 =?utf-8?B?OEpGOE8wd1ZMYUMzR2VDSUgvSXJsVjRrN3hDdTUvRHA2TTV0M0U3dE1JVFo5?=
 =?utf-8?B?b3hQL1l6S3NpQWl2OWxtVUZrR2pycllHaXM2V1M3Lzh3WE9hYnhjZXQrWTh3?=
 =?utf-8?B?ZlY1T2NGWUJUZXVJelZPaVpmZjdhTTFwSE9XakJWNU96MG1CU0hwenZnNVk0?=
 =?utf-8?B?Yk9TKzJrYkpFaFNESHF0R2RQUlh6ck1JQ3poNjB1c2Vmbnl4NHZlK0IrcE1j?=
 =?utf-8?B?SWxGeFg4YjcwYmtXc3hKQXBneWdwYnZVN1ZvUU5uY3Y4cUw2TUxhaWRJbWts?=
 =?utf-8?B?WHNYaWdaSnA1d255bTRHU1FPYW5lRnlpT3NTdkREeXR6dU1ialoweDV1aHJJ?=
 =?utf-8?B?NWFTbERpZ1dKTmlhSTlXTGFJRUtJd0F4bnFwM0RWYnNxVGpFR3l6NVpHRGZv?=
 =?utf-8?B?UGo2UjFWVTcwK3B5ZCt3dzBRZmtWUXFmSHp1NDlOSEh2dm5HRmwvcnFoT2g1?=
 =?utf-8?B?MTBFam5aVVp3L1hpcXd1YmU2bVRWU01CVDlxU3ZwL3p6SjlDR1oxL05LbFRJ?=
 =?utf-8?B?NXdrQmR4MzFkaUd0UWplejlxSzRXSnJBejgrSmVvTjhnWkxuWk9lUWkrdFRG?=
 =?utf-8?Q?b2Kc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(7142099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZ1RlErbzdXVnJjeDNZNzlTMEg2SHFVUkZ1dVFXOEpCZEpyMjZVMDdPaDNG?=
 =?utf-8?B?YVZBcXlSYmh2VlI1VmgrRDV3Tk5qVU90QWxSZm9tV0ZTUEJtalJJdXBYb2VO?=
 =?utf-8?B?akNYdW94aUgrRGFJMG16dnhmNUJJK2hsRUhEOXdhUmgxZmxndmsxemRlODRn?=
 =?utf-8?B?a3VWV1IyQ0FlQ3FLZ0JjelM0THlZK1ZNM0xkOC9RZjdscEo2aGJmM0Q0K2lT?=
 =?utf-8?B?VHhSMWd1aUtJQWZKWlV2R2liaXUyY0duZSsybVBVMVMrWHZUOEVEMEhxRXla?=
 =?utf-8?B?eU9KRkZTRHRKdjNoQWhncmZZZUhrTGdCVHBkaGE0VnRGNVdnK3djeTZOQkdo?=
 =?utf-8?B?bWNFNGF5YkFIdi95RWJTOXlxQUkxRDJIN1FiR2FhWnlvdWkvUFB6RkFaelE5?=
 =?utf-8?B?ck5YcE50dlA3cXRhcnFJZ1cvS2JyUmZoN09qdXVPek5kaXdVOVF2eFM4cVYz?=
 =?utf-8?B?OVRNdmJKTHl0YXk2K25GZzI2d2hqTWI1UmpOL1NCWkVpazNaUWd4YldkVWc2?=
 =?utf-8?B?MDdMcnZzWE1KM3VxWmRFY0t6ZC8zNEJIMWwwaWJZbWd5VldQNVdMUmdMMFYx?=
 =?utf-8?B?T2drSlVZQ2VIdjRwSjk2Q2NlcnlxZnorM3VRTTcxQmFsOHMrcnIyQ2NJTWZu?=
 =?utf-8?B?SjdMVmpybkJ3N3FTcDl3c21xMGdVZEwwdy92TkU4azAwMFZKenN0UXk4elM1?=
 =?utf-8?B?Z01wWnJycDFEcnVMUXpZTitoMUNJWjRKdjB3di9WbVg5WmpaYUkvMFpIN3ZN?=
 =?utf-8?B?MFJHb0tWTnQ5Z0ViVFBoOUt3SzhSR3VJQVhmTU1SZVN4WVZnVlFwK3Q4d2lQ?=
 =?utf-8?B?WFlKSmUwd3V3ZUlKYVVhYlhTdkM1TGtaaUYwTDlWOXNoRDNzVHI3U1kwWER3?=
 =?utf-8?B?Rzl3VlJtVE1hNG5VaVNjY054RVRJMlJBTG1EWmFRQXhjbzg4T0RGMlNnY1pR?=
 =?utf-8?B?S3FSR1BBN1JjaS9GMU9kU0swY01OVjhEblkxcnp1VnZ1SUNGWERzZmoyRlFy?=
 =?utf-8?B?OTUreFJ6R2RVbTBkUnVDeWhtazZyVmJDMDhuNmtCR09mbE94VG1zK3JYcDNm?=
 =?utf-8?B?N0JVZDczSmZmRDRaejBnQnhVUGdDOVNJLytjZHdlZDNUejFxeHdUR3p6V1Zn?=
 =?utf-8?B?SUdJOWN5YUczZDgxbHpoMXg4YUVPcWZzZDY3UC9WTDZUc2xocENsR0duQkhi?=
 =?utf-8?B?WjBqOW51MFFqNDhpL042VHpTL1dBNHZ6UnhHdXh4ZHVOY1NudjB4cHQxMlBa?=
 =?utf-8?B?QTNPakhtTUx1QjhYaktHYmloS01NaXdJWDk4YlN3Vlh1WkRBMmcxb3pnc3lM?=
 =?utf-8?B?WXZDOUNCelF5d2xFaDhwWkx1SUp4bWdaV0lqcGxsRUxmc3d0MTkxa0lEbkdR?=
 =?utf-8?B?NnhWdmtESnpIVVhaUThJd2tTMnY0WUVUU3B2Snl5T05zWGFrU01haDBDdE5r?=
 =?utf-8?B?MmtoNjJublQ2Uzl4blRLQ09TTFZBUWQrdlFZN1BCSTYxMnJRaS8zUUFsMldK?=
 =?utf-8?B?Wlh4ZFc0b2dCNjlvMldMdklaWkZ6TjZJdXBiMmpRWHdyQ2hLeCtaVGl2L2Rw?=
 =?utf-8?B?czg1ME1aejJEQytPbWRBQ1o2ZHJSYUlsSW01Wlg2MmIzRlplcFF6SWJZbHFR?=
 =?utf-8?B?ZEE5TnpoTmN3T1JaQUg4d2ROaFBub0ROczR4Y2NzN2dUMVVyTkk1QWk5b2FB?=
 =?utf-8?B?dmpodDJ0K0VRc0laaTIzQzcyalhuMTV3MW5TWm5tSlR6am05ZlhKY2JWQ3lM?=
 =?utf-8?B?NUpEZ1dxZks2NUFKa005T0ZkZnJtWXUxazNMcGthTVBlK1RFcHVhbWN6ZFJS?=
 =?utf-8?B?R2JkM3J5cUIvS3hNOEVpWmpOcHVObXV0Nmx6OXhmeXN2WFlQbDhJc3JOOG12?=
 =?utf-8?B?K05xTU5sZW5VdmNhd2ova0pSdW5LZldqQ0tBdFA5YnlHRStTZ0s1VmFUTERj?=
 =?utf-8?B?V3ZyOFZIZUVHSy8zbnNUajRqNm5Cd2ordnNKY3I2M3BuWk9NQk1QZVdUTFUw?=
 =?utf-8?B?eFN6b2hpNFE0RnBQakNWblJwY3NoVTBDSXZXaVhxWWpNWHk5NmFKYmtsYU42?=
 =?utf-8?B?SGVUNEI5MzlFQkozNksrUDNtd3VGUUlQV3YwVmNHdElGVmRyUEQ4bDlrNmEx?=
 =?utf-8?B?bjQ1VEtJTExQM05SRlBzNE5CSEVRMkZ1c0grU2pIRDVaWGIzTTg0Rnl6OTNr?=
 =?utf-8?B?UktzbHBzMlJKTzhrRTFvd0xFdFlLVEEzMG9pdzBEeVVBS0pIT21qNnd3eDBW?=
 =?utf-8?B?d1NObkhSNXAwRGpDaDZ5MkpvYVAyc3JtNHo4R0RTb3FyM1BOVENLSzN1K2xa?=
 =?utf-8?B?bklqakZFK0Y1b3oxcm5aaThjQmVISWZCeVg3T3QvMTNuZm9iNmxaUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3284ef2a-0e02-4702-36cf-08de541e429b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:10:07.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0xKQPVtOvP5zOs4LU8MQvnKhLj3mpAWWUygA1Optswc6ZpgPlaq9H3K/CQHA0XqvDNTiuJFQnrDTvqbxrTKzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
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


One more nit: test checks admin sysfs interaface, so the name could be 
just xe_sriov_admin.

On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Add tests that exercise SR-IOV admin sysfs attributes for PF/VF functions
> with VFs disabled, covering default values, write -> readback behavior, and
> bulk updates for exec_quantum_ms, preempt_timeout_us, and sched_priority.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   tests/intel/xe_sriov_admin_profile.c | 414 +++++++++++++++++++++++++++
>   tests/meson.build                    |   1 +
>   2 files changed, 415 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_admin_profile.c
>
> diff --git a/tests/intel/xe_sriov_admin_profile.c b/tests/intel/xe_sriov_admin_profile.c
> new file mode 100644
> index 000000000..6f4ed31b1
> --- /dev/null
> +++ b/tests/intel/xe_sriov_admin_profile.c
> @@ -0,0 +1,414 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include "igt.h"
> +#include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
> +#include "igt_sysfs_choice.h"
> +#include "xe_drm.h"
> +#include "xe/xe_sriov_admin.h"
> +
> +/**
> + * TEST: Tests for SR-IOV admin sysfs.
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: sysfs
> + * Functionality: SR-IOV admin sysfs
> + * Description: Verify behavior of exposed SR-IOV admin sysfs attributes.
> + */
> +
> +/**
> + * SUBTEST: default-sched-attributes-vfs-disabled
> + * Description:
> + *   Verify default scheduling attributes under sriov_admin
> + *   with VFs disabled.
> + */
> +static void default_sched_attributes(int pf_fd, int vf_num)
> +{
> +	igt_dynamic_f("%s-default-exec-quantum", igt_sriov_func_str(vf_num)) {
> +		igt_assert_eq(0, xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num));
> +	}
> +
> +	igt_dynamic_f("%s-default-preempt-timeout", igt_sriov_func_str(vf_num)) {
> +		igt_assert_eq(0, xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num));
> +	}
> +
> +	igt_dynamic_f("%s-default-sched-priority", igt_sriov_func_str(vf_num)) {
> +		enum xe_sriov_sched_priority prio;
> +		unsigned int prio_mask;
> +		char mask_str[64];
> +
> +		prio = xe_sriov_profile_get_sched_priority(pf_fd, vf_num, &prio_mask);
> +		igt_debug("PRIO=%s\n",
> +			  xe_sriov_sched_priority_mask_to_string(prio_mask, prio, mask_str,
> +								 sizeof(mask_str)));
> +		igt_assert_eq(XE_SRIOV_SCHED_PRIORITY_LOW, prio);
> +	}
> +}
> +
> +/**
> + * SUBTEST: exec-quantum-write-readback-vfs-disabled
> + * Description:
> + *   Verify write -> readback of exec_quantum_ms under sriov_admin
> + *   for PF and all VFs with VFs disabled.
> + */
> +static void exec_quantum_write_readback(int pf_fd, unsigned int vf_num,
> +					uint32_t eq_ms)
> +{
> +	int ret_read, ret_restore;
> +	uint32_t read_val;
> +
> +	igt_require(xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num) == 0);
> +
> +	xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num, eq_ms);
> +
> +	ret_read = __xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num, &read_val);
> +
> +	ret_restore = __xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num, 0);
> +
> +	igt_assert_eq(ret_read, 0);
> +	igt_assert_eq(read_val, eq_ms);
> +	igt_fail_on(ret_restore);
> +}
> +
> +/**
> + * SUBTEST: preempt-timeout-write-readback-vfs-disabled
> + * Description:
> + *   Verify write -> readback of preempt_timeout_us under sriov_admin
> + *   for PF and all VFs with VFs disabled.
> + */
> +static void preempt_timeout_write_readback(int pf_fd, unsigned int vf_num,
> +					   uint32_t pt_us)
> +{
> +	int ret_read, ret_restore;
> +	uint32_t read_val;
> +
> +	igt_require(xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num) == 0);
> +
> +	xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, pt_us);
> +
> +	ret_read = __xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num, &read_val);
> +
> +	ret_restore = __xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, 0);
> +
> +	igt_assert_eq(ret_read, 0);
> +	igt_assert_eq(read_val, pt_us);
> +	igt_fail_on(ret_restore);
> +}
> +
> +/**
> + * SUBTEST: sched-priority-write-readback-vfs-disabled
> + * Description:
> + *   Verify write -> readback of sched_priority under sriov_admin
> + *   for PF and all VFs with VFs disabled.
> + */
> +static void sched_priority_write_readback(int pf_fd, unsigned int vf_num)
> +{
> +	struct igt_sysfs_choice prio, now;
> +	enum xe_sriov_sched_priority prio_enum;
> +	int ret;
> +
> +	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &prio);
> +	igt_assert_eq(ret, 0);
> +
> +	for (size_t n = prio.num_tokens; n-- > 0; ) {
> +		igt_warn_on_f(xe_sriov_sched_priority_from_string(prio.tokens[n],
> +								  &prio_enum),
> +			      "Unrecognized sched_priority value '%s'\n",
> +			      prio.tokens[n]);
> +		igt_debug("Setting priority string '%s'\n", prio.tokens[n]);
> +		ret = __xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num,
> +								   prio.tokens[n]);
> +
> +		/* Not settable on VF */
> +		if (igt_debug_on(vf_num && (ret == -EPERM || ret == -EACCES)))
> +			break;
> +
> +		igt_assert_eq(ret, 0);
> +		ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &now);
> +		igt_assert_f(!strcmp(now.tokens[now.selected], prio.tokens[n]),
> +			     "'%s' != '%s'", now.tokens[now.selected],
> +			     prio.tokens[n]);
> +		igt_assert_eq(now.selected, n);
> +	}
> +	__xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num,
> +						     prio.tokens[prio.selected]);
> +}
> +
> +/**
> + * SUBTEST: bulk-exec-quantum-vfs-disabled
> + * Description:
> + *   Verify that bulk setting exec_quantum_ms under sriov_admin applies
> + *   the expected value to the PF and all VFs when VFs are disabled.
> + */
> +static void bulk_set_exec_quantum(int pf_fd, unsigned int total_vfs, uint32_t eq_ms)
> +{
> +	uint32_t read_val;
> +	unsigned int id;
> +	int fails = 0;
> +
> +	xe_sriov_bulk_set_exec_quantum_ms(pf_fd, eq_ms);
> +
> +	for (id = 0; id <= total_vfs; ++id) {
> +		int ret = __xe_sriov_profile_get_exec_quantum_ms(pf_fd, id,
> +								 &read_val);
> +
> +		if (ret) {
> +			igt_debug("%s: failed to read exec_quantum_ms, ret=%d\n",
> +				  igt_sriov_func_str(id), ret);
> +			fails++;
> +			continue;
> +		}
> +
> +		if (read_val != eq_ms) {
> +			igt_debug("%s: exec_quantum_ms=%u, expected=%u\n",
> +				  igt_sriov_func_str(id), read_val, eq_ms);
> +			fails++;
> +		}
> +	}
> +
> +	xe_sriov_bulk_set_exec_quantum_ms(pf_fd, 0);
> +	igt_fail_on(fails);
> +}
> +
> +/**
> + * SUBTEST: bulk-preempt-timeout-vfs-disabled
> + * Description:
> + *   Verify that bulk setting preempt_timeout_us under sriov_admin applies
> + *   the expected value to the PF and all VFs when VFs are disabled.
> + */
> +static void bulk_set_preempt_timeout(int pf_fd, unsigned int total_vfs, uint32_t pt_us)
> +{
> +	uint32_t read_val;
> +	unsigned int id;
> +	int fails = 0;
> +
> +	xe_sriov_bulk_set_preempt_timeout_us(pf_fd, pt_us);
> +
> +	for (id = 0; id <= total_vfs; ++id) {
> +		int ret = __xe_sriov_profile_get_preempt_timeout_us(pf_fd, id,
> +								    &read_val);
> +
> +		if (ret) {
> +			igt_debug("%s: failed to read preempt_timeout_us, ret=%d\n",
> +				  igt_sriov_func_str(id), ret);
> +			fails++;
> +			continue;
> +		}
> +
> +		if (read_val != pt_us) {
> +			igt_debug("%s: preempt_timeout_us=%u, expected=%u\n",
> +				  igt_sriov_func_str(id), read_val, pt_us);
> +			fails++;
> +		}
> +	}
> +
> +	xe_sriov_bulk_set_preempt_timeout_us(pf_fd, 0);
> +	igt_fail_on(fails);
> +}
> +
> +static void build_common_sched_priority_choice(int pf_fd, int num_vfs,
> +					       struct igt_sysfs_choice *common)
> +{
> +	int ret;
> +
> +	/* Start from PF */
> +	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, 0, common);
> +	igt_require_f(ret == 0,
> +		      "Failed to read PF sched_priority (ret=%d)\n", ret);
> +
> +	igt_require_f(common->num_tokens > 0,
> +		      "PF sched_priority exposes no tokens\n");
> +
> +	/* Intersect with every VF 1..num_vfs */
> +	for (int vf = 1; vf <= num_vfs; vf++) {
> +		struct igt_sysfs_choice prio = {};
> +
> +		ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf, &prio);
> +		igt_require_f(ret == 0,
> +			      "Failed to read VF%u sched_priority (ret=%d)\n",
> +			      vf, ret);
> +
> +		ret = igt_sysfs_choice_intersect(common, &prio);
> +		igt_require_f(ret == 0,
> +			      "No common sched_priority between PF and VF%u\n",
> +			      vf);
> +	}
> +
> +	igt_require_f(common->num_tokens > 0,
> +		      "No common sched_priority across PF and all VFs\n");
> +
> +	if (common->selected < 0) {
> +		igt_debug("Common sched_priority has no selected token, "
> +			  "defaulting to tokens[0]=\"%s\"\n",
> +			  common->tokens[0]);
> +		common->selected = 0;
> +	}
> +}
> +
> +/**
> + * SUBTEST: bulk-sched-priority-vfs-disabled
> + * Description: Verify bulk sched_priority modification with VFs disabled.
> + */
> +static void bulk_set_sched_priority(int pf_fd, unsigned int total_vfs, const char *prio_str)
> +{
> +	struct igt_sysfs_choice read_val;
> +	const char *selected;
> +	unsigned int id;
> +	int fails = 0;
> +
> +	xe_sriov_bulk_set_sched_priority_string(pf_fd, prio_str);
> +
> +	for (id = 0; id <= total_vfs; ++id) {
> +		int ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, id,
> +								       &read_val);
> +
> +		if (ret) {
> +			igt_debug("%s: failed to read sched_priority, ret=%d\n",
> +				  igt_sriov_func_str(id), ret);
> +			fails++;
> +			continue;
> +		}
> +
> +		selected = igt_sysfs_choice_selected(&read_val);
> +		if (!selected || strncmp(selected, prio_str, strlen(prio_str))) {
> +			igt_debug("%s: sched_priority='%s', expected='%s'\n",
> +				  igt_sriov_func_str(id), selected ?: "NULL", prio_str);
> +			fails++;
> +		}
> +	}
> +
> +	igt_fail_on(fails);
> +}
> +
> +/**
> + * SUBTEST: sched-priority-vf-write-denied
> + * Description:
> + *   Verify that sched_priority cannot be modified on a VF.
> + *   A write attempt must fail with -EPERM or -EACCES and the
> + *   current priority selection must remain unchanged.
> + */
> +static void sched_priority_vf_write_denied(int pf_fd, unsigned int vf_num)
> +{
> +	struct igt_sysfs_choice before, after;
> +	const char *new_token;
> +	int ret;
> +
> +	igt_require(vf_num > 0);
> +
> +	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &before);
> +	igt_require(ret == 0);
> +	igt_require(before.num_tokens > 0);
> +
> +	new_token = before.tokens[(before.selected + 1) % before.num_tokens];
> +
> +	ret = __xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num, new_token);
> +	igt_assert_f(ret == -EPERM || ret == -EACCES,
> +		     "Expected -EPERM/-EACCES when writing VF sched_priority "
> +		     "(token='%s'), got %d\n", new_token, ret);
> +
> +	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &after);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_assert_eq(after.selected, before.selected);
> +	igt_assert(!strcmp(igt_sysfs_choice_selected(&before),
> +			   igt_sysfs_choice_selected(&after)));
> +}
> +
> +igt_main
> +{
> +	unsigned int total_vfs;
> +	int pf_fd;
> +
> +	igt_fixture {
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		igt_require(xe_sriov_admin_is_present(pf_fd));
> +		total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +	}
> +
> +	igt_subtest_with_dynamic("default-sched-attributes-vfs-disabled") {
> +		for (unsigned int id = 0; id <= total_vfs; ++id)
> +			default_sched_attributes(pf_fd, id);
> +	}
> +
> +	igt_subtest_with_dynamic("exec-quantum-write-readback-vfs-disabled") {
> +		uint32_t eq_ms = 10;
> +
> +		for (unsigned int id = 0; id <= total_vfs; ++id) {
> +			igt_dynamic_f("%s-eq_ms-%u", igt_sriov_func_str(id), eq_ms) {
> +				exec_quantum_write_readback(pf_fd, id, eq_ms);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("preempt-timeout-write-readback-vfs-disabled") {
> +		uint32_t pt_us = 20000;
> +
> +		for (unsigned int id = 0; id <= total_vfs; ++id) {
> +			igt_dynamic_f("%s-pt_us-%u", igt_sriov_func_str(id), pt_us) {
> +				preempt_timeout_write_readback(pf_fd, id, pt_us);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("sched-priority-write-readback-vfs-disabled") {
> +		for (unsigned int id = 0; id <= total_vfs; ++id) {
> +			igt_dynamic_f("%s", igt_sriov_func_str(id)) {
> +				sched_priority_write_readback(pf_fd, id);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("sched-priority-vf-write-denied") {
> +		for_each_sriov_num_vfs(pf_fd, vf_num) {
> +			igt_dynamic_f("%s", igt_sriov_func_str(vf_num)) {
> +				sched_priority_vf_write_denied(pf_fd, vf_num);
> +			}
> +		}
> +	}
> +
> +	igt_subtest("bulk-exec-quantum-vfs-disabled") {
> +		const uint32_t eq_ms = 10;
> +
> +		bulk_set_exec_quantum(pf_fd, total_vfs, eq_ms);
> +	}
> +
> +	igt_subtest("bulk-preempt-timeout-vfs-disabled") {
> +		uint32_t pt_us = 10000;
> +
> +		bulk_set_preempt_timeout(pf_fd, total_vfs, pt_us);
> +	}
> +
> +	igt_subtest_group {
> +		struct igt_sysfs_choice prio = {};
> +
> +		igt_fixture {
> +			build_common_sched_priority_choice(pf_fd, total_vfs,
> +							   &prio);
> +		}
> +
> +		igt_subtest_with_dynamic_f("bulk-sched-priority-vfs-disabled") {
> +			for (size_t i = prio.num_tokens; i-- > 0; ) {
> +				const char *prio_str = prio.tokens[i];
> +
> +				igt_dynamic_f("%s", prio_str)
> +					bulk_set_sched_priority(pf_fd, 0, prio_str);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		int ret;
> +
> +		ret = __xe_sriov_bulk_restore_defaults(pf_fd);
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> +			       "Failed to disable VF(s)");
> +		igt_abort_on_f(ret, "Failed to restore default profile values\n");
> +		drm_close_driver(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index ecc0f4c7f..6516a0a9a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -327,6 +327,7 @@ intel_xe_progs = [
>   	'xe_vm',
>   	'xe_waitfence',
>   	'xe_spin_batch',
> +	'xe_sriov_admin_profile',
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',

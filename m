Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A72CA1010
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 22:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7B410E953;
	Wed,  3 Sep 2025 22:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLMRlhgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E345810E953
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 22:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756938102; x=1788474102;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=htYGQ8cOx/TdMTRN2Wael/niSDaeedYTKQ9RT0S8LDs=;
 b=NLMRlhgqp9llllrtnhZOpQACYO0JIs3VV8ru18WV8sKuQp5W/S6DCyRq
 71cod0GgFFRMC9C+3u8PYUUi3a/FwOxqa2+CdTsBJhqvjHTKSrHOqwtul
 R3uB87dCTMkUvu50rI7fzaY9+sulnqoN45U1dBU/UfFgjH1W2AxL2+Abx
 O7CyiCrGQUm27dTQRlMlcKXt7jP5Ha2MvK4GmvJ67axeDBE+1j/g4Yy3c
 Jz32ET748QuksnfZI987rBgkK7AhjfBCJOexyx9bqOCxRIPLcyqfsP3+u
 pQaya2jHti7+uoSphw0CkYj4f7HNWkhukMGT3VWBsJ/fmwMND0a5JC6q5 w==;
X-CSE-ConnectionGUID: PHixxVaZT/2g9xZJ0wY6Bw==
X-CSE-MsgGUID: WEUv8zJtTNWblW/MlZbwNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="58300022"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="58300022"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:21:41 -0700
X-CSE-ConnectionGUID: uX9HyrnMQLKTsDv6w23Pgw==
X-CSE-MsgGUID: 1iqGld0hQk6hrAqlBGNwVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171271046"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:21:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:21:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 15:21:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrTchD45xd7XQ0PcJL60HU6KDNnIKSQUhOScxir7vNGKpVFsb9BJw7MdW69xRv7fesJI/nhjAK4XcV5BTeuTX/mj8ceYp88mn+rj4FypHSnr7x8vNrFfpjO3TE0IBshhrVmBRArfd7QyurwxzpG5bx2jR/DNigUp18dbXkjKySSDfDJWY0Reo0AIYdCNb+goSioYRARiKrbZSbLa0wary2Fh3tLwSrNeakZ+g913TjOZssjf10SzFEljxnQ02Bhaszu+TMlc3zkigmNVO9Ga6DtolPyYbvnRkTL8B6jF8Vl81bls5qIQ9Ooownq7l3AgbvqsOJAl0G5Rtd8Ht3oCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86DdQogP2hbqDgtk40Z+u8+p8N9kuTAIeBJhK5nZMKA=;
 b=UpnnfT7FGMolezfD7TkKhL6rE2SoT8UN2myD47gtPAr8bpxVa3IoYsGdY7fpuCalRU+DnTteanijqplSm39CRRTwaiD97Wp/Rd+FyJKHglYWOY7AWlRpkOQNfi0QKMLXyZhClZlamnGJmaKuwaAydDdvB6forZ5DouIjrMBGxpMtxplV8AJiru7TNWJJZ4RWXAo5wKwyiIVdiZRZbh6oRjeQJchdEPcfngot2ggFhxK/GokTG8DMXcwAtd0iD7WUvuZC2UlSba12/YqhEHfjUoOFhx6rMv4EEIVgYGomLR2meyn0NygFo1P3f5mfv7wvJ+r4CEa8r+x0y6rGfEf5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 22:21:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 22:21:36 +0000
Date: Wed, 3 Sep 2025 15:21:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_pmu: Add tests to validate
 engine activity accuracy
Message-ID: <aLi_budzpuWQ7ndy@unerlige-desk.amr.corp.intel.com>
References: <20250818073249.3348233-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818073249.3348233-1-soham.purkait@intel.com>
X-ClientProxiedBy: MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV3PR11MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: a9dab3ee-05e0-44f0-8107-08ddeb383edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU9Pd1lyeHVnWm9Zbi8yVkhCQk80Umt0WEMvQXJXUWJFY014NVlVZ0dKVU41?=
 =?utf-8?B?NWZvQ2xJQUxsS21RS3dXTnU2ZTRITGJDMnZpc2RFOHV5VDhsMlR1R3VUeTht?=
 =?utf-8?B?aXQ2MEZ6QUJNbkNuUDdhOGQzN25VaENEOUdUc3RCNGEyN1pDeFJVNUdFd1Nn?=
 =?utf-8?B?ckdodktZVGtadjlCaU9LT0tESFZ2Mjg1eWlWbk8rSWE2MjFBTmVuNlRxdjZF?=
 =?utf-8?B?NDgvZTgrZmNwUjluYlViUGRnSWFhSVF4VGlUM01FM0RlSEFVaUJ0eDBrMVY0?=
 =?utf-8?B?b1E1MlVIRWxqY09FQUtxalk1MFdaMmpta1hzZTZLSHlSeHdweXpIeDgyVEIr?=
 =?utf-8?B?eThPd2lZakZJeXBsU201WnhRQjhmOUZtc2VyU2ZxS3kyNklnOEw3WHpESnVm?=
 =?utf-8?B?SU1hTm01RnBmazdFWWNzS2owbDE0bnN4K3FzNDZTSEM4Q0VwcGdMOEREMU8y?=
 =?utf-8?B?OFRGb1FFMFhpZGdTS3dxOGtZVTZkeSs0ZnY5RWpJcnlRSG9jMDR2elZlMXI2?=
 =?utf-8?B?U1NGVHhPbVJmMmV6b1psVTlrcTFLbWd6dG9MRHZqem5kZDJURDZaWDhEaU5h?=
 =?utf-8?B?anVhVnpRUDZkaDh1V3Avb3RxOENLbVVpK2FicFRWQUU5ZlpQdlNZNElmTFdK?=
 =?utf-8?B?enpCRW0ycDhVWGdhRnhSR0p0UzhxbTc3NVEwSmNYWWJ3TVFXY082cHRFNkZa?=
 =?utf-8?B?K05zWnVtNmtDTm9aaUFEUHRFOUpTVy9CVFQ4dFpCc0pMWWo4cHBUeTR1bFMr?=
 =?utf-8?B?U3RLQUFKMTV2SXE2NllJT2tRZW9HZmFwL3RGM1pWRno1REFra0hyMURvT0ky?=
 =?utf-8?B?c1EzV1FuNklWMEYwNXduaElhTERVR21lYk41eTl3RTRLK21FYjh4eVh3aG9J?=
 =?utf-8?B?ZjV5L1Z0ZlhRT1JxQTJDWi9lK21VV3FBdHpMUGcxUjFoRnBqcHl2eSt3QzJm?=
 =?utf-8?B?K0tSQ3ZQZTl6QnZtdkRIMjlUbm9aZ2I0SE40YVR6bzNXT1dHYzdOZmxOUWt1?=
 =?utf-8?B?MGVNRmxOSlJSQkRwSFZYZllJUDBHdFArbEpmaEt1aEp6cnNkVGFvblFhT3A3?=
 =?utf-8?B?T1c4eVlJcGluY2hVdmxGZXNuWFZQTG0zeXdFbzU1SmdOSG0rZThmSE9JWVUy?=
 =?utf-8?B?dlVqT2tTMGt0cGdDSldEaThUK2x1OHZtN1FtWmlKWlYxWnIyd1BMaWYrMkl1?=
 =?utf-8?B?MGh4Wk13VXZCUEpKdFF3NEF1Qnp1WGhKVC8zS05BRXpsRUxTNDVicEg5VUc3?=
 =?utf-8?B?ZkwxQ2lDVzRXRlNXN3Z4N1B4dVdlTDRNQkF6UGVOOWVQMTJUejhKQnN4amVI?=
 =?utf-8?B?UmpNazJSSnJiMmVpOVorVzcydGlVMGhFaDBFc0lXK2NxOVlhNFBnM1UwbHhI?=
 =?utf-8?B?dnQwZk9rNGVZQkZQbCtlY2FPZXJTbUZYK0RMQ2RMVHRtN2prcC9nalhFNUhB?=
 =?utf-8?B?T09UWHYzYnpQTjhubVd0VW1UUFhJOUVjTW9nNnJRV1pKa0ZJQ25RK045NDBO?=
 =?utf-8?B?UnFVWTJYaXJteFQvaFJRMVBqQXRlSTltOHZub25aWHRLL0VMRXgyTkhWUG9B?=
 =?utf-8?B?d29zbjBIbnZSZm1Vd3I2WE1LNkN4ZndGRE8wTEN1Y3NVS3p6OXVQQzdRc1BX?=
 =?utf-8?B?Z2RZSUF2ZUxoOGZmKzhMaUF0a3M3TmkxWFljVUl1N1Nab2xEODJmZEVnbWZC?=
 =?utf-8?B?UW1uQUExUTMzQ090TkJCUFE5dEtQd2pSWmVwMHYyYVFHUkF5b3pJbnUxL1pK?=
 =?utf-8?B?OHBsK05oOFlPQUMwUG9mcEJoTlNwMm1tcXNxajRlaXBtdDF5ZHBDY05aV3Jy?=
 =?utf-8?B?TFNvYkpoTXB0WEt4TXFjcXZtTXdZRVpMUmVsNGxxMUhENjdGdjZ6YjU3Sm1u?=
 =?utf-8?B?VFhNOWliNEhQMzJlMFBrb3V1b0Q1OFpaeEREdDN3by9ncitYdTJFSzA2WmRE?=
 =?utf-8?Q?Ec5dA4e2AsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dERlT1l4WlpiTjRZWlRtMnhwL3FRTmxHRG1ocTI4czFjM3UxdXY1d1BLay8r?=
 =?utf-8?B?bTUwcVZnU1JpTllqRmdwamI4bHZUSXEweWQ2bE91VENmSGV5SE9JTGJhdVFa?=
 =?utf-8?B?WjFtK3lpMWxrQVBzNjBJZHI3b25ud1FvenRYd3pNbldndUNQMFh6eVZKenEz?=
 =?utf-8?B?ZmxqZ0xaYUI5bFliYkwwdjZIWmZUeUhCY2xWS3I1cG1aSzY3U3ZENCtQSE9l?=
 =?utf-8?B?Z204RVBlWTBCU1BWYnc0R3dWKzBQK3FRLzRGRVAzZFR1L1lobkxaOTdzVEFl?=
 =?utf-8?B?b2lBVWZCZndCRXpzRjdoM0JvZlBIL0xiTGdZZVliSzhNUWlUUldZR2JuWEVK?=
 =?utf-8?B?RUVvUUgwMllFSDFNWisyZi9NaHQ4OGp5Yy9vR1kzN2crb0JBaHN2WDkzd2Qy?=
 =?utf-8?B?Y21MUU5wT1krUXRwSXJtWmxNR21ORzBXcjdDOFZSeXowVmVUaGFxck5CRDQ0?=
 =?utf-8?B?eldUZHFueTRWd0NLdkt0NFBOeTJxN254WU9VNVMyTmNIbVVEWk9RUUs4b2xw?=
 =?utf-8?B?eEQ0OEVkNVJPZmZEa1lCaGVoQ3JpMHY1cWtkNGdEdFc1eEQ2aGJRZUNJbHNT?=
 =?utf-8?B?S1dDRGtZcnBhTWI2ZjF0bkRBbzcxbVRjQmllVXNKdnVhVWNscDdUVnlYYUtw?=
 =?utf-8?B?UU5TLzhOTXBVdDBiNWgxMzJYclJYNTZjdEZNZkxrcGNydTYwc2tVaGdPc09P?=
 =?utf-8?B?M1YzSHkzeEV5NE90YVNhQUZRQjlMZlhMc2ozRzFGU1dDWTlIbWMzODB4SEdN?=
 =?utf-8?B?UzQwLzJVWTlsUm9VVHFPcENGMCs4MTB5NWxFbW8wNm5UdDh3NEVUTlJLSHB6?=
 =?utf-8?B?YThlYU1FN0JjZytGVWMwbUQxWnpiMDNJd1VuaGVkOHNsQVN5Rm9xMmZ1c3h5?=
 =?utf-8?B?djFaZjNVTDZxYWI3WUp0SU5kTnpKZlM5QWJTVGR1bW1CbmFQWWFvbHplWmp5?=
 =?utf-8?B?STFJdEpZbTQwZUlhamFDTGd6eVpYYkcwTTdmR2E2Vm90UVZPSkpQcW1KYnBr?=
 =?utf-8?B?OHBBSzBDcnM1Rmd1U1ZSR2E0djVkQlhUNnJzS01mOTY1YUp3WTZKN2F0bU1r?=
 =?utf-8?B?eGlFK1k0NzJXS3JOTWs4NDkybUVUd0Q1aHFWVUtBd0pYY0tTV3orM0NLbFRM?=
 =?utf-8?B?VU56U0xaQ0dzY043aGRKRzRab1BzWnB0UDljWVdTR0hCWGFlOU5FelhtTlc0?=
 =?utf-8?B?MHRqcHkyZE1pMk91TnlzaktacDI2VFBzM0loc2duK29zUzBSSHJMRnFvNlV2?=
 =?utf-8?B?MDhBeTJlVGFNaE5DRUhTSWNIMlFZTzJtaXV6MnYxV0NTV2Iyc2tOdEZDejdr?=
 =?utf-8?B?NUNVL2Q2QldvbTFPcVRoNkZqM1BYRTVQRUZSb2FKekgvWGRVT0s2OC92YUF4?=
 =?utf-8?B?TFovSDMyMmJGbHRkSjk5aktqemV5aTgvcEdXVjBCRnE2Sy9mWXJYUUkzajY1?=
 =?utf-8?B?dENWbnJWY1hURFcyaC9VemRVaTVKMTY4RTVZMUhqcm5ibnNzTElmdjBIZ0la?=
 =?utf-8?B?MzhnNWhBYmlBMlBQTnd2cjdXeG9FcmZRNHc3VVc0bnZFTkxVYit4blBGK2RZ?=
 =?utf-8?B?bFNlbUtjNlJZK1hoMkFtZFZKOGx6YWs3bjdDbXRSbXh1cVEyK2ZKOWdUY3Br?=
 =?utf-8?B?bTAwSE1ueGhydlhSN3IzU2tBNUZHc0VZNk01V2VJbFQzMVIxai9UZ2lSdzZB?=
 =?utf-8?B?bG9OclhuSXVSZ1pYVDRMWlFKTlJDZDNzKzRjNnIzNWZOQlM3ajhCcE5mS2FC?=
 =?utf-8?B?c2pFTXE0U0Yvb0g3aEswcEc0RnU1bW45Lzc3WGovYkNGUmkxTW1Ia016cG9W?=
 =?utf-8?B?WkJJMWVkdTM1S2xKTFRmbGpvL29BUncvb2NYazE5M3JZcGh2Q2hZbmpXL0Ur?=
 =?utf-8?B?VU1iL2xYNjhzZ0IrNk5SN1ZRNW41KzltTnY1TzJRcUl0YmxLWHBqeTNHRDNh?=
 =?utf-8?B?Sk5pYmRrVGRUaVEwVFZRMTVhZmhEamI2SUt1NTJpMzA0QU85NDRFa3JHQVMy?=
 =?utf-8?B?Q2wyVEZJSjU1bi9tT3VpaTJrdnp0STVIWS8xQ1Iwek5rek9xVHFnRTYrd2JR?=
 =?utf-8?B?MzQyWkdVd05sNkRXYUR1NnUvN3lnWkRoZ1JOaWxYSlM1SmJsaGFuNmpYVFNS?=
 =?utf-8?B?ZFI0cVBvWndFby92TnozcUdteGJ4RzV5OHp5ZGZkME5ybzArR1F5TlhtTSs4?=
 =?utf-8?Q?L3br65s1zmHzNOymZaJhHVg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dab3ee-05e0-44f0-8107-08ddeb383edd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:21:36.4509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/A9J41nBFhL493lGqUT/j2I2bgNy6y8uI3UPCKRxSrratVwFji48Rf/X8AQtyR+nSKR1Pz3oMEabt73EOy4vvsijk3vCYVTGgnaXEEOBg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
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

On Mon, Aug 18, 2025 at 01:02:49PM +0530, Soham Purkait wrote:
>Add test to validate the engine activity is reported with expected
>accuracy. Load the engine for 2%, 50% and 90%.
>
>co-developed-by: Riana Tauro <riana.tauro@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>Signed-off-by: Soham Purkait <soham.purkait@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_pmu.c | 152 +++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 152 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index a98fba5a4..9fd538a01 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -72,6 +72,12 @@
>  * SUBTEST: engine-activity-render-node-load-idle
>  * Description: Test to validate engine activity on render node by running workload and trailing idle
>  *
>+ * SUBTEST: engine-activity-accuracy-2
>+ * SUBTEST: engine-activity-accuracy-50
>+ * SUBTEST: engine-activity-accuracy-90
>+ * Description: Test to validate accuracy of engine activity for the above percentage by
>+ *		running workload
>+ *
>  * SUBTEST: all-fn-engine-activity-load
>  * Description: Test to validate engine activity by running load on all functions simultaneously
>  *
>@@ -482,6 +488,140 @@ static void engine_activity_load_all(int fd, int num_engines, unsigned int flags
> 	check_all_engines(num_engines, flag, before, after);
> }
>
>+#define assert_within(x, ref, tol) \
>+	igt_assert_f((double)(x) <= ((double)(ref) + (tol)) && \
>+		     (double)(x) >= ((double)(ref) - (tol)), \
>+		     "%f not within +%f/-%f of %f! ('%s' vs '%s')\n", \
>+		     (double)(x), (double)(tol), (double)(tol), \
>+		     (double)(ref), #x, #ref)
>+
>+static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
>+		     unsigned long target_percentage, unsigned long target_iter)
>+{
>+	unsigned long active_us, cycle_us, calibration_us, idle_us, test_us;
>+	const unsigned long min_test_us = 1e6;
>+	uint64_t config, before[2], after[2];
>+	int link[2], pmu_fd[2];
>+	double engine_activity, expected;
>+
>+	cycle_us = min_test_us / target_iter;
>+	active_us = cycle_us * target_percentage / 100;
>+	idle_us = cycle_us - active_us;
>+	test_us = cycle_us * target_iter;
>+	calibration_us = test_us / 2;
>+
>+	while (idle_us < 2500 || active_us < 2500) {
>+		active_us *= 2;
>+		idle_us *= 2;
>+	}
>+
>+	igt_info("calibration=%lums, test=%lums, cycle=%lums; ratio=%.2f%% (%luus/%luus)\n",
>+		 calibration_us / 1000, test_us / 1000, cycle_us / 1000,
>+		 ((double)active_us / cycle_us) * 100.0, active_us, idle_us);
>+
>+	igt_assert(pipe(link) == 0);
>+
>+	igt_fork(child, 1) {
>+		const unsigned int timeout[] = { calibration_us * 1000, test_us * 1000 };
>+		uint64_t total_active_ns = 0, total_ns = 0;
>+		igt_spin_t *spin;
>+		uint64_t vm, ahnd;
>+
>+		vm = xe_vm_create(fd, 0, 0);
>+		intel_allocator_init();
>+		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+
>+		for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
>+			unsigned int target_idle_us = idle_us;
>+			struct timespec start = { };
>+			uint64_t pass_active_ns = 0;
>+			unsigned long pass_ns = 0;
>+			double avg = 0.0, var = 0.0;
>+			int n = 0;
>+
>+			igt_nsec_elapsed(&start);
>+
>+			while (pass_ns < timeout[pass]) {
>+				unsigned long loop_ns, loop_active_ns, loop_idle_ns, now;
>+				double err, prev_avg, cur_val;
>+
>+				/* idle sleep */
>+				igt_measured_usleep(target_idle_us);
>+
>+				/* start spinner */
>+				spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
>+				loop_idle_ns = igt_nsec_elapsed(&start);
>+				igt_measured_usleep(active_us);
>+				igt_spin_free(fd, spin);
>+
>+				now = igt_nsec_elapsed(&start);
>+				loop_active_ns = now - loop_idle_ns;
>+				loop_ns = now - pass_ns;
>+				pass_ns = now;
>+
>+				pass_active_ns += loop_active_ns;
>+				total_active_ns += loop_active_ns;
>+				total_ns += loop_ns;
>+
>+				/* Re-calibrate according to err */
>+				err = (double)total_active_ns / total_ns -
>+				      (double)target_percentage / 100.0;
>+
>+				target_idle_us = (double)target_idle_us * (1.0 + err);
>+
>+				/* Running average and variance for debug. */
>+				cur_val = 100.0 * total_active_ns / total_ns;
>+				prev_avg = avg;
>+				avg += (cur_val - avg) / ++n;
>+				var += (cur_val - avg) * (cur_val - prev_avg);
>+			}
>+
>+			expected = (double)pass_active_ns / pass_ns;
>+
>+			igt_info("%u: %d cycles, busy %" PRIu64 " us, idle %" PRIu64 " us -> %.2f%% "
>+				 "(target: %lu%%; average = %.2f ± %.3f%%)\n",
>+				 pass, n, pass_active_ns / 1000, (pass_ns - pass_active_ns) / 1000,
>+				 100 * expected, target_percentage, avg, sqrt(var / n));
>+
>+			igt_assert_eq(write(link[1], &expected, sizeof(expected)),
>+				      sizeof(expected));
>+		}
>+
>+		xe_vm_destroy(fd, vm);
>+		put_ahnd(ahnd);
>+	}
>+
>+	config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
>+	pmu_fd[0] = open_group(fd, config, -1);
>+
>+	config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
>+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>+
>+	/* wait for calibration cycle to complete */
>+	igt_assert_eq(read(link[0], &expected, sizeof(expected)),
>+		      sizeof(expected));
>+
>+	pmu_read_multi(pmu_fd[0], 2, before);
>+	igt_assert_eq(read(link[0], &expected, sizeof(expected)),
>+		      sizeof(expected));
>+	pmu_read_multi(pmu_fd[0], 2, after);
>+
>+	close(pmu_fd[0]);
>+	close(pmu_fd[1]);
>+
>+	close(link[1]);
>+	close(link[0]);
>+
>+	igt_waitchildren();
>+
>+	engine_activity = (double)(after[0] - before[0]) / (after[1] - before[1]);
>+
>+	igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
>+		 (engine_activity - expected) * 100, 100 * engine_activity, 100 * expected);
>+
>+	assert_within(100.0 * engine_activity, 100.0 * expected, 3);
>+}
>+
> static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks;
>@@ -986,6 +1126,18 @@ igt_main
> 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
> 	}
>
>+	igt_subtest_group {
>+		const unsigned int percent[] = { 2, 50, 90 };
>+
>+		for (unsigned int i = 0; i < ARRAY_SIZE(percent); i++) {
>+			char test_name[NAME_MAX];
>+
>+			snprintf(test_name, NAME_MAX, "engine-activity-accuracy-%u", percent[i]);
>+			test_each_engine(test_name, fd, eci)
>+				accuracy(fd, eci, percent[i], 10);
>+		}
>+	}
>+
> 	igt_describe("Validate engine activity when PMU is opened after load");
> 	test_each_engine("engine-activity-after-load-start", fd, eci)
> 		engine_activity_load_start(fd, eci);
>-- 
>2.34.1
>

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8269DD29DF2
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 09:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCAC10E490;
	Tue, 13 Jan 2026 09:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPPajhmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62B110E48D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768296200; x=1799832200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VQFLrA3AeP51bg0KiSAE04pAJ9jbvOHHEVSQOVO9Fso=;
 b=TPPajhmrBD0OQAGbmsNjJLPDdHiqhSg6Q6ONrxffxOJ4cRxLaUSNOlvT
 EKKDvWDdMJGJZD3QU9tySruLYZlyKNKoQ78rt9TVTz6hSCylU3W2lKN6a
 f73tiv1PY7cqyRJThk+X4YLT8FFuv05wtSgtvX5d3iJc7EQrEHYTJR4Yw
 0eDZEdUDrQ2vPhVBu3ME93EyLTQwpPg7Xjyj1Xon/8DL7NrYWvUcJbfOU
 Yf94GNkMy64BdqlkEwiv9YirMYfWtbif6ev8aSmbX8B9uXDlda6buU3l8
 seuh1GARpd7lV5Xr9GwJqCPa6Am1Khl6QG66GZUtx8Xe0Wfx2WSs21IRY Q==;
X-CSE-ConnectionGUID: AOptSZ7FT1Cxwug9knZjLg==
X-CSE-MsgGUID: TwC4qdOuSlSRXeH6WMKCqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80297508"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="80297508"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:23:19 -0800
X-CSE-ConnectionGUID: qO8gHaZHSF+MeFkDNcyIDQ==
X-CSE-MsgGUID: tNdgUdFPSkCr0/szVKMWrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204417239"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 01:23:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 01:23:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 01:23:18 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 01:23:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGRBlTOdq9X57dl16Li1zxGwwSPOrtXvXo7TvbV8bVPrlLSVk+oEvUcQuuCSA1rLfvg5lrfP4PPohZw9CSHztksSLqy1GKqh8YghfVkZPKSNmY3aYvfIdeYBq9Fr7MulgsAevZYpj5MAOa8SJSXDJSFKdLyHAGq6HUTW1NKJmlbj4Ez1CKGEM5ZVggi9IUZ8DBi0Ljde3xSSS6KMsA3qZHpq1p2q1qB1i0rX1Vui737hdLW9b127vZYTFd1zeDStac8uy/BNDwvT5Sq+aq/CEUtsatbCsO0bdbo+35lzwtwiVHDGQ7QbQt3dGFG2PS0VA+AaRcBpWpK1rfAFRQz0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EImC859EHp6EOnYIHjhybhFMa0ulGaxFq9QjKqJQIrE=;
 b=gefS9XJxP37Gjdohb3luHBzYnhbRwGNChgu+fSE+1nJFLsAjsIZivnj2pi/Xm6imzQY9TYqBYcSo8YnG8meGefltVVo03oebEIar6/mgJo8Q9cOzFddYifmSU+QrhO7oT/YjFhv+l2Zv+egmCf8RX1ArTvADchfcbhQMWAA5MOnm4J62NQ03gjZNRYMr1keSHvhfokHaouGKXGV0UUmjQwejJ0agHy9jlPrRXx+4Z+3e+YQZCxDed1QujdlmjzXSJ5xjm0GCIwXhfft3SeLk8xk3ZgkrV68gVIrXT6vmCdc2RpeYCLpHkjlU789jvmghvC5X3AZhPPz+fXKsYFo6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:23:11 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:23:11 +0000
Message-ID: <8277d14c-b2c5-4ce2-a6a9-89742dd6896d@intel.com>
Date: Tue, 13 Jan 2026 14:53:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_color_pipeline: Restore plane color
 pipeline to Bypass on cleanup
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260109093613.538804-1-chaitanya.kumar.borah@intel.com>
 <BL1PR11MB6050A05C992E99902FB8C52FE781A@BL1PR11MB6050.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <BL1PR11MB6050A05C992E99902FB8C52FE781A@BL1PR11MB6050.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: b55c4aeb-a393-474a-25dc-08de52855ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXpac2RaeGpwVUZLdVExVFQwSDZTdXlJZTZ3N05KamZEaFVmTUJvUko0a2sz?=
 =?utf-8?B?WVpVMVlUVnNXUHhDZ2RJWXlTZ3c3Y0phYk9xdDRtK3phTVl3clcza0pRaUpz?=
 =?utf-8?B?RjBJaG9tc0JUU21RcFR5MEJ2dGsveEpucFI2WWJrZ3dSdENyWk90YUR4b05P?=
 =?utf-8?B?Y0hBcVhibHVFbFFlcFBaUnFBL3c3OUpNTmRBVG5rWHBBVS9RTU96RnFFZHBm?=
 =?utf-8?B?RzA2L3BBZC9sVFFScThDWG85S0xranJpWXVSdkY4NWlabkNMbmdheXFVdWJY?=
 =?utf-8?B?cmRMd3pqR2lZNiswMUl4U0tDeHpQd2dndzY4d0N6K28wRmQ1TDJ2MGlvL1V3?=
 =?utf-8?B?WXpOWHZHYWsrY1NPaThRWjRCLzlFVGFTd0gxdUhFRHJ0NHMraEl0cWNuc2Jz?=
 =?utf-8?B?Y2d6MjRZd1Y0aHhBOUQwV2c4Q2F0RmJldWxoZy9jRDVhbjBsekFsSzd2NXdx?=
 =?utf-8?B?V2c3MGVabDNEd1BSWnFycDA5Ti9JU0g4NWNKL2xsOTZZUjlDNmhVMVJ4WURl?=
 =?utf-8?B?SGNJc2lOcnMvTUpMTHBpVHhQUmpzZ2ZTU2hudU9NNWI1OVF0TzVjaTlMbFVn?=
 =?utf-8?B?Z3d3Ly9nV3N1dFA1Q0VqcHdyTlpTQTllV1NveUx4b21vRmlGZmxtSDF1cWxM?=
 =?utf-8?B?L1V0ZVJmK1ROWCtubU9XbzYvT1pBL3ZZdy9oTWdPOEE5MloxbXBaSlZsM0dx?=
 =?utf-8?B?eUhTQUJxN09yeHlJbzJZQTJ4RmR4bWd3VHdVcEhLUG5tb0htWm9rWTl6OG1j?=
 =?utf-8?B?Q2t2NE1jb0VXUmkvbTFsWUNtSXJBcjcrZW1JOWRqWVRaazdYN29SQTZuUnlD?=
 =?utf-8?B?ODZkeGcwa2hyaTA5bGRvUVU0OU82bmRmb283M2FpRXk3OEVnWm15L204Nm9u?=
 =?utf-8?B?VDlJUHAwYWNKNmNXRXpyNHpPcFduL1pkM1FVTGkzNDYrY3dzbHdvMC91OEhu?=
 =?utf-8?B?ZnptZUxGdldNRTZGS2FlMUd6UWtwUEtqeWI0cDg1dlZlR2thOWxYSnlsU1Y0?=
 =?utf-8?B?cjZzSVVhS0NkOGxOWHR3SUxHY1cxdWk5MDI3aDlHTXJGODdCTmF1M1F0a1cw?=
 =?utf-8?B?USs2M3M3b1Q4SVVzbk9nV3QxVUVSaEFXVkxlemttb3NMcUQ0LzVDMkc2clJm?=
 =?utf-8?B?a2lJcXJsaGh2N09CNzhqZW1XYVJ2Vm0vVU14dWd0eWx5RG1Za2k2Yk8wU2dn?=
 =?utf-8?B?eW1KYXE3VTVYTmRQQWZXMFNHTTZUUGU2SXF4NXl3Nk5qYmZvNTROTTBTd2JX?=
 =?utf-8?B?STFsL0VZZ29GVE8ybThnQ3dFWkhKdTFUcHA0SnhYenVDdGRmc2lMSWNIR3N6?=
 =?utf-8?B?NitPVzgzZVUxSVp4ckNBSDZLMU5FREJIanM4SUJMMlpneVo3Y2F1bVhWU0R1?=
 =?utf-8?B?T21mMlNmUEZ1TmJ1T1JkRmkzOFRTcjZJNVAzVW9rODQ4L04yZDdMdXZJc2R5?=
 =?utf-8?B?U2F6cHNJWTdQWTM4dzQ5WXhvcjNLRlY5MlY5UFZIb2I4ZkFBQ24wZGxUcUdD?=
 =?utf-8?B?M21vV2ppaFE3UDVNN0ZoSU1GZ3phZGVzaGtNbm9mSEtwQVZjSksrRURiOWFL?=
 =?utf-8?B?ZHpvVEFzREhWYnBIaDV4UGFQNE9nRWZzL1U3S2JyZ2VEM3pzTHorQ0djOUJv?=
 =?utf-8?B?QW9ScG5kdG1nNXNKb2xjWEJxVEJnTjdpTVpMY2ZmSGljVnliMUhhWEkzYjVU?=
 =?utf-8?B?amM2RFozWkR5MllxUUdZQ093QlYxQ0xPcmJOczd0SGIwNHE0LzduemgyaWMz?=
 =?utf-8?B?OFQwOWVQbmlaSGFNeTBjQ0RHYmpTQ3lGbDVDS25GWURpM2lqOXQwMjVaTHRE?=
 =?utf-8?B?Q0FRQ0ZxdUtveEZ4S0xkQURkUHBObzNIcDBaa0FueEh1RGp4dW1Ga3ZualZl?=
 =?utf-8?B?V2pBSjFWS1JHbWt4TUk3VkZ6K3dwYTlSSXNXak1zNCtYZlhOLzRzbkxMbEk5?=
 =?utf-8?Q?ylQUy7gzQClYIOQJg6EzQerYKFwxG/e2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXFLaG9HVElCYlljc3hIcll4eUlOVGRGUms1dG1jcnJ2Q3UxOHgwWDloSHRn?=
 =?utf-8?B?dDlXc0VHRGVtR0hTQnJVWFpYWDBOT2ZrUGhJamV0bmcrdzRzbHd0MDNtWkV2?=
 =?utf-8?B?SjFEb01xQ0JGUnNqOHl3MklPQkRneksrbjQ3MFAyTGU4ZnRMSDFYV0ZZNHNC?=
 =?utf-8?B?OThlWmpvOThIS0RteExLWWs4b3QyMGxxUHhNODBBQXR1bk4wNnBZUGVPeDlF?=
 =?utf-8?B?eDVRQ3RNNnBESkJuOUdxYzM3NXIxTmw5dGhKbTcvY3k3YStxL1VoOWk2Z2tT?=
 =?utf-8?B?YkY0azIvazBMaXV6Q3dlTEJyYUFKVExZaDk3dFNXL1ltV2RmSGN2RWZYV1Zq?=
 =?utf-8?B?YnJ1SUdaU0NMeWh5N0psZGIzL0xUNjBzZHlLS3NMaGJleTdKWUtucmU0STUx?=
 =?utf-8?B?a2R0Z3dNdFRTYmJTM3paRUpPRUhjRGVHMEw1RVBQVGdSSU43U0JRZ3crNjBy?=
 =?utf-8?B?eFNvdXZFZUwrYVpYZjFCeldxYlo0ZXA1NmpQMkNSYSs2NVRHcjVhczZFc1g3?=
 =?utf-8?B?dmE4ZkRHSnVMVHIyVHZ4MHFQYzVkbW1VcWlXdzFmSXlyR3puTmV2bUdLczM0?=
 =?utf-8?B?bU9mc3BkU2E3RFRwWjZsdy9OY2srNlVkekpsbTBBWlgvY3NPNkJpbGVuTGdN?=
 =?utf-8?B?ait0QmxnazB0SmZSYlVCYTFLZEwzTUg4TnJzdWQzZVJVL1NIalhraGI3bERt?=
 =?utf-8?B?MlV4TWYzNDVEZU1QOEp4NWJxRmhYSDJNZDVMWGxNMTkzK1JhcTNZYXo5WS9l?=
 =?utf-8?B?ZEhjV3VxK1hxbkw3UTNOcXZKWWh2TnBGOFNPbk9IUU9FZHBEMWdXUzFKejBY?=
 =?utf-8?B?TXJJTkdLbHYxSERsa29wN1kxRUJtdlZ2bXc4Y0MxSDdWSzdXb0RnMFZybC92?=
 =?utf-8?B?ZkgxWGxYaEFpOFdBMTlmODNOdUZ3WUFCTlJFQ2M1VHlxM0RmTlR4bWV0U0pz?=
 =?utf-8?B?M0RmS1VYcDBhSWVPWXlZUC9nUjJQNXVMbUkvSWhYelRsR0EwdTd4VHBSRWpi?=
 =?utf-8?B?QTBXdlJQbEk1QWswR21RUWYvRUdvclF4M0FlV0M2N0xHT1EzdzJtY1dORlFM?=
 =?utf-8?B?ak9YRm1FQ0xpeGsvNGpWSWJmaEJLWk12Umtpa1MyK2FRYUdPVFpiWEdOMm5y?=
 =?utf-8?B?RmdnOGxuclVRQnlIVEtuK2N5SnNVUmpKeDA3SlFpL1d5MkpBbk1jOXdaR1Y4?=
 =?utf-8?B?L0dsd054MnpiU3AyYUpwc2FHQ2h4TmQrVDV2NmVQTE51YUhPaFhHWTdiSzly?=
 =?utf-8?B?Mjg4eU91bXFIUFZtbVJJN2JzZjFzdnlhajZoczhXdjFIWGVOSm1WWFVPOUNC?=
 =?utf-8?B?OHVKUzdvZXlZVW93RWh2N0NvcjZ5cnJBa2NOQSs4enRKYVdOQTdncjBpSTBV?=
 =?utf-8?B?Tms5QUlNcGpmZ2xobVFrUlF6YWsyLzhqT0RaczFncFEvZGdrYU9rNlQrc0Ft?=
 =?utf-8?B?d1MyTTB0ejdhaEVIWjBuMW1aN0dWeWluM1FyTHgyV2ZrREZnbGdzM1FnZEp5?=
 =?utf-8?B?WVVIMjA5cUljdnE1eXVwYVRBVWI2bnVMcjh6L1hIcjdPMWkyT0I2RW9qeTM2?=
 =?utf-8?B?OGJjYnZFSWk4VCtLaGJCeG92SUhQL2JFMmVzKzRqbzR1Nm5GUSs2OWNEY2xF?=
 =?utf-8?B?VFUwajd3OU9OMFFGWE02UXVIbC9jWitMSnQva0tYS3hTbkxXSmdKaEhYMVNu?=
 =?utf-8?B?UkY3L0Q2SjB1aWEray9SM0RsTFhkQXI4ZHhVY1VqZlRsdmZsVjh2bm45aFpy?=
 =?utf-8?B?Z1Q5NHNuNGUvVmR6ZFN3UXZHTkpyM0xnbWJZQnNtQ0NzR0dQUDdlS2FUQlE4?=
 =?utf-8?B?QWtZemxScmo1TFBSeGFqL1ZOMDZjM3lFYkl0T2hTQ3cwZFBlUWNqUStqSXFE?=
 =?utf-8?B?L1NCM2xDRGNvVFhpNFZkS3JjTVBGdjVBZ1F3SE5lbUVTcUdyUnNCZStrYnJX?=
 =?utf-8?B?TWl1aEd4MFg2NC93SithN0J1cGpQT1ZpVUhrTlJDeW15SFlRL2U4OElySzJq?=
 =?utf-8?B?ZC9UcGVMd3ZIOWNER1ZMbklPc2owQ004S2tLYk9NOWdZZ3NEVVQ3cU5ScnlF?=
 =?utf-8?B?QmNFOWdZOW50T29zbFNyRytsQkI3NUR3M0VUTDdyRUZqOW1jUFJXT2Fhdlo2?=
 =?utf-8?B?U08yV1dxQi9ZZExTakNhUlUvSmZKNFlxWWdKNnQyRG0rVUFZRDRud1p3UTlU?=
 =?utf-8?B?Q2duZ01valBVeHFYb093OGx1dXRrNkQ0QVBHd0NFWW1WZ0hYSEJiUmllUlB3?=
 =?utf-8?B?dmszN21vOFRwYkEwdi9OSHJvZThEVmJOYVBkQWJ6bGcyejJ2UzcrTVJSQ1p0?=
 =?utf-8?B?ZDg0TGRWZkNtbS91emxUNzBQYlo1bVNSQVM3dVNjRGhuSVJIcDZtM0xHazFl?=
 =?utf-8?Q?myJtPKqZRssrkVQ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b55c4aeb-a393-474a-25dc-08de52855ee2
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:23:11.2074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znIzd00nrGLd0s/SC5gg06ESfCE9n+s+zYqf+fw5OzcuWyRnQnFi40gK6BVfsdbmJ2mX5DF+rKRro0ObfC6PL14EwAsperOR5TYR7DgTjH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
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



On 1/12/2026 9:37 PM, Samala, Pranay wrote:
> Hi Chaitanya,
> 
> Please add closes tag if issue is known otherwise, LGTM,

Thank you for the review. No, there is no official bug for this.
Just found out in one of my tinkering sessions.

> Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Chaitanya Kumar Borah
>> Sent: Friday, January 9, 2026 3:06 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [PATCH i-g-t] tests/kms_color_pipeline: Restore plane color pipeline
>> to Bypass on cleanup
>>
>> The plane color pipeline subtest exits without restoring the plane color
>> pipeline to the default Bypass pipeline, leaving the last selected pipeline
>> active.
>>
>> Reset the plane color pipeline to Bypass during per-test cleanup.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   tests/kms_color_pipeline.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c index
>> 9f34db738..3c9a2cdee 100644
>> --- a/tests/kms_color_pipeline.c
>> +++ b/tests/kms_color_pipeline.c
>> @@ -143,6 +143,7 @@ static bool test_plane_colorops(data_t *data,
>>   	ret = igt_check_crc_equal(&crc_ref, &crc_pipe);
>>
>>   	/* Cleanup per-test state */
>> +	set_color_pipeline_bypass(plane);
>>   	reset_colorops(colorops);
>>   	igt_plane_set_fb(plane, NULL);
>>   	igt_display_commit2(display, COMMIT_ATOMIC);
>> --
>> 2.25.1
> 


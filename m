Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A63C3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 09:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799A510EB7F;
	Fri, 19 Jul 2024 09:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHgsErO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9707910EB7F
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721380212; x=1752916212;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EgCNVOJqdXm5LA2988BTpU+GMlTMWSDkFhcUjDZeQ9U=;
 b=iHgsErO5DjvvvkIWfk+avZtt4RfB6Yscw4RsndhMjiwMKpcqhA+P4G0S
 SI3GpNDK2s7lBfHc32tUqlpkP5mrLTrQLNsxWYWJtvtoiJpvcPnyKEL3h
 bfhdhRbsOoD3Zw2kiv2fVmnmPRBNUhacwlObNFtD6aJvDWfk/BpaZD/b+
 h2KWXh1ry9S719f6M0eR2vkheQSGF5Yf1tSgCBwdcMDCtlObx2NJLhRnt
 Eg5ttX7pYgmejTRSVX3q10sbUm6Qz8ihMsJYEtKBFfpxwrnp17v+G/m/x
 8jTsKgcSopLCTCqJ9WidgRgh21fj+R2kyIQVXu+9+6u8bl576+LWNUP2I w==;
X-CSE-ConnectionGUID: jGPZVi5DS52AkjuvoomWmg==
X-CSE-MsgGUID: IjSUTE1hSu2SVeXg37HCZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19119317"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="19119317"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 02:09:59 -0700
X-CSE-ConnectionGUID: ywDIvKLTTziggEroyGfWJQ==
X-CSE-MsgGUID: IcznNVZRSx6lxlW9o7zPbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51071276"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 02:09:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 02:09:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 02:09:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 02:09:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYSmvFMYlY/clZtjCk2pvIQURC2L43ES4dF74/Tau3gWp0MvTV3qxPkDSG3pEnQMIHHwlZ6Jrnat4mvYtG8a8s3I1343JinNmrszzkkmxILsSHmSSytrC0RIu8BTKtIS/xXbdN9H46eUJeVWflt3ik0yy1VmDwR7Wk2hcH9Hgtrs/Ll1ZspqoyL93GuQzYT6MxQULLPmBg+NOiZFPDSnjiqg8T+zorTqSfw+hRfD+BvI8e1KHqxp2ezuiiyY/DwpfmyBSKCF9eTWdn+t1U6n0j9Cu9SgHgtMSHpYw+I1ddI3rLT8slqNAJ/E7IT2gNW0UlMYvsmWVpbzX/S+RHaD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvCXyFr8sjMJZwcWZZfOZW6Mr6vVx/KKhOzTQ+8+JY4=;
 b=o+JPhEB0QKJbYRq+qcBg1RIc12zGLi8W57+q2KGYA9A7AQTErg4e+FP7lynGQgxm8jaqnW1Aj/CgXJcoDrWCKB/nqkfIDlrAh/1b4FcRpFZo5Opnt0xYReVJA2AWFoJxoSBrCsWLcZ+O+Plhg1vm58VUuJlCoTqDLAxDxfp/PEN4l7EFODioO2ZhSv5an3nKHcBfLW0LVdWgLkNhR7wGzHmfHmLUj02CwjgG85VNuSdulPaYDJwk9IsIDz6ZnLONh4y9XnlQhYuQGmyvtERDu49hWkMXVa2Y/ZFTNMPlxMpFT5RIdPFY54IUv+t/tbY21k3WkClZO50h4U760zFAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by IA1PR11MB8223.namprd11.prod.outlook.com (2603:10b6:208:450::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 19 Jul
 2024 09:09:52 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%3]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 09:09:52 +0000
Message-ID: <6a7c395d-db08-4bd7-8c92-d51ae106f168@intel.com>
Date: Fri, 19 Jul 2024 14:39:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/kms_pm_dc:Add basic validation
 checks to achieve deep-pkgc
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <jeevan.b@intel.com>,
 <suraj.kandpal@intel.com>
References: <20240717140556.640124-1-ramanaidu.naladala@intel.com>
 <20240717140556.640124-2-ramanaidu.naladala@intel.com>
 <20240717152607.twci3qsljmjbs6tp@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240717152607.twci3qsljmjbs6tp@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::14) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|IA1PR11MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e32341-e788-4140-c597-08dca7d28c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUV6VzNZWXpuaENpNGxhRVJFbnpyQjY2azlUQW5YY28xc201OXUvN1hLdldv?=
 =?utf-8?B?aW51OTVpblB3OHlFekdPbGp1VXlRNmh1YjFpckk0YWRFekYxY20raUpSVWJs?=
 =?utf-8?B?WFphNHovaVpiMzV1OW9Hb0JVaUtiYnRSRm1hUXZKdGFBekozemsyY3pPRlJD?=
 =?utf-8?B?eUovblJ2OE5vWXpwUytUMzdSKzNMeWNkdzdJTURFc3A1SFZhUVJCRTZkSHgr?=
 =?utf-8?B?STBURzZnVFZTMGFxMXRTOEl1NXNIMW1vZGVqaWVWMWtocFBmZU9ZR00vWVBk?=
 =?utf-8?B?RndQUVVocHRBdFlQenk2bkNqVDJaN01ZVU9tQXRlRkVPTE1yaTN6RVl3Z3Ri?=
 =?utf-8?B?dkVwSE1aZkVvS0UzeXZnVTBnVWVRVEhZZWJQWURCTzg5SUVGaU42UzRnQVVx?=
 =?utf-8?B?aCs2YmVVOGJnZUhlcllpc2JHS2JVSytDUmJDQXpna3c4dDlwSGpzay8zOFlF?=
 =?utf-8?B?UHRYcCt0VnVXSncyTDc1Q2kzOWJiVENBM21tMFdQeXBkRnVkNGxrcFlQTTBu?=
 =?utf-8?B?QURFTk12cXNvODVMd0hUOUxlOXBQMjFJbVRaM2FSS0txZ3pXaTI0d2M2MlZr?=
 =?utf-8?B?OTFVZzR3VTk3WDJ1bkc2ZUNCSkxCUjdxY0YrMlA2dWgrZjg5MnV2b3RoVC9P?=
 =?utf-8?B?ZytEcmk4a0crbDNldGhOcGt6TXRnL3BSSEQrQVlrcUk2SUY3Yk51T2dqUnZM?=
 =?utf-8?B?NkI3OFdKd21ZSmwvNlZOTXM4ZUx4UkRKTCtpYnNDUWh4QXFRMjJVTXg2UW5h?=
 =?utf-8?B?L0JWOFZuN0VuK1dkRGQ0RmpnRTdyOCticjRoeURVc0xQc2ttUnZHTENSQzFL?=
 =?utf-8?B?QzNGMmhmOXpKWGFwd080SlRiOUVFem9HUG9ZSDJBbThhMjJrRi9Md21XSFgy?=
 =?utf-8?B?U2Fyc1hOaXRpcE5uYzBBeFhST0EvZWVlU0lobk5ybjZVUmZSeUo1S2hhbGpx?=
 =?utf-8?B?ZzViQ2c2TGVlR0Q0cXBwd1RuZEloUEVRS2xkMzl0cHlLQ2szL3dKTVFCbFcx?=
 =?utf-8?B?Nm9FaHRGVHRjMWVjaHNDbHRpZVRXZUZWN0IwSmZTeXNPdWhsZ21QcEYvTHhn?=
 =?utf-8?B?VCtnVVg3UkpVR1pDd0dTbXU5d0NTRWtaS1hONTJCWEQ0QjROcU9zdThmZnpt?=
 =?utf-8?B?bVJqSmRtSExobHhQVURHc21IZjc1MkZmUS9iRWYvT1dPREZLN2lTeXpOdHJt?=
 =?utf-8?B?TDN5ZTVBWktSUzBDNEdkRnhWVnpZeXB6QkdjUTJrWDBWRGUwYWxSZGlnbFZo?=
 =?utf-8?B?Zk91bHV1S3lyNjdqQyt3a3hnZmp6c2tyTGFRTnFzaU51UWtUZ1lTS2VxS2NC?=
 =?utf-8?B?M0VMd3RQMUxlb0FnM2owN3NTQitRNkQ5dnc4K09EaTZVbzFXSFZvT2NKRmNa?=
 =?utf-8?B?dG1FcXV5eTdBZ0JtRjdVSE84R1dEMUM3dml6MVZDcEVzalRmbWRjVzAyVngv?=
 =?utf-8?B?ZTVBVklYWTB3V2U5WEg1cTJJWDFPSUtvYUhrYTVXWlBhM00xSUhTWFJFcHBx?=
 =?utf-8?B?cFp3U09qMjV0UU9VUDNzSDF5cWU2cy9oc2RQRkZhVllCc1VqZFJiM2xmamx2?=
 =?utf-8?B?Z04rRVBQYUhWTVE2RkM3bU4zVVVCWGtYc2VHcEFBdkVHUG9ScnJDMUxmbWJE?=
 =?utf-8?B?Vk0vMUdOT21vYXBTQTY3WlRPOVlrb0tDWW1PcFhqb1hsa1V2MkVlUnhYTnRC?=
 =?utf-8?B?VlcrR3FVdksrS09IUEVBSlY0UTMwOVYySUU2NGZhaFZ1NHROaW9ucWtGVTE2?=
 =?utf-8?B?Y05sWnkwell6RkhzOXlCSGtncVVCNFM0TlVEeGxPUGRNaFJlbzhUM3BFWjdC?=
 =?utf-8?B?c1RxaHVXK1BzOWpueW1kQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXdsNUZLZ1dBV256bXdUa1gycllhQlFvUG5SdG14YTFVTitaM0NpRkplSUVu?=
 =?utf-8?B?UWFTcVY0eGM1b3hUa1R1S1A3MGV3a2FpRW9XcFpDTVBKR1k5dVptcWpkTmJJ?=
 =?utf-8?B?TTkvU3hZQXM1RDJHUTJFVFVvdDIzU2RNenVYVXllUkZTZDNQanVXRXZBbWla?=
 =?utf-8?B?anU0a1ljUHhEdEVjeGJ4Q3YwN1EwbDJTNDdyVWtIdXN1STBDYkxhNDVlSmNG?=
 =?utf-8?B?U1VGMnZXT2NyWC9qa3VJeEsyemVHeGU0RjY5bWtZM3JTZ2lJYWovSkVRTTFZ?=
 =?utf-8?B?UHlxSDZrMDFydUcxTnYxRlRUZU1RS3lsRlZIZ2ZaVkxuOFNSeTJzVER5SGFT?=
 =?utf-8?B?Y01LNTlQNitHMGp3cnpaZ1h4SmlQZW5iSXpjdkdlSitGamtwTWxqbGxubCtE?=
 =?utf-8?B?R1p6eGhYRXdVYWJoZmhVaXlCeXdDZVFxaXI0M3dvellHRmlKZEE5VFhyNHhG?=
 =?utf-8?B?L2NMNDNGbjV4M3RMcnBQOGpncmVEMDN3WjZzQjNaM3hTTDlLNkNjM25jQnAy?=
 =?utf-8?B?bjdXa1FEeHJxRkVOSVR4alI2dm1TMTVBTnBYOTdDS0VYdDRrem1icm40aG9R?=
 =?utf-8?B?Q1dMT3ZHWlVhS2ZIN3JvMDRNZ0t4YWNoWnpBVFlLKytvaVdhazNsbVRNL1NN?=
 =?utf-8?B?L0c2Q2p5bFBPb09adHo1VUQwMmphUzFEaUE0Q2dpZ0R0YTJ4YjM2eXpxNE9Y?=
 =?utf-8?B?NlorSDJXMmxjMGJmSFFNMFpUOTdYV3p2ZVpoVFkwV1QvR2FMOUN6NzhhTHF3?=
 =?utf-8?B?dUZ6dWlvYTM2NFJybTJwRFFXZ1ZCYWJXNDJQU05sb253OHRWNE1ZRVVQSisv?=
 =?utf-8?B?NUg5Z2dTbDVKQXZJNWhyR1h0VGRydG5DeXRUNTVrOFNTY0trN0NWL29MSEh5?=
 =?utf-8?B?ZkhzR3ZmOWdYdmlrS09sNUNTemxBM2ZPcTBSbzljc2hMTkFJZ0pRQWx0OGpE?=
 =?utf-8?B?Z2IxVXY1dUZoMHRkQ1hONDVrRHVHTGhVQ1FXVmZZaloydEtIQzhrMXdnNW14?=
 =?utf-8?B?VU9VMzMvM0ZaaFpUS09iYnFNSExHZjBMRGpvOWZHRWRtUXRvQnBjQm9OMWVK?=
 =?utf-8?B?Ky9BVHplemxMd2x6bFlwQU1Zbm0rSlFmYTlBMUV4MTl0eGJscFRnaEJDN0Ft?=
 =?utf-8?B?MTJ5d0lTVlhPM2VUcVkyNXNpRmJTNlNGVWxoODdpdDMxNTZmbGExNGtzSEhK?=
 =?utf-8?B?c0ttMDF6ZS9uUDFQUVI4VHRHQXQ3MEpRNWQyaWt1V1FTVncySjlvQVhndUxF?=
 =?utf-8?B?N3pwTDNXWklBV0VUVG9waEhGOHU1c1g0b0NWTTU1R3Q5Z2N2QjNsS1hkN2Jq?=
 =?utf-8?B?aUpIaVBqSVFyQU5sajJWYjN6WGpZMzNlRXc1eGhFcis3Vnk2ZjNyUW5uNHVR?=
 =?utf-8?B?QlgwUmZ1L25NeXlra3RFRS9LNkcxWE9pRVRJallBcTJkRWhMS3Npb3I1ZFBj?=
 =?utf-8?B?T0xJVnVZTzJsRThVcjR4bFFYcWV6b1hORlpETEFPSysza05UM05lY1VDcjlB?=
 =?utf-8?B?NEt4OGNnZGs5QlVUSmlhcDNPZm8vcHF5ZzJMUTZYWUlZN3lCeEJ2aDd3R1Rr?=
 =?utf-8?B?S0JVcTI2cVRWY1QvaW9RWE5sejBQWkgwb3NnWU5WdUhLRWU3bVJsM1ptcjB1?=
 =?utf-8?B?QURraHYwOHM2aklnWVlpb0EzQlpiakgyNXFsWXZjWkFyeUdGMktMYnhPMWt3?=
 =?utf-8?B?RVJUQkNsV081UkpoUkJyejJISTltQ1FhVzN2T29qVUdqTzdVeDloOFFVOE50?=
 =?utf-8?B?ZVdXdVo3TUN0bXhTWG4yN2lQcHVsUXZZKzFidXFkaXEySS9aUTcySStFNEI5?=
 =?utf-8?B?SFFoWXhPa1BPcjQrTU1KNUxiSGJUM21xQ2xWT24yRHZZb2ZucWZ3a1FSYitJ?=
 =?utf-8?B?cUhZRDA0cU9Cd3g2TCtORnZwVEQyMWRCSkVzWE51Umt3QVFoNkIyMVZmL3ZL?=
 =?utf-8?B?L3h2U1FDZ1pZelFGL1hFRUJRNVlMWjQvRWNQTitpeGZYeDhHdmQ3SjM4N05D?=
 =?utf-8?B?VWpMSFd3SW14OHFxYng4NHlVK3lZbEQ3ZHg1UUJNNm92Zk8yVTZMdmpnazhS?=
 =?utf-8?B?WjQrekxoZHdXdi8xM1FpQ0FSODZFWGoyYXBUTGtmcnRCQitQenRrTEtnRzhR?=
 =?utf-8?B?aUhUTktiNGhTUEJCMWM5TEZ4Zk96RU9tV0c2VGIxa2NVWUFIRFZCUHRDZUQ2?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e32341-e788-4140-c597-08dca7d28c73
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 09:09:52.4412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4lfUrO6aeWbvh4w9B47djrIK8Px1QnhocHAoMRJeEwUYtEBsSkT/trX9R8OM8MHymaoEJFJeHzhflc3PCSNy6L6Zsi2KvQ+0ECIcTPQ0c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8223
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

Hi Kamil,

On 7/17/2024 8:56 PM, Kamil Konieczny wrote:
> Hi Naladala,
> On 2024-07-17 at 19:35:54 +0530, Naladala Ramanaidu wrote:
> 
> please improve subject, was:
> 
> [PATCH i-g-t 1/3] tests/intel/kms_pm_dc:Add basic validation checks to achieve deep-pkgc
> 
> imho better:
> 
> [PATCH i-g-t 1/3] tests/intel/kms_pm_dc: Add basic validation for deep-pkgc
> 
> Note space after colon ':' char (before 'Add' word)


Sure i will update this change in subject line.

> or even shorter:
> 
> [PATCH i-g-t 1/3] tests/intel/kms_pm_dc: Validate deep-pkgc
> 
>> Add connector checks and test requirement validations for deep-pkgc
> 
> Add dot '.' at sentence end. How do you validate deep-pkgc?
> I do not see any new subtest added.
I am not adding new subtest. May be my commit subject is confusing you. 
I will change the commit subject/Message as below:

[PATCH i-g-t 1/3] tests/intel/kms_pm_dc: Check for eDP and Disable VRR 
if Enabled

Enhanced the test_deep_pkgc_state function to include an eDP connection 
check. Additionally, implemented logic to disable Variable Refresh Rate 
(VRR) if it is found to be enabled.


> 
> Regards,
> Kamil
> 
>>
>> v2: Correct indentation and update comments (Suraj, Jeevan)
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/intel/kms_pm_dc.c | 30 +++++++++++++++++++++---------
>>   1 file changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>> index e1318bfa6..8fb35a2df 100644
>> --- a/tests/intel/kms_pm_dc.c
>> +++ b/tests/intel/kms_pm_dc.c
>> @@ -592,31 +592,43 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
>>   static void test_deep_pkgc_state(data_t *data)
>>   {
>>   	unsigned int pre_val = 0, cur_val = 0;
>> -	time_t start = time(NULL), duration = 2, delay;
>> +	time_t start = time(NULL), duration = 2, vb_delay, delay;
>>   	enum pipe pipe;
>>   	bool pkgc_flag = false;
>> -	bool vrr_supported = false, flip = true;
>> +	bool flip = true;
>>   
>>   	igt_display_t *display = &data->display;
>>   	igt_plane_t *primary;
>>   	igt_output_t *output = NULL;
>>   
>>   	for_each_pipe_with_valid_output(display, pipe, output) {
>> -		/* Check VRR capabilities before setting up */
>> +
>> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>> +			igt_skip("No eDP output found, skipping the test.\n");
>> +		/* DEEP PKG_C_LATENCY can be configured only for fixed refresh rates */
>>   		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
>>   		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
>> -			vrr_supported = true;
>> +			igt_pipe_set_prop_value(display, pipe,
>> +						IGT_CRTC_VRR_ENABLED, false);
>> +			igt_assert(igt_display_try_commit_atomic(display,
>> +								 DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +								 NULL) == 0);
>>   			break;
>>   		}
>>   	}
>>   
>> -	/* Skip the test if no VRR capable output is found */
>> -	if (!vrr_supported)
>> -		igt_skip("No VRR capable output found, skipping the test.\n");
>> -
>>   	igt_display_reset(display);
>> -
>>   	igt_output_set_pipe(output, pipe);
>> +	for_each_connector_mode(output) {
>> +		data->mode = &output->config.connector->modes[j__];
>> +		vb_delay = 1 * (MSECS / (data->mode->vrefresh));
>> +		/*
>> +		 * At least 5ms vblank time required to program higher
>> +		 * watermark levels
>> +		 */
>> +		if (vb_delay > (5 * MSEC))
>> +			break;
>> +	}
>>   
>>   	data->output = output;
>>   	data->mode = igt_output_get_mode(output);
>> -- 
>> 2.43.0
>>

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B781D2E021
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 08:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D85210E789;
	Wed, 23 Oct 2024 08:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImrT4TMx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C476810E789
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729672522; x=1761208522;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qxtckpZFdOmCiCBk8e+U/Fu52ZaXeRQFcUsxyn6iQz0=;
 b=ImrT4TMxZcdmpm0ASNJrZ26jvmApZ2Pmusu9eh2nGTmbr4hMSmJgl+Vt
 dKbIXMS4MfqRNlScCtMP5piGiiyQ1+0gQPhEUQAoxu/1Qe8eXN8XzVrBA
 CzLQX5blo2nZuXl0jX09mm6HjjXGFYlsOiK4uW4B93YKmTCXUueb4CBKI
 litkboSq8acx+mCrRYvglPtM5PnJ4FNIlrClrw0kQd4rGs2rjhgobDWv2
 M2PDYGhfXtAOwUPdzO66VjoBtCi8WPeHvsnfDP4Uoo0mke6WETo4hZL5B
 wET8/nsOHfxJm69sxPOUiq/WNpYAaw4fAldhjMSbBc6EViZvWtD471+pl A==;
X-CSE-ConnectionGUID: DZVOx93fQ5mQDIqx9IrTrQ==
X-CSE-MsgGUID: se6hTM4XR72lnZ/P17ZgEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33169563"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="33169563"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 01:35:21 -0700
X-CSE-ConnectionGUID: zoXDgoh2SVGuAyge8TklRg==
X-CSE-MsgGUID: s1VVAP2pTGyJIpbFSbjIlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="80318030"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 01:35:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 01:35:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 01:35:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 01:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIF9W5EvACKcBdpwBzKlWS+h2tIDzDkIpVpS8Rrvxwv4S3q5OkLz9A5V8kd/DRlOnxcaF2dWUxwO9oDRTHOSo5k1wQm9pXGJRTZ6qvhqNAtyktdeNFcYsKYON/oG9+AcovRaTriB8+N6S7G47MxrU874pDMF54Ty+W0OFq/hH1WVSEQNELtGWAjrs6RjiFe+B1IXNmS+koGjQLG4IlqHkRV3NNDL81WO9v77Ez5IaV3V8+6hSyVQcjmIcDEEk3Ei19qYO074amQIEeSiQaowIk0PJYq872tTGiP3vbbRxzfsB/4bUEuMlVTnv6xh3Z8ohrs8Mag/RcRhEcJZXbLjrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED8Pmo1Xi4QSvGFf+UR3N52od97oNFI8EACvq2OvKnM=;
 b=hdP4droBzzW3k96qVfRaJnyhHPe4QVcKmyoBtSzeyFmkNXh5TX7tuWPWdmjcO9UdNOJM2mHTtiwHoI/229WwIm2+aqVIOUhTTD3ZB2gp5NkVzvCwk9Uefi6R6hQ98o4JrDFvmvtuN7jXRwnfCI5rNlmTbMfraNxBiNnb8vSaWUOePoCnRVRccW2Hf3efCcnc7R100mun7GK8ZuesjkiBNakelsLp8fAiTQycrNPQUVV2nrQ/XBMcwK1s/q26kqR32jngVqw51QwvZ6Sj/KP7LZ2Yucv+HS19JIZza49udVZqFyOPek4hkMbwnwJjZCyjFfs0BTieqN2TBmahAykn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB6890.namprd11.prod.outlook.com (2603:10b6:930:5d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 08:35:18 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 08:35:18 +0000
Message-ID: <d8862ed9-e1df-4c70-99f8-5e25110a652c@intel.com>
Date: Wed, 23 Oct 2024 14:05:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v4,1/2] tests/intel/xe_pm_residency: Add GT coarse power
 gating validation
To: "Anirban, Sk" <sk.anirban@intel.com>, Riana Tauro <riana.tauro@intel.com>, 
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20241022104918.2120652-1-sk.anirban@intel.com>
 <20241022104918.2120652-2-sk.anirban@intel.com>
 <a33c8dd0-46c1-4b12-8610-6fa4e3129115@intel.com>
 <22d9b1c8-1f89-4954-9a77-58e4678907ae@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <22d9b1c8-1f89-4954-9a77-58e4678907ae@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a9e55c-0cc3-4ba0-143b-08dcf33d9ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXM3alBRQVFBK053T2pJVkNDMCtEWG85bVU3ZVJqZTZQMHNtQVU2ck93cm9T?=
 =?utf-8?B?Z0hoejFuZ3V1QXB1RVlWUXEzVklJbUNDd3ZvM2FJS3FSMld1MGt5c29uT2hD?=
 =?utf-8?B?dW13TkRJTzB3dkdGaVQrNmpRQVgwTTF0NkU2YTZlenhoTFJ6R0ZsREJPM0VR?=
 =?utf-8?B?ZlFtOTYyUVFJbGE1ZGFLLzdoVVYvOFhmaWlBdFhiSXcwR3JoMFRRbzhzSmsr?=
 =?utf-8?B?cHpKaXhwKzJXOURvdzBuTHRjeUtSKzlSN1VUQkRwYWczaDQwUktaWjZzbnBE?=
 =?utf-8?B?SE9TZmlITnhWR2IvYUVlbE1wdjh0aXYvK1RkQmpYamxYNndNS0xrNm5mZzlp?=
 =?utf-8?B?MGc5cHo0NGpYY0dVcis2azB5TnN6M2JnZ25rb1BtRFNMNlpKL0dtVGIxb1ZS?=
 =?utf-8?B?a3hXSVU0eHJ3WjZQK1VjeUVJMDkvKzFGWlRPQ3Flb3dwY3huUDRTcGcxZEU0?=
 =?utf-8?B?N1BnWS9yWWFISEVYS1lkQ2pXTTlhSU9wK291Zm90eDNqZTR3VFRFN3gyREUz?=
 =?utf-8?B?RG9LVDNXR1NMbE43K2pSSCtyRnh5elJlbXkrdlF1OXJmQ0paUDZlRUNFcVhK?=
 =?utf-8?B?azhYQlIxc2N5SnFXL29VaUtQWXlIQUlUZ3Rpa0tmdnhRb0s5ZXhWOUU5UlJF?=
 =?utf-8?B?dXY0d2c4NVdZNlpxdXJHbUFuc0MrbVZSa3FjUkNoUml0TjBNWWJlQlFmeVVl?=
 =?utf-8?B?aVFFK2hHQ0ZKUThKMFNNdU5JcS9wVkphaTFsaUNuSW9UMi81cDJKWkpXZjlS?=
 =?utf-8?B?N0JmTjlQRlFxNjNjZkR5NmorMEJ5TXhiTFFpek1hZEFobXdNYmxteGcxcm5j?=
 =?utf-8?B?NUxmRnU1TmRWMWg3a0VkVFhZZnpFbWZ1QnRGekROR2VkVUpvaWFtL3BsdEpv?=
 =?utf-8?B?UEYwank3MmViNnBaT0hCcXJaSVcvU2dRaVNEUDdzeXB0YUo5eFFKeTR5MlRy?=
 =?utf-8?B?b1ZsQ3htMUVUSWlXdVNPWktHNTBIcmlJdEVpMk5wMzk2S1FGRGZKbmZkOEow?=
 =?utf-8?B?eEphUHJjNTZDdWZPS3M4RXNUckkrS2liMG1mU2xlOTFxcnVtRDExdDN1TEIy?=
 =?utf-8?B?b1RnNXphYWZxeG56d2NaeVBQT25KOGlRbjBLbWl0R293NlQyZGQybitKV0Nz?=
 =?utf-8?B?UmpjSFg0UzhGK0VYRmJqcDNPSzR5SjBRR3U2aTk0a293bzhOOFhJRFRhQVVs?=
 =?utf-8?B?YW12SURndkZYZ2Y5czQvUWlmcWhJYUd1MDY2a284Y0NxeG9UYnZHOTFPY2V1?=
 =?utf-8?B?aXYvNC94Y2tiTGsrUHdQbEhYUDVHRVhDTGc0eWYxOHprV0picEMzTHYzRmtm?=
 =?utf-8?B?WUZCSUVGWjRkUFpMVndKTm9FS3BFNFBobjlxL0FyOTVBRjVCa2h3d2VYTFBX?=
 =?utf-8?B?U1V1c0IrcUE0cUpEUm5HU2hCeWlXdksrcDBFNEZSUytXcmZRc1NuWGd0dlpl?=
 =?utf-8?B?dlVOb2xIYnJZWCt0WW4yb29HZGtiSWNvYUVBV0FkVlBIR3FWdXpvNm9mT09L?=
 =?utf-8?B?cEpkeTF0b25SR0QzVEtERVRoSVgrOEhkMnpVSytCSTJuMVBOREJLZ3NxZDlw?=
 =?utf-8?B?NkcvMHNlL1dTc29MYW1YUXFtTFNIVVlzQmJDSlFUTEdZTWZBMWEzbnpHd1g2?=
 =?utf-8?B?eXRYaXlaMlVweVdVR0REMysxVUZBdXdtMlFnMkxWSVFVZWdXa2xPRFVQbkxh?=
 =?utf-8?B?OEtsN1ZSZUQ3WGNaM01TUDhOUU1mOFdpRGR5aC9LMVJ3MGhFUnBEY3ltSVFN?=
 =?utf-8?Q?WwbstJCePKNqoO+AvY+EY8WYVJ48jew+ytexQU3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck0vVytmKzRSSStyZHQxc3l4c0QvR2EydTEzL3Vmb0wrMXFhdzlHVkJKL3R1?=
 =?utf-8?B?UXJjWllrZ3ZNRDRoWUgzbUhyRTA5Q1dJdTRzazVVditRV3l1eFNpZjd4OXFQ?=
 =?utf-8?B?dTFLT2Rad293OFdnZ1N6Qkg0dng5TnlBWC9uaUJoNUdTSjBabklmcnpMR0hs?=
 =?utf-8?B?Qml3a2pmangyb1VnNlpFUjg0aktwcnZld2FZZGJySytHd0JIR2IzWHl3NzdK?=
 =?utf-8?B?eUI3MitMMDM0U0R5ajB2aldMdzR1djdwanVMb0xDQU1OY2ZpSGlrNDROQmkv?=
 =?utf-8?B?dG53R2FDNENsZGZvYTExYmpmTGczM0wwWTVQc2ZYKzZ2L1R0VTNqTmlOM1VW?=
 =?utf-8?B?cDFRQ1ZLUFV0V0VwK0xaYkIrR2JCMm1LUzJoRDZaTmRSY00zdGRJN2pyM0gy?=
 =?utf-8?B?akt0NloydlpWL29Nbm9CREVJQnBRbjZuTnV1ZEtjbEJkR251RktPZUkvWjBt?=
 =?utf-8?B?ZjNBeW9ka1RMZU9Pb0Z6aTgwdC9pZDkzQkcrcDZvckpVeE9iODV0UFJybEFJ?=
 =?utf-8?B?ektvR2Zuanl2N1JCaWU3WkRyMGNmdmRYQllFd0hrL3g2RWk0ZWRDZDI2ZkZO?=
 =?utf-8?B?K2VsZ25mblJpUzNjNW1RWGRMUVZjWDhJUE5ncWx4eTJHYk5XRFhycU51UzZ4?=
 =?utf-8?B?WGpmUUJ1UEZkUTEreXA1QTg1SEI3NkVDdmN1RGlCdEVpdjJ6KzV2U0R0RTZm?=
 =?utf-8?B?MTd0M1RTWEUyT1Q5c2FIMmFOOUUwN3NTRVZlOTdLMmIzNEJ5UnFKMzRYSUx5?=
 =?utf-8?B?NXVieG1GSWR5ZlNITjFtVmFSZWsydms2Ny9MNWNBUEwyZHJLc2xYNUEzK3Fj?=
 =?utf-8?B?UVVFM1B6L3c3YWlScTVPWkExVk93bnMyekFFblU1eDlIUGoxSFU5cFZlZEZj?=
 =?utf-8?B?Y241YlRidXFWOHB5cFROS1dTbVY4UlRMb3Y3bHY3OUx6anI1aDJlNWN5alRR?=
 =?utf-8?B?bmNidTA5WlJhU2gxcm43dXBhNVhrZ2VSS1h3WTFYTktiK2R5dllUeWlmWWFz?=
 =?utf-8?B?a0s0VnZBVmE0QjBCVm9TbmJrMEdJNDNvdThFNjJITEFrZ1RIYVlYODREMzlr?=
 =?utf-8?B?cC9sUkU0bjNYcG42TUNCNDU0RlJJMk9RV2ptTXJwbnN5bjJwQlVQMTNLWmFB?=
 =?utf-8?B?NnpuVlRpL1lYRmMrQU9PRWtRTWVYektFOEdBVXZOV3NLSWNjdm05RTh4ZW9L?=
 =?utf-8?B?cVpCckJoQUgxZXVTVUc0SmhsZTE3L3BiSEgwaGJiYkJpZ05xcnVxMWM3ODEy?=
 =?utf-8?B?UnJZVnpJd012YlE5WWp6MzQveHhId0R3ckNFRlFsSDdCcUhVdkRMdDlsWmVD?=
 =?utf-8?B?OHRnY0VPNmR1VGU3UC9mZWk1NnFpNThXSGJsS2s1emZVMVpwQk8wYzdrWFVR?=
 =?utf-8?B?ZldsV0xNYlQ2U0w0S1hhV016ZllCbGxUWkZ1T2hIYk1NaGY3YmpsWnVlajRo?=
 =?utf-8?B?U2haeHN6L1g2dHdCRkpRRlhTYVBoUkpQeEc5QmVpSUpWcVAvYWk5cFdGT1Fr?=
 =?utf-8?B?NzVzS1M1bkl0b01XUWFBSG0rcW4xQStKTlVpalpsbDBiWUw3b1VqbVYxdkpF?=
 =?utf-8?B?UjlVanQxVS94RVk3MkE0cndLSjkwc0dZZ1c3TE9ROWJpbDNMc3Bmc1dUSUt4?=
 =?utf-8?B?MFNTa1hSOVJIcWtVd2t0M3ErZ2h0VGNINWpTUFkxSFVBS0RRVFpVWDZpVWVa?=
 =?utf-8?B?RWx5T1VjR094MEE2c01VTFFTZkYwaXNCZkRsaHRudUVrYnhtbWdiZGZmS01Z?=
 =?utf-8?B?enpZWlh6bTRoK1FBWEY0QVpaUU5MdTJlbGMwY2J2QVRXU1d1V3grNXNFZGlp?=
 =?utf-8?B?UlArRHNUWDFiZXFQSGpUeFYyK3V2VHYzQUxQVFhhemtFdTFLSmpHa2YydCt2?=
 =?utf-8?B?STh3VG42N2ZhRlZrR2hkN252SFRjQW10K3pCS2kxUks3Zmh5Z1l1SmF4ME9L?=
 =?utf-8?B?TVl3TkpXeVNuMjROODNnQ1IrL1Bwa0RwdnBmTEtVbm1EMkFjTVpZODZGRm9z?=
 =?utf-8?B?ZVBCMmUzSEkvTGFLYnVHOEFWMkw1a3ZvMXk1dlVoM1RLWlpDVktpNW1ramF2?=
 =?utf-8?B?VHFoM3pDWVp6b1plRno0d1hSOFZyTkZjY3czdWZlVndLMmY3R2FwUDVnQytR?=
 =?utf-8?B?anU2SVdVMFN3eWFhM1lXckFvbEpONG9rVEZFSTF5R2RwSHZVZWVCaDhPbm5C?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a9e55c-0cc3-4ba0-143b-08dcf33d9ff6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:35:18.5137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8OsOdPbAaZKpTfKcK8vbRGNp/Q4BWhNoeQJo0l6z9T0chCW+wQKxJUCHjt0NqbWeZPftpaDDo6tCfftUCzLMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6890
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



On 23-10-2024 13:14, Anirban, Sk wrote:
> Hi Riana
> 
> I was using the dir in the previous version of the patch, I will remove 
> unnecessary opening and assertion of the gt directory.
> 
> Thanks,
> 
> Anirban

Do not “top-post” when replying.
https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying

Regards,
Badal

> 
> On 23-10-2024 12:55, Riana Tauro wrote:
>> Hi Anirban
>>
>> On 10/22/2024 4:19 PM, sk.anirban@intel.com wrote:
>>> From: Sk Anirban <sk.anirban@intel.com>
>>>
>>> Implement test cpg-basic to validate coarse power gating status
>>> after S3 cycle.
>>> Add test cpg-gt-toggle to check if GT coarse power gating is up when
>>> forcewake is acquired and down when released.
>>>
>>> v2: Address cosmetic review comments (Riana)
>>>      Fix suspend state (Riana)
>>>      Add exit handler for test cpg-gt-toggle (Riana)
>>>
>>> v3: Address cosmetic review comments (Riana)
>>>      Fix commit message & test name (Konieczny)
>>>
>>> v4: Address cosmetic review comments (Riana)
>>>
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>> ---
>>>   tests/intel/xe_pm_residency.c | 90 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 90 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/ 
>>> xe_pm_residency.c
>>> index 772fe9b57..e9a257fd4 100644
>>> --- a/tests/intel/xe_pm_residency.c
>>> +++ b/tests/intel/xe_pm_residency.c
>>> @@ -63,6 +63,12 @@ enum test_type {
>>>    * SUBTEST: toggle-gt-c6
>>>    * Description: toggles GT C states by acquiring/releasing forcewake,
>>>    *        also validates power consumed by GPU in GT C6 is lesser 
>>> than that of GT C0.
>>> + *
>>> + * SUBTEST: cpg-basic
>>> + * Description: Validate GT coarse power gating status with S3 cycle.
>>> + *
>>> + * SUBTEST: cpg-gt-toggle
>>> + * Description: Toggle GT coarse power gating states by acquiring/ 
>>> releasing forcewake.
>>>    */
>>>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>>   @@ -317,6 +323,79 @@ static void toggle_gt_c6(int fd, int n)
>>>                    "Power consumed in GT C6 should be lower than GT 
>>> C0\n");
>>>   }
>>>   +static void cpg_enabled(int fd, int gt)
>>> +{
>>> +    int dir;
>>> +    char str[512], path[PATH_MAX], *render_substr, *media_substr;
>>> +    const char *render_power_gating = "Render Power Gating Enabled: ";
>>> +    const char *media_power_gating = "Media Power Gating Enabled: ";
>>> +
>>> +    dir = igt_debugfs_gt_dir(fd, gt);
>>> +    igt_assert(dir >= 0);
>> Not using dir anywhere. Why are you opening this gt dir?
>>> +
>>> +    snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
>>> +    igt_debugfs_read(fd, path, str);
>>> +    close(dir);
>>> +
>>> +    render_substr = strstr(str, render_power_gating);
>>> +    if (render_substr)
>>> +        igt_assert_f(strncmp(render_substr + 
>>> strlen(render_power_gating), "yes", 3) == 0,
>>> +                 "Render Power Gating should be enabled");
>>> +
>>> +    media_substr = strstr(str, media_power_gating);
>>> +    if (media_substr)
>>> +        igt_assert_f(strncmp(media_substr + 
>>> strlen(media_power_gating), "yes", 3) == 0,
>>> +                 "Media Power Gating should be enabled");
>>> +}
>>> +
>>> +static void powergate_status(int fd, int gt, const char 
>>> *expected_status)
>>> +{
>>> +    int dir;
>>> +    char str[512], path[PATH_MAX], *status_substr;
>>> +    const char *power_gate_status = "Power Gate Status: ";
>>> +
>>> +    dir = igt_debugfs_gt_dir(fd, gt);
>>> +    igt_assert(dir >= 0);
>> Same
>>
>> Thanks
>> Riana Tauro
>>
>>> +
>>> +    snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
>>> +    igt_debugfs_read(fd, path, str);
>>> +    close(dir);
>>> +
>>> +    status_substr = strstr(str, power_gate_status);
>>> +    while (status_substr) {
>>> +        igt_assert_f((strncmp(status_substr + 
>>> strlen(power_gate_status), expected_status,
>>> +                      strlen(expected_status)) == 0),
>>> +                  "Power Gate Status Should be %s\n %s\n", 
>>> expected_status, str);
>>> +        status_substr = strstr(status_substr + 
>>> strlen(power_gate_status),
>>> +                       power_gate_status);
>>> +    }
>>> +}
>>> +
>>> +static void cpg_basic(int fd, int gt)
>>> +{
>>> +    cpg_enabled(fd, gt);
>>> +    igt_system_suspend_autoresume(SUSPEND_STATE_S3, SUSPEND_TEST_NONE);
>>> +    cpg_enabled(fd, gt);
>>> +}
>>> +
>>> +static void cpg_gt_toggle(int fd)
>>> +{
>>> +    int gt;
>>> +
>>> +    fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>>> +    igt_assert_lte(0, fw_handle);
>>> +
>>> +    xe_for_each_gt(fd, gt) {
>>> +        cpg_enabled(fd, gt);
>>> +        powergate_status(fd, gt, "up");
>>> +    }
>>> +
>>> +    close(fw_handle);
>>> +    sleep(1);
>>> +    xe_for_each_gt(fd, gt)
>>> +        powergate_status(fd, gt, "down");
>>> +}
>>> +
>>>   igt_main
>>>   {
>>>       uint32_t d3cold_allowed;
>>> @@ -380,6 +459,17 @@ igt_main
>>>           toggle_gt_c6(fd, NUM_REPS);
>>>       }
>>>   +    igt_describe("Validate Coarse power gating status with S3 
>>> cycle");
>>> +    igt_subtest("cpg-basic")
>>> +        xe_for_each_gt(fd, gt)
>>> +            cpg_basic(fd, gt);
>>> +
>>> +    igt_describe("Toggle GT coarse power gating states by managing 
>>> forcewake");
>>> +    igt_subtest("cpg-gt-toggle") {
>>> +        igt_install_exit_handler(close_fw_handle);
>>> +        cpg_gt_toggle(fd);
>>> +    }
>>> +
>>>       igt_fixture {
>>>           close(fd);
>>>       }
>>


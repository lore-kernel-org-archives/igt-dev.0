Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60799E6749C
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 12:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0892F10E635;
	Mon, 22 Dec 2025 12:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwr6BHzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E200010E65C
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 12:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766407129; x=1797943129;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=m0PFC+Nfye+zsvhQJ9yZIbe5m9UuT+Sigir6y/+2pEY=;
 b=fwr6BHzd61hMOAQD01lO6oshBNQpdnK8qafMzaF6QX/EqJquAy+K7Gya
 D4KiG/qhDjpUuS1qxqeSoytwF99q9QuHaxl/AuTjF9TcBhzNVk51+ZVHq
 5wCaIC/Bg7wkslCpYm0Ih8vvuUkG0++vZXVlqWyP22JNPPQnMGQojHHpz
 KF4wucXyOuq9bJUc5ZyDe/4SrQE75eYgT0DUFffNS3t9VL48KUUcxPcJF
 vYI/XBLNbFV8vGpaVSGVntgcgyIVaZMorXXiLo2Q4W7nTahaL0RQWr71t
 i/ymRtU7FdmcgxhWaofmVyb4Gk5q440ESKvomR+0rh+HXbSJqEMRkplht w==;
X-CSE-ConnectionGUID: TnI/t90IR3KpXcDz31RVEg==
X-CSE-MsgGUID: 2EqYmZiSStG4BffGncJyqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68198963"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="68198963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 04:38:45 -0800
X-CSE-ConnectionGUID: rjEYZxm1TPCe93N1c64MsA==
X-CSE-MsgGUID: j22KkII/TfuBRqTHBybq4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="198666670"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 04:38:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 04:38:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 04:38:44 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 04:38:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+xMywE2z9/P/8mvQJ9xnu4iIYepgR5wlAyj+jw0iD6aodJ5YbGpJRQ3ucdqAwohFyP+aKXuWXEuHfHpWW2O1I9/6ISqviKiPsfkUoTK+cm6Urxu/CbE2BrsjHV8kdV4iTYogsM493qWauFywFxD5XYae4C+HjDZ1pPKLw0v340sZ48WCZ/r+GOR+3iHEUVR4xClyiodJ8KHc+XTK9LNXE7X0CxHybwIc0EXfo+WfRqrCi1B17lKwebpX923U/82OcFLIAWQSS2X7q510H92B+c4bZbBD9wWjNz08NzrT2QNBTZsY/6/fP23KFGNpxFc5kENSHyzJATAIAF2mTg+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IOb+vN3Etred19dVaEFtin1L2JPOMj/LO07UiG/1EQ=;
 b=jrXODuGbPo7QrHMzm8srlOdSgjgoN2Is2Qv4O2dumhW0Sgdunp6lLAv8BeN4ZulXqFFEFgJRAviFj+7xXtc2YA8WZzdR+tAYIpa/Rqq/lLJHt7I36m7yerpkym/mLxIOhNO3UoB1A4jqKEtoTcNjo87LG0Ej6i/9Ei17UCM4+eQntuCYtaxPOCMD1HOnggh7Uk3SJ1P3Euw/LlvEmsDGra9rek1t4OdN13NkTUHqXf4J5zc+quFkEF9xm8oOJPbT0sah24/cn5Zguufwpl+6o1GYeRaiNPnEclDAepTbNr77c7X7dICnIsbgPy7QXojl4B31WxaTvTUJv3QIlK/rOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 12:38:41 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 12:38:41 +0000
Message-ID: <c478e0ac-c70f-4119-9d09-da76b867b9d3@intel.com>
Date: Mon, 22 Dec 2025 18:08:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v4 3/4] tests/intel/kms_dsc_helper: Add helper func()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
 <20250905210816.319104-4-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250905210816.319104-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c09af9-12ee-4765-8d3a-08de4157099a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnRlZEpIblhZVHBPK1ZSaERscElHWWkzNURTZmxhR0dlcWlZdlRkaXUxb0pP?=
 =?utf-8?B?YTlxNzIzTHF2c295OFlyV2pxNElBRTlRLzZEUktnai82MytUaDJNMitMYTVP?=
 =?utf-8?B?VkdZNXM5eHM5cllZdjF2T1pLald5NEpaUkhRak13NWM2TmFoZUFWYk9DNUpX?=
 =?utf-8?B?MHRCSDdjTjRCL0orUDNacnRTSHVxaHQ1V0VhNVZUdmc0a1RTaGxDRW54TlVr?=
 =?utf-8?B?WXlYaWpnSHJVTWhIWEZRTlVHaFdKZXYvTE9qVmR2YmYrUGNWbkxkMFpzNGkx?=
 =?utf-8?B?eWVHRXBiNXUyZ2ptcHJ6aHM4ZVhLWDcyWmNvSkVXb0ozK21SMCtGbkVyMk1k?=
 =?utf-8?B?QzZhbFhVbXNaM2loMXIzb3ozemdJNFdXZlBTbjZueTZHUFFZT3d0WkpwVElJ?=
 =?utf-8?B?b2N6VGRIWG5kbVNORFNnTFNycERzT0FnZTVvbnA2YjhxRmxkWjBQemFjakJj?=
 =?utf-8?B?RWdqL3VZVkQ2M2x5Wk1vbHdldTF4b3N5b21SM05hNHZDV3hsZ3JuYWNweWxK?=
 =?utf-8?B?dTY3MlhLYjZaWVJidkRvS2RxK1lUeWhFdWZVbDBsQ1o5bGhhenYzY3pUYklz?=
 =?utf-8?B?VjNiaFhwWVhZVEQ1eXRyNUlJREVSTmplaWhkMGlYc2ttMCtjcGt5dHEwN3FC?=
 =?utf-8?B?NG1ER0tJTlNLZG1obDhUMFF6STdKRzcwTEJRQmpXbWZWRWZpeU5Vc1hFcEkz?=
 =?utf-8?B?WEptSTF1ZjkxQnRPcWV4bDZ0UEd3SDdyK2lKNmNQMUF2ZGdLTGxvZ0RCOEJm?=
 =?utf-8?B?MGNieE9RZndObFpZSGhFQnpwRytpTFhUNDRJc2VBL1lZWncreWtQRVg4VUNL?=
 =?utf-8?B?OEpVZXNpVDZjakdtaHhQc0FORGNMVk5rMlZJbENvNm1ic1hGMUdjNUtmNkhs?=
 =?utf-8?B?UW1Dd0pQdEdUUFZvSlNVeHplaHBqb1R5bUh0SmNITmdHSC80a29aU3NJSXZV?=
 =?utf-8?B?Yitqb0tTcmswNUU4ckEzcWtkeFk2amh3azFRdUhDakRJanBLeVpBRlhWdzEz?=
 =?utf-8?B?VS9zbVViRTVybHRYMEVzazVLdFBISDAvYnEySHZGU3ZFZGFLTWdyNzhWb2o2?=
 =?utf-8?B?UHFaNDQzdFJRM0d6OVNGTDVUaDdtS3dOOURNV2NKYjJ3ZVoyMllsZUdtelJJ?=
 =?utf-8?B?ZTVQV0Z5ek4xTG5Cdy91YUNuT1l0ZHNFamdnOFppTDRxbTNwVVl0VVlNaktE?=
 =?utf-8?B?SjBmUkpHUFVlMVBmVkVCTm96dGlQa3draGRyakpmKytqK1ZvNUptQ3B3eXJt?=
 =?utf-8?B?V3dacUJJSkl5dkZBRGdjRURjY2w2RGVVbkRWUWYvL09ob0Rhd1FFMUVQNnJm?=
 =?utf-8?B?TVpYTVJjRmtGRFpSVzFuTFh2Sm9kN3RuN2pSK3QvZzRHOWlCa0loUXZQdmV1?=
 =?utf-8?B?OENuV2hHMGJNMTVXSGRQQ2FVSnFWZjhRQS8vdCtjSW9NbDNORnpRMXQxRTFa?=
 =?utf-8?B?dFVUUXEySTM3Kzc4b1BYRlpLQUdPS2lhUjlHOEtzd2xXVUxIaVFqdVc2QTI2?=
 =?utf-8?B?Yy85VU9DZWpURjdtZi8xbnNTRDBMMGIyeDBpYThOR1hzTmJ3YS83SlcvbG9n?=
 =?utf-8?B?dTJxRzVGZFAyd09zM0Q5VmZOVG9zbTlSM3ZZbENOeWptUVlwbTBlTExiaWd6?=
 =?utf-8?B?dVZnckhURllkbXVnQXJBUEh2VERKN1YzLzVMSHd4RmNXR0dHZ21jakdMQTBx?=
 =?utf-8?B?R1F6VDRKM0ZKVkpHVnZGeDZvNnlhZmFXUnRLenNUeVhRSkVZSW0zNFRqSVpU?=
 =?utf-8?B?Y2NYNzNFRG9wVW9JZGNwc0RnK1pDbVhsc0Q5ZjlWOEkycm5zMmdvcHZxbWZB?=
 =?utf-8?B?K3VBSDJteW9ic2hMRWV0c1NTRk5UTXZtbExiMm0yZnhFRXExL1ExVFdDd1Mz?=
 =?utf-8?B?Y0RMVWxMdVc5VzNtQkVpNTFDYnhoamI2UDc5cFhtMU1uUDgzVGF5Y3VLZGZW?=
 =?utf-8?Q?TGTygIidoh4TT6VOnHHz+JcyY5VNQL9e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDVZTENOTGNyMlJtQnNaREVlQkl0aTNoSzA5dTRQQ3dPRXI0Q0d6ejUzenlo?=
 =?utf-8?B?V2FpY1dsSEtSWmFHNFlhamRYckt1NFRUM3dENXBtU1N2eDM0SzRFK05ZeWhB?=
 =?utf-8?B?WHcvVnFGc1crVDZla1BNQ1lJM3V3RXFtMmhQUFpGVWhHYTlLMnk4RHNYVHhU?=
 =?utf-8?B?NmtiQkxGZ2lZbkJiTTlXNHV5WDh6MjFSUWxUQzdFeEV5Q2REYmNUR3lKNDl4?=
 =?utf-8?B?SW1jSXgzcmRIQTdlM2p4Zkk0WG0vbFlwTDI0S1VtMU1ZY08ydlZIT2Z6Q0pX?=
 =?utf-8?B?aGxoYVRzdmh6Zklta3RXQzIrclUxakZ5VGNBaTFhcEVpempWVXhuYjdka1A0?=
 =?utf-8?B?K1Vwc2JMdmp3c2NyREVEMXNOYWhhN1UwYjlLQys2STM1d2Q4ekFsdFhVVFhO?=
 =?utf-8?B?TkxZSWk2eU1RWWR2U3V2aTIwRFY4SnV3NDkxOEoxUDB3SmZwWDhKb3M5S3JI?=
 =?utf-8?B?TE9pUGRrcmwrVC82ZDRQaWtlWHV1YlVMa1VENmdWSXpIVTRwRzZsWW1Ycm8w?=
 =?utf-8?B?b2tDUE4xYzA5Q2N2bThIekpUMkQzQ3krZkF4UFpTT0R1YU40dk1JY3k3d1N6?=
 =?utf-8?B?b1d3TWZQV1BQRE1vNk53SGNJZDAvL3h2TmswbFV1S1BsMiszU1paVS92QkM4?=
 =?utf-8?B?VG16bThYZGhVZ1ljNTFyWXYzc3lRRzFlQVJoenlzbWx0aGx5QUFDbkNRL1dZ?=
 =?utf-8?B?TkRaZjB6QkJZWFJ3Nk9CbldOT0htaXZhVWpHNE13eUR1a3BGWndla2NsVkIx?=
 =?utf-8?B?MXVpYUwvS0Y0cm93T3NhOXYwMFV0WEFpeU05cVB6ZlJkNjFVUjUrenp5dzAw?=
 =?utf-8?B?R1V1YU85aGRVZnhwRmliZUxOR3ZEa3N6UW1rZ3p6S3J6Z2k0Y3ZwSUFtR2VT?=
 =?utf-8?B?YlNNVUc4NWUzODUrNFM3QUJrTUtMQ0w1aG1FNHlpeTdhZXRoVW1tT09RaXE5?=
 =?utf-8?B?WW5ENWFGeG80WnNBMWRZcUJQcVJQNmRNbXFEZEgvemxtVExYZGZhT3VOQ0g2?=
 =?utf-8?B?MTQ4a2dQckV4Z0Q3SU53VjY2Y3graXJhRTRpUDcyOE9CVHZGZmFmNjJUNGQ2?=
 =?utf-8?B?clJ6d25kd0c3dlJzSkEyQ3NJRW5uMmtVd2FMQmVQek5Db2ZRWWs2blMzR2NL?=
 =?utf-8?B?WUV3SkVWdVh3VGJlbzZKYkRxd3gwei9TK3R3eEI1NmJReHhxNTN0YzlWL2E4?=
 =?utf-8?B?MjdLSjczSHJ0dlVwNFB5ZzB5TDF4eCtTQTJBR2p2OTc5MVRDQmVEWWRTTFFZ?=
 =?utf-8?B?RUVnS0ovcGR4YzB0S1MyenluSWtxdEcxUGlKcW9jaGtJQmdvNTg4SkVLbERD?=
 =?utf-8?B?M0RCWXBPTGpnWUJOamUwOTdXS0FLd09OemtFdHVEU1NscS9GajhJQUQ1L0FU?=
 =?utf-8?B?U1JnOWdUZXJ2SGkvTEtJSm8rRi9sT3Z4SFBuM3FZeHVBc0k1dlVWNXdtQlRB?=
 =?utf-8?B?dmpDYWpLNzdsTUpZci9XR3ZUejA5YzBYZjFwbjMxVHBZOHNZMjFmVkt5OUlt?=
 =?utf-8?B?UVRpZ04vRVRwSHF6ZlBCL3VNQmJWVVpOMW9SdzhsUWJycGdTUzAzMVNCdDNH?=
 =?utf-8?B?YTR0VjBnSlRmczdJcVlGOTU2Z2hDU1NKTnlBVWdHQ2ltWXlESDZIcDEwOXNh?=
 =?utf-8?B?ampXa3VKZWIxenl1ZllXQ3ZSd0twb2pCRndub1pNa0ZrZlllMHZOS3FXRWNn?=
 =?utf-8?B?dktaejh2aTQ2VUJmZUtFMkNsVkVWUXdCOE9wSEN6eXFKdnpFaEZyYXRRTG9C?=
 =?utf-8?B?V3ZUa1E2NlBqR3VJQ3M4NmpPay91d0hEcTRqZi93d0hwbUorS3BwZFVmMGli?=
 =?utf-8?B?aVlGZWhFN2YvTU9HTkJHSyt6YTFMNk9NN2N0L3owTDFZNi9oOUFkQ3RRQjQw?=
 =?utf-8?B?ZUh4MWY5bjhmbFByOGc3KzZSVTdkQ0hwbFVBYmRJSGwxekJOUVE0VXJ3MWlI?=
 =?utf-8?B?Rks5V1B6bG1hTERYcjF4SjVqN0lIY3NIdktEak90QzFJV1NEK3ZaRUVBNzJR?=
 =?utf-8?B?bmtsVFAwMlE1Skd4dDB4M3VaRnNqdzBHNGJUTUlNR0VQNnludWFjRjRxdzhN?=
 =?utf-8?B?Y1pOVVBkSnlIT2QvUWZaMGRFdHhlaUJ4OFJENkZuck1zVmV6c1VVb2x2RXNC?=
 =?utf-8?B?K2tMaS83SEFuV0toQ2F2RFk1SHJMMk9EVmR2aDBrR3BwemVsaGtYSjBjeWQ4?=
 =?utf-8?B?cTVkZnlzbDNkUUFyZW5pMUdya0NhSUY3SDZaSzYweDNvQ2NNSnFseEJhTlVr?=
 =?utf-8?B?WjhaaXcweU5LK1NnTEZ3QkVTaDJuZHJ2eGxTL3VEZ2dHcGV0R2ptdktxOUho?=
 =?utf-8?B?SndMM0pROVh3MkxiRnNHeWRGa3JKc0JkYXR4dDI5S1FQUERiYkx3MFhqSktl?=
 =?utf-8?Q?InIetAL4eiiJlTMc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c09af9-12ee-4765-8d3a-08de4157099a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 12:38:41.7292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWOJObUS+wkLogTO1/s2zANim6gJeM8x7wMzd16NeXeSidVn2EAmWjRZzTj+h3njvxFl1yLXWVrf747Zmo7C8+6uT6aUkQvk+ndXVfBw9Pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
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


On 9/6/2025 2:38 AM, Swati Sharma wrote:
> Introduce check_dsc_joiner_constraints() to validate minimum pipe
> count, DSC slice requirements, and joiner support for DSC joiner
> scenarios.
>
> Update meson.build to link kms_joiner_helper.c into DSC-related
> tests so the new helper can call igt_is_joiner_supported_by_source().
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc_helper.c | 54 ++++++++++++++++++++++++++++++++++++
>   tests/intel/kms_dsc_helper.h |  3 ++
>   tests/meson.build            | 17 ++++++++----
>   3 files changed, 68 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index cea4304e4..df2f1d5c9 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -201,3 +201,57 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
>   
>   	return true;
>   }
> +
> +bool check_dsc_joiner_constraints(int drm_fd,
> +                                  igt_output_t *output,
> +                                  int num_pipes,
> +                                  enum joined_pipes type)
> +{
> +	int min_pipes = 0, min_slices = 0;
> +
> +	if (!igt_is_joiner_supported_by_source(drm_fd, type))
> +		return false;

I think we dont really need this. igt_has_force_joiner_debugfs() is the 
correct check here.

The debugfs entry will not be there for unsupported platforms.

It will also not be exposed for cases like eDP MSO, and also with new 
VBT restriction for eDP pipe joiner.

Regards,

Ankit

> +
> +	/*
> +	 * For joiner, 2 slices per pipe is used
> +	 * i.e. min_slices = 2 * min_pipes
> +	 */
> +	switch (type) {
> +	case JOINED_PIPES_BIG_JOINER:
> +		min_pipes = 2;
> +		min_slices = 4;
> +		break;
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		min_pipes = 4;
> +		min_slices = 8;
> +		break;
> +	case JOINED_PIPES_NONE:
> +	case JOINED_PIPES_DEFAULT:
> +	default:
> +		igt_info("Unsupported joiner type: %s\n",
> +                          igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	if (num_pipes < min_pipes) {
> +		igt_info("%s requires minimum %d pipes\n",
> +			  igt_get_joined_pipes_name(type), min_pipes);
> +		return false;
> +	}
> +
> +	if (igt_get_dsc_sink_max_slice_count(drm_fd, output->name) < min_slices) {
> +		igt_info("Output %s doesn't support minimum %d slice count for %s\n",
> +			  igt_output_name(output), min_slices,
> +			  igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	if (!igt_has_force_joiner_debugfs(drm_fd, output->name)) {
> +	    igt_info("Output %s doesn't support force_joiner debugfs for %s\n",
> +		      igt_output_name(output),
> +		      igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	return true;
> +}
> diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
> index 4dbd88fe7..505821871 100644
> --- a/tests/intel/kms_dsc_helper.h
> +++ b/tests/intel/kms_dsc_helper.h
> @@ -8,6 +8,7 @@
>   
>   #include "igt.h"
>   #include "igt_sysfs.h"
> +#include "kms_joiner_helper.h"
>   #include <errno.h>
>   #include <getopt.h>
>   #include <math.h>
> @@ -38,5 +39,7 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
>   void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
>   void restore_force_dsc_fractional_bpp_en(void);
>   bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
> +bool check_dsc_joiner_constraints(int drm_fd, igt_output_t *output, int num_pipes,
> +                                  enum joined_pipes type);
>   
>   #endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..dbe434c3a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -379,14 +379,19 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dp_linktrain_fallback': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_dsc_helper.c') ],
> +	   join_paths ('intel', 'kms_mst_helper.c'),
> +	   join_paths ('intel', 'kms_dsc_helper.c'),
> +	   join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_dp_link_training': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	   join_paths ('intel', 'kms_mst_helper.c'),
> +	   join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_dsc': [
> +	   join_paths ('intel', 'kms_dsc_helper.c'),
> +	   join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_psr2_sf': [
> +	   join_paths ('intel', 'kms_dsc_helper.c'),
> +	   join_paths ('intel', 'kms_joiner_helper.c') ],
>   }
>   
>   # Extra dependencies used on core and Intel drivers

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF57BC5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 12:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AED10E303;
	Thu,  5 Jun 2025 12:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9l1NpB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A57810E303
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749126815; x=1780662815;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GEXRwfyrwalr3ychwfH5U+1yIm7z1hd9E5y5aAF87uM=;
 b=i9l1NpB5PdmSTWfrHwhMPvKdZTWG/d2S/YHowDRN3LJjJIWVqTTseB4j
 hCFmxvv7nbbptutRlsHAMHkYKLb7wn3d/CSDt8kcYWWio6Qq4nHZPYlk9
 QBOOuHBEoTInJZGhNwik0W58VsILpBEnk5S9bKNN8Gpl9bqeab2+PKdnw
 y+MlGMVBCrn9RaDwoMQlnLhzt1RXPttZbRGySi6Bp3Pnbm2TYIJkXZu6C
 Z3Ov87mxAAbh6GO47WwwlD1Khsj0sIgqYAn4Jo/yUFyDjBFFxP6x9k7xV
 KaHHq59OEsD8tg4szokhCvc6goTtEkiUQw1VlbW1CNoi4dOLo5GHCq4c/ Q==;
X-CSE-ConnectionGUID: ODPsKiCiR0CdTOHiNgNdaw==
X-CSE-MsgGUID: lSW0XM81QduODzftL1CyOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51336885"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51336885"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:33:33 -0700
X-CSE-ConnectionGUID: C+y1GstgSDe751KZszl0Mw==
X-CSE-MsgGUID: Xm88YszmRti7/4BSJXXfMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145458147"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:33:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 05:33:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 05:33:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 05:33:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ff7PaPJiIa4nZLk2IK+F5yPmpmV92DwpCwWaIZyUTfGU16hIkOTOAWJ1qoKqgg8gjydLyksiwS9v6jui11sbwKAVmqg4Cab4JMvyZtDR4qPvZzdtrWVtvZS2W0x/h7HVvTqJRkZHg5JPLN1vdh0TtbzkjixUlfX1dw2PF8lsWB5Q+w4ZALitlgZyDvmhYvkhd08JS6E+X5ezsLrq7rWEyMB1E812AhWOFADTxo4K+kh9L7Q3SGpzRiP7WKm5ooyN0hsSh5Dj4Vnqxads0KMecjBxtDfB9/yhqLTgn8VRbxjlzRLuKbdsrF9PV5jjBxETqxk7rqJZlotT2SRMu7fNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BO7jjuT+KhCbGdoSYpdiqANWd0kBOFI9e1+KVBKXet4=;
 b=giBNRSnRtCJmsFyicU7YhWXZWGX40vl8NJ9zk5W54QbeEYLUjcJYX+0ecBFKvOZuJtStOkVX7TEpN5YUEDijnoBrwXu4pZChDI4REBdRsJBhAK+O4ezbpnNBog7hfDrcEsA1IVeX0FoCmS7CdypNYg5EfItlzsoxxm9lhk8ILoneAMXIsYFjJHq7VizdiSwg+mX7u4zNOd6ejHkGzI6jmaoPNUHxyd1JAW8XI3yFFYvQAVTm8hV9tBlo2NJBubF080Zfcnl0vFXlpdTVU7boIZRmKY3FMJgE+rhluTaTWIRHSevQCKL0XMYr0bWGyKgs5hN02YSyxgGwwKFQukP+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 12:33:29 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 12:33:29 +0000
Date: Thu, 5 Jun 2025 14:33:26 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/xe_compute_preempt: add compute preempt
 on vram bos
Message-ID: <aEGOlgaEpixCuIjB@fdugast-desk>
References: <20250604115024.117036-4-zbigniew.kempczynski@intel.com>
 <20250604115024.117036-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604115024.117036-6-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:10:110::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CO1PR11MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d79f19d-4d22-4696-fa45-08dda42d2d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzhsSXd0aXYwdDJKRGx6ZWp2L1NiSVhiYjJkOXJaYmRxaDE1SVNRbU1HUXV2?=
 =?utf-8?B?NUdPSHJmZjBoeEtJeWxmdi93VG9IUmcxRmpUMngyUWNSTVZUWUV4NFNYSVlr?=
 =?utf-8?B?dkxMZTlId3o2Y0txakYxejNLYThDSUZtYlFEQVhuVmRqRjR6VDFFSlg0ZUF4?=
 =?utf-8?B?azFtODVxWlVhR2ZZelkwN2VRbnU0VnZ3eDA1UmxNV0lMZmhFd1ZRUy9FeHNU?=
 =?utf-8?B?NDdHTUppd25GZXJDemJ3dC96ZHpWL3ozVjRJYVJHREVuYjRBNnh6Y2tTSWFJ?=
 =?utf-8?B?WVB4YkZCaGl2M21PbWhOSXlUbDJRSmhUTS9qQ1NzVkpkSzNjWTFNcUI0VGJz?=
 =?utf-8?B?L3A4SmhwbFRib3hxS0ZyamZjMXhFSXZWd2h0Q0NpM0t1NzI5WXAzTjBPNTlI?=
 =?utf-8?B?ZThYa1ppMmEvcy83VG15VlRvanVmMW1rQWFSSzZmdnZYZTNEOFJSK3JoOERw?=
 =?utf-8?B?ajVTd1owTDdXRGltUXFVbzd0M1lDY0U1U3ZpTlYrakZmaFEzTXpKd21QUURs?=
 =?utf-8?B?WEhGWFJmb2lUbWpPUGVQUG5NY3hoQzVjNEFHckhWK3hVMzdwNUEzVENjSER3?=
 =?utf-8?B?RCtRUFd0cEh5ekI3QmZpTEQ5dityWlZxLzg4TWphVUw5UElRejlaRk4vb3VY?=
 =?utf-8?B?Y0U3YjA5Nks1ZGxHdXpwUVlEd2NHR2F2cUNpNklzYitLWWRpa01RY2xVdXl0?=
 =?utf-8?B?bVNkaTZ5cEtqK2JFQXBDeGVNcEEzdGNmTTVNMnQ0Y0UweE42MVN5b1NjL0pX?=
 =?utf-8?B?Nm4vZjg0UXBiYTlxUUpORkcyeXJvKzAwY2RENlBONllsMzVUc05mWWp2QTR0?=
 =?utf-8?B?LzZyTENJNEpoMGRsTlhEb0JYR0wxR0wyZnJDSnN2MkpOOEJQSjczdmZFdGh1?=
 =?utf-8?B?Y1I3NXgyTzZSOExFTjNsTVhzSjRtSThYMmxZM2Q3enBnVFdBODd5RmdkUmRh?=
 =?utf-8?B?czYvTVhJd3JYSEtZclZDMWZoZDJUdkszanI4RFp5cis4a2Z5eWhpRDF1THcy?=
 =?utf-8?B?LzE5ZGw3Tm5jMVoyWklmZ0h1R2xTVzBUUGNwWEQyRkpJT0VBZngwenFBbEpm?=
 =?utf-8?B?Z2VhUFFyL1MweCs3eisyek1Fd2cyb0pDTWVhY25Dc25wVy9TVXVqc1pFWEpk?=
 =?utf-8?B?UjRHTmVkWXA5cWI2cVdnS1RQSkRoSmxrWlM3L3ZLOTZnaTh5TlVKM2VBbmF2?=
 =?utf-8?B?ZWs0bm1RWUhqY2N5QzdzdkJGakRBM2w1VUYxdm81K255NFAvMERyL3EzTjBj?=
 =?utf-8?B?OTJUOXVURitOTGFqa1RCVkZnQ1NxMDZrTXBZdDBWRTJyZzZNcmw2MmVxMVA3?=
 =?utf-8?B?T0w1RUozZ3E0emhIMFBFTEVVcEgvVVBVdzRNNzdSSlBnQmIwRG5RRDZhU1dC?=
 =?utf-8?B?aW4wYnB0cVh1SU5HQlZjR2xTTjNOMmlaZXg5QnBIMkRSRTl3VFVPNU1kWmhh?=
 =?utf-8?B?amdJcXZMT0xxSmlXZnpSWUJ5WnNML1BrTmlteEVqZGFocVowT0FjbDdMQmd1?=
 =?utf-8?B?bXRkUnNta09ZcHhaenh0TWRIVzVOQXVsMVloVk1kcmxCa0xFZ0lGOXZwN1lw?=
 =?utf-8?B?dEtVNFVtaklMakFnSXk3bGE5RHdkWUZWVkRQSzJ4cHF1UGF2OXZDcVF5dU50?=
 =?utf-8?B?ZEkzcE42M2RoS1RoTDEzT1Y1STdNbGxCcWp5M2I0SllVZ2kyd2luSjdxREtX?=
 =?utf-8?B?ODVRQ1IrZXE5anZNMzdEeERUU2pXK3dLYjB1ejFZemhrOWpMdkROYUlacTMz?=
 =?utf-8?B?SDdYTldkZW9tN2g3UXdQWGR2UTEyMU9HZm1XNkpFdjRCKzYweE9McXA2ZDBs?=
 =?utf-8?B?QU9STm5tUnlqaFJOTWNyNFNOYVRaUzdCYmlZazQzdU05YUp1TUxJaHBsMFAw?=
 =?utf-8?B?VDhXbkVTMFQyY3hTZUp1QVp3OXp2N3Fkdlpiemp1QTlUQnNRWTVrbzc0S2xB?=
 =?utf-8?Q?hG2jFDct8bo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFdSSTVONWtWcUh1MW11K2dzMHZOWHBuaXF4TDhvbVQvS0szV0ZJbFE5QTJG?=
 =?utf-8?B?RVUwb3lwSUdWWXhGUVB0S2l5MEZPaERPS1k2Y1NVRjZnQ2JuTjVESFJHVEty?=
 =?utf-8?B?WDhzY0dVZ3YwSlZJVmoxTENyUjhUcVptb1IzWGFVaUZmUTVmTzJneExzdTcw?=
 =?utf-8?B?S01xUmxBVTMrOHg4MUh5TUJIV1RjeWRReWF1cTVPOVlxQTBzSFVpdWFjbmVW?=
 =?utf-8?B?Zmwyek43aE9scnZlUVo4NWYvZmlWak5laGJkbktnMmdldSsyN1FGRDhWRk1U?=
 =?utf-8?B?b0RTSnFOTGxMem9QeFR2U1FrODFJeExxSXNFT3YxYlZWZXExeTF3ZjB3YnJN?=
 =?utf-8?B?ajZHRDFqNEIrbEtXV253TlpxQmlBSFdhU2dhR01rak50d1ZObWhEWUxMejB5?=
 =?utf-8?B?am1aaGJJQUI5UUlXeUVEMitsbFJraVZJZUFlZDkwZXNOdXVtRXZTTUR2dHdv?=
 =?utf-8?B?NStjanZrQU9kV3VDQ08zOWcwZzdLSUNrNGRjdFpldE1LVElNOC9LZzZ4eEFN?=
 =?utf-8?B?TWhqZTVQMVoyQytDK1lOYUptYlZzUzdwNlExdU4vd1EzZmhCeFVlOExUVms4?=
 =?utf-8?B?SDBKdkhpSVcrY1JFZDVQSWppRnlUMHZWKzVRNkxVQ1FkQjI5eVZvWlhyYVpt?=
 =?utf-8?B?RitocTQ5Q1lBbUJMQW1xbjNta1pNdk9KaVUzaC9qZmROVGl6dTdHTloydHBC?=
 =?utf-8?B?bTRIV3h6eGxhTkVpMVUwanZTanB3OFNWUC9BRCtOKzdZZlpaN3NqeUNUU1h1?=
 =?utf-8?B?N3U2NkhxNVVFbHdEM0k0RllYaUZWa3A4eUgydWhjZitkVFJyNnV3MHZ3c2xk?=
 =?utf-8?B?RmV1M294YjRpTFNRRHZndGFXQURQTWdjY1czSDRPQTJYZnhPcjYxeEI1Sko2?=
 =?utf-8?B?UnFnWGo5eE9YUG16a3VkTjFLUTBLYTh0QjVya2EvQ3VkeGxvWUNWM0VRVzdh?=
 =?utf-8?B?NmVxYW1POG1icExxWDdnT0RubURXeG1Fcy9laFIybTJLeXZIdmtEazdZWGVh?=
 =?utf-8?B?TWhVb0Q0UzNSZG5RNlNZTzRsaHF6bDdkazR4QXVxT2JpbmZJSjFvV0lENWp0?=
 =?utf-8?B?WmsrQWsycStDbitmT2kyd3pTTFY5ZkJJK1dFWnpPR29RUnN2Zmx2bVpMaVNx?=
 =?utf-8?B?ckx3U2pRNVQ0bWNPL3VyVmMwZVZwNnNoQ1lyZ0FNRzhOdzY2Nk9iN3JndDA4?=
 =?utf-8?B?OFF5YktsTzJVRW44aC9tdWQ2cFZIdjM5UWtMdEFVTW9pOVFoeGs5dU1NZE9U?=
 =?utf-8?B?Ykp4OTd4dTJRTmxuajVtZTBkZVVpUDUyeTh0a0I2WGhCTHI5eGo1ckdxWXox?=
 =?utf-8?B?OGVPSGRuNDM5bTR6R2YxME81SlJLNkxpbW9oQ1pHN2N1U2R4S0V2a0kvcTVH?=
 =?utf-8?B?MDFiR2llZGZpOTl3T29CdzIxVWFqb1NaWDNMbU95RVBLM1k5K0pMNktpRFha?=
 =?utf-8?B?YjdKMmc1K1g1QnZ1M0F1Y0RXSzk5RjRYR1krWTFqRVlxcVZHWVN1WXlmb1V6?=
 =?utf-8?B?QmdNK01pRHRUaUlEQkEyMC9UNUpialNyNzE5UU40SERDYkpESkloYjhrcWts?=
 =?utf-8?B?UFExbHNjaDQ4eDl2bFM3ZlUxMlhHRk40R2ZlVW5aZldLTXdkeTkxeklWZDVp?=
 =?utf-8?B?ZXlEdmJGdFhkNGVoR2hXNUVSWDhGRFZ3b1daSWJRR1VTUjF0VTFvdTNIMUpo?=
 =?utf-8?B?YnhpR0hYNFdZWnJrL2JVRjJzZkI3Ynh0SHM3YnlyTGhWSUFoV1pFV0dMUmNn?=
 =?utf-8?B?cTArcDRDZHhRQStjWFF1VU9USU5ZOWhrc0prczZuNUZqbGVROVZyblFYZVlG?=
 =?utf-8?B?cHlpT0pLdVhFZ2lSeEJpVExDRkVKYVltdjNRWFpyRTBBWVlNNXBvTk9kWm8x?=
 =?utf-8?B?OGNNdHpCSkR3SVgxZStBa3ErR3J0aVVXeHI1OUNzbDROSjVMRnVOc1kyZUl3?=
 =?utf-8?B?VkduZUU5aEZpOGJGVjlaMjZLMHMxSFIxaHRySXZGS0VEeVpYWVF3dlBpRk9F?=
 =?utf-8?B?QkxteXZPeVBjcG1ZbllGOVh1alJPdXJmR09rbDRXamwvVEg0NlFZRG1oQ0RK?=
 =?utf-8?B?V2NDaVE1OFBxYmhpS01rU1ljem4yVFpKRTVudGV2c0ZXWFUyUUIzaU9hNzdF?=
 =?utf-8?B?WUY4MUk1YURpdksvSDNjTmhHTExRaWJLcUxCNks1UldmVkdrSlJBOUMvUUlt?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d79f19d-4d22-4696-fa45-08dda42d2d4a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 12:33:29.7918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2KW7tycZUIAM5kbf/uYXhfVs1hNwNxszNsLZnW+XjFRfljqCd0yrTNKyhAscXEi8ASZHZ5Bgo3e1ryrchDLnlEqG7LEw38oA6GhCjRKVFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
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

On Wed, Jun 04, 2025 at 01:50:27PM +0200, Zbigniew Kempczyński wrote:
> Add 'vram' and 'vram-evict' subtests which exercise preemption
> scenarios on objects allocated in vram. First subtest uses half
> of vram whereas second one allocates more than available vram
> causing eviction.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_compute_preempt.c | 86 ++++++++++++++++++++++++++++----
>  1 file changed, 76 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 3a3d7847ca..d4b6198a65 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -35,16 +35,27 @@
>   *      Exercise multiple walker mid thread preemption scenario consuming
>   *      whole ram only when there's swap on the machine
>   *
> + * SUBTEST: compute-preempt-many-vram
> + * GPU requirement: LNL, PTL
> + * Description:
> + *      Exercise multiple walker mid thread preemption scenario on half of vram
> + *
> + * SUBTEST: compute-preempt-many-vram-evict
> + * GPU requirement: LNL, PTL
> + * Description:
> + *      Exercise multiple walker mid thread preemption scenario on 120% of vram size
> + *
>   * SUBTEST: compute-threadgroup-preempt
>   * GPU requirement: LNL, PTL
>   * Description:
>   *      Exercise compute walker threadgroup preemption scenario
>   */
>  static void
> -test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
> +test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption,
> +		     enum execenv_alloc_prefs alloc_prefs)
>  {
>  	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption,
> -						       EXECENV_PREF_SYSTEM),
> +						       alloc_prefs),
>  		      "GPU not supported\n");
>  }
>  
> @@ -54,12 +65,13 @@ igt_main
>  {
>  	int xe;
>  	struct drm_xe_engine_class_instance *hwe;
> -	uint64_t ram_mb, swap_mb;
> +	uint64_t ram_mb, swap_mb, vram_mb;
>  
>  	igt_fixture {
>  		xe = drm_open_driver(DRIVER_XE);
>  		ram_mb = igt_get_avail_ram_mb();
>  		swap_mb = igt_get_total_swap_mb();
> +		vram_mb = xe_visible_vram_size(xe, 0) >> 20;
>  	}
>  
>  	igt_subtest_with_dynamic("compute-preempt") {
> @@ -68,7 +80,7 @@ igt_main
>  				continue;
>  
>  			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
> -				test_compute_preempt(xe, hwe, false);
> +				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>  		}
>  	}
>  
> @@ -81,7 +93,7 @@ igt_main
>  				int child_count;
>  
>  				/*
> -				 * Get half of ram / 2, then divide by
> +				 * Get half of ram, then divide by
>  				 * CONTEXT_MB * 2 (long and short) job
>  				 */
>  				child_count = ram_mb / 2 / CONTEXT_MB / 2;
> @@ -89,9 +101,9 @@ igt_main
>  				igt_debug("RAM: %zd, child count: %d\n",
>  					  ram_mb, child_count);
>  
> -				test_compute_preempt(xe, hwe, false);
> +				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>  				igt_fork(child, child_count)
> -					test_compute_preempt(xe, hwe, false);
> +					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>  				igt_waitchildren();
>  			}
>  		}
> @@ -116,9 +128,63 @@ igt_main
>  				igt_debug("RAM: %zd, child count: %d\n",
>  					  ram_mb, child_count);
>  
> -				test_compute_preempt(xe, hwe, false);
> +				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
>  				igt_fork(child, child_count)
> -					test_compute_preempt(xe, hwe, false);
> +					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
> +				igt_waitchildren();
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("compute-preempt-many-vram") {
> +		igt_require(xe_has_vram(xe));
> +
> +		xe_for_each_engine(xe, hwe) {
> +			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +				continue;
> +
> +			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
> +				int child_count;
> +
> +				/*
> +				 * Get half of vram, then divide by
> +				 * CONTEXT_MB * 2 (long and short) job
> +				 */
> +				child_count = vram_mb / 2 / CONTEXT_MB / 2;
> +
> +				igt_debug("VRAM: %zd, child count: %d\n",
> +					  vram_mb, child_count);
> +
> +				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
> +				igt_fork(child, child_count)
> +					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
> +				igt_waitchildren();
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
> +		igt_require(xe_has_vram(xe));
> +
> +		xe_for_each_engine(xe, hwe) {
> +			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +				continue;
> +
> +			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
> +				int child_count;
> +
> +				/*
> +				 * Get all vram + 20%, then divide by
> +				 * CONTEXT_MB * 2 (long and short) job
> +				 */
> +				child_count = vram_mb * 1.2 / 2 / CONTEXT_MB;
> +
> +				igt_info("VRAM: %zd, child count: %d\n",
> +					  vram_mb, child_count);
> +
> +				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
> +				igt_fork(child, child_count)
> +					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
>  				igt_waitchildren();
>  			}
>  		}
> @@ -130,7 +196,7 @@ igt_main
>  				continue;
>  
>  			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
> -			test_compute_preempt(xe, hwe, true);
> +			test_compute_preempt(xe, hwe, true, EXECENV_PREF_SYSTEM);
>  		}
>  	}
>  
> -- 
> 2.43.0
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08427D358DC
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 08:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF93D10E806;
	Thu, 29 Jan 2026 08:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwuDacon";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015F410E806
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769674912; x=1801210912;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ts/ll0lg7cix+C2K9fNDKN4PL56J8d9lHyh3eLvh0wI=;
 b=FwuDacon4NeigqagY6X0ech5XXc3b8lPkmqBXQuAFREw2AeeAcv8jYqz
 O8qrWPUf40GrzXl9HeF2Jb2QtrLBOJG06Yvab7RVbvrl+2gJrrSco1DMr
 Xkme/Yf905Zs4+pJ5PqTDc9bTutcZnz0Po8c1c2dDMttHr18DbU84Y6VK
 p24o1SqZyyLAiA+HDdu9LwXmnaa6isu6/g+JkouXOGbk3lsWy80YIqIep
 Ah3qxTc5xCUSPZqe4kgeApFRQNwBrSb08QWHZPwpnngKjyMMChuwmRDEA
 FJZWOxurh/JKHN9UHj9ZgWLJMk/DrxShV9Q+4TI21IYXZLYAcTdfLeKjD Q==;
X-CSE-ConnectionGUID: gc9AhPyRTqmvq7IZaX3N0w==
X-CSE-MsgGUID: HjbdgLxfThG1T5CLgQjVOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82272703"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="82272703"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:21:52 -0800
X-CSE-ConnectionGUID: dgA1NPv7T4iiuywH8O0qzw==
X-CSE-MsgGUID: mfwS2/y4QBKfWb9AzRGyVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208405090"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:21:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:21:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 00:21:51 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:21:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVAFbcFzePxmrP54xVpVkaUt8tFRZhvkQwYI45evtf6gKvH2PakJQ9ieqQDPdNQdCdyaQdoXsEiqGwHQC7iuLEcwde6/S2WgYNiQB4PWPMlEqTYpo/uBI0i4kV/2Ucz9hFfnUDcZ78Kgujo4v7fenHbGecGeBFB4aez++B/RCLtdZNKRJcTib4XqW60cDFkpeZHDYJhv4pylZfWW7S6WyRs94tJftBdVXnJ3Wx74kmjpchI3rVUJCGxkAct1z0E4R5JJmt+7VP52Iv/ur5mFIX37rrzG6C1ymhVzfjm39v6gdVapwdhry6oiwerpGKtxVbRa7zqJlR1AxOCQzYpAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMVTtgXaDJsyihNgn0G3LtEaDJNOurtJf74WqqYeOmU=;
 b=mr5ZGelBX8NXW1ad4WUx4EKY06TeY79mT2Q3qmPPuFZvNOMQSVs3jywcnkebTT4FvKt70KBLeW7Ih0aVY76EQZIoZiH4R++m9QofF/ml0T5npEIJdqcJRO7xVyhn9i/AJcnxMv1fujv0YopZ8sKJFKikHB9VcbiZ72Ij6Sh8nSuaUPQZhdeyc8q4dqXT3gTii3eTg7jY8nRS35RrD5fT5OAESJEAbEjfcSlJcUrvx6JRwETlwV0Lfy9fkP/BvD5jn5Yy2L8a9EP8olQP5zvisk+NvzTaHw2ErIjJaYcDjh01whKOcpbGn+TwhLUxine8+Q5S58ePUGbDF0vRvB9+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA3PR11MB9087.namprd11.prod.outlook.com (2603:10b6:208:57f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 08:21:49 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 08:21:49 +0000
Message-ID: <40af309f-7342-4c8b-bbbb-b981767d0d38@intel.com>
Date: Thu, 29 Jan 2026 09:21:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 10/10] tests/intel/xe_sriov_admin: Add SR-IOV
 admin sysfs scheduling attributes tests
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
 <20260128180819.1373376-11-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20260128180819.1373376-11-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0118.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::16) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA3PR11MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b104051-3d4b-4cf9-e0db-08de5f0f72c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7142099003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG0xcndVaklZbFZ0Qi9aa2REV1dXU2xyT25HU0xXak5PNFhPek1Mbkt4dktP?=
 =?utf-8?B?TUNxaXJCVlBnTythL05iWmxhRG56UTVGd1lZOTlLQ3dhazc5cGZQeTFCYVUx?=
 =?utf-8?B?WWp1aHhwdDBsdkNwd0hDZyt3cnhwVWJrSVRnMjNyZHpBaUEybmlTdjE1c21D?=
 =?utf-8?B?RkpJR2FBRDFhcm8wczdlbHBXYUZueVhPY2ZMMW9GWkVkMHVPYmQ4Q2htN0VU?=
 =?utf-8?B?WG43ZWRCb1ZpTGdmcGtzcG10RHZ5VVFNMm5EQjBWdGJsTHVkdGNQSnBUN3FW?=
 =?utf-8?B?eUkvL2dXZURaSGpRMVdmS2s0Lzhud2JpMExHaUVGMTd5M2lpVUEyNCs4dXAz?=
 =?utf-8?B?eWdyeDZ4U1laOHE1YUhXM1gwS1FmMThERUs0L09nUFZlcHpUakhVZWNhVFpC?=
 =?utf-8?B?MFQ2eGxkMDZoUWlJd1ZkcHJONmRzZzhEdXc0azZBUHBGaStVMHVqRUtwTUJm?=
 =?utf-8?B?c0R1Yk9SalJMYVkyUjFTS2FKeGMyZ3l6YXZBcFBwQ0d3UlYweFkvbTg0Ympj?=
 =?utf-8?B?c2lFeE9MSk1vRkhLVm9mUXY3emU3djdvcW1lWkNoM1RXUlZPVytSSFd6YlFD?=
 =?utf-8?B?cUlGdDJDYk1GZ3NTdjRXaDRYQ2JkcytBVVc4bWRlVVpPSEZhQzFnN2x2WGUr?=
 =?utf-8?B?UnJoSUxYRFpEQnI0ZG1mTm1rMmNrVEhTU2JsOStMdHVTVHVPVFJ6dG1rRUNx?=
 =?utf-8?B?TEdpa0t4MS93Rk81WjEzY1VSZURQeWU2b1N1cnYxUCt0NmJwZVFvYTBoOFVG?=
 =?utf-8?B?YjhIR2pSdnl6a2pMckkxckROUmdWYmRqQU5ZcW1OZHJiN1drK3RiSG1jRDBx?=
 =?utf-8?B?TVp4VFp6T2ZlL3EwdDJTaktsNXRNQ3ZpVHhNc0tXRjUvWlZ0Y0VaK3Y1QWZO?=
 =?utf-8?B?NkVxQjFPTVpsVlBZNVl3OGx5TTVzcUo0ZE11Y1pQUFpkb2pUUWp4NlhLWlRj?=
 =?utf-8?B?UFdBZG5EajN0TFE1SGxsWUYxZXZXWEdoZVJkL0NML2NKMGpQN2Z6VUFLU0Iy?=
 =?utf-8?B?Qi8vb05ib3V6TVp1amJrUXVPWnEvWS9sUlZzb1A0bFlzYUQ3Y2Y2SFhSVytR?=
 =?utf-8?B?SXhmNW45NlZjZFVUaHA2aE5QRFVzSTUwQ0NjbkVsQU9xRHRjOW10aGtLMW9D?=
 =?utf-8?B?bVNTVTBneXVncHNYZTQ4MXBHUXVYQ2p5WDNyTzE1QlRMcXkwRlpQSEVva1JH?=
 =?utf-8?B?UmNpWmtUbFlEaEswYm1YWmJicUwrN29jWEg4SWMrdmYrUVRtYWVlNGZEWmNl?=
 =?utf-8?B?K0dKU0RwRzhzbkhZUzhvUk9lQXV6SUcyYzBjZVFLNGZLVGNQVW56akt0RUNH?=
 =?utf-8?B?cHQzZUdGdXBIM2gvcnl2b3VFVFpsRDRGd1E4YnlqTVRrK3Y3UUhUVkUwMCtp?=
 =?utf-8?B?aHlmWkduWmtHdFFVOFFKNEVUamNGSm9KN2hUY3FLTFlIdm9JaW5pcXFYODk2?=
 =?utf-8?B?TE9FSy80VXFHRkNmOXlna3FsUHpLVG1FTHljeldnaVJMd083a00ySzd0eUR1?=
 =?utf-8?B?RU44ZGY0NHo2TGV6Y3NqMjNSYVFIOUdoRmVLZUxKakpmcmJpQW9HK084YXVV?=
 =?utf-8?B?T2wvYzJKbHJpNTk5blRQQTVCREkrVjZ4TjRFcTF2cWV6K1dKMVN3bFJOUjhx?=
 =?utf-8?B?by9QaXBERm5ESlJDV05JUnR1VDNqYTdBaElyMDN2TyszN3FTaDhLSnJ4YVZL?=
 =?utf-8?B?Rm1KNmcyd29RaHBhY01VRE4wTDBzOWRENy9WODhIcXZCYjJOcUQ3ZmIwU0tW?=
 =?utf-8?B?UlN3ODZiMDBYUFRGakcwNm9pWEFaWUhRditTekpIcXpLUnhrd2o2MEVSbDhS?=
 =?utf-8?B?TTM3YmI2WlRNQzZwMU1SbmhOTyswSGE4czJjbWQ1K3RpVlVubW9JU3N0SWV6?=
 =?utf-8?B?blJIRFVQVFczVGVWYWIzc21iRTArS04xQ0xwa2ZXQXdLM0srVzNMR0M0Q3hF?=
 =?utf-8?B?cXBMWXE1QmlhQ0dQejFOTEgvL2ZBekhEQktLVE9MZGxVc2dSZHZJMVNpTjlt?=
 =?utf-8?B?Vm5PaXFCcHI0MmhYRWwvdFdEaFVsaEpOb2dtN2JwUTFXTDYzbFNsYWl3Q2JO?=
 =?utf-8?B?bWxDTit6ZGpRV28ybUJyMlZlTy91c25oSWYybm9lKzZKY1lmWmRjcUdzdXlY?=
 =?utf-8?Q?vSzs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3hsRGhQWUE0WjBsQ3NDYjZqOWx1bDBrR1MxeUM1MG1WV09YZi96c01kQjQz?=
 =?utf-8?B?T0ttVEJiZ1VYaVVjNy9QZ0dtOHliRVk4UEZWTVNpMjFGL0dRd0ZubjFaZ3Vs?=
 =?utf-8?B?Rk45YzZNYnN3dkg2VFNwL25tUTFJUWMrS29qd3ozY0tXTUdIcWkralRJSEJq?=
 =?utf-8?B?elZoZGpjYit0bkdtZ0hjamY5RWhHYWJsa3VHZFNXZFBlajU5TTNMcDVsTlZE?=
 =?utf-8?B?dFYrbWlqcW5zaTN1MnEyOGcwanJFSjJsd05Kb1NhUzQwNktFNG1NTXlvdEhl?=
 =?utf-8?B?Qy90TWZpMCtTUExZa2dSUGVZK3pDNTk3MDVCTEJ0Y1RkWGlrMlZTMWpWTU5U?=
 =?utf-8?B?VTRiWEo1Q3BsWUtmNm9zRFV2WXNjanY2ZmN5SUdKODh1L3pmRDVhZ3pUd0Rr?=
 =?utf-8?B?c1hKNTE0c1FRdW1mZ1JhYXJtcHVPQlczYTRNaEFvdVp2VkJNT29oY3dnSzc5?=
 =?utf-8?B?WHIrc0pLaU9YSW4vWmx0aE1reXFDZmlIUzIrdTJDU2pBbGpuRXVqdFJWWk5l?=
 =?utf-8?B?Y2lJVHJYQVdGdFZ5eVdPNjBma1NnV2dtcEQxTld5eUpkK0dScHdJWDM4S2dT?=
 =?utf-8?B?akNuMlAzYjlRTXl2OW9Fa041SjhScHR6YVVKTWhYem5mMFh2dU8zTCt3bWNr?=
 =?utf-8?B?T2p0UzE4REI5MXpCT0laWjRuaVl2N0VWRXZ0bHNmV2Z2Q3N4b0pBYWtYWWky?=
 =?utf-8?B?UVl5RWpJVzhnTk9zYkUxc2xjek9CcG51Q1RscytaUUo1QTBFN0J0MVpiRkNU?=
 =?utf-8?B?SnRzQ1JwWEtTeC9QeFJHMU9IY2FMMTkvUGcxaFJBZXI2RFNWalN2TTdmWmsv?=
 =?utf-8?B?Y2F5QjBlaGFXME9GaDVzVS9nK0w5VmlHQWFFaC9HMC9LdTRjWTU1QWZISnFp?=
 =?utf-8?B?Z1M4SFdKeXMwTmQ4MkhmVmtJcXE3bDZkVlpJbnJoK24zVm1saE1DajI3dVFv?=
 =?utf-8?B?d0hnbjRZTitubWIrNlZqMTk1RWtzZk5kUWx5NksxSWNVNDBFamFPd0U1VTl6?=
 =?utf-8?B?U3NlQ3pzdkhKWlJMNi96SHc0akhtOXBjVVJDc25WM3Brd2tIRTZZLzlBZlFO?=
 =?utf-8?B?TEE0d2kyQjBJdjY2SG9PRVhaNHNHdmhIMFVqT0ZHRDVZbnh0c3NqcnV2Z3I4?=
 =?utf-8?B?WVFaS1JBaG1YRW4wS3lGTDBGUGpuVjFVR1FWRHdRekpBUjNOSWpjaDhtbmJQ?=
 =?utf-8?B?dzJzcGhwVFhEYWwxNEdKUHJMMUQxaUdCdUF2Qm5PeTVtL3dRMUpmSmpOaGl4?=
 =?utf-8?B?T0hNSUdkWmdhdnV1S3pMcVUxMlA3dk9WQTB4SWpjY1dJQXFhVVFQNit0RXNV?=
 =?utf-8?B?M3M4QzlIVmU0Q09oQ2hCUVNyUGtkYTUzM0xZZko0dmZqdExRMVltRWo0Q1M3?=
 =?utf-8?B?dnlqWmJxQkFBeTczYzJMVUwxTjdOM0xOaDJCU1lPTUNwTkU4c05FTU9kbWZ4?=
 =?utf-8?B?K1REb21LeXZRRGsweVI0ejJUa09HQXBkbTdQSHFna0VPZCtKQ2ZOakowblpU?=
 =?utf-8?B?L2FDSTFuenQ0V0xucSsxWDRXN3V0QjZURG5IWkFrdzU1Rlo5OE1pM1BzcW95?=
 =?utf-8?B?b3NhQVEyK2hjTnJrRmFneWpuVEYzcEJUVzdWdFRsNnQxUERkY0tNd3ZZbzlT?=
 =?utf-8?B?bElveGhCeEtiVUp4VHpKOFJFR2tMVXJUdkZFcHRWS0Rla0tqMHg0cWp0ZUVt?=
 =?utf-8?B?MndLZisxNnZzZVNRdVZIaFZ1NzdSM2I3WFI3QlJyeWNzSW43K251Y2NhN3c4?=
 =?utf-8?B?dUs3N2k4MUE4Smh1eTBSc0pJb20xSWhwTUVGblJncU01NHhoTHExZ1hMa1RP?=
 =?utf-8?B?TFkrTE5aTUNBVWl0U2Z2eHhwQ3hIZmZaTjNiRFdOclN5MGJiZDc0Nm1lR1M0?=
 =?utf-8?B?Z1drV25yRFZRZG9UbUJxUGl0SVpWYWM1ZUM3MHp0VHk2c1AxeGpRaTBLckh4?=
 =?utf-8?B?MS82cHdJL3B4YWJnd01QMkJ6ZUpodU53QldqTmVKUG8rUkREQUpTdUJvSmtE?=
 =?utf-8?B?dUE5RkF6RTIxV2k1bGpsSEExOUZ3STJ0VGRES1c1ZXEyRGJNcGM2OVlINlFR?=
 =?utf-8?B?dkZialEyL0dKbWxJNW03VlNMaTdBNzJMR1RzM0FyY2k4UTJ0ZUFuSzk2VmVi?=
 =?utf-8?B?eGlnZXkwZnN1WmRqS2FnZEhKR0tNTm9xQytHNVBWMDhueGhhZExETVMzSTNS?=
 =?utf-8?B?K1RCMzdlclFXY1YvZXZOZC90OVB0RzRHNmhNTEFiN3dOVlp1YVZ6NVlwZUxF?=
 =?utf-8?B?bWR1K1ozc0R2RFA2cjRmN2szYVJSZ2lNVUh6RDNxSlhyOTNzWnVtUElrRG1z?=
 =?utf-8?B?aFh4ZDBnM0hLU0ZkeXI2dVpvb2lyQzlaTGU0S0RCOCs1OFJVMGZ4Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b104051-3d4b-4cf9-e0db-08de5f0f72c4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:21:49.0353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gw/drg+V0qlrtgp+NEuFM26Dp8Y+sXlm1FkHljmgrxsZ5ULsWv7wxxqwFi344TUlwxiFczG6ZlXQTXco4zs7jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9087
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


On 1/28/2026 19:08, Marcin Bernatowicz wrote:
> Add tests that exercise SR-IOV admin sysfs attributes for PF/VF functions
> with VFs disabled, covering default values, write -> readback behavior, and
> bulk updates for exec_quantum_ms, preempt_timeout_us, and sched_priority.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> ---
> v2:
> - Align igt_main()/igt_fixture() usage with upstream changes.
> - Correct date
> - Replace id with vf_id
> - Iterate all VF sched_priority tokens and verify denied
>    writes don’t change selection. (Lukasz)
> - Rename xe_sriov_admin_profile to xe_sriov_admin (Lukasz)
> - Adjust test for xe_sriov_sched_priority_mask_to_string() returning
>    error code.
> - Adjust to renamed __xe_sriov_admin_* helpers
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   tests/intel/xe_sriov_admin.c | 434 +++++++++++++++++++++++++++++++++++
>   tests/meson.build            |   1 +
>   2 files changed, 435 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_admin.c
>
> diff --git a/tests/intel/xe_sriov_admin.c b/tests/intel/xe_sriov_admin.c
> new file mode 100644
> index 000000000..5c7f5d621
> --- /dev/null
> +++ b/tests/intel/xe_sriov_admin.c
> @@ -0,0 +1,434 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
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
> +		igt_assert_eq(0, xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_num));
> +	}
> +
> +	igt_dynamic_f("%s-default-preempt-timeout", igt_sriov_func_str(vf_num)) {
> +		igt_assert_eq(0, xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_num));
> +	}
> +
> +	igt_dynamic_f("%s-default-sched-priority", igt_sriov_func_str(vf_num)) {
> +		enum xe_sriov_sched_priority prio;
> +		unsigned int prio_mask;
> +		char mask_str[64];
> +		int ret;
> +
> +		prio = xe_sriov_admin_get_sched_priority(pf_fd, vf_num, &prio_mask);
> +		ret = xe_sriov_sched_priority_mask_to_string(mask_str, sizeof(mask_str),
> +							     prio_mask, prio);
> +		igt_debug("sched_priority: ret=%d mask=0x%x selected_idx=%d str='%s'\n",
> +			  ret, prio_mask, prio, mask_str);
> +		igt_assert_eq(ret, 0);
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
> +	igt_require(xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_num) == 0);
> +
> +	xe_sriov_admin_set_exec_quantum_ms(pf_fd, vf_num, eq_ms);
> +
> +	ret_read = __xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_num, &read_val);
> +
> +	ret_restore = __xe_sriov_admin_set_exec_quantum_ms(pf_fd, vf_num, 0);
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
> +	igt_require(xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_num) == 0);
> +
> +	xe_sriov_admin_set_preempt_timeout_us(pf_fd, vf_num, pt_us);
> +
> +	ret_read = __xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_num, &read_val);
> +
> +	ret_restore = __xe_sriov_admin_set_preempt_timeout_us(pf_fd, vf_num, 0);
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
> +	ret = __xe_sriov_admin_get_sched_priority_choice(pf_fd, vf_num, &prio);
> +	igt_assert_eq(ret, 0);
> +
> +	for (size_t n = prio.num_tokens; n-- > 0; ) {
> +		igt_warn_on_f(xe_sriov_sched_priority_from_string(prio.tokens[n],
> +								  &prio_enum),
> +			      "Unrecognized sched_priority value '%s'\n",
> +			      prio.tokens[n]);
> +		igt_debug("Setting priority string '%s'\n", prio.tokens[n]);
> +		ret = __xe_sriov_admin_set_sched_priority_string(pf_fd, vf_num,
> +								 prio.tokens[n]);
> +
> +		/* Not settable on VF */
> +		if (igt_debug_on(vf_num && (ret == -EPERM || ret == -EACCES)))
> +			break;
> +
> +		igt_assert_eq(ret, 0);
> +		ret = __xe_sriov_admin_get_sched_priority_choice(pf_fd, vf_num, &now);
> +		igt_assert_f(!strcmp(now.tokens[now.selected], prio.tokens[n]),
> +			     "'%s' != '%s'", now.tokens[now.selected],
> +			     prio.tokens[n]);
> +		igt_assert_eq(now.selected, n);
> +	}
> +	__xe_sriov_admin_set_sched_priority_string(pf_fd, vf_num,
> +						   prio.tokens[prio.selected]);
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
> +	unsigned int vf_id;
> +	int fails = 0;
> +
> +	xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, eq_ms);
> +
> +	for (vf_id = 0; vf_id <= total_vfs; ++vf_id) {
> +		int ret = __xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_id,
> +							       &read_val);
> +
> +		if (ret) {
> +			igt_debug("%s: failed to read exec_quantum_ms, ret=%d\n",
> +				  igt_sriov_func_str(vf_id), ret);
> +			fails++;
> +			continue;
> +		}
> +
> +		if (read_val != eq_ms) {
> +			igt_debug("%s: exec_quantum_ms=%u, expected=%u\n",
> +				  igt_sriov_func_str(vf_id), read_val, eq_ms);
> +			fails++;
> +		}
> +	}
> +
> +	xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, 0);
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
> +	xe_sriov_admin_bulk_set_preempt_timeout_us(pf_fd, pt_us);
> +
> +	for (id = 0; id <= total_vfs; ++id) {
> +		int ret = __xe_sriov_admin_get_preempt_timeout_us(pf_fd, id,
> +								  &read_val);
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
> +	xe_sriov_admin_bulk_set_preempt_timeout_us(pf_fd, 0);
> +	igt_fail_on(fails);
> +}
> +
> +static void build_common_sched_priority_choice(int pf_fd, int num_vfs,
> +					       struct igt_sysfs_choice *common)
> +{
> +	int ret;
> +
> +	/* Start from PF */
> +	ret = __xe_sriov_admin_get_sched_priority_choice(pf_fd, 0, common);
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
> +		ret = __xe_sriov_admin_get_sched_priority_choice(pf_fd, vf, &prio);
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
> +	xe_sriov_admin_bulk_set_sched_priority_string(pf_fd, prio_str);
> +
> +	for (id = 0; id <= total_vfs; ++id) {
> +		int ret = __xe_sriov_admin_get_sched_priority_choice(pf_fd, id,
> +								     &read_val);
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
> +	const char *baseline;
> +	int baseline_selected;
> +	bool attempted = false;
> +	int ret;
> +
> +	igt_require(vf_num > 0);
> +
> +	ret = __xe_sriov_admin_get_sched_priority_choice(pf_fd, vf_num, &before);
> +	igt_require(ret == 0);
> +	igt_require(before.num_tokens > 0);
> +	igt_require(before.selected >= 0);
> +
> +	baseline_selected = before.selected;
> +	baseline = igt_sysfs_choice_selected(&before);
> +	igt_require(baseline);
> +
> +	for (size_t i = 0; i < before.num_tokens; i++) {
> +		if (before.num_tokens > 1 && (int)i == baseline_selected)
> +			continue;
> +
> +		new_token = before.tokens[i];
> +		attempted = true;
> +
> +		ret = __xe_sriov_admin_set_sched_priority_string(pf_fd, vf_num,
> +								 new_token);
> +		igt_assert_f(ret == -EPERM || ret == -EACCES,
> +			     "Expected -EPERM/-EACCES when writing VF sched_priority "
> +			     "(token='%s'), got %d\n", new_token, ret);
> +
> +		ret = __xe_sriov_admin_get_sched_priority_choice(pf_fd, vf_num,
> +								 &after);
> +		igt_assert_eq(ret, 0);
> +
> +		igt_assert_eq(after.selected, baseline_selected);
> +		igt_assert(!strcmp(baseline, igt_sysfs_choice_selected(&after)));
> +	}
> +
> +	igt_assert(attempted);
> +}
> +
> +int igt_main()
> +{
> +	unsigned int total_vfs;
> +	int pf_fd;
> +
> +	igt_fixture() {
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
> +	igt_subtest_group() {
> +		struct igt_sysfs_choice prio = {};
> +
> +		igt_fixture() {
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
> +	igt_fixture() {
> +		int ret;
> +
> +		ret = __xe_sriov_admin_bulk_restore_defaults(pf_fd);
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> +			       "Failed to disable VF(s)");
> +		igt_abort_on_f(ret, "Failed to restore default profile values\n");
> +		drm_close_driver(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 0ad728b87..ef4edaa0d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -331,6 +331,7 @@ intel_xe_progs = [
>   	'xe_vm',
>   	'xe_waitfence',
>   	'xe_spin_batch',
> +	'xe_sriov_admin',
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',

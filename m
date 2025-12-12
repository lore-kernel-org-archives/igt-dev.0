Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46556D59D77
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 15:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87D210E8E6;
	Fri, 12 Dec 2025 15:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0Az9amJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C082310E8E6
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765554997; x=1797090997;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/wPMRAptmeZUoBlJMAmSKbf/gFGjivBiRFaYtAxv5Lg=;
 b=I0Az9amJ3xRlTmmdsJlZ98gxbYX9MsA2bY52vjJaj8fb9spfHdpMD9zA
 Mzg7lP6nLRRgW0vdBBhxqopdXqZOcYRNljO9sIrM+WeJb6BdZROdLby4S
 nDwd9+m5F43yw6gjkjdr+wOJGUodFPif0n5Jzq3aZVGFW73VEo6YogGMW
 IMrfShwDulGuuHGIsK5INt6bpTPkytRzyLs1qmD+LrFjPxXjWdYS04qC4
 1Hksf84NbmLjzNfnq7RJoyo5la2O0/FY5E2Xczme37WotZqMworp7YyTn
 M0pO9BVGucg/dftvtGrvHKOPMngFAa43W4cKS9hrLfS5YMHUKOuH7+TTU g==;
X-CSE-ConnectionGUID: GYqXc06rSqOcGk80+l/Ifg==
X-CSE-MsgGUID: 8MQEFu1bTremVkQ9tZLukg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71185129"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71185129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:56:37 -0800
X-CSE-ConnectionGUID: c4n4yom3To6ND7Ye+xgELA==
X-CSE-MsgGUID: 166ojSGLThSBkZYspOW0rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="220493742"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:56:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 07:56:36 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 07:56:36 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 07:56:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HO7Vaf8nX1G0iALhHAlQbx0Z1YGdEifFnHQ5q4Y6mn+MW9YUCIASXfVHnDUUlnYwTUclX7hXAo03rfCECHA6ARsd0wKhO5bEmL2hTaZvcFHcvx/qIhWtHxMQ5vC7UqKPfMvAv7mTwmzDvoOGmg2YeEVP97ywuDwCZzLW2YcYeDheYXhIHER79aQ1ms9j2oMbkiIRiJV0E4hrbw0llPLwVBakxjtQNV0iT/LZQp/hLt6SbrUc2jWrcj58sBGx4VdbL9364QVzaIuYcwG6J0isAP27yfbroKaU9QBGBqAMHwhCLiTg9k3LV7TEejHhLEjkytgl7yRDIMN9vi4PWLc59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5kdc0Ch+W1xcxVm4OXROQt1BlKHaFhTUcmmaZ/kqAs=;
 b=UPI0PQlT6d9hsX1572z46txnjxQU/zO6Vq12leJW0LTtpVuRegRg8+zsAd0aN47BOAebnRxBBHLu2OpTvBp1w2F9zVvXiK/+7POyOtN5/NijR/W0JYXcBf8HMHAWUrVBiZF0wchJmqjE35mGC61nGNm3oPYAj2i60XXYHfQVxCl41a5/gZX3f75bAwkwV06wonaWLvFRz9wqdk9UFXciRkpiJM0TtFGMr1xanrFQwh915pMoHgpTb45EEpf3D5mCFbmVBHGv3U9PS98eWHTc1jZwaNmxg6agOgQ81jhQLZEoZGnBj2mP51l3UU6pWk7Ph5V38TVn3wlSf8r/a99TOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 15:56:31 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:56:31 +0000
Message-ID: <bfaf0706-f710-4a45-99df-d2de8f203d3a@intel.com>
Date: Fri, 12 Dec 2025 21:26:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versionsth
To: <igt-dev@lists.freedesktop.org>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-3-x.wang@intel.com>
 <20251107194739.s2yrsh2xt7greq3q@kamilkon-DESK.igk.intel.com>
 <SA3PR11MB80466F35AA1F6AA60C0CCDBE86D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <SA3PR11MB80466F35AA1F6AA60C0CCDBE86D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::16) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: 863bd11b-89a6-4803-1850-08de39970459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWNzU0x4bnZNTG1ORFJPUDdQZTdHM0VTdFZMaHlhb0puWmJudUJacTI4Njdy?=
 =?utf-8?B?cXY5S0pMY2lBU2lnYm5CQzNlaWlPQnp0V3lTR3NiL2w2OSt1VlFELzZYT0t4?=
 =?utf-8?B?YkZ5MDJJd2w0MGJxK2RXYXpaa082TUluVFdzbzl3SHN3RkgzWDhycEVJODNC?=
 =?utf-8?B?SzFsTmw3cjhaVzRHSUxwN2RzVm8vZlVxdzk1NnVMdmtuRzlkeEk2K2gySTEw?=
 =?utf-8?B?bkVqdUY3MkpiQmlpaG1Pb1VDd0xQWW03b3BFenUzckZ1azlyTmVteW9JWDNp?=
 =?utf-8?B?VW5MZzYzMnZEdStla29uSklhaTY3Y1A1bUJudkpERFhZTWUwRVBTd3dJZk9L?=
 =?utf-8?B?Z2p4SDRRZkYwNzlhNE1UWVg0bVpTOEliWFpMY3ppbEFKNGxoKzRpZ2lOYlRX?=
 =?utf-8?B?bUZmbGdoRm44WkJzOEdDSXNlV0EzUFZTTExyQzVxdXRyanFoOFlaMVdYVVBQ?=
 =?utf-8?B?K295cVFHNFNjYmRoZi8wQjJVV1Q5ZkkrNlpQTmZhMjU1aFlHVFR0OXhQUTNz?=
 =?utf-8?B?K3FNNHF0dk9nV1oySUQweUtCeE1GeklMVGlZempaMXp5VXZDK3dTM2l3TGI5?=
 =?utf-8?B?WDF0cFdYUXZyQzRJN1F1OXlvSDZYMCtWM1ZoTjJzdDZMZnk0OERtV1J0TDZp?=
 =?utf-8?B?VUJzdng4Wm9EQkFwTWNGWEVicHFQaHdSMXliVVMwc3dIOUI3ZTNRanhZclRS?=
 =?utf-8?B?Ri91WnpSQmxCOFVENTdYaFpraDJTcVltNkw3RTBKUnRjdTJXVzZiRnFRa1hB?=
 =?utf-8?B?UHdETlNnYWlwdG9jc0dZVnhUU3JOTk9lWmhQVkptanVhcmJMZndiaVI2bnY1?=
 =?utf-8?B?UThjZXYvZVlUSHdYeXdRQmR2ZkNoNzBZTmlYMHlJNXhYY0tLeUQyejJ6dm9j?=
 =?utf-8?B?aGZUVU5vdDl0M1Z6QStVMG1OSTI5d3lnUmMwT0ZyWW5TdlpLREhja3U4djhG?=
 =?utf-8?B?RWtXRVBYcW9TL1pTU3ZGeGhxSjVJNnpUSFhnWVA5allocFdCeExtVjdMSTkw?=
 =?utf-8?B?a3FEWVI5d2xHS1N6WHdOQU55cG51UE0yK3JnZ01XeWUrZDdwdEZ6eHk0OEJB?=
 =?utf-8?B?NThlSnh5dTcvQThacms4VHVGbW43VDRLN2dnOVE2YXNtekwzNUlyckYxSmY4?=
 =?utf-8?B?STF4KzFvN3pDSERZQXJacXlOWkhhanlnT0ZYVGNlZmt5VnM3dkU4YldHbkdI?=
 =?utf-8?B?cnhKTUdVRjRKemkxcmhIOVZpTHRUUW9zWTV0YklnaXllQVdDUXVmclhYTzRR?=
 =?utf-8?B?Z0w4VzA4Y3ZIV084WjlXUmtlc1hYMVNqeE53VFBjZVRWbFBDSnkrOTQyMjdN?=
 =?utf-8?B?RHlBMXYveExxdHdEeTg0NkVHVGV2ZGVhL1JkRlROVmNWbmpjdk4vcXRCUkxX?=
 =?utf-8?B?bFRjVjNCN3I2R0FJaXFOdnE2bzdhOXJHK3Y1WFdGdnFnNHppblBLRG5wZDlL?=
 =?utf-8?B?ZlkvYkgwZzN2bklpcWg0Ym1BamFjUnJja29kTGNlakFoSWNlYkwzQVFVOVBw?=
 =?utf-8?B?eVVvZEZEbmFtNXc1NkpJQS9MSTdQb3dFM1c3cEtlQSs2ekRtYjhYT0tqUHo2?=
 =?utf-8?B?QTFCNHFlTk1wUCtxTFJaRFdKeWZpN1crMGROMXRtOWxoR3d1YkhNSWp6WlJr?=
 =?utf-8?B?UjIzVUhKZGRVY0d6UnZFZ0dFdFdmWWYwVGtBZG1qM3hjWmFzMFlQUmFsNHYr?=
 =?utf-8?B?NUcwTTZLWXdXNGVveTZRZTZ1bW9SdGVJRDVFWllmYXhtUjAydGhUZjROYmlG?=
 =?utf-8?B?dG1iZ2JJZU8rZjZWVWdRK05IVlZ6MDBZbE5OSFpMbjl0QkNwMTRGYUlDeGcw?=
 =?utf-8?B?bklVSlZwcHd6akpZZytmL2dFT0tMc2p2Y2tud3d2LzRRR1YrMWZlTTNQVXpZ?=
 =?utf-8?B?S2lOM0pKMitVWW0zY2tjd0RqUnk3akpqajl4aFMwQVd2dHdZVWQ3aTUrOHBO?=
 =?utf-8?Q?OWc8tOy616MheSDjOLE9ahk+Sz7GClLy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlFkL2krQUNWWWN1MzFvMUliM3NpdkxuV1ZsT0RHNVpGZmE3Q3ZQQ29yd2s2?=
 =?utf-8?B?VGJCLzQwNlpiUUdVNVh2VmYxNFlDdGxpVEdBUmk1NnpJTGRFRmpUNkx6UGUr?=
 =?utf-8?B?L0pPVG14UGlCNjB2WlMrcXVoanU2SDJpVVJ4WlI1RG1VcExRTU1pTG5YeTIr?=
 =?utf-8?B?T0d0SXArNENQc1Q4L0ViL1B3WExQM2lscnR5b2M4VjhXZUJnSmZqWEJnSHk1?=
 =?utf-8?B?L0VacWJwMUMyOTVXYWh0cHBnQVhvL05IL0t4MEtMRGRySEs1U3pLTVQ0b24v?=
 =?utf-8?B?Qzlsd0FtdVF0WElIa3l3Y0tEdUxERDB5VDFWMGVSN05ZSVkwQm5mWlI2Vjd5?=
 =?utf-8?B?VWZ1OEdBRVoyWEJuN0hxenhORW9HWkhTTHoxdEFUWTF0YmhyeGNiVjRoMWxp?=
 =?utf-8?B?T0ZhVzY2YkdkeWRON1Y0dHRCdExZamxnbnlQNDlENTVOb1Boa2VpbnFvRlZX?=
 =?utf-8?B?TEE2YmNCRWVmeDhsQjNwd0kwMVJtQ0JQbVZkNmlLMFBpc3RkaEZFTDZWcEtq?=
 =?utf-8?B?OFA0NGZieTNpbEpHcm1VSFlYY0NNQnluMUM1WTJEYUNYWkRsU2FPMTFyZkhF?=
 =?utf-8?B?bUNJb3YzQlFmZDVURGFYU3BSNGhHS0hVa1pVdmJGVXA0eVZLSGIyWVJqRmo4?=
 =?utf-8?B?TTNuZDhvdmR2MjNhYkZ0RjJoUkVUVEV2YmVXNVRIYU9ZdXdXbUU3azVDZnE2?=
 =?utf-8?B?bWlDM0JYTDUyWnlNSGxGVjlnYk50SVNSTFMyM1ZSbWxjQXR3akJLRFRERzZh?=
 =?utf-8?B?ZngybW0vYVc2cm1URzFuMHBXb2NvSE1NUU1JcGdXdUFMSHNvZk5DMTAySmh5?=
 =?utf-8?B?KzNDMm1majN5TWRtbmZuM0VDSHRTN3E2VDluWmx0NXJPdWRxZ2JtalNWNGhD?=
 =?utf-8?B?UlJta2tWbVdPZzMvWjdPSHlycy82RzNWNWFIK1FxcTlQYlVaVTltbndyQlEz?=
 =?utf-8?B?dW5lZEFCVEZzd0YwZHBRdFpMU2tONkxWUlFlQys4UmtOT0hmWFlrZlgrWDJm?=
 =?utf-8?B?c2haQ2UzMGxWTVFwTmJud3ZSTGFEN1lKS1ZwRjM4TnBMUTlMYyt6dXpiSjJP?=
 =?utf-8?B?WEVESTYyT2VGWHpxRVBNOXlzVFk1Tjh0RUdmWFBqWlNBVmFQZkxiOC92cnM5?=
 =?utf-8?B?Syt2a083eXZQTTd1bEVEVkE3bm9iQjVyelVteGQvZWhCMHpjMEhTT1B0NXdm?=
 =?utf-8?B?SHk1YmJyM2thVUVoNXFTamRxK3VRTFpVUGQ0ODNPQUZwK3Q5N2ZDMW5nd0x2?=
 =?utf-8?B?djNQMzV4aXZpbHl2UkpKalBQMmVEWEVQMzJFU3RoYnZvQ2N2K3RQOHNmQUdj?=
 =?utf-8?B?SW42MmMxT1kzOU1GRW0zNTJLOEV4dWJXdThoYm1qVWdrUDNOL2I5elBISTFi?=
 =?utf-8?B?OCt4QzFtZnN2c3ZOMERZdzVFN2RxQlZNSmovSjRIeVNzY2JQMkdvTHFNKzRs?=
 =?utf-8?B?UlM4cVp4WDVTZ25udERDQkpydG43amNQdG5SOHZuc3UvbVBRdXBIVHFLZ2lm?=
 =?utf-8?B?M05KRnhUZmxaaFU2N3ZZdWV6Q1dIbTNJWnIvcnhpRi9FcWpsdDIwY2RHK0da?=
 =?utf-8?B?ZmdJWEVYSDFwYzVGeGd6Ty9pcUl1VFI0M1h4WUFSRkNNOWJyQlBicytNK2JX?=
 =?utf-8?B?UHpZeHF3SHd6QmIzNVY1Tm05bGlpaThwT0MwYWI5a0sxL0N1SnFkZ1IwYXgy?=
 =?utf-8?B?ckpOb0RzcUsyY3VtMHU2T3lYcXR1Q2xrbzBZWUIrV3QrbGZBQmJiaFQwWFdk?=
 =?utf-8?B?ZXdPTnA4SENpMzBCK3diQTJsaXltRmkwZFJvUVlsS2tQeS9FcEt2M3h5a2pN?=
 =?utf-8?B?bXAybm5rTUxvNWZDc2JWM2Fla0pZNUtUZnlycHZCTHhWNmdYakMvYkNWenVB?=
 =?utf-8?B?SXhlbERwVmJkUEtOV1BHZDBYLzZXeDdvRGtySm9JUU1OQUk1YjlkNW5IYnJ6?=
 =?utf-8?B?YVFHSmhUR2pNeHJJR0tLYmRvS3NrNitscXVMT1NVSzZxQnBzUTIyY1NEc0Rx?=
 =?utf-8?B?cU1sMDFDRnZkT0R1aEJuM3RkcVl3OVU3ZGZCN1UwSmo2YWVJbUNteWlDVkl6?=
 =?utf-8?B?akNWL3hUWDQ2b2hIT21vSzduYklFQkZDekEvSUEyRGZ3dDNTNVBMdVgrVVdI?=
 =?utf-8?B?TEJYQVdwOTR1ZmVvNnhiTFlaQ3lHMHErY0QvSmVoTXNqRERvNTRKY2pVMCt6?=
 =?utf-8?Q?X/96DlvJCWLlHUJ4clGAvkA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 863bd11b-89a6-4803-1850-08de39970459
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:56:31.5240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaZjoH15CtdXczJ8ALwNGxWPBBoLUhFRNeMHfIql18Vi9S7oZpAZfKm97ctKok243jSqMCaE36m/gLQpJ0ixcNoIcoGELHAhYPUhxqekiow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
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



On 11/18/2025 11:41 AM, Wang, X wrote:
>
>> -----Original Message-----
>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Sent: Friday, November 7, 2025 11:48
>> To: Wang, X <x.wang@intel.com>
>> Cc: igt-dev@lists.freedesktop.org; Summers, Stuart
>> <stuart.summers@intel.com>
>> Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
>> graphics versions
>>
>> Hi Xin,
>> On 2025-10-20 at 23:12:53 +0000, Xin Wang wrote:
>>> For platforms with graphics_ver >= 20, query the runtime xe device ver
>>> instead of relying solely on hardcoded values from the PCI device table.
>>> This enables accurate IP minor version (graphics_rel) detection for
>>> platforms like Xe2 where different steppings have different IP versions.
>>>
>>> Implementation details:
>>> - Use weak symbol linkage for xe_ipver_cache_lookup() to handle static
>>>    library compilation (libigt_chipset.a, libigt_device_scan.a) without
>>>    xe_query.c dependencies which are used for i915 tools (i915_perf and
>>>    intel_gpu_top)
>>> - Provide a weak stub that returns NULL when xe_query is not linked
>>> - For Gen20+ platforms, prefer runtime xe device versions over static
>>> data
>>> - Fall back to PCI table if xe device info is unavailable
>>> - Reset cache on query failure to allow retry
>>>
>>> Remove hardcoded graphics_rel from static table entries for xe devices
>>> as they will be populated at runtime from GMD_ID.
>>>
>>> This unifies device info handling between i915 and xe drivers, enabling:
>>> - Platform-specific workarounds based on accurate IP versions
>>> - Consistent device info API across both drivers
>> +Cc: "Stuart Summers" <stuart.summers@intel.com>
>>> Signed-off-by: Xin Wang <x.wang@intel.com>
>>> ---
>>>   lib/intel_device_info.c | 26 +++++++++++++++++++++++---
>>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c index
>>> a853f9ab4..87b1069be 100644
>>> --- a/lib/intel_device_info.c
>>> +++ b/lib/intel_device_info.c
>>> @@ -3,6 +3,16 @@
>>>   #include "i915_pciids_local.h"
>>>
>>>   #include <strings.h> /* ffs() */
>>> +#include <stddef.h>
>>> +#include <string.h>
>>> +
>>> +/* Weak symbol stub - will be overridden if xe_query.c is linked */
>>> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
>>> +__attribute__((weak));
>>> +
>>> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid) {
>>> +	return NULL;
>>> +}
>>>
>> This seems wrong, you cannot cache by devid, either you already have it or
> Why can't cache the ipver with the devid ??  We are not expecting to read the register every time, so we must cache the value somewhere.
>> not. Also devid depends on register(s) reading and you can access that only
>> when you have fd already opened.
>>
>
>>>   static const struct intel_device_info intel_generic_info = {
>>>   	.graphics_ver = 0,
>>> @@ -505,7 +515,6 @@ static const struct intel_device_info
>>> intel_pontevecchio_info = {
>>>
>>>   static const struct intel_device_info intel_lunarlake_info = {
>>>   	.graphics_ver = 20,
>>> -	.graphics_rel = 4,
> In fact the purpose of the patch is to fix the .graphics_rel error on some devices. And we already have the correct value so we can safely remove it.
> I keep the  .graphics_ver here is for some of the tools may need to check the graphics ver without opening the xe devices. For this kind of use case
> the tool is not interested in the .graphics_rel.
>
>> This also seems wrong, please keep old values for compatibility, here and
>> below.
>>
>> Regards,
>> Kamil
>>
>>>   	.display_ver = 20,
>>>   	.has_4tile = true,
>>>   	.has_flatccs = true,
>>> @@ -517,7 +526,6 @@ static const struct intel_device_info
>>> intel_lunarlake_info = {
>>>
>>>   static const struct intel_device_info intel_battlemage_info = {
>>>   	.graphics_ver = 20,
>>> -	.graphics_rel = 1,
>>>   	.display_ver = 14,
>>>   	.has_4tile = true,
>>>   	.has_flatccs = true,
>>> @@ -529,7 +537,6 @@ static const struct intel_device_info
>>> intel_battlemage_info = {
>>>
>>>   static const struct intel_device_info intel_pantherlake_info = {
>>>   	.graphics_ver = 30,
>>> -	.graphics_rel = 0,
>>>   	.display_ver = 30,
>>>   	.has_4tile = true,
>>>   	.has_flatccs = true,
>>> @@ -675,6 +682,8 @@ const struct intel_device_info
>>> *intel_get_device_info(uint16_t devid)  {
>>>   	static __thread const struct intel_device_info *cache =
>> &intel_generic_info;
>>>   	static __thread uint16_t cached_devid;
>>> +	static __thread struct intel_device_info xe_dev_info;
>>> +	struct xe_device_ipver *ipver;
>>>   	int i;
>>>
>>>   	if (cached_devid == devid)
>>> @@ -689,6 +698,17 @@ const struct intel_device_info
>> *intel_get_device_info(uint16_t devid)
>>>   	cached_devid = devid;
>>>   	cache = (void *)intel_device_match[i].match_data;
>>>
>>> +	if (cache->graphics_ver >= 20) {
> xe_device_get(fd) (in xe_query.c) records the tuple (graphics_ver, graphics_rel, devid) into xe_ipver.map once it has fetched DRM_XE_QUERY_GT_LIST/CONFIG. The key is the PCI devid, the value is the IP version we just read from GMD_ID.
> Every Xe use‑case calls xe_device_get(fd) when opening the device: the common drm_open_driver{,_another}() path already does this automatically (see lib/drmtest.c
>
>
>>> +		ipver = xe_ipver_cache_lookup(devid);
> xe_ipver_cache_lookup() is only a map lookup. If a given build(i915 only tools and tests) doesn’t link in xe_query.c, the weak stub returns NULL and intel_get_device_info() will not go to the if (cache->graphics_ver >= 20) { ...} part in the intel_get_device_info() function so we still make the code compatible with i915 devices.
>
>>> +		if (ipver && ipver->devid == devid) {
>>> +			memcpy(&xe_dev_info, cache, sizeof(struct
>> intel_device_info));
>>> +			xe_dev_info.graphics_ver = ipver->graphics_ver;
>>> +			xe_dev_info.graphics_rel = ipver->graphics_rel;
>>> +			cache = &xe_dev_info;
cache variable is a constant type we cannot update it, did the code 
compiled without error.

Regards,
Ravi Kumar V

>>> +		} else {
>>> +			cached_devid = 0;
> This function will be called before the drm_open_driver() so we should remove the cache here.
> codename_intel()  is calling intel_get_device_info() at very early time in igt_device_scan.c
>>> +		}
>>> +	}
>>>   out:
>>>   	return cache;
>>>   }
>>> --
>>> 2.43.0
>>>


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0119C87FD1
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 12:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6412910E668;
	Tue,  5 Aug 2025 12:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDTXsADL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E119C10E668
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754396832; x=1785932832;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M7tJHFBlmd6+05vHuDs8ytk+njBcPk5i6wLHm+wIvfg=;
 b=MDTXsADLZxAzuYXsksxTWkOV9aUKmkEnC/aEtJ33sCZISEB4/rcDbZzv
 CnjVA1kXAAD5Pf75aVzF7wzir2PI5n/LgweE4XQ9PVYjHZC2flliWMNSI
 KXaXDkyjrJj+F4UdjHXGHXAWKFzTao5P3DQVY1xJ1vAlIFHnk18aqVEHr
 VHCOe1ACea8mpX61AvA8HrQ8jBOYKtQ+fXg5O5Ej4aJNVcV1eopwza850
 qvSasEDGssnebO6487N4eK4cB9zF5vLP2FAwyt3v7DBGK1qVAJmaDYQ0Y
 iLSAc/dypVJaCVcwVNabDFBApYOuq4L7p0hCMQBcmqO8PXIq+JFOeWxvr Q==;
X-CSE-ConnectionGUID: Tdvwfc6pRTiSRszqlLgLOA==
X-CSE-MsgGUID: lWWUZVZwRUiCFlF1cN1mWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="44280929"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="44280929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 05:27:11 -0700
X-CSE-ConnectionGUID: v8igCQMZTb2/UrNs3yh0BQ==
X-CSE-MsgGUID: oydJpqclTQOipiS3E5EHDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201672817"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 05:27:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 05:27:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 05:27:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.48)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 05:27:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUxfaGEhD0JqBg8GWmnLDxY/apOHSkYFj8c9E2dLV/a5ABpCm080vnRraau+9aeZL2zbv8XmM6cepO3vfOTDdiwXDE+FQqQE4Z1c9L+wh5s4edm4Py/OaSKHoIKuGCrcV8M7FkRfVnp+fsX/FzYWJMrpb19FkIJuHcpcJ5xhgqJP+1QAcHy/XXvvCTdhWyUNOieTs4hwetNTC4zEcmP2pTnamD8RBOISVoAGDSIvjYp+EhGxcii5+UnGUNAihYZ6Bc7Y+9+wu9A/V7Nly1otfsC86m+hbvgWZmp1D2RFsf5A6aPFXK8ak4BEtZAF6CGmVuOQUEiCBWPZiGMdwymDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CceT5Myt0NhmdBUvdFhRowZ/EfsmiCgHSFfKGZd7m4g=;
 b=Xul/oGjisbxfRoV2eV/zXpnImDRQj72moLCgqWzo+TDN07AOOWr54qH0kuxyLBL1tcLhXieoMuV7kGc/7um+rlZ7eazgAWrOc0A2o87KDqp0P76/SInw2Vm9c99fnvAO66jKpmfsmUD1Z7VtfytWO6DsV2YFQIzTRlS4yMivSG7GmqSxHwGCTpPj+Lgd+19gzRxFogzalr0Z/k3jQaR50roe1ZmPFlDV0JuuPLLC1TjRSQc8+vAdikTrNGm+Phtj4BFuSRvcjbJQxYAu+2ho1gXwVoVGpdmgETghmDKQUv6eZWrAtbWvMq8q4LddZM5yicVUTcBqre1NvNa6+LqkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 12:27:08 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 12:27:08 +0000
Message-ID: <a9dd0500-8687-4710-b5f3-802b8c8decfa@intel.com>
Date: Tue, 5 Aug 2025 17:57:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/1] tests/kms_cursor_legacy: don't inhibit pipe
 CRC calculation
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250722124823.912472-1-michal.grzelak@intel.com>
 <20250722124823.912472-2-michal.grzelak@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250722124823.912472-2-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: d124c826-a692-4900-3add-08ddd41b64fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0ZUL3dsUU9FS2luaDZQTk96dlhONjVSenE3Rk9wNXpOY1h2dERISFFIV24r?=
 =?utf-8?B?cUNuMHkxSld4dzJvdzZ6WjR3dE50VU13MnVnUTZERldtVDlRR3ljc0Y5akls?=
 =?utf-8?B?N1hncUl6YkJRcU9BN2NUQ3hMeE5kTFg3MHRuc25PQjB6UVp0d2hXNk5uN2VR?=
 =?utf-8?B?Z3NITU1FZHY1VFdoQ25kQkp1UUdzMHAyOWQ2aXBWTmZlaHJQS3ZJejRFY01K?=
 =?utf-8?B?Z20veDZKb2J5RmVaTk1HbGtjeVlkTnBUWS9OYVlHT0o5TytBRitHcGtUcXFv?=
 =?utf-8?B?S25lYm5QcldDMFRnZVlOVitUUkNFamt1L2twWGFTSWo4M3U4d1g0eWEwandS?=
 =?utf-8?B?Zm1XL1JWTjQ1QWErQWlXVDFSZ0VWNW5takd4Zll2WCtObldDZFh2bUlpWDJV?=
 =?utf-8?B?TW1Ra1dqSTFVS2ZzbThTbVpmd28xcHE5TXBHbmhkUjc4S2FqUlpnN0lrWnBl?=
 =?utf-8?B?MUlSYnh1L0VxOTFJblN1WDFxYk9TeEtVVFN5Y1JPN1RSb3JPSHVZczk3RGpt?=
 =?utf-8?B?K1licUVhaVR6dFZ0M1Rua1JYbTA5OHN4ckxnd2V2bDY3QXFLMEUxU1lnVEVm?=
 =?utf-8?B?V2RyVnJ0MkRPNDhSb2hNTENCTkc3WVR5UFNsN0NYYitEUzNKcmREWGxzSUhD?=
 =?utf-8?B?czYwM1NuZVZQd0gvVXBGdmlZY0xwYWVHZUxrWU5nYzBkQ2hCMURHakxzMDkz?=
 =?utf-8?B?YVJleXVmdWdSQng4amJFaXE1SVpsc01pYkdjVjU2ZlNpWDVpRFozaWd4eHRX?=
 =?utf-8?B?bUxNdm5Ua1ViZlREb01tNUlMeUlGQVltQzBiQnJhbHFyR29VMnlpT3RzNTBS?=
 =?utf-8?B?ZjRRRnk3NnZ2d3l1UTA4d3JaSHpBTmo0TE5laWxnNTlTOVRDbEd5K0ZsNUhY?=
 =?utf-8?B?d01OeTVZQ3FtT1I3Szc1ZTQvRkc1SU9ranlVTWdLZGVyNnd2RWtKMy81Mnds?=
 =?utf-8?B?TU1JV2w1cExJM0w5ZWtZTC9ZS3p1N3YxV2ZWa1RKL2g4SWJtMHhQRlNLcllv?=
 =?utf-8?B?UTJBNDJRczNENktQM0xZYWdDa09VZW1neWwyR0lDM3IvYm1VNE5XQkYwcU1J?=
 =?utf-8?B?R002WWMySXFRenVVWWlpSVVRL2tmSHNGY2M1V3hROFNJbDNGU1NhZVE4NlhR?=
 =?utf-8?B?UW9tL3NTa3ZidE1CU243VEZSdVl0RzkxU3F4L0ltU3IzK04ySjF2eEpwUEJu?=
 =?utf-8?B?NXFKL2hZNUxWWVphMC8yMThDOTlWd1dTeERveitNc1J4L2w0Uk0vbU5RbnV2?=
 =?utf-8?B?dGlzdlV1VkZ3Z1gzNHQ1T0FDazEyR3k5cnpzTTlXSGxyMUhiTDd3b1hxYjdy?=
 =?utf-8?B?d2Z6Z3lBTG1QVVZ4WUk5QzkxNnVEdWdMME9JUTJwV1RnQndPWFJvZEt4NHRk?=
 =?utf-8?B?bE5DRjl5MTNrTE9OanROZTVxK0I3aVo3ODh0SGx6a3ZhdEpUUjRYRmtPek95?=
 =?utf-8?B?enZKMnNubWNVNG9OaldtMmI5akdhUnQ4N3hnaWo1cWl4THd4cEdTWEdnbFh2?=
 =?utf-8?B?UnV4bGp2aEk3a3hSZ0sxYnZvR0pQUW81aTlya1lHUC9RNFpPVUp0eFMvM1Fu?=
 =?utf-8?B?VkYvK3BsVEM1NzdrdUVmRkRONXEyZjNUalFRcEFwL041dlh3NVdDT0pmejdX?=
 =?utf-8?B?ME8yZjV1eVdPSy9ET2tBajVjQ1liRjNtblg5RThXeXE1bmlBWUd2bmlyTm8y?=
 =?utf-8?B?WjVqdEJaMVhQbWtqWW9BS0V6ZG9rMFU3OHp3WEtkSE1mSzRJMmU2N2VUNGdZ?=
 =?utf-8?B?Ukg4cTNsekFQdDdLb01KNG9wQTl5VHdEaHh4QTl3bVo1RXEvV0lYS2I0M1o5?=
 =?utf-8?B?dGpRelAzeWt1c3pYWFEzNlNIWGhFOWFLeEgzUmRYemhvVlVsTFNaWHM5eDVW?=
 =?utf-8?B?VVYwUTJtK2JYWkQ1aGtITVY3UWhMcjRSM0llRzhlbG0wV3RYWm9ERGFZaEFU?=
 =?utf-8?Q?ZWvD51dHW08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dxVDIwOTlIUFFUeGRCMlVZMkRHZkpaYmVWQVpYNGl5Yk45VzJVaHJVYjha?=
 =?utf-8?B?V2ZscTJ1VjJmKzhIcDB6RG9FVmliVy9Kc3dXeEFlVk1Xc1kzSDJLZU5zTGVh?=
 =?utf-8?B?RmYxWTlPVWpDY21zeG5kdkxwejJrajJPM0RIeUhqT3JUVEhZWHJUem15b0ZX?=
 =?utf-8?B?bDZzZnE4bGx2d0l5TWZaeGpTdjdWSnNoOEY1VTZYa1NRU2JhYzRDc21aTnkv?=
 =?utf-8?B?bEtOOG1nYlZ5WU01bVY1azJ1dVVxaEFrU3FPdzB2VXVhT0E3K0JpM2tyNlcz?=
 =?utf-8?B?dHp1SHNQS3JxTVAwNEF2VGRvVXRMT3J2THk5MXQwakhJUmpNcmFEazd0U1ZW?=
 =?utf-8?B?U1lHS25LUzExMTJMQitmOXE1VDRTMGlYRXFobmx1ejk0RWZYQjlIYjFwbnZo?=
 =?utf-8?B?aHYyZ2lhZTVaWEV2Q2ppcm1JY3dnTngzZk01eEJTQ29pY3dUOHFVemJmV0xq?=
 =?utf-8?B?bnhacHpWelpFQUtST3NoOXl6WVF6Q3pUbG16bmJIMzNCSXB0TnNHNkZ3bU50?=
 =?utf-8?B?L0FCb1M0L2tnVTZON2Z5WmQxbnlFdkZDL25SbStFRTB6L0w5SkI0bEdNaS92?=
 =?utf-8?B?c1ljbVJaWW43U3RyVm1tcDIwRGpEWHZTZnBtZ0c1WmRaVWNQTHRPQ3gwdHEv?=
 =?utf-8?B?dXFqakh2bHRrZ1o4RmxveDRkSUJDNWZZMG0rVUJqUkZCVlJkNHBiTXdEQWhG?=
 =?utf-8?B?c1VGMTlzN1RHeGdwcUROd294S0NWeVR6dWZFK3NYbEsvVm1wRmVHdHlWYVQz?=
 =?utf-8?B?ZW1ZVnozcys5cVh2cmRhWmRYeXJiWDZwZjkzZXB1Y3VIMzlwV29GRmJ5QWt2?=
 =?utf-8?B?cmN4K290czNJMkMwR3Z1bnMwejdSSjhTQ3BUcUxXMFA5M3FnVDBpamJxY1pN?=
 =?utf-8?B?S1FZenZvQ0dVcEVjYWdjYWllc2d4dDZhcWNvcDFkR3paVWltdkV6UHA2L3RH?=
 =?utf-8?B?eUk4SHZVcUJtU2ppemZpWHBOb0tpZzdpWHlHck5JV0hRR2dIWGlaNWpKL1JY?=
 =?utf-8?B?dVZ1Mkd2OUVHMjdNMmNTSGRPakpEL3FyU3RGbWFyTDRPVzg4VDAxeUxaN2ZH?=
 =?utf-8?B?TTEwQWh4NUdJc1lQK2N6UGppb0RZd2c3czh6UVV3OWNKM1dCTHBYNlpRY1Iy?=
 =?utf-8?B?R0lUdGN1TUphcXJlVTBZUHh1aDBnN3BqeUdzSmN5S0dRMmdqWFgvTGtvZmQ3?=
 =?utf-8?B?WjV1UFhpWVlQVVZYUGxnK0ZnTVdzdzUwVzlldXF4NTMrYVVDVlhDOTZ5Tk80?=
 =?utf-8?B?bFcyNUdCd3M5NUo4TmNsRGQ1YUREVlhyNnVDUzN0UkE3bjVhN3l6SHovREw3?=
 =?utf-8?B?M3A4UitiZ0FGWkNFWGJPcUZBTVlvQ01kSXN6N0p3QjFwZHJYS2IrYm9XL05T?=
 =?utf-8?B?bndsaWpYRXc3ai94QXVwN3FWaVZMNmN0dFVRV252SmgyVW03TVowQ25kbjZD?=
 =?utf-8?B?MHgrS1pYaHhvdnFmeTh6d2t5SXkzMVZpeW4wdkt3Y0E2dXl1WTBGVmFhN3FJ?=
 =?utf-8?B?bG9LTzBiK2tjekNoN3lBZGVoVFFkaGFZd3V1ZzFrUUpURGQzKzRVcCtmbm1O?=
 =?utf-8?B?RDQ1TWN0T0VRbnNBZllic00rTkk1dkswbmcxQ0pQNWhmSndpZDdIY1o1V2RW?=
 =?utf-8?B?VStLdHc5NVZDTGhua0VGdFQva1g5RDdraGxmbVFoUU5yazRwMnJhOE1UVVlI?=
 =?utf-8?B?dklEdi9tVmlZc0dBUEdBSWtCRStBY2VVNFd3bFc3bUlMZzMyU0FqM0gvSE91?=
 =?utf-8?B?QWg0MXRSU2pmNUQweGFHR0hoSXZXbmtVblJGeGVMQk5VbWpvVzc2a0IzNE9v?=
 =?utf-8?B?WWp3MUZXTFVQT09Vc1h3NlhxeEd3cFZoV2tSTXlxNUJvVjYwYmxYRndHRGVL?=
 =?utf-8?B?ZDhvYnhNSUNYc2ZrR2I3Y2NIaGtsMk1NbHJqM3BRVFN0aTZITHd3eFE3N0hW?=
 =?utf-8?B?MjdtekRaaVV0bStpdlYzM3pxZ3I4V1VJMHVSK0hSeVZWcmdacENObENQN1dG?=
 =?utf-8?B?Tnd3eGhPMnRvVUtwQytBaTQ3MlNodkRwMUFxenc5am1wNndrUWZXbDJiZFZI?=
 =?utf-8?B?KytXNnVMWmhXaS8yVk5nbXJsckNjTHNIUnc4WjE2aEV4elpOenJodHlZWno3?=
 =?utf-8?B?dXRKTzJ5c3dLa1pteVc4WUh6S1FMY0N0ZG0yclFVVEFVcHJab241TmQ5ZkFz?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d124c826-a692-4900-3add-08ddd41b64fb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 12:27:08.1490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cpc0pYqN8A//lflbMw6JBmR0BGLsbzBVosgIufvy06q619UfcwD0brrRROBXnSVr4LiXBJu/xemSAEG8nS7yHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

Hi Michal,

On 22-07-2025 06:18 pm, Michał Grzelak wrote:
> Running either flip-vs-cursor-busy-crc-(legacy|atomic) subtest from
> kms_cursor_legacy results in entering PSR1 after the test. Even with
> PSR2 enabled panel, it is impossible to switch to PSR2 via
> i915_edp_psr_debug. Kernel does so because it prevents inhibiting pipe
> CRC calculation which is allowed in PSR1 but prohibited in PSR2.
> Therefore subtests from kms_psr testing PSR2 feature (e.g. psr2-no-drrs,
> psr2-primary-blt etc.) are failing after running any of those
> kms_cursor_legacy subtests.
>
> Restore enabling Panel Replay Selective Update by stopping pipe CRC
> calculation after running the subtest and before the clean-up.
If there is any bug which this patch is fixing, please
add Closes tag.

Otherwise patch LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 9f6e644e1..ed1c77d55 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1748,13 +1748,14 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>   		igt_assert_crc_equal(&crcs[i], &test_crc);
>   	}
>   
> +	igt_pipe_crc_stop(pipe_crc);
> +
>   	/* Clean-up */
>   	igt_plane_set_fb(plane_primary, NULL);
>   	igt_plane_set_fb(cursor, NULL);
>   	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> -	igt_pipe_crc_stop(pipe_crc);
>   	igt_remove_fb(display->drm_fd, &fb_info[1]);
>   	igt_remove_fb(display->drm_fd, &fb_info[0]);
>   	igt_remove_fb(display->drm_fd, &cursor_fb);


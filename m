Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A2ECA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 07:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D0A10E36E;
	Wed, 17 Sep 2025 07:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5VoJrCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AB310E36E
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758095769; x=1789631769;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kF9t6ab1GkSyIBCasJA+rHWjxPutFfPtoqBKSlxGBu0=;
 b=c5VoJrCurbJVLAMJR/KFxus55hhnZzE1nj9URtabwR1rt1aRDj1Qhz0u
 CVjZReQ+cegz2nSO2LnunMUg0UJcJCKMfVMu1sJLOFpIPqd3naHg5jzDm
 AJOn1ZsjbkrcVIZB/4zaBxUDd2qVFw7otGGF7GLQPBrTnKMJZHtxGmiqS
 KMs2G64H1nARi4nSCo64zPc5tktRrCTHqt++YtqAvUQwJdc36HEL0wfDC
 FXOHZDO7FjwZgdr/u8/0JJhFEbJEJAycnVTnfq1k9sB5w6S7RGHFuzBBj
 bvfGNZmRqoxUX7AslArUPHCrdyhxDn93l+FlvhYhoNSgipnIXcNO76oGo A==;
X-CSE-ConnectionGUID: FMUe8qwKQiqQPJcoy32Z1w==
X-CSE-MsgGUID: 5qcsKlVxSGCkeuQc0oOnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59611408"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="59611408"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 00:56:08 -0700
X-CSE-ConnectionGUID: gBhDTHJySmSiJ0w1k60wgQ==
X-CSE-MsgGUID: 3dmE8vEDQZCfPGVPhMh+zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="198855079"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 00:56:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 00:56:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 00:56:07 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 00:56:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEHa7WXPAjiVEPGz2UYvQ7PdqsE/t2grnoh/+UtwM7+M34wbwvJNxp/w40aTdg37UhS4f0/XjfMsFY5iYyRrKvys/X8Uq73S+AEn/wWTjo7XoVhYhu57tbquAfeFjcr7m1QCiQ1yHbVzA5gj51Vr7wXyICVG8XiRDvInZCeiC1ipOhUgUwrx0bUq07iBNZZo3dbWlK5FckD2X2WK63V9luEMJr9RioZvouD0no6bKshEuTpylXRR5BzKcqYDMhHFxu/6f9Yqyf98i/vvo5Hauz4o2ME/V/E7YlFBwdr8blTOmkb7hi0y9ID5B9RKxkxBOX/VGb2ujk6JOt39xu4s9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBxsCbKNVzb059OlTwic40i/Q/fLsySSOMWCmEKJZNQ=;
 b=s81ybxGCi4eBFTRRUR83OyhftrcfnWHyFnBSCb4ymBKFKo0y/aTeStbclv21YUOlnUvzj1qS6f1pf43UfBpp3po/3xtD3CCqo78QCmVZbQZcEz2tVuR8/qAzRUW4RlbjqJvLgkzwldpJ8pwiMPXzTqiGljdql/rIWKlsoevFUH10p6qZuFv8onR0WKO/zRk6aXjBAxczrd0MEYdVDmWaJx9+ZoxLiL5S1a46gxBL6/taT9QY80nOXH6GO/EkrKDhLJva7CpJG7psk7zRyVr6MExx07O6ylPPHMfAqjnr2epriZ3VK6EB/SsAB/3h1x1XyOe4ga7ESspgiyRtgfCwRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 07:56:05 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%5]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 07:56:05 +0000
Message-ID: <0d64484d-6f48-48b7-8033-be993889faae@intel.com>
Date: Wed, 17 Sep 2025 13:25:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] kms_flip_tiling: reduce exec. time for sim env
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250902095450.1236804-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250902095450.1236804-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|BL1PR11MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ee68e0-22e7-4c2d-50d4-08ddf5bfa6fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTNlQ0ZZbnowWWwvaDZZaEtxVGdLNjV1ZHIxeW9vZU9vREZFZVo2bmx4a0pV?=
 =?utf-8?B?cE1WS1BPdUx2dStWNHA2MlJSdk42T0lmUCtGMzlHWW11bktyVzdPMFpKSW9T?=
 =?utf-8?B?MmREaEhVZGFrMEUyUDBxMUJzUG1NZ0Rtd0N3UzJ0OEdpekpwY0J3a1NxaG5j?=
 =?utf-8?B?WjBQdEowazN4TnNMVWF1TEZkSks1bHJpNGIzUnRNeU9uSGN4RHBMODZ2MnNE?=
 =?utf-8?B?VUxHV0ZUNTJ2MFJUMVNMLzVDblhsNFlRVjhUVjgzaUhrVllieTRoK0xvSVBR?=
 =?utf-8?B?NVZYRnM2SmwvMzdxdWhqczErMkNKZWg4QTRlWUgzQ2tiaVZ2TnY3TExDVFZm?=
 =?utf-8?B?ZjlmQUt1R0IrRmFyNzdBTEcxZVJJdTNZdUZiWTgxM2xlYjRVejR5aVBURERy?=
 =?utf-8?B?K3VqbE1ROWt0ZllwTXdPdDRGZ1BVVmthZmRuWHdsSGlnWEpSYVlrQ1pQc09L?=
 =?utf-8?B?cjF6NnBDV0xEdXc5Wm1teC8yTVlBVlN5TTFRME16UDBBSmJ1cCtDRDBoTTR4?=
 =?utf-8?B?RFF3M2hVOHg0dWRKT2I4T0RXSDVPOEF6dHRBYXFCTEFOZlBQMWNQOEdTMkk4?=
 =?utf-8?B?bi9vYkVCdnZiNiswY3dTTWNFMzlvc09INU0zTjZHTVQ0blFrVGJnM3VVaG1S?=
 =?utf-8?B?aVRjcyt5UEZOZERnT09Wc0JWVExzUVEzcHdTcG9aUkdTdkpYaDBXaFU5cWFq?=
 =?utf-8?B?aDVxU2N4WExtTjdKU1ltb1VjbUo5UWp1QjZUckZ5alFzWWhVSzRnOGc4NVJ6?=
 =?utf-8?B?YzNPWk5LMWQ1Q0E2Z25hd3lGT005K1hnb0pzWVk2QkRrWnVqOXNtMnFvbUJz?=
 =?utf-8?B?UThhWFlLUStmVVJORklpT3JlaWhTZ2NvQlJlOWJRNkNZdHRxNC80NUo2U3Vx?=
 =?utf-8?B?ci9tZkZUeFBQdFFBZFV1V3QvdzhvbFppb1lYOWg0amlHUXU1SW1RRXNSQ0lu?=
 =?utf-8?B?WGMrc2VlUXBXNmNZRXF2Q3p4NXA0ZHlsejFINnpaZTE2TENvWndXa29YTEFa?=
 =?utf-8?B?dXRDZjJtSXlvb0RwdGhyZzNiTXJVMnN2M1dXQUlSNjZpdk05bDRQL3lSQzJJ?=
 =?utf-8?B?Zy9ydzNFa0VuUlVmdi9zNmJqVjBFYjhpaW9SRXhPWWFJdHl1ZHNQaHJkU244?=
 =?utf-8?B?ZkU2Y0xxTVNxTzRMMUorVG9ucDVMZGhxZWlWOFp3anNieHRMVEs4Mm44OXRK?=
 =?utf-8?B?Z3poSzY5djlLcDl0aU0wTis2RHo5ZUUrTm9hVzNlb09FeGFrWkV3R2h4Tmd3?=
 =?utf-8?B?dXpsemRuWlJVWm14cG5CSFdHZzNHODRyVFZ6TEEvWnZUSFowbW1xb2EyNXhY?=
 =?utf-8?B?SlB3TnZXS0Q3eXBVUnA5RVplQndXNk9kRjF6aDFZbkhhdzF6TU84N00rekFs?=
 =?utf-8?B?V3FjS2I1by9XeGZwMUlVRWRrTVJmSGZrNnp1bXpORkJzWHJqMDhidm9TVUM0?=
 =?utf-8?B?RmdWTDRZaTkyWW1Jdk0vWnJ1cFg3ZDhnTTFJNXN4VEJld1phYStxeUluMExh?=
 =?utf-8?B?dlZoektiTXRON3BEWGh3QVRsU2xRTldiWWNnTm51VDZxejNTSmJuRjVrVGVC?=
 =?utf-8?B?QmkvZ3k2S3lqQWYxL2NiVHlQMnpQcDFBUnFvVTlORE9xTElFRGVvSnZvbHlC?=
 =?utf-8?B?b09mcTBwdEVMVDUvQktnRUVsQW1CeHVQUHIvVGlzaDhjY3c0ZkwwWTd1UXUr?=
 =?utf-8?B?RkZacjRZQzE4N3Boa05BRFRCMHpKYTVndzRyQnVhTjU3aFcweUZFTWR2VklU?=
 =?utf-8?B?R2ZOZG1LaXVMOFVZV1NZd2dUeW5aTXpBa1EyODJqYzVDbFJlV1BnOWt1WENx?=
 =?utf-8?B?Uk8wZUp1QndLclJiQlpQNndMY3YrcS9NVFBPNVJFL1pHc29MQU5VZldmYnNX?=
 =?utf-8?B?VDM1TFVZQkJDUFFnQklOeUlXQzlCWkVoZzVSZnhIUHZVZ2FzeGM0bWVVVkhM?=
 =?utf-8?Q?fHruIZTeSmA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGlrRExNbXU5OGlieVFIaERpTDAwTFpxNTN1a01tVTJMcTlYVTY3dXFUSDZX?=
 =?utf-8?B?NG1OSVd1V0JxWDRhMUtzNFVjSzQyakJwcGhWNEJUTG9Hc0pXOUtVNUpZRmx3?=
 =?utf-8?B?Y0RpU2x3UUZId0hLRzlaNXNIUnIzYytYMklNUGRyVjVBN25JMXlzUFY2dWVN?=
 =?utf-8?B?czlEaEZ4WkJSZG1lNEtDUmpVR1RmNTg3T3ByY2RHS3VXOEhmVEVCSmZLeGZy?=
 =?utf-8?B?TUU3UGk5WHllKzhrbm9KWG9melBYbncybVY2MEhBVjZpZHRvYm5QQWU0U1Ra?=
 =?utf-8?B?dXVmMU5mSGw1VXlZVDNObnJPdkMwTjNpczVjVm5JSkU1WitYZzZ2T044V3VG?=
 =?utf-8?B?dFkyYnE2eGVYdHpvMXFzK2llbWhjY2JEVnRkL2hoY3lCNlcySmRSMms5b2U0?=
 =?utf-8?B?UU1rV2FNSGlBbFhIVW9VRnJ0cStnamJvN29xZlhZRHAydytsc3EvMDN6QWdm?=
 =?utf-8?B?R2N2ZytnK2REQ1VVaCs2czlHM0xyRkhadTVHTTNZRWRrdUdIbjhqYmsxMjlC?=
 =?utf-8?B?QTg2V1NGK1lVWTVSY0VNMlBwTzNWcjFwS282WFpqVE1vd3hkdEFnNkh5b1Jz?=
 =?utf-8?B?SVEzeldZTVp0aTdVdnJseVFuZ0wxK0hyNkVFV0F4TGgrV0g2a1VldGlJeldV?=
 =?utf-8?B?Ny95N0hOR2xRaElpM2cyejc2L2pPbTgyRnErd1hrYnlESzB4dlNHTkFnT3ox?=
 =?utf-8?B?WWdrM1M3NitYSHFEYlpwaFVzNkptdmZ1c29mODRzOTV0M2h0aEZFclFCaXdH?=
 =?utf-8?B?V29ZaW9SNGhFTmltTW5XYmdxU1RjenhlUjFqWmdNaDA2VitXYjJFbEVYa2wy?=
 =?utf-8?B?Ri9jcjdIOWZWS1NORzlXK0h3WEdjUHhhQU5JRHBRT1lNZ0FVR3RJUStZYzRT?=
 =?utf-8?B?QnZkVVdGZkxmOXVvNlkzR25HcVd3RFA0QU9ickczZlRxbDVrMHRtamZkQ3dl?=
 =?utf-8?B?Q0xFMndZbDV6d1hhb1gwQkpUdXBRSDVJSFdMbFgvdERkaU9ycmtUL21lYUtq?=
 =?utf-8?B?QTJSUUxtd1dabDdEcHV5dVE5YzdpQU8xaGtZUmJPT1UzRFpyNVFNQVNmM3hx?=
 =?utf-8?B?Mlk2VjhySktjcHdMQnErU3NXWEhsWDh0TDRJQ3BDZVRIb2txbmhVcnRrK0d6?=
 =?utf-8?B?NjBDRjkwb25RbzhWcjhvTWd6cDY2NXpxclhLUXVlVExWTWthUExpaHppejdK?=
 =?utf-8?B?UUs3VXU5WlNzdUViaU95OVEzL3B4ekNLSzN2OWtpZUE3amJGUzBjQmtVTy9B?=
 =?utf-8?B?TitvdHNxQnk3NDhrNVZSRURHUDRRUWIyeWRvd3FBY0dkQmpQc244TWZwK1JT?=
 =?utf-8?B?RjgvT1ViYWlvT0RMR1I5R2pOdmc3S29YUmp6K3VCS1BHUFNiaG9PSGZ6R1lK?=
 =?utf-8?B?TnpkcVREckordmw2SkROSUNGKzR4VG54bTdFVTgyTTdUN3Q0NGxEMXVyZ29i?=
 =?utf-8?B?NmtpcFBsKzlhUTZnNkdSdmY1ZEtWOTVMUExZc281djFIaUJndng0MHJTeFQ0?=
 =?utf-8?B?WW5ubmVlbzZMdzdwZFlZSDloZG1Fa3V1VlFDcXhvTG9yYXlQK0dmNDBRdlRC?=
 =?utf-8?B?WGpmL2lSVUZRUldjbEZ4bHNRKzBpU2M1VkhxSk8yb3pqQUhzNkg2WVdDelFI?=
 =?utf-8?B?cnhPM1VPeVhNL3ozNDczZCt1YjJIdGlITmQwRnlhdC9oazdGbHE0dC9zenRy?=
 =?utf-8?B?ZEFLZ1BNSkpubTBHMlVUTWZzT0RDVTBMcjJ0bGdER2hjdVFKM1BmYk50bmY5?=
 =?utf-8?B?cS8xZVlKQk01c0wrSjczVW4wdFpaaDlRYjZjTWZWaHpkMEZVZlF5MGJCOXI2?=
 =?utf-8?B?VG16S0xpYlUrbkZBb09KZjFXNkgySFh6T0ZDQm5FM3JFQXB5WlFUZzB0cGEz?=
 =?utf-8?B?WW9BazUrbmJGUW9uZTl6aVhkczZ2eDhkWGpXZVU2bWZoTkRacnRNSmlsK0dK?=
 =?utf-8?B?cVNQTzRjbHorNDA1Vndyay9GOFk3SFcwSmxTc3k3RzNRcDN6Mmk3NkpGQVV0?=
 =?utf-8?B?V3dqMWVucloraW8rcStpTThpSXJ6Qm5iLyt2UVdhWVlPc01zNmtrMjdXWVNR?=
 =?utf-8?B?WDkyV2VCZGVCTEhOcW5aL2ttNTVwZW5zcE9NVEhUekpVdllOcVQ0UG9Qc2lu?=
 =?utf-8?B?aFZDMHV3TExxSHhiSVBCS2cyVWJPVVlJTmVaYXhHZlRPaVk3bU5QMGRJTmZS?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ee68e0-22e7-4c2d-50d4-08ddf5bfa6fb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:56:04.9231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TibQ3n6ykc1QpSFvbHbyJTNiTTMQesYySDuhDsca14qoUfwwJRPRZYAkGBPAZCWosjEzCffvrmF94tbdG16i/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
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

Hi Jeevan,

Please find review comments below.

On 02-09-2025 03:24 pm, Jeevan B wrote:
> For simulation environment, we can reduce execution time
> by running test only with basic tiling combincations.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_flip_tiling.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index ff9ad1229..8d77dc5b7 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -242,6 +242,18 @@ igt_main
>   					if (plane->formats[j] != data.testformat)
>   						continue;
>   
> +					if (igt_run_in_simulation() &&
> +					    (plane->modifiers[i] != DRM_FORMAT_MOD_LINEAR ||
> +					     plane->modifiers[i] != I915_FORMAT_MOD_4_TILED ||
> +					     plane->modifiers[i] != I915_FORMAT_MOD_X_TILED))
> +						continue;
> +
> +					if (igt_run_in_simulation() &&
> +					    (plane->modifiers[j] != DRM_FORMAT_MOD_LINEAR ||
> +					     plane->modifiers[j] != I915_FORMAT_MOD_4_TILED ||
> +					     plane->modifiers[i] != I915_FORMAT_MOD_X_TILED))
Typo, this should be j.
> +						continue;
> +

This seems redundant. Also, instead of || we should have &&. With this 
if modifier is LINEAR. First condition is false, remaining 2 are true. 
Still it will skip.
Anyways, instead of above have following func.

static bool is_allowed_modifier(uint64_t mod)
{
     return mod == DRM_FORMAT_MOD_LINEAR ||
            mod == I915_FORMAT_MOD_4_TILED ||
            mod == I915_FORMAT_MOD_X_TILED;
}

Then we can have
if (igt_run_in_simulation() && !is_allowed_modifier(plane->modifiers[i]))
     continue;
if (igt_run_in_simulation() && !is_allowed_modifier(plane->modifiers[j]))
     continue;

Also, execute test only for 1pipe/output.

>   					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
>   						      kmstest_pipe_name(pipe),
>   						      igt_output_name(output),


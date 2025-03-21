Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1574BC36000
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 17:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02EB10E19A;
	Fri, 21 Mar 2025 17:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFgbw0Qz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C395B10E19A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 17:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742577428; x=1774113428;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=pWmG2CGYf4Gxa9LYuSduQJrsyk4WU9Hfexlf2ynpMS0=;
 b=oFgbw0Qz8Pj3WLJ66Pb8Kmt4KvmH+hi1TGAnWatMEaGQdFQFo3VP/H/F
 OBeT7vEEXUZT9k8Wvp2B08h9JthM0AdmuFqsdMXoWo5Eb8yuyZXQFZ6Mv
 E8HDYTDpEwylignEwQ+eAjCNsniCaiM8neI2K0+DZl9ro3X+72MJ2XF4f
 t0XYQmJyzhSKdzgKmIuXj7hi94xrUN5y+Vds2pfWq4oB9DUlakO4auTUd
 ePhLG1uBLJTJO3bu+4/pG/KT3bESoXWVI7RpT2cZts1RS8+309WCglZzD
 cCFREKM9a6AcxV/2PLFt4Iya0nVYCyY8Grw/GpnfpZhUII/3azDBX+XUZ A==;
X-CSE-ConnectionGUID: 9CLBfnN8SU+icflL4nvuNg==
X-CSE-MsgGUID: PsTIKQ+0S32WX8zXHpljYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43015752"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="43015752"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 10:17:07 -0700
X-CSE-ConnectionGUID: e8gPYBPhTJm0YPJSjn99Jg==
X-CSE-MsgGUID: hDxRSKfoQ+ey3AnYpQizWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="128286841"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 10:17:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Mar 2025 10:17:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 10:17:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 10:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjmfRAuirbVleHUjtSO3K7zPN1wW1r3g3IgXEijvJ9cPBjBnHa3h5YfdGdtcSrBdbWFjAHnlsUaXlUkNXZ6I7DLQZ4G15/FlOZmGYzbjW5y7738/HQwXgaOwL5uMeWyuqJbebnlK7bfKeqqMOBfkk/KXH3wCXwwx8+gjp6RlgXVgk812lArdiqvwXX1oy9l4DB1gWvLoI61ViMBKkBmpWfv9G7vPOK388a/YEiF/FRc9FaEa/l+OoohRAapWAhFeBVPg/UvR8Gh2Vgrd/modzAv64OyfVa+BctBFhFl0FM1yuEExqC47R9e1CFIilT7qx5GAa5xkLly3QUVAvVbF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH6FapRsuM5/gxH60FnBvAJLzBukHo+KnpmJVsswISU=;
 b=MA4oFjnKUWdo4QdZyEQG6g7GE7KQSEo1Bnq0iPu445cxYVq6z5GOTkFL3p5cFexKCdfC14MOAwqNY0wpY1NiX8vafBq/nBSeoNZYnRXOAgcQL29ADVrE+A/wK/t4fmaCQ1u6X4p96EzTBVgzPf7EuGaYBcgDlWXwWRrKDmv7gXNMch0yAeyiXGx3hxUtUrAO6ys/gWzYWo9gfgGaObEai4iLacaysbyIHTLG9G8iCfd5s9xGzWboVmmUnra02WWU4Vf1n5VRqXLUEJLB2To6IJV0Ycs/wKXcpGt2W8qTJpiH6ZJ0DEYyMM6aP58OihNNm5TfMTsLEuwuBWwI6K8qwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Fri, 21 Mar
 2025 17:17:03 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 17:17:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250321092120.85206-1-mohammed.thasleem@intel.com>
References: <20250226065202.84015-1-mohammed.thasleem@intel.com>
 <20250321092120.85206-1-mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t v3] tests/intel/kms_pm_dc: Add skip logic and
 logging for DC5 psr test
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Mohammed Thasleem <mohammed.thasleem@intel.com>, Santhosh Reddy Guddati
 <santhosh.reddy.guddati@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Fri, 21 Mar 2025 14:16:56 -0300
Message-ID: <174257741685.5638.16547042130408254624@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN0PR11MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f95021b-d8d7-4756-c80f-08dd689c32b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzJMZDEvT0l5aVc3L3Y0Y1gvV044OHZkRjh0b0tKOElLQ2pLeGZqSHJKdmtm?=
 =?utf-8?B?M1Y5T1hMcm1uYWxxMWNNRytobjhhaG9IYUJOUjlaWUV6Qzg4L1g3bzFsNUdz?=
 =?utf-8?B?SGRsWjNtcmVTSGFLWlVWVFpsOHFwWHpsMzZOTUd0ZTBvdk5EMW14NmpYQ1JT?=
 =?utf-8?B?N0JOalpxUHhBeFFjRGx5VCtWbkJrc2NnQVhkWVR4elRJM3Q5ZFpSTTBYRGVF?=
 =?utf-8?B?b2tnYitWU2N6WHgyNXJ4RjZ6czNtUzFhZUluZ21lc1ZzNzduVmxCdENwZmtn?=
 =?utf-8?B?bkFabjJpMjltU3R6R3M1QTlTc2pQQitvVkZHYnIxdm85aHUvU1NnbUZJSWwr?=
 =?utf-8?B?VitTYXhaYkVNM2tGMzIyK2UvQ2J5c2R3cW9aUVk2ZlVqNFhUSFVMcVpKUVJm?=
 =?utf-8?B?NXNUaCtTV3MyZWpYT1o0TkZHSW5pbW9veFg5MlkwaGlhZThESDhDM1A4bmZO?=
 =?utf-8?B?QWNucDF1cm1GTlFJOXZiQzF4L2tMa0xBZWc3aUNaUTNtQlNlZ09FK1R5RVJu?=
 =?utf-8?B?U2R0aSsxOVJ0d0YvSm1OcVV0NXBwRzU2M1ZSRTUzWUlyeVBFVEp4Y0xuTnEx?=
 =?utf-8?B?U2srclJreVlkcVpOSzVyQ05JTEprWTMwaVFpeklka0l0Y1JNalBYNVFUTGhH?=
 =?utf-8?B?MlpkcFQrRXdGSmYvdGltclVlS0I1L3A5cjV4dmZIdzl6RU90UEpJY1hDNGh1?=
 =?utf-8?B?SDdsZWo5bytNYzFNcDhrd00yWksxcDZtVUFwRVpYOGIvNlphSGl2d2l1VHBv?=
 =?utf-8?B?bXFabG1xaHNBSW1HcmFoWXdyQnFZcUQxalUvUnVYc0NJdXc5MmFmc1hmeVF6?=
 =?utf-8?B?Tm1WT2k0UU9VejJxMmEvaWtmUzhhdE9acENUaGtFQmtXcis5ZVFkQ1dxK2pu?=
 =?utf-8?B?cnIxcFBTa1Q2c25URDVqekZLRHNsWnJ3OXl2bk9vQnYzSE5EdmUxdkNoUGhN?=
 =?utf-8?B?T2tMQjM0dnlhUHJPWlo1T3E4cE1ydis4WnpGL3JDV3loUVNNc1U1Si8zNkx3?=
 =?utf-8?B?UmdDQTVLUnVyK2JhaDhqWlZHYUpZQWhYS1RvRzBsbnR1Zm5CeS9pdzhZdXJq?=
 =?utf-8?B?RnRLUk02eHN1ZTVOamptS0xiMTFFbFBxamxIVFUrUmFDazJkVnl4ZlYwdGU1?=
 =?utf-8?B?RzNZUko4cFNMMDFGYzdMNml3TXRkZ0FBVFgzNEVseERLWXdMQzJ1elZXTHJX?=
 =?utf-8?B?eHR0UEVFK25yb3dYWUhIMHpzblA4em5lRWhFenE3bEU5dDFVOW1GQUUrbDVL?=
 =?utf-8?B?T291NnhHaXlrNVFJeTdaVVFhY2JxM3RxQUJFL1FkS2FISW1XMkJNQXBtT2lM?=
 =?utf-8?B?YlYzSlhoR2Zhd3B2YysxeURoRGpteWh4WDE3UzJKV2ozbnFObTZ5YlkxenAx?=
 =?utf-8?B?V21FU2c3VkZzMGlsazRuOU5tNVB5OTVXVUkrc2FEY2kyS3Z5c29KdFpja3B2?=
 =?utf-8?B?NXlYckRQdHN5N0pNNjY3ZEVkM211K2Y1dExoSEVQRDJ4dDVBd3d6RGVDUGw5?=
 =?utf-8?B?V2ZiK2xudXhUc3hXbDQ2K2p0WDU4MGlGY2VpaC9uQktBcHREMGk3Zzg3QkRw?=
 =?utf-8?B?RVprZytQWVE4RHU0Ymt2WEFKTjl6K21aUTdwNXdkWlpzTFpCMk85SklUTUFx?=
 =?utf-8?B?bmRDZkp2N0dJUlBJU2xOQ1ZWZWxwVEo0aUhKUEhPTkZKdnJWc1RScFZHOEph?=
 =?utf-8?B?QW4rS1BtTDZGQy9DZ3hweTFyWUR5Nkhjdml3dUlvcVJTejdMTU5YMUFXVVg5?=
 =?utf-8?B?R1dSNEpqVVhjT3FJQnlyWlVkMEJQRXIrekdJY21nN3pITkpXRXo4TW1YUzlJ?=
 =?utf-8?B?UHlHVWN4d0cyTlgyZC9lRmtkS01DSlRPZ2JjZHhTdEt0MGE1cUNhTWpwRWxL?=
 =?utf-8?Q?Hv6OkpswTmpo3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjNzMzRCbTBlelRBMytWOFUrRG44NWg5R29MM0RFK0RSMXJYd1lZMkRkcHkz?=
 =?utf-8?B?YjMwSm1QeVU4eis2cUphL0V5QVJVejEvNmVtZjFDbjVvckdraTNXcC90Nkhr?=
 =?utf-8?B?YytjejNFUTJZaTljc3I1bVp3Y2lUNzhGaXlsSG16YjZFQjllNkRKZmQvK1Bu?=
 =?utf-8?B?TGhEWnRJYWpzbXRaWlFlTldwblpiS1NMcU5zd21OTTFLZElkMGVMMXFFdHEr?=
 =?utf-8?B?UUxkeXlmcWZ6R3pxTlludWNQb3N5SnVzOUIySTRMQjFhVENVSjV6Q0tLenJB?=
 =?utf-8?B?L3U0dnVsdVo3ZDFKa29FT003MFA1ZWxRYjROY3JKVXBCMnRzOHdtSjNrZmEw?=
 =?utf-8?B?S3hTZUN6dFFJY1hMT0x5WklqZHV2NFBXNDZ4Z2xYMU1oTXFjU1Q1NkExT29k?=
 =?utf-8?B?ZFM0QVFiM1lkTFhoNE11ZmFGOWticlBVanZCem5RODNjSGhlZ0tiZXhaSENG?=
 =?utf-8?B?SDJFcGhuaXQ2aFVnVVEyb1RLWjFKTzlNR3oreVE2b1JQcU1TVCtnRGhteVNY?=
 =?utf-8?B?cHVyRWNHNUIwK3RyWTY4QjcyRXJLc2g4TFhPVk44NC9zK0hpcEc3c1dKanY5?=
 =?utf-8?B?eUpWMHU2WUxvbTd6TmErZm11V1lkZlR3eVpWQ054TFFSY2ZjQytmT2hWbmFZ?=
 =?utf-8?B?QStOMmtHb2QzUy91aE9NcUNXemhxajVsWElmZ0Qvck5qdlRVcUlsNkV0TXpy?=
 =?utf-8?B?YThOTFhvb3N5SmlGaURQTVpkOE94Wnh1Tnk2VW9kbmx6M25HK1YwWldSdU9L?=
 =?utf-8?B?MUZGOUpXZm5ORSs0Zm1xckhNZW10K1V3Mi92WlFITDkyRXlLWTBVUXByaGFt?=
 =?utf-8?B?RFVTTXBNNjdDTjQ5NzY5dW1iTUdXTU16VnpabGhDUkNNd1VPSmt5Y3N4TU10?=
 =?utf-8?B?ZisvVkhOcTBOOWoxc0l0ci85UjFlZHFjYTJZdExqOWZMU29DTFE1TEI0K3V3?=
 =?utf-8?B?Y3pIRXN6cVhUdXg1cCtEWVpvQXVMMFE1NnRUUlJ4cnF2UlpiWWxOQ0Z0VUdM?=
 =?utf-8?B?UHFGaFcyRkZJclpzNlM5dkRScU84K2p1Rko4eXAvTlo5QUF3ZDRmWVpvNHN4?=
 =?utf-8?B?endWWVBMNWVOUEg4VDEzdWxMTkdhb2RvaUNQNTNXZTh2cUVLakl6SzFjcWhE?=
 =?utf-8?B?WE1Id2JVbkQ5TTBxT25qWXRtT0dSZnRVR3N5c3Q1RzUzVGV6RkNLWjUyeDVX?=
 =?utf-8?B?V2dYcHJqUjdKcS9lYWU0MUpZOHcyL3lZaU55ZFFtOGZwWDFEai9uK1hZZ0Jn?=
 =?utf-8?B?T2MwOTJ2U1VrZXQ4NWMyanZtaUF2NXdpWW9IcTlTM2N4VmxLc3N6Y2k0LzN4?=
 =?utf-8?B?N1pvZVhyVVQvR1dtTkhYMEIzRjE4RUhod3YyUzhmanpJTzdQWk1xb29aQUlo?=
 =?utf-8?B?KytQc2U5NDNHUFhmb29DWGNqdjlLOTJ0dW9hZk5mQ2tybVNNekxrZ1BHNFFx?=
 =?utf-8?B?RGFMT3dqRzdpMkxsdGRDM0c3bk5CbjhqRTFOSDNwYmNXSmY0SGUxdG5YRC9q?=
 =?utf-8?B?VXNPUkN3aDZsbVJhVzRrSWk1K3lJdjVqWnAyV1lhcjNBWlZyQzJaaWxWZjFy?=
 =?utf-8?B?WUk1UGdsRlFzblQxa3RYQnhmdGZPbTdoczdKUXppQXJXRVBZMCtvdDAzOTQ1?=
 =?utf-8?B?SjhKV2J5U1RYY09zYjZPbGxRV2VWZGV6WThrTnNvQU95YVVOK0Z2WGovL3lJ?=
 =?utf-8?B?aFowL2VTclhjYnFTWUZDMmtMeHFkY0JIdHh3WU9iYmtVZlR3bXFmc1M2b1Vx?=
 =?utf-8?B?a2hycmZDM2RuWHcrMFNheUV4VkpKQTZSNXM5VEhON2NqTnNnWTF5akNoSmJ5?=
 =?utf-8?B?dHZYdWd0aXNVWHlacDh1Wk1BM0dPUDRTMXNPNEFkYWs0QStFcVJObkN5MEVn?=
 =?utf-8?B?WTdTUFU0d29oSy81bG5BV2FBRXJick01RFdaVXZzT1lNckloUFhqMGNxOFNZ?=
 =?utf-8?B?eXJtbWlwOXM5d3N2MjlOczNvT1ZWWmhING9VUE8zTDN1UFB0ODNsVmUwbzZK?=
 =?utf-8?B?T2VWcElKZ1dzcWpxN3ZYb3V3eVRxSW5rTW1QaGRDelEza2YzcHRyZXhvaGhJ?=
 =?utf-8?B?M2NYa3VSeHhCRDVOODhRbVNUcFN0N0NBdnFDcm9Pd1RxK082TDZnQ3FkcEVm?=
 =?utf-8?B?TTFHZkxCMFBnTm9YcENFRzFOUDBud21wc2hkZFhpa09mVmpwL3l1ZVZ0RnZ5?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f95021b-d8d7-4756-c80f-08dd689c32b9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 17:17:03.4476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdOYrOx+0hhmXYi/52CbBGsnJwW0HvhctHSZI1syGxVgBzsD/xPMZRlGT0EU43PK7OEUHzWPQ2mMvamwRrttMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
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

Quoting Mohammed Thasleem (2025-03-21 06:21:20-03:00)
>Prior to Gen12, Pipe A is required to run the DC5 transaction,
>ensuring low power operation. In display versions greater than 12,
>either Pipe A or Pipe B can be used for the DC5 transaction,
>providing flexibility in pipe selection
>
>However, display version 20 specifically requires Pipe A.
>Additionally, for Battlemage and DG2 devices, only Pipe A is
>required due to specific hardware constraints. To enforce these
>conditions, skip logic and logging have been added, ensuring that
>tests are only executed when the appropriate pipes are selected.
>
>v2: Updated subject title and discription.
>    Add Gen checks for low power pipe selection. (Santosh)
>v3: Add check for bmg and dg2 for Pipe A also other checks for Pipe A
>    and B. (Gustavo)
>
>Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>---
> tests/intel/kms_pm_dc.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>index 50473321a..b23c13363 100644
>--- a/tests/intel/kms_pm_dc.c
>+++ b/tests/intel/kms_pm_dc.c
>@@ -148,10 +148,16 @@ static void setup_output(data_t *data)
>         igt_display_t *display =3D &data->display;
>         igt_output_t *output;
>         enum pipe pipe;
>+        int disp_ver =3D intel_display_ver(data->devid);
>=20
>         for_each_pipe_with_valid_output(display, pipe, output) {
>                 drmModeConnectorPtr c =3D output->config.connector;
>=20
>+                igt_skip_on_f(((IS_BATTLEMAGE(data->devid) || IS_DG2(data=
->devid)) && pipe !=3D PIPE_A) ||
>+                              (disp_ver <=3D 12 && pipe !=3D PIPE_A) || (=
disp_ver =3D=3D 20 && pipe !=3D PIPE_A) ||
>+                              (disp_ver > 12 && disp_ver !=3D 20 && !(pip=
e =3D=3D PIPE_A || pipe =3D=3D PIPE_B)),
>+                               "Low power pipe was not selected for the D=
C5 transaction.\n");
>+

This seems correct, so

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

.

That said, I believe that condition is complex and not very readable. I
still think an if-ladder would make things more readable. Example:

    if (disp_ver >=3D 13) {
        if (disp_ver =3D=3D 20 || IS_BATTLEMAGE(data->devid) || IS_DG2(data=
->devid))
            is_low_power =3D pipe =3D=3D PIPE_A;
        else
            is_low_power =3D pipe =3D=3D PIPE_A || pipe =3D=3D PIPE_B;
    } else {
        is_low_power =3D pipe =3D=3D PIPE_A;
    }

    igt_skip_on_f(!is_low_power, "Low power pipe was not selected for the D=
C5 transaction.\n");

--
Gustavo Sousa

>                 if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>                         continue;
>=20
>--=20
>2.43.0
>

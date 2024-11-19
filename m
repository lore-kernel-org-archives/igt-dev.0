Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEACD60074
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 08:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85DE10E5DC;
	Tue, 19 Nov 2024 08:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmgPd9/q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C4910E5DC
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732003851; x=1763539851;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nZTy6Ff2ZUt58fFlOdt9+00Kn9YRGWnBXGNT8VSmmsU=;
 b=nmgPd9/quZg/tzDGcVwyx49VgtBb2YhsB7eIQOQyqynsAlKRiDOMSLBJ
 6VcuTblgiTJdePo46PDQVahKyOSWPw+a/PFQlMrriBPvYePi0LppbkDRJ
 pW1dzmsGnJEV85pzWnhffwUhRrUGcBNMO6jdRBH2WrndDkCGSzSnTRhao
 Hn1wkT5HUW4vliDVJInHljjaFjij5Sl+0TVL6xwntFBdeDQvY/kYvuzLq
 9aAwejmlHFIUYXXv1zeDN4bXyw50vvDkrFeAbKkBC5GP9uSXOeFDgOFrc
 Mfx9WzSelpYda8RwNcsb0J9Ill8i60QYfFOvbQJJ+OlDf7OtQ9fYrnblc w==;
X-CSE-ConnectionGUID: aRH43HVdT3Sn3rUfjd2UCA==
X-CSE-MsgGUID: F37L1PRLSB2WR+E7W9MErw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32046838"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32046838"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 00:10:45 -0800
X-CSE-ConnectionGUID: 6z3hZlt0Sja13tUc5dEDIQ==
X-CSE-MsgGUID: 2a1ELGR/Qd2LSVcqXO+ISQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89401063"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 00:10:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 00:10:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 00:10:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 00:10:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaDEnsy7Nk2VGTbDa7tsma0uOPv5M0Ud5j6z7wF8O2f3qTuOKmUIk0xQaBp5C9/6msWsBvbjUCiYDW5jkV+EAYJLrwrOiNQ9vPLkQVDacLwzZJHTgU6V/eDhGpZS3IY2wwtxGxztDFLdmA/QtIbeEDG7/YDqTCrmmDjlzz8E2z5UbYJ2ikjWdjoISqYh3p+6D9W4Mz/jdBQi241Es/xgDpn40HHK75ecg/FtHzehiQupebwSrOu7lYcAH8SRcC7b3E2zjWch0bnHVSGLBWhzjPFC8+JEF9eRshyijyczkC3WCfuWr0oz+1nU417JY8LM4vOdGVrV4xdFJ/VnoytuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+UWvqltj5Ao29CP0wlymvrp4y1zsW0nTD5u1mOHf5M=;
 b=h/+U1jb6WfPF0vUst6WRb6z8O54vKAIm40FCL0BS43YOtnxfLJDOSLjG370KTfcoUmJVFA1GjvwOVFmuX8grb/K3qYRnoxLo8XrQwXIX7aMKAfa8OxdN4i4tDX86PINn8Lsb7GJnVZtB1w469UKZg6Fuglck1yK9ibUcivQsfITpu/IhsyLIx/+rtKJoVoxtsx2WcLjhwuZBo0TVCQ9aUY2f0px7+ciBHtRh9BfXFtaPjXA2QPt/ov9bfZQipsPkb1qKSWVYp5uGZeVAGyi8UC7a20GUBl9qy9RtJKbBLkdQCMzxZy63Nkon8UdzTR/WezyZnCeUb5/DE2psVuqNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SA2PR11MB4825.namprd11.prod.outlook.com (2603:10b6:806:111::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Tue, 19 Nov
 2024 08:10:43 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 08:10:42 +0000
Message-ID: <c110ebfc-9b3c-4d40-9231-fb8157638e16@intel.com>
Date: Tue, 19 Nov 2024 09:10:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_eudebug_online: Add read/write
 pagefault online tests
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::9) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SA2PR11MB4825:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c171eae-052d-44c1-3a07-08dd0871a984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REJiTm12VG5FczZjUDVISmdoY0tFK1ltZUFjTXhFUGhxR3FoZ1NuTGlLUkl2?=
 =?utf-8?B?NlJ6eTYyN2hkVjR0bkpBSGtnalpDbXdnSDBwNXFUV3ZVcWY2blZIelM0d1hD?=
 =?utf-8?B?R0hYTkZVU1llREFBeU1uYTIwc2RhWnVGZERCcFl2UnFkMFhPNkhreEZPL0No?=
 =?utf-8?B?cUloVnJXK1h5aEJmTy9YWGxkS1RmdUViSG53aEVmemp0R01HZDE4czVtNjMz?=
 =?utf-8?B?Rk9WVXpXdlBYYW83Z0ZybzAxNlBuK1ZFcEhmc2NaRnJua2x1RlZyUmxnc0lu?=
 =?utf-8?B?cDh4b3A1R1FIUE1CVWZrMjR2S0FrYUc1RXlTa1Y0N29GWTZNelhaY01UNnpW?=
 =?utf-8?B?YVp1Y2N4VVZURmZTNk91OGliWUN4dktpZmhLak5Mb2U0cFRXUzJvN2tuRkhs?=
 =?utf-8?B?RTErUklzYjNLU2YvZWd1aERpK2tPbTNNbWVFbjRrS0JlMmxxaWxRencyTUVk?=
 =?utf-8?B?K2JYVEZmVWlXYk93S0tpSkd1ZVh4eC9WcGYwVkRDT3EvVzNkU280V3dJRXVq?=
 =?utf-8?B?RWZSUzFKaUovU2lPYXo4ZW42SkozWWhRZUZ3a0ZmVzFOdEgzSlNILzd5a2tN?=
 =?utf-8?B?dmRlTEVCdGNqU1daaVkxd2tCNHVURy9VSytjVGYvc0dQbUl4QUFIdG5palNE?=
 =?utf-8?B?d2tZemdoVGUyVENOdm5JcVE0d0hKUWRUR2xISGZrdm9lQzRlOWc2UnRCUjR4?=
 =?utf-8?B?OUJPemZDdHV5eUl5ZklOdFhJM1lXSk5VMEhiWjRNRHNNZjdEazFNSEVDWkNH?=
 =?utf-8?B?SU1KTjhIYmRLTlE1ZUUyTUxTVkh5WXM5U1dLRjdObC90Q1pFR0UwUFBmVzFR?=
 =?utf-8?B?SWIwb0VpTXpaTWNJMU9ZMzBxaXQrS0dQVmZjZ3I0cHBQUTNGU1UvMC9JNUIw?=
 =?utf-8?B?eGRRKy93ZTlYR0ZEVVpSbkhuRGMxc1NBb1pRYkJlbmhMUTVQM3owbjlINE9L?=
 =?utf-8?B?UVd4czBBeHVlRFllSjFiaWh1aTJsZm5HUkxoNjBLczlpckp4Szd1WlBXR1hY?=
 =?utf-8?B?cEJwd1dUZGpTUnVMN3liekZLcnRic0JyWWNnQmQ2RjZEVzk4V2lBdHVDZEox?=
 =?utf-8?B?cjYyV2Fza2RuSkd5dWdzMjFuektiRWJ2MjNaUWNMQ21UazI2amJSM3U0ek9t?=
 =?utf-8?B?N1JhSG1OSFlZMGt2dXFuNnZrZ2owbzFFOC9rbSs0czhqalpaVHg4Y0NzcTgv?=
 =?utf-8?B?SUtiRjRoZ3BpTkNPVmJ5VUR3MnNzU3BrcnlJNlQ5bjJzUUNaRTBYQVpZcU1I?=
 =?utf-8?B?eFhBTC81QWJqcitOVW02NkNpSFFZUWdyR0xKSVduMEhsbloweG5ldG1OYWNo?=
 =?utf-8?B?U0NuRmdsb0E2WGdCSHBpTFd4SlBWclcweTFnc3dRR3RKRENaUzhBUk9lQ2Q2?=
 =?utf-8?B?NmxzZFdYRER5ZGw0cE9nbitSR2FndHE4VGNXS2kwQ1BqTXdIZWR5OFQxMGcv?=
 =?utf-8?B?aVNCVy9vdlhWRkVyTnpXRVNTSlk4OCsyWmpydFRQNXYxdU1ZcEQzMFViNWJs?=
 =?utf-8?B?aWtPbGh3RHhvUllRSUR6dllWYzdtejlFYkZWblVNcW5XTU5pbjNKUXgxYkR6?=
 =?utf-8?B?ZmJNZkgzaGw4ZkhpNExURFpEQUlzMnhNUnR4aHVXdzdnTE5PbmRBOXVaUlJM?=
 =?utf-8?B?dUJDcndiUUE4aklmSU5tdDByNjc1bXVTODhuVGhkVWJQVWVsNisxaWQwZWla?=
 =?utf-8?B?TWdTaHBXZmRIbWMrVzhYaitLUU80U2dNR29QZlJSRkE2U2JFVm45NXE1MXFW?=
 =?utf-8?Q?beKVHC2AwUcP6GUVzE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1pNS1RqUlVoUkNMZEtsL2k3K2xKSGRFY1lXdW9zbUdNYmttS0NJdlpTaVZs?=
 =?utf-8?B?b2pUVmNBaWYzMVFmVFZlc3A2TmpHQ3JXSmc5S1N6anBBNDBlclBBUEJSRkVE?=
 =?utf-8?B?bVI3UTlOczhZd3ZvWjlMSzhmUXY5aDQ2RmdXMnFxbXlWUmFPdHI4bm9yazFX?=
 =?utf-8?B?L0tLdWpBeTM0bFl3Y2lJVFExa2ppb1hkc3RReGZQZWloOExyZjJiNEVodHZU?=
 =?utf-8?B?eVdEUkpzY09nZGY0VzU4NEZwdFJqVEJRaGtnQ1p1WkU3THNnVzA3QUZGbGdR?=
 =?utf-8?B?NVFvTk5EOEVkN0ZYc2x5S1RRWFk3MEJHMnd0aGgveFJKUzdUcU5rc1hIVmJI?=
 =?utf-8?B?QjQ5VWoydUlGZ2hpcy82U3R5TllXd0tXV1BaenluZU1kNTdSMDZBSXhYN2sw?=
 =?utf-8?B?SkJlS09xSHFTWU91VkU3cS94dFovT2orV3grWkZpVzBWZlMwdllxSkZGQXdD?=
 =?utf-8?B?VWpuZEQvOTBYd2JlRkhVNGJEWlZINnZIcDlYRG9MZnMvNy9nZUJhdHZBYkVP?=
 =?utf-8?B?K3c1NnEyNmxQZzNwcXVYVDlINE9qOEVPV1ExQm1LbjZ6d1JuZkNKWFZNcXVU?=
 =?utf-8?B?a21mdjVsc3hCak1NL1RiOE5lU2hKeW1UVWNiUUgvdkpReGh5YVRBWHIxYUZF?=
 =?utf-8?B?V2kvS1ZHWFYyQVNwWUczWlZqWVhQeDVldC85dGNRU29hM3Z6eUJUR05qVi9V?=
 =?utf-8?B?WE04bnJIKzlLWGkveUtrNlBNVWp5Q3NxMzgwdHNib1ZCdXJTY3hhOWxBdmF5?=
 =?utf-8?B?ZGcxM3BJVFpQV015TFQ1Z1ViL3d4d2NGK2dxUDVscHFTblhlblpMY0kzN2hp?=
 =?utf-8?B?dkZmaW41V3JoRVJJS29WWGc3RElaUTk2Qk9tVHhoZmd5V0c1a21GOVd2anh0?=
 =?utf-8?B?SVJ4L3JxNG12NzlsTUpEWWN0ODR1VFU4NFJFTnFRSkxTaVRFTUNLdTZOV3dI?=
 =?utf-8?B?c0JiSnFlelhNS0d3d3JXbXk1dURJTDJ0NjQ2N1RlV25yakZEY25UOG0yTmtD?=
 =?utf-8?B?QndQRDFHSThWZ01vUTVsTVZZRkpBWEdNKy8rem54OVFJdzVicld2SGRKY2tv?=
 =?utf-8?B?a3JxUFdaQlRDd1RuZDhLQXVrdmJ5YUQ4UlFad1FUUzRzV29COVlIV0R5UVpW?=
 =?utf-8?B?V1k5S2x3d0h6UU94VFRIT0lQbFdLM1QvenZUa3ozUjd6d3hNYVNicG45OG15?=
 =?utf-8?B?M2VEa0JXK3BaM0NsNzE3NHcvV21JTFJ3aUd3QW5JMDBBdkpuWVZlV0hkN0Rz?=
 =?utf-8?B?RnpJeUNsenUwN1UvZzlGZ1BoajVXRlZKRjQ0dUpMZDBpbkc0YjMwSk1SQTkz?=
 =?utf-8?B?YlZFZmI4K3hBMDlic0NtNlRJSWNJaGc5Tjk4dmZXSGdKS2N0VTlUN3Vxa0xK?=
 =?utf-8?B?a3I0S1h1ZlkrMC9RRHZiUGxPa1dGZnI3MFdreDl2QjdrQXgyV29KODJiVmYr?=
 =?utf-8?B?VjRuZzNuc3Q4RFozTzMyZjhDZG8xY2JJMGNmeE5uaWI4ekl3c0FFZHZmYTRU?=
 =?utf-8?B?QmxXVnZrT3VxVVBidEZYSDI3c3Z0SUNrWTI1OFNsOVp4c3B6Q2xyV3FGc3RZ?=
 =?utf-8?B?Z1Jjd3ZwUEo5QXlpTGM0STJaVlpXOVcvWjlZOU9pTVBiZy93c1FTdjZLSXZI?=
 =?utf-8?B?SThmbDByV3ZOaWF1d1dLYWZtUUREVUh3TDhGWWs4L2NKT0U0Zm9SRFo4alUz?=
 =?utf-8?B?SERIUUtuVDlpVEJJZXM4cVIrTEdRZnJqOU13cE9hSzhTd0hocVdXbXNEOTA5?=
 =?utf-8?B?d2V6RFgrYUZlV05wNVhNQ1lid01RRkUwM2J5RzdGM213Rmt2R09vSS9FWWNu?=
 =?utf-8?B?RzA1WXU4VVA4clczRkd0NEF0S1pQTlk5VDRGcUdiQkl4WkUxNmpxenAxSCtT?=
 =?utf-8?B?NHpNdXcxczdMSUZDL1hRNHpwZlExZFFTOHR1ZVVYWEkyNzNBbUdsWlZyL0Zz?=
 =?utf-8?B?MytUZE5PcFh2bWZVSlEvdERPakdNUktZd29TQXBzT2Y0bjZzbzRlQlcyZGIz?=
 =?utf-8?B?dnp6ZFIvb1BQSy9OS3hMS3phSzJoS0Fubm5lTmtNek84MWJmclN2aCtpWnBJ?=
 =?utf-8?B?S21nSkFPZTNYTGdwOUFHeFBjdzE5MDRraTlGS1drdU1QclE4TTZUNW92UnFV?=
 =?utf-8?B?UU9aeld0ekZMSE9sYVFIM1NuQjNhSS9tcDBvZlU4SDVaRkZiRmJDYkd5WGJm?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c171eae-052d-44c1-3a07-08dd0871a984
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 08:10:42.7194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvpny+7uE3/FU5PqfVkw43GVxDbk1xBzXgFVWzpIBYRXQ1qkkqAK/X0co6o8E5ZDf0rCnFDyf4Lt8Dag8+LfgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4825
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


W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
> Add read and write pagefault tests to xe_eudebug_online that checks if a
> pagefault event is submitted by the KMD debugger when a pagefault occurs.
>
> Test that read (load instruction) and write(store instruction) attempt to
> load or store access to unallocated memory, causing a pagefault.
> Examine the address causing the page fault and the number of eu threads
> causing the pagefault.
>
> Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 219 +++++++++++++++++++++++++++++++-
>   1 file changed, 215 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 0ef0d8093..eae0eb520 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -36,6 +36,8 @@
>   #define BB_IN_VRAM			(1 << 11)
>   #define TARGET_IN_SRAM			(1 << 12)
>   #define TARGET_IN_VRAM			(1 << 13)
> +#define SHADER_PAGEFAULT_READ		(1 << 14)
> +#define SHADER_PAGEFAULT_WRITE		(1 << 15)
>   #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
>   #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>   #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
> @@ -45,6 +47,7 @@
>   #define TRIGGER_RESUME_DSS		(1 << 30)
>   #define TRIGGER_RESUME_ONE		(1 << 31)
>   
> +#define SHADER_PAGEFAULT	(SHADER_PAGEFAULT_READ | SHADER_PAGEFAULT_WRITE)
>   #define BB_REGION_BITMASK	(BB_IN_SRAM | BB_IN_VRAM)
>   #define TARGET_REGION_BITMASK	(TARGET_IN_SRAM | TARGET_IN_VRAM)
>   
> @@ -61,6 +64,8 @@
>   #define CACHING_VALUE(n)	(CACHING_INIT_VALUE + (n))
>   
>   #define SHADER_CANARY 0x01010101
> +#define BAD_CANARY 0xf1f1f1f
> +#define BAD_OFFSET (0x12345678ull << 12)
>   
>   #define WALKER_X_DIM		4
>   #define WALKER_ALIGNMENT	16
> @@ -123,6 +128,9 @@ static int get_number_of_threads(uint64_t flags)
>   	if (flags & SHADER_MIN_THREADS)
>   		return 16;
>   
> +	if (flags & SHADER_PAGEFAULT)
> +		return 16;
> +
>   	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
>   		     TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | SHADER_CACHING_VRAM))
>   		return 32;
> @@ -179,6 +187,16 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   			gpgpu_shader__common_target_write_u32(shader, s_dim.y + i, CACHING_VALUE(i));
>   		gpgpu_shader__nop(shader);
>   		gpgpu_shader__breakpoint(shader);
> +	} else if (flags & SHADER_PAGEFAULT) {
> +		if (flags & SHADER_PAGEFAULT_READ)
> +			gpgpu_shader__read_page_fault(shader, BAD_OFFSET);


The name of the functions seems incorrect, it is bad offset which makes 
page_fault.

So at least  gpgpu_shader__read_offset, maybe gpgpu_shader__test_read ???


> +		else if (flags & SHADER_PAGEFAULT_WRITE)

No need of "if (...)" - it suggests there should be another 'else' which 
is not true.


> +			gpgpu_shader__write_offset(shader, BAD_OFFSET, BAD_CANARY);
> +
> +		gpgpu_shader__label(shader, 0);
> +		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
> +		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
> +		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>   	}
>   
>   	gpgpu_shader__eot(shader);
> @@ -217,6 +235,17 @@ static int count_set_bits(void *ptr, size_t size)
>   	return count;
>   }
>   
> +static int
> +eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, uint32_t size)
> +{
> +	int count = 0;
> +
> +	for (int i = 0; i < size / 4 ; i++)
> +		count += igt_hweight(a[i] ^ b[i]);
> +
> +	return count;
> +}
> +
>   static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, uint32_t value)
>   {
>   	int count = 0;
> @@ -636,7 +665,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
>   		}
>   	}
>   
> -	if (d->flags & SHADER_LOOP) {
> +	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
>   		uint32_t threads = get_number_of_threads(d->flags);
>   		uint32_t val = STEERING_END_LOOP;
>   
> @@ -746,6 +775,43 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>   			data->single_step_bitmask[i] &= ~att->bitmask[i];
>   }
>   
> +static void eu_attention_resume_pagefault_trigger(struct xe_eudebug_debugger *d,
> +						  struct drm_xe_eudebug_event *e)
> +{
> +	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;


att = igt_container_of(e, att, base);

> +	struct online_debug_data *data = d->ptr;
> +	uint32_t bitmask_size = att->bitmask_size;
> +	uint8_t *bitmask;

In safe world could be:

uint8_t bitmask[att->bitmask_size];
your approach seems safer, however.

> +
> +	if (data->last_eu_control_seqno > att->base.seqno)
> +		return;
> +
> +	bitmask = calloc(1, att->bitmask_size);
igt_assert(bitmask);
> +
> +	eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
> +		       att->lrc_handle, bitmask, &bitmask_size);
> +	igt_assert(bitmask_size == att->bitmask_size);
> +
> +	pthread_mutex_lock(&data->mutex);
> +
> +	if (d->flags & SHADER_PAGEFAULT) {
> +		uint32_t threads = get_number_of_threads(d->flags);
> +		uint32_t val = STEERING_END_LOOP;
> +
> +		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
> +				     data->target_offset + steering_offset(threads)),
> +			      sizeof(uint32_t));
> +		fsync(data->vm_fd);
> +	}
> +	pthread_mutex_unlock(&data->mutex);
> +
> +	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
> +						    att->exec_queue_handle, att->lrc_handle,
> +						    bitmask, att->bitmask_size);
> +
> +	free(bitmask);
> +}
> +
>   static void open_trigger(struct xe_eudebug_debugger *d,
>   			 struct drm_xe_eudebug_event *e)
>   {
> @@ -1015,7 +1081,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	struct intel_bb *ibb;
>   	struct intel_buf *buf;
>   	uint32_t *ptr;
> -	int fd;
> +	int fd, vm_flags;
>   
>   	metadata[0] = calloc(2, sizeof(*metadata));
>   	metadata[1] = calloc(2, sizeof(*metadata));
> @@ -1025,7 +1091,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	fd = xe_eudebug_client_open_driver(c);
>   
>   	/* Additional memory for steering control */
> -	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
> +	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
>   		s_dim.y++;
>   	/* Additional memory for caching check */
>   	if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & SHADER_CACHING_VRAM))
> @@ -1045,7 +1111,11 @@ static void run_online_client(struct xe_eudebug_client *c)
>   							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
>   							   2 * sizeof(*metadata), metadata[1]);
>   
> -	create.vm_id = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
> +	vm_flags |= c->flags & SHADER_PAGEFAULT ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +
> +	create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
> +
>   	xe_eudebug_client_exec_queue_create(c, fd, &create);
>   
>   	ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, create.vm_id, bb_offset, bb_size,
> @@ -1245,11 +1315,14 @@ match_attention_with_exec_queue(struct xe_eudebug_event_log *log,
>   static void online_session_check(struct xe_eudebug_session *s, int flags)
>   {
>   	struct drm_xe_eudebug_event_eu_attention *ea = NULL;
> +	struct drm_xe_eudebug_event_pagefault *pf = NULL;
>   	struct drm_xe_eudebug_event *event = NULL;
>   	struct online_debug_data *data = s->client->ptr;
>   	bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
>   	int sum = 0;
>   	int bitmask_size;
> +	int pagefault_threads = 0;
> +	uint32_t *ptr = NULL;
ptr can be defined in else clause.
>   
>   	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
>   					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
> @@ -1265,6 +1338,16 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
>   			igt_assert_eq(ea->bitmask_size, bitmask_size);
>   			sum += count_set_bits(ea->bitmask, bitmask_size);
>   			igt_assert(match_attention_with_exec_queue(s->debugger->log, ea));
> +		} else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
> +			uint32_t after_offset = bitmask_size / sizeof(uint32_t);
> +			uint32_t resolved_offset = bitmask_size / sizeof(uint32_t) * 2;
> +
> +			pf = (struct drm_xe_eudebug_event_pagefault *)event;
> +			ptr = (uint32_t *) pf->bitmask;
> +			igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
> +			pagefault_threads += eu_attentions_xor_count(ptr + after_offset,
> +								     ptr + resolved_offset,
> +								     bitmask_size);
>   		}
>   	}
>   
> @@ -1279,6 +1362,9 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
>   		igt_assert(sum > 0);
>   	else
>   		igt_assert(sum == 0);
> +
> +	if (flags & SHADER_PAGEFAULT)
> +		igt_assert(pagefault_threads > 0);
>   }
>   
>   static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
> @@ -1302,6 +1388,55 @@ static void ufence_ack_set_bp_trigger(struct xe_eudebug_debugger *d,
>   	}
>   }
>   
> +static void pagefault_trigger(struct xe_eudebug_debugger *d,
> +			      struct drm_xe_eudebug_event *e)
> +{
> +	struct drm_xe_eudebug_event_pagefault *pf = (void *) e;
> +	int before_threads, after_threads, resolved_threads, pagefault_threads;
> +	uint32_t attn_size = pf->bitmask_size / 3;
> +	uint32_t *ptr = (uint32_t *) pf->bitmask;
> +	uint32_t offset, before_offset = 0;
> +	uint32_t after_offset = attn_size / sizeof(uint32_t);
> +	uint32_t resolved_offset = attn_size / sizeof(uint32_t) * 2;
> +
> +	before_threads = count_set_bits(ptr + before_offset, attn_size);
> +	after_threads = count_set_bits(ptr + after_offset, attn_size);
> +	resolved_threads = count_set_bits(ptr + resolved_offset, attn_size);
> +
> +	pagefault_threads = eu_attentions_xor_count(ptr + after_offset,
> +						    ptr + resolved_offset,
> +						    attn_size);
> +
> +	igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
> +		  "resolved=%d, pagefault=%d] "
> +		  "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d], "
> +		  "pagefault_address[0x%llx]\n",
> +		  pf->base.seqno, before_threads, after_threads, resolved_threads,
> +		  pagefault_threads, pf->client_handle, pf->exec_queue_handle,
> +		  pf->lrc_handle, pf->bitmask_size,
> +		  pf->pagefault_address);
> +
> +	for (int idx = 0; idx < 3; idx++) {
> +		if (idx == 0) {
> +			igt_debug("=== Attentions before ===\n");
> +			offset = before_offset;
> +		} else if (idx == 1) {
> +			igt_debug("=== Attentions after ===\n");
> +			offset = after_offset;
> +		} else {
> +			igt_debug("=== Attentions resolved ===\n");
> +			offset = resolved_offset;
> +		}
> +
> +		for (uint32_t i = 0; i < attn_size / sizeof(uint32_t); i += 2)
> +			igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
> +				  ptr[offset + i], ptr[offset + i + 1]);
> +	}

I have impression we can put most of it into arrays, and drop *_offset, 
kind of:

int attn_size_32 = attn_size / sizeof(uint32_t);

uint32_t *ptrs[3] = {ptr, ptr + attn_size_32, ptr + 2 * attn_size_32];
int threads[3];
const char * const name[3] = { "before", "after", "resolved" };

for (int idx = 0; idx < 3; idx++)
	threads[i] = count_set_bits(ptr[i], attn_size);

...
for (int idx = 0; idx < 3; idx++) {
	igt_debug("=== Attentions %s ===\n", name[idx]);
	for (...)
		igt_debug(..., ptr[idx][i]...);
}


Regards
Andrzej

> +
> +	igt_assert(pagefault_threads > 0);
> +	igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
> +}
> +
>   /**
>    * SUBTEST: basic-breakpoint
>    * Description:
> @@ -1383,6 +1518,77 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
>   	online_debug_data_destroy(data);
>   }
>   
> +/**
> + * SUBTEST: pagefault-read
> + * Description:
> + *     Check whether KMD sends pagefault event for workload in debug mode that
> + *     triggers a read pagefault.
> + *
> + * SUBTEST: pagefault-write
> + * Description:
> + *     Check whether KMD sends pagefault event for workload in debug mode that
> + *     triggers a write pagefault.
> + */
> +static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
> +				  int flags)
> +{
> +	struct xe_eudebug_session *s;
> +	struct online_debug_data *data;
> +	uint32_t val;
> +
> +	data = online_debug_data_create(hwe);
> +	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
> +
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
> +					open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
> +					exec_queue_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_debug_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_resume_pagefault_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
> +					create_metadata_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +					ufence_ack_trigger);
> +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
> +					pagefault_trigger);
> +
> +	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
> +	xe_eudebug_debugger_start_worker(s->debugger);
> +	xe_eudebug_client_start(s->client);
> +
> +	/* wait for workload to start */
> +	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> +		/* collect needed data from triggers */
> +		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
> +			continue;
> +
> +		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
> +			if (val != 0)
> +				break;
> +	}
> +
> +	pthread_mutex_lock(&data->mutex);
> +	igt_assert(data->client_handle != -1);
> +	igt_assert(data->exec_queue_handle != -1);
> +
> +	pthread_mutex_unlock(&data->mutex);
> +
> +	xe_eudebug_client_wait_done(s->client);
> +
> +	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> +
> +	xe_eudebug_event_log_print(s->debugger->log, true);
> +	xe_eudebug_event_log_print(s->client->log, true);
> +
> +	online_session_check(s, s->flags);
> +
> +	xe_eudebug_session_destroy(s);
> +	online_debug_data_destroy(data);
> +}
> +
>   /**
>    * SUBTEST: preempt-breakpoint
>    * Description:
> @@ -2344,6 +2550,11 @@ igt_main
>   	igt_subtest("breakpoint-many-sessions-tiles")
>   		test_many_sessions_on_tiles(fd, true);
>   
> +	test_gt_render_or_compute("pagefault-read", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
> +	test_gt_render_or_compute("pagefault-write", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
> +
>   	igt_fixture {
>   		xe_eudebug_enable(fd, was_enabled);
>   

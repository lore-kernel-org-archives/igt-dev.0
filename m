Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B4CC83038
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 21:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B8910E643;
	Tue,  1 Jul 2025 21:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ak11WJgb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FB610E66E
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751403643; x=1782939643;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=nrzXMTBViqxwQGNTaG2Z/oG6luZdTS3rdFRollRfCJY=;
 b=Ak11WJgbJqtdOQ8NfD/+1fxkief6fgJ/i/Dntu82IcE0fXkrvtA1usoc
 W70M60L6ZqRqX92XaLvcabN9ktNpYqXNkMfJ0XioU3uQKzXlrptTNusTA
 h3/yCdD5Q5+CMWg5T1y+jzQWa+PEcvPr/K7Qe/rdEfTthSdmXz+0Na47R
 MuL0Nm6EEImsNmIHB4rSF704F1eFgB6LSIrNJ3dSn3JxISJjSh94+KViW
 aeDomTUYDKjqFrxy1u7jVJU63WagQ7Ck/xFTgCYVsGmwsfWPsR4g4rzHH
 mI28g3Dxf/ISJBl9jxDMkWXOvVCLNRQ2klN3J+JyVqPr4PAdlOnrxITF8 g==;
X-CSE-ConnectionGUID: yPMsS+HwTVO/mKy052qGIQ==
X-CSE-MsgGUID: j5tFw+i5Q8WYWYjwcJTEiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65141780"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208,217";a="65141780"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:00:42 -0700
X-CSE-ConnectionGUID: bymACHf6QZaq+1xjSDKHEg==
X-CSE-MsgGUID: z480VXFKQeS/TsSD3uqBow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
 d="scan'208,217";a="158439454"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:00:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:00:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 14:00:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:00:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqdp8pdjcbbt4h0NPmJ5loAkRjhcgOeW3nUcFPTEgBYajcDR31I43+rusmEQZGYg5lL4e3c+spZQe4jPEOpxXGCuE2TOgdFvQXHk/yfKtewtn8JBcyK09fYjhfTXooVdNGs7TYaXYxyaLYQuuvGBdUhrQo5QrmCURVfH3AFSWzryFVGqqEEy89Dv/iIvbV4NoxOzQNIpuCcSTyMcdNsue72tv+dq3+N4THu8XBb9qsE9Mn45uOXzEEwN26YUivz0MTqEZSdr63UcZxbkXDNOWfiq3C9cVcCe5j7WeieSSw2CVjWBNiNb2qebpv3dW5J4KnblKqrFcHBu6J9Dkq1f3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgN1aDwERK5T4fI7xFbbEK0YbpiHfFuOsVEbipm6HZM=;
 b=jCb6LBB86MmS0PqGD7KxauZMzy6nwtH0EtZw9DxAwNydh62mxFHuSSDYvSf92QiQduI5cfKRvwu3VhJrUjHVdOjfnQ4FlfiBc3U8M6quwM5rnAKRS0j3raH9B1U59XFZ5zVq3z8kwr18DTnrpqIFnX2IHFMTUwVsDDPU90GjO1wGLvDOTLBAbwXLUiudGBnMK9t4Yc4mQouIeoZkLfPgTaMXCtDzqBXRaMAjIg4Sse3F/LzINvUUS+lWn07HyHg5BHgDf8/xBws/byyMAVOTJ5ervMMlteiJ6PqPWP4oOlWf+v7a09NXGEMBX/H/u24MAtR8ImDF8BpCijGEmdluEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 21:00:38 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 21:00:37 +0000
Content-Type: multipart/alternative;
 boundary="------------EjicbwUAvaJiKjO0AJG4haH7"
Message-ID: <9a97c054-e358-4433-ae33-e6bc2b7b69ad@intel.com>
Date: Wed, 2 Jul 2025 02:30:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] [PATCH v1 2/2] tests/intel/kms_pm_vrsr: Add test to
 validate VRAM Self Refresh
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250623191230.66611-1-mohammed.thasleem@intel.com>
 <20250623191230.66611-3-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250623191230.66611-3-mohammed.thasleem@intel.com>
X-ClientProxiedBy: MAXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::26) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH0PR11MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: b60eca7b-86b5-4295-e155-08ddb8e25460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEdVWVEvTEZoSkNNUjBwbHRCY2p6QUNWaEwxaGxEdkJjVGV2dE5ZdUM2aFZG?=
 =?utf-8?B?K3NFd1pXcnQ5WkR1cFZHWEh1L0d2VklLVWhkeFk3NHlyUUFMRFQ1MU5ndnJQ?=
 =?utf-8?B?c2xuUnpGcW01QjFsdHNmUlh2eGV2Rmk1KzQrckhrRTFqSTVZTnpDbHFubnR4?=
 =?utf-8?B?QlVMclhOeGlYTTkyZTBzdWk4dXZEa0h0RU16VktqV25iQ0o4WDh4WFBQODJh?=
 =?utf-8?B?clBCMmFmM2x2a3hNR1Y0NkpiUWFVYk1TRzdpNCtMQXovSnNHRlp5MXlwUGs1?=
 =?utf-8?B?MmdFMnZvRmtmaEFxVVMrUlhXQmNLbTNnVHlUS01FNXVZTVIrN3ZIREc2YkFX?=
 =?utf-8?B?M0lTbDk1NEsrcENIKzgwYjZHb2Q3VERLSHJYcG40UWdTQzRNa05vdmY3WG51?=
 =?utf-8?B?MTFqQTc2Rk5WQjNpSFJwUE1wcXhSdkZjU2JBQ2w5VVZmekExbnRFdGhlNUZ6?=
 =?utf-8?B?amJGbVovZ3NYeGhsazcwOW15RExpRDZReHZ3ZUV0bFZIdzJoV2ZQcnR5WFR3?=
 =?utf-8?B?QThkUkFRUFM4TitwUUhCL1p0YkNSZ2dmc0pBUTVNcDRTa3gxZ3hHQ2twTThS?=
 =?utf-8?B?dFI5WkpvdnB6L1liRXJqY3d1Z3pCK0RnNGNFbmRZdS9vTkFZTnpVQ0s0dm9m?=
 =?utf-8?B?cDNOeWZTRkkxaVJ0SmJOcHA2R1R3WTlnc2szQzVBS1RyU1gwYytPZGRPdGxn?=
 =?utf-8?B?bWIzQno1VXRVWXF1ZVNQeFYvUEgrVUhQSG9jQzM3Zm54THJ3RUhrc05rR1Vv?=
 =?utf-8?B?QVgwOTdJK0JtUW1wbEY1WW1nNlJmRnpteWpIMWVHSVFMTlJVWU5weE0rRTBZ?=
 =?utf-8?B?MnNOWlREN1VGUkl0Y0JZQXpFeW5jQ3Vmb3VzR3BVVFdyVTlHRksrWWwraXRh?=
 =?utf-8?B?azZGeTE0ZVpnaThGWDBNK2IzRXNUTHJCYVI3VU02MGFxek9vL20xVi9ibVdr?=
 =?utf-8?B?K0g0MXlacnN4Tkk5VXFzNjZRVGZnT1ZRRU1tWXRJdGJsSnRYOFdwR2huaU90?=
 =?utf-8?B?c041Q2pITlpSU245YnFaTHpsZStnOUViWkdDU2lNWndjT3p3S3RzakZrMTRM?=
 =?utf-8?B?NTNtNVVkdWNGdmNaRUJ4SFJxd090U3lJTlA5ZVJqYlRoUjc3WXg5QzlQSXFC?=
 =?utf-8?B?NytlNkx5bW1tNzVmOWozNEkrR2pMb2Ixa2dXSjJCTXBHdVY0U1JBZ1pnOC9J?=
 =?utf-8?B?NEw2ZjQ3bXpnOVJ1WGt6NGpxbUIyeG44dzhyMW1jcU9UcTBsWWwyRHN3M1FN?=
 =?utf-8?B?Y3lRRjBUbFpJcjBpc3ZOL0tMKzJuRktwa09GcEFoejQ0NldvWFQ2NzhCcnRv?=
 =?utf-8?B?RlRYWjZiZ0I0aXVuWktTUFJBNGVYT1Y1UEJYeDlaT1ovY1lONWRCaHlselBV?=
 =?utf-8?B?YURxTHR1OCtEQnNzcmV4aGxSMXNqSDBQYUlvby9Xd3A5a3dESXpzZGcrYUZr?=
 =?utf-8?B?b3RMRjdBSk1mVENodlBQVjkyeDdLYWt5SmZmYjQyakNRNjFYZGRpRzJxVTdW?=
 =?utf-8?B?UGVHZk5KNFRIZGs2NndnTzhrUjg5NmxvdU5YL1RiVGNFUUZVd0FYbTEzdk9o?=
 =?utf-8?B?SU90TEdzTUhJMm1sZ3Z3V0s0S1NPYVhCbU53VXEwUjV1eEprVVE1N0NqV2dv?=
 =?utf-8?B?RmhOZEVtc28rSDNLQlo3UWpwV1JtOHRHbVBSRW5sdWZHSDlEdjc2azd3SGZt?=
 =?utf-8?B?bGtHM3AxSTdCK0RyZkRzK2d5eXVnWVRjbUJWcXp0eVR1aUpUVmRvbTlaczQv?=
 =?utf-8?B?dzRVeVhhd2pmS3d2OVRyR3FPV09Wc3VPcGY2SGRGZ1RLWnpIV1V0TWxadWEw?=
 =?utf-8?B?VXhXVm9kZlErOGVURm9LSmVIUEJ0SjA2RnVOWmlTQlQrdHZzRFptWDVaK3Bh?=
 =?utf-8?B?Nkg1aWtYRE9hei9vNjh4ZUtvVHpMb2dLUXZTRDUrelY5eWFFVVY3eDhrY1V3?=
 =?utf-8?Q?WUSkB4UYgf0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWZ5b2VkL3UwTWs1MjZqY09XOXFDU0RFREZ3M0ozUmV4Z09oZWROYkZ3OUhu?=
 =?utf-8?B?VWZYQUVpQ1ZIeFVCd0VHTnhsTnRxUVZsWTRFa2JCZVlrcEZQdExReUIySlNi?=
 =?utf-8?B?STNRbGZXZXBra2IxWVVKRnh1aTJGZXF2Qy9zdFpEdTJpN1VPRFJmZTlzUFFs?=
 =?utf-8?B?QWxsbklndGNzaWkySFhSa2pSbnFhQ0hDQVVUL0JGVmUxQWJ6UnpScHZTcmYw?=
 =?utf-8?B?NDBGQ0hjTmVwR3RXZHFKTzMvK1VaT0dYcnFDbGJSa2ZwQUVjUjlNc0dlTVZu?=
 =?utf-8?B?OEVSOFNWZS9qVWxIMEdjcU5tNldCY0hjTDJoQVk4anNlYXk4OHY5V3F4U0Zo?=
 =?utf-8?B?OE5RZ1c5MFZtOGZJTE12TGw4dGdMSkxFZEdtR0ZwR3VBVkovaHRsM2dMTmZH?=
 =?utf-8?B?VSsrQ09jQ0F2a2paZVdLQUZTZ0FLbGlISW5EeWVibEFzQ2RueVgyeGU4Tk9O?=
 =?utf-8?B?MnpsVUs5M29TOFh5VjN3V3F2ZmtoRXdmMk9oczhsVXM3WnllM1pxYW1TSndB?=
 =?utf-8?B?c2ZtSW5jVjVUaWVWcVNham5DcHN1WU43Tjh1MWVkMjhoSTZjU3pxYWliSE1Z?=
 =?utf-8?B?NE84TGFGRjRtUUFaZTFXdWdjRG9ySnJCL0pobkcrRFRUTEw2d3ZBV0RpbzFP?=
 =?utf-8?B?VGVHOXVYY2tWZDdRbWNzZnhGd3NpMFdBY00vNEptTGZXMlBGdFR6clVaMVFI?=
 =?utf-8?B?Q0V6eDVhdnNNMEhmcmUzWVV1ZVdTTzJicVhuclZMQ2s5VHR6SFN5Wmk0eTFj?=
 =?utf-8?B?NFUxTW1KL1Z2RENLMWJhWHZpRUNHeTN3V2FBTEpEa0VzazRtRERiVytDbVdl?=
 =?utf-8?B?K2lDbjl3VHVOL0trcUlSUmZKYjgvUEVTMmd6bTZOMGV1RXhZcE1nT1cyb3cr?=
 =?utf-8?B?Z2JwZW80OEREMU4xSVZXK2NZVGFLVXBoeFcxTXRJeVBlc0NKRFZrRXpFaldS?=
 =?utf-8?B?ekVxUHU0eURSdFkyOEJRdTRNZU1JUklGUjVZdHh1YWVjbWE1dk5nMVdPM2lt?=
 =?utf-8?B?ajNsb0Uzc1ovVkUzQXFBcGp4eDd0TFlZL0VlalcweW95bFVXQTJCR3o3MHJp?=
 =?utf-8?B?cTRPUGhIanM1N25XYTV1SnlWNTgwM1pLcWoybGtxRmViQkJlQ1pVeW1JVTRi?=
 =?utf-8?B?eG9YQWprWkxUL1JZWjZldHN1Z1lKWUtKcERVWVVlUmJNU0NZcHFkcFpJemxj?=
 =?utf-8?B?MjBzNDNPL0JTeW41NVkzNHpqWmt0ZnYxL3RTU21yMFYwSS9BS3hxOWd2YXNB?=
 =?utf-8?B?amFPUzdEK2FMWk53RTNHT1h5RGhWbnBZWUk4OUNyUWFBcHlzZkl0dUVYQ2Iv?=
 =?utf-8?B?Q0tScnNybnBwU24xR090eVBreGlQSXVQK09CejBEUk04VFB4cFB6NStwcytF?=
 =?utf-8?B?dmg1bnEzbU9tZEdHSXYrNFZKZFNBUS8wN3RtazEyZmpVcUpFczFsZVBQVCtJ?=
 =?utf-8?B?VHdmOUlJQVU3ckw0MlV3dEF6bWtRVGFiTnQ2WnVYMUh6RmxRVi9JWmZxNndZ?=
 =?utf-8?B?Q0ZPU0lwemY3NHQwUHYxZHRuUTJaNUpIcWprSjc4dFN5Y3V3OWxiZXhIcHVK?=
 =?utf-8?B?YVZVWnFmbkV2NHkzSjhFdUJmSzIrZlp3S3RIWmhXdUdreFRFM3Q5RzROWXJn?=
 =?utf-8?B?b2hZRWtnaW1sR1VvNUt2eDNqZGN3dVRHa1RrMWZsV3JhVmNLVDJiUk5rZkZT?=
 =?utf-8?B?U3c5VzN4RWNnYzBFSFlIU3ZyWTFMRzgrcUhsZFdMcjF4UUxjbG1qM2QrdnFz?=
 =?utf-8?B?cGNiLzc1TnFVRG9NNEFkV0xzQktRblJuZlFoWklDMmYyUHRoR0FQSG91endJ?=
 =?utf-8?B?TXBCUDNOU1VBaXlkeGdKbVdlajhMd1F0ZUt2QXpTekhxWjg3eVRPRU4vRXdh?=
 =?utf-8?B?N3ZoVW52T0hMa1VTa3kzUG1lclROZFE0ZXJ2N1pPaVIzekN2YW5yQXpaN0N0?=
 =?utf-8?B?ZHFjbVcxTVpWS3lyTnlGSVE1Y0swcWJzV3M2MnJQUmNKV3BFSTZqT3ozSEZP?=
 =?utf-8?B?TitNQndKQlhhOGVOSGd6RkJSQVdrdmVQUU5ZSDg5cWNkZ0F5dUNwVWRsdm1T?=
 =?utf-8?B?M0Y0T1dRRnVtRzJVelpkajBzd1ZJWnI3algrSkU2ekdudktiY1ZXcEVleEVF?=
 =?utf-8?Q?wBY+wzbR4nI8jIuusngZZP+zx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b60eca7b-86b5-4295-e155-08ddb8e25460
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 21:00:37.7943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Unp3x8tgLLwX+pI6VBiwg+GvapVQUW4M77P/NYGZAXn5OlTwtoRD9v7fga3QmdiRdpRkyogRluPldbVSB5oTOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
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

--------------EjicbwUAvaJiKjO0AJG4haH7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi,
Thasleem
On 24-06-2025 00:42, Mohammed Thasleem wrote:
> This patch adds a test for VRAM Self Refresh (VRSR), focusing on
> display flips and power management efficiency. It handles transitions
> between power states like D3Hot and D3Cold. The patch includes validation
> of VRAM residency and power state transitions, ensuring accurate testing
> of VRSR functionality.
>
> Signed-off-by: Mohammed Thasleem<mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_vrsr.c | 552 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 522 insertions(+), 30 deletions(-)
>
> diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c
> index 671621a66..954f31857 100644
> --- a/tests/intel/kms_pm_vrsr.c
> +++ b/tests/intel/kms_pm_vrsr.c
> @@ -15,6 +15,27 @@
>   
>   #include "igt.h"
>   #include "igt_sysfs.h"
> +#include "igt_device.h"
> +#include "igt_device_scan.h"
> +#include "igt_pm.h"
> +#include "intel_common.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
> +#define KMS_POLL_DISABLE 0
> +
> +#define MAX_N_EXEC_QUEUES 16
> +#define NO_SUSPEND -1
> +#define NO_RPM -1
> +
> +#define USERPTR (0x1 << 0)
> +#define PREFETCH (0x1 << 1)
> +#define UNBIND_ALL (0x1 << 2)
>   
>   /**
>    * SUBTEST: vram-self-refresh
> @@ -29,41 +50,60 @@ bool kms_poll_saved_state;
>   typedef struct {
>   	int fd_xe;
>   	int debugfs_fd;
> -	uint32_t devid;
> -	char *debugfs_dump;
> -	igt_display_t display;
>   	struct igt_fb fb_white;
>   	drmModeModeInfo *mode;
> +	igt_display_t display;
>   	igt_output_t *output;
> +	struct pci_device *pci_xe;
> +	struct pci_device *pci_root;
> +	char pci_slot_name[NAME_MAX];
> +	drmModeResPtr res;
>   } device_t;
>   
> -static void vram_self_refresh(device_t *device);
> +typedef struct {
> +	device_t device;
> +	struct drm_xe_engine_class_instance *eci;
> +	int n_exec_queues;
> +	int n_execs;
> +	enum igt_suspend_state s_state;
> +	enum igt_acpi_d_state d_state;
> +	unsigned int flags;
> +} child_exec_args;
> +
> +uint64_t orig_threshold;
> +int fw_handle = -1;
> +
> +static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
> +static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
> +static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
> +static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
> +static bool child_ready;
>   
>   static void display_fini(device_t *device)
>   {
>   	igt_display_fini(&device->display);
>   }
>   
> -static void setup_primary(device_t *device)
> +static void setup_primary(device_t device)
>   {
>   	igt_plane_t *primary;
>   
> -	primary = igt_output_get_plane_type(device->output,
> +	primary = igt_output_get_plane_type(device.output,
>   					    DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
> -	igt_create_color_fb(device->fd_xe,
> -			    device->mode->hdisplay, device->mode->vdisplay,
> +	igt_create_color_fb(device.fd_xe,
> +			    device.mode->hdisplay, device.mode->vdisplay,
>   			    DRM_FORMAT_XRGB8888,
>   			    DRM_FORMAT_MOD_LINEAR,
>   			    1.0, 1.0, 1.0,
> -			    &device->fb_white);
> -	igt_plane_set_fb(primary, &device->fb_white);
> -	igt_display_commit(&device->display);
> +			    &device.fb_white);
> +	igt_plane_set_fb(primary, &device.fb_white);
> +	igt_display_commit(&device.display);
>   }
>   
> -static void detect_primary_output(device_t *device)
> +static void detect_primary_output(device_t device)
>   {
> -	igt_display_t *display = &device->display;
> +	igt_display_t *display = &device.display;
>   	igt_output_t *output;
>   	enum pipe pipe;
>   
> @@ -79,47 +119,499 @@ static void detect_primary_output(device_t *device)
>   		if (!intel_pipe_output_combo_valid(display))
>   			continue;
>   
> -		device->output = output;
> -		device->mode = igt_output_get_mode(output);
> +		device.output = output;
> +		device.mode = igt_output_get_mode(output);
>   
>   		break;
>   	}
>   }
> -static void cleanup(device_t *device)
> +
> +static void dpms_on_off(device_t device, int mode)
> +{
> +	int i;
> +
> +	if (!device.res)
> +		return;
> +
> +	for (i = 0; i < device.res->count_connectors; i++) {
> +		drmModeConnector *connector = drmModeGetConnectorCurrent(device.fd_xe,
> +									 device.res->connectors[i]);
> +
> +		if (!connector)
> +			continue;
> +
> +		if (connector->connection == DRM_MODE_CONNECTED)
> +			kmstest_set_connector_dpms(device.fd_xe, connector, mode);
> +
> +		drmModeFreeConnector(connector);
> +	}
> +}
> +
> +/* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
> +static bool runtime_usage_available(struct pci_device *pci)
> +{
> +	char name[PATH_MAX];
> +
> +	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage",
> +		 pci->domain, pci->bus, pci->dev, pci->func);
> +	return access(name, F_OK) == 0;
> +}
> +
> +static uint64_t get_vram_d3cold_threshold(int sysfs)
> +{
> +	uint64_t threshold;
> +	char path[64];
> +	int ret;
> +
> +	sprintf(path, "device/vram_d3cold_threshold");
> +	igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_threshold is not present\n");
> +
> +	ret = igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
> +	igt_assert_lt(0, ret);
> +
> +	return threshold;
> +}
> +
> +static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
> +{
> +	char path[64];
> +	int ret;
> +
> +	sprintf(path, "device/vram_d3cold_threshold");
> +
> +	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
> +		ret = igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshold);
> +	else
> +		igt_warn("vram_d3cold_threshold is not present\n");
> +
> +	igt_assert_lt(0, ret);
> +}
> +
> +static bool setup_d3(device_t device, enum igt_acpi_d_state state)
> +{
> +	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> +		      "PCI power management capability not found\n");
> +
> +	dpms_on_off(device, DRM_MODE_DPMS_OFF);
> +
> +	/*
> +	 * The drm calls used for dpms status above will result in IOCTLs
> +	 * that might wake up the device. Let's ensure the device is back
> +	 * to a stable suspended state before we can proceed with the
> +	 * configuration below, since some strange failures were seen
> +	 * when d3cold_allowed is toggle while runtime is in a transition
> +	 * state.
> +	 */
> +	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
> +
> +	switch (state) {
> +	case IGT_ACPI_D3Cold:
> +		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
> +		igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
> +		igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
> +		return true;
> +	case IGT_ACPI_D3Hot:
> +		igt_pm_set_d3cold_allowed(device.pci_slot_name, 0);
> +		return true;
> +	default:
> +		igt_debug("Invalid D3 Selection\n");
> +	}
> +
> +	return false;
> +}
> +
> +static void cleanup_d3(device_t device)
> +{
> +	dpms_on_off(device, DRM_MODE_DPMS_ON);
> +}
> +
> +static bool in_d3(device_t device, enum igt_acpi_d_state state)
> +{
> +	uint16_t val;
> +
> +	/* We need to wait for the autosuspend to kick in before we can check */
> +	if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
> +		return false;
> +
> +	if (runtime_usage_available(device.pci_xe) &&
> +	    igt_pm_get_runtime_usage(device.pci_xe) != 0)
> +		return false;
> +
> +	switch (state) {
> +	case IGT_ACPI_D3Hot:
> +		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
> +						      &val, 0xd4), 0);
> +		return (val & 0x3) == 0x3;
> +	case IGT_ACPI_D3Cold:
> +		return igt_wait(igt_pm_get_acpi_real_d_state(device.pci_root) ==
> +				IGT_ACPI_D3Cold, 10000, 100);
> +	default:
> +		igt_info("Invalid D3 State\n");
> +		igt_assert(0);
> +	}
> +
> +	return true;
> +}
> +
> +#define MAX_VMAS 2
> +
> +static void*
> +child_exec(void *arguments)
> +{
> +	child_exec_args *args = (child_exec_args *)arguments;
> +
> +	uint32_t vm;
> +	uint64_t addr = 0x1a0000;
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	int n_vmas = args->flags & UNBIND_ALL ? MAX_VMAS : 1;
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> +	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> +	size_t bo_size;
> +	uint32_t bo = 0;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data;
> +	int i, b;
> +	uint64_t active_time;
> +	bool check_rpm = (args->d_state == IGT_ACPI_D3Hot ||
> +			  args->d_state == IGT_ACPI_D3Cold);
> +
> +	igt_assert_lte(args->n_exec_queues, MAX_N_EXEC_QUEUES);
> +	igt_assert_lt(0, args->n_execs);
> +
> +	if (check_rpm) {
> +		igt_assert(in_d3(args->device, args->d_state));
> +		active_time = igt_pm_get_runtime_active_time(args->device.pci_xe);
> +	}
> +
> +	vm = xe_vm_create(args->device.fd_xe, 0, 0);
> +
> +	if (check_rpm)
> +		igt_assert(igt_pm_get_runtime_active_time(args->device.pci_xe) >
> +			   active_time);
> +
> +	bo_size = sizeof(*data) * args->n_execs;
> +	bo_size = xe_bb_size(args->device.fd_xe, bo_size);
> +
> +	if (args->flags & USERPTR) {
> +		data = aligned_alloc(xe_get_default_alignment(args->device.fd_xe),
> +				     bo_size);
> +		memset(data, 0, bo_size);
> +	} else {
> +		if (args->flags & PREFETCH)
> +			bo = xe_bo_create(args->device.fd_xe, 0, bo_size,
> +					  all_memory_regions(args->device.fd_xe) |
> +					  vram_if_possible(args->device.fd_xe, 0),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		else
> +			bo = xe_bo_create(args->device.fd_xe, vm, bo_size,
> +					  vram_if_possible(args->device.fd_xe, args->eci->gt_id),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		data = xe_bo_map(args->device.fd_xe, bo, bo_size);
> +	}
> +
> +	for (i = 0; i < args->n_exec_queues; i++) {
> +		exec_queues[i] = xe_exec_queue_create(args->device.fd_xe, vm,
> +						      args->eci, 0);
> +		bind_exec_queues[i] = 0;
> +		syncobjs[i] = syncobj_create(args->device.fd_xe, 0);
> +	};
> +
> +	sync[0].handle = syncobj_create(args->device.fd_xe, 0);
> +
> +	if (bo) {
> +		for (i = 0; i < n_vmas; i++)
> +			xe_vm_bind_async(args->device.fd_xe, vm, bind_exec_queues[0], bo,
> +					 0, addr + i * bo_size, bo_size, sync, 1);
> +	} else {
> +		xe_vm_bind_userptr_async(args->device.fd_xe, vm, bind_exec_queues[0],
> +					 to_user_pointer(data), addr, bo_size, sync, 1);
> +	}
> +
> +	if (args->flags & PREFETCH)
> +		xe_vm_prefetch_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> +				     addr, bo_size, sync, 1, 0);
> +
> +	if (check_rpm) {
> +		igt_assert(in_d3(args->device, args->d_state));
> +		active_time = igt_pm_get_runtime_active_time(args->device.pci_xe);
> +	}
> +
> +	for (i = 0; i < args->n_execs; i++) {
> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr = addr + batch_offset;
> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr = addr + sdi_offset;
> +		int e = i % args->n_exec_queues;
> +
> +		b = 0;
> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +		data[i].batch[b++] = sdi_addr;
> +		data[i].batch[b++] = sdi_addr >> 32;
> +		data[i].batch[b++] = 0xc0ffee;
> +		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +
> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].handle = syncobjs[e];
> +
> +		exec.exec_queue_id = exec_queues[e];
> +		exec.address = batch_addr;
> +
> +		if (e != i)
> +			syncobj_reset(args->device.fd_xe, &syncobjs[e], 1);
> +
> +		xe_exec(args->device.fd_xe, &exec);
> +
> +		igt_assert(syncobj_wait(args->device.fd_xe, &syncobjs[e], 1,
> +					INT64_MAX, 0, NULL));
> +		igt_assert_eq(data[i].data, 0xc0ffee);
> +
> +		if (i == args->n_execs / 2 && args->s_state != NO_SUSPEND) {
> +			/* Until this point, only one thread runs at a given time. Signal
> +			 * the parent that this thread will sleep, for the parent to
> +			 * create another thread.
> +			 */
> +			pthread_mutex_lock(&child_ready_lock);
> +			child_ready = true;
> +			pthread_cond_signal(&child_ready_cond);
> +			pthread_mutex_unlock(&child_ready_lock);
> +
> +			/* Wait for the suspend and resume to finish */
> +			pthread_mutex_lock(&suspend_lock);
> +			pthread_cond_wait(&suspend_cond, &suspend_lock);
> +			pthread_mutex_unlock(&suspend_lock);
> +
> +			/* From this point, all threads will run concurrently */
> +		}
> +	}
> +
> +	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
> +				INT64_MAX, 0, NULL));
> +
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	if (n_vmas > 1)
> +		xe_vm_unbind_all_async(args->device.fd_xe, vm, 0, bo, sync, 1);
> +	else
> +		xe_vm_unbind_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> +				   addr, bo_size, sync, 1);
> +	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
> +				INT64_MAX, 0, NULL));
> +
> +	for (i = 0; i < args->n_execs; i++)
> +		igt_assert_eq(data[i].data, 0xc0ffee);
> +
> +	syncobj_destroy(args->device.fd_xe, sync[0].handle);
> +	for (i = 0; i < args->n_exec_queues; i++) {
> +		syncobj_destroy(args->device.fd_xe, syncobjs[i]);
> +		xe_exec_queue_destroy(args->device.fd_xe, exec_queues[i]);
> +		if (bind_exec_queues[i])
> +			xe_exec_queue_destroy(args->device.fd_xe, bind_exec_queues[i]);
> +	}
> +
> +	if (bo) {
> +		munmap(data, bo_size);
> +		gem_close(args->device.fd_xe, bo);
> +	} else {
> +		free(data);
> +	}
> +
> +	xe_vm_destroy(args->device.fd_xe, vm);
> +
> +	if (check_rpm) {
> +		igt_assert(igt_pm_get_runtime_active_time(args->device.pci_xe) >
> +			   active_time);
> +		igt_assert(in_d3(args->device, args->d_state));
> +	}
> +
> +	/* Tell the parent that we are ready. This should run only when the code
> +	 * is not supposed to suspend.
> +	 */
> +	if (args->n_execs <= 1 || args->s_state == NO_SUSPEND)  {
> +		pthread_mutex_lock(&child_ready_lock);
> +		child_ready = true;
> +		pthread_cond_signal(&child_ready_cond);
> +		pthread_mutex_unlock(&child_ready_lock);
> +	}
> +	return NULL;
> +}
> +
> +/*  Do one suspend and resume cycle for all xe engines.
> + *  - Create a child_exec() thread for each xe engine. Run only one thread
> + *    at a time. The parent will wait for the child to signal it is ready
> + *    to sleep before creating a new thread.
> + *  - Put child_exec() to sleep where it expects to suspend and resume
> + *  - Wait for all child_exec() threads to sleep
> + *  - Run one suspend and resume cycle
> + *  - Wake up all child_exec() threads at once. They will run concurrently.
> + *  - Wait for all child_exec() threads to complete
> + */
> +static void
> +test_exec(device_t device, int n_exec_queues, int n_execs,
> +		  enum igt_suspend_state s_state, enum igt_acpi_d_state d_state,
> +		  unsigned int flags)
> +{
> +	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> +				     SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +	struct drm_xe_engine_class_instance *eci;
> +	int active_threads = 0;
> +	pthread_t threads[65]; /* MAX_ENGINES + 1 */
> +	child_exec_args args;
> +
> +	xe_for_each_engine(device.fd_xe, eci) {
> +		args.device = device;
> +		args.eci = eci;
> +		args.n_exec_queues = n_exec_queues;
> +		args.n_execs = n_execs;
> +		args.s_state = s_state;
> +		args.d_state = d_state;
> +		args.flags = flags;
> +
> +		pthread_create(&threads[active_threads], NULL, child_exec, &args);
> +		active_threads++;
> +
> +		pthread_mutex_lock(&child_ready_lock);
> +		while (!child_ready)
> +			pthread_cond_wait(&child_ready_cond, &child_ready_lock);
> +		child_ready = false;
> +		pthread_mutex_unlock(&child_ready_lock);
> +	}
> +
> +	if (n_execs > 1 && s_state != NO_SUSPEND) {
> +		igt_system_suspend_autoresume(s_state, test);
> +
> +		pthread_mutex_lock(&suspend_lock);
> +		pthread_cond_broadcast(&suspend_cond);
> +		pthread_mutex_unlock(&suspend_lock);
> +	}
> +
> +	for (int i = 0; i < active_threads; i++)
> +		pthread_join(threads[i], NULL);
> +
> +	active_threads = 0;
> +}
> +
> +static uint64_t read_mods(device_t device)
> +{
> +	uint64_t mods_value;
> +	char buf[256];
> +	int ret;
> +	char *mods_ptr;
> +
> +	ret = igt_debugfs_simple_read(device.debugfs_fd, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
with the latest changes by Soham, the debugfs path has been updated, 
just use "dgfx_pkg_residencies".
> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
> +
> +	mods_ptr = strstr(buf, "Package ModS: ");
> +	if (mods_ptr)
> +		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n", &mods_value);
> +
> +	return mods_value;
> +}
> +
> +static void cleanup(device_t device)
>   {
>   	igt_plane_t *primary;
>   
> -	primary = igt_output_get_plane_type(device->output,
> +	primary = igt_output_get_plane_type(device.output,
>   					    DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
> -	igt_display_commit(&device->display);
> -	igt_remove_fb(device->fd_xe, &device->fb_white);
> +	igt_display_commit(&device.display);
> +	igt_remove_fb(device.fd_xe, &device.fb_white);
>   }
> -
> -
> -static void vram_self_refresh(device_t *device)
> +static void kms_poll_state_restore(int sig)
>   {
> -	detect_primary_output(device);
> -	setup_primary(device);
> -	cleanup(device);
> +	int sysfs_fd;
> +
> +	sysfs_fd = open(KMS_HELPER, O_RDONLY);
> +	if (sysfs_fd >= 0) {
> +		__igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
> +		close(sysfs_fd);
> +	}
>   }
>   
>   igt_main
>   {
> -	device_t device = {};
> +	device_t device;
> +	char buf[256];
> +	int sysfs_fd, ret;
> +	uint32_t d3cold_allowed;
> +	uint64_t mods_prev_value = 0, mods_curr_value = 0;
> +
> +	const struct s_state {
> +		const char *name;
> +		enum igt_suspend_state state;
> +	} s_states[] = {
> +		{ "s2idle", SUSPEND_STATE_FREEZE },
> +		{ NULL },
> +	};
> +	const struct d_state {
> +		const char *name;
> +		enum igt_acpi_d_state state;
> +	} d_states[] = {
> +		{ "d3hot", IGT_ACPI_D3Hot },
> +		{ "d3cold", IGT_ACPI_D3Cold },
> +		{ NULL },
> +	};
>   
>   	igt_fixture {
> -		device.fd_xe = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> +		memset(&device, 0, sizeof(device));
> +		device.fd_xe = drm_open_driver_master(DRIVER_XE | DRIVER_INTEL);
> +
> +		kmstest_set_vt_graphics_mode();
>   		device.debugfs_fd = igt_debugfs_dir(device.fd_xe);
>   		igt_require(device.debugfs_fd != -1);
> -		kmstest_set_vt_graphics_mode();
> -		device.devid = intel_get_drm_devid(device.fd_xe);
> +		igt_pm_enable_sata_link_power_management();
>   		igt_display_require(&device.display, device.fd_xe);
> +
> +		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
> +		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
> +		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
> +
> +		/* Always perform initial once-basic exec checking for health */
> +		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
> +
> +		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
> +		igt_assert(igt_setup_runtime_pm(device.fd_xe));
> +		igt_install_exit_handler(kms_poll_state_restore);
>   	}
>   
>   	igt_describe("This test validates display flips with vram self refresh");
>   	igt_subtest("vram-self-refresh") {
> -		vram_self_refresh(&device);
> +		detect_primary_output(device);
> +		setup_primary(device);
> +
> +		ret = igt_debugfs_simple_read(device.debugfs_fd, "vrsr_capable", buf, sizeof(buf));
> +		igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
> +
> +		igt_skip_on_f(!strstr(buf, "true"), "vrsr is not enabled.\n");
> +
> +		for (const struct s_state *s = s_states; s->name; s++) {
> +			for (const struct d_state *d = d_states; d->name; d++) {
> +				orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
please open the sysfs_fd before using it. Use : sysfs_fd = 
igt_sysfs_open(device.fd_xe);
> +				mods_prev_value = read_mods(device);
> +				set_vram_d3cold_threshold(sysfs_fd, 0);
same as above.
> +				igt_assert(setup_d3(device, d->state));
> +				test_exec(device, 1, 2, s->state, NO_RPM, 0);
> +				mods_curr_value = read_mods(device);
> +				set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
> +				igt_assert_f(mods_curr_value > mods_prev_value,
> +					     "Mods residency is inaccurate: %"PRIu64"\n", mods_curr_value);
> +				cleanup_d3(device);
> +			}
> +		}
> +		cleanup(device);
>   	}
>   
>   	igt_fixture {
BR,
Anirban
--------------EjicbwUAvaJiKjO0AJG4haH7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    Hi,<br>
    Thasleem
    <div class="moz-cite-prefix">On 24-06-2025 00:42, Mohammed Thasleem
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250623191230.66611-3-mohammed.thasleem@intel.com">
      <pre wrap="" class="moz-quote-pre">This patch adds a test for VRAM Self Refresh (VRSR), focusing on
display flips and power management efficiency. It handles transitions
between power states like D3Hot and D3Cold. The patch includes validation
of VRAM residency and power state transitions, ensuring accurate testing
of VRSR functionality.

Signed-off-by: Mohammed Thasleem <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>
---
 tests/intel/kms_pm_vrsr.c | 552 +++++++++++++++++++++++++++++++++++---
 1 file changed, 522 insertions(+), 30 deletions(-)

diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c
index 671621a66..954f31857 100644
--- a/tests/intel/kms_pm_vrsr.c
+++ b/tests/intel/kms_pm_vrsr.c
@@ -15,6 +15,27 @@
 
 #include &quot;igt.h&quot;
 #include &quot;igt_sysfs.h&quot;
+#include &quot;igt_device.h&quot;
+#include &quot;igt_device_scan.h&quot;
+#include &quot;igt_pm.h&quot;
+#include &quot;intel_common.h&quot;
+#include &quot;lib/igt_syncobj.h&quot;
+#include &quot;lib/intel_reg.h&quot;
+
+#include &quot;xe_drm.h&quot;
+#include &quot;xe/xe_ioctl.h&quot;
+#include &quot;xe/xe_query.h&quot;
+
+#define KMS_HELPER &quot;/sys/module/drm_kms_helper/parameters/&quot;
+#define KMS_POLL_DISABLE 0
+
+#define MAX_N_EXEC_QUEUES 16
+#define NO_SUSPEND -1
+#define NO_RPM -1
+
+#define USERPTR (0x1 &lt;&lt; 0)
+#define PREFETCH (0x1 &lt;&lt; 1)
+#define UNBIND_ALL (0x1 &lt;&lt; 2)
 
 /**
  * SUBTEST: vram-self-refresh
@@ -29,41 +50,60 @@ bool kms_poll_saved_state;
 typedef struct {
 	int fd_xe;
 	int debugfs_fd;
-	uint32_t devid;
-	char *debugfs_dump;
-	igt_display_t display;
 	struct igt_fb fb_white;
 	drmModeModeInfo *mode;
+	igt_display_t display;
 	igt_output_t *output;
+	struct pci_device *pci_xe;
+	struct pci_device *pci_root;
+	char pci_slot_name[NAME_MAX];
+	drmModeResPtr res;
 } device_t;
 
-static void vram_self_refresh(device_t *device);
+typedef struct {
+	device_t device;
+	struct drm_xe_engine_class_instance *eci;
+	int n_exec_queues;
+	int n_execs;
+	enum igt_suspend_state s_state;
+	enum igt_acpi_d_state d_state;
+	unsigned int flags;
+} child_exec_args;
+
+uint64_t orig_threshold;
+int fw_handle = -1;
+
+static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
+static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
+static bool child_ready;
 
 static void display_fini(device_t *device)
 {
 	igt_display_fini(&amp;device-&gt;display);
 }
 
-static void setup_primary(device_t *device)
+static void setup_primary(device_t device)
 {
 	igt_plane_t *primary;
 
-	primary = igt_output_get_plane_type(device-&gt;output,
+	primary = igt_output_get_plane_type(device.output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_create_color_fb(device-&gt;fd_xe,
-			    device-&gt;mode-&gt;hdisplay, device-&gt;mode-&gt;vdisplay,
+	igt_create_color_fb(device.fd_xe,
+			    device.mode-&gt;hdisplay, device.mode-&gt;vdisplay,
 			    DRM_FORMAT_XRGB8888,
 			    DRM_FORMAT_MOD_LINEAR,
 			    1.0, 1.0, 1.0,
-			    &amp;device-&gt;fb_white);
-	igt_plane_set_fb(primary, &amp;device-&gt;fb_white);
-	igt_display_commit(&amp;device-&gt;display);
+			    &amp;device.fb_white);
+	igt_plane_set_fb(primary, &amp;device.fb_white);
+	igt_display_commit(&amp;device.display);
 }
 
-static void detect_primary_output(device_t *device)
+static void detect_primary_output(device_t device)
 {
-	igt_display_t *display = &amp;device-&gt;display;
+	igt_display_t *display = &amp;device.display;
 	igt_output_t *output;
 	enum pipe pipe;
 
@@ -79,47 +119,499 @@ static void detect_primary_output(device_t *device)
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		device-&gt;output = output;
-		device-&gt;mode = igt_output_get_mode(output);
+		device.output = output;
+		device.mode = igt_output_get_mode(output);
 
 		break;
 	}
 }
-static void cleanup(device_t *device)
+
+static void dpms_on_off(device_t device, int mode)
+{
+	int i;
+
+	if (!device.res)
+		return;
+
+	for (i = 0; i &lt; device.res-&gt;count_connectors; i++) {
+		drmModeConnector *connector = drmModeGetConnectorCurrent(device.fd_xe,
+									 device.res-&gt;connectors[i]);
+
+		if (!connector)
+			continue;
+
+		if (connector-&gt;connection == DRM_MODE_CONNECTED)
+			kmstest_set_connector_dpms(device.fd_xe, connector, mode);
+
+		drmModeFreeConnector(connector);
+	}
+}
+
+/* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
+static bool runtime_usage_available(struct pci_device *pci)
+{
+	char name[PATH_MAX];
+
+	snprintf(name, PATH_MAX, &quot;/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage&quot;,
+		 pci-&gt;domain, pci-&gt;bus, pci-&gt;dev, pci-&gt;func);
+	return access(name, F_OK) == 0;
+}
+
+static uint64_t get_vram_d3cold_threshold(int sysfs)
+{
+	uint64_t threshold;
+	char path[64];
+	int ret;
+
+	sprintf(path, &quot;device/vram_d3cold_threshold&quot;);
+	igt_require_f(!faccessat(sysfs, path, R_OK, 0), &quot;vram_d3cold_threshold is not present\n&quot;);
+
+	ret = igt_sysfs_scanf(sysfs, path, &quot;%&quot;PRIu64&quot;&quot;, &amp;threshold);
+	igt_assert_lt(0, ret);
+
+	return threshold;
+}
+
+static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
+{
+	char path[64];
+	int ret;
+
+	sprintf(path, &quot;device/vram_d3cold_threshold&quot;);
+
+	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
+		ret = igt_sysfs_printf(sysfs, path, &quot;%&quot;PRIu64&quot;&quot;, threshold);
+	else
+		igt_warn(&quot;vram_d3cold_threshold is not present\n&quot;);
+
+	igt_assert_lt(0, ret);
+}
+
+static bool setup_d3(device_t device, enum igt_acpi_d_state state)
+{
+	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
+		      &quot;PCI power management capability not found\n&quot;);
+
+	dpms_on_off(device, DRM_MODE_DPMS_OFF);
+
+	/*
+	 * The drm calls used for dpms status above will result in IOCTLs
+	 * that might wake up the device. Let's ensure the device is back
+	 * to a stable suspended state before we can proceed with the
+	 * configuration below, since some strange failures were seen
+	 * when d3cold_allowed is toggle while runtime is in a transition
+	 * state.
+	 */
+	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+
+	switch (state) {
+	case IGT_ACPI_D3Cold:
+		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
+		igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
+		igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
+		return true;
+	case IGT_ACPI_D3Hot:
+		igt_pm_set_d3cold_allowed(device.pci_slot_name, 0);
+		return true;
+	default:
+		igt_debug(&quot;Invalid D3 Selection\n&quot;);
+	}
+
+	return false;
+}
+
+static void cleanup_d3(device_t device)
+{
+	dpms_on_off(device, DRM_MODE_DPMS_ON);
+}
+
+static bool in_d3(device_t device, enum igt_acpi_d_state state)
+{
+	uint16_t val;
+
+	/* We need to wait for the autosuspend to kick in before we can check */
+	if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
+		return false;
+
+	if (runtime_usage_available(device.pci_xe) &amp;&amp;
+	    igt_pm_get_runtime_usage(device.pci_xe) != 0)
+		return false;
+
+	switch (state) {
+	case IGT_ACPI_D3Hot:
+		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
+						      &amp;val, 0xd4), 0);
+		return (val &amp; 0x3) == 0x3;
+	case IGT_ACPI_D3Cold:
+		return igt_wait(igt_pm_get_acpi_real_d_state(device.pci_root) ==
+				IGT_ACPI_D3Cold, 10000, 100);
+	default:
+		igt_info(&quot;Invalid D3 State\n&quot;);
+		igt_assert(0);
+	}
+
+	return true;
+}
+
+#define MAX_VMAS 2
+
+static void*
+child_exec(void *arguments)
+{
+	child_exec_args *args = (child_exec_args *)arguments;
+
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	int n_vmas = args-&gt;flags &amp; UNBIND_ALL ? MAX_VMAS : 1;
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+	uint64_t active_time;
+	bool check_rpm = (args-&gt;d_state == IGT_ACPI_D3Hot ||
+			  args-&gt;d_state == IGT_ACPI_D3Cold);
+
+	igt_assert_lte(args-&gt;n_exec_queues, MAX_N_EXEC_QUEUES);
+	igt_assert_lt(0, args-&gt;n_execs);
+
+	if (check_rpm) {
+		igt_assert(in_d3(args-&gt;device, args-&gt;d_state));
+		active_time = igt_pm_get_runtime_active_time(args-&gt;device.pci_xe);
+	}
+
+	vm = xe_vm_create(args-&gt;device.fd_xe, 0, 0);
+
+	if (check_rpm)
+		igt_assert(igt_pm_get_runtime_active_time(args-&gt;device.pci_xe) &gt;
+			   active_time);
+
+	bo_size = sizeof(*data) * args-&gt;n_execs;
+	bo_size = xe_bb_size(args-&gt;device.fd_xe, bo_size);
+
+	if (args-&gt;flags &amp; USERPTR) {
+		data = aligned_alloc(xe_get_default_alignment(args-&gt;device.fd_xe),
+				     bo_size);
+		memset(data, 0, bo_size);
+	} else {
+		if (args-&gt;flags &amp; PREFETCH)
+			bo = xe_bo_create(args-&gt;device.fd_xe, 0, bo_size,
+					  all_memory_regions(args-&gt;device.fd_xe) |
+					  vram_if_possible(args-&gt;device.fd_xe, 0),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		else
+			bo = xe_bo_create(args-&gt;device.fd_xe, vm, bo_size,
+					  vram_if_possible(args-&gt;device.fd_xe, args-&gt;eci-&gt;gt_id),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		data = xe_bo_map(args-&gt;device.fd_xe, bo, bo_size);
+	}
+
+	for (i = 0; i &lt; args-&gt;n_exec_queues; i++) {
+		exec_queues[i] = xe_exec_queue_create(args-&gt;device.fd_xe, vm,
+						      args-&gt;eci, 0);
+		bind_exec_queues[i] = 0;
+		syncobjs[i] = syncobj_create(args-&gt;device.fd_xe, 0);
+	};
+
+	sync[0].handle = syncobj_create(args-&gt;device.fd_xe, 0);
+
+	if (bo) {
+		for (i = 0; i &lt; n_vmas; i++)
+			xe_vm_bind_async(args-&gt;device.fd_xe, vm, bind_exec_queues[0], bo,
+					 0, addr + i * bo_size, bo_size, sync, 1);
+	} else {
+		xe_vm_bind_userptr_async(args-&gt;device.fd_xe, vm, bind_exec_queues[0],
+					 to_user_pointer(data), addr, bo_size, sync, 1);
+	}
+
+	if (args-&gt;flags &amp; PREFETCH)
+		xe_vm_prefetch_async(args-&gt;device.fd_xe, vm, bind_exec_queues[0], 0,
+				     addr, bo_size, sync, 1, 0);
+
+	if (check_rpm) {
+		igt_assert(in_d3(args-&gt;device, args-&gt;d_state));
+		active_time = igt_pm_get_runtime_active_time(args-&gt;device.pci_xe);
+	}
+
+	for (i = 0; i &lt; args-&gt;n_execs; i++) {
+		uint64_t batch_offset = (char *)&amp;data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&amp;data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % args-&gt;n_exec_queues;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr &gt;&gt; 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b &lt;= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &amp;= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = batch_addr;
+
+		if (e != i)
+			syncobj_reset(args-&gt;device.fd_xe, &amp;syncobjs[e], 1);
+
+		xe_exec(args-&gt;device.fd_xe, &amp;exec);
+
+		igt_assert(syncobj_wait(args-&gt;device.fd_xe, &amp;syncobjs[e], 1,
+					INT64_MAX, 0, NULL));
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+		if (i == args-&gt;n_execs / 2 &amp;&amp; args-&gt;s_state != NO_SUSPEND) {
+			/* Until this point, only one thread runs at a given time. Signal
+			 * the parent that this thread will sleep, for the parent to
+			 * create another thread.
+			 */
+			pthread_mutex_lock(&amp;child_ready_lock);
+			child_ready = true;
+			pthread_cond_signal(&amp;child_ready_cond);
+			pthread_mutex_unlock(&amp;child_ready_lock);
+
+			/* Wait for the suspend and resume to finish */
+			pthread_mutex_lock(&amp;suspend_lock);
+			pthread_cond_wait(&amp;suspend_cond, &amp;suspend_lock);
+			pthread_mutex_unlock(&amp;suspend_lock);
+
+			/* From this point, all threads will run concurrently */
+		}
+	}
+
+	igt_assert(syncobj_wait(args-&gt;device.fd_xe, &amp;sync[0].handle, 1,
+				INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	if (n_vmas &gt; 1)
+		xe_vm_unbind_all_async(args-&gt;device.fd_xe, vm, 0, bo, sync, 1);
+	else
+		xe_vm_unbind_async(args-&gt;device.fd_xe, vm, bind_exec_queues[0], 0,
+				   addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(args-&gt;device.fd_xe, &amp;sync[0].handle, 1,
+				INT64_MAX, 0, NULL));
+
+	for (i = 0; i &lt; args-&gt;n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	syncobj_destroy(args-&gt;device.fd_xe, sync[0].handle);
+	for (i = 0; i &lt; args-&gt;n_exec_queues; i++) {
+		syncobj_destroy(args-&gt;device.fd_xe, syncobjs[i]);
+		xe_exec_queue_destroy(args-&gt;device.fd_xe, exec_queues[i]);
+		if (bind_exec_queues[i])
+			xe_exec_queue_destroy(args-&gt;device.fd_xe, bind_exec_queues[i]);
+	}
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(args-&gt;device.fd_xe, bo);
+	} else {
+		free(data);
+	}
+
+	xe_vm_destroy(args-&gt;device.fd_xe, vm);
+
+	if (check_rpm) {
+		igt_assert(igt_pm_get_runtime_active_time(args-&gt;device.pci_xe) &gt;
+			   active_time);
+		igt_assert(in_d3(args-&gt;device, args-&gt;d_state));
+	}
+
+	/* Tell the parent that we are ready. This should run only when the code
+	 * is not supposed to suspend.
+	 */
+	if (args-&gt;n_execs &lt;= 1 || args-&gt;s_state == NO_SUSPEND)  {
+		pthread_mutex_lock(&amp;child_ready_lock);
+		child_ready = true;
+		pthread_cond_signal(&amp;child_ready_cond);
+		pthread_mutex_unlock(&amp;child_ready_lock);
+	}
+	return NULL;
+}
+
+/*  Do one suspend and resume cycle for all xe engines.
+ *  - Create a child_exec() thread for each xe engine. Run only one thread
+ *    at a time. The parent will wait for the child to signal it is ready
+ *    to sleep before creating a new thread.
+ *  - Put child_exec() to sleep where it expects to suspend and resume
+ *  - Wait for all child_exec() threads to sleep
+ *  - Run one suspend and resume cycle
+ *  - Wake up all child_exec() threads at once. They will run concurrently.
+ *  - Wait for all child_exec() threads to complete
+ */
+static void
+test_exec(device_t device, int n_exec_queues, int n_execs,
+		  enum igt_suspend_state s_state, enum igt_acpi_d_state d_state,
+		  unsigned int flags)
+{
+	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
+				     SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+	struct drm_xe_engine_class_instance *eci;
+	int active_threads = 0;
+	pthread_t threads[65]; /* MAX_ENGINES + 1 */
+	child_exec_args args;
+
+	xe_for_each_engine(device.fd_xe, eci) {
+		args.device = device;
+		args.eci = eci;
+		args.n_exec_queues = n_exec_queues;
+		args.n_execs = n_execs;
+		args.s_state = s_state;
+		args.d_state = d_state;
+		args.flags = flags;
+
+		pthread_create(&amp;threads[active_threads], NULL, child_exec, &amp;args);
+		active_threads++;
+
+		pthread_mutex_lock(&amp;child_ready_lock);
+		while (!child_ready)
+			pthread_cond_wait(&amp;child_ready_cond, &amp;child_ready_lock);
+		child_ready = false;
+		pthread_mutex_unlock(&amp;child_ready_lock);
+	}
+
+	if (n_execs &gt; 1 &amp;&amp; s_state != NO_SUSPEND) {
+		igt_system_suspend_autoresume(s_state, test);
+
+		pthread_mutex_lock(&amp;suspend_lock);
+		pthread_cond_broadcast(&amp;suspend_cond);
+		pthread_mutex_unlock(&amp;suspend_lock);
+	}
+
+	for (int i = 0; i &lt; active_threads; i++)
+		pthread_join(threads[i], NULL);
+
+	active_threads = 0;
+}
+
+static uint64_t read_mods(device_t device)
+{
+	uint64_t mods_value;
+	char buf[256];
+	int ret;
+	char *mods_ptr;
+
+	ret = igt_debugfs_simple_read(device.debugfs_fd, &quot;gtidle/dgfx_pkg_residencies&quot;, buf, sizeof(buf));</pre>
    </blockquote>
    with the latest changes by Soham, the debugfs path has been updated,
    just use &quot;<span style="white-space: pre-wrap">dgfx_pkg_residencies<span style="white-space: normal">&quot;.</span></span>
    <blockquote type="cite" cite="mid:20250623191230.66611-3-mohammed.thasleem@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	igt_assert_f(ret &gt;= 0, &quot;Debugfs dgfx_pkg_residencies is not present.\n&quot;);
+
+	mods_ptr = strstr(buf, &quot;Package ModS: &quot;);
+	if (mods_ptr)
+		sscanf(mods_ptr, &quot;Package ModS: %&quot;PRIu64&quot;\n&quot;, &amp;mods_value);
+
+	return mods_value;
+}
+
+static void cleanup(device_t device)
 {
 	igt_plane_t *primary;
 
-	primary = igt_output_get_plane_type(device-&gt;output,
+	primary = igt_output_get_plane_type(device.output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_display_commit(&amp;device-&gt;display);
-	igt_remove_fb(device-&gt;fd_xe, &amp;device-&gt;fb_white);
+	igt_display_commit(&amp;device.display);
+	igt_remove_fb(device.fd_xe, &amp;device.fb_white);
 }
-
-
-static void vram_self_refresh(device_t *device)
+static void kms_poll_state_restore(int sig)
 {
-	detect_primary_output(device);
-	setup_primary(device);
-	cleanup(device);
+	int sysfs_fd;
+
+	sysfs_fd = open(KMS_HELPER, O_RDONLY);
+	if (sysfs_fd &gt;= 0) {
+		__igt_sysfs_set_boolean(sysfs_fd, &quot;poll&quot;, kms_poll_saved_state);
+		close(sysfs_fd);
+	}
 }
 
 igt_main
 {
-	device_t device = {};
+	device_t device;
+	char buf[256];
+	int sysfs_fd, ret;
+	uint32_t d3cold_allowed;
+	uint64_t mods_prev_value = 0, mods_curr_value = 0;
+
+	const struct s_state {
+		const char *name;
+		enum igt_suspend_state state;
+	} s_states[] = {
+		{ &quot;s2idle&quot;, SUSPEND_STATE_FREEZE },
+		{ NULL },
+	};
+	const struct d_state {
+		const char *name;
+		enum igt_acpi_d_state state;
+	} d_states[] = {
+		{ &quot;d3hot&quot;, IGT_ACPI_D3Hot },
+		{ &quot;d3cold&quot;, IGT_ACPI_D3Cold },
+		{ NULL },
+	};
 
 	igt_fixture {
-		device.fd_xe = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		memset(&amp;device, 0, sizeof(device));
+		device.fd_xe = drm_open_driver_master(DRIVER_XE | DRIVER_INTEL);
+
+		kmstest_set_vt_graphics_mode();
 		device.debugfs_fd = igt_debugfs_dir(device.fd_xe);
 		igt_require(device.debugfs_fd != -1);
-		kmstest_set_vt_graphics_mode();
-		device.devid = intel_get_drm_devid(device.fd_xe);
+		igt_pm_enable_sata_link_power_management();
 		igt_display_require(&amp;device.display, device.fd_xe);
+
+		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
+		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
+		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
+
+		/* Always perform initial once-basic exec checking for health */
+		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
+
+		igt_pm_get_d3cold_allowed(device.pci_slot_name, &amp;d3cold_allowed);
+		igt_assert(igt_setup_runtime_pm(device.fd_xe));
+		igt_install_exit_handler(kms_poll_state_restore);
 	}
 
 	igt_describe(&quot;This test validates display flips with vram self refresh&quot;);
 	igt_subtest(&quot;vram-self-refresh&quot;) {
-		vram_self_refresh(&amp;device);
+		detect_primary_output(device);
+		setup_primary(device);
+
+		ret = igt_debugfs_simple_read(device.debugfs_fd, &quot;vrsr_capable&quot;, buf, sizeof(buf));
+		igt_assert_f(ret &gt;= 0, &quot;Debugfs dgfx_pkg_residencies is not present.\n&quot;);
+
+		igt_skip_on_f(!strstr(buf, &quot;true&quot;), &quot;vrsr is not enabled.\n&quot;);
+
+		for (const struct s_state *s = s_states; s-&gt;name; s++) {
+			for (const struct d_state *d = d_states; d-&gt;name; d++) {
+				orig_threshold = get_vram_d3cold_threshold(sysfs_fd);</pre>
    </blockquote>
    please open the sysfs_fd before using it. Use : sysfs_fd =
    igt_sysfs_open(device.fd_xe);
    <blockquote type="cite" cite="mid:20250623191230.66611-3-mohammed.thasleem@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				mods_prev_value = read_mods(device);
+				set_vram_d3cold_threshold(sysfs_fd, 0);</pre>
    </blockquote>
    same as above.
    <blockquote type="cite" cite="mid:20250623191230.66611-3-mohammed.thasleem@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				igt_assert(setup_d3(device, d-&gt;state));
+				test_exec(device, 1, 2, s-&gt;state, NO_RPM, 0);
+				mods_curr_value = read_mods(device);
+				set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
+				igt_assert_f(mods_curr_value &gt; mods_prev_value,
+					     &quot;Mods residency is inaccurate: %&quot;PRIu64&quot;\n&quot;, mods_curr_value);
+				cleanup_d3(device);
+			}
+		}
+		cleanup(device);
 	}
 
 	igt_fixture {
</pre>
    </blockquote>
    BR,<br>
    Anirban
  </body>
</html>

--------------EjicbwUAvaJiKjO0AJG4haH7--

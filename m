Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2FCC5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 08:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA13210E1C5;
	Fri, 31 Jul 2026 08:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnGHy/8G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7028310E1D5
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785486355; x=1817022355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g5j+swB7G1kkDIMWAU8ZGA9p+Fd9u3qrRrhsPnKEB2g=;
 b=nnGHy/8GhYpyVUDsIcqxOMQ8rzehPjMrDs9/MVjbQ+9PGCkryhpH+3Wt
 +idYN1S2FKtFDGB/DABJ87aUlG6IfjIP6NO4c1IIY9luzyfuXJqEFr4YV
 IUto8+3rbWxnk1JXjbUVBdwfXOXmlc1RfzrLa3dz0O1iRCRMx9LDiQImx
 jm10AIPkOrAAmrFl5seyBANhWE2EPxL5mSF8INxdM1ycSz169E4mIdYs1
 Pxi7368BSG5nI8tSHuqqMb7EZsTK5peL6UE11TCK+M133KhSeG1WH6IFx
 m605GSd/bYXb8Coo8V9yy4AtwDwGAwX/bXKhddVtrlA1S4Gae4vwsmEMl g==;
X-CSE-ConnectionGUID: Uc4be645SruUm317CnpY7Q==
X-CSE-MsgGUID: bqL9FESRTpSu7M/pm2EQLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86060874"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="86060874"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:25:54 -0700
X-CSE-ConnectionGUID: 3i46Rck8TBmVErKa2ZA/+A==
X-CSE-MsgGUID: gZsb/8JlRaqrHtyNNPk0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="254207568"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:25:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:25:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 01:25:53 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:25:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF7dg6Qys16IuQdgToWBriX6ts9Zb6FxJS4D+2udl+WGVg+xqIa+XL3HyUunn/l2Zpps3tUSoIuFdmsGZ3oAPEk0o/NfRPcWJaLTxk4zI9UI0s0+H/0HMp+S0Y11c0e4syatU3z2piSwG8mk0HF8FRFnp18GAG5P5kztPTut5XZTNt8PPCSn8MUL5Zdf/0U3dcgDIZDF+OahL4hGvZ60gVIx9ABuJBAnPbU68rHwNi611dntF3ypqjDO/2VOsl2cyYLPxSmnP756hpsMJrUXx29B29qkQ0ajqTJKXh3S0znWkkHTy8UFgFeg5zWlBl7Zgg2XxcKvjyJ+o8HjUm3Jmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45cLkDYiVxBa5vB1h5N3BymhelzF7VmyoRtrOFZOkqQ=;
 b=whIGu/9U1jO+M6LkhnQSz6ctJGts9XbOxDw59WfYoSKvdo3b61hmOX6gBedw7dT7sjHmBm3CnbySUR1/OIDIMgKTv8YZ1MccyaWuIMi4v9Yc3X2O4Yn9QNlqHRYcTXOV1ZY8jAtWpqVShwZVBEIs4GW5/03+i9AhsCHYw1amtHk9ea9oVKOCA79+0IKiKFMF9aBH2uGJ87Ra5wRoa0xmW2ioAJlHunFbJAt8cNr25EDKuVrvWk1JOfSWMO+yWV/uL+3hwKyScztn0XtkSF/ipjhXYSsPYuZap2JKGYYDJxAGemRO+aJJ0+ob6P1P1PTXWms32SGMyS4vEMb8lwiicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB6920.namprd11.prod.outlook.com (2603:10b6:806:2bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:25:45 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:25:45 +0000
Message-ID: <ad3f5901-492a-4217-8d4f-5a45655217d5@intel.com>
Date: Fri, 31 Jul 2026 13:55:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] lib/igt_kms: clear colorop-changed flag
 after commit
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser
 <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>
References: <20260602211259.898147-1-mwen@igalia.com>
 <20260602211259.898147-2-mwen@igalia.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260602211259.898147-2-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::6) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 434c0412-f152-4e02-ff01-08deeedd5111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|4143699003|5023799004|11063799006|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: B+elMm2Yghq/IUBBU2lm/ASo6z+70h7J01yidl+vygdQpwGi8YyGagtpWsnZLsm9YGy/aUuLJH6Eg1TI5rQtNVWpxK3f0Tv+Hf+4xCadhUaJYPvURpT1quefcYNO0pkBjeSLomzGsjLk0noKtxiY462aPaW2Ipq3T6Rvbsks3AG1/IJcmRGr0d0YXhI89Bt5hqp2rpbIzHOnOAh6549B1j7DVv20XtmM5Kvn5FIemB0pNmf5iahD6B2LeP4zm4uqF7GSzWSVDi0aHNkYg76bGoOeMKvMN8X3d4QmsfrShhVn0qE2M9DPFoW/RRTIpGOZIQJS0ZMd8ySjtWN/qOx+hs8PTgDcz1Chq+YSzrhU9Kr2rJ0i2zlTNTTxofTB7VFuMCEVoHyeka2CGIj8wllnij+xkqaNXkz0rna3g0IZpoaEszJf9eJYHWH55s6y6jMQQdPdmiwIE2pjmiPAnLxKa/+5iw5M9C1dB+BRlR8tk3+qqmlR2F4Q4EN20gTXj47AVjGyapF75KsiAg2+EJn6yp0gpEM8Mspj6Rf7E4XCflMWtUwB3mxOdyxBS09/VW1Cs0+6/ORmNOLWmaVXp9B3mzkRMmle8rcHpXvJHHPPQS4i63HWtxbj5eJ6tkS0G9T+Fu8zyl2aQ8hcNUf+X3t/z2tJMwtARePHHwF8Q+D4w8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnJIaHp2QTlnZGlRcjF5SXNia2Z6amI3emZNTnpxbzg3UmxiZncxSDMvNG5u?=
 =?utf-8?B?eEJoRG9za3RXQUVHTDlCajZ2Z09RWXpNTHNsN21hbnNkNWUvcDhWNStFQzlE?=
 =?utf-8?B?VlhaU3g1UGRSdUhmTFRJMzNCWkJFVXBlZlh6dG9kWXFuMGZYRXZjZmF5Qmw4?=
 =?utf-8?B?V3c2RUVLR1FGM2FPWGd2MG9rUzlhc1Q4MTBNQUtrdzBiRWpZd3V1Sm9FdlIv?=
 =?utf-8?B?aHZsMDdsbkNzY2pWdzZuTVYxQWVRblFSVW0zSVk4YStKeUZoQ0ZZUnZMeWFp?=
 =?utf-8?B?alltYmhCMkVxQ24zYVFENUpLcVhwaytGNUwrdTJPZHVPV0hUL1lnY1VxT3ZE?=
 =?utf-8?B?d0FpRmJQR1ZBbVNjOG4wWnlITXl5Q084VXkzdXdVdWszcndWOGpHY3V4eThu?=
 =?utf-8?B?MklpMmNKWmE0U2doblAzaUltK3RaSHo1YURET0hzcjhCVTkzNTlLVUJ0K3NX?=
 =?utf-8?B?OFZPZ3NqcmNzQ0JoSkV5dW9SODllT2F3SHZXV2tOZnlmTDJDWndyQ2hYaEtQ?=
 =?utf-8?B?U2VISmlrRmp4d3NDaFpBTDNGdUZlNXlyN1A2UGZacEFwNllxNzcyZW0rZVZP?=
 =?utf-8?B?VVNGQ0NwWXFxMWpWK1JONkhLc1RNTHVrWXh3OW9Fd3oweXoyYWJzdEVROWh4?=
 =?utf-8?B?K0ZkRlhRUTk2bG5SNmN5bGptck5pNzBhTE85Q280Uk1NcjJNNlJkdmo0WkVa?=
 =?utf-8?B?KzZkMmplYTJ4bW9wRGtNYjltL3c3TzEwUnR3RzdWTlVwbEl6WXF3S2JZQndY?=
 =?utf-8?B?MHVlK0JuR0hSQXVycVJWeVBNMHRieVl4T0hXV3NqNDdya2FUTmRPM0RuL3ho?=
 =?utf-8?B?WmF4N09LbWpzZ3I2T3Qza3c1YzI2alVXMTBxLzNnVkloWGRDZkRpRXIvakFw?=
 =?utf-8?B?NWZmL2pibU9UTDN2cU1hcjZhRkxuYklhcDlUOHM5Z2VxNkJveWtCQUVYMHgr?=
 =?utf-8?B?c3Q1RHBJWmM5T2EyUXI2TWREQkdadk1LVkZlL2xoTTZMRVBpVzVWeklSQ3RB?=
 =?utf-8?B?L2tzSGZaZW1aZWtGUGplYXJ0Rnk3S0ZFWU52N2RQUzFmVHpWY0tGMHA4ZnZW?=
 =?utf-8?B?UFMvWU5BWGpndkR1Q1M3TlRXNjNzZDYxYkpQd3NvY3V3YTQySlFxMDdNUmY1?=
 =?utf-8?B?czF6RUhRY0xxU1NLU1BIdk1ha2pOUU91b3B0d1EzemdzWFdtckswbzg1R3F3?=
 =?utf-8?B?Z0diMUtQYVBkc0NscHpyN3hUbnQ5YzBDZHFtOTBiSloxOVNjRjhKVFFqbjRk?=
 =?utf-8?B?YUVUWk9sQ2FhcVNoc1FGZmRPd3lVaVllbzZCR01NblJzSkFLWkh4QkNqQUtm?=
 =?utf-8?B?amZ1ZEJlSGQ3WTE3ckhHMkxjWTBSMllkMUFSc2wzQzdNWWtjUEhhU0ZmMmQy?=
 =?utf-8?B?QWQxNVNMNU1CaUU4T2lmVkpXZFNBSXc5Nk5jRWp2eEdPYzdsYWtmLy9vR0hI?=
 =?utf-8?B?R2FKbGVORjhTOTlYTTZ4RzhveldUT2NIbmMrTURPNFd3RnI0bVlmS3pyUFhy?=
 =?utf-8?B?QkRqbkoxOWJlaGYreCtvSVNOb2xIY0FwWU9Ib1AwVGRZeXdFYkNRVUZvU2wr?=
 =?utf-8?B?cTEyVTJrVDFrbkN3Z0VyN3QydGlBODAyR0VTNU5MUTVuSVQwaUZXRktBYUlI?=
 =?utf-8?B?S3dWTThkME9kM1ZFbG1GNkFxb2JFTWd4Vmp3dmNxTHhqdjhleFNLeTFXTVVO?=
 =?utf-8?B?NlFVQmhZcUt0cnJNNjlDQmFndXl0Mm9rTFppVWp2QTBvSTh5bmw3aW0xcDJo?=
 =?utf-8?B?NnNiU2dwa2tUb3BnS0tRazFaM0hodThVb05Ta1BZRGlyQS8wTDV1UGNRdkVr?=
 =?utf-8?B?TzFXblpSTWVpTnV3QXJJQ2FMUm9aN20rWitNaVF4TU9wRHdIekZURU92QWg1?=
 =?utf-8?B?cVRacUk3RkhzTDAzWTZPYVF2SEdvblJlRFA5T1N5TWwrTHpZTzFhTGh5ZUlB?=
 =?utf-8?B?QSs3V25kbUZ5ODlldEp3TTQrN1BqcHM0WDY3UDFBbTc1a1pWbFVwc3c4NXFP?=
 =?utf-8?B?WVMyaDVBVzZwRHVJRnJ3L0FRQjJHWXIycmQ5eFdZOHNtS1h3emVWbnhzR1c1?=
 =?utf-8?B?eG8zY1AwQTUrRzBpU1loVWZ2MmxNSzdFV0l6V05jRUdvbk1IV2ZLcTdpaDAy?=
 =?utf-8?B?MWdhVExaYXB2V256Uzg0T0R5VW5zL1JKVE5IQVVseHZtS05ZY0s5TDlsaGpG?=
 =?utf-8?B?ejNiYStrbDh2TFdHVUNldWRqZkxsRnVISldub2YzUjdScWdKUHRENG4xaG1Y?=
 =?utf-8?B?aElySkJZM0lDNE9CellsYUk1UlBzU05wWnZjemhaUUtLS3ZlakpFanRNVUdL?=
 =?utf-8?B?VFdXaThiUkRMMWk0ai9JWFkwcnI4QmZTMWJhYnFEQVJ5emgvY2VGczJ2MU9o?=
 =?utf-8?Q?uIWjuee8I+rNHAnM=3D?=
X-Exchange-RoutingPolicyChecked: UXwjwPeXuJHfEt/O8EKTN2y9eutxvyEH8f/nQkCgRKV9jWIPXm9fHL7k3RlajpsXv+1/TCTW6liiCCwtpwQm9UuZ/7TY5n2GrW3Nhrk+OIMJ8kkq0GKPv+eTez+66ljFUktTOc9EDQecvjMgROgIFzgT8aMynARhxVNy/xesvfIhxO4x2jKp0SEA/FYXq3lnEYHMaND+CrWnOTkeWGhXZ7W/Vmi/pFsqynMghcY3hLEkOBWrSRTkC0saD2O4fzgeaj3/UFrAfRQNHSeira/H3px+Vd1p2zw/352DbQEUkraFT0jebBILOVTNmLg7QzQwvdaN2JeVPzBn70l6XQVUhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 434c0412-f152-4e02-ff01-08deeedd5111
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:25:45.1476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXk4giFFzm9m6nz3ZrY/cH8BmpCMHFs7L+P2ZYnwAOXsnIsvHDquz1wLAQ8NQR9iBMFPA+9ZXupsJkp+2B/DhowGwfTi6syuiSCga36ol8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6920
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



On 6/3/2026 2:36 AM, Melissa Wen wrote:
> Don't request colorop updates if there is no change in the atomic
> commit. It fixes atomic rejection after test skips that was caused by
> incorrect attempts of changing inactive colorop properties, since
> userspace can update only current active colorops or colorops that will
> be activated or deactivated in the same commit. Active colorop means a
> colorop that is in the chain of an active color pipeline, i.e.  the
> pipeline in plane COLOR_PIPELINE property.
> 

The patch overlooks an issue where we don't update the 
assigned_color_pipeline to NULL even when pipeline set to Bypass. Though 
unlikely,  if anything later sets a property on one of colorops in the 
now bypassed pipeline, the next atomic commit will still walk that stale 
chain via igt_atomic_prepare_colorop_commit() and try to send the change 
which the kernel should reject.

I tried to solve it in [1] but it had the side-effect of making 
reset_colorops() a no-op (done in a single commit with bypass). That is 
again because igt_atomic_prepare_colorop_commit() uses
plane->assigned_color_pipeline to walk through the pipeline. One 
solution could be tracking both the old and new pipeline.

However, that should not block this change. So this LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

[1] 
https://lore.kernel.org/igt-dev/20260521092620.3637270-1-chaitanya.kumar.borah@intel.com/

> Assisted-by: Claude:claude-opus-4-7
> Tested-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   lib/igt_kms.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e20307923..d46f15c01 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4858,6 +4858,7 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
>   {
>   	int i;
>   	igt_crtc_t *crtc;
> +	igt_colorop_t *colorop;
>   
>   	for_each_crtc(display, crtc) {
>   		igt_plane_t *plane;
> @@ -4887,6 +4888,20 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
>   				int fd;
>   				plane->changed = 0;
>   
> +				/* clear changed flags on every colorop in the assigned chain
> +				 * so already-committed property values aren't re-emitted on
> +				 * the next commit.
> +				 */
> +				colorop = plane->assigned_color_pipeline;
> +				while (colorop) {
> +					int next_val;
> +
> +					colorop->changed = 0;
> +					next_val = igt_colorop_get_prop(display, colorop,
> +									IGT_COLOROP_NEXT);
> +					colorop = igt_find_colorop(display, next_val);
> +				}
> +
>   				fd = plane->values[IGT_PLANE_IN_FENCE_FD];
>   				if (fd != -1)
>   					close(fd);


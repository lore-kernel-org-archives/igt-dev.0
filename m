Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE80DC982DA
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 13:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9E810F371;
	Fri, 18 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyzjWEGM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBE110F371
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 13:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789739928; x=1821275928;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DMTbdjLgmSjrZuo2O7agnbwtbd261pu2nJwSa+yzLnA=;
 b=XyzjWEGMmC14wI4ibMstQSFXiI6Yd7JNJeA3wzbivrTvlwcUF6izruoc
 Z7lDZqJO2ntc7mSKFORRjFqtBl/fFnLQND/1RuAEM6YWUmgwdj1n2QFvJ
 zT7bmkMoLyKUyG/rNIBfFhj9EUTDuKlV+hT27UXgla/OQvP8+etjhpacj
 e7ilmQTGBWsy9B9BCF2ey5oNusqdl0u/0WnfV7iwWsBDCdRSRQK5jHI3Z
 dO90hoEQEWucxucUWBEOMz6uajBOH7EchYp98UtUYQ2vCIjuw2tuUmr+k
 PkLiW0A8BwDgWkBhG7vjuCfmnvSYKgodB9te42ZWnttA8x9uK7xuRHuv1 w==;
X-CSE-ConnectionGUID: 6k8LloAgS26XpEl0X77vaA==
X-CSE-MsgGUID: r2V6N66NREOCXWlQ0RHLRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89179043"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="89179043"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:58:48 -0700
X-CSE-ConnectionGUID: VGSCrDwMQVCJxGgQ8RulFg==
X-CSE-MsgGUID: nhmz0wpAT7GIga3HXl2qvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2654959"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:58:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 06:58:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 06:58:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 06:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGybyP/coaC4+XT0dJC6NM8fkYkChj/01MVod6+8J22bHwGyHbxJgznqp4Aszpeq/kbgf0Itfq6nLeMbVtWVhRKnmfg6GAl4HTf8/iZI7bCf/PMaa6xnkiIBO/2bVammqWOm9ULbAwA+qAV0G1QCNAntEEK8HS5aTJ6q0qyQi0RhTFOVerhy5TWp71aCWeXj8midcagRLKudqW6qkPz7GG2Pd5o3pvg71dUI6EpIPKGoTiUIiWedGdd+Xrl4LWTJ0O3aSwo33fvmARFjSsQK0RGYfYKb9jlAR5BwJatgDq/BmT+KiNmSxRKS1c4uHnEEsLzIdW6CaoIL+DdIAaX8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEzXX76YfHiv9pK8HSI8BqAXyiHXI0411OOG4hOx2UA=;
 b=bDD81MbFFEMUDBK+S2t6ERvrDF4fCZfexxgmS28e7slygn+e8a5SrSB95FOUGQZf1gEuhrAszsmNtgaTamASDiHDUkqky76MI0CPa4nlrVKX2NIwZuwVXPgBCnxMAd27Wu1j9WVH4rHCKYoP1qdBs18XwUZgOZkCONGdN2Ur1TiTWbBdX4rljl5c/LvLB44WTdxpEv2xJY1zdzx4rVDF9gsOiVc3ySsHpMN4nmOUs1sgeIpYLPrK6gu+qYkMLG7Yx866KS7/iMSzsnnvzq+4Rj7s+8GaLcioOg0R7TSTXFIkUN1yAuNVa6klZVP2QnwMkAAaSGAXgNlg07HHg14wZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 13:58:43 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 13:58:43 +0000
Message-ID: <e59a8aa5-7269-458d-a024-41251dde9ab9@intel.com>
Date: Fri, 18 Sep 2026 19:28:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] lib/igt_drm_netlink: add get_error_threshold
 command support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-6-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260903073335.339540-6-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0196.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::10) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CO1PR11MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9ffce8-74cd-4ff8-6035-08df158cf337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|4143699003|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ea0JEK9Tgycgy6IL+vBGzyqEqa9Y4stxM9HLbrCorjqd4XAeYD1NHljVLBVNmIfTwei1eTnVxxvhUUlHy9tgDzgVjOKXtr6qAXmfZJElISkPPHoGUwcRfdx2Cx+E/Uc5IEgprLy51Z2luq5BI+iBs4Z7fXxnQnvGLtneEE5ic1DR3+FEWxtGYqzFKp++64jcs7BsX7ZieI3iogb/3W8xPIOQ0uSk1nf3Ruw3/3jMde16xDHGog0PSiQQuuhlXldXybWLLRi4EA5Iu9WM08jUOiLdrAUTErDzpZS455mEwOXTMj7u82Nvbh+hKKnZJqjKwmUZwIJLLEibNX5gbCO0H2XlKE6De0SiBXOzVCiSINmWtyAEhUkIUm1+B1F4xU5e8Db8V+zTku/wol/xjsehcVPVHWy+fJ95u/fjLox65f8lLTl+2RHBrziAGTau7cqptJKfFduism6HaZx9NKhOGoPvjDzaFMPQC4iP1n4PRdNi2wEB9n4qnnsvL9BLJRex3H4UGwkimPpETm2uS3UwKNUGmgLfbDL2jE/IVhywOKgv0tnwP4WT5+kzl7NBZOWx+kYWEptCizNV5u+YBNBayy1ZlBJz/kNtyhxz2CQKL/M/v5exWFj1gRgnK+h6ClmKmlearXCASo1/78CQ6KFK5nPk/abd3/L95fWDQmDHLx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUJVdW1XSjAveE16V0U1Rm84Qk5JWVF5Z3VmeFFZVkFHS2hWbmlGREFLM0NO?=
 =?utf-8?B?WE5DeGFlZG5RZzIxUTFsajVWTEV0QzZlZHh6aUNIMmd0V2hUZm1OUDNUMWU2?=
 =?utf-8?B?S2dCMUZSNC9VUmMrdmtSVDVTN3J0TTBwRVJoMW8xZkFLUkZISEh5MW56andN?=
 =?utf-8?B?Snk3bkZnYldJR0x0eTBNbXJXVXp4RVRlSVRLVlpQNFZrRS9TQXh4RzJwY1ZZ?=
 =?utf-8?B?V2JNbkRNT1FkcEptRk5NdFZnNGc0c0hKbkN5UG8zV3N5N2F0TEtDd3ZXU0dG?=
 =?utf-8?B?c25lT2JyVWZSNUdYTENFMDhiakZrTUpoUGNXQjVxaFRPUGJzalpNcmNBN2J4?=
 =?utf-8?B?RC83QkhVK3RzN2krNXhjeldoMlVQeXRaMFc1eHVCUkZHcjAyVzF5N2dYczVo?=
 =?utf-8?B?OFhCdUloelRyOVBZSTM0WDRVaWt2dzBFeXB5M0o5LzBRd0RJQTNOcm44VURq?=
 =?utf-8?B?d0lNOWluS2hrek04eDZEUjkvSENlZG5LUDByRTNDN2ZpcXIyejFycE5xN1lT?=
 =?utf-8?B?VFdEVlFsZWRPRGkxOUxJZENuc3I2dkhBSEJGR0JHUk40QTBaMXJmRmx4ckxH?=
 =?utf-8?B?a011Y2c4UWNoTUl6cVo0Y1ZGWVgxZFlTQ2RUNG5PRGc5U1R6MnliUzRNYjJn?=
 =?utf-8?B?cjJmY0dIVUtOd2NUYzdCNi9LallwejRib0hQK2JDQytFZXBuK1dhNmVyZXpl?=
 =?utf-8?B?d3czWGhSZXA1YzhLeHJqeGZtdXptV1loOU44QXRKTjJtMUVUNUdZWEJiZWpn?=
 =?utf-8?B?ZHBpRjFvWk1EK0xNZEx2dk1xNnZ0L3UySkdZTFplbzFybkhuRWhYU09tNkw5?=
 =?utf-8?B?OUZEZm1rcXJPWUdTc3NkeHFkdko2b3NCT1dENTQ5S2FleDkwVTZraVRhZWZN?=
 =?utf-8?B?OTM3cFZPSHpwTGhNZTZmSDJHZlhSazJJb0Q5aG1pUFlESndpUWEvQWFwNC9k?=
 =?utf-8?B?OGV0WEpEcUhoVzlEY0xyM2thTlhxNThodDdJb0l2aVZzcFFHS0hXVnl1S3Fp?=
 =?utf-8?B?UmprTEcwZ2hCQXRXcWdObEpUUHJUZWRPRkI1U1Bxa012aUhtWDhHQjQwUmVz?=
 =?utf-8?B?MHJJWDRlcXYra1dQWEk3S2NtTC9WYm1tS1g4UU5TWHYwek5tWFc0S1M4OTFw?=
 =?utf-8?B?VEQ4Zmpxc0JyNCtPaDFCaVVIK3BKZVczVHRGbThyelFkRFovdDNGcnBlNzRN?=
 =?utf-8?B?WEFPQVFQdVBWZ29IeVRxY0c2L3BzOFFHUGZETFVjUEN6dEgvck1zLzRqc0dn?=
 =?utf-8?B?U25zRHZ2c2VucU42Y2lFWG4rYmJ2T2dUK3dNaitUdUJTWkF5V1J4ZmxpbDds?=
 =?utf-8?B?cHAveG1LcEZLUFIzUU4vczl4UkRUQk9rUTY3ekNIYzA0RFNuU2NCWFZmSG9G?=
 =?utf-8?B?ZlJENEVDbmZSZ1VQTWhybi9pSUlOV0J6NVRwY0Mvb3hEbWNZcXpWeWJMS0o5?=
 =?utf-8?B?VGh5RWU0R0pPb0VobllNTlZWMmVIVUdYNE5LdjhBYzVjYTFiRUtZS2VxQ2xH?=
 =?utf-8?B?STM2UFo0My9SMkdUdFRSank2dWEvR1dBa2FTK0pxT213emdoRzhqbis1UlRo?=
 =?utf-8?B?bHZTTVBvVkVDdVlnVWNwQVdhTEFqUWNYMWR1VlV5anF0aVlqcS8rUThiaGg4?=
 =?utf-8?B?QjNyaU8yVlB0Tk1CSHRNa3hhUmYrRXlQQXFuNkxIOTlQVjJxNjlzdVM4b1Jq?=
 =?utf-8?B?Tm13MVlSWUFUL2ZSQ3gyaTgxZ2tQQjNScFF3T1pZOVc5bWdOcVpBd2NnY3pE?=
 =?utf-8?B?RG0yOUxSb3k2RGxSNXJtY1ZNNytjTXBDYnpId3E1RFBPRDZzQ1lnVHZTWkM2?=
 =?utf-8?B?cm9WL3RPZWhEajlaQUVscHF5YytNQTdMWHVqb1ZrZkNTaDNJc09TeXJUT0Mz?=
 =?utf-8?B?R1NLYWxyN3lxS1BwT3VYUTNLZjNqallsMVJaWnhhbkJGR0h5b1BDSGExWlh2?=
 =?utf-8?B?emxNN1phcENUQzFLSnVwb01qSXJ4VTdIR3AvQlVBSTN1a1V3ZkNHOXlQV1dD?=
 =?utf-8?B?SXdrZ0JCbWJUNWZMNGlmL3RiUUtDOEp5elNqQXVhdGpwVnJRVHRTL2ZjZUhD?=
 =?utf-8?B?RzQ3WHYvQXQvdlZtd1JReUpmVHBmNEZoM0JUQVJWVHdsVW9nQ1lwdUU4MlVv?=
 =?utf-8?B?WVRPOEt0cWpXNE83a1BVa045V1llN2dDNWZOc0NUVU9ZV0dtVXNnOURYQVRO?=
 =?utf-8?B?WHVuOEZnUnlnWWQwTkEza00vQVZGTXBVN0FQSlprTStYbkdJbG9pSk9rWEVC?=
 =?utf-8?B?V0lOSGFoUFhtZWpadW96ODU1dkh0emlIYTFjWXNrUG5oZmVaM1l1bnJBU0tS?=
 =?utf-8?B?bkJHcTFTeUNWOEJhZUdFSC9YNG42RXNLNU5Ra2lHT0JoVVlLYjBYeDY2NWY0?=
 =?utf-8?Q?YUDOcP0vDGIMjC9c=3D?=
X-Exchange-RoutingPolicyChecked: X4QfT+vJB0o6OdGYJorYQfJMRGHc9cROIweI6Kk3AM+cD+r9N/KOr3PlM6Bk2s0Dy7We2t9tbA4bBdwOg4KZi1pB2LyxtaGHRPbXVQkxTv21yQUoeWhnJ4bKF5YNdUlXvWaCxgjCyfjwJqlHRSo/0pCvi5fA+lESvEalVIMjxSjL498zwG5BFoeijwf+8J3wfmzN1rSnld1cVRplv8Zu14eIc2y2V634LC/hgU9ViYUWycieBpAFH9ygoyjX9sEW6ktiMGmOy+vO3C9u/Ea0thlxfIhUlkDmv/L893RGKpPOfXlt+JnkZOzRKIKpFAhhGhc07FN3FDjGRi65nbXf/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9ffce8-74cd-4ff8-6035-08df158cf337
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 13:58:43.2108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaVNW0y0i986YzKW2CQBGwWY3fw6B+5mFEKM29CZoUsUrL4Y0MSIze6pSO5s7UQbvroMGSnYMkCMzqweXRpYMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
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

Hi Ravi,

On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
> Add support for GET_ERROR_THRESHOLD to fetch the current value of error
> threshold
>
> Cc: Purkait Soham <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Jadav Raag <raag.jadav@intel.com>
> Cc: Nilawar Badal <badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v2:Added a check whether error_threshold updated by valid callback or not
> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>     Jani & Kamil)
> ---
>   lib/igt_drm_netlink.c | 58 ++++++++++++++++++++++++++++++++++++++++---
>   lib/igt_drm_netlink.h |  2 ++
>   2 files changed, 57 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> index b18e3eeb6..1be7d4361 100644
> --- a/lib/igt_drm_netlink.c
> +++ b/lib/igt_drm_netlink.c
> @@ -40,6 +40,21 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>   		break;
>   	}
> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
> + struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
Could this be moved at the start of the function ? e.g:
struct nlattr *attrs[(DRM_RAS_A_ERROR_EVENT_ATTRS_MAX >
                   DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX ?
                   DRM_RAS_A_ERROR_EVENT_ATTRS_MAX :
                   DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX) + 1];
> +
> +		ret = genlmsg_parse(nlh, 0, attrs,
> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD])
> +			return NL_SKIP;
> +
> +		ctx->error_threshold =
> +			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
> +		break;
> +	}
>   	default:
>   		return NL_SKIP;
>   	}
> @@ -183,6 +198,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>   	}
>   
>   	switch (cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>   	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>   		ctx->response_required = true;
>   		ret = nla_put_u32(msg,
> @@ -233,6 +249,7 @@ static void reset_drm_ras_netlink_context(struct app_context *ctx)
>   	ctx->reply_received = false;
>   	ctx->ack_received = false;
>   	ctx->response_required = false;
> +	ctx->error_threshold = 0;
>   	ctx->family_id = -1;
>   }
>   
> @@ -283,10 +300,8 @@ int igt_drm_netlink_init(struct app_context *ctx)
>   	return 0;
>   }
>   
> -int igt_drm_netlink_get_error_counter(struct app_context *ctx)
> +static int validate_inputs(struct app_context *ctx, uint8_t cmd)
>   {
> -	int ret;
> -
>   	if (!ctx || !ctx->sock || ctx->family_id < 0)
>   		return -EINVAL;
>   
> @@ -299,6 +314,17 @@ int igt_drm_netlink_get_error_counter(struct app_context *ctx)
>   		return -EINVAL;
>   	}
>   
> +	return 0;
> +}
> +
> +int igt_drm_netlink_get_error_counter(struct app_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> +	if (ret < 0)
> +		return ret;
> +
>   	ctx->error_value = UINT32_MAX;
>   
>   	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> @@ -316,3 +342,29 @@ int igt_drm_netlink_get_error_counter(struct app_context *ctx)
>   
>   	return 0;
>   }
> +
> +int igt_drm_netlink_get_error_threshold(struct app_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->error_threshold = UINT32_MAX;

Could it be initialized with 0 ?

Thanks,
Soham
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ctx->error_threshold == UINT32_MAX) {
> +		igt_warn("No valid error threshold reply: node_id=%u error_id=%u kernel_error=%d\n",
> +			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
> +		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
> +	}
> +
> +	igt_debug("Retrieved error threshold: node_id=%u error_id=%u threshold=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> index 5db7f4ab5..89ef58243 100644
> --- a/lib/igt_drm_netlink.h
> +++ b/lib/igt_drm_netlink.h
> @@ -18,12 +18,14 @@ struct app_context {
>   	bool reply_received;
>   	bool ack_received;
>   	bool response_required;
> +	uint32_t error_threshold;
>   	int family_id;
>   };
>   
>   void igt_drm_netlink_cleanup(struct app_context *ctx);
>   int igt_drm_netlink_init(struct app_context *ctx);
>   int igt_drm_netlink_get_error_counter(struct app_context *ctx);
> +int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
>   
>   #endif /* IGT_DRM_NETLINK_H */
>   

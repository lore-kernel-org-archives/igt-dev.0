Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E08C79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 08:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B6710F380;
	Thu, 10 Sep 2026 08:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzQ4jtpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E404410F380
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789029988; x=1820565988;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KFrMXA+CqCrp3rV8jHxYOA7Q2PsPocQ0uXJ7nzIwYHY=;
 b=mzQ4jtplIFQI2ivyO3qvoG8KDLeY0MoP3ZLgrt7nMc5QFCRAMqR+2+Ol
 8dlh/woTwmTwFfZ/HnZAhXxjIIO0p+BlsyaMIYRXzX4k3yeH84A61dWE8
 2ARzjkHKUN+k560TMG1OWa2iFMKqO92ZTNr1DM8g0lSnKss5a0uucOVCW
 eyiBe0WRBgoa7gv4Z3Jo1jxIA/3/1dwvmgLI2G94amflkOxZaEbfn3KIa
 T1fxbAQ1OEvXnEsBAahXrv4WKuBS2+Y7jwMuqTLjr6lV3RWOLcZ0if6yP
 zv+XaqkWajGPHx8HSimeQN4woiMffFpqka+k8aNDOmpj51abropMoY8Cn g==;
X-CSE-ConnectionGUID: 17wIhQ/TTqeHb5SUZ3Q5uw==
X-CSE-MsgGUID: mhyQoh5vQbq7a3ihFIeiCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100828086"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="100828086"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 01:46:28 -0700
X-CSE-ConnectionGUID: RiyxsbU2STSNTyIZwqae8g==
X-CSE-MsgGUID: 4EEpxGXnQqWyxlrJ0iIwug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="275721929"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 01:46:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:46:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 01:46:26 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:46:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8SsQ/tih9zzrUsNvWRMO4F+BVcw8eBgD21J6sCV3E89pF3CYKPLVuduBvp0iO6Yeop9wa0LZF+Fciw2ot5zwLlDWwMbNYbbn82VuTXch60RaEpgLn41yeUFXKnzB6k2sxgH0zTrUpu75+PjaqbY1rNlnDGxeo+QEkKer5sxF0bzqsAOz/9aliem8bUcsVKfenlDdXe4qrGlpYWkkRfcAv1H6yxZVgn9VofbaVp7hXPR5rD+2N6n2oct3bqGN/Hc/POKIHin0Fp+BfGZ0AsGqoKHscI24XNTTXWx7pMj8wDIEVXciJkxUeKYrXXTUX+gn0hg+GqYrdqIhnXBQLHEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApY5mCGaS8SY1tOpe+O7a47LWQLKiX8DOBlAIe1pk7E=;
 b=vqxFvvE1BgKZupyDaAp+8QoseIhd3xZUjmMsf2NFhC2W+rlsVi2WHzuAYuyBRbNJWMaQLRxz6lDD3f39oKZ2SU7JrIRsjorGFOesrcQZXNZ29M5+tVCsdqq9lt3T5+0J/L4P665kFubCKCtV5G4tdqglfD2IKbLe+hnVklunli30oaPxVvnsYpCANIjF2NXh2CR8jJh9RJd22xOJHyjtZlK3TVt6j24HBHwmMKvm7zLmN3kcyT9A2bpxbwD3isxuLoAK1TAoDBz9aL05bPwR7wl7M5iJnCqiqj8wcl8AqMPdEd2Ey9eBUXNSu4iOEPX2rnp2PA62cH626wZxzIs+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) by
 LV2PR11MB824747.namprd11.prod.outlook.com (2603:10b6:408:416::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:46:25 +0000
Received: from DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::2e63:338a:bf30:7868]) by DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::2e63:338a:bf30:7868%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:46:24 +0000
Message-ID: <d04150a5-16a1-492d-8212-85bcfc2a37fd@intel.com>
Date: Thu, 10 Sep 2026 14:15:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] lib/meson: Add libnl dependencies for DRM RAS
 support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-3-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260903073335.339540-3-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8716:EE_|LV2PR11MB824747:EE_
X-MS-Office365-Filtering-Correlation-Id: 7915221e-fada-4d3a-5714-08df0f17f72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: W+hUYFTc4Efuuov0jseTwUxZ94cRYGOt7eBZ+flMWHnMoEyvqyMBTXPMAaavVVclg87xiI0Aw5vY6B7Vlk9eEyom8hQIZlBtqB155o/PR/DvTPZ3Jvz3lzuS6TXW7qRreyKhu1uWpfaXQi5bD6885Dj3BxlQUNSjLiM5HdS3yYOQwNTi7Cbzko8xw/CBRjbSWunHYKjSomr067VLRMo77YSDa1qxKl9ndA39N1yJvYvjiFmAkxrplRTt7EVOykQRy1kEiQ5m3zNbZEKNVCHU+ilDCFhdFNUQyvUtlempxMZETuz6m+EmBTMraV74repELb67HLv4iEB040JKmsMSvS4X5UkpJ/jsQ8zbfUDh/lsisKdYXImdMULQhqhq1Cz1IMBemTefY01qelGLxL1pZpMOVCO/zGNoCxaDmTQTPFn/drSKAuVzrCK4O7CaVzYIovqct+jIHGerHM0K3aSItm5DAt+FBzDQ4375gt9yiJxtVxQGUfDQhubgRKd0IgkjD5+psEqEXiee6V7YZvbPsVypWW2tMeo8c0zJrMDMpKg/dETOgMKWdqF+HFE/WBxvhEmQ+IAvb1VLPy8L+9bMhw8MAQLwfhvjZB19pK6og2nridbs8/WHf1+m/85HFyW5RnJO6yL6p+2PUVJa3TU4RYWY+zGpO2oAI/gg4HIL4M0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8716.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkllNkt1WWtaQ3dubVBpTTRVT0JubGE1ajFSUE1PdzM0Q0sxS21ma0pmZXY0?=
 =?utf-8?B?WVpuRXE5TVpVbWk3SUtQOVpFZFhEV2hXdTNVRWdQdVhYTFZPRHR4aUFPWEVh?=
 =?utf-8?B?ZXZ4cVE0dGdUTkpKU3BWZDJGVlVVWEFlL0xpQUk2SnBnaVlqYS9GT0FKYnJ3?=
 =?utf-8?B?aXFYMkJwYlhlc01JT3hOK3QyVDNGcmEwMmdGWktQY0FuUWRCMk10ZDlZcG90?=
 =?utf-8?B?Kzd3UzdMTXhlK0Z4QnRsZldoeTczKzJKa0p3L0pkL2M3SzlOVmtKaGRwdTVD?=
 =?utf-8?B?L2FGS0NkUHhVQlo3Y24yQ0VGQ1Z6cklhU3BQWUJralBnS2VDc0U1RUx6R09v?=
 =?utf-8?B?MmpTTlVFY0NoaWYzcEJwVzVjL1FBT1A5MGdHc0hld0NpZ2JyZnlwY3gvK0lu?=
 =?utf-8?B?L1FYeWlNNVoxNEM3RVRBeWdrOHIvWU1jUkZndXorb2tIbVg2ZklCcFdodU03?=
 =?utf-8?B?dVdkT1dOeklqUHowZTlKMFNxUG95UGFMZzNwZTNzSjR0ZUFBS1lUZTg4QkdC?=
 =?utf-8?B?aGJpamNXaC9OeGZ5UytiaGlFRXgyS0RLOWNnUmJiWmUwcGdhaTVHajNENjgx?=
 =?utf-8?B?QUZoOEUrcVdLRVlKdnZrRlNxZnZOckFxOHg0dGhkekZ0SmNEQnpvQUU0ejA0?=
 =?utf-8?B?eDczMHpwZ0k4d3p3N1Nrc1N3NzBWRkRxdFNZdEhmOW1JWVJud3hPcFovb3JK?=
 =?utf-8?B?aFBGdXl5T3FsVWRXYjdVYlhsKzBzc283VjFIK2NMZ1loSGozL2tSZmsvYm16?=
 =?utf-8?B?TjhZNDdUT2M2dDR3S2ZTaituZ2VmNHlOckp0czVUdzRrYlVMS2p5SkR3WkNR?=
 =?utf-8?B?eXNNWlptdXVoTzJDZ1FPMHl4L1JVV0hDbXd1akljNHVxcE1EV1cwZUFTN0N0?=
 =?utf-8?B?Qm5ZekFCd0NKbngvL0xIL2ExQThQYXJ3ak9idGdmUmtsM0ZiMnY3UDJUemRa?=
 =?utf-8?B?OElDQmR6RzVDdWJYZ2s0c1RaWDdRSTJBeHZSN1Y3RFNDeUE2NU15ek5VNGQr?=
 =?utf-8?B?c0IzdFNMcmd1dE0yZGc5c3JQakw3K1doeitkbU1JT050TWhXcWdXSzE0bzJv?=
 =?utf-8?B?S2xVeEwxZWtaM3lIOUt3SFBuNnZNdVJZMXZKVDU5bzZMSVE0OWQvcGhPZGk3?=
 =?utf-8?B?OTB2dGFDVThqMXY4Vzc4bnUwUDJ2VC8wWE5UbzZINENMTUlSaWsvNTlXbXZa?=
 =?utf-8?B?My9LNU40Nmt6R1cyVy9PWDBLdmZya2dYWnppMkhoYkcvSDEzaU5JbXI3eldL?=
 =?utf-8?B?TUlGSE1TYWJWcEZiVkdqUGNsc0htQ3NLdG42RG5jc2tCeElkL2xoWlNaTE5r?=
 =?utf-8?B?THZvaGFnQWZIaTM5UXRMNmcwK1dBdGI1NENwMTRSTDNCYmNYeGt6QVYwZHFM?=
 =?utf-8?B?dVdqcVZOdjNsVmZ6ckY5MHYzRkF4TDlmemF1Qkl0bzhqNE5iaWNEcGdMUnFQ?=
 =?utf-8?B?WEo1VWg0MEgyS2xzbTVpNGp4RkNYa2wyODhTbVNrcExvcnRpS2dwbGJyTUVn?=
 =?utf-8?B?RWg4a2Q0WkprNHNrNGZZMmxqZ0ZoclJxT0xXV3hCTUF3UTcwN05pWVlleHRo?=
 =?utf-8?B?cVFUUFhESnVheTZ1ZUZmWFlHc0N0QXhsYzZKNUZ0b0Zsb3pZbHBPaEhHc1JY?=
 =?utf-8?B?SnJhVWdoTzkyZEM0SHF0UWk4WGFuK3lWSG9BM0RKVitVa3RiOXFoOFdyR09J?=
 =?utf-8?B?ZHBsejJkWFArQVdVZmxVRUExUnJ1UmNsbGtWOWR1Zm44cmRRZ3pucTJnWVBZ?=
 =?utf-8?B?N1BlV3QvMUsycC9jTkpUQzNEOGdiYzFDbFl2QlMvb21IZC93TDY2K0ovYlNJ?=
 =?utf-8?B?L3g0VnFVTGtmdFd4Nmp6R1dnRGlvcER6KzZLY1pib1NQT2UrVGhFaDFmWUdR?=
 =?utf-8?B?ZTg5NE41bzdsNmRwLy9IS1ZpN0hQVW01TjJtd0RoY0c4RkgzSUJtNGxGRzU5?=
 =?utf-8?B?cTFVSFJ2OG1SZkdYNS94MmtjOHVHMmdvZHB3cEdrUVBRNVhpWUJsdTJ4djFz?=
 =?utf-8?B?K3FMaitEZTR0ZXJpT0hKRzkya2greDFlU2x0bUl5aXNYRkpSYzhMcVVKak9R?=
 =?utf-8?B?WS84Q2xhMDhCV3JOOVdNRmJUUUdVeSt6dG1XRGNJUGlNaERwNkx1QjAwd1Ns?=
 =?utf-8?B?MzJNL1R6QzRXdDBialo4Y3FDeWRoYW15bDA2Y3FBU0wzeXB3bDRKNFFjc2RD?=
 =?utf-8?B?aG5ubmV2Y3FFUzV6REF1bFVlVHN4amsxSjVHa0lrZ0xQK21mTVRFZVF2Rm1v?=
 =?utf-8?B?V1dKbC82eFE2enlvL01YMk90OHNvTlFVYlpBOEdSc3YyaFI3YlNUallnbmg3?=
 =?utf-8?B?bzdhdjJ3Y2R4bnBvNzl3K29WbW94bzRaUWNkTEdib0ZLUWlqdFVjNXNoOWdC?=
 =?utf-8?Q?6zYmmkj2fLK5CBe4=3D?=
X-Exchange-RoutingPolicyChecked: bQ7ZV7beoC6+8nA/ScWU5zh7Vz90ogK8yofikVtusJQK2zm9B5oyE5BieQji8dqryFEhvcUNsBdCLDrunL0auBpWRSFT72nz33poQZT0iDtpPXit0cB7b+NhR2Hw+I53iNZwFlvGcqN6MToA3m2dS8BX83hB3r2rT3oXLP3InHzGWakU6nNFnou/S6/oydlzSZ+MRz498OiE4C/bsqlg4ElhrQHA2J346HIMbegazz/i27SV3zIw06b1iuczTZKsVpRciMw5g5vqr7yr7AE1B1s4S8Cr5YjaYQ57dhsDmIQwPArlmWubk4NmOTUCXbqy2LaOGSwvAByVd7ZnpiOy1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7915221e-fada-4d3a-5714-08df0f17f72c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:46:24.8523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIRD2c96WCIXbM1Z4f77PHlUmpH70tU+8RgfuBKq5KLBbCa0YKl925vRjcFr5qyfcUwxcFzVchl7aZ2JN01SXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB824747
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
> Add the required libnl Generic Netlink dependencies for DRM RAS Netlink
> library support.
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
>   lib/meson.build | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/lib/meson.build b/lib/meson.build
> index 4af346b43..7248bbc2d 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -141,6 +141,13 @@ lib_sources = [
>   	'vendor/uwildmat/uwildmat.c',
>   ]
>   
> +libnl = declare_dependency(dependencies : [
> +	dependency('libnl-3.0', required : true),
> +	dependency('libnl-genl-3.0', required : true),
> +	dependency('libnl-cli-3.0', required : true),
Does libnl-cli really required ?
> +	dependency('libnl-utils', required : false),
Does  libnl-utils really required ?
Also for libnl-utils apt package exists but looks like ships no .pc 
file, so dependency still never resolves.

Thanks,
Soham
> +])
> +
>   lib_deps = [
>   	cairo,
>   	glib,
> @@ -148,6 +155,7 @@ lib_deps = [
>   	libdrm,
>   	libdw,
>   	libkmod,
> +        libnl,
>   	libpci,
>   	libudev,
>   	math,

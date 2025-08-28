Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D13FCA0FF7
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 19:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB13910EAA1;
	Thu, 28 Aug 2025 19:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgfQpxBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2EE10EAA1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756408748; x=1787944748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dT1i6N6CBxD+ZJ54cC/ztdsYDYe5y/xGLV9CaUqfVq4=;
 b=KgfQpxBnH2UH0QeaSacZuIkvoK5Zz9a5286wneIM3v7z15a0G0BvX4tg
 567V5Qo3UfYyw0brTc8nTa/wheFVQFBOjKW03dZz7FVQwHCAtQXS2YrF8
 DXIjpYUgALGijyt2Wpegq3iHDjooQLecohrvG8GKvzY3Z8WCG3sotOEY0
 s1K5f6Ov2ZJQT43KEiYi5IvO4/LxxiuewqPJMi8bW9rxdSLvoYvmsg6z/
 rwXdnX9nITLj6piPeOBS2ZTOrs2qSt+bNGBA/hsIr/mknSdZ6h335E8vn
 Ilg8YgbVsXxev99g4CZ6Kgi+NlDFR1Svw4UJvL8M8uXt1JkHwYrFk0Gky w==;
X-CSE-ConnectionGUID: VAQ4ye5jT42haFZJXNDXpA==
X-CSE-MsgGUID: HRthh6HJSlmbw48x5XqQKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84093607"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84093607"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 12:19:07 -0700
X-CSE-ConnectionGUID: fpNmngYNSvufg+V+ER3BAQ==
X-CSE-MsgGUID: TaOFx9+PSCKyRaV6QI2GWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="207339895"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 12:19:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 12:19:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 12:19:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.84)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 12:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPzRbgmbfaui/sS7e03fgQ+zboT8jOkvtmEhot6Db5+jmShtLLy/hm/3epDTUmO70jWSNXEcVKpp/YnCO9MMBmMElHTn3kbaoKFAsD7WnjdaJs7wnnMTEqEy0h47/i/6EpVBNeflmNSEM8iBtZUx1pk/sfznP7XQ/hFrSsC/EdUEsCmcrCeDhMsbbjCEpYMfRWBxGuEjK2muiQPLV8XHBtB7jCQAnkxqMjuEDAvWBG6z6/sSrTHVV9W8zNv+nAx3/I6fcQw71M/auEVBlnep6mh2e2q+4TbaLq4DsyOqNDqR9N/haK4NT23cPdMnPEcr29p5zE98yfPkXjBzsZHojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+lI90Shp6x1iMMH/FagWShtt20xYGk/uzGAVJCq1zo=;
 b=CjOXeMIvw664vkpoE5626dlvRuHekurDmBCGDF7ILzkwfql6nEdP2TR6c41Gv2DqXwTip8K/IC3IFLCLFnqCjWPOf+KY90dRuteIzPeyrXJKzb3S2k/IbgetQEWOxrT9wwkxydo6w7HGalfCscinLrZuzWMlMX9emZe8eTfxgUMjYTniehLMoVXluq30WaMmrib/YNqrZbaEegu491ZVhjlbm6zWTBWmHNAWjBHUZ4hOxk7k+T3foYRmh28XzYRzGthD1qbn8Jf6D5vp4656oIydj0kruLAEca7el4+fHfytJf8VyMG4Xijtl9TslbYcJZiMoMipyY3I+RdlOlXrbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ5PPFBD6B1667A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 19:18:59 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 19:18:59 +0000
Message-ID: <3ffa415b-e3b7-4921-a53d-874d3f3d24e0@intel.com>
Date: Fri, 29 Aug 2025 00:48:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 2/3] tests/kms_hdr: Set HDR meta-data while
 testing for panel capability
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250828093913.1630962-1-chaitanya.kumar.borah@intel.com>
 <20250828093913.1630962-2-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250828093913.1630962-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ5PPFBD6B1667A:EE_
X-MS-Office365-Filtering-Correlation-Id: 594d10c4-062e-4a1c-01b3-08dde667bd3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlkrVElCc0lvYU9GV0tPWHVQQ3lmNDlzS3gvazNaSDk3aFloMXNGV3MwVnN6?=
 =?utf-8?B?LzViQUFJR1U2SGdDaFpCeGJ0dk9nTURzY1VLYjJEMWUrTm1nVkI0TGlaSGNL?=
 =?utf-8?B?bXBUSlNKMW9OemdtZVFqbDRzbDROaVM3aFhZeXB5bUNIeWRML0VQVVN1aFA3?=
 =?utf-8?B?aENyR2xKK1g2SnRMb0hnSlBZWG42NGpmUnVxQVJMT0dwd3NXa0VLWi9TcjZH?=
 =?utf-8?B?Rm84UmtsVWFwa1hKMnJBaWViRXhmckdRczJTL2xLdnZac29ENU00RFVGOVZI?=
 =?utf-8?B?REJ1ampFM1RqQmlxZmpVaVlET3BjdmdqZWtLZ0U1NmsvTCtlRFJ3NkRHbWxy?=
 =?utf-8?B?NEZ5Ny8wYU1VR3lrY2Y1UnZUV2U2SmdWQ2ZzZ1Fkbisva2ErSFZScnprKzRp?=
 =?utf-8?B?QVpnMlFsRGJhdFZkQVFtd3QydW4wQXhzTFNTMU9iMzVnSnQzMlJITjlVVnkz?=
 =?utf-8?B?UmRkdTlTNjdaNjVUOVNrTE5HcSt6WHFpWDExVExIRDBDbXc1YzFHV08zRmc5?=
 =?utf-8?B?RHhreFZlKzN1M2ZJYzMzdkp0WEc2UWJRcUE5RnpmbVQvWFNnL3RWay9JY0JQ?=
 =?utf-8?B?S0xZWWViNU9XamlOb3NrdHBzNlZKU1lEeXNDWmdGVmhtUG9KcFRDdXZpUXpV?=
 =?utf-8?B?ZDJCWXpKdVg2TFNiL1lMTVpUWFRLaWVIUkkxNGIrdlFOd1hZaGVISWhvcGlP?=
 =?utf-8?B?VzVXdW1yMGdWK1dwYnE0S2xDcUNzNzI3eklOSlRmcGtwNkpnZ2VUTzUzMGRl?=
 =?utf-8?B?WDNHT3hyeFJMbUJyTEZWUk1ua2F3SXkxRmxSaXl4YTlJVHplY3ppVHdFd01v?=
 =?utf-8?B?ajJicS9wa0p1ZkxSOW1ybjhHUnpVcW5OQ3FMQkFTMmJYb2gxd0VJWFJyR1VD?=
 =?utf-8?B?SXhVRGlTUjJyL0RMTUVIRHRyQktEWkJTRlp0UXk2UERhbmlZcnpHdnVGQ2E1?=
 =?utf-8?B?eDEvY0dFRDRZbFVMbDZHSEZOMkxCMFdRRnNldm8rRlR0NkZLdHhOSE1ydFpT?=
 =?utf-8?B?QmxBOW5vY05pbGxwT1JBVjU3cGNxcFlxUEZ0UFRWR3ZTSE5lTGg3Q1dldUkx?=
 =?utf-8?B?bzJyTTNSMXA2cDhBZnBjc3lwcmtZdTBkeDBxQU9TMWtReWdxS1JGUlcvdDJ4?=
 =?utf-8?B?T1lWUDhCQVRQaGVLU1dnZDBnc1huUlNVMm1xMTJ4bTFaVDFGNzVsZldqMzJX?=
 =?utf-8?B?NXRZcTA4MEFURHA5S2lkYW53MjlYcEdkaWtZK2YvaUR5M0E1QVYrWFpwOTJ4?=
 =?utf-8?B?TEdQcEx0aGc0M01SalY0YUJ4NkN2WjRQWTQzQW05SldzMFdORGZJWXY1ckND?=
 =?utf-8?B?bWMrQVNvUk40WVovSTE4NjRSaWozZmhlQzN2dDM2WU9jWlJqLzhpRjZVcWhu?=
 =?utf-8?B?MXZESTcvQlYyTElIcVIvb2ZjNjA5S3liaUV3VG5Gb01WRVVxUGlvaDJNSkto?=
 =?utf-8?B?c0ZqWWxvQ21jbnIzaUZGc29WNGxYTGZtbEVMaklodVQ4SXZDdCt4aDVSSzQ0?=
 =?utf-8?B?SG1iMVNsakhxS1R3cVZPQW5TUzFtbVhYL1BYSE5yNnNjYlRDb0pYdWZaMnBX?=
 =?utf-8?B?UExIVkVwclNKMmI2QmtmYnNBY3R2Y2FpZG5USGphWk9MazAzZGNiTmhsU0NM?=
 =?utf-8?B?WmkwU01Ld1hjL0VWSGk1cVU1M1hyTUNhMllQc0drazNrZGhLTzIwN25CTmpS?=
 =?utf-8?B?N0k2ejVjSEtvMzJ2M20vdlJIM0lPRGFXTlJUbHFJU0FUNUZSOE53VWhscmNF?=
 =?utf-8?B?cVkxc3RScUVzQ0dvZmV4WWRDajZJY2hsUTRpeE5OK296Y1o1RmxSSjM4WDNK?=
 =?utf-8?B?bkFHeHZsTm1GUGthQVIvYUZIazFjOHVKZWlwdkNxeXZXdGJlQzdiWElVaXA2?=
 =?utf-8?B?S3Z6RHlISk4zY2wxM2xMdGpwbTZzSEFjTkh2UHliVTNtcUhCeUEzaWFpQ2kz?=
 =?utf-8?Q?ceRMbV510fw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnV2Wk5rZUIvc2ZjellxRURWRDgxUUVQZ2Q5aWQ0bDNUNE0wQWNoTjI1N0kz?=
 =?utf-8?B?amMyd29rWGsxcjFRU2trNXVvZjkxVXY2cGRwUk5VRkk2V2gxNFVxRWUrK0J6?=
 =?utf-8?B?dWl4dzJ6bXREdUdZQjFTVnluR3k5SXdMVTkwZDBpSzA2N0lXN2tEOVIrSFg3?=
 =?utf-8?B?d3d4bjdaOS9IdVMyWnRPQnRtbVNFWE4zT09jQXpDMzVUSWJKRkdVSzhQWUEw?=
 =?utf-8?B?bG8rTEEyZER3QWx1dG9iRFFsQ0p1MTh3Z1JzeFdycTA0MGltZWtMQ0JwUG1E?=
 =?utf-8?B?dWFZbDEzYXFqekVFcnIvY0VPcWlERFFDV1RqeVZmeHV2VFlRby96cngzdXds?=
 =?utf-8?B?SXBBWGVETEE1SFQ4aGVuRUt1dXM1bWJGeTBlQk1QS0x1ZnBINzBlNUxBazlP?=
 =?utf-8?B?a1hFT1NUWXN4cEt5blBEVlV6OCtyaVIzcTVoY2JCbURSTTFQdVNVL0tIWjNY?=
 =?utf-8?B?SEhFVWp2VlZaa04xS2wrMFB5TlloVEZmZ3QwZWgzTkl3SkdVNVBWb0NJdHRQ?=
 =?utf-8?B?RkVwbHl1aExFNFAwMzNkMnNOOG0xa0dCVzJaeG5RbitsS3h5dG8yd1ZjV0xP?=
 =?utf-8?B?dHRUK25uUmdJQTN6UkpuSURDejQ1M0NPaWwwWnFoUStGcTUwTnBqUkk3TjBV?=
 =?utf-8?B?K3BMdFVQSFY2elZDTXljWU90ZU03U1k0NmhWQXNzREgrWENUUWt1d20yc3Iz?=
 =?utf-8?B?TG9HTm5aOVRtcnVCT3ZPQXp2YlJuK0lpUXlIMFkyRTV3bjBRNTBKTVAwR1dO?=
 =?utf-8?B?TWFJWm11SUdncE5YRitqSUR3ejFpelBwZHp0UkljbWk0elFEdEhUUlp1eWlK?=
 =?utf-8?B?UUdsUmVuTDFMZWZEOG8vd0dXYUJxZXMrZ1A3SUhGQUNhWWRyMlJaYzZsdUJC?=
 =?utf-8?B?NzlJWDRXd3BtZndKeGRnYlJibDBuY3Q0YlhzV1A3STc5SU1OY1M3dHZZMHlQ?=
 =?utf-8?B?eHJrdU5taTlpNUloSVNJdWF6Y1UrM0NqaEtRbUJGK0hUdDVCd0NocnhnRkla?=
 =?utf-8?B?OHF6eU12UzNtbk9ocElQK050SFZIdG45dTJqeFlZNzdNWDN1TzEwSStxT2lJ?=
 =?utf-8?B?ZFZRZ1R2VUNIc2lTb1RlUjRiQXhjNnJvbzliUDRobWhTaE5rL2daNzZybTVr?=
 =?utf-8?B?Tm9kV1g2Q2w5dDNhZjI0a2dGNGNyWXhwL0RHK2lVengzalhPTHFHZEhtV3lX?=
 =?utf-8?B?OVg4RDI5N2JGSlVnNzZIU1FuR20vTW5mM0V0UCt1Q1ByZUMxZ1lGbU9HRFg5?=
 =?utf-8?B?RnZzc0d0N1JNZitSU2d6R2hkd0FkV0grMm81RDR4MkJPelVVTTVQeEVPaHpX?=
 =?utf-8?B?dnhmcXRwbktXUVIxT2ZjQ1EyVys0T0JSbCtOTy9qQURUTXRnSXFvRGxlSWFP?=
 =?utf-8?B?UjVyclhvMVhBTVZmNTZKdm9WeEhBazRhd2RndlBOdkxXWmJXRlJUa3VnOG93?=
 =?utf-8?B?QXpQdzk0U2NBRmRyd094NGlsWklueUV6Nngwa3pKa0MwdUNZWTY4QXhneS81?=
 =?utf-8?B?T05paVMzalpKWTIvd0piS2d2VkZHK2JNNjdvZWtkNVZja0N6dVY4eEw5S0Vl?=
 =?utf-8?B?Vm83a3o0clAvWXQ1RG0yTTVrL25sMGJSNXd0T0Nrbi9LeE9HMU1zenQ3Nktl?=
 =?utf-8?B?L3YyZkpDQi95MjFrNzhIK2IvQXBmMXJxcE9WVnd4Qk5zdkl3NUxyaStiM1VF?=
 =?utf-8?B?VitiVjJiUjNobURoWEJnVnl6OGFlMGZyK3grY2RMdFBFVE95YXFUN0s1UG16?=
 =?utf-8?B?T3RSNk5ESlpmY0t0Z0RGYVVTc252NUtkN0laSS9tQ2I2K21oZWxNZVRCOG94?=
 =?utf-8?B?d1hiUUw5aERLaERnNFhXYzF2TnpzUnYrNmNhSFRLamo4aWFuM2thS3hLNU13?=
 =?utf-8?B?TGJLS1h5WkJRU2RYcUJybytCakJBUUxOTWU1QmJJd2s5ZzV6WWNOMVFkMHU2?=
 =?utf-8?B?N3hGZGdaaEZZUkxTR21lazJuUXBZZEY4ZytzUGQ0VnlQc3hyYUcxYXdKQ2Rx?=
 =?utf-8?B?Zjcvczd4a1hEZUJuMzNKb3VwdlNIRU1uQkRKbTBpRzRGQURwWW4wd3g5ZGI2?=
 =?utf-8?B?NERJMXJyVHFaZzk0aEhGUVpoK1VTcFRSaHNObit2NWIrZXkyY0FzcUhneXhr?=
 =?utf-8?B?dDBnRnpFVmx5MnA1dERkRTFQMnBNYmFKN1A0WFdSVmtKNUp4TVpxK0dlMW0y?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 594d10c4-062e-4a1c-01b3-08dde667bd3e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 19:18:59.1274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khhE0i0YlFV0RjUNkkpB2ZZdfi3GWWzgtHknd6FFUG6fg2MBTk9PUW9MHHniHX0XrukwGmBAEnJsjs25sVNbmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBD6B1667A
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

Hi Chaitanya,


Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 28-08-2025 03:09 pm, Chaitanya Kumar Borah wrote:
> Setting max_bpc simply configures the pipeline to drive
> 10 bits per color channel, but HDR requires more than higher bit
> depth. HDR also depends on metadata such as EOTF, peak luminance,
> and colorimetry.
>
> Update the test to set HDR metadata on the connector to signal that
> we need an HDR pipeline, before running through the modes. Reset
> it afterwards.
>
> If setting HDR metadata fails for all advertised modes on a supported
> panel, it implies the kernel cannot drive HDR — for example, due to
> bandwidth limitations.
>
> v2:
> 	- Update commit message (Swati)
> 	- Add comment on why we set HDR meta data (Swati)
> 	- Commit after setting HDR meta data (Swati)
>
> v3:
> 	- Handle error while committing meta data (Swati)
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_hdr.c | 122 +++++++++++++++++++++++++++---------------------
>   1 file changed, 69 insertions(+), 53 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 33b6c42a6..41fbf3766 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -153,6 +153,59 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>   	igt_put_cairo_ctx(cr);
>   }
>   
> +/* Converts a double to 861-G spec FP format. */
> +static uint16_t calc_hdr_float(double val)
> +{
> +	return (uint16_t)(val * 50000.0);
> +}
> +
> +/* Fills some test values for ST2048 HDR output metadata.
> + *
> + * Note: there isn't really a standard for what the metadata is supposed
> + * to do on the display side of things. The display is free to ignore it
> + * and clip the output, use it to help tonemap to the content range,
> + * or do anything they want, really.
> + */
> +static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
> +{
> +	memset(meta, 0, sizeof(*meta));
> +
> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> +
> +	/* Rec. 2020 */
> +	meta->hdmi_metadata_type1.display_primaries[0].x =
> +		calc_hdr_float(0.708); /* Red */
> +	meta->hdmi_metadata_type1.display_primaries[0].y =
> +		calc_hdr_float(0.292);
> +	meta->hdmi_metadata_type1.display_primaries[1].x =
> +		calc_hdr_float(0.170); /* Green */
> +	meta->hdmi_metadata_type1.display_primaries[1].y =
> +		calc_hdr_float(0.797);
> +	meta->hdmi_metadata_type1.display_primaries[2].x =
> +		calc_hdr_float(0.131); /* Blue */
> +	meta->hdmi_metadata_type1.display_primaries[2].y =
> +		calc_hdr_float(0.046);
> +	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> +	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> +
> +	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> +		1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> +		500;				   /* 0.05 nits */
> +	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> +}
> +
> +/* Sets the HDR output metadata prop. */
> +static void set_hdr_output_metadata(data_t *data,
> +				    struct hdr_output_metadata const *meta)
> +{
> +	igt_output_replace_prop_blob(data->output,
> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
> +				     meta ? sizeof(*meta) : 0);
> +}
> +
>   /* Prepare test data. */
>   static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   {
> @@ -380,15 +433,6 @@ static bool is_panel_hdr(data_t *data, igt_output_t *output)
>   	return ret;
>   }
>   
> -/* Sets the HDR output metadata prop. */
> -static void set_hdr_output_metadata(data_t *data,
> -				    struct hdr_output_metadata const *meta)
> -{
> -	igt_output_replace_prop_blob(data->output,
> -				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
> -				     meta ? sizeof(*meta) : 0);
> -}
> -
>   /* Sets the HDR output metadata prop with invalid size. */
>   static int set_invalid_hdr_output_metadata(data_t *data,
>   					   struct hdr_output_metadata const *meta,
> @@ -401,50 +445,6 @@ static int set_invalid_hdr_output_metadata(data_t *data,
>   	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   }
>   
> -/* Converts a double to 861-G spec FP format. */
> -static uint16_t calc_hdr_float(double val)
> -{
> -	return (uint16_t)(val * 50000.0);
> -}
> -
> -/* Fills some test values for ST2048 HDR output metadata.
> - *
> - * Note: there isn't really a standard for what the metadata is supposed
> - * to do on the display side of things. The display is free to ignore it
> - * and clip the output, use it to help tonemap to the content range,
> - * or do anything they want, really.
> - */
> -static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
> -{
> -	memset(meta, 0, sizeof(*meta));
> -
> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> -
> -	/* Rec. 2020 */
> -	meta->hdmi_metadata_type1.display_primaries[0].x =
> -		calc_hdr_float(0.708); /* Red */
> -	meta->hdmi_metadata_type1.display_primaries[0].y =
> -		calc_hdr_float(0.292);
> -	meta->hdmi_metadata_type1.display_primaries[1].x =
> -		calc_hdr_float(0.170); /* Green */
> -	meta->hdmi_metadata_type1.display_primaries[1].y =
> -		calc_hdr_float(0.797);
> -	meta->hdmi_metadata_type1.display_primaries[2].x =
> -		calc_hdr_float(0.131); /* Blue */
> -	meta->hdmi_metadata_type1.display_primaries[2].y =
> -		calc_hdr_float(0.046);
> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> -
> -	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> -		1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> -		500;				   /* 0.05 nits */
> -	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> -}
> -
>   static void adjust_brightness(data_t *data, uint32_t flags)
>   {
>   	igt_backlight_context_t context;
> @@ -652,6 +652,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> +	struct hdr_output_metadata hdr;
>   
>   	igt_display_reset(display);
>   
> @@ -701,6 +702,17 @@ static void test_hdr(data_t *data, uint32_t flags)
>   
>   			prepare_test(data, output, pipe);
>   
> +			/* Signal HDR requirement via metadata */
> +			fill_hdr_output_metadata_st2048(&hdr);
> +			set_hdr_output_metadata(data, &hdr);
> +			if (igt_display_try_commit2(display, display->is_atomic ?
> +						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
> +				igt_info("%s: Couldn't set HDR metadata\n",
> +					 igt_output_name(output));
> +				test_fini(data);
> +				break;
> +			}
> +
>   			if (is_intel_device(data->fd) &&
>   			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
>   				igt_info("%s: No suitable mode found to use 10 bpc.\n",
> @@ -710,6 +722,10 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				break;
>   			}
>   
> +			set_hdr_output_metadata(data, NULL);
> +			igt_display_commit2(display, display->is_atomic ?
> +					    COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   			data->mode = igt_output_get_mode(output);
>   			data->w = data->mode->hdisplay;
>   			data->h = data->mode->vdisplay;


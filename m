Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1E7C44515
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 17:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CBB10E3A8;
	Thu, 16 Jul 2026 17:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHG8MNJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3494B10E3A8
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784223003; x=1815759003;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8IykItH45cwdfNkWDUZbt8WK/YcNKF+C+UWghPVl7kg=;
 b=AHG8MNJSRHdx8Tho1OaM3qZtINK9iDfUoE80HllSmW/5RMicyFyFs2Sn
 UIYxPqIbZqBJlAuYyL+uNxyoOyyxXGKLnA7wNI/EDCBiMcyiHaaPrjnhY
 BewCNwV2sUuZSYXpmbRtJpw6ive2hvvwGSG5fkIHfS5qqZXJKFX1WG7xb
 bhmAP9fCw9kuzpBIRHK7O29Oo3JdbkJKh3aptMYA6QdtU7QnIsLF+FReZ
 PK05T2LUehm+jM2CgWH81LL0insugBbUyQToA3A/dE9SyqQtpvtYXezBg
 nP/bAwdFNTTh8cPVzOF2BmBGtv2HyilAved+XPr8yWyvQHFZU3M33QoBM w==;
X-CSE-ConnectionGUID: QvR7oOPuQGOp6QPmK1/DuQ==
X-CSE-MsgGUID: d9gmyYoKSDCIawrKgdXABA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95491556"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="95491556"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 10:30:03 -0700
X-CSE-ConnectionGUID: 2lDdxEpkQ3SL2r1Qr9EeAQ==
X-CSE-MsgGUID: +P5WGJxyQQ25tTNqzRR/dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="252568421"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 10:30:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 10:30:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 10:30:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 10:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmZMofETb02aeRO05kj3No6EhaWH73aKW8S9CoDG31GCqLCV2KTJYcnuN6XzXOXa5bkkSWDDsxYDgHk9H0hhm7tMbzxhoqTZT7+jwKhhTbXTP5hKPoTVs66HvrKKKyGo8igU5bxe/i/ENFpzauYE5yYU8+0GoZxSClwnEOfUPDP9rpKtDifiRIUrroSN1h8svjPUS246VZnuciz9urME84/QZp5DfoOpuMXeXQPAOBB26eX3MSOaX2ifZKYGtnhTMJIqHZYlUOfoq1M3iPZufvQnNmHZHm1010+2h1/uM1lnULrDfeBwXm1xaauVecdtswvQ7KzDZU9MoNBCypXXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Rgpu/s8jHk+3nemAIAtYNJeFXId22AgX/A/nW7d+x8=;
 b=imacCkikryQtmVfsvXtruV8f+tPZfW9+uRywT/gMIjOZow+J3Rhmxns5VzvCZuF+e/0ukh8MUBpZp161N3km/ZlxDNdEoakGkRF6eazwtMioW+fw4pYLg26Ud0cEwctuaxSGHB8qhgdsYNoVHqhieHAdDRMRKk8r1GS7+P68oeuNTqaIkg7NgY2kVZ/H5kXCrZnXd99nq6a1mGjyDB2HX8/NrJNUZ4srVDOcRCluQ3nKsQ3PESpcbRNYyi5SVJaXDK52zISImvIlQbhYBImzOHZCiA0HgMi2qpOsKdJSr35St5kOe4fC6eF4fWkHIhEfrQQYvIq2PaesHj3XCFEhzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 17:29:52 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 17:29:52 +0000
Message-ID: <a749c4b6-c762-4f0c-880f-4699a6fe8873@intel.com>
Date: Thu, 16 Jul 2026 22:59:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] kms/vrr: Trigger modeset for non-preferred
 override mode
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
References: <20260704051925.2165079-1-ramanaidu.naladala@intel.com>
 <DM4PR11MB6312ED6EB582156C9FE9941790FA2@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <DM4PR11MB6312ED6EB582156C9FE9941790FA2@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0179.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::11) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: 7245b174-14cb-4a49-a56f-08dee35fd87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: QTkl25BikpPwocyOu3athYsU1t0dX4mmXov9Yc/8FYggqqSSAn+wqaehgXx7gs9CInPKY54wuaiw2BoYjRue6p9nVnTfsTm/fDsBTquyMh75saG8TjpDLa/7sNYXJiO1/3dmFZlQUEYNXULy/U7GWZtwAnsV8oSmvX99/B0tfvGmMPAIrEHlknWJ1BqCRMqPeLIqOVtC64k5NsRIAjcYhxKSl83W4FhZR8XH06KNGA9GtF+/qjD3bWcdX2aYdk/MmHT4etvlEJ6jHIbZvagKOaPC32D78QIlQ/uczQO/IPl02+Obz8gt1LMlDMRTUFgN+zAyjSz7fk1d30lf8ZzJcr0tRxF0xMzZC2VKMDVKEydlE0ZwGwAsVqF0DNcPlU0TCEQktOH1mvLafgjfOMlbQovukbYqFlsqCuhaIPy2fg3TDcpyXgauFdynAC4NvtLUHsmSDX7AbQ5P1nmFFArXWJdgDcbqd0mwCXpnFudUsQn3IWMzPYN9PkHsV5F326m7VMNjV/OlEmcoIhZsjDhnAxd2dqXuQkNtSBNmsdm2OCxHEDU4g7XKa64qcFzgw6cPrBVFNCsUqMbClXUHEiG8SZp0GBAHRyRVDy/2k+1Z2mrg7HZkFLjc59XmZPx17Vmv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pQdmthazExajA4dXQ1V0Y2RjIwU2Q4QXlQSnZqNTZwVFBPZXNHS2NOMkFl?=
 =?utf-8?B?d040Q1B2Zis0RlRrQ0VwTWRaNGhkTXo2TjMwVjk5MHZVZmt1MHdvbkFXaVo0?=
 =?utf-8?B?b0F6YVU1aTkzUThKa2RSVU5uZFVXUE9NNklmZFdxS0JuN3o2UUNRb0l0cGVT?=
 =?utf-8?B?UEw1aFB6Q1Q5VGh5N011RkdrSEtqcHRLUmtFZE82S0JxM3ptdTdOZTh0RDNO?=
 =?utf-8?B?blVEZnBPTHlLQjQ1ZWJVaWVYc0IrWWd0QXZvZzFHTlNBa3YrRSs2UitlU21v?=
 =?utf-8?B?dXB2enlXMjRMYytNdU5aMHBXcmRwNnF2T2R5YWwrY1pwTkRkbGZOdU5mUWN3?=
 =?utf-8?B?UXpNVitCWWtoVGQrRTVkMmJhMnZNNlA2NmY1NFlCcWFFcURIUFM1eXdlc1k2?=
 =?utf-8?B?WEs3bm5BaGJwTTB4bnZLclZMNDhqcWRPV0Y4TXl0bkpLWG9WUGhiVVgxdEJY?=
 =?utf-8?B?WHk4SGFsOTQ4a2lzdTl1UHVwV3ozUzhGb25laWJhUzV2QjlWRGxOamRrQU1q?=
 =?utf-8?B?eHRsMjZvV3FYdEFCd2RGOXVEZERpUUJMT3hUSUx2VEJBbkFZSFBSb0E5UUly?=
 =?utf-8?B?MWg2MTdxY1VtVXIvdEhmRExGSUlCSTFtRHJDNjk0b0hHa1N2UmRvL2R1VDM1?=
 =?utf-8?B?L1lKZFFhYnRuQWpHMnQxZ1E2eFEvYmt2S2wyaWFQYUN3YUlmS1paQmZMNGF5?=
 =?utf-8?B?VjFHbFBNMmdXbFF4NlFTTjZPZDN6bTVXbVI5THRJVmtsSTFBVjJMU0pUQmZU?=
 =?utf-8?B?dHlLM2ZuenoveGRHNk9YZDNrZUVxVXQ2b3hqeGJZSnJlS0oreWcrT1dUZndn?=
 =?utf-8?B?UDV1UG5mcUV3QjFKMThHWW1wRGNqaUc0Ni9TZ1J4TGpqRSs1bDZhMEFNUm1k?=
 =?utf-8?B?Y3lqQ1ZRMkQzSys2WXpsOE9aQy9Ba0t3NGE4bnZBa1lTU3lITnBwOHFnNTVl?=
 =?utf-8?B?ZDBteFlvSytRSWFkMkRYYUpvdzIvVnhiMDd4bC8yYUYxY3ViYzdmN0xaNVBj?=
 =?utf-8?B?WGhod3UwTDI2b0ZGVG45ZER1eEVMRWlCdExTMGtSQVRjRVdNb0JkK1Q2U1BF?=
 =?utf-8?B?RjMwYm1EeGpxSzFXK01TcXJxMFNKRFNTblhyUXE3M1RZVk5wdnYydGNJVlJm?=
 =?utf-8?B?Vm1BbEYyU2ZHV3pOUGQrVmI1Z1AvNzhIUkRSSDI4MlJBTkZEbzUrdzlDQUhQ?=
 =?utf-8?B?TExIOVZrZWdsUFBWY0FGeUtDMmE5UFpUaERtY3pGWDNQVDJLRkpBaE1ScnZr?=
 =?utf-8?B?YkNnKzlaVzdnOEZadjJwK0k0R3VCdDNuT1ltYkpySCt2ZTdXblhTWkNIeUtN?=
 =?utf-8?B?MCtIelhZb0xTZklnUlF1cnd2QndKcGlMeTlhMkVHb0J3VldFR1JkcnY5blNi?=
 =?utf-8?B?bUM4SWhlY09kVTNwYmEwdVRYTUZMNXIvZ25UaWFJSDZKSlhSd0ZwVW1xS2xV?=
 =?utf-8?B?dGxjV0dobWZXZkVuWDh3bTJxWno4MHVzSW43NmliNkhHaXJqTW5DYnlGU0tK?=
 =?utf-8?B?dUdnVit0WUkxYVBNMXFKSlBMZE52RVl0enR2RitGd0U1M3ZPVkphQ1hmbzFi?=
 =?utf-8?B?TnIvbjM4NzdiWGYrZlBNMnBsU3VucTlzVTN3QzVZZjF4S05rRHpyZFRPRitM?=
 =?utf-8?B?d1hZOWE1MlM1MzFzb0NXTTRsdEpzNjdrd2N2VWtUaVdPZkNnZFZYdkdZeVI2?=
 =?utf-8?B?UHgzSjNwTUdQcUp5Tk8vU25mQVIxTCtCc2d2c1VOaWVBQVZQM2VwUG9jS3JE?=
 =?utf-8?B?UVVaVGNTVjhrUzVNNjdzSk5NVGZQN0xwVlBOdElPQXBRQTlSQzFralB3eGFB?=
 =?utf-8?B?RkgrRHFHWjlSZ3QrdFd4TVZUOElxeFlTQmF2VjVpWU9uK1lML1dzVmpLVzg2?=
 =?utf-8?B?a0s5bU1kcmE3SXlRb1p4TU5qell1clUyT3M3WWNGMjRQTGI5OFozRzZrb3Rt?=
 =?utf-8?B?VWh6dFNSK1hlYis0bTlERVhmWXhrOXVzck8yRVFDUGhvTkE4N2RTT2lpSVBq?=
 =?utf-8?B?cjNZQkhHTkdkcHRPQWRqNFJrMHZwNDNXNTJCd0k3OStXT3d3Z2FvYm0xaklL?=
 =?utf-8?B?NTdkbUlDRzg5N2xNUHFKa21ZeDBnV0Izb0UxVWZoeDFPWXZUbko2TjdXdmww?=
 =?utf-8?B?Uk1oTGtDR09TYnhxS29lbEgrM1lSdWpXV241eFNOckRqYW5NczJObFA0eVRG?=
 =?utf-8?B?S0huTE9ZVW1wSTJuNGtzbnpxejcraVBvQUhpLy8vWHBYRmtINHBNLzBGUXpq?=
 =?utf-8?B?V1VQTXNmcXh0Rmh1MnhVVGQ0a2R3RDhPb0JGS3RUWlcvM3BONGlIZ1BicFZ6?=
 =?utf-8?B?L0dYTzNOTUJ6aDREejJ1aThmbnA0eW0wWWpBbWhTVkM2clVjSFBqU09nYWR1?=
 =?utf-8?Q?QTU+b7HYuKeuje30=3D?=
X-Exchange-RoutingPolicyChecked: Aoy0n5B8BCh+lmxUiByMO/CIQjFPfyslj6nIJHJ+AeomVlDEPMrIHSQXPLxmpaZ5l6G5g6yRjhjWLKTHSumMXKxYIbwJIOsvweq85Ca/uHSZ1DkwK9fOCSt2OcmyQBo+/bpIG0Y3ATSmqqD+e6I5E5PtFO6tfqCtML4P+FIJbQ62sfjSk4Uw/QorvEbxM7w7TsrcMKKIyulCWhGWei7auTrbTuH94ogxJt34mQydkiTihdndU7vPIVaS1ereOoiqqwF6+oqnlbfpbKPpw3f6aDKyQc6rGNoX4Toirz2tBoVM1F0QrPUyDKR/kysU9jN630XwqiIw+pSRGoGUJJLHIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7245b174-14cb-4a49-a56f-08dee35fd87a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 17:29:52.8028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2EM84dbSiwNHGYYNFe5/nLeXfT9hvq/5fdYTf+TCXSgYYOHAELa2vtHv0h+3J2ZuV/k1q8BeQL+CmoPu42FrMkGaVi9/EpGC/hUvHdOVk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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

Hi Jevan,

Thanks for the feedback.

On 7/13/2026 9:05 AM, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Naladala
>> Ramanaidu
>> Sent: Saturday, July 4, 2026 10:49 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
>> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v1] kms/vrr: Trigger modeset for non-preferred override
>> mode
> Need to change kms/vrr to tests/kms_vrr
>> Ensure a modeset is triggered when overriding to a mode that is not marked as
>> PREFERRED or DRIVER. This guarantees that the new refresh rate mode is
>> properly programmed into hardware instead of relying on an existing state.
>>
>> Observed fastset failures when the preferred mode has a low clock and
>> switching to a higher clock mode via fastset, which led to test failures. Forcing
>> an atomic commit in such cases avoids these issues.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7397
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_vrr.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 82eb8554a..d583d3cc3
>> 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -948,6 +948,10 @@ static bool output_constraint(data_t *data,
>> igt_output_t *output, uint32_t flags
>>   	data->range.max = data->switch_modes[HIGH_RR_MODE].vrefresh;
>>   	igt_output_override_mode(output, &data-
>>> switch_modes[HIGH_RR_MODE]);
>> +	if (!(data->switch_modes[HIGH_RR_MODE].type &
>> +	    (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)))
>> +			igt_display_commit2(&data->display,
>> COMMIT_ATOMIC);
>> +
> Can the modeset enforcement be moved to the actual mode-switch/commit path instead of committing from output_constraint()?
> That would avoid introducing side effects in what currently appears to be a constraint-discovery helper. ??
Yes possible. I will fix the changes in the next revision.
>
>>   	/* Search for a low refresh rate mode. */
>>   	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
>> TEST_LINK_OFF)))
>>   		return true;
>> --
>> 2.43.0

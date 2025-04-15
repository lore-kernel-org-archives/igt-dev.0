Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39118C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 05:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AD610E0E3;
	Tue, 15 Apr 2025 05:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvXlAu1t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F01610E0E3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 05:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744696260; x=1776232260;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xcbYiw+gFsruFLQQELOo6EheeDP1g2E4eze12rOZv5g=;
 b=DvXlAu1tJcyLVZqq8VZEsOOF9/ocWHEIcGaYNXx2fIEvInvBaJsD4lU8
 TbQp+mLojwr5jgehP34XDetYdxYFQWfAtZYXb2dQAjMsbB9YcK3+vDcMz
 msUCmbeQJ6A0fW6I1MIhQQUk/MBn1043fuXnDkHEbgyA//3zxCgermEnS
 ZL+tplmMJGQpR6+81edApDXXMhHcIpEsYRvGiu25kgfDhsaRAjlLrTUJ+
 WCo1dygblrqtm8uRKDA53l7wjq31sAb5wsoE3thV3W2KcaNlsNgcQUri4
 Ey0s20ucAZcR+ormYIn0XKrQHHBORJ6ZTAHg43wH8uY35FbIlhsZx6hb7 Q==;
X-CSE-ConnectionGUID: k8LHCeGNTr+/M5vU3sbUAQ==
X-CSE-MsgGUID: UqEPXmOfTA2Bk9gkcY7tSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46197874"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46197874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:50:59 -0700
X-CSE-ConnectionGUID: zyNK8ZWaSQi4Al4GGQWkag==
X-CSE-MsgGUID: 65belp7ZQDqHOicrcnrwxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134798635"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:50:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 22:50:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 22:50:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 22:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiG0IEdaRmcI00yG8PsCP2oFoEKLuMOsUO6+IJ71xLSMez5yGBbHC3B3aYoZlGAUoBEh/bX4BZRvD3RIqpIECgFZzrdtKZnuBvZI/eqYkpj+SImrK3qo3+suLq6yBymAJHsaB3egCDDlECTyc9L6GS6ASPRZs5yIAB199J2vv06pDRBWPNrvDwca9mTpcy9Ygxp8Lbykq9qyGQKsadKbY+4Szi2pUucQRffQ31izVpl25u3e18peoNjy3ZbGV5V+RIKWxiHhu8hwOW5sYFAQj/hUehN9rjq2ezEoZfF4xY8hI4T27j6TEsRa0gwrFHLflbZYltGTH17dLpMLHBHrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ol85o3tNlJUJnZBGrsBs7Uh8b47NZ+l6zG/eh8rSPo4=;
 b=I37RYVRp1eS1SxkukvdsZinYzqT9u/c/rDW7NSFcVG/6hkMVFJE1tFKQQN0F2T/f3X5lpNvDsAS58SyERGkFqOakr945FdRKsfFgTr8Dg4sf1MDaEYEbsxpOPRfs88ObpKnm/QFHMGYA/rwPwyhxxJfdv4IXQQg3YCVbRakaTk/RPmcsSRoUt3ZBO3sUdHmZXpnWTRtJotFPymLDAEP1tBa7in6eJHX4FK6xTdj3Hrpi94yiUam2SkEKa+LHaB/sA5AR6zzs5U1brfj8ma2jSoMFHwu15vNHquMSKvYtFlttB0kQKDz+pv7Ev0GwzlssycJ3MZHx6/Z3TiYrvlb1Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by DS0PR11MB7336.namprd11.prod.outlook.com (2603:10b6:8:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 05:50:13 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%7]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 05:50:13 +0000
Message-ID: <c10278d3-24a6-4961-99a7-d94c4e1a18c3@intel.com>
Date: Tue, 15 Apr 2025 11:19:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 07/10] lib/igt_kmod: Add rebind abstraction
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-7-84b1ad0b8075@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250410-lib-kmod-v1-7-84b1ad0b8075@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|DS0PR11MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 26882afa-4b9f-4ba0-42d8-08dd7be15a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGk2eStldGtsY2tjUG85RFZDdkNBRGxWZnhCWTlVdkVxSkxyS0pGUlJhaFpy?=
 =?utf-8?B?Y2YwQ245NHdyNTlDRHJNZ05GUGhxSWRHU1QwK1dUTmt6ZWNxTVlpQjZnWjhB?=
 =?utf-8?B?anRURkdpd2twQmY1eDdtU3RwNk1ITEJDbERXY3lkYzNPejh3NEpQQjFmbFVC?=
 =?utf-8?B?YTVBd3R4dWJwZGZpWWo4Q2tlRjhDNTVCQllpN3FJZ042VDcyREV6MjhHWjdv?=
 =?utf-8?B?TGJ1TXJoUHhHVGZQMHRYVzdaaFVPei9aMjVUQ3lKRTVOcFprUzMveDJ1Qlli?=
 =?utf-8?B?dXkxS0tsWnByS2F4TzVFODVYM2hySGkvaEtnK3oxRngwdjI1eGFIMTZSVEVL?=
 =?utf-8?B?azhkRHVHZk14cXhnSVBxb2UxdXVYckJ2QitFL0JjcFdrbEM3akxGdWMvc2E0?=
 =?utf-8?B?Y29oL21IaGQxdzZpOURRVGNQQmhjQXZDeHFSTkdJN09WZWxUODZjWlp0SnlM?=
 =?utf-8?B?aVVBNEdjSTRpNCs3amtwWXFIVkxMVmE2cXZieU03ZXQ0YlQ4QTZSUDV6Qkkz?=
 =?utf-8?B?RDhnaWRSSFFXMzl0QU9NQjZFRVlSaGFmOGV3ZW1lZ3ZZaGhYbHFISWFQRkwz?=
 =?utf-8?B?aEtjZWF3WnFKUXI1WFh2OUJzeXE1aGZGbWdtSDR5VE1zRVFSK3JmVVBuVEtN?=
 =?utf-8?B?U3NNcE9RajZqTndrWUpIMEJ2ck5VT1Y3NGlxb2FlbnBMZ3h3d2h1QW9zdUlC?=
 =?utf-8?B?MWNOMFM4b2dqd0llV0hwT1QzeExUWXJkbXh4K3lydkZJT1ZnTFBRN1pwZU1U?=
 =?utf-8?B?VHJTUnBrTXNkZ3g5cTB1SVBlcDNiZkF3bkpYSlZDQUpZSGZaSXZiTE56ZDYv?=
 =?utf-8?B?VjRCSGx4TVZweXp1RGQ5KzhDbUtZMTcvOTg5Y2Y3WTVuZENIUEZNY3BCdzdO?=
 =?utf-8?B?WnJTU0tsaUIvYm5Dd3QxWFllaUpzZTcxY0RaV0lIT3E3N2VZNS8yM21PcnNj?=
 =?utf-8?B?bjFEWC9PdGRsVFZKbkZRRnNZL2dwYytSYldEN1Z0ajdqc3B1a0RsN1FwVURl?=
 =?utf-8?B?RzAzSi8vc202U1orNTZlYmtIeVpza0Q3SUl3bXExTDBZeUFVQUZISk0yR0RC?=
 =?utf-8?B?eVF5OHlPRWdKbnIzQlc1UEZnSTNOWmFSNEQ2MnNsUlEvOXJLTlZmOVNxUjFK?=
 =?utf-8?B?RWltRmIreGVjWkJxd3F2RmNWQnVsdS9rcjN2YmF1dEpSVDQrWW1xaGU2RkZG?=
 =?utf-8?B?Q21ZK2lHZ0lubFdMYkl3c09NeUgyT3RYYlhtempuY09iVUZDTG5UekdkUFpa?=
 =?utf-8?B?VlR2WkJoYXpYZ29ueGFDM09UOWk1bGR5K3Jmd3BGbmFlWUppV2NPVTFtUVIz?=
 =?utf-8?B?am5PZFZQOW1sZ1UrSy8xZVNhOS9MdERoUy9jQXhNOEt1VzFkNGJ0K3V6VUU5?=
 =?utf-8?B?WWNublBPbmFGOHlneHJCSS9QZEFyNFVzWWJNejc0THRVTUY0eTA3WStaZ0NB?=
 =?utf-8?B?YzF2VEVCTmtGNnV3TDJ1VDR4dWNCdXlqalhuZVg4aGRsanAzUUFrcmtpSVM2?=
 =?utf-8?B?RG00cncvRzJienRxamNWeDdTRktRK3hwczdJbEpGRTVJektXRzNKRmJ1Q1F3?=
 =?utf-8?B?ckR3WVFjZGw5WnpZRDUyZkJpYVY0NkNaWWRhTFpIemM1TVV3SFcwUDZVMHZJ?=
 =?utf-8?B?RE04eWlSZlhGS3U4YnliOHU1bUkwSEEvS0Y0ZWZSYXJ2TWdVTWhiVnVrTFAw?=
 =?utf-8?B?THMzbHA3V2VNcmU5dS80VllFbTE2ZlVGYzVZRFl2a1JmbnoyUjczRnkvc1hO?=
 =?utf-8?B?T2pCK2oyczZCUGFkc2puMjB1Qyt3TE9QdWllSmxENVZRMWFMWnJRVGk0aCtB?=
 =?utf-8?B?dlN2LzZ2U0IrM1FZeVYzTC9uRlNxN1p4ZUFXcWw4ZFNaTUlTK2ViOW81R1gv?=
 =?utf-8?B?OXFGNnp3cVlGOHEvRFNsUlBVWWdTWmpacmxkY1lWV1hoSWRBc3o3TUhHVU15?=
 =?utf-8?Q?uk2JDxhYzwk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnY2MURhSjc2ZC94UEQzTjFQaXc2VTdpckhNMUQzcWliQnNDK1NLdHRjMTYz?=
 =?utf-8?B?UWp5dGtoaW00NXZZOHg4YmZDWXZvakk3UFBQVEc1S0hYK010eDY3OEtwQzVw?=
 =?utf-8?B?bkQveVBpWU5BTlAvQW5HOFVDVEwzU0FheTl1bWs2R1hMbVV4cGJZMTRnTGpi?=
 =?utf-8?B?R0VXUFRlckpvYU1HTjNUeDlHNVFPY2w4emcxQjYrWTgxM3hqRnpuNW52OUlC?=
 =?utf-8?B?UzdFMVZ0VXV2cUV3U1RCWGVNUFErRW03Y0cwYUpRaHRsZXpQWSs3UVR3ZGRL?=
 =?utf-8?B?RVFaVWRMRlJhSVpLNmY1Tll6V29KSzNENllETmJPOEl5Q3ZyOTkwRlFjSTY1?=
 =?utf-8?B?cVFuSjZIQUtaYkd3aDc1M29YaTRxK3RGWHZMOERUdTVnTWQ4aVphdFRjTWlB?=
 =?utf-8?B?ZEtsblZ0Q3ZHc1pKWEd1NEsrSlUxYkt5dlRKMDUwbnlydDQ3WFlPSHFsYWVP?=
 =?utf-8?B?VjVVaHNYc0J1ZWdYMVl5dnRoNEJQTDY5VDB3dnM0QmpTVDVNcFM0YWtiZVRT?=
 =?utf-8?B?YWNwVEt5THhpc0xhMWVwQTdCeFlXYnhtY1Avc0lkQVI3VEdsL3RLWDlwc2xm?=
 =?utf-8?B?ME4rM2t4YkhxcDNyVzVuK0h2NlNncWl5SW0vdUhiWG82eDBFRnY4R2V2MXRV?=
 =?utf-8?B?dS9YczFyQ2lNZHJUWkJtenBNZnpjS2hmQW9INERvTXlmcnpkUlBEUEhxNXdF?=
 =?utf-8?B?Z0dhb2ZQaWF5R2tKbm1GdnpNZVhKV01xWXkzKzNOWVd4d2k5K05lU1JFV1dC?=
 =?utf-8?B?M3hoLytCYzFZajBiMXlvVjhmWEh3WGpCVG5QRkVBNm4yREVrZVE5RVJJMFp0?=
 =?utf-8?B?azdpUGNOT2ZCa25uZ1kzc3o3WnVRSHQ1WCtRQ1haeWV1L091QUwrUmR2a2dy?=
 =?utf-8?B?ME11RlpVVVdmajJ0ZlVTb0Y2S1pQQXdLSk1ud1A2Y2hjVGJiSTdxTlA3akZl?=
 =?utf-8?B?eUhydktFeDU2UzBLSG8zbVlDUlNCQjdUQ3Avd2t1RysrY3ZPL0JZSlJUaUxx?=
 =?utf-8?B?N04xNlIwekdFcUNsZHJlT0ZNQ1BYbXV4MzYrL3FvM1VPTkJCeWlQNUx4clBN?=
 =?utf-8?B?K1hWcVF3QmRaeHNLU1h0TU5TUVE1SGROZzlhRU4ra2dpNVhxeTMvZVFyaXgz?=
 =?utf-8?B?NDZONVoxNTR3dld1TmlmWFQydGt0L2txNmpJdlJTTGo2Q3R6SlZWc3ZYbERY?=
 =?utf-8?B?L2RNYXYvY0dCTDBXU1J6SHF4amw5eUE1cjFUbUs0N1creVlqSmVSMmlJNTZO?=
 =?utf-8?B?blVMa2szbUozam10blBuNEFKNU5KYkJwV3lGQnNSejl1dlh3RXAzTFFjSGRr?=
 =?utf-8?B?U2YxWWdMQ0g4b0NlblhBeVdZWFVDcDJ6REMrRG5Hd1daT0doN3N5UWRPU051?=
 =?utf-8?B?ZzVMS3pBL3JsOU1pcXk3MjNaR2hJQlFJaGg1VmF6bFZGRUVIR3J0c3dCM0s2?=
 =?utf-8?B?SmJGdDl0WG9zV1VyM1V0eU5OV1N1SEpDcjFWbXE5L21Kek5hcU9RaU03SjV0?=
 =?utf-8?B?aC96UFBRL0IxaG5IZGdtVU1TNWxkMDF4M3lHNEFoNjNHOXBIMFJKYUR5ZzB2?=
 =?utf-8?B?Zk5CQ1A0aEFPNmVocW5mTG9jRndEQzBHYk41WGcyaklwNWVqaGVSemV0ZGxV?=
 =?utf-8?B?QnVCRGQrcEZmWi9LKzlYRWFxMVgzaDVROWxNakgrMjVYM25qbHBYeTFhTGNJ?=
 =?utf-8?B?bEwxbTA3UkNiWGtIdjNZNnExMEJlTzFqZ0JBMW5wR3JrYzl0Z25ZZXZIbmVr?=
 =?utf-8?B?Z3ZxR0VxY0tTOHFkZHRKR2xDT1A2S1RRZEJIeVVVOThpSFFaTmFVTFA3Tlg2?=
 =?utf-8?B?RHlkTTlCQWhzRG1vc0hyV1ExOGFDS3dCNUs4ZlJ5TlRjRUh6WGtVdGlwR2ND?=
 =?utf-8?B?bkhQcjRRcFR4RnJ4N3Fka0x1a0EybDJFSGRHZUFOdlUyRU1SOWszYmNGNG5B?=
 =?utf-8?B?Ym5nYWkrN0F6Qk1HNi9jbTliUFpnSDJxMXh5T0oxLzI3T0VFQVFsSlN2T0NE?=
 =?utf-8?B?WDhjMVRVRFNjek5oN3RyR2pieUhWbmRRTHZnY0pBbGZha0lqeW5DdElRN3Zo?=
 =?utf-8?B?VGRjc2U0QllnUUJnYzdlWG5oTFlYYVZZZ1lkcFhjVkswR09PS2hZUmdOUXYw?=
 =?utf-8?Q?AtbMI0H4raCzM4GFJ7m3iDlux?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26882afa-4b9f-4ba0-42d8-08dd7be15a93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 05:50:13.0143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSvp54/LcoEYdUlOwi6HBVtmNRcqdZtEF3EeYPX0IlJ2c8Nac9WHNsgnjIKl+9qev0uXoFGUtj8ywbOpcpL8Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7336
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

Hi Lucas

On 4/11/2025 4:18 AM, Lucas De Marchi wrote:
> Abstract the "set one file in the drivers dir" and share the
> implementation with unbind/rebind.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/igt_kmod.c | 11 +++++++++++
>   lib/igt_kmod.h |  2 ++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 14b6b957a..6d7f5705c 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -665,6 +665,17 @@ int igt_kmod_bind(const char *mod_name, const char *pci_device)
>   	return ret;
>   }
>   
> +/**
> + * igt_kmod_rebind: Unbind driver from devices and bind it again
> + * @mod_name: name of the module to rebind
> + * @pci_device: device to rebind to
> + */
> +int igt_kmod_rebind(const char *mod_name, const char *pci_device)
Why not have a void function? Not using the return value anywhere
Also unbind always returns 0 and asserts for errors

Thanks
Riana> +{
> +	return igt_kmod_unbind(mod_name, pci_device) ||
> +		igt_kmod_bind(mod_name, pci_device);
> +}
> +
>   /**
>    * igt_intel_driver_unload:
>    *
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index e3a4ce671..905070897 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -39,6 +39,8 @@ int igt_kmod_unload(const char *mod_name);
>   int igt_kmod_unbind(const char *mod_name, const char *pci_device);
>   __attribute__((nonnull)) int igt_kmod_bind(const char *mod_name,
>   					   const char *pci_device);
> +__attribute__((nonnull)) int igt_kmod_rebind(const char *mod_name,
> +					     const char *pci_device);
>   
>   int igt_audio_driver_unload(char **whom);
>   
> 


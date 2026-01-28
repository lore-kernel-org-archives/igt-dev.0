Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5038BD25B5D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1D610E282;
	Wed, 28 Jan 2026 13:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEPf90kF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD63D10E282
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769606721; x=1801142721;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oujB1wMlvlPQncZIofYYJ74vZlIQbA9ynzz4hJmojfs=;
 b=DEPf90kFG0RYNRJJPBQ3FQIMsFKwBvzL6//GlhdBaeREhEKpMKr/MqGK
 yEF+60qII6mSVv3jo2/HaxYzI6/A8AfpwVjI/y2ZbXsFc7x0ZbW8eUIPG
 sqzqVmLwju9pp1bnWOdAfTffr9DHCle8J1zbDsEksiQk8HVHdMQpwv783
 vzUe2FsLuXu0aok4ZRO0bhj8zZya5s2C0bu+4+KsD0tkomf5b6rbmf87f
 Ytp/idD++wFKYfvijHwXCAHzerPv20wCwdpT4LddP0ZoAd5sVghLoF60c
 IhL5xM3YnzcwkLRPVPcSlu1iXQVsceDvjbNZchRRuug+LpYO/4YnCABrl Q==;
X-CSE-ConnectionGUID: ZbupCTvkQESboDr1GA1CRA==
X-CSE-MsgGUID: FI6ZTGBVRAOkW5mwZ3O7Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70874277"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70874277"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 05:25:20 -0800
X-CSE-ConnectionGUID: o4ZECr9oQ0KZdM0k1zH/7w==
X-CSE-MsgGUID: /HHHWxS1RMSGmX5a4FrzRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207507296"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 05:25:20 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 05:25:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 05:25:19 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 05:25:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMSbwKapUB2pIpubDANY7rRea1xBp5Syl5VnXuATNtvDdWotZsmh5dH6YdF9ScTPMmy4x3bHM2TT2X2sYIHJBz2Ez0zE4gBS73vE6Emp8OZXtF3RyViqaVQ5eY1T6kEreHnoEpVCqADvB4fS59X0Tss5DuAjz6KotHh6aYYUyc8H3mPLAE9BBXqlqXaluMUH1vpSMwi8cv4dOKGqmF+QftoVrxkCFkMqvRjA/NsrI3FUAALWJDdWTa63owHhXiJSU/+WShRdxO7JTWwpV4+hYOF9P08pIpvc8uUqU1wVFy2DEj8fz1eXxk7tOI66lzEvGGBHVIku1UU9vTJo26ipdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oujB1wMlvlPQncZIofYYJ74vZlIQbA9ynzz4hJmojfs=;
 b=W7tXueSPXSr9AbODfonLNzWchwrpVDzFX0XOq+FvJG2sKvm4nyfbkQI+DPWiavpFtPZAfnvd/Hu81jolAmv6//D+Xbh44dVjUadxa+va0T/DAZVgiHseJHm1I69GB63hNzX3oQ1npr5GlKxNGTmgBk+WaQrXRdsCpuQhsbj0RdXRYKMhPmh6P42M+0j0qVKQte+85ow0UlxemoazWQRBCDEvVuTizFoWcz1oP6Mktc0lPbEdM3/plqnyyQzGd949CSbWBp+lA3/hEBqyJLIZ8aEnLBo9D8SorMzAy7N9Ei0IBvvmFe4Sq5Jc++SM+toGCXSCivDl0Qk3t0qxENx63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA0PR11MB7209.namprd11.prod.outlook.com (2603:10b6:208:441::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 13:25:14 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:25:14 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 2/2] tests/intel/xe_eudebug_online:
 test_interrupt_other wait fix
Thread-Topic: [PATCH i-g-t v2 2/2] tests/intel/xe_eudebug_online:
 test_interrupt_other wait fix
Thread-Index: AQHckD69vkSe96DMQkawlkNfwaWzK7VnkBrg
Date: Wed, 28 Jan 2026 13:25:14 +0000
Message-ID: <DS0PR11MB7264D0D7C85AC21F52781ECAD991A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20260128101529.401653-4-piotr.rudnicki@intel.com>
 <20260128101529.401653-6-piotr.rudnicki@intel.com>
In-Reply-To: <20260128101529.401653-6-piotr.rudnicki@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA0PR11MB7209:EE_
x-ms-office365-filtering-correlation-id: 27c96aaf-ad6e-4508-3ace-08de5e70aba1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ZmtwbTZhdEJPK290K1Q2UUFrbkZybmF3bXhkT0p2dldnWHZsZTIyZGVtV2RO?=
 =?utf-8?B?Y0tWandJMkptd2k4blJWempqZTltTkNnRkg2bzErY2JOaDR4Y2xYb0lJbHdI?=
 =?utf-8?B?cFltbmdjSEFoUFNBbWlQZm5naFgySitRSkJqRFNqUjVHTTdKVWdrenFyUXlT?=
 =?utf-8?B?Rm4ycFZ1dG5PVzFVZkZXd21MdTZLUDQ2UEdraTB5Umhhdm05bkNHNDNHOGtp?=
 =?utf-8?B?b09GREZPTFZWZWhqTDZiMDNrbktuWE0zcUlZc3hzTjJmNjBUQWZVc0lPT2wx?=
 =?utf-8?B?RFR0RzBNWFQ3TjI4bWUxczZWcERPdWtOeGdwT3RQUnN6Tk9HZTU1dWJtN1J5?=
 =?utf-8?B?dTExQjJORTJVZ3pYM0FzOXltU3kyRXFVTnc1akwwQnR4L3UrelZTcXFpSGhD?=
 =?utf-8?B?Z0gySkFuTWFzSDJ5L0lQN2dHcHAyM3dKSTRJVmtoSlRyY3FGU20xY2JGNG9N?=
 =?utf-8?B?ZXVIVmdHOGVENm1OaUtFaGtsaTdyWW9QY1RHd0RYMmFRSkFFMG9aQnFUdEho?=
 =?utf-8?B?ZDh5RzFBbG9UZkE0VkRzb1lvRkFla3JLdE4weFVKRk9lSmt4RWZudElZemJa?=
 =?utf-8?B?MUFtVzJHMDhWTXlRbnkyRkZiajFlK3pUWmR2UG5XWWsyWmd6eFlCaC93c3h1?=
 =?utf-8?B?T2JwcnVmWUM0YTNvbjdVeTFhVGJ2U0NhcUcwQWVUZmtUWUhWTjRVVy8xN3JC?=
 =?utf-8?B?NkEyR2VqdForUVJxL1g1TERyY0RjdEVwTFIrVm82RFJteFlBb01qc3B2YnZL?=
 =?utf-8?B?SFZvYmFvZE12QUFaRkozNS9XWnVCTFViQVdWcFhFbUZYN1NKTklSMTY4clB4?=
 =?utf-8?B?YUZZS3NMaTF3UGV1ZTVjQUIrQVJOck1QMy9zMEtEd1hlczdJVjhHd2REd0d3?=
 =?utf-8?B?SmxuaTg5dW9MOEpVbG9ORGF4bHNBakRSbmJzM25yaFpmWWtqRDNtd0ZyTzN5?=
 =?utf-8?B?bEFlbVI3V3VIWkNsUEZMekhIc2JOdEtybGd2V2ExUXF5Y2VlZVFYTkRJbFJm?=
 =?utf-8?B?NHYrODBmaHRKNUpEdjZBWlhlZ2lGSU5jTnBnMEo4RjJSNENwalNyenhHNzhL?=
 =?utf-8?B?dEtWamJKMUhsbUtBNVIrNWNGbTcwZzNHbTBMN1ExUzhVanE4cG9ndUxwUFc4?=
 =?utf-8?B?ZGs4Mjc3d3RqUGtrV3BSY2J4d2xHWnhIdEV6V2hNaGZPajNRMXh5cEM4M0Vs?=
 =?utf-8?B?eTZSRkcvajhIeEcyOWNGczRCQVhUaGorRmpMSWY2OXZVL0NPRmU3aExicVJk?=
 =?utf-8?B?MG80U1h1eC9NR3U0L3VxZjdHQWsvZGRMRUdlL05KcWdXeUpZa1RTbktNR1hj?=
 =?utf-8?B?cUdxSGpiVlg2eStqSWR4VGZjODQ0akpjMVBlM3ZCL3hLemJERTBGdU14anBX?=
 =?utf-8?B?Zy9WZWFlQmVWODhheFFIM2ZlTXFqVHFoaE03SVlPbEhmczF3dk85aXE0N1pD?=
 =?utf-8?B?MEFzeE5peU1mNFdBNFdVOS9wek5DQmVicmNaQWNJS0RYSHlpMXV4UktaOWNz?=
 =?utf-8?B?VlR1VHVsZTczcHI3RXB2T1N5ek1SL3cxaWhzTGxNYklKalhTcnQ0R1ZTZHd6?=
 =?utf-8?B?cVBCMCtMbnlKNEc4WGhjOWd4SmlqTnFPOTJFUFFFL2hhMTdCcE83b0dlWDB2?=
 =?utf-8?B?RlVrMU5Bak84N0VHYlR0VVVSZzkvUUZWL09yL21rdm03SmFpY3lrVGpSNk9z?=
 =?utf-8?B?RFVTRm13aTI5dTdtUy9xUE5XRlNhKzdscDRadklUZUtqOEFlZ1ZZd2c5c2Rx?=
 =?utf-8?B?Qmdxc0xPckNOeFA3OVlzczdSUXJ3cW52d2VOS3I1d0IzNUdlZk8vcHh4NnFT?=
 =?utf-8?B?VTZOQnY1S1hFR25za1M3Tm90TURhT3JTRFFRUFZDYkdHSHZYWk4rK2RqZWlh?=
 =?utf-8?B?QjV0emFQSHhlb0FhdGN0WGxoMDNKTHhlQnNaREp0QThkTUU4Mlg1bTh5enJ1?=
 =?utf-8?B?RkxpVGhFZUhzbzkvRDFCbXdJVGY0Q3hleXBhazhCN0VTZDNMQmdMVWtrU2NX?=
 =?utf-8?B?cStVTmNFYXZTQUVQa2QvRndhZVBaZk02bWxrVVIrMXgrNXNtREZrQkRNMjNn?=
 =?utf-8?B?UU0xc1NKK1JLTllkZmRFR1ZmRU5wMlBibnpkcmxlOFBFeDJ5QmdRcGIxQzJT?=
 =?utf-8?B?VzFKcEh2cUZRZjFBRHZ5S3VuRUhpdVlVYmdXNWlZMWI5S0l4WC9WMTg0Ni8w?=
 =?utf-8?Q?Og88FQZwvmJx9jdX509SwX0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGhGYlIraUdFNzFGdXROdGI1ZHJSSEY3cVl1TlhmRmF2bTU5KzJtSW5uVmpz?=
 =?utf-8?B?WllqUDNZemljT3IxUlVid2t2cTdMTW40aGtiRVNmVFZQYWhpTVUrbkVaT1Bz?=
 =?utf-8?B?bXpjNU1meVZmVlIxblh4S0NKNnBoTXRPNXNpRTZIMFUyTHhhdWJOcTFqd1dV?=
 =?utf-8?B?aitwbmxhclRuQWtpYlQzdW5YVzdsd2RmQUNPRzdNSnR1dkYydWV4NjBtUU5k?=
 =?utf-8?B?MkVSQm90SE5ObGg3RU51SktnSjBNd012VU5pVlgrd0pkdjA2SVVBMWZYd3dL?=
 =?utf-8?B?dzRDNnk5VWUrWEthcEVkWkFlWVJTUmtEUzZRWkhIaXljYS82V0tqNkxxZXNq?=
 =?utf-8?B?cmR0Y2JIWmR1SlJ3ZFlLeHhRWlN2S2xHMU9jOHhNdURWclJKT3FhUUxOMmc1?=
 =?utf-8?B?aXRwbVkwdzNRUWVZMjBHaURvOEI4am5aVzNJUFNDZTRGZXhPbWZleXhMcy9J?=
 =?utf-8?B?T2kra2JUVm15RVNjMHVNaFN3MzQrRURkalYzNnpYR3pvSk1aTjlpMFJlUTAw?=
 =?utf-8?B?M3lQNnFJSGpJODRwMHN3M1kxMG04bldGMDVLcGExOExVSm84N3Y0ZHA3MXM5?=
 =?utf-8?B?U3hEQTFiamMvNVZUb2xFbzBjaWZWZ01iVkZJV29yQzdrNE1xOEdrZ0JqVXox?=
 =?utf-8?B?bUtBUWVXTlI1UVd1d3hrc1hqTjk0QUptWFBkOUVKOGtNajgycjJXL3NGdU1H?=
 =?utf-8?B?bGZXZGsyazZtRmVGWVFnSXFPTm1OR3ZkZmtkSkJDdWQ1WUxZTFB5bjF5UUtx?=
 =?utf-8?B?Y1JiZk1rYXU3VG5EdzdUTFNVL2c5MEpxL0RoZTIrc3lZMnJLWUwrL1VlUVV4?=
 =?utf-8?B?eERlbmZjSlZNWVpkVkVqQUJSbmZScm95ZjRBL3NFTU55cDN1WGpoQ0NFRDcr?=
 =?utf-8?B?YVhQK2RCOXlOVWYxT1F1amEyaEE3ZUtmQVRKbkxCNkVhVEhVTERJbUE5b1Vx?=
 =?utf-8?B?OHlMM1RkMzZXUzNvNTVtNWFMSXd5Q0FEMWdxdDlnMXJjRk5SaTVFcWNWb0ZV?=
 =?utf-8?B?VFNuM01vcTc3QXV6a3F0RnVvMit6d2ZMYTRFUk9jNWx2WThOc1FPcnVERXNW?=
 =?utf-8?B?cTFicWVNVlhJK2ZSUEdUYUdIeFJlQUV1eDNnVGg0ZFk4aExuNk1lck4rejdt?=
 =?utf-8?B?WUFlTTRaUFNiR1hvUUNVTDJpWUM5VmJzSk9remF0QWh2aFdWK0NUMDBaa2lM?=
 =?utf-8?B?alhrTjNOdGtROGVnTW9sbVNEOG1USjdaV1JiaDVjczlrRVpEUnU2RS9kbmRN?=
 =?utf-8?B?bEkyU29LVWUvUGh4eU51RnRZaWNWOFVEdm5JY3Z5Y0l6aDVPckZZWHM4RnZ3?=
 =?utf-8?B?VjVXUXdRUjVMNnVPaWRhdzlpRm9vL1A2VHR4TTlmcFllQWZsVDdKdmlqVkM3?=
 =?utf-8?B?ZnlQN2ZTRVoxblFESE5IRTEyY0dOYjIrQytEVXZPTDNVdFdnTEZvV3R6K3dQ?=
 =?utf-8?B?RFhvcG5YbUlxREo5d1B3YWdzUHNrN0NzU1hzOWFNZ0R0OTd3b3RmeUQvVTYv?=
 =?utf-8?B?REZhcHhadXdYRGwzM2VBT3docSs0RlZZemc2VytxNVJiMnVOQkhFdGU5b3RR?=
 =?utf-8?B?S05EMVBGQjMzemRlaGU0RjlZbEwwZE9Id2NES2lPY1M2d1V5WXFpOGFCSEdp?=
 =?utf-8?B?ZURLbm01WXZINXJiaUVVUlgxMWcxNWRwbGNkcmtUeWtIWXAyRWNLTTZrY0ly?=
 =?utf-8?B?NkFxS1ljKzFhVWUrQ202V3A0Rm1mZkZpNmE2VzMwL3pkYlR5YkZjWGdRam05?=
 =?utf-8?B?MENQQUhJWURRaUkyTGMwNkRRcVpXakZUeHc0cmtrdks5UHlSYmRtYnNVQ2Zj?=
 =?utf-8?B?Z0tzNmdoSkdWMEUvVlNaMGJydFpLVlloa1J3Q2g5cDFxUThoVDE4OG9xTTMr?=
 =?utf-8?B?Njl1M1RUZkRldDhZNkxmM3pOQU42N1JIZk8xMUptUmIxT2dCK1VOb1IzMWNX?=
 =?utf-8?B?dU5YNVRiM1ovemRTL0NZdzI1djJ3alArc0IxMzlWeWx6dWpPRFFuSUV4Nlo0?=
 =?utf-8?B?Z2pBVVk5ODdyVjJKQXNGeFNZcWNpT0Y4T2JHbXpQY1lrVjRIUEpzaWpPSWVv?=
 =?utf-8?B?Y1ExT21xNjFiMSsyeC9XZ3BmZnJ5QUVEdFNFMno1R2VjdHdPZ2JZTXV3cDBZ?=
 =?utf-8?B?RGpTem1Ya3EvZzBiSzltSWg4cjR4MWU4N0xkM1JLL2tCTHJQcXpRQ1ZRK3hD?=
 =?utf-8?B?aVNhRU5ocVU0alovUUQzVXdOS09PVCs2R1ZVN0IrSVNyS0d4WnVpd0MvR0Uw?=
 =?utf-8?B?cEptSlVjRFI5WUx2SkZ5YWM0RHRPb3pDeXNuUWFOSFFveWg4djhDY09mdmxJ?=
 =?utf-8?B?SERwYnFmRWU5S2YydW5YSWdOT3dQTHBrZ2N5Njk4UHJ0OHRBdXozemFLNTZy?=
 =?utf-8?Q?goeZ3Hv7TqE2/SSc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c96aaf-ad6e-4508-3ace-08de5e70aba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 13:25:14.1388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lr6ia8mIsTok/9NK7RZYBN4XPzSAQH8KqmnMg8RZTkT3Pun0KN6eAOxcoACHQEapkWUxF9///AsvJPJskJ3yLGV/ag3CH10nxv7vU8Q4sSQb2N4vt7rDsI8KcQs01AJn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7209
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogUnVkbmlja2ksIFBpb3RyIDxwaW90ci5ydWRuaWNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgSmFudWFyeSAyOCwgMjAyNiAxMToxNSBBTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gQ2M6IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wgPGRvbWluaWsu
a2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+Ow0KPiBSdWRuaWNraSwgUGlvdHIgPHBpb3RyLnJ1
ZG5pY2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYyIDIvMl0gdGVzdHMv
aW50ZWwveGVfZXVkZWJ1Z19vbmxpbmU6DQo+IHRlc3RfaW50ZXJydXB0X290aGVyIHdhaXQgZml4
DQo+IA0KPiBUaGUgdGVzdCB3YXMgaW5jb3JyZWN0bHkgd2FpdGluZyBmb3IgZGVidWdlZSBjb21w
bGV0aW9uIHdoZW4gdGhlIGZpcnN0DQo+IGNsaWVudCBzaG91bGQgY29tcGxldGUgZHVlIHRvIHRo
ZSByZXNldC4gRml4IHRoZSB0ZXN0IHRvIHdhaXQgZm9yIHRoZQ0KPiBjb3JyZWN0IGNsaWVudCBh
ZnRlciByZXNldCBhbmQgcHJvcGVybHkgY2xlYW51cCB0aGUgZGVidWdlZS4NCj4gDQo+IFZlcmlm
eSB3YWl0cGlkKCkgcmV0dXJuIHZhbHVlIHRvIGVuc3VyZSB0aGUgcHJvY2VzcyB3YXMgc3VjY2Vz
c2Z1bGx5DQo+IHJlYXBlZCBiZWZvcmUgbWFya2luZyBhcyBkb25lLiBWZXJpZnkgc2Vjb25kIHdv
cmtsb2FkIHN0YXJ0ZWQgYmVmb3JlDQo+IGNsZWFudXAgYW5kIHNraXAgc2Vzc2lvbiB2YWxpZGF0
aW9uIGFzIFNJR0tJTEwgY2F1c2VzIGluY29tcGxldGUgZXZlbnQgbG9nLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUGlvdHIgUnVkbmlja2kgPHBpb3RyLnJ1ZG5pY2tpQGludGVsLmNvbT4NCj4gQ2M6
IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRl
bC5jb20+DQo+IC0tLQ0KPiBWMSAtPiBWMjoNCj4gIC0gU3BsaXQgaW50byBzZXBhcmF0ZSBsaWJy
YXJ5IGFuZCB0ZXN0IGNvbW1pdHMNCj4gIC0gVXNlIHdhaXRfZm9yX3dvcmtsb2FkX3N0YXJ0IGhl
bHBlciB0byB2ZXJpZnkgc2Vjb25kIHdvcmtsb2FkIHN0YXJ0ZWQNCj4gDQo+ICB0ZXN0cy9pbnRl
bC94ZV9ldWRlYnVnX29ubGluZS5jIHwgMjMgKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMgYi90ZXN0cy9pbnRlbC94
ZV9ldWRlYnVnX29ubGluZS5jDQo+IGluZGV4IDA4NGJkZWI3Ny4uMzllY2NhNDc5IDEwMDY0NA0K
PiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+ICsrKyBiL3Rlc3RzL2lu
dGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gQEAgLTIxLDYgKzIxLDcgQEANCj4gICNpbmNsdWRl
ICJpbnRlbF9wYXQuaCINCj4gICNpbmNsdWRlICJpbnRlbF9tb2NzLmgiDQo+ICAjaW5jbHVkZSAi
Z3BncHVfc2hhZGVyLmgiDQo+ICsjaW5jbHVkZSA8c3lzL3dhaXQuaD4NCj4gDQo+ICAjZGVmaW5l
IFNIQURFUl9OT1AJCQkoMCA8PCAwKQ0KPiAgI2RlZmluZSBTSEFERVJfQlJFQUtQT0lOVAkJKDEg
PDwgMCkNCj4gQEAgLTIwNjYsMTUgKzIwNjcsMjkgQEAgc3RhdGljIHZvaWQgdGVzdF9pbnRlcnJ1
cHRfb3RoZXIoaW50IGZkLCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAq
aHcNCj4gDQo+ICAJeGVfZm9yY2VfZ3RfcmVzZXRfYXN5bmMocy0+ZGVidWdnZXItPm1hc3Rlcl9m
ZCwgZGVidWdlZV9kYXRhLQ0KPiA+aHdlLmd0X2lkKTsNCj4gDQo+IC0JeGVfZXVkZWJ1Z19jbGll
bnRfd2FpdF9kb25lKGRlYnVnZWUpOw0KPiArCS8qIEZpcnN0IGNsaWVudCBzaG91bGQgY29tcGxl
dGUgYmVjYXVzZSBvZiB0aGUgcmVzZXQgKi8NCj4gKwl4ZV9ldWRlYnVnX2NsaWVudF93YWl0X2Rv
bmUocy0+Y2xpZW50KTsNCj4gKw0KPiArCS8qIENoZWNrIGlmIHNlY29uZCB3b3JrbG9hZCB3YXMg
c3RhcnRlZCBhbmQgaXMgcnVubmluZyAqLw0KPiArCXdhaXRfZm9yX3dvcmtsb2FkX3N0YXJ0KGRl
YnVnZWVfZGF0YSk7DQo+ICsNCj4gKwkvKiBUZXJtaW5hdGUgZGVidWdlZSBhbmQgbWFyayBpdCBh
cyBjbGVhbmVkIHVwICovDQo+ICsJaWd0X2Fzc2VydF9lcShraWxsKGRlYnVnZWUtPnBpZCwgMCks
IDApOw0KPiArCWlndF9hc3NlcnRfZXEoZGVidWdlZS0+ZG9uZSwgMCk7DQo+ICsJa2lsbChkZWJ1
Z2VlLT5waWQsIFNJR0tJTEwpOw0KPiArCWlndF9hc3NlcnRfZXEod2FpdHBpZChkZWJ1Z2VlLT5w
aWQsIE5VTEwsIDApLCBkZWJ1Z2VlLT5waWQpOw0KPiArCWRlYnVnZWUtPmRvbmUgPSAxOw0KPiAr
CWRlYnVnZWUtPnBpZCA9IDA7DQo+ICsNCj4gIAl4ZV9ldWRlYnVnX2RlYnVnZ2VyX3N0b3Bfd29y
a2VyKHMtPmRlYnVnZ2VyKTsNCj4gDQo+ICAJeGVfZXVkZWJ1Z19ldmVudF9sb2dfcHJpbnQocy0+
ZGVidWdnZXItPmxvZywgdHJ1ZSk7DQo+ICAJeGVfZXVkZWJ1Z19ldmVudF9sb2dfcHJpbnQoZGVi
dWdlZS0+bG9nLCB0cnVlKTsNCj4gDQo+IC0JeGVfZXVkZWJ1Z19zZXNzaW9uX2NoZWNrKHMsIHRy
dWUsDQo+IFhFX0VVREVCVUdfRklMVEVSX0VWRU5UX1ZNX0JJTkQgfA0KPiAtCQkJCSBYRV9FVURF
QlVHX0ZJTFRFUl9FVkVOVF9WTV9CSU5EX09QDQo+IHwNCj4gLQ0KPiBYRV9FVURFQlVHX0ZJTFRF
Ul9FVkVOVF9WTV9CSU5EX1VGRU5DRSk7DQo+ICsJLyoNCj4gKwkgKiBTa2lwIHhlX2V1ZGVidWdf
c2Vzc2lvbl9jaGVjaygpIGJlY2F1c2Ugd2UgZm9yY2libHkga2lsbGVkIHRoZQ0KPiBkZWJ1Z2Vl
DQo+ICsJICogd2l0aCBTSUdLSUxMLCBzbyBpdHMgZXZlbnQgbG9nIGlzIGluY29tcGxldGUgYW5k
IHZhbGlkYXRpb24gd291bGQgZmFpbC4NCj4gKwkgKi8NCj4gDQo+ICAJeGVfZXVkZWJ1Z19jbGll
bnRfZGVzdHJveShkZWJ1Z2VlKTsNCj4gIAl4ZV9ldWRlYnVnX3Nlc3Npb25fZGVzdHJveShzKTsN
Cj4gLS0NCj4gMi40My4wDQoNCg==

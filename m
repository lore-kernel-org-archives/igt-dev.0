Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E479AC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 09:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AFE10E8C8;
	Thu,  1 Aug 2024 09:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKJBGIhe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0016010E8C8
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722503780; x=1754039780;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+BzyGfy+wdwlJhuD2FP7dXWY5bvOHimR+kF3C+xGE/o=;
 b=SKJBGIhe+C2P4VOqCYG55g5Ne2i9G8UqEcSwblLWiTYcl+YWkzCeXQWz
 Iow1UmdPPvI58NUnWGUCYmxisCmT/EsNA7x/mi+pCwuewXp0Gc+MfbRId
 abKjGOjYhw64Ldxk8TTB7kBt0959LFlpA46sXqnqC4IWsDQ4hALuVDbjQ
 6NQCme6i2eGT9w+3dRadjIERdp5g2k+TOcffxnSyo1cGJePfJSHB6CLer
 fGnNLX+p1d+in/YiiXR7x8Rj76znBKGLn4Y0D43Xzkx/UurCz7sIRZdg8
 0TiBPye/dmofdX/hYcUQq/+MHxn0F4o78JDOKS6es+R7mn0qrPhd3RZjN w==;
X-CSE-ConnectionGUID: VQaKBksETrCTcuIdNhGaDQ==
X-CSE-MsgGUID: /zOdS4vRSdGB8NfGbXBLPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20027535"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20027535"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:16:19 -0700
X-CSE-ConnectionGUID: Uq2QciCYSqWJMh9V8dOctg==
X-CSE-MsgGUID: 2N2YPpBXR0+ZJOD0P8NRMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55057236"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 02:16:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 02:16:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 02:16:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 02:16:18 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 02:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQ+V9Gi/vM1xlH6qntWnj9U0tqNO3WuiLrjbB0oSjcO0trvlH5VCDAIanOki5h+RsBYd6GUnaD3YK8oVwxD6V44XIO5gxd+fkZkcIjeeht/L6x6qN3VLewXnrAGiHeoxz88iZF2gX1DgGfBIceVGvPOsKhk3RMW1wqpwqvrq+sqVTBDfxbEsJPeI9vfpTNbnfSEzSsNUG/czdZ3y6YxYdIZOrd2RXvnDdhHG0I9WtwmoRsX2onrdRAHIXQ9TH12dh3lpOKq6xFuGbCgU3QZpSgqE9f4Jp1ZpC9rikY4hCeIUvTd8i56YwOBITRMa/ItKzYyiCmFcw4OES35deiJfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BzyGfy+wdwlJhuD2FP7dXWY5bvOHimR+kF3C+xGE/o=;
 b=HX1yq7sOx1WMwswluG7QTG5D6/wWalnxD2G3kZPPxlzu5kxO9iUmk8m6nUcjGqX65/CRAAitd+Z2miloGJgA0+xIByyI9TA2/bDUeUO/HwA1Ft3XOjnFOWJ6Lz82FmIf4l2ABjTH1z2g3H/RWZ+rsM12hh0ZlS4KYAfXMBAwU5fY4r1HRugc9Nt7vgLxqTqwOyh0Yjv73je0r3GHCbSF9Jy1TiJ3L4I0g41eycnM1e/EnxOO2syweWH90EtWxb6Twl8VRSMe60A4pcf41Do9xpPX3W7sim18YXVnxmpCxxZy5oUSX4BQuAxLvkHHpO2ZX0YqeGT6mY+l/JHLWiSNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by PH8PR11MB6829.namprd11.prod.outlook.com (2603:10b6:510:22f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 09:16:16 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 09:16:16 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Piatkowski, Dominik Karol"
 <dominik.karol.piatkowski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>
Subject: Re: [PATCH i-g-t v2 02/66] tests/xe_eudebug: Test eudebug connection
Thread-Topic: [PATCH i-g-t v2 02/66] tests/xe_eudebug: Test eudebug connection
Thread-Index: AQHa4nYg1n3WE4SH7kmq1UslRt3XALISIf6A
Date: Thu, 1 Aug 2024 09:16:15 +0000
Message-ID: <ebc973df97d338f9e4c4475613fdd484399c56cf.camel@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-3-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-3-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|PH8PR11MB6829:EE_
x-ms-office365-filtering-correlation-id: 22f482e1-015a-4f6e-50c4-08dcb20a98a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SnNFRkE3SGlxVWVtc3BTZUJ0TjBoeHBrUVVNbUQ3WnBPV3owcEtTd1R0MFFu?=
 =?utf-8?B?VDdBZ2N3emF6Q1pBVVM3WU42a2FRaTJCTmljTHkxMXRBczRJMmRCSXBpUUFm?=
 =?utf-8?B?WWltNEFTTHF2eGIrQ202VHFLK1JTTEFjVi9Qc0FnUWRTVE91dUo2TWhhMTUy?=
 =?utf-8?B?WW80d2tWNStrOUFmRmdjcXE2MTM1MXVQK1YyMXhaZWNRODN0VWZRc1luWk1V?=
 =?utf-8?B?bEk3NFZnRjE2U1cxSzFPNkNRem9xTi9KWU5ueEdzcm1CekYvZC9sZXllZWw5?=
 =?utf-8?B?c1hGQnhyYkZmYzFlUkJ1NnU5dWpKeU9NRHRTVmhvMGd2UmF6VWl1S0JLQ1I0?=
 =?utf-8?B?UExlWnhSL3N0VndMT0VPbjhuYU1USU4xTmFmWW4rNE9ZUkw4Z1U1alNWUzZP?=
 =?utf-8?B?THZRTzdqR1cvTlZnb3VuQUNGQmFjQ0NGSWcwY0c5RzJWcDlBa01zaEQ1Ylhm?=
 =?utf-8?B?VkVwRDNQQ2FnaFY3bVU1akhRQ09EYmZZaENGZDgvT0hHcGhRRXh0Z2NtQzBy?=
 =?utf-8?B?cU1Pb1NLTWQ2RW8veTVuNVZwSi81a1A0OTMxUDZwM3BNenFFbUFCUjQ3ZVdy?=
 =?utf-8?B?bkVxTTZRV2JZenJsdWpob1pyd1dOOHplOGpyb2dVREhCcTVVejhoK0FLbklL?=
 =?utf-8?B?SjZBZXo1WGVMRWg5MVQwY2krdmdWRDloM3Y1ZXZYcEpHMDBhcGtVUUFxRUNr?=
 =?utf-8?B?dngxQ3JsOUJFQkg4VGRTTWZ3QVMwUEZnWkJiL3FEaG9VNEhWRHp4TkkxR3d2?=
 =?utf-8?B?UXhDRVhKM2RpZ1lOUnUxdjRlOHRNdkphaEVSRXpuZ0FRM1RSamwvSDlBMU1s?=
 =?utf-8?B?OTFjMk1mTi81aE04Yk9kcFpmcFBYRGRQRS9tM0dCcElkVExrTWxxVTV3UXVn?=
 =?utf-8?B?WDM2dmo5SmJNaU4rV0UzeC9LS2o1VzF3MDBsRkJOeU9SdE4vVXh0cDZBdHpR?=
 =?utf-8?B?RWRXeEhPbVErWC9zeUVmcGtSL2JFcWJ6THNpSlZudFBtQ1NvcnFBaE5YL3Yx?=
 =?utf-8?B?Mm1IcDRBME5keXV6TXZXSHBsU3dIa3lVTnFQQjBFbzJrdWZXZU03Sk5CRURE?=
 =?utf-8?B?WFlBRjEzVm42SzVQVWcxVVp0VUVIWTI3ZzFDaHdubEhPQVJTQkZIck40OWpa?=
 =?utf-8?B?THBSdHdEMUdrdzN3a0lJR0xxaTUrTUlvbGFJanU3QXlNempUTUk2bVZmM01T?=
 =?utf-8?B?a0I1U1Q0YmxMYTBvLzByZVFTR0hsNDcrNy85TFFlNWNwaklYK203SUQ3dEJ0?=
 =?utf-8?B?OXN2TXN0bkp0VHI4OXhiZVVwdzR1MlZGTCtVZXY2M1hpYmkxZXplRHVBcWh3?=
 =?utf-8?B?blpWV2NSTnF0UjU2OVE3UzBBaHY1Z2FsUUtuT2oxUnVrZEM1cWh6WlhXOUZt?=
 =?utf-8?B?akRneFZjKzM0UEZoeEI1STVXSWJzNVpyVTdaWHZwYUw0V2xIY2RBTUJrZEpD?=
 =?utf-8?B?ZGkydTFETWZVVUI1QmdVT0F0d1RKMG1JbGtLc1F6c0JKV3lTKzM4dEFsQ0RM?=
 =?utf-8?B?RTdLcHMzZ1lPRGpHQk8xd3ZTOVl1NFNkMDQ5QVhYUjdFanllS2diSEp3ekUx?=
 =?utf-8?B?aHRZeGZSWVdzSUNYV1FQQjVwMW5BMG15OVJyZjJJd0ZxdFRhR1ErUXRaamJh?=
 =?utf-8?B?bzJzNzV2bFlvbGtqRjNJbitlMTNER0JrOW1TaEhmd0JEaW5sOVN1VmFGamxo?=
 =?utf-8?B?MG8wVlg2V1pOSXZja2hJZGFiMWlWSWxWalhocVpoVXJGVDYrRHo0WGtTMFFx?=
 =?utf-8?B?MU1FKzViZ3RpMU1mK0J0YkFvSnJiakUyQUUwdFR0bGVmaVBvOHYraVdPSUw2?=
 =?utf-8?B?eFB2amJ6QjdyT3dCcUZwWWNpRzFsNjI1aThKQzNjczZ2L0lraGRSSjVxdjcy?=
 =?utf-8?B?TEpHZ3BnaFVJY1FhbkVHMTFtSm9ETjMrV1R0TXBTWUZ0cnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjFFeDBucXlGNWN0alRFVkg5VkIxU0pmbnR6eW42VzNnN0ptYVlpdTRBRmFT?=
 =?utf-8?B?aWhXY0ZTTmU0K0JLZ0NGUXRLcTBTZVlCOE5TbFZCaGJuck9iYUpTN0dhVFow?=
 =?utf-8?B?ZW5DZlF5MUM5MW1aVUdNYzZvY3VvMnRONnFZcmtZL25WcXpmMFpnQkc0ayt5?=
 =?utf-8?B?eHAwOHV3WDMwYlFQeHJ5OEZBazdnODhHRVNTR3U1eVJwNTdyTkJiMUxqckow?=
 =?utf-8?B?WVdta3RmSjFPZ2N0Rlp6N1RseG1aeWxHZHJqYklHMWw0RFpjN1NBM1UyREFw?=
 =?utf-8?B?Q3h2c3VMNmRIVm5paXQ0ek51bWxoaUxFRDlxMGh0TVUvNUprclhBb2pEZ0JS?=
 =?utf-8?B?WG1qYkt4RUFJSW5FVXdhNjh0UkF6R2Z4SEd4dVRBMnRnbCsxM0hseWdtY2Q1?=
 =?utf-8?B?djU5STZJVkRFMTVnNXhrUDJxRGZhZWZwVVMrdWFVQjNNT2RRTjFGQzBac3VZ?=
 =?utf-8?B?eVBXVWhZbzdsNTlScUFKM1BvQnlEMExCbStMSDVORjR0TlFvdmp3ZFozTDhn?=
 =?utf-8?B?eGFFcHV1cUJqS1FhM2FpNnFOekFzUUNlZ3JmSkRzNGc2RmU4VW9VcWMxQ2Z0?=
 =?utf-8?B?eEhNOEY1YWNPakRQUlEwSnJWb3FpUVB0S0NJQUFFQWZsOXNtM3RzTWRDbUxP?=
 =?utf-8?B?dnZDMTBaVFR6SHh4UkZZSHFuMGUxLytLTE5GVnVOeXl1UzVSd3IyL3g1alFr?=
 =?utf-8?B?YW44VmduQmJ5RmFLYjNDZGU2akkwQ3JxcldNRVZsYVcyZG5BU3ZxQ1VUL1Vz?=
 =?utf-8?B?c3pPbml5dDViUkRMdXIxSjVUcWUvcXdTdm9rMisrM01BU3RGWDhIR05tM3Jx?=
 =?utf-8?B?YzQ4cmpTTXllRkpTR3JWNzBGTktETE5jTjI0ZEhXNnVxY0dqUldXY0FMZ2pE?=
 =?utf-8?B?NS9EU1Rkem9DUHdxZXRSTjNSNzlxVVEwUnhORndkOVlUVE9nTlhhYmR5aDkz?=
 =?utf-8?B?L2ZZODkvakxZcmQyb2gzZ3g5ZUtBenlUb0dRQ1ZaRnhDSEVzeFp5Tzd2ZFpv?=
 =?utf-8?B?Z0dKYWVPd0VJV0tDQmVyNHdLS2hLSzhGNXhlMnNhN0VoT1h4eGdkbnRBbjZy?=
 =?utf-8?B?UnhWUnE5Q1dYZ3paY21vY2xPdWxkbVFiQkJLUHhMam5QOWM5REpBcEVMTlBJ?=
 =?utf-8?B?ekp4bU1BMXN4RmRNbVZhb1ZaK3JEbTRZdVc4QnlWQnNkWk9PaDRWaXdZTVdx?=
 =?utf-8?B?c1RIVXVvUDB4QVVWL1htTHFGcDZDMnJaUllDTktJOVVzd3Fka2RZT245cmQv?=
 =?utf-8?B?d25kRytBZUltZEJSbUY3NmhxU2kyRVNHdWR1NzJIN3pOZ01hNmJ6eXMxM0JF?=
 =?utf-8?B?clVZUHJIVEpKa1ZuOHkxKzBLTXp0NWhDUEY1cnEwd1ZFOE1hRytsRDltMldt?=
 =?utf-8?B?bGF3MVZOWEowYW1XQ3U1Nm5iT1cyQzVsekw5SWtmODI3OHl3SENIeTVENDZs?=
 =?utf-8?B?VmZrK2tGb2ZFTzdWSWlSTlU5aitkdjlYK2I4U0lxY2JlbHZjM09WQi85NTVo?=
 =?utf-8?B?aTl0MmV2WWVwTnZmdVQxUm9OS0EwOXltTTRYQkxBZ1NuT2ZTOWdITzM5eUFp?=
 =?utf-8?B?bDNDT2hORlpjTmdFOXpuQTFRd2dXQkFDdldlelFEWm05K20xcEdZOFJLOFRR?=
 =?utf-8?B?NERPTXluSkw0NHpNTXhrUjRjWW1nS01FWDBZUjNxYkpxZjg4RHVtamtkR0Ri?=
 =?utf-8?B?ZEs4Z2llZWhPUVpEdC9qU1NrRkE0UmxyK21SNVZuLzJZOHdURll3TE5NUlda?=
 =?utf-8?B?UFppWHVJemg4Z2IyVzFzd29TemtybHpCaEhsOU9ySG93VkxzeSsyU2tmSG56?=
 =?utf-8?B?L2FYWXhSL3M1K1RGUHRyelBYMVg2ZExsTDAxejltbjZlVG9GL1JLNGJjREJJ?=
 =?utf-8?B?ZjNlNWRmblBCUXFEZ1N5YWQzZWRiVTFUT0RBSGw0dS9DNUhaQ2R5YmxFcWti?=
 =?utf-8?B?M2hJUzFrU3NINWU2K0tPTzNFd0Rkc3ZpYjRQMmViSXZVa1VlLzhxYkRZYVhC?=
 =?utf-8?B?NjBvUmhPK3lYTGcyNkVJQ3lsTnN6ZlhaVis2WlJlRzFNT3hobEw1U3ZBQWlQ?=
 =?utf-8?B?YkUwOWNBeUZuTG16cm5ldkpRODZlRWkwTmJVN2xTNHRiUURTUGs5aUZIS0dw?=
 =?utf-8?B?N2NiMklXcXlUaEFFY081SHpyVkNlZmtydllnNWppNVh1ZzJFYWJTb1piMGZ2?=
 =?utf-8?Q?plrqHzRBz0TRPzXRrRiAgcs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E75C0765F2651F47B826CA3F904FBCEF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f482e1-015a-4f6e-50c4-08dcb20a98a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 09:16:15.9409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqKATqIFL6ad4j69gJzXZWwIEUOQeRpdxP0IT4LuQtb6CmsWbr3qNqBBqTlaTUEINssMCkQodWp2w9U1ruRaVoDms+01l63Ju4vW2ayLuVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6829
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

T24gVHVlLCAyMDI0LTA3LTMwIGF0IDEzOjQ0ICswMjAwLCBDaHJpc3RvcGggTWFuc3pld3NraSB3
cm90ZToNCj4gRnJvbTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50
ZWwuY29tPg0KPiANCj4gQWRkIGJhc2ljIHRlc3RzIGNoZWNraW5nIHhlIGV1ZGVidWcgY29ubmVj
dGlvbiBjYXBhYmlsaXR5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG9taW5payBHcnplZ29yemVr
IDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEt1
b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IENocmlzdG9waCBN
YW5zemV3c2tpIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVz
dHMvaW50ZWwveGVfZXVkZWJ1Zy5jIHwgMTM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiAgdGVzdHMvbWVzb24uYnVpbGQgICAgICAgIHwgICAxICsNCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTM2IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0
cy9pbnRlbC94ZV9ldWRlYnVnLmMNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9l
dWRlYnVnLmMgYi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMDAwLi40NGE0OTEzMTkNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysg
Yi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMNCj4gQEAgLTAsMCArMSwxMzUgQEANCj4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAy
MyBJbnRlbCBDb3Jwb3JhdGlvbg0KKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlv
bg0KQW5kIHRoYXRzIGZvciBhbGwgdGhlIGZpbGVzLg0KDQpSZWdhcmRzLCBEb21pbmlrDQo+ICsg
Ki8NCj4gKw0KPiArLyoqDQo+ICsgKiBURVNUOiBUZXN0IEVVIERlYnVnZ2VyIGZ1bmN0aW9uYWxp
dHkNCj4gKyAqIENhdGVnb3J5OiBDb3JlDQo+ICsgKiBNZWdhIGZlYXR1cmU6IEVVZGVidWcNCj4g
KyAqIFN1Yi1jYXRlZ29yeTogRVVkZWJ1ZyB0ZXN0cw0KPiArICogRnVuY3Rpb25hbGl0eTogZXUg
ZGVidWdnZXIgZnJhbWV3b3JrDQo+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRl
c3QNCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8eGVfZHJtLmg+DQo+ICsjaW5jbHVkZSAiaWd0
LmgiDQo+ICsNCj4gK3N0YXRpYyBpbnQgX19kZWJ1Z19jb25uZWN0KGludCBmZCwgaW50ICpkZWJ1
Z2ZkLCBzdHJ1Y3QgZHJtX3hlX2V1ZGVidWdfY29ubmVjdCAqcGFyYW0pDQo+ICt7DQo+ICsJaW50
IHJldCA9IDA7DQo+ICsNCj4gKwkqZGVidWdmZCA9IGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hF
X0VVREVCVUdfQ09OTkVDVCwgcGFyYW0pOw0KPiArDQo+ICsJaWYgKCpkZWJ1Z2ZkIDwgMCkgew0K
PiArCQlyZXQgPSAtZXJybm87DQo+ICsJCWlndF9hc3N1bWUocmV0ICE9IDApOw0KPiArCX0NCj4g
Kw0KPiArCWVycm5vID0gMDsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICsvKioNCj4g
KyAqIFNVQlRFU1Q6IGJhc2ljLWNvbm5lY3QNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJRXhl
cmNpc2UgWEVfRVVERUJHX0NPTk5FQ1QgaW9jdGwgd2l0aCBwYXNzaW5nDQo+ICsgKgl2YWxpZCBh
bmQgaW52YWxpZCBwYXJhbXMuDQo+ICsgKi8NCj4gK3N0YXRpYyB2b2lkIHRlc3RfY29ubmVjdChp
bnQgZmQpDQo+ICt7DQo+ICsJc3RydWN0IGRybV94ZV9ldWRlYnVnX2Nvbm5lY3QgcGFyYW0gPSB7
fTsNCj4gKwlpbnQgZGVidWdmZCwgcmV0Ow0KPiArCXBpZF90ICpwaWQ7DQo+ICsNCj4gKwlwaWQg
PSBtbWFwKE5VTEwsIHNpemVvZihwaWRfdCksIFBST1RfV1JJVEUsDQo+ICsJCSAgIE1BUF9TSEFS
RUQgfCBNQVBfQU5PTiwgLTEsIDApOw0KPiArDQo+ICsJLyogZ2V0IGZyZXNoIHVucmVsYXRlZCBw
aWQgKi8NCj4gKwlpZ3RfZm9yayhjaGlsZCwgMSkNCj4gKwkJKnBpZCA9IGdldHBpZCgpOw0KPiAr
DQo+ICsJaWd0X3dhaXRjaGlsZHJlbigpOw0KPiArCXBhcmFtLnBpZCA9ICpwaWQ7DQo+ICsJbXVu
bWFwKHBpZCwgc2l6ZW9mKHBpZF90KSk7DQo+ICsNCj4gKwlyZXQgPSBfX2RlYnVnX2Nvbm5lY3Qo
ZmQsICZkZWJ1Z2ZkLCAmcGFyYW0pOw0KPiArCWlndF9hc3NlcnQoZGVidWdmZCA9PSAtMSk7DQo+
ICsJaWd0X2Fzc2VydF9lcShyZXQsIHBhcmFtLnBpZCA/IC1FTk9FTlQgOiAtRUlOVkFMKTsNCj4g
Kw0KPiArCXBhcmFtLnBpZCA9IDA7DQo+ICsJcmV0ID0gX19kZWJ1Z19jb25uZWN0KGZkLCAmZGVi
dWdmZCwgJnBhcmFtKTsNCj4gKwlpZ3RfYXNzZXJ0KGRlYnVnZmQgPT0gLTEpOw0KPiArCWlndF9h
c3NlcnRfZXEocmV0LCAtRUlOVkFMKTsNCj4gKw0KPiArCXBhcmFtLnBpZCA9IGdldHBpZCgpOw0K
PiArCXBhcmFtLnZlcnNpb24gPSAtMTsNCj4gKwlyZXQgPSBfX2RlYnVnX2Nvbm5lY3QoZmQsICZk
ZWJ1Z2ZkLCAmcGFyYW0pOw0KPiArCWlndF9hc3NlcnQoZGVidWdmZCA9PSAtMSk7DQo+ICsJaWd0
X2Fzc2VydF9lcShyZXQsIC1FSU5WQUwpOw0KPiArDQo+ICsJcGFyYW0udmVyc2lvbiA9IDA7DQo+
ICsJcGFyYW0uZmxhZ3MgPSB+MDsNCj4gKwlyZXQgPSBfX2RlYnVnX2Nvbm5lY3QoZmQsICZkZWJ1
Z2ZkLCAmcGFyYW0pOw0KPiArCWlndF9hc3NlcnQoZGVidWdmZCA9PSAtMSk7DQo+ICsJaWd0X2Fz
c2VydF9lcShyZXQsIC1FSU5WQUwpOw0KPiArDQo+ICsJcGFyYW0uZmxhZ3MgPSAwOw0KPiArCXBh
cmFtLmV4dGVuc2lvbnMgPSB+MDsNCj4gKwlyZXQgPSBfX2RlYnVnX2Nvbm5lY3QoZmQsICZkZWJ1
Z2ZkLCAmcGFyYW0pOw0KPiArCWlndF9hc3NlcnQoZGVidWdmZCA9PSAtMSk7DQo+ICsJaWd0X2Fz
c2VydF9lcShyZXQsIC1FSU5WQUwpOw0KPiArDQo+ICsJcGFyYW0uZXh0ZW5zaW9ucyA9IDA7DQo+
ICsJcmV0ID0gX19kZWJ1Z19jb25uZWN0KGZkLCAmZGVidWdmZCwgJnBhcmFtKTsNCj4gKwlpZ3Rf
YXNzZXJ0X25lcShkZWJ1Z2ZkLCAtMSk7DQo+ICsJaWd0X2Fzc2VydF9lcShyZXQsIDApOw0KPiAr
DQo+ICsJY2xvc2UoZGVidWdmZCk7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogU1VCVEVTVDog
YmFzaWMtY2xvc2UNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJVGVzdCB3aGV0aGVyIGV1ZGVi
dWcgY2FuIGJlIHJlYXR0YWNoZWQgYWZ0ZXIgY2xvc3VyZS4NCj4gKyAqLw0KPiArc3RhdGljIHZv
aWQgdGVzdF9jbG9zZShpbnQgZmQpDQo+ICt7DQo+ICsJc3RydWN0IGRybV94ZV9ldWRlYnVnX2Nv
bm5lY3QgcGFyYW0gPSB7IDAsICB9Ow0KPiArCWludCBkZWJ1Z19mZDEsIGRlYnVnX2ZkMjsNCj4g
KwlpbnQgZmQyOw0KPiArDQo+ICsJcGFyYW0ucGlkID0gZ2V0cGlkKCk7DQo+ICsNCj4gKwlpZ3Rf
YXNzZXJ0X2VxKF9fZGVidWdfY29ubmVjdChmZCwgJmRlYnVnX2ZkMSwgJnBhcmFtKSwgMCk7DQo+
ICsJaWd0X2Fzc2VydChkZWJ1Z19mZDEgPj0gMCk7DQo+ICsJaWd0X2Fzc2VydF9lcShfX2RlYnVn
X2Nvbm5lY3QoZmQsICZkZWJ1Z19mZDIsICZwYXJhbSksIC1FQlVTWSk7DQo+ICsJaWd0X2Fzc2Vy
dF9lcShkZWJ1Z19mZDIsIC0xKTsNCj4gKw0KPiArCWNsb3NlKGRlYnVnX2ZkMSk7DQo+ICsJZmQy
ID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ICsNCj4gKwlpZ3RfYXNzZXJ0X2VxKF9f
ZGVidWdfY29ubmVjdChmZDIsICZkZWJ1Z19mZDIsICZwYXJhbSksIDApOw0KPiArCWlndF9hc3Nl
cnQoZGVidWdfZmQyID49IDApOw0KPiArCWNsb3NlKGZkMik7DQo+ICsJY2xvc2UoZGVidWdfZmQy
KTsNCj4gKwljbG9zZShkZWJ1Z19mZDEpOw0KPiArfQ0KPiArDQo+ICtpZ3RfbWFpbg0KPiArew0K
PiArCWludCBmZDsNCj4gKw0KPiArCWlndF9maXh0dXJlIHsNCj4gKwkJZmQgPSBkcm1fb3Blbl9k
cml2ZXIoRFJJVkVSX1hFKTsNCj4gKwl9DQo+ICsNCj4gKwlpZ3Rfc3VidGVzdCgiYmFzaWMtY29u
bmVjdCIpDQo+ICsJCXRlc3RfY29ubmVjdChmZCk7DQo+ICsNCj4gKwlpZ3Rfc3VidGVzdCgiYmFz
aWMtY2xvc2UiKQ0KPiArCQl0ZXN0X2Nsb3NlKGZkKTsNCj4gKw0KPiArCWlndF9maXh0dXJlDQo+
ICsJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvbWVz
b24uYnVpbGQgYi90ZXN0cy9tZXNvbi5idWlsZA0KPiBpbmRleCBlNjQ5NDY2YmUuLjM1YmY4ZWQz
NSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvbWVzb24uYnVpbGQNCj4gKysrIGIvdGVzdHMvbWVzb24u
YnVpbGQNCj4gQEAgLTI3OSw2ICsyNzksNyBAQCBpbnRlbF94ZV9wcm9ncyA9IFsNCj4gIAkneGVf
ZG1hX2J1Zl9zeW5jJywNCj4gIAkneGVfZGVidWdmcycsDQo+ICAJJ3hlX2RybV9mZGluZm8nLA0K
PiArCSd4ZV9ldWRlYnVnJywNCj4gIAkneGVfZXZpY3QnLA0KPiAgCSd4ZV9ldmljdF9jY3MnLA0K
PiAgCSd4ZV9leGVjX2F0b21pYycsDQoNCg==

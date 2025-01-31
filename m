Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE48C0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 17:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFAB10E091;
	Fri, 31 Jan 2025 17:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cj6Pxny9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D4510E091
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738343394; x=1769879394;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vsZqtDr94sowFHT4m6wakS3wxJLzuHYudT42CHqSbwk=;
 b=cj6Pxny9wwUV+NsRmANOFHfoimv4ak/ZULPXIRGHXnQHlaRYIk/6/uJb
 S+D1IKb+YM6WHqQT9yoRN+lvNJynWerE/q4NmyOjE9pxuNpF0k6l41zhD
 gY7eDKIpY0CK4o0ZBMIf6Y+WTvXxh+g4MdPE0Lmku59q58/BTezq9B0RQ
 1Fl/uPncnfLU9gPNhXIrOViZXxLa+sXgvMe0iPCGE08lDUHxnh41spG/G
 /19RQ3ZQlSlNeTBjxOnFK+aB1/XS2YglFyQa4Tapaw3wyaJSffR3AvXtX
 NBn8hl+GVNJ/npmioc9GpsZnAkjVemxEcDNvE1Lvgh8rsSVvUUelDNd4D A==;
X-CSE-ConnectionGUID: rQOuBeG7Tj2Ybn9Jpj37NA==
X-CSE-MsgGUID: ELAR9re0QDmejwNqFga5kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39019405"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39019405"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 09:09:53 -0800
X-CSE-ConnectionGUID: +Gkuxvb3QxSxSlXVqcX5WQ==
X-CSE-MsgGUID: rYfD8o0mQlSnDPevG/1MXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="114679220"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 09:09:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 09:09:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 09:09:51 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 09:09:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nU9/LSJu9nmKq/P0h0Sow7EX7Drkay3tAmBLSwuOTF4U+r75Y2RBh2zO+XScPHUT4L/KqRZKxRxEhWaSfZkEBV40uKzIfn2lJck74X1RToz3tgXk28wbQCEJj+gsLtD/x322t11W1eNMDwITkXaJ4nmmyHApkaat+ebtwnMIFgDsKbRf2z5oIXWXDNqEkfxypX8mW7GotzWJ46C+GXF5eqct9tCMOoA9/06gBh80QZnBK3P3b3hPY5wwhOD31Efi1GKSvuHORqML8ntO+5/KGCXO+GzELZsyg8manxmNGt/c0TzjAuOoMJ9Y65DFkoQzuCzeFLUe5u091341X4v3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37k7ZdxlIDNSeqpYKoptn/yS9WiS0cStiFANS/iQKd0=;
 b=H3B41o1d3f8eZG9Cqg+kCqHziygCfANTrRUSTPajSOb25hwENBp1rBciEv16wKSoljE6pYOgxH0joOhcN1ZltJ8+631UFQPLrlxSQqfsKl90SI38NEVBZByQVnYpUAwd3o8JcxALng5pkcidbxWedEFBzidJGMjF/YKNkp/MZsJC16/Cvh837h6/X9weim8/vHOzbg/a1bXzSrS++xmRncKTEBtcoF5Wpd24+nURoMrKuC0XAM9ia8/hiVzcCi8LYvHCSOfUSY7Qv6VPBJpbrPXsMAFUTJIwkt5hgxNNswYDjBZLaD+PL8cwT0QW9C6zeET5laO9mrtisLU/OEDqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 17:09:45 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 17:09:44 +0000
Message-ID: <008c9383-5022-4f5e-8a85-022100d15242@intel.com>
Date: Fri, 31 Jan 2025 09:09:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_create: Stop treating the
 extension field as MBZ
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
 <20250130221457.1092670-3-daniele.ceraolospurio@intel.com>
 <20250131125928.ivnojwqamlsvem6s@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250131125928.ivnojwqamlsvem6s@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 7463c631-e10d-4a05-2a46-08dd421a0f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1BxU01PY2kwa3hWaEh2Q0RwYi96aCtyOEJBWWhBSUZDSkd3RjRYTWZ1blB5?=
 =?utf-8?B?aGkvSFBleit5ZzlmbGRhcXhTSWxZZXcrV080KzhnbUZienhGZndLNEhtcjRS?=
 =?utf-8?B?b2huNm1DNFZheG5ueTZSbkJWcERQdlZ1SEQyQ05KNVhNTldhUGJqRUJ5akM0?=
 =?utf-8?B?V25aeEhpRVBWWStvb1FubnJCUTU0QUlHbzV6Z3ZZN25Da0dHZm5wUnZzZW91?=
 =?utf-8?B?U1NUNklyaXFMdlVsVTk5K1NWL0xDSVdHN3RWYmVFeExBR2ZRWEVtbnQ1NnEw?=
 =?utf-8?B?RnYzcmtReC9nWDVNZm5MK2s0VnVTZXNzNG92S3BtODY0ZkNuN2pRdmdBeEtI?=
 =?utf-8?B?THlRNVRBU0N6YklJWWdqYytmKzdpQ3p6ZHlIN1dHbVlxckEvRGZ0M04ybThH?=
 =?utf-8?B?eStEUEJxRjRPZDYwQXdBczFNRWo0RmE5WkNkeUg2OVFNRytmQWkzbjQ4Y29S?=
 =?utf-8?B?Q0FmUk8xc3g0b2ZBSndhZ2VLR0R5c1ZMaldBWjBuS3lnd1ZSZ2hZMk0rNW5o?=
 =?utf-8?B?UUdlVTRBSWoyNE5MaHZTRXVQSHJwSVhKRytlaDlKVzFZRkh6ZVhLOENGMEV6?=
 =?utf-8?B?TE5YVUNDQXdVcUp4djcrOWNNdEtuRkk4WCtISlZOY0lCUTVUNXVMV01UVTJz?=
 =?utf-8?B?QlNycTVRS2dSUVB4OTJwc1hRN2owSHpJeHlUNWJiTUIxQWE2SUpOM3c5MFgy?=
 =?utf-8?B?WTJMREV0MXR2UTJ6K3ZqdGpNZFFqbDgwRW52SkZ3T2ZERURQR1EzWHRjem9D?=
 =?utf-8?B?aXJaL1JEWUxRc1M2Ym51NWpNWXpOZmc3MkF4WU5LVThKYUorMmliZExjNWh3?=
 =?utf-8?B?U3VXVVpZazkzQ3V5SVFWNFhVVGRDeDl5TUw0RHJDcFYyMFN4Z0dDTXFxT3Nm?=
 =?utf-8?B?Ty8rZFZsYmRxUlBCTnVINWNoSWwyd2tNVDN2amdEMnd6VkNQTWx6c1pIUTgw?=
 =?utf-8?B?SitXUlpzVkVkZHZHUWhJNTBtTUJLVlZLR0hCZEpCYnBpK2FVUktlTGxtcnJi?=
 =?utf-8?B?dHduTUdGU29oYXFWNlBFcEZqTFliVThKbmRqNEdpeS9DLytieG9kKzRWWHkv?=
 =?utf-8?B?a2lMempXbjFrSTBQY2ZXaVBDUThIUGVaY3Q4M2o5bmdrN0lFM2JlZGZnbjNo?=
 =?utf-8?B?bGgzV0NNamFLMnQ2NE1IdlpYRmYzSlJveDZzeWZCYnlIWGF2OVQ2a0dJWGlk?=
 =?utf-8?B?Wk5KTEx6Y01qa2RtMjhaaGphWGFOd1F4dTdjVHhqTzg5dTJLT2lydldSamFx?=
 =?utf-8?B?VFNCd0ZyS3lMajRtSlZ5NTlFaDFidFJJSzZRZGRYc3pQRGNNVXNwSHBGWFVr?=
 =?utf-8?B?dUdqZnFXbWs3V0UwWnVwR2VMWG5Qd0JKMTQzMVNyYjdNUTBCNTI3a0VkU1Nw?=
 =?utf-8?B?MUJ1N1o1dFlFY3BoVU0zc3g5VjJraTQ0azdOME1sMGhwazI4akZyS0ZyZ0R4?=
 =?utf-8?B?Q3BXVWVOSHRuYktGNnNSZmtPQXhCNG5nS3RDMXlsVXBuQmpDNHF0dzd5WjJW?=
 =?utf-8?B?dCtjN2RLbjJKa2twZzEzWDZIUE5iVUs1WkdvZjFVbzV0cWppcktFRkEwV2p3?=
 =?utf-8?B?MEgreC83M2RnWWx6UW44Rk16VWcxNXVqMTM1RGQwVzNKRFNyWmdhZHhEUTkz?=
 =?utf-8?B?TTBRMXlYanhUTHVxVVBvZlFIRjhNNnBxR1ZKOGZLb29uTTNFRU1yMFowSVEv?=
 =?utf-8?B?T0ZINDZjbld2anpGWXFQei9sNXFXRmZWZXBsK3hPNmxiNEtxVklWTTlmSnNk?=
 =?utf-8?B?Ykx4R1ZqMGg2QTVkd3JMR2VwSktGQmZTV3ZtT2ZYMzVvaFFtcVU2NHROYnda?=
 =?utf-8?B?ZnRzMlBTRjhMVGdrTlZPQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTZtVE8yanZQNFp3dk1vT0lUS1FURmptczdoWEwxRE81UkMvSUpZNi82d0xS?=
 =?utf-8?B?QUJTY0xJUi9CU3pwamUybExLbFZTd25TN2k1MXoraW9HVENrTmlSdjhXT1Bt?=
 =?utf-8?B?OThjV3ZQRnlhelhLaXAvdVNSNUdtWlU0TC9zYWFvaEpOcnNBTHVqcFR0TEg2?=
 =?utf-8?B?TDdwYWNtaGhGQVE3cU03YzNZL2E1TnYxOG9LRmtNR2RmTjVPRnB5Y2xIZHM1?=
 =?utf-8?B?ZFpBaTFGa2R4eXpQTGMrL1dHK3ZlaEpWZVZZZEFNK0pOejQ4blNOanZnVnZz?=
 =?utf-8?B?a2JyOWNqYk1IV0w1Y3VObjR3MFh5RzNFcjQ5TkNVRUZ0OVQ3cU12a3NRSjE1?=
 =?utf-8?B?NU9FRE9qSDZlY2NNU2FxSXFJTnE2T1BsRHNUUSswZVpJRCswMWtnL1Z6WEk3?=
 =?utf-8?B?NDZ1Tzd5eUJCV3FjbVZTOXJ2bmRYeVZGM1FqN1FiMWxQM3Mwb3ZuUTcrTW00?=
 =?utf-8?B?S0xlQVY5Tm0yd2Q5SlBMa2o4YWZVWHhFK2pjQ1F3NDViem5GSHIzOCtwR3Jv?=
 =?utf-8?B?TjVPeTY5SEFyY2NXNmpscnBPak5DcWIzWlFuMWRtbEFPdmxWWFp4dzZEV0NH?=
 =?utf-8?B?SEJyOUR0Y0xpbVZ4L0NhUEIzME80VnErU3hGUFlUT1Fmb3JXaG1ZdHEvdU9W?=
 =?utf-8?B?OVN1YmR6VlpDd0hHdXdydmJuQVhGSE1hRkZNZHkzS0dSSWo3ZGlhcFA2QzY0?=
 =?utf-8?B?ZUtHaHlSVUs0dHFURGp4MDZjaldmQUlzcjIwVVNLeTVvbXF1QnluSFR4ZGFx?=
 =?utf-8?B?cHJQRXJmYy8yWThyeFc4UkY5NVdEOUZ2QkpqQ2UzOVJHaGhvbUVVTi9QdlI2?=
 =?utf-8?B?eWh6UVA2U080VWZuUWlNU3BYSVorVldabTNRaFJLVlBTQ25YR0x5My9FU2lV?=
 =?utf-8?B?WEFSaklUVHE4SGhVNWRJMHBIRExURVpVVkY0U0JTNkNnemRsZjNSaHFSWDNP?=
 =?utf-8?B?cVNaektSSkdHaldkNzZaa1hmN1JXTlJRYTE2ekZRbFdnMXBNUkdyK3FVck9R?=
 =?utf-8?B?MGk4WmtldncvVytqUDhRM2ZOYTEySGxoaG10RjcvTlExdmsxVng4eWxrcUtJ?=
 =?utf-8?B?TjZjZUR0ZGQzRG0wUHYxV2tQY3FzNnFjL1dCZWNpOC9UUzdia1RXUGJMUHlk?=
 =?utf-8?B?MVowck5pNGhIbmcyYXloZGVVcTdCcllLNkJEb3hETS9kc0tGMlQvNnFKa0o2?=
 =?utf-8?B?cXhONkN1aVByOXg1ZXVlUTMwQkZTRVhDTkFXc01LaDJTWmoyMHU4NnJoSm9S?=
 =?utf-8?B?TGFkRTZwd2R6cytwaFdSdHp2R2NLaHRNOC9oVURab2k0TnRuSGNpUWxoa2Ra?=
 =?utf-8?B?QVVvODRRMnduNmp2Yi9uR0tWYzdLc3JLbElkSTZuSjE3RlM0ZnpXTmtBeDRq?=
 =?utf-8?B?UnZZT04xNTBRRlB3UE0vdDhiTHA2UGQvRDY5SllISjl6eUxKNFE4WlJCV0NC?=
 =?utf-8?B?UFhDMFRVNkQ5OFNzMGtCNGN2NlVZQ3ZZbkhxOGtSMThEZkdYeGt4NnUwd0l5?=
 =?utf-8?B?YU9EZlRGVjl0bFF2R3MvYjZEYzZVVFdDeVpBb21Zb0dZSWsrNXNTdGdlejJq?=
 =?utf-8?B?ZTQvN0ZLVE8vbDlTTHcvdWlKZWlFb0tUSW1kWnFxamJpdjNWa21CVytSTzNl?=
 =?utf-8?B?eFpaTmtnZENkMjczR1pnV3FvUTZ6MGdFNkdXY1hnWTB3TjQ5OG0xZXIwdHZH?=
 =?utf-8?B?UlExNE0xVm1pR2Faa0R6MUQ5ejlqZlMzSXpQTGl2MnVzMVIyUnVyWUQ2Qi9G?=
 =?utf-8?B?M0pMeFlYaFNJWG9PV1RBRWJwV2ZadWNMblJnUGVyU3YzWkRCVkp5QkdpL3JO?=
 =?utf-8?B?V0svaXFBaEJBZ2E5WXoyT1YveEYwSmhhNDhkaE5rcTZ3ZkRRb1B4dFVNLzJw?=
 =?utf-8?B?a01zWU01SHFIMk0xMXBiaS9uYXV1UmJqVVBSeWNZSXFRN0FiKzZjakVwR09w?=
 =?utf-8?B?K1h3WHJOT2lqdE13T3VxWG91SGM4NnZZeHpta2MydlVuTUNYKytPMitycnlH?=
 =?utf-8?B?am9QN3dFdDFuTjVFK3VJczVKdDh2cGNFQUVVR2U5aDNKWS9hazdwdit3eVZR?=
 =?utf-8?B?WW1jL1UwT1pNT0NIKytpQkFwWUdLWTViNkFXamtSVVV5R0cwYmFoOFpCN2Ez?=
 =?utf-8?B?UzVMY05zbzg3NzNMa3JyaDdGK1Jlc1hOdndJNXJYVm53MU45bFkya2ZLRHJ4?=
 =?utf-8?Q?B1SgWgiEMifAiulAQwDKCT4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7463c631-e10d-4a05-2a46-08dd421a0f23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 17:09:44.8625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnVwL5FexfhyNIK511o5bFPHDuOkeS8U1tWlztfn1PTh488s5ZJ59JC42nDSGoNnkwUfLuz73m7+IljvE3kO/OynHJvC/AozNFdzOxUdbFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7343
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



On 1/31/2025 4:59 AM, Kamil Konieczny wrote:
> Hi Daniele,
> On 2025-01-30 at 14:14:56 -0800, Daniele Ceraolo Spurio wrote:
>> A new extension for the xe_create ioctl will be added to support PXP [1],
>> so in preparation for that to be merged stop expecting the field to always
>> be zero.
>>
>> [1] https://patchwork.freedesktop.org/patch/634550/
> Please add also lore.kernel.org link (could be done at merge)
> here and in next patch, Thanks!

Should I just replace this link instead of adding a new one?

Thanks,
Daniele

>
> Regards,
> Kamil
>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   tests/intel/xe_create.c | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
>> index e3be6b774..e3ebb9fd4 100644
>> --- a/tests/intel/xe_create.c
>> +++ b/tests/intel/xe_create.c
>> @@ -243,11 +243,6 @@ static void create_invalid_mbz(int fd)
>>   	gem_close(fd, create.handle);
>>   	create.handle = 0;
>>   
>> -	/* No supported extensions yet */
>> -	create.extensions = -1;
>> -	igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
>> -	create.extensions = 0;
>> -
>>   	/* Make sure KMD rejects non-zero padding/reserved fields */
>>   	for (i = 0; i < ARRAY_SIZE(create.pad); i++) {
>>   		create.pad[i] = -1;
>> -- 
>> 2.43.0
>>


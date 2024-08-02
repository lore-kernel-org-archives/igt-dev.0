Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C02AC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 10:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4B510E9D6;
	Fri,  2 Aug 2024 10:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZ3cjQG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EEE10E9D4;
 Fri,  2 Aug 2024 10:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722594420; x=1754130420;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Jfqp4tgxpeex6VX4/02WXhVXU7Gj1RH+lr5BiWThDDA=;
 b=fZ3cjQG+4Y85+dzS2sGDl/tgm5H5XCKya9QAzt4p0+aGfZAQQs57nQtN
 qO/IazLXrZ8wizD3Vdpycy0M8SsijExmeQmSodhPDBLL4p2DGZcsJ5pqi
 ne06xHnqOyMjwFycHJBVVsmgT2oBWc9cKQk4luzlBrCsGft1vZpG8N+xe
 1qfPV0lOzriQXW2UxreCMocGYZ3+J0EX5DjKeQ7pDAgDA0Uscm7EOnHM2
 xdSPIrJYtXrFRrDHkb/URg671sudqpzNIG9QUhGCFlGb0WJYMZauT8vko
 NJ7GJfB69SCFABtHJ5hLmpERbPenB/WjJ+cIbhaCaXZDDw2aNm4Evq/Zo A==;
X-CSE-ConnectionGUID: XRvPxu60QQ6kNuQoSf1npA==
X-CSE-MsgGUID: 4n2M8ILNQniyLEVDCRUptw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="43120430"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="43120430"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 03:26:59 -0700
X-CSE-ConnectionGUID: x7oMQxL/Th+E/L1VLzSzUQ==
X-CSE-MsgGUID: VXzTrj+aS0KBjiQLUPzDVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="60181313"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 03:26:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 03:26:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 03:26:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 03:26:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 03:26:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXPd/r4Rok7Kt57k6O+pfF0jkpB2OgTn6J+E7C8t9vVUCZ664A007OxZRbG9Rygh0vOpd0jwERp03hbDFc4i5lL3aJglh2ELhDRPNsrvKfRicsO/SWKWlM+JLAFRnmq+ruxjBw9k5npJWyQrIhABiCwKWFFSVM8ec8wYRUT0ngAB/hfxaF2p5XdSvtpFLo6ys9F60FJQvDi24Lf8JqSD6sbV8dxf2Vpt34u8W7r425vScpNnLd5N8D/5VfKF5VszDvpy8J/ZhwXIe/+GPmLHLXNTELR710nMSKgixFQbZcr+nTufqmLS4jhcmBD5jXHzBDGD1ZhC42GXARGoQt6dNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jfqp4tgxpeex6VX4/02WXhVXU7Gj1RH+lr5BiWThDDA=;
 b=WxWJhcBAGLGJrKxJ046f6q3+DMM2xY6/Xmb+JIeBdM2WX1Pcg04xAF6oJvRsfVQy/VSCTCj7lPLkUnkmVuVTm+MpJUrY0YsV+G4LUQpCdg+xpvewD2xBLfuHbGYdy8srLOUZlKW/nb1JXnoxc5h7IZC9voOMpuLpOUDeLiaFV6s09Mzu8hu37mRpFcoYsEkCbAn1Eq7M1L7aBtU0C8qI5z5dSi3YslAhLoABSVJlxmm7dsjhdK2dKw6yUrvJTyenaNC1FWJKw3LokvYZ4kgR1BT6p6Or3r4G/N2m0hcnhANBqRoB4S8ofpDSOHoIpmXZzKNlno0dbUZepQSot7bW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6749.namprd11.prod.outlook.com (2603:10b6:806:267::22)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 10:26:55 +0000
Received: from SN7PR11MB6749.namprd11.prod.outlook.com
 ([fe80::5f56:e651:a17a:8046]) by SN7PR11MB6749.namprd11.prod.outlook.com
 ([fe80::5f56:e651:a17a:8046%5]) with mapi id 15.20.7807.009; Fri, 2 Aug 2024
 10:26:55 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "Saarinen, Jani" <jani.saarinen@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsOiBE?=
 =?utf-8?Q?rop_unused_local_variables?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWw6IERyb3Ag?=
 =?utf-8?Q?unused_local_variables?=
Thread-Index: AQHa5Gz4MmZnr2g4vk+SBOoYb071j7ITlwYAgAAsj/A=
Date: Fri, 2 Aug 2024 10:26:54 +0000
Message-ID: <SN7PR11MB67496635CE9E9FDB31F93E32F2B32@SN7PR11MB6749.namprd11.prod.outlook.com>
References: <20240801225224.3744479-1-matthew.d.roper@intel.com>
 <172255595359.489771.8234781667380581922@2413ebb6fbb6>
 <DM8PR11MB56557830D3EE7382D6F8288BE0B32@DM8PR11MB5655.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB56557830D3EE7382D6F8288BE0B32@DM8PR11MB5655.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6749:EE_|SA0PR11MB4718:EE_
x-ms-office365-filtering-correlation-id: c7e7158c-b569-4e27-d3df-08dcb2dda1b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R3RrL2xDcllKSTM3NWJCVTFjaG9ka2MyNzMxN0d5OXBGRWxWSDFlTDFHU3dF?=
 =?utf-8?B?Z050NXV3NWV6eWxWU0F0ZnVlTS9ES0RrOTZUK3E5TFhsdmdRVmNjVkEyeldN?=
 =?utf-8?B?M2djRTd6ME1vSUhqR3RWaEpuZmpoNVZ2ZFU2T25rUFZESTNNMVFpRmhhZ2R2?=
 =?utf-8?B?RHovcW9UUWhiUWJqZUFuNUFMUUlTMFNEOENMOVR6VGVHQ2VCV3BFTWJwaUpL?=
 =?utf-8?B?MElQdExsMldETzBmZm9SaS9HQ3pLem9hZUJMbHcyNS9aRGF4SlFXaVpoRDFE?=
 =?utf-8?B?WDJpRlYvZ2k0VzVkNEpzdWY2eDZjeVp4SFVOUnptTWMzem9Ld0E3TGVnWGhL?=
 =?utf-8?B?L0UrcG1ZQ2ppZE9LRVF4Mnc4NFhGQ2ZxbXN3N29vamUwemcxcnd5NFNnYjZa?=
 =?utf-8?B?TGk3VXNJUHB5VldzR0hHcFJyZ29SVXE4SWgxTFRZK0IwRlVta08yNkVjVDdj?=
 =?utf-8?B?VFZMb2hGTnZEMWVZd2VWSkRvQS9RWE1EWmxOcWdwaldWVnRGVHhtbU5sNHRX?=
 =?utf-8?B?TU5hblVhbldEWlBQL1Q3VWZiSDU1WHc4QlJCaHBoREgvSTYvOUY5d2VCeEkw?=
 =?utf-8?B?Z1Rtem8rTUY3dTQ2OEtaOXhBWktYNElLVXZrbDNlMStSMnhjMFllZVlpaCsr?=
 =?utf-8?B?SWVaWDZlMTZvZVRyMlVFaTE3UEliLy9pMTREMmZOUWk1MHpIV2Qzajgrc3F2?=
 =?utf-8?B?T1FWZmhSaUl3SGdmb0tiZEF6N1l3aXROYVRYT3RRV3RReDNMb2tNbnExOTBY?=
 =?utf-8?B?NFpoYlRCYjgxUDF2WGdMUmx5K3pndlZhS2F0anphMzBQWC9OdTB0UWEyS0tP?=
 =?utf-8?B?UVJEcGZlV0F5Qy9nTjBWQlZlSm80RHVUa0EwVFRaZjJ5MlpqSWlhQmh0dU1j?=
 =?utf-8?B?ekdaZFdWK1pVTVpENUdOMU9tZTc4TlVDektETVZ6MVNJc0doS1ZFR1ZqN1hl?=
 =?utf-8?B?V0swaDNLOWJkUTlZaHV3NlpqcUM5ZUk5M1hMS1NuVVY2WDZBdWVUS1lQQ3R5?=
 =?utf-8?B?dmZ5RUttSlBQRXp0c3I4eG9ZdVMrc3FWeEczS3ZldVdRQ3pKa0hMQlhZNWNi?=
 =?utf-8?B?dERKTmRISVdtTU95aHNIQmtWSkNXaDFXSjdTSWhmemFkazhRYng3eTU3UnVh?=
 =?utf-8?B?bmluS3ZoWXk4VTREejBRTkROYjV0Q0Jmb1dpaENUUTd3UTJ1dXZtQ015NExo?=
 =?utf-8?B?YmlROWZCN0U4NHBib0ZVbnF4WE5DMzA0OVh6dHU5UWl4RkZ0T3dMOHRIWUor?=
 =?utf-8?B?Q0VST1BkMXM3Q0FxdTk2blgvSXYrbEVYU1ZyNDZ0VDBVZmt1aUdNVVFnY1Rs?=
 =?utf-8?B?TmhhMlhPOFZ2N1RBaFdGNkpaU2tScTRJeVVOQkVESkJZWWVBMEh5V1ZaV0or?=
 =?utf-8?B?OFk0U2doRXNuS3kweVp5V0loc0F2RXZ6L3QvcW5Rc1FiRndwZGhyZkJKcUgw?=
 =?utf-8?B?V255MDBYWVBCT0FlRFF0MGdnVlV6WmpjaDFUMXl3YUt0RWpYZ1M1Y29iVkNM?=
 =?utf-8?B?Qk82U09MK1RwSEdTRTllYUlJL25xQ05QNW4wdE15NkNkS2xQc1lhVytTS2Zh?=
 =?utf-8?B?VlI0Uy9iYTUzUm1kMi9lYndTenhoVGYrZTRpUkZzU3FwYUJqTFUzaGxlUkVz?=
 =?utf-8?B?MjdxSEl4RG9yMDhEOVU1eS9RSzJhL3gyQUliY1ZMV2tHM0hHZHlsaWwwT1lT?=
 =?utf-8?B?ZU5TVkJkYjYyRUM4dWhveWVPUENjeHhsWW53MGY3TTRUM3RsOFZHRWVBZ2VM?=
 =?utf-8?B?QzY1S2lkNHh4NTJGSC85cDhXdU1sVkhLdHhyUVI1MG11VXNQdis1K09Kcmh4?=
 =?utf-8?Q?3PSJ05IRbUdJgcEdWf7iVWVd3rg2UK0EPQkRA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6749.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3dpQ2RQUGpZc1pJdHNiRlNybFM5MlE1Q2hjMjU3dkU2cjBqdnlIUU5WRmJX?=
 =?utf-8?B?UkdRMnZqK0xzVHZBYm1Tc3pRMGJwV01SNmxScnBDZTFhbXRRR01YbVBMYnJz?=
 =?utf-8?B?Y0pVaWxRdEJMV3NaZWVFNkNQbnArMDg4ZzhPRmZMSEdIUENNMkFIVHB4RG56?=
 =?utf-8?B?Y1BUb3JCbnlJMmp5cXppNy81NU9BeWNxaG95VHlpZmRKb0FmbXh5SUkvRGVs?=
 =?utf-8?B?NlhrNE03QjhtNHFVdFBPU0RXWUhscS9QL2R5SXNsaUo0RUhWL1JPcWxEQlBQ?=
 =?utf-8?B?MmFaMUVCMnYvekJsdlloQUlDeVpFelJ6NnFwTzAwdGhBaitnck1kSW1QZmkz?=
 =?utf-8?B?VDArcXUwMDRISS9JVlhsRzVqRzBWL1VmcERpMFhYayt1a3BHbVBUMi9DbnVU?=
 =?utf-8?B?QWhBQzN0b0laOS9FMzg1Z2ZuUmFFOWxXYTYxTUhwZXcvcVExOC9EUDQ2WE1z?=
 =?utf-8?B?eWlKMlFPOEhlVVJ1aFpUOGVNUTM1ZjltQThRaVA5MTRNUE9ZbHVOaURvVEVt?=
 =?utf-8?B?OU1iVFJadUpoRnFkc2tpWHMvV0ZpSHdqbjZpall2VjNDcEtVYjQwaUlxRGJC?=
 =?utf-8?B?cUlYYWJrejgzczdqSUVtZFd5VVZ6aWplbmxMMHZvWlJ3SWpLRmx5WlhjT0hm?=
 =?utf-8?B?eGh3dnNFaHdERnZvckxCcTZVZUZ5VWpTN0hKaktXVW1VemtXdlRsbUFqSkNM?=
 =?utf-8?B?bFpyQzhBR1hJMlNOL294MHV4NmYzT0g5dDZ5enVPVVNjb29mSmFueHRMaVgw?=
 =?utf-8?B?bVFuRmxFNU52VVVkOHNlNzV5YUNEd3pqRWtObXlmbXpXOVJ3YU5ITjhuYXk0?=
 =?utf-8?B?ZldKanZ0cTIwMkQzVXI4SG1oN1lVMFZQenhING9WL0c1Wmd0NkNVRkUzRlJC?=
 =?utf-8?B?ZC9PTWdlVXBRNXJXamZuN3F0UG9CSVdpSk5uS1hLNEthQUIxNW1Wb1RxSmFY?=
 =?utf-8?B?dytyMG1hRGJLdWNEaEhLNk1PdE5MR0lMcFMyTUN2aUp3ZWNLSmZZQkdDTjJ1?=
 =?utf-8?B?RitpWlpIaGNHRVRRUHUrdndBWlBBVlEzSFZtVE5ldytkWFJKNENpSlpBNXdu?=
 =?utf-8?B?SW5mSnpqQW5QNS9tRjZjU2RWek1Ea0dyOHBhL01ta1BzR1JzOGRIcnJ3cnY2?=
 =?utf-8?B?Y2l0UDRXN1djVE9UTnJWa3kyL2dXRmNSWVRSVlYzVEJSaUZFYUVvNTlTQmVh?=
 =?utf-8?B?MTM3QnBlS0ZYUlVGUWhhVCtZTVhzYTRoMitDOS9pN3FiYjZtVndab2JoZzhj?=
 =?utf-8?B?UFI3U1UxaTBoemhKUk5NY0tEeVVWQk5pcnNpY3VXZnpDNmV6U1dHYm5GN2JY?=
 =?utf-8?B?RXVudlpaOGJFc2xvV1lyMXRIVlF5VDRjaG44dEJ3eXUrdjBQOXpqc3RVUjJq?=
 =?utf-8?B?UGpXMklRWFhEKzNJYWtyWGtBV0NiUmVtUUxuOTFReDFId0taV1JnQ2JHMk5s?=
 =?utf-8?B?SFgyNjI3bFhjbmZWU0lubzVoR1l4WWlrVnpMNU5aV1NkSms2M3A3T05vZVo5?=
 =?utf-8?B?bHM4SXFGbUV2b0k5TnpTWUYwb2RNbnV6K1F1UjRMZHkxNmZnaGM3UEx6TS9N?=
 =?utf-8?B?M2F0bmlqdG4xcFI1YmF0WWY1N1laNmlhdGVCdDBQWTVSOHVicjY2ZnRObWNm?=
 =?utf-8?B?T0NqTld4ZlFVWmxzUEZyYjVMTjIzRUt3SFE4QjRXUW9Mcmx1UTFweVUrMlFn?=
 =?utf-8?B?SmR1YnFhS3lyOTlBcWNtYnhKc0xDeHVTODQvcjVsNFBQVWlXb3dXU0oyOEZi?=
 =?utf-8?B?NldHTFRyaGdzcDBicUJpV3drL204SEYvS0w0RjBCTDhEN0Vaam1FN2M4Um9h?=
 =?utf-8?B?aFZRRzlpdGsyNU9XNUdnVWplUUhCalVBeVNWZlJyOTk1SGd3L2xPbUVYWm85?=
 =?utf-8?B?aEhEYlJhZm1oTzI0RUZjY2E5blc3VEd3UTVSZWJwaEgwd2kyQ3JGa1ZTUmtI?=
 =?utf-8?B?ZWFhcHNWc3FTSnNucjJRbTVsNTJwdGdrUk40bCtyQmpGL1lzM0oxSzZWcWhy?=
 =?utf-8?B?Q3BhQ2Ryd3V6SlBqMFpTQnVKYmRIOWxMbDBqTEY0b2RyY2NESGY2am8raEhi?=
 =?utf-8?B?SU5jWVVlTTNKelNQaTRaY2gzejY1amo3bnJZNDJLTzFSclAzVGtiejBJNmZy?=
 =?utf-8?B?Q0FYSDVCSnA1d1hUdzVnRDhyVWE1SXlLdDB0eXkwZk41dVF2LzRaN21qb1lh?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6749.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e7158c-b569-4e27-d3df-08dcb2dda1b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 10:26:55.0073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXl0uY5FVBu89axcSNcs69yPn3aMXlKK5rm2RCCDXUE3p+xVCdJ5FJjtAZwOxcAiYGq0iL3MyFXk3tgkYz5YpfZg7oHF+L5ULv2fh1Ltg44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTM2ODE5LyAt
IFJlLXJlcG9ydGVkLg0KDQpDSS54ZUZVTEwgLSBBZGRyZXNzZWQgZmFpbHVyZXMgZnJvbSBDSS54
ZUZVTEwNCkZpLkNJLkJBVCAtIFJlLXJlcG9ydGVkDQoNClRoYW5rcywNClRlamFzcmVlDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWlu
ZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgU2FhcmluZW4s
IEphbmkNClNlbnQ6IEZyaWRheSwgQXVndXN0IDIsIDIwMjQgMToxNSBQTQ0KVG86IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJA
aW50ZWwuY29tPjsgSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6
IFJFOiDinJcgRmkuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbDogRHJvcCB1bnVzZWQg
bG9jYWwgdmFyaWFibGVzDQoNCkhpLiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24g
QmVoYWxmIE9mIA0KPiBQYXRjaHdvcmsNCj4gU2VudDogRnJpZGF5LCAyIEF1Z3VzdCAyMDI0IDIu
NDYNCj4gVG86IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+
IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiDinJcgRmkuQ0ku
QkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbDogRHJvcCB1bnVzZWQgbG9jYWwgDQo+IHZhcmlh
Ymxlcw0KPiANCj4gUGF0Y2ggRGV0YWlscw0KPiBTZXJpZXM6CXRlc3RzL2ludGVsOiBEcm9wIHVu
dXNlZCBsb2NhbCB2YXJpYWJsZXMNCj4gVVJMOglodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzEzNjgxOS8NCj4gU3RhdGU6CWZhaWx1cmUNCj4gRGV0YWlsczoJaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMTUyMC9pbmRleC5odG1s
DQo+IA0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBDSV9EUk1fMTUxNzAgLT4gSUdU
UFdfMTE1MjANCj4gDQo+IA0KPiBTdW1tYXJ5DQo+IA0KPiANCj4gRkFJTFVSRQ0KPiANCj4gU2Vy
aW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTE1MjAgYWJzb2x1dGVseSBu
ZWVkIHRvIGJlIA0KPiB2ZXJpZmllZCBtYW51YWxseS4NCj4gDQo+IElmIHlvdSB0aGluayB0aGUg
cmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcyANCj4g
aW50cm9kdWNlZCBpbiBJR1RQV18xMTUyMCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJ
OTE1LWNpLQ0KPiBpbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0gdG8g
ZG9jdW1lbnQgdGhpcyBuZXcgDQo+IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFs
c2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gRXh0ZXJuYWwgVVJMOiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tDQo+IHRpcC9JR1RQV18xMTUyMC9pbmRleC5odG1sDQo+IA0K
PiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoNDIgLT4gNDApDQo+IA0KPiANCj4gQWRkaXRpb25h
bCAoMSk6IGZpLWJzdy1uMzA1MA0KPiBNaXNzaW5nICgzKTogYmF0LWtibC0yIGZpLXNuYi0yNTIw
bSBmaS1rYmwtODgwOWcNCj4gDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IA0KPiANCj4g
SGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNl
ZCBpbg0KPiBJR1RQV18xMTUyMDoNCj4gDQo+IA0KPiBJR1QgY2hhbmdlcw0KPiANCj4gDQo+IFBv
c3NpYmxlIHJlZ3Jlc3Npb25zDQo+IA0KPiANCj4gKglpZ3RAcnVubmVyQGFib3J0ZWQ6DQo+IA0K
PiAJKglmaS1ic3ctbjMwNTA6IE5PVFJVTiAtPiBGQUlMIDxodHRwczovL2ludGVsLWdmeC0NCj4g
Y2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMTUyMC9maS1ic3ctDQo+IG4zMDUwL2lndEBy
dW5uZXJAYWJvcnRlZC5odG1sPg0KVGhpcyB3YXMgaGl0IGJ5IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTE3ODEgdGhhdCBpcyBub3cgZml4
ZWQuDQpQbGVhc2UgcmUtcmVwb3J0IA0KDQo+IA0KPiANCj4gS25vd24gaXNzdWVzDQo+IA0KPiAN
Cj4gSGVyZSBhcmUgdGhlIGNoYW5nZXMgZm91bmQgaW4gSUdUUFdfMTE1MjAgdGhhdCBjb21lIGZy
b20ga25vd24gaXNzdWVzOg0KPiANCj4gDQo+IElHVCBjaGFuZ2VzDQo+IA0KPiANCj4gSXNzdWVz
IGhpdA0KPiANCj4gDQo+ICoJaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBoYW5nY2hlY2s6DQo+IA0K
PiAJKgliYXQtYXJscy0xOiBQQVNTIDxodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tDQo+IHRpcC9DSV9EUk1fMTUxNzAvYmF0LWFybHMtMS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZl
QGhhbmdjaGVjay5odG1sPiAgLT4gDQo+IERNRVNHLVdBUk4gPGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTE1MjAvYmF0LQ0KPiBhcmxzLTEvaWd0QGk5MTVf
c2VsZnRlc3RAbGl2ZUBoYW5nY2hlY2suaHRtbD4gIChpOTE1IzExMzQ5IA0KPiA8aHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMTM0OT4gIC8N
Cj4gaTkxNSMxMTM3OCANCj4gPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkx
NS9rZXJuZWwvLS9pc3N1ZXMvMTEzNzg+DQo+ICkNCj4gDQo+ICoJaWd0QGttc19wc3JAcHNyLWN1
cnNvci1wbGFuZS1tb3ZlQGVkcC0xOg0KPiANCj4gCSoJYmF0LWpzbC0xOiBQQVNTIDxodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tDQo+IHRpcC9DSV9EUk1fMTUxNzAvYmF0LWpz
bC0xL2lndEBrbXNfcHNyQHBzci1jdXJzb3ItcGxhbmUtbW92ZUBlZHAtDQo+IDEuaHRtbD4gIC0+
IFNLSVAgDQo+IDxodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBX
XzExNTIwL2JhdC0NCj4ganNsLTEvaWd0QGttc19wc3JAcHNyLWN1cnNvci1wbGFuZS1tb3ZlQGVk
cC0xLmh0bWw+ICAoaTkxNSM5Njg4IA0KPiA8aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy85Njg4PiApICszIA0KPiBvdGhlciB0ZXN0cyBza2lw
DQo+IA0KPiANCj4gUG9zc2libGUgZml4ZXMNCj4gDQo+IA0KPiAqCWlndEBnZW1fbG1lbV9zd2Fw
cGluZ0BiYXNpY0BsbWVtMDoNCj4gDQo+IAkqCWJhdC1kZzItOTogRkFJTCA8aHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLQ0KPiB0aXAvQ0lfRFJNXzE1MTcwL2JhdC1kZzItDQo+
IDkvaWd0QGdlbV9sbWVtX3N3YXBwaW5nQGJhc2ljQGxtZW0wLmh0bWw+ICAoaTkxNSMxMDM3OCAN
Cj4gPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1
ZXMvMTAzNzg+ICkgLT4gDQo+IFBBU1MNCj4gPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS10aXAvSUdUUFdfMTE1MjAvYmF0LWRnMi0NCj4gOS9pZ3RAZ2VtX2xtZW1fc3dhcHBp
bmdAYmFzaWNAbG1lbTAuaHRtbD4NCj4gDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+IA0KPiANCj4g
KglDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiAqCUlHVDogSUdUXzc5NTEgLT4gSUdUUFdfMTE1
MjANCj4gDQo+IENJLTIwMTkwNTI5OiAyMDE5MDUyOQ0KPiBDSV9EUk1fMTUxNzA6IGQxZWMyMGUx
NDlmYzBiZDRkMTVjYmYzNDU3M2I4NGQ0ZmE0N2UzYTUgQCANCj4gZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+IElHVFBXXzExNTIwOiAxMTUyMA0KPiBJR1RfNzk1
MTogNzk1MQ0KDQo=

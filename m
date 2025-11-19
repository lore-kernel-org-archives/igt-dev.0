Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231F7CF3195
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 10:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AE610E5D2;
	Wed, 19 Nov 2025 10:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ilwx5PaT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D23210E5D2
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763549984; x=1795085984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=One6u712szAicAnK+TxIwzu0M6ybW1P/+JqCtak9d7U=;
 b=Ilwx5PaTXpk4JARnfZMNKYf1RXnxaVd/oUNrEX4B6cfQb8zB4PPfRrrm
 Woj+OjvxvGjJImqr/V/KGuEMPF6bgvxo89dKa1INetNM/4TrprtgPxNF1
 8sHe5BD87Mido7M4fl6YHdWgxQ6s0tsJBjTWSpzBMkwXky9SCBE281tCh
 rgZmRZ1yX2Er9gGf5wKD4WsufGDFftCM4eJDkeYvUNWFKGqCPwWmPyBGJ
 SOX/QpLXQrPfnWJ7rfWASjMuJ1pjVWQZjfuEASgSsRbZ2i/8vdauYiRrq
 W4lpNkTnMjosGu0RWLTXYJWccvvuCESJtsIrUU3Gdq28PSz3aysGVQlkj A==;
X-CSE-ConnectionGUID: PNLIRk+YQwmZDLWutsvIvw==
X-CSE-MsgGUID: K+t+FtmqRuur72bnX1JHfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76941817"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="76941817"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 02:59:44 -0800
X-CSE-ConnectionGUID: j2KjC+LVRa+QPUAxKodFpg==
X-CSE-MsgGUID: zOc/aRUiTuqcQ+Saas5VPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="214408233"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 02:59:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 02:59:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 02:59:43 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 02:59:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pivRpJQfaZGe4uT/3/2r5ttSS30dF6IMCyb7+R10Oks1u8mESimZEGqq0+mszIcq/+MczcyrFXsc8+yxCCvX60jutyf/KQpl1vOYurapyuVEGLn/+OwxSRODUoLiBa30KXyN+sKFeQzre+ZQBQvjt3mjoT/+KL4E7/Y5eJgF+lpfLDrPLacSnnSxotGoO9s7079JhCyDWvPRbjhpjsrpG1E8tPf7TaYtSUxM9QxDpMJyYumypR041f5257fzOCIIOCqUxsQyT78/jZJqRgOG8Bx+3dJ9ti/cXyS0Y05zH2xpL3QeSbCAtMsNiTL1bzjH4Lpl+rP3kMbR1rxPfuIlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=One6u712szAicAnK+TxIwzu0M6ybW1P/+JqCtak9d7U=;
 b=gmtDXaVFp8t5E7uz4e/Q1Cw3icHSA92PsRmkjCK1jZW6ycmullx/bNbkd54C1B+E/xqCeMEaTarpXpa00C+KY+BQ+bzY+4bCWzdMT7qSba1DGj/osNEKUxQmKbzSkLMrEkUQu9Wx83PIEq4KSXieMc65cVJnXjsQh/XBqTrZjmrL0A17IV/bTyrpHtI/5X+te/vLKmg6fO+6xK4cdM8UJ+EQwESpoZPDBIJ9hmhdaEaNe2gNjYUdTwHUPezkpMT/3VH5szEKcjxDBwKJsYLs0tn/pwbj2zsowx9xZAkVf6MfTzJw8kJrP3fR8JCxR9VyGtJpDpoI3nF8OSgqnkc7tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 10:59:36 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 10:59:36 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Mun, Gwan-gyeong"
 <gwan-gyeong.mun@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: RE: [PATCH v3 6/8] tests/intel/xe_eudebug_online: use xe_query
 helpers for query GT topology
Thread-Topic: [PATCH v3 6/8] tests/intel/xe_eudebug_online: use xe_query
 helpers for query GT topology
Thread-Index: AQHcV6/cfkXF4jbw8ky391AKGnCATbT51s3g
Date: Wed, 19 Nov 2025 10:59:36 +0000
Message-ID: <CH3PR11MB8434F5C48C7FC692BF7D1C108DD7A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
 <20251117-xe_query_helpers-v3-6-25d984ae58cb@intel.com>
In-Reply-To: <20251117-xe_query_helpers-v3-6-25d984ae58cb@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA2PR11MB5019:EE_
x-ms-office365-filtering-correlation-id: aa04f6ae-f380-41cd-fa24-08de275aba6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aGt5djZqYURtUzluMjhoUGJreC9yNGl2MjhVZ2FoK0N2cTJjOVA4aHdRQmtK?=
 =?utf-8?B?WW0xODQ0ZEVORDlORUVmeC9MbE9TZ1IyMlgyWVgvdlZVQlJrRUtzUEk4OUNG?=
 =?utf-8?B?NEd1YnNDSGdvZktVc254TkJPTUNKUWpGS0s4cis2SjBQZDZKQm9LV0VzTVFX?=
 =?utf-8?B?dmhwcnluV2o0bzkzWmJLaDVXb3FFSHRTQWRyNTNIbE4xVVBWQ2hNcFdDenhy?=
 =?utf-8?B?RlJoN3NoQlNoVlZzcXo3ZkhzeVpVUjA2WlNKSjhYOGJuUFZlRjY0K2JnYXNT?=
 =?utf-8?B?VExZTWN5dmgzT3Zsd0dLMzVsa0xEMjI0Q0l5ckJZT1pBYjNiR0ZyM0U4WUhJ?=
 =?utf-8?B?QkNla1JMZGM0R2EyRW1ueVEwMUxnWFFnOWZ5K0VtSFRXa1BvQnZLUlZXV0x4?=
 =?utf-8?B?VmxLdW9pSGg1V2JheXhqTnlEK1NTbnY2OEtRN0xSQ2ZWdlFJUFlEekxtWWZu?=
 =?utf-8?B?MEpmYzVnbDRNU21GaDltSTJkZFIyUi8xbFdyZ0JtOHZPcm9FM2FiNzgrZ1R6?=
 =?utf-8?B?RlRsZFpBYW9VMHV0VjVwdmYrME1GeVhrQk9zQUgwMG96NzVCWlNqSzRaTjRk?=
 =?utf-8?B?NkYwVXZmM2pXSXRKbE1LY2ZUVCsrcnozNmxkUjd1bXNnWExYVzdZQ3pDOFd6?=
 =?utf-8?B?ZnhNS3A1RUw5UlE5bzRlV1podlhOYjg0Y0w4UWZZaVZJdTJqcEJlanJxNW5Y?=
 =?utf-8?B?YjJndUJmS09KTHYrbUIyZDFQZmZ0Z1B5Z09zY3dMR1NYK2x1TG5YWlkyVXJZ?=
 =?utf-8?B?N2RESlFSb3NIRm5xZ0Y0YTA0SDM5SGpMcUM2bEJZRmpGRGpNb3R3L2t2aDFn?=
 =?utf-8?B?N3BDWkNkNUd1V1RValFHVnpEcTl0WDhMaWV4Sm40NStNek1wRFU5UXdncVBn?=
 =?utf-8?B?MDg1SWpNckxhVFhIU0xDaGlSdzhMeUpuM0lQZnhVZTVyYVVIWnoxWlBhRUFt?=
 =?utf-8?B?d2JDM0tFYWFIcnZ2ZlZYcWJya1didjhEOTJPMk1LT3luNktyZXZYenExck5F?=
 =?utf-8?B?Vk9yOVA4b0xvY203QlYrUmNGL0FDd3lRUWVRVncycWN1QThtWkJsUkl5OFdr?=
 =?utf-8?B?bkUwdE5lKzl5WUN0V0NBNnV1MW9veUYrMFZaallIdldWcTVXZWpKTDdaeXJ3?=
 =?utf-8?B?ZzdQZDd1NWxaeUZpTDE2c0dCbDBSVGZHYnJtbElpSnZEL1lDRUJFeUJRcjFP?=
 =?utf-8?B?cGhnQ09sNjJ1dVZaT1RqYXdjR083ZExic2UwTkVSU2VrVExCNmhUb1ZhSGhM?=
 =?utf-8?B?bkxrZ2JyV08rTVdWVk1kdURnc2tJTkhiUGN3VWJiUDQ2SWtQYkhpcS9oWmNX?=
 =?utf-8?B?Q1hUOVFKWkNYVnN0V3cyZFlwN1VRTERWWlpKU1ZuSjAyTGNGMDNpNkVleDdE?=
 =?utf-8?B?d3RsQXUxdFh4c0t1MUlPVXBDRTEzZGlYODc0aFMxR1FSTnFIVjh1Y0s1WkNY?=
 =?utf-8?B?bGM1aVJON3VFN3J4VmMvM3pJd0tmWEgzKzN3VHM3elhyM3U1d3Zab1ovUjFy?=
 =?utf-8?B?eHZYL0J2YkxJeVRmZnpRS2NTaFVScUh3MkhMdFlRYkpxVmdRR0VhSHNWS0RK?=
 =?utf-8?B?MldHRXVuTzdLcE16OC8zMVFEV2tWNUw4bnMxVUIvMDVyQWptMXRJb25hM2Iz?=
 =?utf-8?B?TVI5MVFSVVRMWlBMVGhCeHQxNDIwRktIZWV3NUhSb2EvWVlZejMyZUxQLzlP?=
 =?utf-8?B?Rmc3QXozU1lySDNUMHhIbUlPRFZPSHFYUmx3aTFERDhsdXRaM3pOVTFWczZI?=
 =?utf-8?B?Ykd3MlQyTkt5cVpydFlGdXZLQTAwK0xzZ1lpQW9Sb0Qvc045WEZGRkZ0UmFX?=
 =?utf-8?B?YTE2ZkMzRWx0b2FCZ2RxZG1aRTkxVDQ3NzZEL0RmTDRwRzlsRVpvNHl1OC81?=
 =?utf-8?B?WTI4dHNBdlJDZWRTdjhXZzV6MW1xQjAzamRkTUpCd0tiUzZOYkJ2eUwyTHBE?=
 =?utf-8?B?NXZKNlhKbmE3UTlZeHlzUHdIVVd6UXpFQ3JOcVI5dHMvNUYzc1ZYTTJKdTA5?=
 =?utf-8?B?dWRadzBRSk90NDVZQkJiWkxFMlZKRWNubHJZV1k1eFRoN1FKbDU5Q0dKQ0Mv?=
 =?utf-8?Q?RonpPt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzRwa1BQdk43YUFRODBSY09jZnBpbFJCWXFRMlVOU01yNUZmNS9ZTkFRYlgx?=
 =?utf-8?B?QmZUYzFQWWRXZ0w0N3pwV2hYVWJoWjlWSjhsSlpDRnh1ODM5MzdkdW5FWko2?=
 =?utf-8?B?UUZSR3BCZTJSVHBoYXNSUTF2NXUxQzZnSGRsWXk1STZERlp3WmVGUmorUU1F?=
 =?utf-8?B?cTNHYmZqaVFTWVlod29MLzZMMGhDNE9oZ0JqKzRlQkZMSVU0Ym1ZeXZZamky?=
 =?utf-8?B?Y1ZxSnQ4UWYwN1V6SWV6RjJqVXRHRTRIU1FxbTMwc080dVdEaXpSMEIxU2ZW?=
 =?utf-8?B?aHF2SVQwS3p6ZVpLcmhuOFZ1dGRWLzVOamxJd3FZL1ZSSmgwQzZUK0N4VXVZ?=
 =?utf-8?B?ekk0a2pCZlJGTCsyS1YrM2pnL2FsYVhXUXlDNFg1TkhOTU5zN0tNdmMxVk80?=
 =?utf-8?B?cTl2SkdqakppN1NTY1luZ3pYZXE4UkF1VGJ6UjZka21zYUEybE1lMjFrS3Qw?=
 =?utf-8?B?QUVYUUVpMnYzRXpaOWpjVUlVN1NEWlJYb1ROOHo1SXN5TEpDNytQWkpXdzIy?=
 =?utf-8?B?MmMzcGsyVm1XRGhLWHpYNzV1b3VHdys3aE5QQ3ZoeFJ6Qm5Gelg0c0p5RTY5?=
 =?utf-8?B?Z0VxaTlvVlp2UG5icC9RWVduYmNkQ3drajN2L3JGM0dLVm42TEMrcUt1ZzhN?=
 =?utf-8?B?cUxTQjZsbGNzQ3ZqSFlYdjBvaUpDUHRhN3AzYUhrYlhXcVBHeUVkaHJMTUtI?=
 =?utf-8?B?djVqdUNqVWtRamNmMU5WS09KTjZNM2prWWFUSEZCampORDBwUTVsNjlEZ2t4?=
 =?utf-8?B?bXdJd0tCSWRDTlJCYUdPRWU3ZENPUWpsWHB3TEFSaXd4V3kvcVVpenQrOXFW?=
 =?utf-8?B?cWVkU2Z5QkZObzNsSUhKK3NYcy95VndOdnBmTEhTMENGQ1FGMTlJdVJFTUxC?=
 =?utf-8?B?N3dVWVdRVVd1Q0hYcEo1ajJmYW9odG5hTEhRNjZDTlJWYnZVZ21mNWdLMGgz?=
 =?utf-8?B?NzA4RTlLNmRuZmhJOFBLNTllYlF6dEU5TzZJN0d6SHNTUjllTFBoYk9HRWxH?=
 =?utf-8?B?MWIzV2tlNDZNVEZ5alNzdWVEL3JodU13NUZ0Ym1INTg1bE94em1yTExIVjhZ?=
 =?utf-8?B?dzFrVHNmRjFEaFc5UUpVQ09oUkUreXJHdmxLN1B5Vzl5dE91aldUYlYzZndH?=
 =?utf-8?B?K3h1SGFTTEpETlRnbURGMzZnSGpQc0dvTVpKc0k2YWdMT2lLQnVnK21yL0Ex?=
 =?utf-8?B?Nm5Wc24zdWRNQSs3YjNkclAzMEt2SXNrS1R4cVQ5eGZkaFgrNDFYdFVzOHVL?=
 =?utf-8?B?V2JVZjMraW91dVZnNTFFMDRXZFhkYVVGdE1zUjB1em55T09EdkQ4WUJ0Qlhk?=
 =?utf-8?B?U015QVoyYVJGRHhHWS83UHliUGtDOG1KTk04OExUejNBazBRL0FlbUpLVkxj?=
 =?utf-8?B?ZjBSZndjenp6UU1MMGg1bHhKSkQySFp6Ym1zVUJNSm9zaXhMV3MzNnh1SkhJ?=
 =?utf-8?B?Zk5qNUFYc2J2eGhlNW15dWZXT3BtVEQ0a3lrdDlJZXlwTlltRVNtNWRGNEFR?=
 =?utf-8?B?bVNwbTMya2pha213VjJUVnFXNnVTbE52OGcxM1Jyc0NCdkF5UnNuNmtFMGth?=
 =?utf-8?B?R3N1TE9ZN3h4MEU5MnNzVHpCTTJ4WG9hZzZ5cmNsUWJJUE53VVNlbW1NWXlw?=
 =?utf-8?B?TWdta3VOK3ZvaHBLRVJpWXdkK1VRaktWWFBWcDlyL2hVSDdjMnJPeG1PQkNa?=
 =?utf-8?B?RkFQQVhSSUZaclBmRFFaR2hRYXA5V3pCTVlYaVJXTnEzTlc1dDNVS2FRa3Az?=
 =?utf-8?B?MDdSRlAwMVVzakc5ckwyZW1XcDRMZGZOUUc1Q0ZsNnNYdk1SVHM5Q2hCa3hQ?=
 =?utf-8?B?dVZvMzlHTzRRMzBrTEV2N3Zpd1ZzMlRubFhlS2lhMVJOQ2lVUzBtNU1ZaWUv?=
 =?utf-8?B?SnQ0bUxnUFlqSG1nYTYrMmNyeFpuOXVhR1d5WFFtc1RyMUN2empVbGI2MkRm?=
 =?utf-8?B?VjE2eUlXOU9EMEtQcVFicngvS1VMeEViQ3J4cWF1VjRJYVBLTDVMWmExOXBk?=
 =?utf-8?B?dnlLMDNubVh6d29JajdsSEpSN2pJejBnTjNLOXh0TjNENGdaSkx5RkNLWFZr?=
 =?utf-8?B?dEVDUFpoR3BpR2oxcCttUlNaSUZ2dlhYVndEaUZUbUE5aTdFZUExTkFJVjJL?=
 =?utf-8?B?NERkRDIrUGlGaGFQZURVR3dRcGFybWV4dVNjcTFiUTBuS2tvYzBkK1FPajhP?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa04f6ae-f380-41cd-fa24-08de275aba6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 10:59:36.0905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GpySSqwR7tTFpqGkBLoquHSPjO0mdcX/Lbjoc6aN/uLcEgeYIM2x46ROHfcfxHczKJOwlpqqEH1BQbqunAJkhMXirkXpL7zyVxE5dualEDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFqZGEsIEFuZHJ6ZWog
PGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiBTZW50OiAxNyBOb3ZlbWJlciAyMDI1IDA0OjE4
IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS2FtaWwgS29u
aWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPjsgRGFuZGFtdWRpLCBQcml5
YW5rYQ0KPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IE11biwgR3dhbi1neWVvbmcg
PGd3YW4tDQo+IGd5ZW9uZy5tdW5AaW50ZWwuY29tPjsgUGlvcmtvd3NraSwgUGlvdHIgPHBpb3Ry
LnBpb3Jrb3dza2lAaW50ZWwuY29tPjsNCj4gTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3Rv
cGgubWFuc3pld3NraUBpbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplag0KPiA8YW5kcnplai5oYWpk
YUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyA2LzhdIHRlc3RzL2ludGVsL3hlX2V1
ZGVidWdfb25saW5lOiB1c2UgeGVfcXVlcnkgaGVscGVycw0KPiBmb3IgcXVlcnkgR1QgdG9wb2xv
Z3kNCj4gDQo+IFVzaW5nIHhlX3F1ZXJ5X2RldmljZSBhbmQgeGVfZm9yX2VhY2hfdG9wb2xvZ3lf
bWFzayBzaW1wbGlmaWVzIHRoZSBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBI
YWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVf
ZXVkZWJ1Z19vbmxpbmUuYyB8IDMwICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiBiL3Rlc3RzL2lu
dGVsL3hlX2V1ZGVidWdfb25saW5lLmMgaW5kZXgNCj4gZWY3MDBjMjU5MTI5MWY5YTIyODQ5YzI5
OTVjODNjYzVlYzBhYzZkOS4uZDdkYjhlMmExM2RmMDRlOTZkODY3ZTQ4DQo+IGM1MTBkZWNhYmZk
MWVhYWMgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4g
KysrIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiBAQCAtMTE4NCwzNiArMTE4
NCwxNCBAQCBzdGF0aWMgaW50IHF1ZXJ5X2F0dGVudGlvbl9iaXRtYXNrX3NpemUoaW50IGZkLCBp
bnQNCj4gZ3QpICB7DQo+ICAJdWludDMyX3QgdGhyZWFkc19wZXJfZXUgPSB4ZV9od2NvbmZpZ19n
ZXRfdTMyKGZkLA0KPiBJTlRFTF9IV0NPTkZJR19OVU1fVEhSRUFEU19QRVJfRVUsIDgpOw0KPiAg
CXN0cnVjdCBkcm1feGVfcXVlcnlfdG9wb2xvZ3lfbWFzayAqY19kc3MgPSBOVUxMLCAqZ19kc3Mg
PSBOVUxMLA0KPiAqZXVfcGVyX2RzcyA9IE5VTEw7DQo+IC0Jc3RydWN0IGRybV94ZV9xdWVyeV90
b3BvbG9neV9tYXNrICp0b3BvbG9neTsNCj4gLQlzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSBx
dWVyeSA9IHsNCj4gLQkJLmV4dGVuc2lvbnMgPSAwLA0KPiAtCQkucXVlcnkgPSBEUk1fWEVfREVW
SUNFX1FVRVJZX0dUX1RPUE9MT0dZLA0KPiAtCQkuc2l6ZSA9IDAsDQo+IC0JCS5kYXRhID0gMCwN
Cj4gLQl9Ow0KPiArCXN0cnVjdCBkcm1feGVfcXVlcnlfdG9wb2xvZ3lfbWFzayAqdG9wb2xvZ3ks
ICp0b3BvOw0KPiAgCXVpbnQ4X3QgZHNzX21hc2ssIGxhc3RfZHNzOw0KPiAtCWludCBwb3MgPSAw
Ow0KPiArCXVpbnQzMl90IHNpemU7DQo+ICAJaW50IGksIGxhc3RfZHNzX2lkeDsNCj4gDQo+IC0J
aWd0X2Fzc2VydF9lcShpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9ERVZJQ0VfUVVFUlksICZx
dWVyeSksDQo+IDApOw0KPiAtCWlndF9hc3NlcnRfbmVxKHF1ZXJ5LnNpemUsIDApOw0KPiAtDQo+
IC0JdG9wb2xvZ3kgPSBtYWxsb2MocXVlcnkuc2l6ZSk7DQo+IC0JaWd0X2Fzc2VydCh0b3BvbG9n
eSk7DQo+IC0NCj4gLQlxdWVyeS5kYXRhID0gdG9fdXNlcl9wb2ludGVyKHRvcG9sb2d5KTsNCj4g
LQlpZ3RfYXNzZXJ0X2VxKGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0RFVklDRV9RVUVSWSwg
JnF1ZXJ5KSwNCj4gMCk7DQo+IC0NCj4gLQl3aGlsZSAocXVlcnkuc2l6ZSA+PSBzaXplb2Yoc3Ry
dWN0IGRybV94ZV9xdWVyeV90b3BvbG9neV9tYXNrKSkgew0KPiAtCQlzdHJ1Y3QgZHJtX3hlX3F1
ZXJ5X3RvcG9sb2d5X21hc2sgKnRvcG87DQo+IC0JCWludCBzejsNCj4gLQ0KPiAtCQl0b3BvID0g
KHN0cnVjdCBkcm1feGVfcXVlcnlfdG9wb2xvZ3lfbWFzayAqKSgodW5zaWduZWQNCj4gY2hhciAq
KXRvcG9sb2d5ICsgcG9zKTsNCj4gLQkJc3ogPSBzaXplb2Yoc3RydWN0IGRybV94ZV9xdWVyeV90
b3BvbG9neV9tYXNrKSArIHRvcG8tDQo+ID5udW1fYnl0ZXM7DQo+IC0NCj4gLQkJcXVlcnkuc2l6
ZSAtPSBzejsNCj4gLQkJcG9zICs9IHN6Ow0KPiArCXRvcG9sb2d5ID0geGVfcXVlcnlfZGV2aWNl
KGZkLA0KPiBEUk1fWEVfREVWSUNFX1FVRVJZX0dUX1RPUE9MT0dZLCAmc2l6ZSwNCj4gK2ZhbHNl
KTsNCkkgdGhpbmsgdGhpcyBib29sZWFuIHZhcmlhYmxlIG5lZWQgdG8gYmUgbW9kaWZpZWQgYXMg
S2FtaWwgc3VnZ2VzdGVkIGFzIHRoaXMgc2VlbXMgbGl0dGxlIGNvbmZ1c2luZywgYXBhcnQgZnJv
bSB0aGlzIHJlc3Qgb2YgdGhlIGNvZGUgc2VlbXMgZmluZS4NClBhdGNoIDYsNyBhbmQgOCBkb2Vz
IHNpbWlsYXIga2luZCBvZiBvcHRpbWlzYXRpb24sIHRoZXkgY2FuIGJlIGNsdWJiZWQgdG9nZXRo
ZXIgaW50byBvbmUgcGF0Y2guDQo+IA0KPiArCXhlX2Zvcl9lYWNoX3RvcG9sb2d5X21hc2sodG9w
b2xvZ3ksIHNpemUsIHRvcG8pIHsNCj4gIAkJaWYgKHRvcG8tPmd0X2lkICE9IGd0KQ0KPiAgCQkJ
Y29udGludWU7DQo+IA0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==

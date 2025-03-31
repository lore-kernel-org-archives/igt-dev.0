Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E57C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 10:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5B610E3C1;
	Mon, 31 Mar 2025 10:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pj73tsaT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783F910E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743415889; x=1774951889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=K0L+hYWvQlOz9/C4NvoeXFBAWZfBQdvlF0sF9FXaOa8=;
 b=Pj73tsaT+A8tR/JGXVhDPoUz6yNm+9U0dLujRjyqmoxQhLpOriO3aH7f
 QoNFJFKiRnnQu5dWCUNVC8MQB1LsRM9Y7OyHa4ewdrWkjFJkZYh/N0H+b
 X70hUqt4SWo63k0yNP8vtQZ2EFIwyWJZXvf6NfOJdmy8EN6yjUEWKvaVH
 2euVjIGbSlxSBsTraOvuKWI0maz1VIGGHvsqyZ3mz8nkjCj7jeAQS8MEN
 lvpJhZ9a1aSf7WmxqA8cWmnoz10lHDolx8tSaZ7N81KbnPfjE+egKGvYV
 6Sa0Zw3V9P8bVKDn7a+i5yML7D8n0EbZV3UAVh4cmmDYGHhugHw+Wrn6a Q==;
X-CSE-ConnectionGUID: VjnBehf8Q9S4B3qANEdFdw==
X-CSE-MsgGUID: m+K1BdUISUi7ju4aEEVOzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="56070354"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="56070354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:11:21 -0700
X-CSE-ConnectionGUID: /i1/pxQiRZ6WZROVtZGggg==
X-CSE-MsgGUID: 0MRD60QxTr2gVnmkJevScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130890065"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 03:11:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 03:11:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 03:11:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 03:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6KOmO5TOs00XdrgWO1CNuFi/Ypt5ask+zeUfdKytZh5gToFn8hyJigCnxv/PFKWXCKGVjpZBsuu/HCwan0hd0Nav5z8z7YfWU53n0h04URiiQguHRUceLCS8IzFayNTZF1UOsOu6SSP150Y5isAZqjFTPMMjbI80rLmv9KV4KPY5LSezc/woFjJIfB3p3HdmfgTRh9y1alnUDu9+1s+94KPxgejK9qwo2xoh1iNJzPk1eiP1QzW+SlrMtVFc60JJLKJLr7QO14uelk4ikv4+r/HLxyi0DlmYHae3E8xyTepKcmyWhJaWUVx81x+7VWULd4psJXSFyAT+jnYPIqSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0L+hYWvQlOz9/C4NvoeXFBAWZfBQdvlF0sF9FXaOa8=;
 b=uFo1cCvvSTMfPFvank+YTTOLXN7N5+OcHi7fO39/GpRqsvBZfB09tMNDbTZz99jd057ybspFLJdRmEyiVITYo38pAuJnFgu8NMgMv2OP/qOS4UUZzkwLtjuk0euX+O4v9NiIbGelgEfJNfZRlwl0LlH/JinUCPzVZnDpGSErUs18HQQhatM+Ss3Xo5ZKhDatfM2fc+pHycG8UMPWrdQZxmsLosOEFToP6yJOmx9OVQrJ8EdvLYq7K5/dpBpR2Hyhs6ejz5Lg0FVNhQrMQs3dis37IjBzKNq3l4RgWRffrf/xYxKIs0ZLN+KLkEB9RxgPd5OOZg0wzApIIocxuiqxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.53; Mon, 31 Mar
 2025 10:11:18 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%7]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 10:11:18 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "Saarinen, Jani" <jani.saarinen@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v3 0/2] lib/i915/fbc: update fbc support based on
 psr mode
Thread-Topic: [PATCH i-g-t v3 0/2] lib/i915/fbc: update fbc support based on
 psr mode
Thread-Index: AQHbnu7WeB0VChiCck2efW0hl7u2kLONDJ2A
Date: Mon, 31 Mar 2025 10:11:18 +0000
Message-ID: <ebb0854d3af26347584a5ecd113ef705fc30edb6.camel@intel.com>
References: <20250327080358.559968-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250327080358.559968-1-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH8PR11MB6951:EE_
x-ms-office365-filtering-correlation-id: 92b9b4cd-1186-4da5-a031-08dd703c60ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N1FmRlBFWmlyc0YxTXRHTm1adVRBVTNiQlNKemltM3hiRVlzdm1aM3hUR3V1?=
 =?utf-8?B?d3pnUjRkU2NmUzBQNkljY1NHRmVBbExFNVpVWGxCc05EUDM2dHFjeGhoUWo0?=
 =?utf-8?B?RzM1OE9EWUVFTCtXOE5LZFlEL1crTHZ3bUJrMzF3d2wzNkI1NGZtaEpRY3N4?=
 =?utf-8?B?d0x0TTFodDc1YjR4aUYzSXRTSlFRY281clZzL0t6UWE0VS9uMEJjRHhiT2lJ?=
 =?utf-8?B?Um1HRW5EUVBMbWdscVN1blJDeENPRWZPMkQxSWZ2czI5ZU8wb1ljK1c1TlZh?=
 =?utf-8?B?N0FuOUtYQThha1pNNzF2Rlc2eDNWb2tzdHdaajBZQWliaE13SDJyWkxuTUEz?=
 =?utf-8?B?eWxBRnZ6ZWNtQ2FjSGV4TzEwUFJPZERKRHZvS3EzSGxWM3RYT2tCbEc3M2pl?=
 =?utf-8?B?UE9pS3lqTmFsN1drUUl4UVk1MWNRcE1Qb015ZDVsbFlGcmtLaDRBTWs4UjNN?=
 =?utf-8?B?c2FwSmk4UjFncFdUcW5lNXJtcGplaUhFeXpuVzY3YzhCdXpEV3FKUThUSTZh?=
 =?utf-8?B?bjBCK3ZrWHE0RnNWaWxnT2lSRElwVzliZHZNODZRY3V1UWQ0alBjTDhhOVJL?=
 =?utf-8?B?WDRmL3ovWTFWRzZwLy9meTNMc1FPb3lZUXo4SisySCsvQlVGRk5yTEJiN0xz?=
 =?utf-8?B?R25UTTZXY3gwb2Y5a2VOQlY2STYvQUhSWUVQeXhYbGdpWVZxR1E2ZUZzeDBD?=
 =?utf-8?B?em1MNkxBdnhWMTFXZzB1V3JnUmdDVDlERit1MlNsZ1dqOFFEcGlwT0lIelhi?=
 =?utf-8?B?b2svWmhKZERpME8rV0c0OGZOMVJ3MFhlVjYvOWNva0dJUnFJWWF0MDQrVy95?=
 =?utf-8?B?NU54K2JFaStqTXIwMkt2OHpMQVI2eWtTd1QrQ0FJZk5LaGNBKzJDS1Zzc0l3?=
 =?utf-8?B?cVV6SVh2SHNvQnh3dVJNNkkxU1ZtNUZxTExiQW51UDdKbFNrZXdhVUpmU21D?=
 =?utf-8?B?cmZDUHFIWGM5UXI2aTFuK2ZWd0VHc0ErdmxIQlU5S281aE14T3JWWm1oNlBD?=
 =?utf-8?B?Y05rcnpBaGQvYy9WUlJqdkFQc2MxWDZLZ0VMNXk4QkFkMDVuSzF6M0JtUlEz?=
 =?utf-8?B?VVN3MldQU2NWRGtlV25kbmQ0UVZyVVc4VTBIeTZyRDBpSzRaY3FKRUt4cEUy?=
 =?utf-8?B?NGtHeFI2Q1lCOXBQUTRJQnRzMWhDY3JJei9vdks2TFNMT0ZERWVuTTg3cmxj?=
 =?utf-8?B?anNyM1pZNkljMUcrUThwVHJkTVVPL3Y3OUk5bS85VjZnc29qOXU0SHpSRHdu?=
 =?utf-8?B?K2dxNzltd0lmQTROSUwvQXJLQzNmSlFXbmt1WGQyUS9MUVVsQW5hNG9EcS9j?=
 =?utf-8?B?K0tOT1IxRVhhZG5nZTJOK1NTY1R5V1BFWUtTSVcxWTIwdWkrMEtOa2g2SEF1?=
 =?utf-8?B?dHBvY0J0bXVlQjgzcllobzlCclNsbFQyTlIwdUp2K1c1UzRvSFJQV2hwZjN4?=
 =?utf-8?B?ZmpQTzltODQyWWRuL0JHTmxtWnFTRjgzeUVsb3BNK1FEM2hBNWdsTVR3MFI0?=
 =?utf-8?B?TWtIY3drbkZiV2xtYmRDTVMzV2s2VG5vMitYMURvOUJrK2ZSbi9teStmdmRG?=
 =?utf-8?B?MXlZQkhDdGZlRERVdGg1ZkVPZEwzbDRZcFVnbEF6RGRyQmJvTzN0RXpKWXNG?=
 =?utf-8?B?YS9mSVVpUlNsUXhYWXN2d1FKMjNtWnkxMld3Ti91WmsvcldMV1lRcXJTTXRk?=
 =?utf-8?B?Yi8vMkdyMGQ2b3lUa1paZndXYnc2amVUaHpLUDU5cXVxSDBUcGY0WEdZcEQz?=
 =?utf-8?B?UUNNSU1NUGlKdjNtWlJEZk9WNmZKVGhKUUYrVk55Qno3SEQxaUt1ekoyeFg5?=
 =?utf-8?B?RjJob1QvbWVyZWdvUFVESVlVR0ZGMGswOHRYYm9LaXdRYW01ZCtkV0V1L0dT?=
 =?utf-8?B?Mk5DZ2pJNDJvUUgrUG5ZdmRGRzZITnh3aThwbkFLV1Vkd1ZqRy9CMmdHWTFV?=
 =?utf-8?Q?nNRZdqOFKOU+174r/aU+21TjCyCg3Smg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTlwMWhmQkNacVRpZU9RNHhwbE1FclJTZlFNUWlPelV2M0ZKMkoxa3RrUkEw?=
 =?utf-8?B?NmM5alB1VkIzNEdGMmJFZXNraTBwcjdzUE1CZGdqeENZaEZuaVBLNzE2T2ps?=
 =?utf-8?B?TXV6aklxZ3RxaHAxejJNMUNzVU5NNEg2cXJTK2NJREhhanNTbWE3TDRoOUFT?=
 =?utf-8?B?UUxGTXBrZzZ5UkZTUDNZMENaT1RmNVlVb0dYdUtQTW5ScFczN2dyTlpjdHhF?=
 =?utf-8?B?RWhzcFZmZ1JkcWdzL1llL0VWM1JydUNmMm1wMmNoMUd6TjdnYTJHeXYvbzhs?=
 =?utf-8?B?WGhNMzA4RTJEN2lSVmdpbFE4K05ONnJ5K2hhWks3Y3NWeWhNdDJ5OWk2Vngz?=
 =?utf-8?B?ODZ0MXNMY1FQZks2RGVJbEkwZG4weWJUVC9LdGRvSE9KUmZQYjNrOGh3cTdz?=
 =?utf-8?B?VERBUzVQQ2ZmZFNycFpzZmlIbXFLUjRIaXhCYVZiUHdPd2cwa2xUcUpUTmFR?=
 =?utf-8?B?R3hCUFU4VFNrUVdadVQrWFl5RlFYTmFMQ1c2VDF0bFNOS21jRzdodEh5Q2NB?=
 =?utf-8?B?TlZTU3dGUlJHaWxvbEpJTHdQdXNnUXJ2S0xBaEUxZ2tKajRsK0NvZjBNMXZY?=
 =?utf-8?B?WXBwWm8zSmVVOWhGRHNyQXR3V1h3eWZqUUZjNzBnS0xpdlpWVWVvdk5xS09k?=
 =?utf-8?B?K00yRmYweE56T053Z2dtQU9sTkZzL3Rhb3pzdHpwbUFDWmRMS1VPak1VNzhu?=
 =?utf-8?B?d3E2WjNxL3lRYXJRdEpwVVluU3ZLanZnS01UYzdud3g2VE1jZ1BEY1F3SjFK?=
 =?utf-8?B?YnZKYUt2bms2cnA5Rno4VXhoMWt2T3JucFp1MldCK0lZVFN2QXR5RDVxdHhH?=
 =?utf-8?B?a0R3a0d6RjhEeHQ3TVdHaGNJcU5oOVJGYzNSV0NmQmtDc1ByQlFtOXNoQi9O?=
 =?utf-8?B?RUVXS1QrdTFHK3dTbmpudHloKzZpN1AxSVVQMjg4WGNWWWhyeHNweW5WM3k4?=
 =?utf-8?B?VzdyYk9LYnR3R0N2V2pjbWRTeE5VckI1NWJyT1lMQXE5ZG16dkxtT2xid1Y1?=
 =?utf-8?B?bjA3dC80RGxUNEJOdVNEVUxNNERlUUNKeFVuTjVTdlJITWc4Z284S1MvQjVO?=
 =?utf-8?B?aWFiNVhUTHJ4Rk14TmVtaHhZVG5pYXY5eFdlM2hqTnFBcGtFVDJKZVNOTzg3?=
 =?utf-8?B?WVkySlg1cU5qRVhVSTRpSFc2Sks4S0lIRXdWMGpqNXZPdTdhYnUxSjZHL3ZW?=
 =?utf-8?B?UXZWSzNBaktGcG9JaHI5U2FQdFFiMUJxQlZxb0FLVkRLcERuYVNqRUNlT0dB?=
 =?utf-8?B?SDBGVlFsdCtSUXA0bFgzb3hFNXBadkd0OFlIZzhVVUpiQWczMC9KT3hZTWlN?=
 =?utf-8?B?MzBuZVl0R1dvOG9hT3B3d0J0bnBqZzJZQVE5Y1p4c0c4UEtHQ2dXSkxTa24w?=
 =?utf-8?B?cHFEbWl0UUtQWlJIOHIyaWI0QkVVNGN4SEoyVlRJTnNwam9OYUd5MjYyaDNs?=
 =?utf-8?B?M00yQ0xySkw3ZnJTY0I5MVlFV3RQT2I2YzRKSkl6SHViaXR2VE9xWDZ3U0Qv?=
 =?utf-8?B?ZW13NmRFbDBRSTVFbzU5eloxMUxuY2J2MEhLdDBLMmg2TnA2WDRlRkIvTXlk?=
 =?utf-8?B?S1FpQVdrQnpSNis5L01kYkMzNVB3aGc5MGxxTVVhRGc2amV6Mm13dTJ6dUlx?=
 =?utf-8?B?MFRSR2dDSW95eUwvYVFTSU9GWnZ6Yk9tWERwWnplYllxWHN3UzBtZFE3ekh0?=
 =?utf-8?B?WTFyVlpQOENMK2JXb1dyZ2YrWVVHNzVUMjNIeDdUaEIyaE9OcFlka0JVM0RI?=
 =?utf-8?B?cnh0c1VPbndrTHZsdHJHbzFEVW5OMkJFVHhqaFljeGMzUUVQZGI5U1dSZkFm?=
 =?utf-8?B?QTQydzJpdlM3bUt0S2tZck5nbzRKeUpJNkd4VlFMU3c2R3hDamFVOGlUUjNv?=
 =?utf-8?B?Z3dyNnUvVU93QnkvdnczWkFJMXhWY0FxMGtFK1B1RzQ5RTVxR0NDU3ZFNnhv?=
 =?utf-8?B?RElvM0NHaXMrSHE4TDJ2T21pbWdxK0E3UDBDYjVsZXlxQkZKL0tKRVB2T2dJ?=
 =?utf-8?B?dHVMdGpTN3pZaUFMQlFUeFI1M2tTY1Z3azVhS3VObUoyeXFhTlIydDlqNEtQ?=
 =?utf-8?B?QnBHWmdaNkN3OEo3ZXp4dXkycVQvTUFUMUhQZUhPK0VmTGw1eEVqVHdtRGFJ?=
 =?utf-8?B?TGVTbDNVRzdqRmI3RUg4cTNoWXZyMlFJRE9wVDZ5ZTVNQ2FXWHB5L1dtVWJV?=
 =?utf-8?B?Q2t6VXhNYnF1U083TXRmTHZTeWRJYXJ6bWZIYWxkNFd2a2dqR1E2Q2k1b05B?=
 =?utf-8?B?cG40dmsvRXlxRDZ4NW0wclg1by93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <922B2018E3DCAD45AF6FAE39DF62188B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b9b4cd-1186-4da5-a031-08dd703c60ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 10:11:18.2645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rA1Jj3PzZ3owN6nCcmujTng6pNOBRsvGAhOoYkLynqD6de08xgEYIipzpj0+jS6jUsg8fNXNy46pP2Id/o2sonPfKsjTkSfRHhucItzVPSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
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

T24gVGh1LCAyMDI1LTAzLTI3IGF0IDEwOjAzICswMjAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBVcGRhdGUgdGhlIEZCQyBzdXBwb3J0IGNoZWNrIGxpYnJhcnkgYmFzZWQgb24gdGhl
IHBzciBtb2RlDQo+IEFsc28gcmV2ZXJ0IHRoZSBjaGFuZ2VzIGRvbmUgdG8gZmJjIG11bHRpcGxl
IHBsYW5lIHRlc3QuIEl0IHdhcw0KPiB3cm9uZ2x5DQo+IGNoZWNraW5nIHRoZSBmYmMgc3VwcG9y
dCBhc3NvY2lhdGVkIHdpdGggcHNyIG1vZGUuDQo+IA0KPiB2MzogQSB3cm9uZyBwYXRjaCBlbmRl
ZC11cCBhcyBwYXJ0IG9mIHRoYXQgdjIgc2VyaWVzLiBSZW1vdmVkIGl0Lg0KDQpCb3RoIHBhdGNo
ZXM6DQoNClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT4NCg0KPiANCj4gVmlub2QgR292aW5kYXBpbGxhaSAoMik6DQo+IMKgIFJldmVydCAidGVz
dHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nOiB1cGRhdGUgdG8gRkJDIHN1cHBvcnQN
Cj4gwqDCoMKgIGNoZWNrIg0KPiDCoCBsaWIvaTkxNS9mYmM6IHVwZGF0ZSBmYmMgc3VwcG9ydCBi
YXNlZCBvbiBwc3IgbW9kZQ0KPiANCj4gwqBsaWIvaTkxNS9pbnRlbF9mYmMuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQ3ICsrKysrKysrKysrKysrKysrKysrLS0tLQ0K
PiAtLQ0KPiDCoGxpYi9pOTE1L2ludGVsX2ZiYy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA0ICsrLQ0KPiDCoHRlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFj
a2luZy5jIHzCoCAyICstDQo+IMKgdGVzdHMvaW50ZWwva21zX3Bzci5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEwICsrKystLQ0KPiDCoHRlc3RzL2ludGVsL2ttc19wc3Iy
X3NmLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSArKystLQ0KPiDCoDUgZmlsZXMg
Y2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+IA0KDQo=

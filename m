Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBE3CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 08:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150D810E89C;
	Wed, 10 Sep 2025 08:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpJyu1Dq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C5A10E896
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757491469; x=1789027469;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iRjmSZvO99t9uBEy0wE0Z0yky+6DbtPIjZIW7t7J5Tk=;
 b=gpJyu1DqO/cKqy9gMfNKzjnNvFWaQ3MyyK39jTp43c2v/rGcSUGV8be1
 x6w/B1ZaKMqcC/MJOV2TacDp7jyLSoyq47TYD0P1hN2npHGg7XFGlc99O
 dvQ1608mfUda5HEjyJJb1e6U4nnCWECT9u5pvTrTnkPDJOB08CO3y2Vtr
 17upu+6AxRnfwH2p8gRASpeYQrA3q6sgc80p/h91PEuGeMPeu9gwpVTJy
 vYKywQIVFekg/v6/v70qvKZH7iirgO+hyWOrWYmhBD8tesB+lJUhAa/Ny
 MFmq7d+ArE/JApamMxt9xZXqgt40JSLbe879mfV+iTmKOX0BCO+4EJRGC A==;
X-CSE-ConnectionGUID: FvlBQbeuSTuWwGGI279WrA==
X-CSE-MsgGUID: R50QPjNKTPCLBMRTe+K/FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59857908"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59857908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:04:29 -0700
X-CSE-ConnectionGUID: Yd3ukL1LTHqRj+13l3uEvg==
X-CSE-MsgGUID: lVYZ3ELbRKWA9FXjrSpjmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="173705988"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:04:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 01:04:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 01:04:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 01:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bc8NIUzPPVqXlY6tBqqIYdxyHyw8CXd+winsRw6kkZrzZ7wBScW+7B4dAab1w9VeYjzsY0tsflB3Ye4zdDlLBEfK4Soc9ebB7C8zf+OT7i9ofex25I4lbSYJhp49QPI1c9/XZYXis1xpD1XvKfO/IB1KNSAhxTv/+Rb+o3tStWq8y/cvAXUJlsPS+Rygkod+Xn03vEEB5rOkNZxoJeoFIhgYEr6JyZViQwI7HZs3mvczb6hLtuLOF2efdA5Hhgf1U73SZ7gLio5DEyR4wYVllbKt556wdGu6dLoB9oiPip47xEMnYzSUpapYuM5XoBxKo1ZIpxRRJ2xImQaZl3VAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRjmSZvO99t9uBEy0wE0Z0yky+6DbtPIjZIW7t7J5Tk=;
 b=yIay3vVsS6bDidcnQXaSAd30igk+p6/KP5jGssXe5EVylDeW+cSbjqMKW0T8uY/6/4vLUv/bFEa7PfacU9RnZt9jEQRSFf+AEk8i/2sE7VDVSviPwrYTbWLhAm6fkLYdM5/uELHs9STmqC4yEpjPs7/ylq3NVYmOX4OWHEgss/1HHdMYbLkYN4tR24xWenhcz4/ebKjjJyH6btNpIrpdnnm+RDq0tOfMB03PBmaAvjj3LBiELlAOfB5NesQp4KRRt+5axH++tfhnMPtjAVmvowprzpgxVQRjYu2ulYdH6Yg/o27Kqc0uEozeRyNNexcAC03yYv4zSS/eXOYGve6gpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Wed, 10 Sep
 2025 08:04:25 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 08:04:25 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>
Subject: RE: [PATCH v2 i-g-t 2/4] lib/igt_core: Block SIGINT during igt_vlog
Thread-Topic: [PATCH v2 i-g-t 2/4] lib/igt_core: Block SIGINT during igt_vlog
Thread-Index: AQHcIL/Uu8RDOL27p0yKPTUYSoUXSbSL8TaAgAAf5QA=
Date: Wed, 10 Sep 2025 08:04:25 +0000
Message-ID: <DS0PR11MB726453762DD87F67353F4B69D90EA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
 <20250908125448.13420-3-dominik.karol.piatkowski@intel.com>
 <ldkqnliynzdrqu3ycge6qba7z5m336e4gk7xbacfcs76afqxo7@uvmgnhz3icxc>
In-Reply-To: <ldkqnliynzdrqu3ycge6qba7z5m336e4gk7xbacfcs76afqxo7@uvmgnhz3icxc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ1PR11MB6178:EE_
x-ms-office365-filtering-correlation-id: b3d2cacc-51a2-4b17-ea10-08ddf040a893
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?OWw3ZE9VOHFydEd4Q3RocVJLbDRxRGhoYW1RMzZsODJocldJSTVTOEtIVHRV?=
 =?utf-8?B?N2NOdk5VSkFpUEhkYjFjUTdYT1ltNWtObTkyUkFMTXVWS0xWdTFvWnVxaE0z?=
 =?utf-8?B?bWFwSmxnWXZ4dzdJMWtPN1ppamR6Zy8xSDkwbE82d0pSWGxMMWJVMjdkRmRG?=
 =?utf-8?B?YVJaWWM0ZDg0Zmh6Y1dua0YrMGNkb2hvazVhMW8wOWNGejA3VGp3QWE5ek1v?=
 =?utf-8?B?VUtQRmtTMFIydFBRM1dweUZjZDlIMUc1VlFjR3RxM2NaMnNzdUc5U2pzUGE5?=
 =?utf-8?B?VDkzNndyam9SdWNCWXNqZnFMMnJ1bkJsS04va0RtNXZpck8vMUlYcVBaalN0?=
 =?utf-8?B?WTQrV3FLSG9zTHJ2YmZYb0RzUDNXQnNIL0xhQzI5Zjd5YzhDeXM1Ri9KdWE2?=
 =?utf-8?B?UitXdGtkcmI4WUovTVJqUTMrTDhIeXp0RDBVQ3lOQnRzaC9JQXJNMlFHQStv?=
 =?utf-8?B?aWtXMFMwYlAySmpEc0tNcXZ4bVo3K3dmTWdoQXk1NnBvU3BzOUdnV2JZUzQ2?=
 =?utf-8?B?TmRBazVaUE1FMU9ZYnVMN0pjNEJXSHVpaTVKRHdsaHlBVndNVm9GVHdiaTFp?=
 =?utf-8?B?SytUZTJIYTlyN25yOHFOa2p3MWNST3lldkt4NGFJM0Mxby9mZzBxK2hiUEdI?=
 =?utf-8?B?R0QrQnNQZ1JvRSthUWFybXRqNHcrZlJzcmlFTGNocXJlb25zMlBEakVEdG5p?=
 =?utf-8?B?Tmk0aWZYWXRwUmVBcDlIbUZWMTZobGgvRkl2Vy9hcHExUE5xZXNMR3duKytw?=
 =?utf-8?B?OS9GT0NtSmVoSjdsZkFtZm5MeWJ5clJCdmFZNVl5YTE1V1dSMER0dS90SSty?=
 =?utf-8?B?QTVPcDlsNmkzeGZrV2JiVE9JUm15SEhVaW5RMnNjTzZJRDJ3T2V6bzVIcmN2?=
 =?utf-8?B?eDNuZzBTdThac1RTV3ByM2RQWkRCaTVrV255WXNZa2RBN1JNb1VSYUhCcjhG?=
 =?utf-8?B?ZFFDajNMc2VDQ0x5UkZWc3lCTnNPTHVyMzVZaXVTUjU0WTIxWFVqMHNqaWZx?=
 =?utf-8?B?Wnl4UkhkTFQwQ3YvTzJGRko2em5QNzdnTWZwZmpUZk9yQ3hoU0RxMDk3RDJG?=
 =?utf-8?B?eEtXc1hiNXQraWwvTUlVSzlWRWNjZ3hqbzZwZ0dOSFpWbFFTK2VZblFlTFBM?=
 =?utf-8?B?U3JpQWlFMm1McmNxZmR5dVRHaFh3c3BSZ21ZL0xwaGJPZ0crSjB6K3drcWdp?=
 =?utf-8?B?dVNrWXdhekErMUYycktZWjlKNHlFWE1pbEZFSHQrcUNmRWtlaHViYVJzVEN2?=
 =?utf-8?B?NC94UVlscXduS2plRnhoSXVNV3BiVEJCa0dvWlM1RjdsL1Y5anZ6M1ZDNmI5?=
 =?utf-8?B?cFlXdlRWSjVkcW9ENlJ1cWh1WmxtbVprdHp2WWlDRjYvOWJ2NnArTHJMTXRW?=
 =?utf-8?B?Y0tyeFBBdlFrS0NLOXBWL3lXOXZLczgyR0VwK1A4Y2xFc1ZuVnFYRjFHRmpW?=
 =?utf-8?B?OHlJcWkwdWhLQkNBTUJ3N2NrUGR3OHhRMG1CQkVsU2F0Z096ZkptcTc2dXZN?=
 =?utf-8?B?M0R5UEswaWlMN0ZKckY1emdGRktYYnpIOVpRcWc5Z1kwYm1teFRvdC9OWFNY?=
 =?utf-8?B?VDdRZU9rVXVGRWo1ZEMzQ3JqUVJpRDBLR3Jub0J3Ty9wSStuZTRYQ0k2aU5O?=
 =?utf-8?B?d2ZTaUN3YTFHT2JHVWpsdnNYV0JxdHRRMEM3K0tiSFRIL1N3ME4xUnI4MFFa?=
 =?utf-8?B?TENSTGRsYWxROWFDOHVxekxFTnRZa0NEUEE0QWpUTllKWVlLR0QrdzY4dmhB?=
 =?utf-8?B?eERVRDd5TkhzQTlMVHhvVHNFckdnZTF2ZE5QOEVCRzdlNXdGdFNhUmZiekIy?=
 =?utf-8?B?L0lDd2YyNytiZXVldjAybDZhSlU1MlBRbTZ6aklqc3hQaW1nMEFrZ21rMjJE?=
 =?utf-8?B?RjB0YWRsZDQ3SE1KWWZzNlNRb2FrOG5SQjFaYUhqS0RSL05lNGxjNUZ5UWVh?=
 =?utf-8?B?TCtZQ3djYUp0ekFuUm5JNDZCd2FYejFmNWp2My91SzVkZ05vdG0wV0ZTbWx1?=
 =?utf-8?B?RzlIZGNlZnp3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1dYWXJWTk8wQUNzMDRMcGZJa3diaWRyWEJGVWpCNkRTdHJubWFJZkxWTXVL?=
 =?utf-8?B?UGVSbXB2QktHVm40TjFkQkRGRUpSR28yL1dON0tKMTBDZk0rYzQ5NmtHNkVq?=
 =?utf-8?B?UTJ4YUN0VW42UUt5Zll5N0crWEZxTTNUdEV6aFFIQ2xFSjFZK3BGSHpaQ2h5?=
 =?utf-8?B?cUZiWE9GNGNWSnh2M1VrYVAyMEFjSW5GcjZEYkd3RytTUTdkYkkrZmYxTTMy?=
 =?utf-8?B?V2ZkWVYvOE9RbEI0Smk5VTk4c0VXWmo5ZEN5b1g1RTB1OGp0OGVpaStsY2JS?=
 =?utf-8?B?QmVZemdBTWlsTjExKzI2VmIxNlR2bzg2OFRjeXBQVHJEUktsWk1wUXZ2Ylh3?=
 =?utf-8?B?QmloUkNNMHVGdU5FcnRXQ1FBdTIzdWFrVWRMOWVMV3dPZzZVQ2YybTFOL1Ax?=
 =?utf-8?B?YUR3V3JzLzdPMWNEK0szNWZJbHU1ZU0yY2x6RlprVDJ6QXh0MWhEbGtmNi8v?=
 =?utf-8?B?WEg0eDNYUnl3cTZGODYzME5oRmZtM0lCcGNTdHR6SExJcE9LMFBTbGo3VU9F?=
 =?utf-8?B?VklFcjcvTS83eU5Wa2h3OCt5UkROUTduRnRDVVF5Smp6YTUxSkRCWDBiVnpR?=
 =?utf-8?B?bGZyaXlvTmtMdFAxSllMY1Z2NUZubXZSVjhVK1JLcEZlbmVHdVFKNVhKbzk3?=
 =?utf-8?B?Mk12SGZhdElqS0NmZUM5VDlxS0xqZmtjTzQzOElyWk4zQmJ5b0tjaStNWEh2?=
 =?utf-8?B?QjNFMHBVM1c2dEt4NzUyTzRBTDZ3N1h3Z0YzTytrMlB1V0wzcmpVelErdkZI?=
 =?utf-8?B?cFUvK2UvWStqbHdBTHlMclRzcjdJRUk0cFJ4eUNnSHNiL2ErRlJxd25BVURT?=
 =?utf-8?B?a0hxN3V0RkpOK1RaSExxWFZKdkRhRFBoUFZBV1B6S21oMFliZ2xEZVQ4V2ll?=
 =?utf-8?B?ZEpiWUt0NG80NmFkWmlyRG5QbXRNQWlycmJ0dnVrS0U3cDg2Vlg2SUovYks4?=
 =?utf-8?B?VWhrMVdmb2lOWlpyaDhKWG9TeDVRZXRTUnVLL3kvcHpMZGQreStOZ2ZURkYy?=
 =?utf-8?B?WnhXb29heUFGYTdQczY4RHFVWDlyUWpPNlhkZXhMdXJRSThYVkFXRTZ0R2p6?=
 =?utf-8?B?ejBQWmtadVJWWTFFbFlJcUFKaGFNbk9Mb1FITk80RGl0S0ZRS3JxTncybUcx?=
 =?utf-8?B?a2RsTjJnMEFKYkkwQ0hrSUZJZWlFdGtlb0hqKzNWb0pPYWRicExJakdtRVd6?=
 =?utf-8?B?SjZVRW1YMnUvbjRPQ0pncTUyN3JOeVVicHVkMGZidlk0eG9aVUlMT0xHTFov?=
 =?utf-8?B?ZHlmbW9aWm5JbkRheEc3LzBUa1NSWUJiMjdRSzI1ajR3bm1EMitsTTVhbEtw?=
 =?utf-8?B?VDhIaHNJYnZkcGJwTVZaNTF0WlRwWUhpN2E2cEFlQVoyZGU3SU1kVXN1eGY5?=
 =?utf-8?B?QitON216MnpIRDhacWNCWmg1TTdIWi9WTjgrZExreTB3ekh6ek1kQzlWZ1A2?=
 =?utf-8?B?a3hsQ0VmSUw2TFhIZ1FCZzZldHEwbGFYZE53eklYVXdHa2pndGh2V0lUM2l1?=
 =?utf-8?B?cEZBR0poU2RLcEk5N0JHckFJbnJqbkJIWUtFaVRoWFVjeGtFOG1nNndhOGdy?=
 =?utf-8?B?MUl2MW1RdDhVOS9CLzRzN3VOZE1JZFdaenBzY2tWNzc4SlFMRDM4L0JPeGpm?=
 =?utf-8?B?Y2tzSEVBSjZCT0NrNlNRS0NlTzRqcEhQZjQ1VkZ6cThLWmhudyt3MkU4TWZF?=
 =?utf-8?B?WXFZOFV5TWYzL0ZrcnNvYTdHRUZEQklSVXRxSlJaZUVWcWlyc2ZNMzR0eVJU?=
 =?utf-8?B?QlI3MGxIVmVWMGFKTE9pa0lsd1F4T29QelBaUHZGSWd3eFVIa1RNVCtab25B?=
 =?utf-8?B?SGZobmt4RU9jaTNaZDlnc2YrOXA4WHU3ems5SGtVS2Q5NVprb2p1MVFHMXNZ?=
 =?utf-8?B?SFVjWUJ3OWNDQjRSYkRuTG1GZCtveWJXSkJhWTVjb3YwdjhKYUk2M1gxYVBW?=
 =?utf-8?B?STkraTEzR3M1N1pMUFFZb3BibUR1VTAxandsTmpUZWJ5eHlTZVFqQ1N5djhM?=
 =?utf-8?B?K1Q1OGJUYmZDQURqdzVLR0VIZFRpaTVCNlEwNk02SEdUTlNGM2g5Y1p1OUV1?=
 =?utf-8?B?UTZ3RGJEWU51L1NOTmFCQmFJSnpuYkxzM0JNNzY0MXdIY2p1cHVmVnJNVGZ4?=
 =?utf-8?B?ZVdnd3d5NU9waTV1U0NjQ3c0ZXVKcDRsZmNDd1o2cEFVcTF0M25rZWJyNkN3?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d2cacc-51a2-4b17-ea10-08ddf040a893
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 08:04:25.3218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /B2mcHA62XEKFMh3mhW4SVytdxogCoAdVY4cG0s9tthmcpHmtFIqSG1Ewq+yP6UG2aHQpQ1N/Xwzac9jbNVb06oMw6aVefKe7gC3LjmAiBl+hLzdkz38Zi9jPi9/Xkb8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
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

SGkgWmJpZ25pZXcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2Vt
cGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNl
bnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDEwLCAyMDI1IDg6MDkgQU0NCj4gVG86IFBpYXRrb3dz
a2ksIERvbWluaWsgS2Fyb2wgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+
IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTWlrYSBLdW9wcGFsYQ0KPiA8bWlr
YS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgaS1n
LXQgMi80XSBsaWIvaWd0X2NvcmU6IEJsb2NrIFNJR0lOVCBkdXJpbmcgaWd0X3Zsb2cNCj4gDQo+
IE9uIE1vbiwgU2VwIDA4LCAyMDI1IGF0IDAyOjU0OjQ2UE0gKzAyMDAsIERvbWluaWsgS2Fyb2wg
UGnEhXRrb3dza2kNCj4gd3JvdGU6DQo+ID4gQmxvY2sgU0lHSU5UIGR1cmluZyBpZ3RfdmxvZyB0
byBhdm9pZCBkZWFkbG9ja3MgaW4gbXVsdGktdGhyZWFkZWQgU0lHSU5UDQo+ID4gc2NlbmFyaW9z
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraQ0KPiA8
ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgbGliL2ln
dF9jb3JlLmMgfCA2ICsrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9jb3JlLmMgYi9saWIvaWd0X2NvcmUuYw0K
PiA+IGluZGV4IDQ0NzdjZmVmMS4uNDE0ZmQ5YmNlIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi9pZ3Rf
Y29yZS5jDQo+ID4gKysrIGIvbGliL2lndF9jb3JlLmMNCj4gPiBAQCAtMzE5OCw2ICszMTk4LDEx
IEBAIHZvaWQgaWd0X3Zsb2coY29uc3QgY2hhciAqZG9tYWluLCBlbnVtDQo+IGlndF9sb2dfbGV2
ZWwgbGV2ZWwsIGNvbnN0IGNoYXIgKmZvcm1hdCwNCj4gPiAgCQkiQ1JJVElDQUwiLA0KPiA+ICAJ
CSJOT05FIg0KPiA+ICAJfTsNCj4gPiArCXNpZ3NldF90IHNldCwgb2xkc2V0Ow0KPiA+ICsNCj4g
DQo+IEkgdGhpbmsgdGhpcyBwYXJ0IGRlc2VydmVzIGZvciBhIGNvbW1lbnQgZXhwbGFpbmluZyB3
aHkgd2UgbmVlZCB0aGlzLA0KPiBiZWNhdXNlIHRoaXMgaXMgaGVhdnkgaGFtbWVyLg0KDQpJIGFn
cmVlLCBpdCBpcyBxdWl0ZSBhIGhlYXZ5IGhhbW1lci4gSSdsbCB0cnkgdG8gZXhwbGFpbiBpdCBt
b3JlLg0KDQo+IA0KPiBJIGFsc28gd29uZGVyIHNob3VsZG4ndCB3ZSBoYXZlIHNvbWUgZ2xvYmFs
IHZhcmlhYmxlIHdoaWNoIHdlIHR1cm4NCj4gb24gb25seSBpbiBldWRlYnVnIGNhc2UuIEkgbWVh
biBpbiB0aGUgdGVzdCBmaXh0dXJlOg0KPiANCj4gaWd0X2Jsb2NrX3NpZ25hbHNfaW5fcHJpbnQo
dHJ1ZSk7DQo+IA0KPiB0aGVuIGluIGVuZGluZyBmaXh0dXJlOg0KPiANCj4gaWd0X2Jsb2NrX3Np
Z25hbHNfaW5fcHJpbnQoZmFsc2UpOw0KPiANCj4gDQo+ID4gKwlzaWdlbXB0eXNldCgmc2V0KTsN
Cj4gPiArCXNpZ2FkZHNldCgmc2V0LCBTSUdJTlQpOw0KPiA+ICsJc2lncHJvY21hc2soU0lHX0JM
T0NLLCAmc2V0LCAmb2xkc2V0KTsNCj4gDQo+IEFuZCB0aGlzIHdvdWxkIGJlOg0KPiANCj4gaWYg
KGRvX2Jsb2NrX3NpZ25hbHNfaW5fcHJpbnQoKSkNCj4gICAgIC4uLg0KDQpUaGF0J3MgYSBuaWNl
IGlkZWEsIHRoYW5rcyENCg0KRG9taW5payBLYXJvbA0KDQo+IA0KPiBBbnl3YXkgLSBkZWZpbml0
ZWx5IHdlIGhhdmUgdG8gcHJvdGVjdCBpZ3RfdmxvZygpLCB3ZSBkb24ndA0KPiBrbm93IHdoZW4g
Zm9yayB3aWxsIGJlIGRvbmUgd2l0aCBwcmludF9tdXRleCBsb2NrZWQuDQo+IA0KPiAtLQ0KPiBa
Ymlnbmlldw0KPiANCj4gDQo+ID4NCj4gPiAgCWFzc2VydChmb3JtYXQpOw0KPiA+DQo+ID4gQEAg
LTMyNzYsNiArMzI4MSw3IEBAIHZvaWQgaWd0X3Zsb2coY29uc3QgY2hhciAqZG9tYWluLCBlbnVt
DQo+IGlndF9sb2dfbGV2ZWwgbGV2ZWwsIGNvbnN0IGNoYXIgKmZvcm1hdCwNCj4gPiAgCXB0aHJl
YWRfbXV0ZXhfdW5sb2NrKCZwcmludF9tdXRleCk7DQo+ID4NCj4gPiAgb3V0Og0KPiA+ICsJc2ln
cHJvY21hc2soU0lHX1NFVE1BU0ssICZvbGRzZXQsIE5VTEwpOw0KPiA+ICAJZnJlZShsaW5lKTsN
Cj4gPiAgCWZyZWUodGhyZWFkX2lkKTsNCj4gPiAgfQ0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4N
Cg==

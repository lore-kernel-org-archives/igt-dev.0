Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79BFD3B999
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 21:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6109B10E55B;
	Tue,  9 Dec 2025 21:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKdX/DVq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A48E10E1D0
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 21:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765316199; x=1796852199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=c7+co+5vHNv8W08XNI5jdaYBebWqpUrzD/9uQff/nd4=;
 b=AKdX/DVqhH/NiuKgyJn13hfvGKniYgN1xig0l9udDOVe3vRA5TgpKTLV
 4oUGah+RZEnIOahtu3oH/iDalrqeVMDQYt11ojm3VoIvZ+gDOsAnlnOQ2
 1O4nAidZ6Wz6KZyAJ2PEgmjZF1NV5vDUAwGlF567t6alu7bBienPdHTW+
 D4eywMmScxc3wLfWfnOWzXQGej3fa8dbUlNARz+6DHEGIKDQYwdETVEq4
 u5xz6hK59JO0HoriVvbpN2gBlEYoademNbRnLPdddA3Nw3n1OFY/JDyOi
 ebMbt6r942wIlt1mes9Vgq5MBGvYzGhm/VX6AF5judzm8/7gskxD4Z0Bd w==;
X-CSE-ConnectionGUID: qHR4Qb3eRx+pwUHqrLB1ug==
X-CSE-MsgGUID: VNMenMUkSGG/WzvIgokDMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66285402"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="66285402"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:36:39 -0800
X-CSE-ConnectionGUID: RqidGvd1QNuRpVMxDy16zg==
X-CSE-MsgGUID: FTHBrqsJRHSI8gauXc7lqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="226997023"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:36:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:36:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 13:36:38 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:36:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meLQPV4O9nzsy+nG8ywkC6k4mouf8fkZ883GOa+/iclG6MppO9hQGnUi9zH2H7+SogrmITVC1RsBEMI5VPHaHlyYynz2VvzcW1ry8pEtTZ61YdP9BJYcIQbaffwCgLFdufUcFjDf4mX0+0nfG+OyIa3CMMfkH5i2A/m3Z/xBj6haN3tirezNy6KT6WyLcp5mjLt9Wn2VZQGUkrsHPdJQi8VsnXKXnpbpy2HAK34xCAGBAFMFQfWbXeKTaPlkKLP9xRKtHYX3xBJktjzxFMoKmYpMnUAgxJO8te6fSiGdvXCtc/GNXSPgiAQJ2hUcMAPdfswnWLghprl/QHlMzOOxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7+co+5vHNv8W08XNI5jdaYBebWqpUrzD/9uQff/nd4=;
 b=dGP3ojzQmaHTWJDjVts4rJfDirQJ4Mpg8/+6fxCub/j8pKp5ujYlSfeTcaQa7Od9Z3+Dh5aqL3BtMkXknfzwHPzfV/vOuOQ+Uuiy5z4iFWKdtRa6EI7VTf/FKFlw0f4v3SlvhwwzseUlRjkirsWtYiTMt1m2IR3KMNQNeYaWNj05McxjQO9c4zamqEdeEB0kbaEbgpPTY32lZP6B/LTFKRuwlgWYt2Ed9k4YYLLyiegEleqfrmlVSwazb+HLqftSy8EitVzH9XgcXp0tU10vh4wJ5jNNYLAImPBbIrhlC0yt5OlLJw1rf0LxSGB9wL81TFNxZalt6Tq43EVor0Q26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB8539.namprd11.prod.outlook.com (2603:10b6:a03:56e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 21:36:33 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 21:36:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 00/18] Multi Queue feature validation support
Thread-Topic: [PATCH v3 00/18] Multi Queue feature validation support
Thread-Index: AQHcaLsOv0/g/8idJUeF5C0ETlE1h7UZ1k2A
Date: Tue, 9 Dec 2025 21:36:33 +0000
Message-ID: <46376c56c9ca6e00e6cdd9ed22c75943fd55acfd.camel@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB8539:EE_
x-ms-office365-filtering-correlation-id: 581cca92-c9ac-4b7c-1985-08de376b05dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Q3Axa3JxL2NmTVdpcGpsV2JnSDBkdkJtYnVqZWVxcmNDT200TGRwbjVRSDZZ?=
 =?utf-8?B?T3RISGE0V2I0bzJzWVFJUk9KVWFGZUhLT2JkcEVqM21ScFhqWDVOckg2SDFw?=
 =?utf-8?B?bFdJeUxJZ2NObTlDR0NIQS9QZkxPbFN0QkgzN0pYTDdwUHRvR0xMWEI4VFQy?=
 =?utf-8?B?Q1VNVnVZRE5TWmxsUWk4cnRvM05JdUJBOVlIVmhjU1FsaG9sL3czWlBjUHJP?=
 =?utf-8?B?VVhXWUpDMmxQUzNZakxOWnJzWTBwUGpmRG1UOEo2RUZPa0lLUE9tcEMvODBi?=
 =?utf-8?B?WjVkbVNBVENucWRmMVVHbWJnRGZNdnRVbmdWUVY3cGIxNm9TaW1VWUgvTmtj?=
 =?utf-8?B?N1pTVWk0ZGpCNzY2OGJnb2F4R1JEWE5tajhacGphVnQ1RGRYZXdnUUNUVnIr?=
 =?utf-8?B?cEtzUTlKdVZMcnpSTVpWQVdod1p1R2JDd3FWcDgzeklTcEx4ZWVKZFd6MGh5?=
 =?utf-8?B?bklDaWhFUnVJdGpkSGNBN1NjbEtvZzE0alo1MEI4MnJvb2xrSmZkQmZ3dlVT?=
 =?utf-8?B?MHp3eUh3NDBEeDVYL2VGcXJiQTJwVG9IMVRIbnBBSk9iOTB4ZHh6cEIvQ1B6?=
 =?utf-8?B?aFZCZ1RENHdIRTZ3b2dwaFl6dEdRbFdsS1pvemIyaDkrVlBlSTFBbjVtYVo0?=
 =?utf-8?B?cFpLQWo3YktjQmV3YXJyMnhubVFSQ3lXdkVWVi9xMit6bjY3YUVPMHE3Q09q?=
 =?utf-8?B?a094UGVXSnVHUWs1aEJTNGRhQmYrQTRRdjZMakJUbktzYWlzd25CWll6WVRV?=
 =?utf-8?B?TUd1T3gyN1dLa1RRSUhCUHdiQmk4SENuaXFtYVQzc1FjSnh1RWUzc04weElV?=
 =?utf-8?B?Q1RaeEFoMW5KRGFKcXR3c3pBdXErakxoRTRmRE1UN0c4QkNJdHQ3Z2RxRGJF?=
 =?utf-8?B?cUY5VzhrYzh1L0MraVhLOFN5bDFYdklPemszOERCUDVOMDMzVHZaSlhoOW9N?=
 =?utf-8?B?TGE0YlJHODRTbjFGemlMbkFQMHJsQ0wvOG96OGxYVGs0WktvWnZiNXdjcEpy?=
 =?utf-8?B?TjdqL0NGdVgybWU5QXA0ZHZwMHg5Z1hvSW9pNXpHa29CVWtNS1BaMHQ5bGZq?=
 =?utf-8?B?ZHlDSFpvWldCckRyY24ySXlENkkyOVF1OGhONy9EUHhpOEJFQXBpU05td1p2?=
 =?utf-8?B?ZEhnVmZBbjQwY3dDMVErODBtQzhqWlBNNWVuY1RmbmkwbHZIQndLYklDQ2dL?=
 =?utf-8?B?Z3YvS0lFUXpGNVE0MXM4RjVtcEdvUzMrSWMrd2hGL1VTbUdFOW11RjR5Um9o?=
 =?utf-8?B?NzdHczdEZzZLQkFlU08zeVdHZ243T2hEMkN3VjdFWjBIK1hMMnlETnpucVNa?=
 =?utf-8?B?dlVrTXJuWHZjcnBsYitjY0R3MXJRTUVkcHY5QWpjUTVPM2JwT1RLZ2NnSm9I?=
 =?utf-8?B?aDFLejNxM255VzhrR2VuL2xQNXNWOTZuY0dDMjU1bFZMcGdvSFd6R0RkeDYr?=
 =?utf-8?B?dHRlRWg3VGlQMmZoZENYa3NmQjlGKzdoRVNUczg5cnorYm5hQVZNNmtXUElV?=
 =?utf-8?B?cVcxQnhweG5KWjI5bjc5Y3RzM0NFVSsweXJ6MnkwSG9xa2phUFdjbXRPRnRO?=
 =?utf-8?B?N3o5ZG8ydjdmN1ZMRUM4ZkFPRXhlNzdwMUR0YmtDYlJwZFg1cGxiS3h0OGNo?=
 =?utf-8?B?MVI3RVZhWVA2MWpPRWlFQkprQmRvWFIwSmlCSytvM05vMG1OQmk2UDYwOFB4?=
 =?utf-8?B?S3o4TExLbXRMc3U5Vk5keXhaQzdXUzZPWHh1cUZaTHNvaE9KUitZQ3oyaU04?=
 =?utf-8?B?NUxpNWJUSFhwejA1bFFHc1g5N2Fqck9FdjU3cFVsMUtkZFg2d2V3aytzTHV2?=
 =?utf-8?B?STRsZXdVMDRoRXlSMWZZRVpMcndLTDNnWDhlZTVQVjJSOS9Ka2VDdEF1c2RO?=
 =?utf-8?B?V3g0OUZlbDFEblkyM2FGejI1eGY4ajB0TFJXVHFDTngwWVAvbXdtaTYxdjFL?=
 =?utf-8?B?MXB2WG9qdU5hWm1peVZuNmZETDVIZlk0d29JbFR3aUhpU3l0TkZoSmY2UzJi?=
 =?utf-8?B?QVVuUzIvTXJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1R1RWtpWFd2VUV2d2xOZ3pIZ1VqVFYxM29nUGhJTmxLai9WYmRFSUl6U3lC?=
 =?utf-8?B?MFNRVTVtQVJ6SGRzcTJ6UzdjSTZnSU94SGlhdSt6MC9LNk01NXlpOEJNc1ox?=
 =?utf-8?B?aTVJbWd5REVldHl0d0FqN0wxSmFGbXpzWUxlVldjcDJnMmtqOVF2M1dUWTAr?=
 =?utf-8?B?ZCt5SVl2QWFuQzdNYVBxdHZDN2JvTkFiR1ZxVTZiVk1zYm03S0pzMmVUdFAr?=
 =?utf-8?B?MmJxckhTTGVsc3E3SGxrQkxmTVo4L29TbjVEazB1cnc1OHAxdlVKWDh1SlE0?=
 =?utf-8?B?Y1VDU1dXOVFBUXFYb0RQZXhyVXB5bUxwZVQrVHVBUnlEVWxhc1NxS3lGYWd5?=
 =?utf-8?B?bTFEM3hTMFBScE5KSHZZMXoyaHVWdlgvcG5lOHFmQ292OVUyM1hVM3dFdVEv?=
 =?utf-8?B?djVpNUhVWUI4VGNoZm9WeUVTYVdzNG02QnZlVkpFZUZwZitSTExBSllGUXdz?=
 =?utf-8?B?Vm4xU2g1cUpKVjlMWFh3RFJsWExsNHA2a3dZUzROTXo2L0txVS9zYWtkY1JK?=
 =?utf-8?B?R1VtZTJuT2FzU2doWlE0ckpobTJERDFUTlplblh6Nm5mcVV0Z3JtQzltOXN0?=
 =?utf-8?B?VnpIVnJ3Sis2S2t0b09iZG00YkdsS0xqKzJ3cmdkQTVyUldPc3FwTVkvVFlZ?=
 =?utf-8?B?MHU4NDZpZUdxQUt2azBRMjBld1N2QkE2NmREN0VvQTJsL2NsSU5QOFk0UWxr?=
 =?utf-8?B?TFJOU2V0d2dSbVJxMzEzdXFFeFFWUG5zdHdlTjRPdWNaR3A4V092VWhrd3pU?=
 =?utf-8?B?N0VBVmNEK2ZxamdNNkt5c1IyTyt2eGpRUnRnWjFtVWJyVWMrQ0JnUlZYK2RE?=
 =?utf-8?B?WktCdGYvRFBxUEhFM2VPWjNtYlY3WUVDd2l6TUFucmovUUJRZ3pJU0EvQjBY?=
 =?utf-8?B?bENhRUgvU1NudnExWEliVWpqV3pOSXVqVUdvMVdwSm1tTnBQOTdpS2FqNmI3?=
 =?utf-8?B?WEt4Y1RpU2lyUnJmSFV4L0Y0b3lvVUpKeWc1TEtIMDhUbU9DaEhrV1RUYjhu?=
 =?utf-8?B?eW92OWRNeEFCUEw0bDk1V3BMbkRTbit2RldNQXk1QmJGWDNjM2E1NVMzQWpw?=
 =?utf-8?B?a3hoU0Z2R2R2RjZlck96M0RXNlcrWDFvOHJMTVY2dGxXdVN0djE2TDBKcURo?=
 =?utf-8?B?ZUhtcEE0dmJsSFFBR2Rxc1NGYkpHbmQ2cGREdGZvVThKT0trVEJNVkR6VC83?=
 =?utf-8?B?WHlBUHBZQWtOdlIzTVEzSVIyS2tmOXlCN3lZdkRQSjRGanpUdGRxMEQ2YThj?=
 =?utf-8?B?M2poZHh5a09qRlRmY3BaMTdzZURpL0FuaTFnc05tWEZTS2o5Z1VWMzhzZ3lO?=
 =?utf-8?B?OGJzSmVEUlJrQTN5RDRUSjNXeFRPVExuaUMwUXJzcUUzMmN4ME9jZE13cllR?=
 =?utf-8?B?UlQxVlhoMDNEYlIxWlRpUGRNV3J2Wm56VkxDQzFtTWovZ3NDN2xjRnNwREF1?=
 =?utf-8?B?eXVqZFJUWFVLYkpOQm94ZEhkanBDMDMyNG9veFV5bUtleE5IWThqQnhuZWtE?=
 =?utf-8?B?d1VhRk1XMEpwdTMzREVnRlQ5emVWME5vbUhPTDVFWkxzTnVoUEpFUE5BZ0Jw?=
 =?utf-8?B?WUxCOUsyQ3ZiYkxwTkh0VXN5RnYvVXBlQzkzR2xWZzNKc3FKbnNTY0JDZ0Vs?=
 =?utf-8?B?OVVveXhqekVCaXlNOU5pWGlodWpOcTkxbE1pM2dOdlRUYm1ib3pHNVVuWFkx?=
 =?utf-8?B?cjU5cXlPMlFuOXBaNXNIcFkvSWVpYndRdUJTeVBCR1Q2blBmbUVWMFp1Uklx?=
 =?utf-8?B?aTFOb3hIZ3JxL1l4WllGV0o0ak5aNDJxU3RSQnBZT01nOEhibkZyY1BwRnQ5?=
 =?utf-8?B?WkdremlPU3phS3cwQ0VZUUl4MGg1VG1xUjAzVkYza0lseUVBMFowbm5JWkty?=
 =?utf-8?B?MXNENzFSVTN0b3p2eEZHcC8ydHdnMWxCR3B1akFlNXp6MHFENHdNc2F1bVVY?=
 =?utf-8?B?NzhsR1l1NkhsSXhERXhqUit1YWQ0YzhiWi9BMHBKdkJZZEdqWm9yUWJFRmJP?=
 =?utf-8?B?SDkyaHVCYmpCbC95RzB3NzNVL09HbCsvR1V3YnU5RUROUGpveFdvSDN4YUd5?=
 =?utf-8?B?RjV3VjI0dXZOUjB6aVBpd0syYzZkTFp2MWtiSm81SUlOMVVwRVp3QTMzcHRh?=
 =?utf-8?B?cTFISWVQOVZUbVc4Q1gzcFIvTnltc1FsU1A5aXVjQm81SkMrZ2plRTJ2RmlP?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C9FC053CD875F44A41112E6C6889B46@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581cca92-c9ac-4b7c-1985-08de376b05dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 21:36:33.2048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4AsnrV3xAS7ugZiay7bC/YR6drNVCxPFrSxBrnsudaaScmRz0IgAmJVOuytPCVF++YVNpWaLlHJVmNWOkWhLkhY4IKnJv2pdjSW7u6MvnP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8539
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

T24gTW9uLCAyMDI1LTEyLTA4IGF0IDE5OjIyIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBNdWx0aSBRdWV1ZSBpcyBhIG5ldyBtb2RlIG9mIGV4ZWN1dGlvbiBzdXBw
b3J0ZWQgYnkgdGhlIGNvbXB1dGUgYW5kDQo+IGJsaXR0ZXIgY29weSBjb21tYW5kIHN0cmVhbWVy
cyAoQ0NTIGFuZCBCQ1MsIHJlc3BlY3RpdmVseSkuIEl0IGlzIGFuDQo+IGVuaGFuY2VtZW50IG9m
IHRoZSBleGlzdGluZyBoYXJkd2FyZSBhcmNoaXRlY3R1cmUgYW5kIGxldmVyYWdlcyB0aGUNCj4g
c2FtZSBzdWJtaXNzaW9uIG1vZGVsLiBJdCBlbmFibGVzIHN1cHBvcnQgZm9yIGVmZmljaWVudCwg
cGFyYWxsZWwNCj4gZXhlY3V0aW9uIG9mIG11bHRpcGxlIHF1ZXVlcyB3aXRoaW4gYSBzaW5nbGUg
Y29udGV4dC4NCj4gDQo+IEFkZCB2YWxpZGF0aW9uIHN1cHBvcnQgZm9yIG11bHRpLXF1ZXVlIGZl
YXR1cmUuDQo+IA0KPiBUaGlzIHJlcXVpcmVzIFhlS01EIG11bHRpLXF1ZXVlIHN1cHBvcnQgcG9z
dGVkIGhlcmUsDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU2
ODY1Lw0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBVcGRhdGUgeGVfZXhlY19xdWV1ZV9wcm9w
ZXJ0eUBpbnZhbGlkLXByb3BlcnR5IHRlc3QNCj4gLSBVc2UgbWFjcm8gaW5zdGVhZCBvZiBoYXJk
Y29kaW5nDQo+IC0gVXNlIHByb3BlciBtYWNybyBhbmQgdmFyaWFibGUgbmFtZXMNCj4gLSBSZW1v
dmUgc2ltdWxhdGlvbiByZWxhdGVkIGNvZGUNCj4gLSBFbnN1cmUgdmlydHVhbCB0ZXN0IHJ1bnMg
d2l0aCBzaW5nbGUgZW5naW5lIGluc3RhbmNlDQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIElt
cG9ydCBrZXJuZWwgdWFwaSBjaGFuZ2VzDQo+IC0gUmVtb3ZlIGJlbG93IHBhdGNoIHdoaWNoIGlz
IG5vIGxvbmdlciBuZWVkZWQNCj4gwqAgJ3Rlc3RzL2ludGVsL3hlX2V4ZWNfcXVldWVfcHJvcGVy
dHk6IFVwZGF0ZSBpbnZhbGlkLXByb3BlcnR5IHRlc3QnDQoNCkFoIG5pY2UsIEkgaGFkIG1pc3Nl
ZCBNYXR0J3MgcGF0Y2g6DQp0ZXN0cy9pbnRlbC94ZV9leGVjX3F1ZXVlX3Byb3BlcnR5OiBVc2Ug
c2luZ2xlIGludmFsaWQgcHJvcGVydHkNCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gLSBSZW1vdmUg
cmVkdW5kYW50IHByZWVtcHRfbW9kZSBjaGVjaw0KPiAtIENvbW1lbnRzIHVwZGF0ZSwgbWlub3Ig
Y29kZSByZWZhY3Rvcg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhh
cHVyYQ0KPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+DQo+IA0KPiBOYWtz
aHRyYSBHb3lhbCAoMSk6DQo+IMKgIHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWU6IEFk
ZCBmYXVsdCBtb2RlIHRlc3QNCj4gDQo+IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgKDE1KToN
Cj4gwqAgZHJtLXVhcGkveGU6IFN5bmMgd2l0aCBNdWx0aS1RdWV1ZSB1YXBpDQo+IMKgIHRlc3Rz
L2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWU6IEFkZCB4ZV9leGVjX211bHRpX3F1ZXVlIHRlc3QN
Cj4gwqAgdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZTogVmFsaWRhdGUgZXhlYyBzdWJt
aXNzaW9ucw0KPiDCoCB0ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlOiBWYWxpZGF0ZSBx
dWV1ZSBwcmlvcml0eSBzZXR0aW5nDQo+IMKgIHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVl
dWU6IEFkZCBjbG9zZS1mZCB0ZXN0cw0KPiDCoCB0ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1
ZXVlOiBBZGQgbXVsdGlwbGUgcGxhY2VtZW50IHRlc3QNCj4gwqAgdGVzdHMvaW50ZWwveGVfZXhl
Y19tdWx0aV9xdWV1ZTogQWRkIHByZWVtcHQgbW9kZSB0ZXN0DQo+IMKgIGxpYi94ZTogQWRkIGV4
ZWNfcXVldWUgc2V0X3Byb3BlcnR5IGlvY3RsIHN1cHBvcnQNCj4gwqAgdGVzdHMvaW50ZWwveGVf
ZXhlY19tdWx0aV9xdWV1ZTogQWRkIGR5bmFtaWMgcHJpb3JpdHkgdGVzdA0KPiDCoCB0ZXN0cy9p
bnRlbC94ZV9leGVjX211bHRpX3F1ZXVlOiBBZGQgdXNlcnB0ciBpbnZhbGlkYXRpb24gdGVzdHMN
Cj4gwqAgbGliL3hlL3hlX3NwaW46IEFkZCBzd2l0Y2ggcG9pbnQgZm9yIHByZWVtcHRpYmxlIHNw
aW5uZXINCj4gwqAgdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZTogQWRkIHByaW9yaXR5
IHRlc3QNCj4gwqAgdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZTogQWRkIHN1Ym1pc3Np
b24gc2FuaXR5IHRlc3QNCj4gwqAgdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZTogU2Fu
aXR5IHRlc3QgS0VFUF9BQ1RJVkUgZmxhZw0KPiDCoCB0ZXN0cy9pbnRlbC94ZV9leGVjX211bHRp
X3F1ZXVlOiBLZWVwIGdyb3VwIGFjdGl2ZSBpbiBleGVjLXNhbml0eQ0KPiANCj4gTmlzaGl0IFNo
YXJtYSAoMSk6DQo+IMKgIGxpYi94ZTogQWRkIG11bHRpLXF1ZXVlIGhlbHBlciByb3V0aW5lcw0K
PiANCj4gUHJpeWFua2EgRGFuZGFtdWRpICgxKToNCj4gwqAgdGVzdHMvaW50ZWwveGVfZXhlY19t
dWx0aV9xdWV1ZTogQWRkIG11bHRpIHF1ZXVlcyB3aXRoIFNNRU0NCj4gDQo+IMKgaW5jbHVkZS9k
cm0tdWFwaS94ZV9kcm0uaMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNDQgKysNCj4gwqBpbmNsdWRl
L2ludGVsX2dwdV9jb21tYW5kcy5owqDCoMKgwqDCoCB8wqDCoMKgIDEgKw0KPiDCoGxpYi94ZS94
ZV9pb2N0bC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMjcgKw0KPiDC
oGxpYi94ZS94ZV9pb2N0bC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDC
oCA0ICsNCj4gwqBsaWIveGUveGVfcXVlcnkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgIDIyICsNCj4gwqBsaWIveGUveGVfcXVlcnkuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgwqAgOCArDQo+IMKgbGliL3hlL3hlX3NwaW4uY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNDEgKysNCj4gwqBsaWIveGUveGVfc3Bpbi5o
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDMgKw0KPiDCoHRlc3Rz
L2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYyB8IDExNDUNCj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gwqB0ZXN0cy9tZXNvbi5idWlsZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqAgMSArDQo+IMKgMTAgZmlsZXMgY2hhbmdlZCwgMTI5NiBpbnNlcnRp
b25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlf
cXVldWUuYw0KPiANCg0K

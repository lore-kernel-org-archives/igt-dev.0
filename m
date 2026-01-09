Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D591D1A616
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 12:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF2510E8AF;
	Fri,  9 Jan 2026 12:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1ZEW6Z9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7991410E8AB
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 12:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767962104; x=1799498104;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=z+XrOc4NEqxkXsUuCFybsy2LVphDXkjKMTl6+qT7a7I=;
 b=A1ZEW6Z9lD2mkv1FdSBVYT2M/HWaD4ckHGgeZhDSul44Lgx/pBEUynK3
 ZW4S0Mc6Vlv7bNJWn0gKiXUiMlhkjSCQSMp1Z6jWwxznZLjxIRY7nDjHr
 1Bl/kfSpJ8YE1gf2ulYIJkJrM+CS3elbdZOgIzHRhZ+yzOxiL0LHa6uPB
 IuCnlw5MmzvR96e87l6I5grqAlieFfiEtaO6HWZZZTa+uHoyHUi4enh6w
 Zs8qU/NS4Ef/itUBeL8vhIKOJddtfwAw3C65tmHovP14Og5KUkVzPZr0O
 nDe7FcTewmD1aZp6UWpiVKDi0z47Hnqaho3y255GBwDjKrMD2gdtoXlgq A==;
X-CSE-ConnectionGUID: 93wjbrD1QVOauJVzD0jUSQ==
X-CSE-MsgGUID: M+zO+XaATHyd3tiPpZ8ZoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73189391"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="73189391"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 04:35:03 -0800
X-CSE-ConnectionGUID: RCYx54ESQDqWKSXIssvIhw==
X-CSE-MsgGUID: 4a782TKwSIa/HduUaa4GYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="234170651"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 04:35:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 04:35:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 04:35:02 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 04:35:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ox1OauL7716CW7vDV3nacHitf/eq/ioRPpNPrPjpLukYAiqMBHywDBv7NVsOs7wJgX7sWchdzAy/oz+6jau2YpbtaeEBSkvoTut4GoYi69R8xk4c+o33WT0MtKaXiOifZe35UKmfiWpTSInWxO0X8oqaqkKiuf4PTKI2aTw8ir3ftxb2hQhtbtx/jOXWEPv61+iCOWYWHBngWwtPItTzWYegmbyMA/4eZGaeMf/qI1fU7nGACP42f0MMBYQpdjmUqUmhOooZFnfk4kohIofRsBl7uwkoxtrZx0BQf40M03/1H+eiRRVEZm/EqDkzjVMmeZh/jPKg2tN216ROZFRxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+XrOc4NEqxkXsUuCFybsy2LVphDXkjKMTl6+qT7a7I=;
 b=w2L3MSF+XOJ15d9IM1Xe84ChgcixMDITe6ZNlCHXRiFX4cFsw4BIj00EjBzYsQ49t44f9/gXjYdOWhuMsoDM9lLfjBRNuTs4obwNxDLZYb1jUGyu8IPdQ7NBuoARtE+UJKUnTBxJJymSg07w+IGkiIM7Wwv283CHf2bCUFTRiNgQlPoix0hJ3fomMRa+NcOsivYVeNU3e18T1XxP+pBBFj+vvR0riRs+fPrT7n/xodssaw5BJoNX8Qm6RoHvMhntxXPaE1XUE2Cj5CG3cDkbgPs0ispZrzGk/0WY5d+keUeA4TMeF5axmAd60Hjyg9JXvhha2FyI1aSJTGXdshilLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by MW6PR11MB8337.namprd11.prod.outlook.com
 (2603:10b6:303:248::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 12:35:00 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::7d8a:7d6c:1fea:d900]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::7d8a:7d6c:1fea:d900%8]) with mapi id 15.20.9499.001; Fri, 9 Jan 2026
 12:35:00 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sousa,
 Gustavo" <gustavo.sousa@intel.com>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Musial, Ewelina"
 <ewelina.musial@intel.com>
Subject: Re: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
Thread-Topic: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
Thread-Index: AQHcgJeah90dv4PYHkuvgQXu3BPNv7VIOVAAgAA/ToCAAUzugIAAAgGA
Date: Fri, 9 Jan 2026 12:34:59 +0000
Message-ID: <463610789c550d17cdf06f11504cca730da2f581.camel@intel.com>
References: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
 <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
 <176780133253.14086.11727954615085076706@intel.com>
 <CAJ=qYWQ+Kq1egCr3U1rVCyo-jo57rzGUDyqF3Z30WRJ4-LmKYw@mail.gmail.com>
 <20260108120845.o34q2kszyy73pbky@kamilkon-DESK.igk.intel.com>
 <b2954021c862f98c125f9f2d46726c453a13ee7b.camel@intel.com>
 <CAJ=qYWRKyHKemgWceWHJQWKhjOwTtmf3bpTi_4H6dUYqrwQ4KA@mail.gmail.com>
 <20260109122749.only7q7zrom3uuqq@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260109122749.only7q7zrom3uuqq@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF75D68BA1B:EE_|MW6PR11MB8337:EE_
x-ms-office365-filtering-correlation-id: 205d83d6-f76a-4887-eb43-08de4f7b8135
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bEJ6Tkd1THk4MnNFVVpIT1c0Rnl5VVBkNmZWeXVIVElacTFkWUxBN0tUVDVG?=
 =?utf-8?B?NHUvM1JqV2pZcTNnQTFPMmNmcVdBSmZmOUo5WVRHM2RhKzdza25tNDNEUGZ1?=
 =?utf-8?B?OHR4N0plSEJVV2wxK2hWenZRdmdZT1ladExHa2ovb21hTmY5a1RHelk0TmFH?=
 =?utf-8?B?VHVpNG5WeDFkYWZDczJpNG5ydEpYMXh6UGV4Nm1iY0tsdklFanhESjVudEti?=
 =?utf-8?B?R0E5dlNvVGJsaGRYR3E4Q1BrS25sRWtldFhNZGdmVEo2c25HRXVNQmNEZFph?=
 =?utf-8?B?SzUwSjI2WkFWQnVvQmRFUzBtcnJWcmtSNTFNWnJBWm9CUDdlZ2FDV3hnTFpM?=
 =?utf-8?B?UzZVU1c5MW1yU3BpNmsrdlJaeHBiUmN3Z1B6T1ljaExYZHFVbVgvL1VhZ3Y4?=
 =?utf-8?B?M1JlWEVhWUJrbWE5cDhxdmhTd3dFRHlKbVMxMWY5WXhwS2YzdWFtM3NLUlJn?=
 =?utf-8?B?QUVmSVRLVzZIdC9xcEpWYmpBakNmWVAvRHk3Y1h5Zms5eFB5SFgwQTNmZkwr?=
 =?utf-8?B?b2hrWEZoNDBrTHREdnZWVWlDVEVMbDhRa1NpQlg5ckVIbzJZZjkreGpUSTFq?=
 =?utf-8?B?MVZsaDAvYzlGT0lvWUdtcUphcENoRysvQUJWaHZlM1RXNWppR1JhR1h5QlZ1?=
 =?utf-8?B?M3pXN3gwRXZBNnl3bE1ISy9pektvTTNpRVlXcmh6aW5yRjJtejgwakp6b3Z1?=
 =?utf-8?B?TXJGTGNFOFJSd0RaVGMycURKV1JGT3F6a21wYjhzRmxqbGRsdEl3ZktkTGhR?=
 =?utf-8?B?RHIvUG5zV2dvQnR1ay9oNTA2V2JQMFBjNWp6MVVpd2hwVkx6NVl6VUVVTEZt?=
 =?utf-8?B?Q2x5eHdyVU1MVzVoRXNWTC96WGZWZ2ZBWm1KMklCcERISGZKUjdmc0VKNkdr?=
 =?utf-8?B?cGxESVIrSXJ3UFQzUC9vbW1tRmZpYk1JVTN3c0E4enphSW5MUkx5QkdWckhL?=
 =?utf-8?B?SDFveTJHRUI5VVRUN1JLYy9sNDBweE1qdXdCSDdIcGkweTBLdXRkMXh0MFpR?=
 =?utf-8?B?aXhSR1F0VEYydWVaeVdhMEx1alNQU0toRmpKTTZzZnpZVmZQd1pGU1AvRE1j?=
 =?utf-8?B?V1dqK2lzbUszSmd1YVppQjJWWkNaVjVjOGJ0U1QzMzNvVlNPelIwRHluMTIy?=
 =?utf-8?B?blNNS2x0Sjkxc285Nm9MbmJGd1ZGYmRaTnlNTU9VUVdveWNCYk1YMk16NzJk?=
 =?utf-8?B?TW5qaTgyM3FVdTQ3WFN0VmZYdllNbXpkY2VBVk9YamE2blJDNFFwdGRRL2ZQ?=
 =?utf-8?B?UFpoT284YXlSeUpMeDVjOFcvUmE1SFVKcldHL2NnK1A5TkVKbjErY1JuMnMx?=
 =?utf-8?B?aUpxLzdQS0VaVUplcGROQVdXQ2QvdTRXdTB0ZldMcTZkTVZWaTFWYncvUFFo?=
 =?utf-8?B?ZWw0MDZ5L3BWQko3VHNUMENZMEFqMDR3UkNycnFvY3FKa3lCNmNVQnMzb0g2?=
 =?utf-8?B?bGRpeHFsVklrUlR2aWN0eVBxOFp4M0owVVNFU1NzdzdUdGx1SG5yMUl0amlk?=
 =?utf-8?B?TkdmWVc2bGU2ekJSM2ZLVE1RTUwxb3dZSjZSRkR4eVNjcGI0T0hRcGRLT1Zj?=
 =?utf-8?B?dVRVazcweUZQYnRDVklNYWxDTU9KNmUxTS8xUDIyUkwrVmdnVkpzZUtXN1ZI?=
 =?utf-8?B?S3F3ZFF3Mk5wYldENVhKUHJtTUdESEpTbGJqMG51TjQ4dnU3dzBzaFVvTlRP?=
 =?utf-8?B?K3ROTlR5emJWakFtVngwUEpuR3lLZXJnSlFOS2hzMXF3R2Y1RHIxYk9zaEps?=
 =?utf-8?B?ekJWbkl2WFErZS9hYkdXaFBUTGdSMXNpVUFnTXlOS1cyb2NyZ0FVRVVYS3N4?=
 =?utf-8?B?Yi9ZSjFDbDVLYkU3TktLUE1PUDViRFQydVBwaUNvTHJqMjFUM3NSc0VXWE5M?=
 =?utf-8?B?RmplZzRjQjBrS05RRlorK0xHaHk1MVNTMHJ3Y3FJNlVUWSswNDFsWWZMWFJj?=
 =?utf-8?B?dWx2Z2dWSDdXcmg4VWRDMjhXcEhJTDk4VzFOeC81SzljK05lSExmd0N5c2Vq?=
 =?utf-8?B?cklFQWFyVFNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF75D68BA1B.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWErWDdhQnhWYjJPRDM4KzZ6bGFlc2N5NTQ4RmNEUEpsek1QSWpsZlJoTFY3?=
 =?utf-8?B?Nk01Y3JvUkV2M1FaSHNGU0xXM3JFUXJNSDRPb1E1Z3FaZVl4WGM1RHVJOERJ?=
 =?utf-8?B?R3BoemEva0dGM2ZOaFpvcDczSWlvN0xFeHkwZDRDV3lHNnRyYXZnNHo5S1Bi?=
 =?utf-8?B?dnhyOTA2Q2tNVkJaNnZwK1pPeWVuSVJLS0t3U2lvQVRHUkFBOTdBakQrRlhH?=
 =?utf-8?B?Y0FwdlZ4WkVzZ2lGSHVZR3hsK1IzaFA5YU53U2x4VklGQW1wenRyTmJjOERy?=
 =?utf-8?B?SGVRRGVCbmc2a08xN2I2NXRnckFZZG9XbEUyOUt4TFpxQkFjK0REYnhES3Vh?=
 =?utf-8?B?V2lhbGtzdTFXRVIxZTNZZ0tiRWhOem15R0UwMHlXdDJveE9WUXF0dU41Q0Ns?=
 =?utf-8?B?YkNINE9sTnVTWWxDSFRrTE1oa1JrYlVnTTQvUDNKejRRTklzY3FQVExsWmxV?=
 =?utf-8?B?TlJoS3h1M0o5L2REbXhPYjVnT1k2bHZRVDVlSG1wTWw5eXF4NEJOVHdrZGhs?=
 =?utf-8?B?WndYVXJyRjhjNHh3YTI2TjNVbjdmMzdpeCtqOURweWJEN2R6RVIxUXhQT0tQ?=
 =?utf-8?B?SFVWaW8yTlpkdTE3TldlR2hZdUpyMm9SU0VSQXg1NHU3dHFONzZkTHd3Q3A0?=
 =?utf-8?B?VURtOVJWNXRwR2JrdWlNaTBZdm43UzZaVDVGVmhqZk55QmhPb0VNNmpnMmcw?=
 =?utf-8?B?K3VoaVJyYy8xWjQ1cG52UzJ1MC9RdTF4Mk1aWjlMemljRmhLQmVIdllVN2w2?=
 =?utf-8?B?WTZUbG1SU1ZwTE96MW5haVdmMHVtSmpuendJOHZOc3pCWW9yZnVCQml2YmVH?=
 =?utf-8?B?L3RIK1ZJNStPVW4rN0pyM0lTYTdUUkxvTlBKdFpQQ0lTSUpLcTdwbTZTL3FD?=
 =?utf-8?B?RTVwY0Z0UURRUTZrUmRtN20zOXl0dnRLL25hL25ZSTczWGxNQStaTS85NEc2?=
 =?utf-8?B?SWRVNGZnaTA4dmNhdWFkS1hBY3hzYmZubUpyN1pRd1JMNWF5WHd2QkJPUnNr?=
 =?utf-8?B?cXc1MmhISERiMWFxVytrMDR1MmNnU0NLT21IYUxHUkJDTjRtbVVjOTgyYlNC?=
 =?utf-8?B?Sy9NaVBMcDBnS1FVaWhMb1NWbDZ2MUdaZGhNdm0xUEcwbHFkakhYenFCaXRi?=
 =?utf-8?B?SlVOR012M2d2NWRHYU16eXR0WEtQdmVoVE1kbjlhZDl0Mis2VDFLaHk0eHNG?=
 =?utf-8?B?Y0NubExnSC9HeXFoNzJsbEp6MEY5NFZ4MTEzQzQxbC9UcEE2alNneDhuNm1K?=
 =?utf-8?B?UnlRYjVTaHJxcld3U1BDU0RYcUdKa2RhdWlKT0VDWGt6ekdiamMyNFp2NFJG?=
 =?utf-8?B?R2lnR3ZTdnk3WkNGN1p0Qi9LT3ZMVkN1OTIwZ2NLWStZNGtreTVoR1NxVkpE?=
 =?utf-8?B?enFZWGFKNDdnS2pWMjlLdGNNQlhFTWNMckd2THQ4SWdKczdkKzdubWlwVEs2?=
 =?utf-8?B?UHQ5VFlPQjY5VU5CQ2JWczZFYm9zSnI5ZVhMRDJwRjg0OGNDZjQzdGhZN05V?=
 =?utf-8?B?K1ZLRFFKdWo2QVZzakxQZ1pJNE1ZNHpQMnJJc091SjdvMFEzaVZjWGNMUUJP?=
 =?utf-8?B?TEM0UkxJdG1kbElHMnA0VHZXZUxxbzNzazdYemtGZVlraXY3THdpNUVWREov?=
 =?utf-8?B?dXdLSVBqSzdadE14cVJWNzRuT1V6aVRDMCtHQXVNVVRvUzdUYVluYWNPUXFR?=
 =?utf-8?B?bkxnUTMvendQdEdCUE9tSHhnOS9kS2tHeEdpR0toT243WWZ3a2VYQWxxOGRF?=
 =?utf-8?B?ekgyQ3ZjWFhqSHpNcHdQSGVjTENFM2FOZG42MXp3dFdLWkxnMjAzQWdlRE8z?=
 =?utf-8?B?dis2Ynh6R1NiNWhNekU5V013c3JZOEkvcTdYYlNWd2Z4UUdGdW1BMDlpcGl3?=
 =?utf-8?B?S2pqOXY5WG51bndEU3B6STdtdTZJQzZtTmV5YjFKbTNLa2lWbVZ4QUdQdHJS?=
 =?utf-8?B?TWwyRlE2eGQ0YlRnemo3UXdPMTY2bmsrdTBCK09EMGNWdkJFRFIzOGlWTnNw?=
 =?utf-8?B?dW9SUTdpc2p0QUpvSmxQandXTGduL2gwaVRwZFdnLzU4UG80S012S25QOXAv?=
 =?utf-8?B?cFNtczMyN0F4a1kzcnBqZXNIdEZPdVJVMlczSHc5ZHlWUHIwKzBLVlRTWEZH?=
 =?utf-8?B?ZERFK2xFWGNCK2ZnZ3ZRTFVJdkN1WnVuR29vaGYzOEhFck1jZEVsVlRCeFFF?=
 =?utf-8?B?SVlyeVNvWTFIOHJtMkVjK1BRWXJpRUtDV2hpZC9ZNVF2ZUVISUtEOTAyR1BR?=
 =?utf-8?B?cVBqbUJjM3haZER0Zk9zSG1YWHBqY0d2UHptWVJwK2g2UzlXeDVHYkVTNnE3?=
 =?utf-8?B?cThSNEM4ZUFqZUpBNHhFTzlnRkRNMVRKZHFsYUNmUTZKN1ZIbXl1YjZWbE44?=
 =?utf-8?Q?DS5WWnIdoXGvsB8A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22AA926F9C01A140825B4C7162748376@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205d83d6-f76a-4887-eb43-08de4f7b8135
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 12:34:59.9968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qs9DPgFPHbHnY+jTdQ8dxoISpygMmHZ/Jl+XmZLgEmHudxl0uoTsPZ+V+0oydOiGqPHe1T3c53wz6dtmSSh4Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8337
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

T24gRnJpLCAyMDI2LTAxLTA5IGF0IDEzOjI3ICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEp1aGEtUGVra2EsDQo+IE9uIDIwMjYtMDEtMDggYXQgMTg6MzY6MTMgKzAyMDAsIEp1
aGEtUGVra2EgSGVpa2tpbMOkIHdyb3RlOg0KPiA+IE9uIFRodSwgSmFuIDgsIDIwMjYgYXQgMjo0
OeKAr1BNIEtub3AsIFJ5c3phcmQgPHJ5c3phcmQua25vcEBpbnRlbC5jb20+IHdyb3RlOg0KPiA+
ID4gDQo+ID4gPiBPbiBUaHUsIDIwMjYtMDEtMDggYXQgMTM6MDggKzAxMDAsIEthbWlsIEtvbmll
Y3pueSB3cm90ZToNCj4gPiA+ID4gSGkgSnVoYS1QZWtrYSwNCj4gPiA+ID4gT24gMjAyNi0wMS0w
NyBhdCAxODo0OTo1MiArMDIwMCwgSnVoYS1QZWtrYSBIZWlra2lsw6Qgd3JvdGU6DQo+ID4gPiA+
ID4gT24gV2VkLCBKYW4gNywgMjAyNiBhdCA1OjU14oCvUE0gR3VzdGF2byBTb3VzYSA8Z3VzdGF2
by5zb3VzYUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBRdW90
aW5nIEp1aGEtUGVra2EgSGVpa2tpbGEgKDIwMjYtMDEtMDcgMTI6MTA6MDQtMDM6MDApDQo+ID4g
PiA+ID4gPiA+IEhlcmUgYWRkZWQgY29tcHJlc3MtanMgcGFyYW1ldGVyIGZvciBydW5uZXIuIFdo
YXQgaXQgZG9lcyBpcyBhdCBwZXIgdGVzdCBsZXZlbA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiBNYXliZSByZW5hbWUgaXQgdG8gLS1jb21wcmVzcy1qc29uLWRtZXNnIHRvIGJlIG1vcmUgcHJl
Y2lzZT8NCj4gDQo+IE9yIC0tY29tcHJlc3MtZG1lc2cgYXMgdGhpcyBpcyB3aGF0IGlzIHdyaXR0
ZW4gaW4gbWV0YWRhdGEudHh0DQo+IA0KPiBXaGlsZSB0aGlzIGNvbXByZXNzaW9uIGxvb2tzIHVz
ZWZ1bGwsIHBsZWFzZSB0cnkgaXQgZmlyc3QNCj4gd2l0aCBpZ3QgdHJ5Ym90IHdpdGggb25seSB0
ZXN0cyB3aGljaCBzaG91bGQgZmFpbCAodGFrZSB0aGVtDQo+IGZyb20gZnVsbCBpOTE1IHJ1bikg
YXMgdGhlcmUgYXJlIHByb2JsZW1zIHdpdGggZXJyb3IgcmVwb3J0aW5nLg0KDQpWaXN1YWxpemF0
aW9uLCBDQkwgcmVwb3J0aW5nIGFuZCBhIGZldyBvdGhlciBDSSBwaXBlbGluZSBjb21wb25lbnRz
DQp3aWxsIHN0b3Agd29ya2luZyBwcm9wZXJseSB3aXRoIHRoaXMgY2hhbmdlLg0KDQo+IEl0IGxv
b2tzIGxpa2UgdGhlcmUgaXMgbm8gZG1lc2cgc2VjdGlvbiBub3cgZm9yIGFsbCBmYWlsZWQgdGVz
dHMuDQo+IE1heWJlIGl0IHdpbGwgd29yayB3aXRoIGEgc2VjdGlvbiByZW5hbWVkIGludG8gY29t
cHJlc3NlZC1kbXNnPw0KPiANCj4gVGhpcyB3aWxsIGFsc28gaGluZGVyIGN1cnJlbnQgZXJyb3Ig
cmVwb3J0aW5nIGFzIHRoZXJlIGFyZQ0KPiBub3QgZXZlbiBzaW5nbGUgZXJyb3IgbGluZSBpbiBk
bWVzZyA6KA0KPiBGb3IgZXhhbXBsZToNCj4gDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9y
Zy90cmVlL2RybS10aXAvSUdUUFdfMTQzMDgvc2hhcmQtdGdsdS03L2lndEBpOTE1X21vZHVsZV9s
b2FkQGZhdWx0LWluamVjdGlvbkBpbnRlbF9jb25uZWN0b3JfcmVnaXN0ZXIuaHRtbA0KPiANCj4g
dGhlcmUgaXMgZG1lc2ctd2FybiBidXQgbm9uZSBpcyBzaG93biBpbiByZXBvcnQuDQo+IA0KPiBS
ZWdhcmRzLA0KPiBLYW1pbA0KPiANCj4gPiA+ID4gDQo+ID4gPiA+IENhbiB3ZSBoYXZlIGl0IGFu
IG9wdGlvbiBmb3IgdXNpbmcgb3V0c2lkZSBjb21wcmVzc29yPyBMaWtlOg0KPiA+ID4gPiAtLWNv
bXByZXNzLXdpdGg9eHoNCj4gPiA+ID4gDQo+ID4gPiA+IEkgdGVzdGVkIGJvdGggZ3ppcCBhbmQg
eHogYW5kIHRoZSBsYXR0ZXIgd2FzIGV2ZW4gYmV0dGVyLg0KPiA+ID4gPiB6bGliIGNvdWxkIGJl
IGhvbGQgYXMgYSBmYWxsLXRocm91Z2gsIHdoZW4gbm8gb24tc3lzdGVtIGlzDQo+ID4gPiA+IGF2
YWlsYWJlIG9yIG9uZSBnaXZlbiBpbiBvcHRpb24gZG8gbm90IHdvcmsuDQo+ID4gPiANCj4gPiA+
IFRoZXJlJ3MgYWxzbyB6c3RkIHdoaWNoIGNvbXByZXNzZXMgYmV0dGVyIGFuZCBmYXN0ZXIgdGhh
biBhbGwgb2YgdGhlDQo+ID4gPiBhYm92ZSAodGVzdGVkIG9uIGFyY2hpdmVkLCBjb21wbGV0ZSBy
ZXN1bHRzLmpzb24pLg0KPiA+ID4gDQo+ID4gDQo+ID4gQ29tcHJlc3Npb24gc2NoZW1lIGlzIG5v
dCBkaWZmaWN1bHQgdG8gY2hhbmdlIG9uIHRoaXM7IGFzIEkgc2VlIGl0IHRoZQ0KPiA+IG9ubHkg
dGhpbmcgdG8gY29uc2lkZXIgaXMgYWxsIHRob3NlIHBsYWNlcyB3aGVyZSBjb21wcmVzc2lvbiB3
b3VsZA0KPiA+IG5lZWQgdG8gYmUgb3BlbmVkLCB0aGV5IHdvdWxkIGJlIGFibGUgdG8gZG8gaXQu
DQo+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gWWVhLCB0aGF0IGNhbiBiZSBjaGFuZ2VkLiBJ
J20gd2FpdGluZyB0byBoZWFyIGFsc28gZnJvbSBDSSBwZW9wbGUsIEkNCj4gPiA+ID4gPiBjb3Vs
ZCd2ZSBnb25lIGFuZCBjb21wcmVzc2VkIHRob3NlIG90aGVyIGZpZWxkcyB0b28gYnV0IEkgdW5k
ZXJzdG9vZA0KPiA+ID4gPiA+IGZyb20gQ0kgcGVvcGxlIHRoZXkgd2FudCB0byBrZWVwIHRoaW5n
cyBzZWFyY2hhYmxlLCBoZW5jZSBmb3Igbm93IEkNCj4gPiA+ID4gPiBkaWQgc3RpY2sganVzdCB3
aXRoIGRtZXNnIGFzIHRob3NlIGFyZSBhbHdheXMgdGhlIGJpZ2dlc3QgYmxvYnMuDQo+ID4gPiA+
ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiArY2MgUnlzemFyZCBhbmQgRXdlbGluYQ0KPiA+ID4gPiBD
YzogRXdlbGluYSBNdXNpYWwgPGV3ZWxpbmEubXVzaWFsQGludGVsLmNvbT4NCj4gPiA+ID4gQ2M6
IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gSSBk
b24ndCBsaWtlIHRoaXMgdGJoOg0KPiA+ID4gDQo+ID4gPiAtIENvbXByZXNzaW5nIGluZGl2aWR1
YWwga2V5cyB3aXRoaW4gdGhlIGRvY3VtZW50IGNhdXNlcyB0aGUgb3ZlcmFsbA0KPiA+ID4gZG9j
dW1lbnQgdG8gY29tcHJlc3Mgc2lnbmlmaWNhbnRseSB3b3JzZS4gV2UgYWxyZWFkeSBhcmNoaXZl
IGNvbXByZXNzZWQNCj4gPiA+IGxvZ3MgZm9yIHNvbWUgcGlwZWxpbmVzLCBhbmQgdGhvc2Ugd291
bGQgbmVlZCBmYXIgbW9yZSBzcGFjZSB3aXRoIHRoaXMuDQo+ID4gPiAoVGhpcyBkb2VzIG5vdCBo
YXBwZW4gZXZlcnl3aGVyZSBiZWNhdXNlIHNvbWUgbGVnYWN5IHNjcmlwdHMgaGF2ZQ0KPiA+ID4g
aXNzdWVzIHdpdGggY29tcHJlc3NlZCBsb2dzLCBidXQgZG9pbmcgaXQgaGVyZSB3b3VsZCBub3Qg
cmVhbGx5IHNvbHZlDQo+ID4gPiB0aGUgcHJvYmxlbSwgcmF0aGVyIGRlbGF5IGl0IGEgYml0LikN
Cj4gPiANCj4gPiBJIHVuZGVyc3RhbmQgY29uY2VybiByZWdhcmRpbmcgZG91YmxlIGNvbXByZXNz
aW9uIGVmZmljaWVuY3kgKGFuZCB0aGUNCj4gPiBiYXNlNjQgb3ZlcmhlYWQpLCBidXQgJ3dvdWxk
IG5lZWQgZmFyIG1vcmUgc3BhY2UnIHNlZW1zIGxpa2UgYSBzdHJvbmcNCj4gPiBjbGFpbS4gV2hp
bGUgSSBhZ3JlZSB0aGUgb3V0ZXIgYXJjaGl2YWwgY29tcHJlc3Npb24gd29uJ3QgYmUgYWJsZSB0
bw0KPiA+IHJlLWNvbXByZXNzIHRoZXNlIGtleXMsIHRoZSBpbnB1dCBmaWxlIGl0c2VsZiBpcyBl
c3NlbnRpYWxseSBzbWFsbGVyLg0KPiA+IEV2ZW4gd2l0aCB0aGUgYmFzZTY0IG92ZXJoZWFkIGFu
ZCB0aGUgbG9zcyBvZiAic2Vjb25kIHBhc3MiDQo+ID4gY29tcHJlc3Npb24sIEkgd291bGRuJ3Qg
ZXhwZWN0IHRoZSBmaW5hbCBhcmNoaXZlIHRvIGJlIHNpZ25pZmljYW50bHkNCj4gPiBsYXJnZXIg
dGhhbiBjdXJyZW50IHJhdyBsb2dzLg0KPiA+IA0KPiA+ID4gDQo+ID4gPiAtIFRoaXMgYWxzbyBk
b2VzIG5vdCBzb2x2ZSB0aGUgMkdCIGZpbGUgbGltaXQgZm9yIGpzb24tYy4gWW91IGNhbiBzdGls
bA0KPiA+ID4gaGl0IGl0IHdpdGggZGlmZmljdWx0IHRvIGNvbXByZXNzIGxvZ3MsIGFuZCBzaW5j
ZSB5b3UncmUgZG9pbmcgaXQgcGVyDQo+ID4gPiBrZXksIHRoZSBjb21wcmVzc2lvbiByYXRpbyBp
cyBub3QgdGhhdCBncmVhdC4gVGhlIHNvbHV0aW9uIGhlcmUgaXMgdG8NCj4gPiA+IHN3aXRjaCB0
aGlzIGxpYnJhcnkgdG8gc29tZXRoaW5nIGVsc2UsIGxpa2UgSmFuc3NvbiBvciB5eWpzb24sIHdo
aWNoDQo+ID4gPiBoYW5kbGUgPjJHQiBjYXNlcyBqdXN0IGZpbmUuDQo+ID4gDQo+ID4gTGV0J3Mg
bm90IGZvcmdldCB3ZSdyZSB0YWxraW5nIGFib3V0IGxvZ3MgaGVyZSB3aGljaCBkb24ndCBoYXZl
IGJpbmFyeQ0KPiA+IGRhdGEsIGFueSBkZWZsYXRlIGFsZ29yaXRobSBzaG91bGQgd29yayBxdWl0
ZSB3ZWxsIG9uIHRob3NlLiBBcyBJDQo+ID4gdW5kZXJzdG9vZCBmcm9tIEthbWlsJ3Mgb2ZmbGlu
ZSBjb21tZW50ID4yR0IgYmVjYW1lIGxlc3MgdGhhbiAzMDBNQi4NCj4gPiBXaGlsZSBpdCBpcyBq
dXN0IG9uZSB0ZXN0IGl0IHN0aWxsIGRpZCBldmVuIGJldHRlciB0aGFuIG15IGxpbWl0ZWQNCj4g
PiB0ZXN0cy4gfjZ4IHJlZHVjdGlvbiB3b3VsZCBiZSBxdWl0ZSBtYXNzaXZlIHNhZmV0eSBtYXJn
aW4uDQo+ID4gDQo+ID4gPiANCj4gPiA+IC0gQ29tcHJlc3NlZCBieXRlcyAtPiBiYXNlNjQgdG8g
c2F2ZSB0aGVtIGluIHRoZSBKU09OIGFnYWluIG1ha2VzIHRoZQ0KPiA+ID4gY29tcHJlc3Npb24g
cmF0aW8gd29yc2UuIDooDQo+ID4gPiANCj4gPiA+IEluc3RlYWQgb2YgdGhpcyBjaGFuZ2UsIENJ
IHNpZGUgc2hvdWxkIGdldCB0aGUgdmlzdWFsaXplciBhbmQgaTkxNS0NCj4gPiA+IGluZnJhIHNj
cmlwdHMgbW9kaWZpZWQgdG8gaGFuZGxlIGNvbXByZXNzZWQgZmlsZXMgZXZlcnl3aGVyZS4NCj4g
PiANCj4gPiBJJ3ZlIGFscmVhZHkgaGFkIG1yIGdvaW5nIHRoaXMgZGlyZWN0aW9uIGJ1dCBub2Jv
ZHkgZXZlciBkaWQgdG91Y2ggaXQNCj4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
Z2Z4LWNpL2k5MTUtaW5mcmEvLS9tZXJnZV9yZXF1ZXN0cy8xMTINCg0KV2VsbCB0aGVyZSdzIGFs
c28gdGhpczoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTA3MTIz
Lw0KDQo+ID4gDQo+ID4gPiANCj4gPiA+IFRoYW5rcywgUnlzemFyZA0KPiA+ID4gDQo+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gZm9yIHJlc3VsdHMuanNvbiBpbiBkbWVzZyBrZXkgaXMgd3Jp
dHRlbiB0ZXh0ICJjb21wcmVzc2VkIiB0byBtYWludGFpbg0KPiA+ID4gPiA+ID4gPiBjb21wYXRp
YmlsaXR5IGFuZCBvbiB0aGUgc2lkZSBvZiBpdCBpcyB3cml0dGVuIG5ldyBrZXkgZG1lc2ctY29t
cHJlc3NlZCB3aGljaA0KPiA+ID4gPiA+ID4gPiBjb250YWluIGRtZXNnIHJhbiB0aHJvdWdoIHps
aWIgYW5kIGJhc2U2NCBlbmNvZGVkLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBTaG91bGQg
dGhpcyBiZSBvbmx5IGFib3V0IGNvbXByZXNzaW5nIGRtZXNnIGZvciByZXN1bHRzLmpzb24/IE9y
IHNob3VsZA0KPiA+ID4gPiA+ID4gd2UgdGFrZSBhIHN0ZXAgYmFjayBhbmQgbWFrZSBpdCBjb21w
cmVzcyB0aGUgZG1lc2cgZmlsZXMgaW4gdGhlIHJlc3VsdHMNCj4gPiA+ID4gPiA+IGRpcmVjdG9y
eSBhbmQgdGhlbiB0aGF0IHdvdWxkIGFsc28gYmUgcmVmbGVjdGVkIGluIHJlc3VsdHMuanNvbj8N
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGF0J3MgYSBwb3NzaWJpbGl0eTsgVEJIIEkganVzdCBk
aWRuJ3QgdGhpbmsgYWJvdXQgZG9pbmcgdGhhdCBhdA0KPiA+ID4gPiA+IGVhcmxpZXIgc3RhZ2Uu
IElkZWEgb24gdGhpcyBhbnl3YXkgaXMgdG8gc2F2ZSBzcGFjZSBvbiBDSSBzdG9yYWdlLg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gQ29tcHJlc3Npb24gaXMgb25lIHBvc3NpYmlsaXR5
IGJ1dCBpdCBkbyBub3Qgc29sdmUgcHJvYmxlbSB3aXRoDQo+ID4gPiA+IHZlcnkgYmlnIGxvZ3Ms
IGxpa2Ugb3ZlciAyR0IuIEkgd2FzIHRoaW5rbmluZyBhYm91dCBjdXR0aW5nIHN1Y2Nlc3NmdWxs
DQo+ID4gPiA+IGxvZyBpbnRvIG9ubHkgYmVnaW4rZW5kIGxpbmVzIG9mIGRtZXNnLCBzbyBkZXZl
bG9wZXJzIGNvdWxkIGZpbmQgdGhlbQ0KPiA+ID4gPiBsYXRlciBpbiBkbWVzZyBzYXZlZCBvdXRz
aWRlIG9mIGpzb24uIEFsc28gaXQgc2hvdWxkIGJlIGRvbmUgZm9yIGJpZyBvbmVzLA0KPiA+ID4g
PiBub3QgYWxsIG9mIHRoZW0uDQo+ID4gPiA+IA0KPiA+ID4gPiBCdHcgeW91ciBpZGVhIGlzIGdv
b2QgZm9yIElHVCBnaXRsYWIgaXNzdWU6DQo+ID4gPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy8tL2lzc3Vlcy8yMQ0KPiA+ID4gPiBbSUdUIHJ1bm5l
cl0gYWxsb3cgYXR0YWNobWVudHMgdG8gcmVzdWx0cy5qc29uDQo+ID4gPiA+IA0KPiA+ID4gPiBh
bmQgZmV3IG90aGVycyBhcm91bmQgaXQ6DQo+ID4gPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy8tL2lzc3Vlcy8yMg0KPiA+ID4gPiBbSUdUIHJ1bm5l
cl0gYWxsb3cgdGVzdHMgdG8gYXR0YWNoIHRlc3Qtc3BlY2lmaWMgcmVzdWx0cw0KPiA+ID4gPiAN
Cj4gPiA+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xz
Ly0vaXNzdWVzLzE0DQo+ID4gPiA+IFtpZ3RfcnVubmVyXSBDb2xsZWN0IHBzdG9yZSBkYXRhIGFu
ZCBhdHRhY2ggaXQgdG8gZG1lc2cgb3V0cHV0IHdoZW4gcmVzdW1pbmcgb3IgcmVwb3J0aW5nDQo+
ID4gPiA+IA0KPiA+ID4gPiBBbGwgb2YgdGhlbSByZWx5IG9uIHBvc3NpYmlsaXR5IHRvIGF0dGFj
aCBuZXcgZmlsZXMgaW50byByZXN1bHRzLg0KPiA+ID4gPiANCj4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gQnkgdGhlIHdheSwgZG8geW91IGtub3cgaWYgd2UgaGF2ZSBnb29kIGNvbXByZXNzaW9u
IHJhdGUgb24gZXhpc3RpbmcNCj4gPiA+ID4gPiA+IGRhdGE/DQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gT24gbXkgc3VwZXIgbGltaXRlZCB0ZXN0IHdpdGggdGhpcyBjaGFuZ2UsIHdpdGgga21zIHRl
c3RzIHRoZSBvdmVyYWxsDQo+ID4gPiA+ID4gc2l6ZSBvZiBqc29uIGNhbWUgZG93biB0byBhcm91
bmQgMS82IG9mIG9yaWdpbmFsIHNpemUuIEknbGwgc3RpbGwgbmVlZA0KPiA+ID4gPiA+IHRvIGV4
cGVyaW1lbnQgbW9yZSB3aXRoIHRoYXQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBI
bW0sIGxldCBtZSB0ZXN0IGl0IG9uIG9uZSBzYW1wbGUgd2hlcmUganNvbiBpdHNlbGYgd2FzID49
IDJHQg0KPiA+ID4gPiBhbmQgc2VlIGlmIGl0IGNvdWxkIGhlbHAuDQo+ID4gPiA+IA0KPiA+ID4g
PiBSZWdhcmRzLA0KPiA+ID4gPiBLYW1pbA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1aGEtUGVr
a2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+ID4gPiA+ID4gPiA+
IC0tLQ0KPiA+ID4gPiA+ID4gPiBydW5uZXIvcmVzdWx0Z2VuLmMgICAgfCAxMTcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ID4gPiA+ID4gPiA+IHJ1bm5lci9y
dW5uZXJfdGVzdHMuYyB8ICAgMiArDQo+ID4gPiA+ID4gPiA+IHJ1bm5lci9zZXR0aW5ncy5jICAg
ICB8ICAgNyArKysNCj4gPiA+ID4gPiA+ID4gcnVubmVyL3NldHRpbmdzLmggICAgIHwgICAxICsN
Cj4gPiA+ID4gPiA+ID4gNCBmaWxlcyBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKSwgMTUgZGVs
ZXRpb25zKC0pDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvcnVu
bmVyL3Jlc3VsdGdlbi5jIGIvcnVubmVyL3Jlc3VsdGdlbi5jDQo+ID4gPiA+ID4gPiA+IGluZGV4
IDFmN2U3OWYyNC4uZWY2Mzg1NTk4IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiAtLS0gYS9ydW5uZXIv
cmVzdWx0Z2VuLmMNCj4gPiA+ID4gPiA+ID4gKysrIGIvcnVubmVyL3Jlc3VsdGdlbi5jDQo+ID4g
PiA+ID4gPiA+IEBAIC04LDYgKzgsNyBAQA0KPiA+ID4gPiA+ID4gPiAjaW5jbHVkZSA8c3lzL3N0
YXQuaD4NCj4gPiA+ID4gPiA+ID4gI2luY2x1ZGUgPHN5cy90eXBlcy5oPg0KPiA+ID4gPiA+ID4g
PiAjaW5jbHVkZSA8dW5pc3RkLmg+DQo+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8emxpYi5oPg0K
PiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gI2luY2x1ZGUgPGpzb24uaD4NCj4gPiA+ID4g
PiA+ID4gDQo+IFtjdXRdDQo=

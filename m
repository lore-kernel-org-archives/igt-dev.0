Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C95C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 08:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548C610E314;
	Thu,  1 Aug 2024 08:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcfU/vBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5C610E314
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 08:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722500575; x=1754036575;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9mYITBZO2HU3Rmz2JXSGAzs817WIEAQNfojB+yJHrdo=;
 b=PcfU/vBt8+QrdWlSeecY4w17xkVry7/Mis5TEUXKQNPAVK3ye3BO3ky2
 GwI6B+M/DHd2zZjlx/R+pNZvTt50SbAVsnm/dfQOIsW6XBEwacHAvHWTN
 sQaAWi3zS/ZEcM2cKzcap5oEqYwej9Lgetf8+ReDIBwNeizviwCYBDPt3
 N+RlRHFIC8c8Qx77DWmd6lLnt8vh5mdI3751AHhpZ3+ixNgjn5o/lPTLd
 IVyYQO1MvM3B0kfazJe9SeUzj0tkIac3cpbC7dz4XZnx+3iKA7Xb9VggS
 wazkAuX/Z0TkR19yQdOLaBY1rmW1PiaSHInQT53jS3jOkgtCvZLNcjUg9 Q==;
X-CSE-ConnectionGUID: bDwn/CEVT8amBkps2Fi5yQ==
X-CSE-MsgGUID: IBP4eUZFQUOm0XeafB3feA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20597317"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20597317"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 01:22:55 -0700
X-CSE-ConnectionGUID: q73dxCJHQ++Nb7/dMYRc5g==
X-CSE-MsgGUID: jubo6043R0arwH94vzyLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59986755"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 01:22:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 01:22:54 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 01:22:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 01:22:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 01:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDXgt+KL/qCJDzCazdfu4sW7CUcmktEyZxSc6fT3uwpPiQDI1C8QJoD6BPAMQLrfQdEWatRXkADYzyBwVMzB01+VG1suf2QaWrBTPhG5QRsQLVcI0dJojwzObjQZoqSE7Bv4ZflUUUfu2XAfhiMzq8eLTwwNpg5DCTsCtkYK0rs90IxT+6V/IMU0qYcGMBtEblDsX3Jmjf6Uv4aD3JxTM7BDkLEJ0kNohwNIrcEcKqXrfiMh/+P/79ybQO1Mg6dzrdk2WbOqQk9wz3A7TD2hI+ZQnLqCJfa0lulQE9O3KaRklQxuOi07EHHV5YhlUDFaPMlP8FB2ZE+8/NbXFMm22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mYITBZO2HU3Rmz2JXSGAzs817WIEAQNfojB+yJHrdo=;
 b=mLq5kXHvZrI9foKRYZiI+02NOJogjdRHrkOL6m1leEm/mfVDRMUZAuLJERWAJZKp1sIEBnzH0ubPFvYson9qbzpPnE85ONi2kw3jwMZ7XuyXWfyccwukzEJAg3g/maIoXB4jp/WWqrjK7P4CZ0aDZPVj49g5cAOvNUTn68PahI61DgSxgBB3Q91TTiWomKftSxJZ5MhmfNcQlskoZh9vWsdhNyjpNrglKzJ6wGVqZ/IT27CRigbtC0Xyb3yg/bB/CPVZlKBLnpf+qFrSjVBu3dlh5V7jmXsWGORYJdO69eeY4KqBVFkYCWxSxA4d7vn5HCqxJKMwWPDAh2H96Cq4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SN7PR11MB6654.namprd11.prod.outlook.com (2603:10b6:806:262::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Thu, 1 Aug
 2024 08:22:51 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 08:22:51 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 61/66] tests/xe_eudebug_online: Adds
 debugger-reopen test
Thread-Topic: [PATCH i-g-t v2 61/66] tests/xe_eudebug_online: Adds
 debugger-reopen test
Thread-Index: AQHa4naaD2uyyTEDjk+ss4fXU2I2k7ISEEcQ
Date: Thu, 1 Aug 2024 08:22:51 +0000
Message-ID: <DS0PR11MB72641B8795F4118DA8C888C9D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-62-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-62-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SN7PR11MB6654:EE_
x-ms-office365-filtering-correlation-id: e66a2535-6ac5-4bdc-1297-08dcb203229f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TlJrb2p1TXQ5RjRFbVFXZ1JFbkVZVU9UMjNLRmg5V1NXR3pwQms1ckN5RXdM?=
 =?utf-8?B?NWZBZHhqdzB1RWFlaVJIRlp0bDNKOCs2blJiRFFqT2lqa09yYUtqUUd3WGVr?=
 =?utf-8?B?QWI3c3V3bHRSeUh5WEJWQnBYc3AvYjRXeWZseEgrRjBFMGJMMlZXMFkrR2s1?=
 =?utf-8?B?djQxckhNRzMrV2l1Nm82b0xnNkpJRUpwaDhMQ29DUHo1dCtQc3VQTWdtclpa?=
 =?utf-8?B?RUZZT3VJQTFmS3VVWkZCaFpiSHhRdnd6Q1RCZEZpaXJ3NUo0YUwzVWwvV21W?=
 =?utf-8?B?VzNuNkd2b0JwL0QrZ1ZuejBhdGlOQm0yTEVBRml4NVB1eW9DaFpSeCs0b1E3?=
 =?utf-8?B?RFlpK04rU1FZTXFQZ0xpV01TYk5qZVZXYlFXbDRJcTNtWlliSDJZM1FLVUls?=
 =?utf-8?B?OFVZVEpjSEFjQ2taaFZrQ3JPK0pwQjEwa00yaFV4VDhQODVkbVRVZ1ZPUEU4?=
 =?utf-8?B?UE5OdlBYRnY3cHJoTm9ldktuQk90aThlNklYWVFZTFFLZEpmY3dZZ01HRzZV?=
 =?utf-8?B?elBuWlAyNkNJb2d2MFNLWDd5bFNLZDYxSnQ2VEMrS055Wml4Y3R6cjVObkVT?=
 =?utf-8?B?Y2dLdUI2TDg0RTZvN2M3YTdVNE9HNXRHMU9qNE9zVkJpS1E5VTVVbnBRTnR3?=
 =?utf-8?B?T3RVTjVJclRvbU8rNHlmWG9YUi9xK29pcWVhd2tRS1F2TGt3NU9ZUm5RMktL?=
 =?utf-8?B?NjIrQVZmZEVNMURFSnliVlU3Rys1TXBEdTdFYVlLYjlibkhqRnN1UHN6R1RN?=
 =?utf-8?B?ZnQ5cnpsZlNEbGZBVXlEdnowSG9KWDd1aDc2bWI2UTNMWFk4QWIxeWNZSnhk?=
 =?utf-8?B?bFBnTmkvUUZoek1DQ3l5c3FCOTdTaFRYTk8rMlJCc1hUZUJJeHV5VDdjU3RF?=
 =?utf-8?B?TnN2N1IySG9jU1BDaEdsVFdvKzFralIyRlZSc1B3TitoNDVlY2pJWnZ0dStu?=
 =?utf-8?B?d3BKTFR4QW10cnNmOHhNUGNyc1U3L3ZyOHdEYWNkRWliaUVQcG0reURDb1k5?=
 =?utf-8?B?SmNvMnpJYjhGc2YwblJUSFg1OXVIZkZRTWpSSnJiWWdTMU5xS1VrQ1N1RU1z?=
 =?utf-8?B?Z1dJMWJMbnBBRHlVaVZzblpPR1NUWXNHTTZWWkJsTVRMMEhpekVoaGt3L1Ar?=
 =?utf-8?B?Mzk2dXhndzc2dUtENHRsRzUvbzQrSTJjc1FvMHBBenZvcGNtWElzR1hKVVpV?=
 =?utf-8?B?Y2RoSzRKakdLSUxscDNqZzQwSGh5Umh0ZjRhdXVXcjErWVhVOWtDR1krTVNM?=
 =?utf-8?B?Ri9MSTZZSHIyVFBBOXpnSThKUzlGVUFzWjdsVXdrSEJ6UzRKTG55c3RzaTRi?=
 =?utf-8?B?SkZXWmhPeXZZL0RtV2d6NTdwLzF2TjFIb3ZydTRGNUd6VEtxNmQ0eUIrSmxt?=
 =?utf-8?B?VjFhbmZrYUorN1AvdXd0MWk5dVQ4TkRQdmZnNWZUeXNOOWpKQzVYRXJtdUVV?=
 =?utf-8?B?NWhKeFdTcFVPMkJsUElIbTk5c2hVb3l0QUVQOEpSaFh0QWJNQ005SzlEN1pT?=
 =?utf-8?B?a0kzZnFSTkhEY29nRHBudldKL2c0SDhWcXlER0o1Qi92VFFMOEIyUTMzczV0?=
 =?utf-8?B?VDB6MzRsNm9CUWdUTVI2VTQwRWtsYTMyZElaald1Nkc5U08rOXZJR1hzQkZa?=
 =?utf-8?B?UFRQSXB2aFFkbUVYdEJ1cE8zL056cWtKYStkWm0zQU0rWXRDQW10dzk1cGJK?=
 =?utf-8?B?L1hTQUVUTE42VzFObmZQY1RxRHNjV2U4QSt5WitDU0d5U0R2ZjE1RzRJUmhI?=
 =?utf-8?B?Vys3a3J2VENRNGF4THIwa3ZNUFF1Q25ENVVpR3VCZXNSY3RRb3BwcXdCUWdW?=
 =?utf-8?B?MWR2ejAzTzV3VVExSWhRMlZFUEh5cnRQTmRjdUNEay9nb1g2aFpjdTNyUXVQ?=
 =?utf-8?B?Q0NtY1kvd2djY2lFV3lya242eUVkQUo1SytaZVg1QkhRdUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWJSWFkrdmVMS1paU0I2TjVzYUhvc0gxUmNEZDIvQkNpdVg3amN5UjFSc0V0?=
 =?utf-8?B?cE5rVm9iTG1RT0Z4Vktta1RydlAxbTczd3hvTFdITk5kcWtXZ3I2MXdTcVBp?=
 =?utf-8?B?aERvM05kOE8rN0R3YU1DazIvVUxyTkVFRTRpQ0crRGJrN29yMVJPUGdtNU5F?=
 =?utf-8?B?bUZXKzRUenpWZWFWdTdSRm9ac244aXN4dk9SejNpRUJxL21DS1N6K1JIa1ZW?=
 =?utf-8?B?VlFleXNkSUV1SC9DeFBFT3p1QmlQNUQxa3AxVmNabXI0cTFndUY3Q2F2R1pw?=
 =?utf-8?B?aUV0Tis0SUJROVlBZjhQdFQwR2JWcVF3cGVtbXJNMTNjaWNlQlRHSEVnZ25y?=
 =?utf-8?B?dmF0QjRpeG5WUWFqMXh2ZHBZR2pxWncwTkdNdU9rL25JZDcxTTdZSlI0NkRo?=
 =?utf-8?B?R01SbnkzKzhobGQ3K0VEbXBaN3FJNFlhbjNhTTlyQ3lwaURZNHZHTFRkRi9I?=
 =?utf-8?B?VTRiZHRKSFhZcFFQY0QwRklIcjJLaU15MnB5RWdGeFhFdDNuL2xqRTd3VzY4?=
 =?utf-8?B?aUlQUGhCZ3ZkaEdpWTJ5QzJoODNCSkNlU3N2S1p2UHFQY1g4a1lQczVwNWVu?=
 =?utf-8?B?V2FzUkpBdDNqZVZsNHJhc3E5b3dmYnFEV2tvRi8ycGo3ME9MZ3M1b09FWVBn?=
 =?utf-8?B?T1cxQ0JlWXV6Y2NXVkdoaEk2MkhXMURnUko3azlaejNRenZYRUZiZXhkeERj?=
 =?utf-8?B?SUl6ak0vUHB6V2hIcFZERy9hejFDbnVEZndEbU1aRUhGOXFzNis5dGltNVlN?=
 =?utf-8?B?enVIVHpuS0k1N1B3OFR2MDh6L0ZwSzBWVEYwZGRib3VNc3hJTVBmRjdhcFR3?=
 =?utf-8?B?alQ2TmtNL0FndGs2STdQNkZlVHByNmNBT2w5NCtiSzJpZEJpM0g2eTVaY0Vt?=
 =?utf-8?B?Ull4WUI2YmlaVlhzZ0RHQkNUWXRPOHF0S2VqWFZxYkpCR2had0kzQmlMUXBD?=
 =?utf-8?B?a1ZNblZieGNwMm95ZzRHbmxpcENxM0h3eHQrKzVJVDc3empVM0J0eS9ETENU?=
 =?utf-8?B?VjVYSEtzdzZzUWFoUWJmVUYvZmU2azBiZWtHOVpuU21XeVR5Y2tkVFoveUE2?=
 =?utf-8?B?Nk9PRDY4MkZ1QVdveUYrbFNDMlJFQkgydmF4aVhiazdQb2h6UTRDWnJnL0c2?=
 =?utf-8?B?dDRzOVRoc0ltT1VRNDNOMVVkL3F3V0FuMGxQb0Zjc3dFVUJUQndvdUIrQXhW?=
 =?utf-8?B?RGM1OWZKeDRzbEU2SE9kakx1REdLQ1dLSHRYV0NPRVlWWEdBNm1McHVuMVdX?=
 =?utf-8?B?eVJLWWJGMHJCd2Z4V3NqdTZIdDJLamZjN2oydzVzcFhqNWl6S2Zkb0FkSy9j?=
 =?utf-8?B?NGt3ZzN6R1pWN1VkZG00dlVhQkZ2NkVLcmRUcUljVjZxZWh6Y3llR0tyOWwy?=
 =?utf-8?B?Z2hkVks2anF3NVJBcmlLSmhzVWh2bDAyYWNub0tpK29UWjJ4N3ZrbU5PcUlI?=
 =?utf-8?B?SWJnNDA5eGw1cmFpWW1KUmE5ZE1hT3VIbkIzbzZrek9EM1JiZnRwV1NINGlQ?=
 =?utf-8?B?QU5KeUhuUUhsQUhzZ0JJbGd4RzlWaEdjcUhCdWlCdHAwcjJWTW9XQm9jZGxU?=
 =?utf-8?B?YmpaQjJDYkZGc0NkY2dvYkczYVdsRFZwK2gyWkRwT3duV05KcUxrcURQL2Fx?=
 =?utf-8?B?UTVSdTRaOHpkbnBxcmpsT3lkblFVUzhqNWROMm5FeW1GWFJHRTJ4dzdsM2d6?=
 =?utf-8?B?OHFJSks2SE5BZW9hK2owUm5zL0JMVXhTVkxIQ0MvTWljNG5IQkhvUDdhV2Jj?=
 =?utf-8?B?MEY2VGtCNkpRbGQrYlllNUsvWlZQbGRjM2ZvdW5FcndDQ3VyNzZTd3NrSEVI?=
 =?utf-8?B?blpXdzdxb3NEa3VqWUlBNnhISUh5NElaTGVXZlBMRWpDSGpSblVkOFBVbHln?=
 =?utf-8?B?NHl5OEVlYzFxTUF5QkJNbzdOakJnaEhEdFVUTGdLM0hScW5lUG1SWWF4c1M5?=
 =?utf-8?B?Q1dpK1VrYW5TQyt5ZFRKWEY4cFFKbHNQWlpuK0FXc0hIMW1qNWxnQ3JWWjNZ?=
 =?utf-8?B?VWJ3NGQzTG5UclNXTE40TkhvQXhCamlRRjgra29uMG02VWo4MHo4UWxtN2Fy?=
 =?utf-8?B?VVN5Ym02T3FwSFZKUTFhYUx6Q0M5WjZERXFoNVJQWm1WdDBOb2VIekIwdzFj?=
 =?utf-8?B?Mm1OQ1o5V0VsYmo4YnQ2RE05bFUwb3gvMThYY1JYYkVnbHEwNWxHNk5mRjQx?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e66a2535-6ac5-4bdc-1297-08dcb203229f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 08:22:51.4901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1+npQQ0UYxqjWdgN9BU3vqImsHDiApCGymYmckGkt6oL/dfrhnqJI23McBJNS6yDWHY9n7bO2Kc0dswjxebY9HsFCVh6EkVYlbYzjfAHI+fXCTap4ozVxxqKyU4eRKTQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6654
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

T25lIG5pdHBpY2sgYmVsb3cuIFdoZW4gZml4ZWQ6DQpSZXZpZXdlZC1ieTogRG9taW5payBLYXJv
bCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYW5zemV3c2tpLCBDaHJpc3RvcGgg
PGNocmlzdG9waC5tYW5zemV3c2tpQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSnVseSAz
MCwgMjAyNCAxOjQ1IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBD
YzogS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+
OyBLYW1pbA0KPiBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBH
cnplZ29yemVrLCBEb21pbmlrDQo+IDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPjsgUGF0
ZWxjenlrLCBNYWNpZWoNCj4gPG1hY2llai5wYXRlbGN6eWtAaW50ZWwuY29tPjsgUGlhdGtvd3Nr
aSwgRG9taW5payBLYXJvbA0KPiA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT47
IFNpa29yYSwgUGF3ZWwNCj4gPHBhd2VsLnNpa29yYUBpbnRlbC5jb20+OyBIYWpkYSwgQW5kcnpl
aiA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+Ow0KPiBLb2xhbnVwYWthIE5hdmVlbmEgPGtvbGFu
dXBha2EubmF2ZWVuYUBpbnRlbC5jb20+OyBLdW9wcGFsYSwgTWlrYQ0KPiA8bWlrYS5rdW9wcGFs
YUBpbnRlbC5jb20+OyBNdW4sIEd3YW4tZ3llb25nIDxnd2FuLQ0KPiBneWVvbmcubXVuQGludGVs
LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYyIDYxLzY2XSB0ZXN0cy94ZV9ldWRlYnVn
X29ubGluZTogQWRkcyBkZWJ1Z2dlci0NCj4gcmVvcGVuIHRlc3QNCj4gDQo+IEZyb206IEtvbGFu
dXBha2EgTmF2ZWVuYSA8a29sYW51cGFrYS5uYXZlZW5hQGludGVsLmNvbT4NCj4gDQo+IEludHJv
ZHVjaW5nIGEgdGVzdCB3aGljaCB3aWxsIGNsb3NlIGFuZCByZW9wZW4gdGhlIGRlYnVnZ2VyIGFm
dGVyIHJlc3VtZSBvbg0KPiBlYWNoIGJyZWFrcG9pbnQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGRl
YnVnZ2VyIGlzIGFibGUgdG8gY2FwdHVyZSB0aGUgZnVydGhlcg0KPiBldmVudHMgYWZ0ZXIgcmVv
cGVuaW5nIGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS29sYW51cGFrYSBOYXZlZW5hIDxrb2xh
bnVwYWthLm5hdmVlbmFAaW50ZWwuY29tPg0KPiBDYzogRG9taW5payBLYXJvbCBQacSFdGtvd3Nr
aSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9p
bnRlbC94ZV9ldWRlYnVnX29ubGluZS5jIHwgNjgNCj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5j
IGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiBpbmRleCA4MzYxYjZkYjQuLmMz
YzgyYjA2MSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0K
PiArKysgYi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+IEBAIC0yNSw2ICsyNSw3
IEBADQo+ICAjZGVmaW5lIFNIQURFUl9TSU5HTEVfU1RFUAkJKDEgPDwgMikNCj4gICNkZWZpbmUg
U0lQX1NJTkdMRV9TVEVQCQkJKDEgPDwgMykNCj4gICNkZWZpbmUgRElTQUJMRV9ERUJVR19NT0RF
CQkoMSA8PCA0KQ0KPiArI2RlZmluZSBTSEFERVJfTl9OT09QX0JSRUFLUE9JTlQJKDEgPDwgNSkN
Cj4gICNkZWZpbmUgVFJJR0dFUl9SRVNVTUVfU0lOR0xFX1dBTEsJKDEgPDwgMjUpDQo+ICAjZGVm
aW5lIFRSSUdHRVJfUkVTVU1FX1BBUkFMTEVMX1dBTEsJKDEgPDwgMjYpDQo+ICAjZGVmaW5lIFRS
SUdHRVJfUkVDT05ORUNUCQkoMSA8PCAyNykNCj4gQEAgLTM1LDYgKzM2LDcgQEANCj4gDQo+ICAj
ZGVmaW5lIERFQlVHR0VSX1JFQVRUQUNIRUQJMQ0KPiANCj4gKyNkZWZpbmUgU0hBREVSX0xPT1Bf
TgkJMw0KPiAgI2RlZmluZSBTSU5HTEVfU1RFUF9DT1VOVAkxNg0KPiAgI2RlZmluZSBTVEVFUklO
R19TSU5HTEVfU1RFUAkwDQo+ICAjZGVmaW5lIFNURUVSSU5HX0NPTlRJTlVFCTB4MDBjMGZmZWUN
Cj4gQEAgLTEyOCw2ICsxMzAsMTEgQEAgc3RhdGljIHN0cnVjdCBncGdwdV9zaGFkZXIgKmdldF9z
aGFkZXIoaW50IGZkLCBjb25zdA0KPiB1bnNpZ25lZCBpbnQgZmxhZ3MpDQo+ICAJCWdwZ3B1X3No
YWRlcl9fYnJlYWtwb2ludChzaGFkZXIpOw0KPiAgCQlmb3IgKGludCBpID0gMDsgaSA8IFNJTkdM
RV9TVEVQX0NPVU5UOyBpKyspDQo+ICAJCQlncGdwdV9zaGFkZXJfX25vcChzaGFkZXIpOw0KPiAr
CX0gZWxzZSBpZiAoZmxhZ3MgJiBTSEFERVJfTl9OT09QX0JSRUFLUE9JTlQpIHsNCj4gKwkJZm9y
IChpbnQgaSA9IDA7IGkgPCBTSEFERVJfTE9PUF9OOyBpKyspIHsNCj4gKwkJCWdwZ3B1X3NoYWRl
cl9fbm9wKHNoYWRlcik7DQo+ICsJCQlncGdwdV9zaGFkZXJfX2JyZWFrcG9pbnQoc2hhZGVyKTsN
Cj4gKwkJfQ0KPiAgCX0NCj4gDQo+ICAJZ3BncHVfc2hhZGVyX19lb3Qoc2hhZGVyKTsNCj4gQEAg
LTUyNSw2ICs1MzIsNyBAQCBzdGF0aWMgaW50IGdldF9zdGVwcGVkX3RocmVhZHNfY291bnQoc3Ry
dWN0DQo+IG9ubGluZV9kZWJ1Z19kYXRhICpkYXRhLCBpbnQgdGhyZWFkcyAgfQ0KPiANCj4gICNk
ZWZpbmUgTUFYX1BSRUVNUFRfVElNRU9VVCAxMHVsbA0KPiArc3RhdGljIGludCBpc19jbGllbnRf
cmVzdW1lZDsNCj4gIHN0YXRpYyB2b2lkIGV1X2F0dGVudGlvbl9yZXN1bWVfdHJpZ2dlcihzdHJ1
Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwNCj4gIAkJCQkJc3RydWN0IGRybV94ZV9ldWRlYnVn
X2V2ZW50ICplKQ0KPiAgew0KPiBAQCAtNTgzLDYgKzU5MSw3IEBAIHN0YXRpYyB2b2lkIGV1X2F0
dGVudGlvbl9yZXN1bWVfdHJpZ2dlcihzdHJ1Y3QNCj4geGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwN
Cj4gIAkJCQkJCSAgICBhdHQtPmV4ZWNfcXVldWVfaGFuZGxlLA0KPiBhdHQtPmxyY19oYW5kbGUs
DQo+ICAJCQkJCQkgICAgYml0bWFzaywgYXR0LT5iaXRtYXNrX3NpemUpOw0KPiANCj4gKwlpc19j
bGllbnRfcmVzdW1lZCA9IDE7DQo+ICAJZnJlZShiaXRtYXNrKTsNCj4gIH0NCj4gDQo+IEBAIC04
ODEsOCArODkwLDggQEAgc3RhdGljIHZvaWQgcnVuX29ubGluZV9jbGllbnQoc3RydWN0DQo+IHhl
X2V1ZGVidWdfY2xpZW50ICpjKQ0KPiAgCWRhdGEtPnRocmVhZHNfY291bnQgPSBjb3VudF9jYW5h
cmllc19uZXEocHRyLCB3X2RpbSwgMCk7DQo+ICAJaWd0X2Fzc2VydF9mKGRhdGEtPnRocmVhZHNf
Y291bnQsICJObyBjYW5hcmllcyBmb3VuZCwgbm90aGluZw0KPiBleGVjdXRlZD9cbiIpOw0KPiAN
Cj4gLQlpZiAoKGMtPmZsYWdzICYgU0hBREVSX0JSRUFLUE9JTlQgfHwgYy0+ZmxhZ3MgJg0KPiBU
UklHR0VSX1JFU1VNRV9TRVRfQlApICYmDQo+IC0JICAgICEoYy0+ZmxhZ3MgJiBESVNBQkxFX0RF
QlVHX01PREUpKSB7DQo+ICsJaWYgKChjLT5mbGFncyAmIFNIQURFUl9CUkVBS1BPSU5UIHx8IGMt
PmZsYWdzICYNCj4gVFJJR0dFUl9SRVNVTUVfU0VUX0JQIHx8DQo+ICsJICAgICBjLT5mbGFncyAm
IFNIQURFUl9OX05PT1BfQlJFQUtQT0lOVCkgJiYgIShjLT5mbGFncyAmDQo+ICtESVNBQkxFX0RF
QlVHX01PREUpKSB7DQo+ICAJCXVpbnQzMl90IGFpcCA9IHB0clswXTsNCj4gDQo+ICAJCWlndF9h
c3NlcnRfZihhaXAgIT0gU0hBREVSX0NBTkFSWSwgIldvcmtsb2FkIGV4ZWN1dGVkIGJ1dA0KPiBi
cmVha3BvaW50IG5vdCBoaXQhXG4iKTsgQEAgLTEzNzUsNyArMTM4NCw4IEBAIHN0YXRpYyB2b2lk
DQo+IGV1X2F0dGVudGlvbl9kZWJ1Z2dlcl9kZXRhY2hfdHJpZ2dlcihzdHJ1Y3QgeGVfZXVkZWJ1
Z19kZWJ1Z2dlciAqZCwNCj4gIAl4ZV9ldWRlYnVnX2RlYnVnZ2VyX2RldHRhY2goZCk7DQo+IA0K
PiAgCS8qIExldCB0aGUgS01EIHNjYW4gZnVuY3Rpb24gbm90aWNlIHVuaGFuZGxlZCBFVSBhdHRl
bnRpb24gKi8NCj4gLQlzbGVlcCgxKTsNCj4gKwlpZiAoIShkLT5mbGFncyAmIFNIQURFUl9OX05P
T1BfQlJFQUtQT0lOVCkpDQo+ICsJCXNsZWVwKDEpOw0KPiANCj4gIAkvKg0KPiAgCSAqIE5ldyBz
ZXNzaW9uIHRoYXQgaXMgY3JlYXRlZCBieSBFVSBkZWJ1Z2dlciBvbiByZWNvbm5lY3QgcmVzdGFy
dHMNCj4gQEAgLTEzOTQsNyArMTQwNCw4IEBAIHN0YXRpYyB2b2lkDQo+IGV1X2F0dGVudGlvbl9k
ZWJ1Z2dlcl9kZXRhY2hfdHJpZ2dlcihzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwNCj4g
IAkvKiBMZXQgdGhlIGRpc2NvdmVyeSB3b3JrZXIgZGlzY292ZXIgcmVzb3VyY2VzICovDQo+ICAJ
c2xlZXAoMik7DQo+IA0KPiAtCXhlX2V1ZGVidWdfZGVidWdnZXJfc2lnbmFsX3N0YWdlKGQsIERF
QlVHR0VSX1JFQVRUQUNIRUQpOw0KPiArCWlmICghKGQtPmZsYWdzICYgU0hBREVSX05fTk9PUF9C
UkVBS1BPSU5UKSkNCj4gKwkJeGVfZXVkZWJ1Z19kZWJ1Z2dlcl9zaWduYWxfc3RhZ2UoZCwNCj4g
REVCVUdHRVJfUkVBVFRBQ0hFRCk7DQo+ICB9DQo+IA0KPiAgLyoqDQo+IEBAIC0xNTEwLDYgKzE1
MjEsNTIgQEAgc3RhdGljIHZvaWQgdGVzdF9zaW5nbGVfc3RlcChpbnQgZmQsIHN0cnVjdA0KPiBk
cm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2UsIGkNCj4gIAlvbmxpbmVfZGVidWdfZGF0
YV9kZXN0cm95KGRhdGEpOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyBpbnQgZGVidWdnZXJfZGV0YWNo
X2NvdW50Ow0KDQpJIG5vdGljZWQgdGhhdCB0aGlzIHZhcmlhYmxlIGlzIG9ubHkgdXNlZCBpbnNp
ZGUgdGhlIGZ1bmN0aW9uIGJlbG93IC0gaXQgY2FuIGJlIG1vdmVkIGluc2lkZSBzY29wZSBvZiB0
aGUgZnVuY3Rpb24uDQoNCj4gK3N0YXRpYyB2b2lkIGV1X2F0dGVudGlvbl9kZWJ1Z2dlcl9uZGV0
YWNoX3RyaWdnZXIoc3RydWN0DQo+IHhlX2V1ZGVidWdfZGVidWdnZXIgKmQsDQo+ICsJCQkJCQkg
c3RydWN0DQo+IGRybV94ZV9ldWRlYnVnX2V2ZW50ICpldmVudCkgew0KPiArCWlmIChkZWJ1Z2dl
cl9kZXRhY2hfY291bnQgPCAoU0hBREVSX0xPT1BfTiAtIDEpKSB7DQo+ICsJCS8qIE1ha2Ugc3Vy
ZSB0aGUgcmVzdW1lIGNvbW1hbmQgaGFzIGlzc3VlZCBiZWZvcmUNCj4gZGV0YWNoaW5nIHRoZSBk
ZWJ1Z2dlciAqLw0KPiArCQlpZiAoIWlzX2NsaWVudF9yZXN1bWVkKQ0KPiArCQkJcmV0dXJuOw0K
PiArCQlldV9hdHRlbnRpb25fZGVidWdnZXJfZGV0YWNoX3RyaWdnZXIoZCwgZXZlbnQpOw0KPiAr
CQlkZWJ1Z2dlcl9kZXRhY2hfY291bnQrKzsNCj4gKwl9IGVsc2Ugew0KPiArCQlpZ3RfZGVidWco
IlJlYWNoZWQgTnRoIGJyZWFrcG9pbnQgaGVuY2UgcHJldmVudGluZyB0aGUNCj4gZGVidWdnZXIg
ZGV0YWNoXG4iKTsNCj4gKwl9DQo+ICsJaXNfY2xpZW50X3Jlc3VtZWQgPSAwOw0KPiArfQ0KPiAr
DQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGRlYnVnZ2VyLXJlb3Blbg0KPiArICogRGVzY3JpcHRp
b246DQo+ICsgKglDaGVjayB3aGV0aGVyIHRoZSBkZWJ1Z2dlciBpcyBhYmxlIHRvIHJlb3BlbiB0
aGUgY29ubmVjdGlvbiBhbmQNCj4gKyAqCWNhcHR1cmUgdGhlIGV2ZW50cyBvZiBhbHJlYWR5IHJ1
bm5pbmcgY2xpZW50Lg0KPiArICovDQo+ICtzdGF0aWMgdm9pZCB0ZXN0X2RlYnVnZ2VyX3Jlb3Bl
bihpbnQgZmQsIHN0cnVjdA0KPiArZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlLCBp
bnQgZmxhZ3MpIHsNCj4gKwlzdHJ1Y3QgeGVfZXVkZWJ1Z19zZXNzaW9uICpzOw0KPiArCXN0cnVj
dCBvbmxpbmVfZGVidWdfZGF0YSAqZGF0YTsNCj4gKw0KPiArCWRhdGEgPSBvbmxpbmVfZGVidWdf
ZGF0YV9jcmVhdGUoaHdlKTsNCj4gKw0KPiArCXMgPSB4ZV9ldWRlYnVnX3Nlc3Npb25fY3JlYXRl
KGZkLCBydW5fb25saW5lX2NsaWVudCwgZmxhZ3MsIGRhdGEpOw0KPiArDQo+ICsJeGVfZXVkZWJ1
Z19kZWJ1Z2dlcl9hZGRfdHJpZ2dlcihzLT5kLA0KPiBEUk1fWEVfRVVERUJVR19FVkVOVF9FVV9B
VFRFTlRJT04sDQo+ICsJCQkJCWV1X2F0dGVudGlvbl9kZWJ1Z190cmlnZ2VyKTsNCj4gKwl4ZV9l
dWRlYnVnX2RlYnVnZ2VyX2FkZF90cmlnZ2VyKHMtPmQsDQo+IERSTV9YRV9FVURFQlVHX0VWRU5U
X0VVX0FUVEVOVElPTiwNCj4gKwkJCQkJZXVfYXR0ZW50aW9uX3Jlc3VtZV90cmlnZ2VyKTsNCj4g
Kwl4ZV9ldWRlYnVnX2RlYnVnZ2VyX2FkZF90cmlnZ2VyKHMtPmQsDQo+IERSTV9YRV9FVURFQlVH
X0VWRU5UX0VVX0FUVEVOVElPTiwNCj4gKw0KPiAJZXVfYXR0ZW50aW9uX2RlYnVnZ2VyX25kZXRh
Y2hfdHJpZ2dlcik7DQo+ICsJeGVfZXVkZWJ1Z19kZWJ1Z2dlcl9hZGRfdHJpZ2dlcihzLT5kLA0K
PiBEUk1fWEVfRVVERUJVR19FVkVOVF9WTV9CSU5EX1VGRU5DRSwNCj4gKwkJCQkJdWZlbmNlX2Fj
a190cmlnZ2VyKTsNCj4gKw0KPiArCXhlX2V1ZGVidWdfc2Vzc2lvbl9ydW4ocyk7DQo+ICsNCj4g
Kwl4ZV9ldWRlYnVnX3Nlc3Npb25fZGVzdHJveShzKTsNCj4gKwlvbmxpbmVfZGVidWdfZGF0YV9k
ZXN0cm95KGRhdGEpOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgc3RydWN0IGRybV94ZV9lbmdpbmVf
Y2xhc3NfaW5zdGFuY2UgKnBpY2tfY29tcHV0ZShpbnQgZmQsIGludCBndCkgIHsNCj4gIAlzdHJ1
Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlOyBAQCAtMTU4Niw2ICsxNjQzLDkN
Cj4gQEAgaWd0X21haW4NCj4gIAkJdGVzdF9zaW5nbGVfc3RlcChmZCwgaHdlLCBTSEFERVJfU0lO
R0xFX1NURVAgfA0KPiBTSVBfU0lOR0xFX1NURVAgfA0KPiAgCQkJCSBUUklHR0VSX1JFU1VNRV9T
SU5HTEVfV0FMSyk7DQo+IA0KPiArCXRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1dGUoImRlYnVnZ2Vy
LXJlb3BlbiIsIGZkLCBod2UpDQo+ICsJCXRlc3RfZGVidWdnZXJfcmVvcGVuKGZkLCBod2UsDQo+
IFNIQURFUl9OX05PT1BfQlJFQUtQT0lOVCk7DQo+ICsNCj4gIAlpZ3RfZml4dHVyZSB7DQo+ICAJ
CXhlX2V1ZGVidWdfZW5hYmxlKGZkLCB3YXNfZW5hYmxlZCk7DQo+IA0KPiAtLQ0KPiAyLjM0LjEN
Cg0K

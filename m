Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D139BC282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 12:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCA810E0DA;
	Mon, 17 Mar 2025 12:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eeq0Dp1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1F510E0DA
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 12:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742213732; x=1773749732;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8XmYDWkYDTRSiQPwKbHpJLomQPHJRlcwPHSF8fb9qhM=;
 b=Eeq0Dp1eUBOnhKnDQyhDvlCO9G2aorKwq3jreE78l9qZ5T6m/Vc7yT8f
 C77wZH5zTfI10rBm44ZHMzEtkgQ51THGHdnRpJh+clL+dgOCLQLF1u0+F
 IM2pGmOhtzoV6Mo/2T6PlTFJo9s/+Ih3B4f1rQ8H734w3Ln6Ofj0YTzlh
 WBFbHOubIAbU+nd54fw9zikb4ggBR4CKn36r9LHVL5pRb1/KEKTiifhp+
 P1hfOEG203SLts7dvf09haXaOVyXAor3vofYAnswe8+N+FVo55nLYa9vo
 nCd6WuCgMZ9KKND5j1oCjvs/Lr2nDQMo2iJZSVKzPWBgXHnYQaIl9pyd6 A==;
X-CSE-ConnectionGUID: MAkywIq9S9+axgd6kZXNuA==
X-CSE-MsgGUID: I3O3hXcCTxyT0cPj4XZpbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43185379"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="43185379"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 05:15:31 -0700
X-CSE-ConnectionGUID: W1h2Bk4DSueASDpFw0cynA==
X-CSE-MsgGUID: ls+9M1kiRAW58oZwUUvx8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="122866813"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 05:15:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 05:15:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 05:15:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 05:15:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2exQDdaEt00ejzSkPe6zsrhjjqovfNdL7FNaFH3aPpSnzwKeSgj4iojP7+6PUT+8YMcVPV+NEq4EU0cRJaQDzFZ9CPec292dRbSf4/OJwM55cSyETN5oweokn0N+7Kbd62wtJoxrfqLWqt/DEfS5rwgCol++koFFif4VzqhxZRKhJRxPvJIZc0jofrtiJ9rGXOakQtwUnzmjlxDUNWn4CHfJ14KUC5dL8hmkFU2GWQhOhC2txvCvZ8i55ojDyWlUQ+BnEvvmjF5xA/rbZGVrcEm2dzcCkiffELRTfMz0/MQwq2mkiONiI0u6KVIPmsryWWiUA0yYMdPYXssmGxHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XmYDWkYDTRSiQPwKbHpJLomQPHJRlcwPHSF8fb9qhM=;
 b=Bye9jnjrhr6UsaijeUegPEIsqpdlnYuJFJtcrUyAxTmff40anB1eYyr9cV2chzCYEuHz2soNmKD8tVZBO0OwpfE89h+tQ50l2zfGbdsPA4Vi2GSse3JEQYvOtLrCs1CPRUYfs5dJKTrx3iX9zLlIhAWTaRcItL3XZu+4WX1Pt1fyDXushyTitxtebPbJZHgZSp5hO0wz37WSSs6/zPX+1AnwzOkBl6s7oBJ+u7ycjB8BTXa0cv/H2PEuUKHOfWoPLOhfW1bCE+PqRoqvsFZY5TyBMf7J5TlojMB2QD0KY/r755B67EHA57MOMWDj3yp7dXOTRiUCSi9pd/2qfZ/BLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SA3PR11MB8045.namprd11.prod.outlook.com (2603:10b6:806:2fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 12:15:28 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 12:15:28 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2] lib/igt_core: reinitialize log_buffer_mutex in
 child process
Thread-Topic: [PATCH i-g-t v2] lib/igt_core: reinitialize log_buffer_mutex in
 child process
Thread-Index: AQHblzAxg8uUQUFh9kixjPDCFxbi5bN3Peww
Date: Mon, 17 Mar 2025 12:15:28 +0000
Message-ID: <DS0PR11MB7264B500D568B44F7D51F885D9DF2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250317113146.560156-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250317113146.560156-1-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SA3PR11MB8045:EE_
x-ms-office365-filtering-correlation-id: 3bd7cad5-8cc5-440b-8c7d-08dd654d67a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?QVVnQ0QzSlM2aWxBcmNkZkhoTFRrVzBkTk9wbmk5cGxnVGtlMnJHZkxVdFox?=
 =?utf-8?B?bitLRG9wcFkvZHBYY1RXeGt1QlkrUlFkUmhyUmVuVFdvZ0xUK1ZobHc4NEg2?=
 =?utf-8?B?UkhpVTR5TlIrTnlhWUpuZm5CUUxsTzVCVWt2bzBlc3ltdFd3eEZndzhpckxu?=
 =?utf-8?B?L0FpVS9uYXVtWUdZa3dKMTBUd1pyZUxzQkl1Z3ZtaC9CWVFQdGd6VXFoY0JQ?=
 =?utf-8?B?K2xCNm43alFhcW0wR2RQZXdtNThwMHNwdGFYdk5VQUFSelFFWGRJb05GM3pC?=
 =?utf-8?B?NW01Mkw0TUwrT0YrMzZEQWtwVmhCWGNKOVA1OTRZK3RPWkkvTWllRnpPTCs2?=
 =?utf-8?B?d2NtVzd6SUdpd3gxdlUvVVE4V1k4d2UvbmRRQjdRbFhLUzU3YjNNU1p4RDg2?=
 =?utf-8?B?M3p1N3FIdlZ3aVVuZ1ZORVpML1FBZk5hTXdaQ0I0aWtCOWlxYXNOazk0dUpU?=
 =?utf-8?B?VE5XVDZ5aG5YdnUwTEJtRER5OXJFRk9SZjIzd1BnWW1TSTltYU9nSWkwVGZU?=
 =?utf-8?B?ZlRVUlFJdi9vaEoyU0dhZU1MNDExcGs4ZjN2akI5QkUwNG5aY09PMmQvOGxn?=
 =?utf-8?B?Yy90Z1pPejJlY0NJWG5nN2FmcUI3VHJQRmhtWG5aNTNCc1c4UlNPb0tYeVZZ?=
 =?utf-8?B?NGt1VzhIR3V6WFBlOVpZQU5zVVpYQkZZK1AzU1RSRU52VDFXVzF5Z1gyMVh1?=
 =?utf-8?B?VDBMSzFkeTY2WlFZQjlmVnNmUDhsUGltSHdXcVZkb0k4aHpYY1lLa0ZieEFs?=
 =?utf-8?B?ZDYwbGtDMVdVWHg1YUVBc2syYU5qTTM4R1JHM1MzOVE0MEN1QjlGM096NVJJ?=
 =?utf-8?B?WW9XejMyK2hSNEwzWHY5MnFvK3VFWW9HbHRocFp6dStNZG9OblBZK3A4WGlj?=
 =?utf-8?B?NCszMmxqaXJmUThQWE85T2Z2cUhGZHFjWmtCbmhXdDc0eCtJUWxqeVNYclEr?=
 =?utf-8?B?ZTVSVWpWT28wT01heitHczFZTHgxUGFzb0x3WUJBRHFTQ3pFOUo5MTBIMVNS?=
 =?utf-8?B?L3ZwU2pNWmx0a3pBWUtGQWN1SDBrMnkvZ2Nway82T1lRRHQySlllTjZsTFA5?=
 =?utf-8?B?Y3FMQ1NpYmI5TFFQWThQRDdhUEk2eDBUeGFKN2NXZXZZa3A0N21obzQvQURM?=
 =?utf-8?B?WTl4UEZ1ZEI3em1iSGozMytYUmMxZVFVbFVLa2loMUlHL0p4WHlhVnVUbGRC?=
 =?utf-8?B?UFFWYUlFMVBOSjFoMHNWM1ZhalNsRFlhOGEvZVpRZk5pTHl2MngvL0hsMkU0?=
 =?utf-8?B?d3pDOXRzV3VmZ1NOdUdRbFdTZkUySlhnTzNSQnRWc1hwYVFpOU9HdFYwUVk1?=
 =?utf-8?B?ajZraDBWUGZHcEY4TVpuMzk4eVJ3ZjF3OXgxTyt2Z0lSN1Z3QTVSMmJmdExK?=
 =?utf-8?B?dk5YMXFyWDlYVjNoOHJHZWFkSDNSVkFacTB3Z3NzYk8rQm94ZFk2Z3cxbno5?=
 =?utf-8?B?eDd4TW4xSGdLOVAyN0FZdTlOQXpxWHZKRU9FTFVKUnUyRkRVem54bkRXUndo?=
 =?utf-8?B?OGgzdzNqVkxqYWIwSVJPMjJZWkxVMlpObS91M05YMEFoZVJTem1IQ0pUVnVD?=
 =?utf-8?B?R2xmU1FMcVBIV2Nka1ppUDZzYkJEaENEdnNFWnJKK0kwalVnaSszUmovVFBv?=
 =?utf-8?B?ajRRcVROcnFma0czeGdUcjkwMWk2YWNxTDhwa1FJMDViSzJaSytZMmxmVDBF?=
 =?utf-8?B?N3E1RTRHalFhUEt2Rjl0TjRLWThSUElSbWJ1TFpEdDhCZm1KWXB2RXJQY2Zq?=
 =?utf-8?B?ZHdERkwramlBRFJ0R2VZK0g4Ny9pVVoyc1RKeUJuajM1aGVHUWNMbk1GYU56?=
 =?utf-8?B?cTVBT2JhY1AvRTdkQ1VTU3FPRWFXbFd2MTdqOFdkZ043ME5wNFJRME1Wdk1T?=
 =?utf-8?B?TmFFaGM0Zkw1REhxY3BIMUxyd1hzYzZoSUh3RXNlZzRyYlJJUTI2dEptWFk3?=
 =?utf-8?Q?qCS7QMa8eoBO21fzn62J3CTTmfjQt/Er?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm5xL1p0VlhzY1hDbjVkQ1ZlSFBtUlFUV3I3MzZnRVZsOUdvWlF2S3JMc1RD?=
 =?utf-8?B?dy9kcU9YLzNYNUxRV3VoTCtGcVdoSWRJTWhoY2IvaXl2V1NmajdIV0VHSkdM?=
 =?utf-8?B?S2ZKTHBoSTJReElYNEZOTDNtWTVadGY0S1NrNkFyY0NWREJGVEZYcDExbnVu?=
 =?utf-8?B?ZkhjN0tLY01IdmFDYUxJM3VmRmZDeEpDbDNRZ21vbHVzT1ljd3o3NXJRcXdl?=
 =?utf-8?B?d1VuT0tpRjFPWU9wZm4xSjNtLys1UTJLOXFPWm1nRHdrY0h5V0d1bm1ic1Mx?=
 =?utf-8?B?cTNFcVJmWlk2aFhwbForbjc1YmhlbXFuLzNxVUwwVzVxY1dJRE9jOUh3UUUx?=
 =?utf-8?B?U2NzWk1uc24wSTNtT3NMTFcxQkQ2NEYydGcwY3BHOEpTT0R3Um5WZGlZWVFx?=
 =?utf-8?B?bmkzTFVRaDNrVlgweWJaTzRBMXRJclZuWjduWTZHZFZsS2UyUWUxWGNQbXlW?=
 =?utf-8?B?S2F3eTMybmMwcm5tV0RpZGVxalBBNThHSHdHaWZMT3dKWGJaL0d0RkRraWlq?=
 =?utf-8?B?VFJpZHpoQkVZN1p2ME5HOU9TSm9FNDN6eUdrSU9jTDRHUjRsajFYWUVwOU9i?=
 =?utf-8?B?MVBKOVR4YnVzSTBWaStmQkUvck5BVXZ2TWpkb0RqZXFtQ09LRkp0Z2tVOVlY?=
 =?utf-8?B?WlNIM1RJMVBOR3c4bDFhL0todG04RXNBTEZmdmFXc2lmSTUwL0cyckZmeHo3?=
 =?utf-8?B?cVhXOHEwVzJEemlsaURPMzNoYWliMDk0VGt6QlRGeENsZW9HQmNsN012Yk1z?=
 =?utf-8?B?TEhnY2VaSVJBSTgvRmZwR3BBSUVOVkxIeXhrdVlHUFcwUVdnbGFQZ3pKRE1Y?=
 =?utf-8?B?N2FlSXRTOVFlWXhBSFJ4ektFV2JGYWcwaW96Mkx4U3ZhR0FHSjdOMm9kTFM2?=
 =?utf-8?B?aE9sbEdmcExRMWZxbGdZMWpoZmh6UkZyVW80VGVBU1BTMGozU1huQVhBOVFL?=
 =?utf-8?B?M3RhS3BIRjd0Uzh1N2FtWDh5UEp4b1ZEdEllMU4zMWJsa2lITzFjSlZqV1dn?=
 =?utf-8?B?dCtnTkNjNVc1VE1MTlJOSWJZeG02Yy9GOFloUERtWnhiUUd2d0JKZ0ZqRkdl?=
 =?utf-8?B?WDNUaGUzb2I3ZzdLZ09ZRnNHZzJJeFFpRHA2QXhMUnF0UWFEWkpQL1VhZDQ2?=
 =?utf-8?B?UG9teTFHL2RvU3VydG1hUGdJK2dUNFlZK2lNNEYxL2ZWWjExcU56V3hLMlI5?=
 =?utf-8?B?VHVHWEkvUi9oL2FsRjdYV096ZGtTK1R5d2RiUjluL244S2t5Z1FsdlZmZStE?=
 =?utf-8?B?VERaOVp4TmtuWm9YT3Rtc2tyOVVlVnIrQWMzV3h6TVpFNW1QSXlQWFFiSnpN?=
 =?utf-8?B?eHViM0lBSEV3UDQ4dEFrUmVZS2JINjFoZlE4cUMyKzFQd1czOWtvT01ZelJG?=
 =?utf-8?B?c21EWFkrYWtUSDlZSzlObXJDNlRleWhjckgxTUczVlhYTmwwLzk5dWRLOU42?=
 =?utf-8?B?M2pad05IcFdaMFZYNC9rZ1Q2MkdZMkxzOVBZREZoS1p6ZW01RldyMjJIOXRO?=
 =?utf-8?B?dHQyUXlXVVp0UFRheWtzRnNEK2QycFNPT2VWVWNFcFp2cFlBNkMxY0RZVUYy?=
 =?utf-8?B?eFZERUtxeW5xQStjR21IWEtKZlJnL3RyZWFTcWczRlhoY1lzWCttbEJsLzZE?=
 =?utf-8?B?R05MTUdvc01zTUFPVDdjT3RjdkZYcGpGaks5N0NZbVNpbkdNOTJUNndjVjRI?=
 =?utf-8?B?c1hlR3VUZzFhKzc2dEFUTG5ZblBDRjFrN1pjM0MyU0YvK2dpNWZhUldIM0tZ?=
 =?utf-8?B?MVFnY0RzTVY4dlNvUEhTVHY0TE5IbkRFZVZKekovamNTbE1kOUxiN0lSUzMy?=
 =?utf-8?B?eStBZGw4aFNoVVp6d0tCWHhMZk80RDE1Zm8xZkZEYUZJZmRILzFXc25PNFBS?=
 =?utf-8?B?M08zVlQyZUd1a1ZLNEE4ckZ1WjExUGFMVW9WaDV3YnViMUE5Wm1jQTdEUHI0?=
 =?utf-8?B?ejNqYWgySG9SUmlaQmVpSE12TmlLYXpzajhJYmJ1MjFLRWs2aEwzWFk4eGE0?=
 =?utf-8?B?M204SkFqMzA5UlBBYjNoeTA1cC9PWEhaN3FsQ2VzeGdBZzFmY0xXa2dQNXVl?=
 =?utf-8?B?aUJLWUl3eHhKZ3F0dzcyQjJBcG9XZGowaHJiSWlUaTBSTDBxblcxd29IbCtP?=
 =?utf-8?B?bThwTCs1QTFBaFNGYXJrNGdXYWxCNVFOK2pucHVTaEQwTFEzS2NOdXhqd21W?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd7cad5-8cc5-440b-8c7d-08dd654d67a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 12:15:28.2150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xQT0I893B/Cjt4vLpWaoXbBWIUSr8cLGy3S2lG6TnlIpfII6d0iyrpPNsWcHwqYKuNM/5TCO6mZUsOPMWHCyqZ84hlGjGaVslYC5AUNEkZwNSL41o9w6pTO5XqKLQzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8045
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
bTogS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+
DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTcsIDIwMjUgMTI6MzIgUE0NCj4gVG86IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWdu
aWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IE1pa2ENCj4gS3VvcHBhbGEgPG1pa2Eua3VvcHBh
bGFAbGludXguaW50ZWwuY29tPjsgUGlhdGtvd3NraSwgRG9taW5payBLYXJvbA0KPiA8ZG9taW5p
ay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT47IEthbWlsIEtvbmllY3pueQ0KPiA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYyXSBs
aWIvaWd0X2NvcmU6IHJlaW5pdGlhbGl6ZSBsb2dfYnVmZmVyX211dGV4IGluIGNoaWxkDQo+IHBy
b2Nlc3MNCj4gDQo+IEZvciBtdWx0aS1wcm9jZXNzIHNjZW5hcmlvIGludGVsLWFsbG9jYXRvciBp
cyBkZWRpY2F0ZWQgdGhyZWFkIHdoaWNoDQo+IGhhbmRsZXMgY2xpZW50cyAoY2hpbGRyZW4gcHJv
Y2Vzc2VzKSBhbGxvY2F0aW9ucy4gTWFpbiB0aHJlYWQgd2hpY2gNCj4gc3Bhd25zIGNoaWxkcmVu
IG1heSBoaXQgcG9pbnQgb2YgdGltZSB3aGVyZSBhbGxvY2F0b3IgdGhyZWFkIGxvY2tlZA0KPiBz
b21lIG11dGV4LiBPbmUgb2YgaXQgaXMgbG9nX2J1ZmZlcl9tdXRleCB1c2VkIGluIGlndF9sb2co
KS4gQ2hpbGRyZW4NCj4gd2hpY2ggd291bGQgdHJ5IHRvIGNhbGwgaWd0X2luZm8vd2Fybi9kZWJ1
ZygpIGZhbWlseSB3aWxsIHN0dWNrIGFzDQo+IHRoaXMgbXV0ZXggaXMgYWxyZWFkeSBsb2NrZWQu
DQo+IA0KPiBSZWluaXRpYWxpemUgdGhpcyBtdXRleCBpbiBpZ3RfZm9yaygpIHRvIGF2b2lkIGRl
YWRsb2NrcyBpbiBhbGxvY2F0b3INCj4gc2NlbmFyaW9zLg0KPiANCj4gQ2M6IE1pa2EgS3VvcHBh
bGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogRG9taW5payBLYXJvbCBQ
acSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gQ2M6IEth
bWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+DQo+IC0tLQ0KPiAgbGliL2lndF9jb3JlLmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY29yZS5jIGIvbGli
L2lndF9jb3JlLmMNCj4gaW5kZXggOTcwMmE5NDE3Ny4uYzE5Njg5YTUxZSAxMDA2NDQNCj4gLS0t
IGEvbGliL2lndF9jb3JlLmMNCj4gKysrIGIvbGliL2lndF9jb3JlLmMNCj4gQEAgLTI2MDAsNiAr
MjYwMCw3IEBAIGJvb2wgX19pZ3RfZm9yayh2b2lkKQ0KPiAgCQl0ZXN0X2NoaWxkID0gdHJ1ZTsN
Cj4gIAkJcHRocmVhZF9tdXRleF9pbml0KCZwcmludF9tdXRleCwgTlVMTCk7DQo+ICAJCXB0aHJl
YWRfbXV0ZXhfaW5pdCgmYWhuZF9tYXBfbXV0ZXgsIE5VTEwpOw0KPiArCQlwdGhyZWFkX211dGV4
X2luaXQoJmxvZ19idWZmZXJfbXV0ZXgsIE5VTEwpOw0KPiAgCQlhaG5kX21hcCA9IGlndF9tYXBf
Y3JlYXRlKGlndF9tYXBfaGFzaF82NCwNCj4gaWd0X21hcF9lcXVhbF82NCk7DQo+ICAJCWNoaWxk
X3BpZCA9IGdldHBpZCgpOw0KPiAgCQljaGlsZF90aWQgPSAtMTsNCj4gLS0NCj4gMi4zNC4xDQoN
Cg==

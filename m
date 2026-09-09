Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D36DC79F82
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 00:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D407410E19C;
	Wed,  9 Sep 2026 00:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Po5ABRq6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CCA10E183
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 00:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788912876; x=1820448876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=K0GPhS73BVElHS5ZAGstsW2KMSDanxxPyq4mfDZQPvs=;
 b=Po5ABRq6SaejE/pQqJodFigT0Bnd9YZrr57UajgqmN9PROHot2947B8K
 gjbHPL6ZZ8NoiY+/KGGISCXEv0G3LDeU5DBmduBWRysmUgkwkdXnlVOPI
 Wn68mAki1vMSnzO1ZrpGhS0GJF9kKnav04k+RjzQs1pYpTonxLF+7bsR5
 QyTfWgEocVDBmdiMuiEa0jAe2d7qsKq2ibRQktCMUftvFdf57cJsxQ854
 PcumzyNZRXV12g+LpZKZ8EdLhm7crHTTdfFey7/ky7PJkY700MypCiV8+
 0n53j8t4AvI6JMAw5tyimG9TkarhQLAO9lPBVrtO90JZKWvPhSD12dcjR w==;
X-CSE-ConnectionGUID: zbCHV/UoTIKkX++1AW6OLA==
X-CSE-MsgGUID: bKZ+596CRkGcU96MDh+5UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89453570"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89453570"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 17:14:35 -0700
X-CSE-ConnectionGUID: 1HJbbpI0TWeaxIHZxfiRfA==
X-CSE-MsgGUID: DSQDhfM0TU2gFdQsN9FAzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267904073"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 17:14:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 17:14:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 17:14:34 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 17:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jaaej8P7oYaX6TyV+U4AV600sSJG9XXZQAq7KQQic3wpZmlCvaqZZd6jIXj6TeMP/kJF26Qc1xhiU6+55z82GayiMn57xFjzEYg7MOiEZxcREhudGkQ6TOmwR6x/Qh87G5b3WKytD+9SJXKOa/dNmn10Klx1R3tyNWoj9Yvf2oXx3dYpTQPx4g/kKcOnBFsPHt9Mhz7MrwvqlkZLqP3+n6hnEdhKbDbqtOG3SbiHqZmCX7j4CW14YayuZx7X4+R63hKRhaUCW2hOc38lTHKUmJvbeIiw+Iqnsd4k4JuztLDx/bEBKJtAqzbU2pFu5yYVmfcF8RIccnlVH1qPQAw2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0GPhS73BVElHS5ZAGstsW2KMSDanxxPyq4mfDZQPvs=;
 b=L4bEtr2JMw/qyY2hpGiqzBbyysMOjeEWx8GjF5PufZneERlhan6vtKvQMKruwcjMOYouCGvtVrCjw/ll6JZidC8IxRPxbow28sKuVeaPl+7PmW5ptKpAqVLesufdN4SEI7PlHPkTedUXCRCZiApAG8sx0wBuqNVSzEtR+YPfylt79+6piI1oqU2YLETu5DYa670FAWVfGOQ39wStc7WeUQnQuGJMHk9UwjJUCgwSB3cs3CYdVRblYdBNWPBWYCHydUZVxzHsILmvWlvC8bCG2Enf1yMzILFfdqlAULjnNHsiLQBQRLeZlIF1y4456HUlaSIl2R6s7Kn7T8V2/GnSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by PH9PR11MB563386.namprd11.prod.outlook.com (2603:10b6:510:412::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 00:14:32 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 00:14:32 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/intel-ci: Add a subset of pxp tests into
 xe-fast-feedback
Thread-Topic: [PATCH i-g-t 2/3] tests/intel-ci: Add a subset of pxp tests into
 xe-fast-feedback
Thread-Index: AQHdO+4a2NNTxoq94U2bnmamcRjDLrbFaIEA
Date: Wed, 9 Sep 2026 00:14:32 +0000
Message-ID: <6e45999fb3ebdb4a65e45becd37e148ed5ba4505.camel@intel.com>
References: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
 <20260903214919.1005742-7-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260903214919.1005742-7-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|PH9PR11MB563386:EE_
x-ms-office365-filtering-correlation-id: 0d473996-05ff-4f8d-6389-08df0e075288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|10067099003|5023799004|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: kTAn8RI/5bATPG8uw9xWFDQ5G7qmfbb38aA1C/9PXTpMh9muizn47BWIQxf9pxyZokAeBZLrOXnteIGo/lbKVego9Wz1RpSR6DE8USKFTcArrkSnMSlj4yFKbe+WhaVcG1ynGpS7JFx3Q4A9NUept3V8sI683VBrDUwjk7zdG4JsYaRMcBQ9iuCXYkHmYoG9kztkl0NCUHxDnrMggikUUNFme5hufTmhokvrgSIGq8cyqZx0pQbVqTqmQAWcFEZzvVSuO/fJkKLYbEYfU3dVYzr+lCYKRbDkVDqW4jjgnREiD1KH01Z+ktHqKVkCc7YErK1RwWH9XIQwNC8Va7lRtusetvVRwS7icGXB4DZ1TFy2tYgTrWaovIhdRhDZmGcvr1z3zQXzf7fytBVV7vyqi9TnWiIzRALr/kJuAT1xafbEDNsSI8Rgrrp4JArQsXICgsRAChStca442eFbsLFf0IHORed8V4ZNoDqFvuUX7rH2zfuiL+8nc8GIkaSPEXwuNA88Yr6DrRTafoktXE7r9rfE6e5rCxgjn/2i59odJphZ4jjOvLC2EfJmPjL1LZH2pGMOSciB+DibslpeDMrUBR1+uG0EMZuSdokxMvHEkbNk5s8Ay2EEFqjOZgIP5CecIh9oi7g2VC9ng9F5SxT0/C9kEgXb4OUIsglQHkp0TfhlrGcu/EFlRWyos+cQ8r7rC4GL95XTHqx1QZynPpla30VPysZPiNh0NLtg4xkwYjM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlVtK0Z5d1Nwdk0xRVFSVUk2a0pPaHk2K2RJTm1VRzNCT2kzblh3S1kwVUFp?=
 =?utf-8?B?M1JqenpzNzN1a2YxY2NtNmJSRzlBbWh4YTJVZDh5MjRkWUFOZXNEUWx6UlRu?=
 =?utf-8?B?RWNrdld5NVNFRzhxaDcvYm1VZVM5OEdZdnVjQnlzTC9DbHhONmx1N1UycHow?=
 =?utf-8?B?UERaelZxck81SDYzSUZVWUhEZXk0YzB2SVNka3JhRVh1ajBXUVRlWWNSZnln?=
 =?utf-8?B?YUUyQWJrZmZLTjdpdDEwWlJEbEY2SXdDYk5KUFhUb0xNdUdCcXE4Zk4xNTVK?=
 =?utf-8?B?ZmxxVVM4QnZ0N05YTThRVGRTdmxoeEc4S3RPMEhyc1RFUUV6bGdJNDNQaWIr?=
 =?utf-8?B?SnJOTnltZi85Y29FZ0gxRHprMmU4bXFWclFOM0hUOVVEVUozc0ZHQVhnYWFC?=
 =?utf-8?B?UjgvSWdLUEpMUFJmQWxRYzlUeS9yUkdWRXpFVDg2UTkvSmNYTXBrYkwzM3Nn?=
 =?utf-8?B?NWM5Q05mS3NkS3RESGYwTVkxL1hadDVSVUpobUJydzZhc3kwOXBoR0NmakJn?=
 =?utf-8?B?ZHVNaEtpcThqNEJrQTZWZzVyU2gyTzN0M2YwOVVUU1JWM1gwV056RWIwVEd5?=
 =?utf-8?B?bnExU3dIYWlzam5iVkZIUU1CU1d2SXZ5WjZud2ppVlZDWlJqWk12OHZpMVVu?=
 =?utf-8?B?Y0dwcW5JLzN0UE5rWEFBd0w4U2UycGEzczdhQ05La1JVSFNNU1p5dUZnL2c2?=
 =?utf-8?B?VWVIamsxSmZ0NXdEakh5MzZUTVFkYWFnaGpxWk85Z05ndHFtR2FDaDNXbUhr?=
 =?utf-8?B?MlV4b3pXSkc4dWo1MytFcE9aeVVCYUdHTllKZ1FTQUswRXpEeDNyb05NZnZU?=
 =?utf-8?B?dVdnR3ViK09SMmM0ODdtdVpKK3JwSThLeEVFWlhkWDlhZU1PTUs1QkdvVTV0?=
 =?utf-8?B?Mll1aWV0WGFsaWdsTENhcFFralg5TWNFRlBPK21XQ3dHZ3V3UHczNGZjNUtW?=
 =?utf-8?B?VWhBNjlnK3VzZSt0SDJqdjNGMCt3Y0ZDcWJCaGM5ZnFvWkxCT0dzbVJjVE55?=
 =?utf-8?B?V2VDeHF1T2ZqK0RKYkZ5THNRWWUzVnZzNlE3NVgvTjFScTArRDFWNXhEcHVR?=
 =?utf-8?B?TDJZaDcrUFJ6WjNoR1hSUWhCVWIyMkU5cTBqQm11NGZGR3lYMCtCV0Z6cDcy?=
 =?utf-8?B?S2RJbDJvSnljU1pBdHFXSWI1djZuRS9DZ0JkTDBhdW8ybUVvS3JrMDZuS2Qz?=
 =?utf-8?B?RlFpU3grTjQ3YzlRTExkRzAzbFRtOFdVWVpTVlZwNTVDeEJQb3ZoTGgrNFFG?=
 =?utf-8?B?YlFFdU8wYU9CRFpVSGt1NnFnK1ZsNDQ4NkQ4OFpyMEVjVVJTRFNkRHl6MUZT?=
 =?utf-8?B?b3ZaUG5oVEpkeFMyLzFVa25sSis0RVFKYjR2TUlPSjZFNnNrZnhsVHZoZmI4?=
 =?utf-8?B?azFCR29Balp1OTRud3I5ZTQ5ZmMxSmVvbG1QYjcyaWxhaGhsYUx0KytlNUoz?=
 =?utf-8?B?NEFZWjloM0NraEl5VDY1TkloNjJ5T05EZ0dRVjdDbEczZWVRcHZVaVR0dU9E?=
 =?utf-8?B?aFIzZ0VzVXJFYzRRYzJSQy9OYldrd2VPdlRFYzVzaW9Xbm9FbnNmZFhkcWZv?=
 =?utf-8?B?dTIxcEVTRGo2bmV3VTM1ZFZMOXoyUVdjM1A1U3Jqbjh1V2xkSkkyM3V4cTJG?=
 =?utf-8?B?enRQeVBsTEVHaFF6NlRuY2ZLUlRQaVMwSCsxYkN6am8vYXhreVYveVNFekJV?=
 =?utf-8?B?MHBpbEd0OEhMRkRiZGQvVFJkNVlHZE14LzRvSkx6MXBBNTMyN2VkRUg5ZEpB?=
 =?utf-8?B?YzVWVElURlE2cXhWMVVUbDljRWhwSEYxYUI0VTgwaElKNnJCakZ6TW93amRv?=
 =?utf-8?B?SnRUZkdWVGxnclY0ek94ZnIyM2ZVK1ZyYzg4bUN0TDE5T1ovMTlsNXhaVm1T?=
 =?utf-8?B?emdrVHJINEw2SytaWFF2RXN1U1hmUTFzL2tmU3JIZDdMK1FxY0dNY2JnVTM0?=
 =?utf-8?B?eTRHQmY3d1Y4VDFCL09rTFp2djVZOFFmUExnS2pDbTZyb2dSbHM4bnc2M2dV?=
 =?utf-8?B?SnExdmhKK2taRy9KZVplQW5DbldJOEloVU43RnpRdURESThQTml0anNaV283?=
 =?utf-8?B?NzgxSlo2NWJaN2JsNFI4MEpsaXN3SmNZVkNlOFNQa2VOT09vaUNUNlN6cEFG?=
 =?utf-8?B?UTFxM0s1dkNiMFMvakdRT1pqQnBHR2dQbXBLZmhZQ2k3RnM4dzBZZVVYMHkz?=
 =?utf-8?B?clVHK0ljTkw4QXN4dm9TbTFxL05MTzNpdTI3UG03QTZNMTVBZ2hpVFN1OTgr?=
 =?utf-8?B?Ky9QNHdsbytkZjBmT2owb2dzcTdHeFVKOFVOMXovUFd3K2QzSTJaYUFzRTds?=
 =?utf-8?B?MlRsSFhtRjB1RDdOYlVTK1owNDIxVndnOGNCUVFZcHRBVFUzUi9nMFVUcmps?=
 =?utf-8?Q?EGm/WgxOCeoB9oCHB7bvDIQtLbMqTd+Jwbe4r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A514723BF309B48880AAA5DD8104AC9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tJ5oLWbcaxzZiU5vWRC/21ir8EanjeJh7gWvxz87mTY/7Cf+CxgAOwfrEv8QaSLVTGMbLmKPNhnuaATEfNVEWF9T6zd9JtetuWdyvXMxD+/VTlKcHB5RdpFd5/el/FhK97rJT/nTSsMpdP/bBiUwK8D/6CRGDFlrNuUr9FmHJ9zD2xv2b3gCWgs9+p0bChnJjACDXZlTVZu8E5S+7f3PDcRs2RNqPB+yAGrI0cMuVUGOXbdzbqMEqEGTFuBg0jNrTD5977P4VY5AyE/0OvNGfTp38OuUmszM/tvNjyY5kXkk1YGomQn2NSqfX10v7iep0xY27avg2B4tJXipsUv9yg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d473996-05ff-4f8d-6389-08df0e075288
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 00:14:32.1858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ag7Ba48Luzl/1BC3yuk46sBwaOPSfTCVyqPIG5oEZqa3b8dbHz/IF8xP9Q7tgHPOXa5DWrmzy04ouwLBIwIPlr4NX71Uxe+Mx/V/556DDKr5nmtvt9cuH53dZgibGboM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB563386
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

QmFzZWQgb24gdGhlIGN1cnJlbnQgcmVzdWx0cyBvZiB0aGlzIHBhdGNoIHNlcmllcywgaXQgYXBw
ZWFycyB0aGF0DQp0aGVyZSBtYXliZSBhIGZldyBwbGF0Zm9ybXMgd2l0aG91dCBhbnkgYmxvY2ts
aXN0cyBidXQgYXJlIGNvbnRyaWJ1dGluZw0KdG8gZmFpbHVyZXMgb24geGUtZmFzdC1mZWVkYmFj
ayBkZXNwaXRlIGl0IG5vdCBldmVuIGJlaW5nIGFuIFhFIHBsYXRmb3JtLg0KU3BlY2lmaWNhbGx5
IEFUU00gaXMgd2hhdCBpIGFtIHJlZmVyaW5nIHRvIGhlcmUuDQoNClRoYXQgc2FpZCwgaSdsbCB1
cGRhdGUgdGhpcyBzcGVjaWZpYyBwYXRjaCB0byBsaW1pdCBvbmx5IHRvDQp4ZV9weHAgYm8vcXVl
dWUgYWxsb2NhdGlvbnMgd2hpY2ggYWxzbyBkb2VzIG5lZ2F0aXZlIHRlc3Rpbmcgb24NCnBsYXRm
b3JtcyB0aGF0IGRvbid0IHN1cHBvcnQuIEFsdGhvdWdoIGkgYWN0dWFsbHkgZG9udCB1bmRlcnN0
YW5kIHdoeQ0KYW55IHhlX3B4cCBzdWJ0ZXN0IHdhcyBldmVuIGF0dGVtcHRlZCBvbiBhIG5vbi1Y
RSBwbGF0Zm9ybS4NCih0aGUgb2JzZXJ2ZWQgQVRTTSBmYWlsdXJlIGNhc2UpLg0KDQpPbiBUaHUs
IDIwMjYtMDktMDMgYXQgMTQ6NDkgLTA3MDAsIFRlcmVzIEFsZXhpcywgQWxhbiBQcmV2aW4gd3Jv
dGU6DQo+IEFkZCBhIG1pbmltYWwgc2V0IG9mIHB4cCB0ZXN0aW5nIGFzIHBhcnQgb2YgQkFUIGNv
dmVyYWdlLg0KPiBCQVQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsYW4gUHJldmluIDxhbGFuLnBy
ZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsLWNpL3hl
LmZhc3QtZmVlZGJhY2sudGVzdGxpc3QgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL3hlLmZhc3QtZmVl
ZGJhY2sudGVzdGxpc3QgYi90ZXN0cy9pbnRlbC1jaS94ZS5mYXN0LWZlZWRiYWNrLnRlc3RsaXN0
DQo+IGluZGV4IGVjZDJjNTY4Zi4uMWE2YjNjMjU4IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRl
bC1jaS94ZS5mYXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+ICsrKyBiL3Rlc3RzL2ludGVsLWNpL3hl
LmZhc3QtZmVlZGJhY2sudGVzdGxpc3QNCj4gQEAgLTIwMyw2ICsyMDMsOSBAQCBpZ3RAeGVfcG1f
cmVzaWRlbmN5QGd0LWM2LW9uLWlkbGUNCj4gIGlndEB4ZV9wcmltZV9zZWxmX2ltcG9ydEBiYXNp
Yy13aXRoX29uZV9ibw0KPiAgaWd0QHhlX3ByaW1lX3NlbGZfaW1wb3J0QGJhc2ljLXdpdGhfZmRf
ZHVwDQo+ICAjaWd0QHhlX3ByaW1lX3NlbGZfaW1wb3J0QGJhc2ljLWxsc2Vlay1zaXplDQo+ICtp
Z3RAeGVfcHhwQHJlZ3VsYXItc3JjLXRvLXB4cC1kZXN0LXJlbmRlcmNvcHkNCj4gK2lndEB4ZV9w
eHBAcHhwLXRlcm1pbmF0aW9uLWtleS11cGRhdGUtcG9zdC10ZXJtaW5hdGlvbi1pcnENCj4gK2ln
dEB4ZV9weHBAcHhwLXN0YWxlLWJvLWJpbmQtcG9zdC10ZXJtaW5hdGlvbi1pcnENCj4gIGlndEB4
ZV9xdWVyeUBxdWVyeS1lbmdpbmVzDQo+ICBpZ3RAeGVfcXVlcnlAcXVlcnktbWVtLXVzYWdlDQo+
ICBpZ3RAeGVfcXVlcnlAcXVlcnktZ3QtbGlzdA0KDQo=

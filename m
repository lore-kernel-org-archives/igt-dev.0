Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DCC0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 11:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D65410E27C;
	Tue, 11 Feb 2025 11:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZj1KwIu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F4210E27C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739275176; x=1770811176;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EPB8l4eXuPrUkGtxQ5RE7mEbPsqqjtgEsxcXLT+GdIs=;
 b=YZj1KwIuKijaNgdMQ6YaYVMgvt8ztPCQ3sB3Ef/ovtS7LjqWFs3b84nY
 Ppm4lAYi40B2uND04lWcgNyuD+kNvDQULeYi+k5np7uZphSgWbjFMEAgj
 6FjpH5G2V9P8jTJ+jvLSkmbO5ibO0WR+A3GKWBH/ikZe4VQz3RAXbovJ0
 RPM7a8vjVEa5N2hW5LcHCLQPaS1JFouiGeXh2yGgDFO0t9NwreY+MIhzK
 I8V96UwIxpmlMnL0XJFn7jU5eCbthJNzw+6adahu0WEV4LNXwVD8AXhSL
 Lq7OPP5IDBADCNQx6vAryoPZvZ5iuT+WKzyVqgQM88CTARvEuktTcG8wR w==;
X-CSE-ConnectionGUID: j5oVT1elSP+t9q8CzVd1zw==
X-CSE-MsgGUID: s6r/7WopTQerZbZH/WTbxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27489219"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="27489219"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 03:59:35 -0800
X-CSE-ConnectionGUID: 9/IsNsJMT6SKKkdDZ5ItJA==
X-CSE-MsgGUID: hOHJKhZzQNOUBxZsGRSgcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143398598"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 03:59:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 03:59:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 03:59:34 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 03:59:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXd/WNik9Y4meVMiKyV/Jgr2qczhy9vzTSXvuj38veqSvUr6Ls8VKVDJwEseAQ1Z6RLaD28Yfldu+H6S5Uk1u3dXdIbdjzyzRQE6KAVPDr89FFxHQeIAYxxpfDVdwoLuJiSBhbj94sOz8IX7lx2/Lwz2w4M+GNaC42GtLqFlE1VWPLKSjCfia6/qzx9Ga4tL1T/QCtb9Bz8DgJd4KstVzzn0uPk2/a1LKHOvODnde9lAN6pn9wpuDEtjHgB2A/KFEIHYpP/QTGX5oexT6Up6Fgl3xHqoErWyTYFYef+M7Xq5jWsuFd9aL1abBinDLnPKNBNBsBsdPRyT2j7jDzdOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPB8l4eXuPrUkGtxQ5RE7mEbPsqqjtgEsxcXLT+GdIs=;
 b=eJRSOFWB9AOXo7Yopn+/DEhwrTYhvbkDgnjthyzH0zzID3eDTGZDRtheQoSwZoWgVwtKdy4h2murI4cgkuxSmNQwxmPL5loPRAsU7FR5kJ/DtnjWdxXRzAEFNQ6nLQyRKeK+QH9C7su3unntJQEftgDMYOYkAbgg/Ss6QBXsji/rp5QvFJMX7q5xGVIZATlE+siP0t0l9HSHsiAMF70KrTgmQ7W64y1VqcLcSdsq6hC2QWhOr6V1pxBDzHlI6ZVt5Z6bi34IaTiC8JdvMqkAf3MtD3QnQRGIdfpNY9AkLc1Unx/EvgfzJfIjm0dXcxyYTdNl0kWyO6cC6HHdQ7l9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by PH8PR11MB7144.namprd11.prod.outlook.com (2603:10b6:510:22c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 11:59:18 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%6]) with mapi id 15.20.8445.008; Tue, 11 Feb 2025
 11:59:18 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>, "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Musial, Ewelina" <ewelina.musial@intel.com>, "adrinael@adrinael.net"
 <adrinael@adrinael.net>, "Grabski, Mateusz" <mateusz.grabski@intel.com>,
 "Brodzik, Konrad B" <konrad.b.brodzik@intel.com>
Subject: RE: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
Thread-Topic: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
Thread-Index: AQHbeKsMrHyAdBp39kOuAY374BmYu7NB2zoAgAAJo4CAACIRkA==
Date: Tue, 11 Feb 2025 11:59:18 +0000
Message-ID: <IA1PR11MB6097AD4DB631A02EF73EAE1886FD2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
 <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
In-Reply-To: <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: ryszard.knop@intel.com,mateusz.grabski@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|PH8PR11MB7144:EE_
x-ms-office365-filtering-correlation-id: a9293846-e798-439c-139f-08dd4a938377
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?djdhTUFlM1Y5SGMvbUgxTWF2UVo5SHI0dlBQdktqVHhRSWJKTUFjV0xQUTV1?=
 =?utf-8?B?TmNFdy8rVmp4WGFneGxRU3pVVE4zR0k3dzNaZHl1dVhhcCt2MmhzcUl4WkFC?=
 =?utf-8?B?MmNsZGcyNGRWcUtRM1ZkamJoQmVFS2ZwYzJIYzBPWDRwZVJMR2lHVGFDZjA2?=
 =?utf-8?B?MFJUZG5hS2sxdDFXSnpyODZXYXBzbitNNTJGelJGMFlBTkswZGJCWGRxaE1l?=
 =?utf-8?B?QWZRamRHWmZUeko3SktUdCtMRFJTa3pYMzhSUElyZFdqTE8xMEdQL0hXVlUw?=
 =?utf-8?B?NlFDUnU5THpYenBGMkROVUhEK2tUbXAvUC81ZTFBV1N4d3VoRURqUzU2cHcy?=
 =?utf-8?B?OWhQZzR6dDZKSElHUElaZGlTcHV4ekRkd08vdmp4Ris1dFV5dzhOMHdONHcw?=
 =?utf-8?B?Vm1lTHp4MHRnNnliRFZwVjg4d0VSaVowM1FLQm9RTlNJWnIvVCtOcUk5N3M5?=
 =?utf-8?B?MzNXZ2xyMzdEWm5PVFZGZ0dSVFFCVkZzUFZJVjJJaFZYWHRnemlEVGViSWJ1?=
 =?utf-8?B?TTlGRGtOYjdET3dURzV1QmMxQkxHN1ZFMGQvTFhDOWlGcTUyWE1Ybk9TMVA2?=
 =?utf-8?B?ZUxqSm5vWW5xLzdNQklHMTZYZE8yWHNvSWpBa1JZc1U4ZmFOak1HWXc5Yjdp?=
 =?utf-8?B?SEQvUFZQa0VWbnRVRC9TeUN2VEdvSnVLdWwvakFobXRKcWc1eSsxN0dvS0V5?=
 =?utf-8?B?WTZGaDJDckZqSnBYL3FVUTlmaStQSUpTSmJ0THFLbzJrMXJuZzF5OHJ3ZDc3?=
 =?utf-8?B?UEtUVmFxMmpqYlk2SjVSR1JjdGhqUXpCLzMydURnOXdrYnUra2R2R0ZTM0RZ?=
 =?utf-8?B?M3RjWW5TdWY1K1ZNenA4cTZyNkd0Yy9JcFlTU2ZlRTF5UWVwelZtS2VINUht?=
 =?utf-8?B?V0ZSdHVhalMzZ3FmTGM3Sk81N2d3SFhibWxEYmFpczdFNkJLb3BGWEl5S3lP?=
 =?utf-8?B?Q0RZZy9vQmxWZWF1NHhSVXVHK3FpdGdJN0IvdmI3OWg1OUYwc2JvRUs1bGkr?=
 =?utf-8?B?UEx1UDZvais3b1ZXa2pxNUx6WjlRbGdZR1RIWWZhL2V3czBOcHg1MDlGbmgw?=
 =?utf-8?B?VlFkRE9uMTN5YWQ1ODc2UGRBSXFRRDRLYmhkK01FMzFqUlFlL2xLa2pYMTJu?=
 =?utf-8?B?aC9TWlBnaFFWT3NDRGx1Z3pHY3BGZG53QXRxWUhmU0t3Q2I5cnFXNVhha0xV?=
 =?utf-8?B?blB2RWxqc3BaMEZRQk02VzFJUVhTaUJzVTFPY1BZMEZ5YVRGbFBTNE9NYnc2?=
 =?utf-8?B?SVE4em42YjdEVDN6OXNLNXl4b0cwVjF4MkxLRDE2SXJZOGhDNWt6TDgzZ09q?=
 =?utf-8?B?cGhPM1p0b1loY1lFQTgxTG1DczdUOEJPcEZNNFdPN25LbkJTaGhaSE83TC9v?=
 =?utf-8?B?ZHJlV29UYVZmRWtBNUZxd2JvTHYvTFUxTFpwSDVsS3dNdUxZd3ZNVjF4R0Fw?=
 =?utf-8?B?UTYrQzJiZWRjcVp4bkdUMk9QZVVKcXVhYmkwaEVXNkpxRVc4eTlXbTl2dThs?=
 =?utf-8?B?M3lCc0pYK2lWYzQvdmw5S3VPR2d0QlVwdFZycnl5VHhET1NCSks4YjcyNzFL?=
 =?utf-8?B?MnloY0NBMkU2R1lJY1lMY0lkWnJtUHc2TmlpMWdIWDg3N095VWhsQU9lTHd1?=
 =?utf-8?B?MDdndDB0Z3ZSWWtqaW52SkVXdWV2ajRITG1qOEV1a2lvWmJNNE9jYTR0QVo3?=
 =?utf-8?B?YmN6ZExIZk9IMHlFOGZQanZ0UFZxMkJ6VzJJcDc3RmlLQm9jRG5nQk04N29S?=
 =?utf-8?B?MlFDWm13YXZyNXRQZG9CNk9LN0E1blI3KzIwMEdQSExqQ1FSN1dwWlJCa1Zy?=
 =?utf-8?B?YkFhcnNFZmNqR0VBLzBWcFlQbEVYMDJaRllUK3pDUVRJRzYrVytRUktJWFF1?=
 =?utf-8?B?NDlqYkNkQk9DWEpVTjg2SCtGdC9uTjJFb0ZhT05DU2E0R1BOVzR5QmVJVUhs?=
 =?utf-8?B?VlU2akdPNk1MVzZhTWltb3g1M2tDRFBRd0R5S2JoR3NZL0FRVlFqTVZyRU9R?=
 =?utf-8?B?VzlrTk5KTnR3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(921020); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUM1dlF5d0JaVnlURjdNQVBMcm1qRjJFOUZQeURObVpob1dxOXBEaTdPZTN4?=
 =?utf-8?B?dUZudi83UG90N3g0dS92QmZDUnBoUm9mUVl5NURuUi91MXJaNE0yRHQxdTRN?=
 =?utf-8?B?emxuOWxNd2lmZUdMK2R3WFJsdzhLRCt6Rm5OaExONTlGbFVyTDNRM0hQWUw2?=
 =?utf-8?B?NjZQaVZEanZJUjZNL0lFYm1nUmpxaHpWV3FRbGdpU3ArYnVycnYrU1F2OUkx?=
 =?utf-8?B?N0N5NFJsaGorK2dub2Q5SUNpQmRqTWZmSVFkR01wVys5NmpKN1FkaWxUa05O?=
 =?utf-8?B?NzFGRHpOSzBRTWZkZkJBeEk1b0JRQ2pweVo0alFxY2llWTJnRXZ5UTcyREt0?=
 =?utf-8?B?eVplbFVCRU5hdnU0VUVIUmNncnlTeEtzd3M2aURYbExScUcwcUlldjlvWUdY?=
 =?utf-8?B?ZExkdjFxVFV2SzBERGxtOGJSQVJNckplZ1FxVXZ6S3hYQmRudnF5Y0MwZWl2?=
 =?utf-8?B?TnFPdWZmeS9NaVdDemZUZHBYNlU0QW9OSjdZN3RzakdQZytNV1dJTyt4em1Q?=
 =?utf-8?B?TVA5RWhCVVJqNDRsTlpaNkZoWWZWQjBDd1Y2aWtZRnNMd1d4bGFYdW5SVlgx?=
 =?utf-8?B?MXBWWk9rVkh6WW15WG55ZVdIQUJ2UmhqMUt1amRpVXUxRGJ4NXljbTM0VCti?=
 =?utf-8?B?VWZ3cmxhRDEyYzJFT0gwNHVFcjdYdkdKTEdHSlEyZThtTTZZbjl3b2thSWx0?=
 =?utf-8?B?bzNjRXZBREdHU0IxZ2h0RmwzWng2WmpoM2dnTExQcHBTdFVKRUV4UWlTUzVS?=
 =?utf-8?B?amoweEFyM2NxSlJoVHFxNG00QkZSZ2UxVS9OWmUrNnk5NjBXK01OQzROM3dk?=
 =?utf-8?B?UjlOVHZiZUVjUEVjU1VqLzMrbElhMHJvT1YvUktRMVpiZ2pVK0tzNE5XUlpR?=
 =?utf-8?B?UmRpajQ4aFloa2RSbWppSmZGdFdWYVdONXNaMFlFV1phSUVrWm14ZHhBTXdW?=
 =?utf-8?B?dk5xOHR1ZUtVTWJNUDZHUzh4RXRSKyt6aXd5SE9RYmxZSno2MnlOZzVmbFBQ?=
 =?utf-8?B?ZmtUUjllSjlUYlU0WDdFalJoUHhNOHlDdHNVQ0xkbHJ1TmhnTlNqVW9ZK3lR?=
 =?utf-8?B?SmxLYkxldVY3b2lscTdSUUxCMU8yNVE1eHRRS1pCaWk2NFJoOXp6VFFOMWtJ?=
 =?utf-8?B?QkFibCt0NnV3WnFrR0tUT24zM0d1MlNiQXdYU05IMWpZVTdJS0J5M1FZaVNs?=
 =?utf-8?B?ZHVNRCtlMWJDbG9LRVNIY0o2U1k2Q1pmQVl0Ymk4cXNFN3VzcXZGaXBtOUx1?=
 =?utf-8?B?MTd0K3o4c0VjRUhsbnU1RGVzTDhQcXpjTnErbjczczM0ZHgyV1ZnMVJnUFVw?=
 =?utf-8?B?M1pTVm1XSVJFb1JicjRmc2h6eUJVSjRCSXB0bExwblBMM2Yzd0IxWjREWDJD?=
 =?utf-8?B?c3FRZTlGV21NbndhTGZ1ZzZXL05DK0hIclZYTWZScFBIdzVtODQ2VmZLc1FU?=
 =?utf-8?B?Qzk0OUdDOWs0djhKbVo0ODdrczZhK3pFUWRLZm5lSTZaUkEyV0N6QU8xSzdF?=
 =?utf-8?B?RU5JL05salhMWEZKRFVjeUtqSVZUdzRvWmF3c3JYNWw5VE9YYmdaZW9GNXVs?=
 =?utf-8?B?T0VNazVMUjBxZ1dmMjVxK1VhbDFrSFM0VDlJTlNFVG9XZ1d6T1dzY09vTkJY?=
 =?utf-8?B?NjRveUZFMHVUY1hMLzRsUTI5WVRYYVlLeUp3cHo5MVcvUm1neHJxNzFBeFRz?=
 =?utf-8?B?b1FEUVN5THBkaWhEK3BjWUtTbVNISDFaMDBwVFVkUU95SDhzNzlJTEJsTDVD?=
 =?utf-8?B?Q3B2ZTBnN25jck9ac0g2OXpkeS9EbHZScWdSY00zcXdyRE5rTGZCWWUvYklD?=
 =?utf-8?B?OG4vZ0N2cVNObklEV2Nzc2Q4LzRRSlpqbFRIMXFVMS9FQUJUS0wwN2hsZDdC?=
 =?utf-8?B?dHk3cmhaYnpHSmUvUWxVdHFLYWFEaklDWnh6ODRjaTlGQmgrUlJ3N0lBNGdk?=
 =?utf-8?B?Q1hHdU8zeWhUMDk0YUhIT3lOaTBabEtwb1U0b2w1QUtXaHd1b3FGV2JmTWxQ?=
 =?utf-8?B?NmtxOHlhbjF2Rk8rSEwxY1ZveE5zVDZBZ0Vac1V0VmlCQ1dNTFNCOEZiaG05?=
 =?utf-8?B?NXpWUUFMOGtUeGkyQVIyd3k0RkhZdkc4TnJYZXFhd3BpR1lFN0V3TGJLQytx?=
 =?utf-8?B?UGFZVlJtYlRmanFvUGZTVjd6NmRVWW9nWW9hc1g2MjJpeEFycHc3SDZuV01p?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9293846-e798-439c-139f-08dd4a938377
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 11:59:18.2231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CzVF3eKUp7SnnMWq9kPUbKsLF/ZjznKbh9LdgBkKBzYZ511TtctZdhxcrLXJtYN/7m/fXxdsG9UotwbyNE59zVJ4kjFKGmcG4IosaeO7O0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7144
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

SGVsbG8gUGV0ZXINCg0KDQoNCkhpIEthbWlsLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3
LiBQbGVhc2Ugc2VlIGJlbG93Lg0KDQpPbiAxMS4wMi4yMDI1IDEwOjIxLCBLYW1pbCBLb25pZWN6
bnkgd3JvdGU6DQo+IEhpIFBldGVyLA0KPiBPbiAyMDI1LTAyLTA2IGF0IDE2OjIxOjQ3ICswMTAw
LCBQZXRlciBTZW5uYSBUc2NodWRpbiB3cm90ZToNCj4+IENvbW1pdCBkZGZkZTI1ZjE2YmEgKCJy
dW5uZXI6IEFkZCBzdXBwb3J0IGZvciBhYm9ydGluZyBvbiBuZXR3b3JrDQo+PiBmYWlsdXJlIikg
aW50cm9kdWNlZCBhIDIwIHNlY29uZCBkZWFkbGluZSBmb3IgdGhlIERVVOKAmXMgbmV0d29yayB0
byANCj4+IHJlY292ZXIgYWZ0ZXIgYSBzdXNwZW5kL3Jlc3VtZSBjeWNsZS4gSWYgdGhlIG5ldHdv
cmsgaXNu4oCZdCBiYWNrIHVwIA0KPj4gd2l0aGluIHRoYXQgdGltZSwgaWd0X3J1bm5lciBhYm9y
dHMgdGhlIHRlc3QgcnVuIHRvIHNhdmUgbG9ncyBhbmQgDQo+PiBwcmV2ZW50IHBvdGVudGlhbCBs
b2cgbG9zcyBmcm9tIGFuIGltbWluZW50IHBvd2VyIGN5Y2xlLg0KPj4NCj4+IFRoaXMgZGVhZGxp
bmUgd2FzIHNldCB0byBhY2NvbW1vZGF0ZSBvdXIgaW50ZXJuYWwgQ0kgc3lzdGVtLCB3aGljaCAN
Cj4+IGNoZWNrcyBmb3IgRFVUIG5ldHdvcmsgY29ubmVjdGl2aXR5IGV2ZXJ5IDUgc2Vjb25kcyBh
bmQgcmV0cmllcyB1cCB0byANCj4+IDMgdGltZXMgYXQgMjAgc2Vjb25kIGludGVydmFscy4gSWYg
aXQgZmFpbHMgMyBjb25zZWN1dGl2ZSBjaGVja3MsDQo+IA0KPiBUaGlzIGlzIGEgbGl0dGxlIGNv
bmZ1c2luZywgeW91IHdyb3RlIGluIGZpcnN0IHBhcmFncmFwaCBhYm91dA0KPiAyMCBzZWNvbmQg
ZGVhZGxpbmUgYW5kIGhlcmUgaXQgbG9va3MgbGlrZSA2MCBzZWNvbmRzICgzKjIwKS4NCg0KVGhl
IGZpcnN0IHBhcmFncmFwaCBpcyBleHBsaWNpdGx5IGFib3V0IHRoZSBkZWFkbGluZSBpbnRyb2R1
Y2VkIGJ5IGEgcHJldmlvdXMgY29tbWl0LiBUaGUgc2Vjb25kIHBhcmFncmFwaCBpcyBleHBsaWNp
dGx5IGFib3V0IHRoZSBpbnRlcm5hbCBDSSBtZWNoYW5pc20gdGhhdCBpbnNwaXJlZCB0aGUgZGVh
ZGxpbmUuIENhbiB5b3UgZXhwbGFpbiB3aGF0IGlzIGNvbmZ1c2luZz8NCg0KPiANCj4+IGl0IHRy
aWdnZXJzIGEgcG93ZXIgY3ljbGUgb24gdGhlIERVVC4NCj4+DQo+PiBBbHRob3VnaCBvdXIgaW50
ZXJuYWwgQ0kgc3lzdGVtIGNhbiBiZSBjb25maWd1cmVkIHdpdGggYSBsb25nZXINCj4gLS0tLS0t
LS0tLS0tLS0gXl5eXl5eXl4NCj4gUmVtb3ZlIHRoaXMuDQoNCk5vLCB3aHk/DQoNCg0KS2FzaWEg
LT4gVGhpcyBpcyB1cHN0cmVhbSByZXZpZXcsIG5vIG5lZWQgdG8gYWRkIHdvcmQgJ2ludGVybmFs
Jy4NCg0KPiANCj4+IHdhaXQgdGltZSwgZXh0ZW5kaW5nIGl0IGZ1cnRoZXIgd291bGQgdW5uZWNl
c3NhcmlseSBwcm9sb25nIHRlc3RzIGluIA0KPj4gY2FzZXMgb2YgRFVUIGhhbmdzLg0KPj4NCj4+
IEJ1bXBpbmcgdGhlIGRlYWRsaW5lIHRvIDQwIHNlY29uZHMga2VlcHMgdGhlIGFib3J0IG1lY2hh
bmlzbSBzYWZlbHkNCj4gDQo+IGltaG8gdGhpcyBzaG91bGQgYmUgb3B0aW9uIGZvciBpZ3QtcnVu
bmVyLCBJIHdvdWxkIHByZWZlciB0byBub3QgDQo+IGFkanVzdCBpdCBsYXRlciwgbGV0IENJIHRl
YW0gdHVuZSBpdC4gT3B0aW9uIGNvdWxkIGJlIGVpdGhlciB0aW1lIG9yIA0KPiByZXRyeSBjb3Vu
dGVyIG9yIGJvdGguDQoNCkkgZGlzYWdyZWUuIFdlIGNhbiBhZGQgdmFsdWUgbm93IGJ5IHBvdGVu
dGlhbGx5IHByZXZlbnRpbmcgcHJlbWF0dXJlIGFib3J0cyB3aXRoIHZlcnkgbGl0dGxlIHJpc2sg
b2YgY3JlYXRpbmcgYW55IGlzc3VlLiBUaGUgcGVvcGxlIGluIENDIHNlZW1zIHRvIGFncmVlIHdp
dGggdGhhdC4NCg0KVGhpcyBwYXRjaCBpcyBhcyBzaW1wbGUgYXMgaXQgY2FuIGdldC4gSSBkb24n
dCBidXkgdGhlIGJlbmVmaXQgb2YgdGhlIGV4dHJhIGNvbXBsZXhpdHkgb2YgYWRkaW5nIHlldCBh
bm90aGVyIGNvbW1hbmQgbGluZSBvcHRpb24uIEl0IGlzIHdheSBtb3JlIGVmZmVjdGl2ZSB0byBz
ZW5kIG9uZSBvZiB0aGVzZSBldmVyeSA2IHllYXJzIG9yIHNvLg0KDQpBbSBJIGNvcnJlY3QgdGhh
dCB0aGlzIGlzIGEgbmFjayBmcm9tIHlvdT8NCg0KVGhpcyBsb29rcyBsaWtlIHdlIG5lZWQgYSBn
b29kIGRpc2N1c3Npb24gd2l0aCBDSSB0ZWFtLiBAS25vcCwgUnlzemFyZCBAR3JhYnNraSwgTWF0
ZXVzeiBjYW4geW91IGNvbW1lbnQgb24gdGhpcyBhcHByb2FjaD8NCg0KVGhhbmtzLA0KS2FzaWEN
Cg0KPiANCj4+IHdpdGhpbiBvdXIgaW50ZXJuYWwgQ0kgc3lzdGVtIHJldHJ5IHdpbmRvdyB3aGls
ZSBpbXByb3ZpbmcgY2hhbmNlcyBvZiANCj4+IHByZXZlbnRpbmcgYSBwcmVtYXR1cmUgYWJvcnQu
IEZvciB1cHN0cmVhbSB0ZXN0aW5nIG9uIEplbmtpbnMsIHRoZSANCj4+IGRlYWRsaW5lcyB2YXJ5
IGZyb20gMTYgYW5kIDI1IG1pbnV0ZXMsIGFuZCB0aGlzIGNoYW5nZSBoYXMgbm8gaW1wYWN0Lg0K
Pj4NCj4+IENDOiBqdWhhLXBla2thLmhlaWtraWxhQGludGVsLmNvbQ0KPj4gQ0M6IGthdGFyenlu
YS5waWVjaWVsc2thQGludGVsLmNvbQ0KPj4gQ0M6IHJ5c3phcmQua25vcEBpbnRlbC5jb20NCj4+
IENDOiBld2VsaW5hLm11c2lhbEBpbnRlbC5jb20NCj4+IENDOiBhZHJpbmFlbEBhZHJpbmFlbC5u
ZXQNCj4+IENDOiBtYXRldXN6LmdyYWJza2lAaW50ZWwuY29tDQo+PiBDQzoga29ucmFkLmIuYnJv
ZHppa0BpbnRlbC5jb20NCj4gDQo+IGltaG8gYmV0dGVyIGhlcmUgJ0NjOicNCg0KVGhhbmsgeW91
IQ0K

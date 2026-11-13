Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C571606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kKMlDkNP;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VO4exQSJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BC91124D2;
	Fri, 13 Nov 2026 10:47:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B053D1124D2
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794566783; x=1826102783;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Rb82ZsKKHoCN/AcWjeokfbppJwHZ+XprFbZzs5H57wU=;
 b=kKMlDkNPafSkWB6YKssKz4D/2yp9BUfYi86KPQ9JExI8LWN6UQOu0HEB
 rq9t6DahoLi/RLXOLOPYu2qGkgFhF2Hzw/fThmYzaVvLq27PWwLDsUK+A
 9cRe272i+oNHgbTOE9PMV/ejJpiqBLSH22DFA85ZUpkWf2bf5JXWDX/d+
 yA3bwh94eR57n1Gyt7T0xnTkn84KuZF0t20C6Krcbp6E5vM6w31ooN6co
 z0SR61awGUrh9LjXws3+ik4cNep7AQYPz8Qa0oEmpgC7AbISsXBJ7SV7B
 tnR2VA8lCMfJupvaxKazCAwMnoYPRiqNjXVwy4xOZkGDeK/nrwH2PzqbD Q==;
X-CSE-ConnectionGUID: vf74sR1kTuqWH7ByjZsY/w==
X-CSE-MsgGUID: aL6akwNLSY+QCX+uKrirnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3399071"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3399071"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 02:46:23 -0800
X-CSE-ConnectionGUID: h7Gjqr8CQl+nHfM2kpA8LQ==
X-CSE-MsgGUID: Or4AipPNT1GopeJKunEDoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9219206"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 02:46:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 02:46:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 02:46:21 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 02:46:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7PdyN7YCrQvFHmmwfFW1FhZPHD1ph0/A3XOcJeKcmdf3yOsZ9GbFey3pvuMFxQABrsJ5s3t2FLM/EZaMtXuufeu4LkIt7/aQztgiScM/9lJ8z04Hzuw36tZ2l8w/zZSsAW/LMMjth3fJpFXMlkKZV5HbJQdHXuyo9uss8LZ5vtHadHgl0K9FrZ34o/psQ26hTVGcZxyC/W8l8OLgZ2mW57b68W1lU/EI5Qg1F2rAVCgT7tCNOfSgXT4QMQreYQPmXVGhLqGJm1EjgGFDHwlh+Zo8/aSagRCxsvvO3wfhF9RnXHEoocuBiBtfQI2ti7iz79iUBWeqpUKdXHyGL+Xhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rb82ZsKKHoCN/AcWjeokfbppJwHZ+XprFbZzs5H57wU=;
 b=Z6kDSRPGv1ms3VNa5tXKWUmvQsxTkjbk3oyJ/qLIMRMXs6UmvZnWxxgOQH9MwEHyIgny7K+ZYfeayGuIb4/B+cxSQVeAL2c9bdvKKxHe6CNjABUpipNv1bQW5MB7zWR+1afbrg6kMPawf6WvzBpJXelXxSzlyakyEQEKsDM2lw7qevXwLQCaiHpQdLZk2QnSPmPK4aMIGeFLDQh/mjxcRtRl7Zy4EbiuO2LPpkLb1FavV0YLtRg9yORZ6U5ACKRuqV+R804UE+9rI5cQ2QN+z9XkYxqLrMIjMWlNDn/7CXniZPW04X/TKoCl8nF+Qxf8c9+/tLuo4Qyu37kVWdAtjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb82ZsKKHoCN/AcWjeokfbppJwHZ+XprFbZzs5H57wU=;
 b=VO4exQSJo1QfLxd6TnsZFG2ow4N62g3m7Losz7vX/iMhSKePzRUgFK2VYgLcbRACC/p1ZAN2g5ITsI5/mwOgXULOT4KTQLFaQrGNaJwJgmM648/lfgher7btYMh9BAt7G2c/otqpc1ey1/XgiyJXX2n8APrifqzjAzvDKf+O3T0=
Received: from MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 by CH9PR11MB9904.namprd11.prod.outlook.com (2603:10b6:610:343::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 10:37:59 +0000
Received: from MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1]) by MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1%6]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 10:37:58 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 3/3] tests/intel/kms_psr2_sf: Handle the joiner
Thread-Topic: [PATCH i-g-t v2 3/3] tests/intel/kms_psr2_sf: Handle the joiner
Thread-Index: AQHdbF2FE0pcxC1LyEuV7aMtRgJIZ7cqJESAgAG4oHA=
Date: Fri, 13 Nov 2026 10:37:58 +0000
Message-ID: <MW4PR11MB657029CA6D68E63CEB97580EEF7F2@MW4PR11MB6570.namprd11.prod.outlook.com>
References: <20261104130737.2549248-1-mika.kahola@intel.com>
 <20261104130737.2549248-4-mika.kahola@intel.com>
 <6721148a317b37b9b9ae273f961cdd7cec231fc0.camel@intel.com>
In-Reply-To: <6721148a317b37b9b9ae273f961cdd7cec231fc0.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6570:EE_|CH9PR11MB9904:EE_
x-ms-office365-filtering-correlation-id: ef1307a9-f87a-4637-a8b1-08df41722f05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|261009223027099003|3023799007|4143699003|11063799006|56012099006|10067099003|261102123227099003|261022105027099003|261026121527099003|261028144727099003|261021121427099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: tAvtPh/knxXtaGeHcDFmozsJSC4+ggdkQcUZd6tUqAV+8dbm1Xao3AUasDknoLnsfp7Bns2FeoOg4xezvzOCIZRCuHpIbwmiPGqRud+tR1P77I/skNAGqVYO+kjODpfLcCdHrRfg7bSoS9Z/hIQ47J9hRwZ0Z11auQjnmHIO/Xo6IR6FQGx35zKQ8E9Dy6vYnIgLsAP6Fr7LOwOmFrlNof4bJnm9GDNvk/0k48EBQ4PxH5cZlY0vcrUjOQOt/RgjQKB2wPSJ3Xxk6oDCducToXAzDF2k824meW7QcL/uMLRRx2h+KMWb2IuesUS+EvAPCLNekDLMul1ZmHzXwdPWcBXpQedjmF6pAYWVSsKadHnO5oolctfajcmgQP7XYPOwube2/yjVy6CMJLuPELeZBdYUNmoZNWCk5AM1mTd04nZFpOuDrd3FJnwtprM3zB4vC8HNSlQQ5YcUNDxS14vDp2gBMa5S3vSZgGfpdg+zrUuvGULDO6lZdo1uGPhscBFLuRBXUW8XgDL9CGU9DloTuRG11p4ux8UPJZIay3WLRotBYgVgENLq+YdIGrgztQ2uztRsGjzDqkwOQqr5b2jUsUaKtGWlxq4Axo2zid54dWRfodWqhBDEBKBf/+CzkQhSbA0h8mWopanmnrioAjJGdpyqB0polVCTUUpJtgsBKRBUu+XpQhCGybn2HsHJo3SyqeMZ2Y1g/ZNVTmZC+QG6HvG261kw5uNTMow3wkrsFBI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6570.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(261009223027099003)(3023799007)(4143699003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261021121427099003)(261026140227099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vi9tUWJFVExGRVk4VDEzcHdmNTFlSm9KU2loRmYwUHoyMTFUb0hrYk9vbnpz?=
 =?utf-8?B?R1AraElBdS8xOG0zeSt1c3JzQzV5ZEk5QkRtWHBkUVpwYkMrRFJ1Q3I2RnNK?=
 =?utf-8?B?UmdhMHpuS005YXJNRGtiUVZiZUJhNVF0eWxhVjlZY3Z2UGtzazhSeG56Vnh2?=
 =?utf-8?B?OTZRMit2YTVSTTBSNUxyNVd1dWpteHNyc0poUk1pZE56OG5WRStXMkFRV2h0?=
 =?utf-8?B?a0lSa3h2ZEJleGVyQ2VaSzZZZmJRTVdKcDlvN09iVlY5QzhBbDBOREljcjBD?=
 =?utf-8?B?bVMvd2pZYko4MTBYenNlY0VwRnVxWG5XVURPV2txM1k4SnZnNVhYNUJFd0hU?=
 =?utf-8?B?V0dCQnpEWHNMSmc5V2Y4QWwzeVVUci9WcjVaU1Fad1U3QitiVDFMQStCemJU?=
 =?utf-8?B?K0dvVkhFSkNlTlNkdTNMUUptYTMxVlJvOFJxN2U4cSt4bE95WWpleG5vbyt4?=
 =?utf-8?B?M3NwdSsvUmNzajdOa00vQzMraEVvWm9FSHV6eDA3LzlTK3lMRnh1Mmc4Mko2?=
 =?utf-8?B?Q0JubWgxSUV0d2NkcmJCK2l5ZzNScy9ZdC84c245ZHUrQnVnTnJqSlpzQ2ta?=
 =?utf-8?B?RkpLYllQYlJLWFdJQUFzdjQwZWlHYzN3Sm1XeFdJOFMrcGtuYjZicG9RVmp6?=
 =?utf-8?B?MTFRRG9tRkJvOS9WWXhKZXJmR3A1L1hKeGU4bG45QlFaVHdqdjFvZmx6OEZq?=
 =?utf-8?B?NTFKaTFxbHVPMG9xY0t4SXVibmV1OUxtMjY2ekZ2aVcrSFpVM0phdldxeDlS?=
 =?utf-8?B?dFhiU1VmRGhxVEFGUERpU0hxSVdicjhPVnNBZGpPSTJsQVh5Ykg4UUdqVENQ?=
 =?utf-8?B?blZuSXZETVJEZ2lpK01VSTJRSGFIQ0FYaHoxUEtzcFRDUmN4MFMrT1hNL2th?=
 =?utf-8?B?eE80MVlxNFlYWERSbmRBRDJWSDFhS1loRzRjdnd1OEpacUQvOGJQR2tQVnly?=
 =?utf-8?B?Nk1zcVBCVWU4TWE1YzU3bnpjZ2gydkhxYXdqUW1ZdHljeEVsOXprOUVTU0pm?=
 =?utf-8?B?ZWQ5aktvbUVMWlNEUS9QNStYSUFFWnhHdEF3SmdSV2ZkTDFkRi9qMGtESUtE?=
 =?utf-8?B?TStFY0lHMnFEUGw4cHE4cG5xcmxOeUhtVnpoWUFPaTZFY3lTMVVCR3NXaWZl?=
 =?utf-8?B?WXlPd3BneWNSaUQ0dVN3SXI5NnJKc0VxQXczNGRsRzV6Mi8zdjVmVlhzelMw?=
 =?utf-8?B?OXVzN1Z1OW9PKzRQekZaQ0ZWZExoMlNFSGw4UmErc0VReTVhVERweGNCVFJ1?=
 =?utf-8?B?eWxFTm1SRGQ5SUJydGhUS2ZJV0ZNNUdQSzZNdGxUYWRVdVU1SnF2eE1FSHBS?=
 =?utf-8?B?TXljN2lRYUhsNlR4ZjlEVkhDZk81NXM2N21IUEcyZ3RwSXZZb29LcmhJcmha?=
 =?utf-8?B?WUJxbmlJajdPdUVpdFp0U1JFR3JtM0xxVzVBZ2piRnl3UklkeUcxZFovQXdu?=
 =?utf-8?B?dVdhcW1IUzNvVzJGTEd1OGxqY0g5aFRRSjBJRE9ObzNSS1VlbXppOFRjVGZP?=
 =?utf-8?B?YTUwdEExRXZ1U09jQ1cwRHJ0VDZzYjFWb0ROamc1Znh0djdLKy9IU1FnU1Jq?=
 =?utf-8?B?bmpuSDltZUJLbHg2dTJqL21VcTlkcjhTdWsweEV6REkvbFVldStxL0hkWmdP?=
 =?utf-8?B?UThkdkhLSE9mWC8vR0NFZkNlM2RLZnhXWmMxODR5WGZ1bXdJWjlraDh3YmhW?=
 =?utf-8?B?VEVBcGdhRGxhR3VnaVZkV3NVWlZLaGZUZy9aU0NUZXpDbUFpT2VrT29oZTZD?=
 =?utf-8?B?c0VTRFFTUFlqUG9peGVnYXU3ZWhsZGdoZEhnalJtelpXMU9zVWdkNXRhd3JT?=
 =?utf-8?B?NDc4M1VzeXZWZVZYMmdBRWRzU0dPMVhRd3FqZmU5dHhidFVzMWpqdXlxektB?=
 =?utf-8?B?N3JGdU1FWnVSczViUG84MlVPMnQzUjlxaTk2Zng1ZDJEemZkejZhL3JtMDJj?=
 =?utf-8?B?SjduZ3lOS1h6ZmUzL3VKV0JYcEN4OVIxWmlpbmNaaGh3REZLUWxDZVJVdWpz?=
 =?utf-8?B?NXdYUVhWazU2bWVnQm9TczVXM1FWWkQ0elo3bktaSW9OUFluVHZaTkN0djVS?=
 =?utf-8?B?UUFLS3M3am9Yc3VxUkpxL2dlNzFjM3poZWdwR1pZZHhVYi84T0tzaitSRHlu?=
 =?utf-8?B?TndRL1lmeGpsT1dhbktDdVJSR2JyaGNpYmYxRWFVelIvSVgxbGI5bzBOUTl1?=
 =?utf-8?B?KzB5WmYxakZ5MWlvNVMzZ25PcC9aNkVUZ2c5dXdiVDNTcnFHUG9ydW9zKzAy?=
 =?utf-8?B?N0IrMElaWXh4RkJVK1dlaHprZGRzajRKemk4VVM4WmxaRWc0RzZRRWxRaDd1?=
 =?utf-8?B?WTl1M0pFQ0RTb1pLZTBGWWlNMUt6UUdFR2RYSS91VTdNaGRsVDBSZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wLADmPz9eakg/Sm2QlFNrrNMiH5djyPtMOfJ3/0/rVP5xnU7LMaX5+JhBO29LlGuDMCIC+JOZbmZ2ZBAj9BSDEfhrdh69JSNEEC3IQk6axzNOQQvJaBfdrPqLGab8JRmQxrjn39TRauyX4aQKrzIIJuKbrfI43L7vOMZqMVVAoWmqTFxuMwO7HVoFxvUc219bqvL47cDIYgs3NjZ8vW2OUglCnrzRPWEkkML3FfkJbLagj6y1r2bTJ/KVl6HvX7P3MZQefuwzuPqaOhNeV8g45dcyOVWDVAbA53cUmBEFLuUifROWwYNOdzseOkPooIrLAoXT19/qiXqMpw7WBN/tg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1307a9-f87a-4637-a8b1-08df41722f05
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 10:37:58.0796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o59JuR1wichsh3qwln4i/DWC63V2Qkouh5sZB3nkrmIfT/CacPAdcomT/wxZSdypSO+cuFFmRjjnVlXz1IEavQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9904
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIb2dhbmRlciwgSm91bmkgPGpv
dW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDEyIE5vdmVtYmVyIDIw
MjYgMTAuMTkNCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBLYWhvbGEsIE1p
a2EgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2
MiAzLzNdIHRlc3RzL2ludGVsL2ttc19wc3IyX3NmOiBIYW5kbGUgdGhlIGpvaW5lcg0KPiANCj4g
T24gV2VkLCAyMDI2LTExLTA0IGF0IDEzOjA3ICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
PiBQU1Igd2l0aCBqb2luZXIgaXMgb25seSBzdXBwb3J0ZWQgd2hlbiB0aGUgam9pbmVyIHBpcGUg
bWFzayBpcw0KPiA+IFBJUEVfQXxQSVBFX0IsIHNvIHNraXAgdGhlIGNvbmZpZ3MgdGhhdCBkb24n
dCBsYW5kIG9uIHRoYXQgcGFpci4NCj4gPg0KPiA+IHBzcl9lbmFibGUoKSBtYWtlcyB0aGUga2Vy
bmVsIGZvcmNlIGEgbW9kZXNldCBvbiB3aGF0ZXZlciBpcw0KPiA+IGN1cnJlbnRseQ0KPiA+IGNv
bW1pdHRlZCwgYW5kIHRoYXQgZmFpbHMgaWYgYW5vdGhlciBvdXRwdXQgaXMgc3RpbGwgZHJpdmlu
ZyB0aGUNCj4gPiBqb2luZXINCj4gPiBzZWNvbmRhcnkuIFJlc2V0IHRoZSBkaXNwbGF5IGZpcnN0
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiDCoHRlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMgfCAyMiArKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMgYi90ZXN0
cy9pbnRlbC9rbXNfcHNyMl9zZi5jDQo+ID4gaW5kZXggZmE3MDkwY2U4Li5iMTU0ODhjYTYgMTAw
NjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYw0KPiA+ICsrKyBiL3Rlc3Rz
L2ludGVsL2ttc19wc3IyX3NmLmMNCj4gPiBAQCAtNDA3LDYgKzQwNyw5IEBAIHN0YXRpYyB2b2lk
IHByZXBhcmUoZGF0YV90ICpkYXRhKQ0KPiA+IMKgCWlndF9wbGFuZV90ICpwcmltYXJ5LCAqc3By
aXRlID0gTlVMTCwgKmN1cnNvciA9IE5VTEw7DQo+ID4gwqAJaW50IGZiX3csIGZiX2gsIHgsIHks
IHZpZXdfdywgdmlld19oOw0KPiA+DQo+ID4gKwlpZ3RfZGlzcGxheV9yZXNldCgmZGF0YS0+ZGlz
cGxheSk7DQo+ID4gKwlpZ3RfZGlzcGxheV9jb21taXQyKCZkYXRhLT5kaXNwbGF5LCBDT01NSVRf
QVRPTUlDKTsNCj4gPiArDQo+ID4gwqAJcHNyX2VuYWJsZShkYXRhLT5kcm1fZmQsIGRhdGEtPmRl
YnVnZnNfZmQsIGRhdGEtPnBzcl9tb2RlLA0KPiA+IMKgCQnCoMKgIGRhdGEtPm91dHB1dCk7DQo+
ID4NCj4gPiBAQCAtMTA0NCw2ICsxMDQ3LDIyIEBAIHN0YXRpYyB2b2lkIGNsZWFudXAoZGF0YV90
ICpkYXRhKQ0KPiA+IMKgCWlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZGF0YS0+ZmJfdGVz
dCk7DQo+ID4gwqB9DQo+ID4NCj4gPiArLyogUFNSL1BhbmVsIFJlcGxheSB3aXRoIGpvaW5lciBp
cyBvbmx5IHN1cHBvcnRlZCBvbiB0aGUgcGlwZSBBL0INCj4gPiBwYWlyLiAqLw0KPiA+ICtzdGF0
aWMgYm9vbCBzZWxfZmV0Y2hfam9pbmVyX2NvbWJvX3ZhbGlkKGRhdGFfdCAqZGF0YSkNCj4gPiAr
ew0KPiA+ICsJZHJtTW9kZU1vZGVJbmZvICptb2RlID0gaWd0X291dHB1dF9nZXRfbW9kZShkYXRh
LT5vdXRwdXQpOw0KPiA+ICsJaW50IG1heF9kb3RjbG9jayA9IGlndF9nZXRfbWF4X2RvdGNsb2Nr
KGRhdGEtPmRybV9mZCk7DQo+ID4gKw0KPiA+ICsJaWYgKGlndF91bHRyYWpvaW5lcl9wb3NzaWJs
ZShkYXRhLT5kcm1fZmQsIG1vZGUsDQo+ID4gbWF4X2RvdGNsb2NrKSkNCj4gPiArCQlyZXR1cm4g
ZmFsc2U7DQo+ID4gKw0KPiA+ICsJaWYgKCFpZ3RfY2hlY2tfZm9yY2Vfam9pbmVyX3N0YXR1cyhk
YXRhLT5kcm1fZmQsIGRhdGEtDQo+ID4gPm91dHB1dC0+bmFtZSkgJiYNCj4gPiArCcKgwqDCoCAh
aWd0X2JpZ2pvaW5lcl9wb3NzaWJsZShkYXRhLT5kcm1fZmQsIG1vZGUsDQo+ID4gbWF4X2RvdGNs
b2NrKSkNCj4gPiArCQlyZXR1cm4gdHJ1ZTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gZGF0YS0+Y3J0
Yy0+aGFyZHdhcmVfcGlwZSA9PSBQSVBFX0E7DQo+ID4gK30NCj4gPiArDQo+IA0KPiBUaGlzIHJl
c3RyaWN0aW9uIGlzIG9ubHkgZm9yIGVEUC4gU2VsZWN0aXZlIHRlc3RzIGFyZSBydW4gZm9yIERQ
IFBhbmVsDQo+IFJlcGxheSBhcyB3ZWxsLg0KDQpJIGhhdmUgdG8gcmV3cml0ZSB0aGlzIGFueXdh
eSBhcyB0aGUgcGlwZSBwYWlycyBmb3IgZURQIGNhbiBiZSBBK0Igb3IgQitDLiANCg0KVGhhbmtz
IGZvciAgYSByZXZpZXchDQo+IA0KPiBCUiwNCj4gSm91bmkgSMO2Z2FuZGVyDQo+IA0KPiA+IMKg
c3RhdGljIGJvb2wgc2VsX2ZldGNoX3BpcGVfY29tYm9fdmFsaWQoZGF0YV90ICpkYXRhKQ0KPiA+
IMKgew0KPiA+IMKgCWlmIChkYXRhLT5kZXZpZCA8IDE0ICYmICFJU19BTERFUkxBS0VfUChkYXRh
LT5kZXZpZCkgJiYNCj4gPiBkYXRhLT5jcnRjLT5oYXJkd2FyZV9waXBlICE9IFBJUEVfQSkNCj4g
PiBAQCAtMTA1Myw2ICsxMDcyLDkgQEAgc3RhdGljIGJvb2wgc2VsX2ZldGNoX3BpcGVfY29tYm9f
dmFsaWQoZGF0YV90DQo+ID4gKmRhdGEpDQo+ID4gwqAJwqDCoMKgIGRhdGEtPmNydGMtPmhhcmR3
YXJlX3BpcGUgIT0gUElQRV9BICYmIGRhdGEtPmNydGMtDQo+ID4gPmhhcmR3YXJlX3BpcGUgIT0g
UElQRV9CKQ0KPiA+IMKgCQlyZXR1cm4gZmFsc2U7DQo+ID4NCj4gPiArCWlmICghc2VsX2ZldGNo
X2pvaW5lcl9jb21ib192YWxpZChkYXRhKSkNCj4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gKw0K
PiA+IMKgCXJldHVybiB0cnVlOw0KPiA+IMKgfQ0KPiA+DQo=

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1F9D4A615
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 09:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0E610E838;
	Fri, 16 Jan 2026 09:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYRuElQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8591810E10C;
 Fri, 16 Jan 2026 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768554146; x=1800090146;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X86Dajb5zlKBRoPLYiTMIMnfquKkvzE4nnW2wYssdRo=;
 b=mYRuElQyGVdZjB2CHtMJOEm83koQPE/0nuTPhLEMxMFyfqqoUZ8b18M/
 RhL+LVfLhVxYRpwzbkBsE3Xcs59JMOrEjwlhO3ceyewhHepBSNgGKStMD
 6UfGNbIUKPJ8yVzHeMZHAssfjw3FDYh5pkfcjT6oQwhyIhWJFXOr87paX
 lCrJHw+LREJCAG9gvWG3nrQ2uVKsuG9lW3PnflDebs/0CjntrGrfcNNIi
 nQHq3ApGyr5m0vNWy9uNxR6Pde3OcYfRvKQz3j9oEXS8mBmpqy1/SsVhN
 0+tU1SI4OyuCzQNFslAcjKoCchluc0Bn8O9CIPV0Q0AnV9bXQSkNL+ZBU A==;
X-CSE-ConnectionGUID: sWcjdm51TNOFJMw5NabzuA==
X-CSE-MsgGUID: VHLzMBmlTQS2DqoWR8NAFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="92529913"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="92529913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:02:26 -0800
X-CSE-ConnectionGUID: YJXRLvfpSminF2BiKt7jOg==
X-CSE-MsgGUID: 4UkNA7QPQFKOOFIRYUO+zQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:02:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 01:02:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 01:02:25 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 01:02:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwekbInCFT9f6gUisWHVOsJl8bLLYkNJh3UUQ+/q8CoUxxyiiJWHM42dR81YprJDtLIaeLNl4s+/LSCQEpVpi9wQ9Gqfq50EPBW8U+0NliAVDsnpdJcM11y4UuhyJOdJIOcxZZwgSLmH4udQiupnWdq+waz5TT0CIL0b3swwqswHQcn0hU4yBS91zIKeSJmvel/RtvmTVkdJKe9gwLu5hhHfofEebdU+SVfrNmydha/iWgVdZmEku61TwjfyevoD57b+b4YfyE/4ya1mFjsl21IRgAdP5kiyh5VKEwPpMQ6dmiKVDqxRblK+A8/urykVFk50oAvInwl5Qk62+9rYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X86Dajb5zlKBRoPLYiTMIMnfquKkvzE4nnW2wYssdRo=;
 b=kfYe+dY3K+BJx4U0f03JQ3v67o4gtRBoqrHw7oOZtfxQTTVWpoK83RpR0NsmuGG+twwYK7SyLRlIPSV1dcIE3/W4dnHjnGGcCfCZp1+3XM4sqlQwgFHPZ54VmS7bUY3SUwvGIXmNAxQqkRqmvWfJl2JtO9DpU1WLQMalCM+TU7Q+Gv45lZPhibg67RYf5OBR3HGSL9WGw271tUamB0S1ZxakheVDA17TBytr53ZG5zDh1q8p0EWXyPQ/ImTnoz6itTT2JgIwG5eBp0ZRI100cB8Bovvj7E/zC5R+2ne65Idd9GIa2UI3PY+/pVkQCUmmJploiu/MfiO723FwoQmg/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by LV1PR11MB8789.namprd11.prod.outlook.com (2603:10b6:408:2b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 09:02:21 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 09:02:20 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Janusz
 Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVs?=
 =?utf-8?B?L2dlbV9sbWVtX3N3YXBwaW5nOiBBdm9pZCBmYWxzZSBmYWlsdXJlcyBmcm9t?=
 =?utf-8?Q?_oom-killer_(rev4)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2Vt?=
 =?utf-8?B?X2xtZW1fc3dhcHBpbmc6IEF2b2lkIGZhbHNlIGZhaWx1cmVzIGZyb20gb29t?=
 =?utf-8?Q?-killer_(rev4)?=
Thread-Index: AQHchVcG6mMf+Fnu+0GB0puvVWJ7DrVUgngw
Date: Fri, 16 Jan 2026 09:02:20 +0000
Message-ID: <CH0PR11MB5491F7048DE02930D787FB28EF8DA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260113160043.694106-2-janusz.krzysztofik@linux.intel.com>
 <176835414338.152186.17058735113237015167@a3b018990fe9>
 <3351138.aV6nBDHxoP@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <3351138.aV6nBDHxoP@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|LV1PR11MB8789:EE_
x-ms-office365-filtering-correlation-id: c61f8056-aa28-4da4-f6c3-08de54ddf50b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?K1ltQmdFWmNONFZ0OFZwRUtrVDFyNTdCKzBic3g1OXl5UE9EQXk3cmUyMytB?=
 =?utf-8?B?QUZDZzRjQjFFQmJqeHJWcnJrNDV1ekZLanYvcUJxMktVMnYyOVBaSWRUV04z?=
 =?utf-8?B?V2dySXVnMFkzQXcyWTBrZXlIZm1UdGFjNk1wQ0JaM2tSendtNjIzbnQ1YWsv?=
 =?utf-8?B?cGtkbmtqSG1zNzNmK2JyVHdXMUJVd0FZcnFRZmJSWTFoUWwzVDN1NlJaTDE4?=
 =?utf-8?B?ZVloeTBoNWN6b0hPYlh6ZkFlbEg4bE9uTHBUSFNCZUNFRjlpMk5IWGFVK2tM?=
 =?utf-8?B?UXVyV1JQaXdIVzR5K3htbUNVdURNS0crTEVUdUFlV0VpU0JmajVNMWpKSXRO?=
 =?utf-8?B?Q3ZTcEFHT1h1QXI2M2tTZVp3N0w3Ni9LRUdYMW1wZkNNY3cwWHdwekw2dHRm?=
 =?utf-8?B?d0Vub2ZpL25NSW4rQ01pdGhEN1pWRHhrSVZHQnhkeXRYWXlQRHhta0QyK1J2?=
 =?utf-8?B?QlFxN2JNWmhaZEhxaEt6WEFBUFA0YUcweGRDQXV4MlFtdGtzTDZvVkJqS0Ja?=
 =?utf-8?B?d0lBSk9Fdi83OFNZeTJlYjlSMm9ESmp3M2tzc3N0a0FrTU1GV25uRjBXd212?=
 =?utf-8?B?OGFzTDNHR3dGRTFnQms4M21qVkVnMVVGK3ZpenR3YzBZNUZEd0hsQ3RVQkRL?=
 =?utf-8?B?dVVyYXYxM244Qjk4N3FXUUIzU3UyVkYrTDRMUWUvdGgxKzRBNWdsd05MTGd0?=
 =?utf-8?B?Yml6ajdDWUJXdGF0dEx6YlQram5VU2JsRzNib3BuOGZ6QnhmMDQ0eld1VklY?=
 =?utf-8?B?RUJ5SmpieTd4QlVTRGt0bG1uVXNVSVd3T2RUbHdmeVY3YmxYUUx1bWhGR3Jq?=
 =?utf-8?B?L2w3R2swVmFHc1lmak82RkNlQmtJMlpTL1JXd1luUXd4dHMwYUJBNlNDeVNi?=
 =?utf-8?B?ZStLYWt2eTdjek8vdm9GQ3lsRjJ0Qk5TKzRLVDdOSTJXNi9KTHEwL1JLMGRa?=
 =?utf-8?B?WEI1b1o0U2hVZlU1cGJDdjJKRGhOTEhxYlBuTjVlaEYweFZIakw4dkt0em1Z?=
 =?utf-8?B?UFJKSXNDZ3dQbHVxRmtjd2FDQjh0RW9aaFluZmZkLzloWVhjeEJtc0lHbmFl?=
 =?utf-8?B?VndHMnI2ZGZVdWVMMHE1Zy9HRkxUcXpWRkRmMXRLTlFlS3Jhb2t1azlzT3pn?=
 =?utf-8?B?MVpwTURGaFRYVjYvVU5ZanowMERyc3c0NFZRNXlLUWdGQTN1L09SS2FjcFJR?=
 =?utf-8?B?dFJpaVFuWGRqWGVWa3ZwNXlCZHFrdXpmaytiRmZvbWk1R1oxa0V0Q0kvWDVy?=
 =?utf-8?B?ZHFNWnF2UVdHc0FlSk1tM3U5am5RcGNzTzZDOTZhcllXajNJQjRSTGFIUnV6?=
 =?utf-8?B?SVNKYWVyUjlpbldzVGwzeFl6eGtZS2NEYTlzV0JqUkVkOTNEenNyMVFKa3Jy?=
 =?utf-8?B?UDBFL2lsTHhsNmVrZ2gvVENRdWNlQWJ2Ty94TzY0dVVxbExmMDNSc2k3N25U?=
 =?utf-8?B?WWZMS1dxWFp6MGZXU2lsNzNZbFNZYWVoODdVc3N5UWVqdURNK3AxakRDYTRm?=
 =?utf-8?B?SzhOeTlUVVNpUG5SSUwxaGM5eHprd09UWWs3bjlRdmVrWXh6VGRwbXpvcWo0?=
 =?utf-8?B?SUo0dVluUHJCNzc2Q0NBNzZ3aUtxWFN6SnUyY3pDZzVaeGFIL0s4Z3M5QjA0?=
 =?utf-8?B?MjBPd3AyM24zdVBoREpKb3hhTmoxVWIwM3RjVjJpUXNTeVl4dXlIaGs4dUNk?=
 =?utf-8?B?TmxTRkxVOWV6V0VJa2Q4YThoZDc1bWRicUx4MHNheXFZT0hKMFVLcmREVXYv?=
 =?utf-8?B?Q0ljckRrR2lSbXMrZ0xnQkxuUzk5OE9KcnJiZFVqZVFmeVJ1MnduRkdnaUtM?=
 =?utf-8?B?bmtmN2svZFdpM3BOaC9zbjY2emFLMnV2UWdrc2cwT0ZES3B1R0JweVdRQ0d0?=
 =?utf-8?B?bnJuRHh4ME5COGtVbEtwRHlJMnhWUnpWdU1LdjRFQkttZVRNbTJBY0xGd1pH?=
 =?utf-8?B?dC9UM0MxQVN2VjdIYWdTZmZXMlpNc0ZFSU9RQXA3anpZaEpJL2lLQTE0L2Nm?=
 =?utf-8?B?TVFsYkxjYi80RVlrRVVLdUdNZXlkdTVQL1JHMS8zVU9UOVBjZVBGWWJmYis4?=
 =?utf-8?B?TGlvQ2hoNU1BZGZTN3dVcTRNOUp3YWFSbTVvVHhoZHlTRW9hOVlPU0NvYXNW?=
 =?utf-8?Q?mqi914zIrlWQBhiFtyPR4UkB2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007)(38070700021)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFkwOWV2VGFSSDU4QjlPaFpmNmdyankxQ2o4Q2NLdHhQVERpanlyMXhVNEJh?=
 =?utf-8?B?ei94OWxWZ29xZ0dHcExTZG5EQlBFVXR4c1ByM2RzYUkxYnlVMnNWcXpQWjVN?=
 =?utf-8?B?R2xkTHd6MGZVUXkyUjRWNEJWWWlzSTYyMG9HWndjMTlHTkJXZjNXRHludE4y?=
 =?utf-8?B?TFdZMERTSWlTMWltb1JEdEpkZ1hYbzQzQmo1Qmx6cVVIbkIwcytnV2E5NFND?=
 =?utf-8?B?YmdOYVdjU3dTakk4Yk1ncnpSdTB2WWhPRkVHOGRuaXBIV1BHaFQ1VU1NZ0Ft?=
 =?utf-8?B?SXhEcnNCRHg3emp6LzVCV0o3d0lmanVlOWtid3YxV0xOZ1B4bkpDeVZ1SlBK?=
 =?utf-8?B?bWppNVNKRzNwUkpwNHZpODVSNE1xNksyUUFjb0JaODVxOXNYdFNRL0VNam5L?=
 =?utf-8?B?NDRkT2xGUmowcmRDL3hGcXEyd3RzMXV6WDZGYnpBaDB6SElZd2hSckpEVWF1?=
 =?utf-8?B?TFNRRWlwYlU2YVVkQXlteFZ4TkVSekk2TWJ6bzdsOGZmNkZRa0x1MjU3WG1T?=
 =?utf-8?B?K284cEhFdHVJMGR3QkhXSTNxMGN1RFA1bDlqUmlLTFl6SzFJUW5WS2Z0aWN5?=
 =?utf-8?B?VlhoNFRrY0Y5b2dBeWRHNlRzbGpia0NmUFFmc2FZbmtoMzBVTUx2a081WitL?=
 =?utf-8?B?d0tYbzNYdVhtQm1EbCt1b0wrUTJ4M0txZTZhMVQ4eXZXWlVBV2lpdmllYWR0?=
 =?utf-8?B?V2VxVnBBeDBFQkFuT0lZNUtDcE5LcStaekEzMy9aZHpYdjRsa0REZVZQNGtq?=
 =?utf-8?B?Mkxvcnhxa0RiK2FoSmFjRko5bHhuNmpHVmF4WFpiUG0vZzVDSE1WTVFqSzE4?=
 =?utf-8?B?aDVyVUlQZTVKc0NOTHhTeExld0Q2S1JPMkZVTWI2TElwMzZUWDVDOUsyMjky?=
 =?utf-8?B?K1Q0cUhBc1VtS0NWU2VSSGNKcEpQdEgzdFpVV21XcHFmOXp5WHg1TThZVDYw?=
 =?utf-8?B?MlJuL3hKdmhGc2Z2blgzQTljd3I3UHMwL2poQk1lVGpWM1puYjlKUjBSakdH?=
 =?utf-8?B?cWhKaDhqTnJUcUJkT1k2Ym84ajJ2TGpmOWE0UTEwbDRwT21RNUE2RUtMOEhX?=
 =?utf-8?B?RzdQNTI0MkdRVkpEYllIM3p3NmdQUTRoc2tKVDdOQ1BEc3BjZnV1aS9TY25a?=
 =?utf-8?B?amxzOGVEU0RRM1FXNUI1L3V2L2VqWmUvQ0FsdG1uL0poVTBEOVIxRlg2SFJO?=
 =?utf-8?B?SzhWODVhYVhRMkwwL2tEQ0k5NlQ1Z1R0dCtwR0ZtQzk3dDFGNWQ3dEhTZXp1?=
 =?utf-8?B?R2luUjRwR3UvYWFMU0dwMG9rVjh1cWhrVlBSU0FOeitnTG5RZlJLcVpTcURo?=
 =?utf-8?B?Ty9SZllkUklqeERTUXk3UnJCYjJsQXc2U2xUb3ZNQlRHWGNDQnAxbG8vQXBq?=
 =?utf-8?B?bU1MNlhlaFNZYVpvNlBrU1ZERzcrTnJRMjFPRVNmYjloejJpbkl2VlZEYXdu?=
 =?utf-8?B?eU5FWXF5Zk1MdEswTkljMkt2WEczYW1CbWQyUFR1WGYzcklNbGxBa1FZN3Z6?=
 =?utf-8?B?QXptNVVyZ1U1by91eG1DTkk1R2haTHlEV2pUZUc2eDBCc1lIZlVTTmZRQ04x?=
 =?utf-8?B?U0xGdXR0QzVIcisySnlVcUxsMDNBUlZHNXVIejFZakVkVkpZVVNmN3kxa25K?=
 =?utf-8?B?MWZOb0VIMjAvcEpTS1BDYnRIbXpQYWY5ZnJBQjhKMHBibmNjTUxxTjR4MTZm?=
 =?utf-8?B?WGRyUEprRXUycVVUOXhBU21yTmhpbEtXVmkrZ2Z4a0k3cjhFR1VqVTlFYnps?=
 =?utf-8?B?ZnVvQ2crb0xTbVVGTVRTVzBoTkNTUmp1L1dETWMrM1hNM3oveUFDTUkvMEc0?=
 =?utf-8?B?VmhTNFNJUXpCdUdxYXkrTFhkeXhlZlFLRHlqTXNsYk5MK2I5cTZRWG8rVnUw?=
 =?utf-8?B?ckZ5czFzMCs2eUM3QlZSWXFiRFhXNDJQbFI3ZlBJK0hiUFo4bjhaYTFnM01Z?=
 =?utf-8?B?ZENiV1JCTHNnSS9WUmMvM3o5R0FIQlVSN3ZKcjJQbzZ5cE5EWlNKS25mSko3?=
 =?utf-8?B?UUkxdkQwUHU4aHgzUG1SNE8yTURDUER4cGQyOERGWWkvRVFvTnFVVWVBdDJw?=
 =?utf-8?B?UEJEa05wbDBvU0FRMXhEV0t4bTJ5UDdGck4yRjF6alBlVmx6UDZrNXBERHlD?=
 =?utf-8?B?citCOTZMdC84Z09oRnp4Nzh6N2RRNGpzRGYzcHBWNHBDRWR3NWJrdXUwei9O?=
 =?utf-8?B?djYrQW80T0JqWGtteENBazF6R0FhclJ2N04xZGZVMngzK1NvdjVJb21iUSts?=
 =?utf-8?B?WVBVdGlHUUg3Znh6eW1LbjBRZTUvREtGdlh3R1EycGtBZ2orcWErYVVTR0hK?=
 =?utf-8?B?bTNXRjgweCtKc3lzaG5FdXNDZmNiTldCWk1yN3FlR1NpSUFUSGdUNkdQbzZU?=
 =?utf-8?Q?IiCwXCYbum1a0NCbz0s8NhD8HKb5Hh/JDLfZLFToewpmA?=
x-ms-exchange-antispam-messagedata-1: Ppe0hiT24JsRgQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61f8056-aa28-4da4-f6c3-08de54ddf50b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 09:02:20.8827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9u7n0oAsr1ZB6TU8FWvfvNwqo1ZEbVTzYzKvOuYxqhKb5tnwAD/p+5fq/kwyP/1mR+Y/Jw8LLbkfiQE4a4bjm7zgSZpQHLOCS+xJvglKjD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8789
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU5MTYwLw0K
aTkxNS5DSS5GVUxMIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClJhdmFsaS4NCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKYW51c3ogS3J6eXN6
dG9maWsNClNlbnQ6IDE0IEphbnVhcnkgMjAyNiAxODozOQ0KVG86IEk5MTUtY2ktaW5mcmFAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEph
bnVzeiBLcnp5c3p0b2ZpayA8amFudXN6LmtyenlzenRvZmlrQGxpbnV4LmludGVsLmNvbT4NClN1
YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC9nZW1f
bG1lbV9zd2FwcGluZzogQXZvaWQgZmFsc2UgZmFpbHVyZXMgZnJvbSBvb20ta2lsbGVyIChyZXY0
KQ0KDQpIaSBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywNCg0KT24gV2VkbmVz
ZGF5LCAxNCBKYW51YXJ5IDIwMjYgMDI6Mjk6MDMgQ0VUIFBhdGNod29yayB3cm90ZToNCj4gPT0g
U2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogdGVzdHMvaW50ZWwvZ2VtX2xtZW1fc3dh
cHBpbmc6IEF2b2lkIGZhbHNlIGZhaWx1cmVzIGZyb20gb29tLWtpbGxlciAocmV2NCkNCj4gVVJM
ICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1OTE2MC8NCj4g
U3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0g
Y2hhbmdlcyBmcm9tIENJX0RSTV8xNzgxNF9mdWxsIC0+IElHVFBXXzE0MzM0X2Z1bGwgDQo+ID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+
IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3Vz
IHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xNDMzNF9mdWxsIGFic29sdXRlbHkg
bmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGlu
ayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdl
cw0KPiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTQzMzRfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3Vy
IGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cg
dGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCBy
ZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0MzM0L2luZGV4
Lmh0bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDkgLT4gOSkNCj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBo
b3N0cw0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+
IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGlu
dHJvZHVjZWQgaW4gSUdUUFdfMTQzMzRfZnVsbDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMN
Cj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBnZW1f
ZXhlY19hd2FpdEB3aWRlLWNvbnRleHRzOg0KPiAgICAgLSBzaGFyZC1kZzI6ICAgICAgICAgIFtQ
QVNTXVsxXSAtPiBbRE1FU0ctV0FSTl1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNzgxNC9zaGFyZC1kZzItMy9pZ3RAZ2VtX2V4
ZWNfYXdhaXRAd2lkZS1jb250ZXh0cy5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQzMzQvc2hhcmQtZGcyLTUvaWd0QGcN
Cj4gZW1fZXhlY19hd2FpdEB3aWRlLWNvbnRleHRzLmh0bWwNCj4gDQo+ICAgKiBpZ3RAZ2VtX3B3
cml0ZUBiYXNpYy1leGhhdXN0aW9uOg0KPiAgICAgLSBzaGFyZC10Z2x1OiAgICAgICAgIE5PVFJV
TiAtPiBbQUJPUlRdWzNdDQo+ICAgIFszXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9y
Zy90cmVlL2RybS10aXAvSUdUUFdfMTQzMzQvc2hhcmQtdGdsdS0yL2lndEANCj4gZ2VtX3B3cml0
ZUBiYXNpYy1leGhhdXN0aW9uLmh0bWwNCg0KVGhlIHBhdGNoIHVuZGVyIHRoaXMgcHJlLW1lcmdl
IHRlc3Rpbmcgb25seSBhZmZlY3RzIGlndEBnZW1fbG1lbV9zd2FwcGluZy4gIA0KTm9uZSBvZiB0
aGUgYWJvdmUgaXMgcmVsYXRlZC4gIFBsZWFzZSB1cGRhdGUgZmlsdGVycyBhbmQgcmUtcmVwb3J0
Lg0KDQpUaGFua3MsDQpKYW51c3oNCg0KPiANCj4gICANCj4gTmV3IHRlc3RzDQo+IC0tLS0tLS0t
LQ0KPiANCj4gICBOZXcgdGVzdHMgaGF2ZSBiZWVuIGludHJvZHVjZWQgYmV0d2VlbiBDSV9EUk1f
MTc4MTRfZnVsbCBhbmQgSUdUUFdfMTQzMzRfZnVsbDoNCj4gDQo+ICMjIyBOZXcgSUdUIHRlc3Rz
ICgxKSAjIyMNCj4gDQo+ICAgKiBpZ3RAa21zX2RyYXdfY3JjQGRyYXctbWV0aG9kLW1tYXAtY3B1
QHhiZ3IxNjE2MTYxNmYteXRpbGVkOg0KPiAgICAgLSBTdGF0dXNlcyA6IDQgcGFzcyhzKQ0KPiAg
ICAgLSBFeGVjIHRpbWU6IFswLjA4LCAwLjE4XSBzDQo+IA0KPiAgIA0KPiANCj4gS25vd24gaXNz
dWVzDQo+IC0tLS0tLS0tLS0tLQ0KLi4uDQoNCg0K

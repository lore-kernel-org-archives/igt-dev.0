Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EE7F30298
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 03:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C1E10E07A;
	Mon, 16 Mar 2026 03:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjlK68uP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D4C10E07A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 03:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773631075; x=1805167075;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NUZ0ydO0MP6K2uMOqA9XLUHYad1gXi/Sjpgl+rr8qjY=;
 b=ZjlK68uPwL6IeETrXHGATYwHRrVHF8uW/JNuXA2QfkvX0ZCtvKLPFpCI
 KQ7WLXeaMXOZ+0V0fFERb44rFW7vadxH7P0UimW/Uyh9voOvfssRoJxHi
 ZsF4MydggYthkxNipwKzkSy3cNll931LeoLRcpw13+EHSDR3FFSi6CQH6
 AK8EfkMlJ2rU+ZJLbiWy63EDdRBTL8B11nZUOMrcajc8rT/n91U2medC8
 4+MiiQdzOgaqW4S3KfqeBvpMn5yZpJ7oy8IvX3XXS73bd8+ejmIQJ0Awa
 TeOC0yBtYO+zgj9eZ8Ww+V9AWMRpJDzAWyFGY8YXpD8KDbB/fyNdbUvle A==;
X-CSE-ConnectionGUID: SxPgd9EeRYOPu/OcQk661Q==
X-CSE-MsgGUID: pQBWlkZJT12UXi/6phu3vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92026974"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="92026974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 20:17:54 -0700
X-CSE-ConnectionGUID: 4rG4+SEwQcymbJJTDzzfKw==
X-CSE-MsgGUID: EWqa9mxETp2crFWrubfudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226449280"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 20:17:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 20:17:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 15 Mar 2026 20:17:52 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 20:17:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQ4nXpJWD/fwN8BvO333i79sa3lLNTFR9vUHG0LV872ATZgww9fpGlOo3dJqb4g4TJXd77TWs3ZCYTQZfjEQPeABjTg5BUUHKq/KIDKexttPAMm7cm42alaHZHJTykLhwJKI0wLadSUP4wr+wQ7d3/tRuPCKdHlaPX99/pSDabHwU5su+nLOcri/AEqXi4dNKWmCXeU4T+eakSRwTMhxlxFylutXAKVOtkOrTNuievaSTTCTnrbcMYiMJoylN+G6bGyvJaiMCuxonouhylEbcgMBZU31qVgdzS9d+EdAHdpPH6dreMd+l7sxD8UfIvlR9MYph4Kka8CilfbZh3MtHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUZ0ydO0MP6K2uMOqA9XLUHYad1gXi/Sjpgl+rr8qjY=;
 b=LM8r7LPAaZULe+YIVsVEqNltZ9So0RCWuthyiP2Ai5qDQk7KhA7glovuvT7MSQG4cWgGYGEftyznkhQX63klRuHGcXydOWVGHINIcLEje3UJ4pLf3xqAoy5famEpgJbgdGbTSI+WYANRYFsqFW5HY5N9eXz5/U16cc2Axf5HTV9hZ+MdyVhQsYOIegmum8ZEDCdufsD76eq4ssUKFIOBcTQ6+wzuq++2AnI1uifqnqkAkkfFebbe3dAZPpdFhebrmKXogdVJHxSvM9+v1Mr7+Gf1JWy+z4EVHUzj8p1CScwv8z2PM0EOVh8uH3yGPnChXVuej8ndYVSbyGP/4hLYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.13; Mon, 16 Mar 2026 03:17:50 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 03:17:50 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t,2/6] lib/igt_connector_helper: Add generic connector
 helpers
Thread-Topic: [i-g-t,2/6] lib/igt_connector_helper: Add generic connector
 helpers
Thread-Index: AQHcr6iGzVYmxp6qy0mqUHMvm9mIybWmCmAAgAp8YMA=
Date: Mon, 16 Mar 2026 03:17:50 +0000
Message-ID: <IA0PR11MB7307C59B71708312211E0B8BBA40A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260225212859.876713-3-kunal1.joshi@intel.com>
 <d256aedf-2e67-41be-a440-a6e39ad5d18b@intel.com>
 <d3322c0b-8bd6-4242-8a74-ad5dfacb3909@intel.com>
In-Reply-To: <d3322c0b-8bd6-4242-8a74-ad5dfacb3909@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS7PR11MB6152:EE_
x-ms-office365-filtering-correlation-id: a9e16e62-0f0e-4a41-7049-08de830a9ab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003|7053199007;
x-microsoft-antispam-message-info: lCqJcSAWAZ8RiHGtQoo0P50MDjZf5uP0/ml8t6rUSC1/hRCa6qac46ssw5aQg59dw689/nr58FZTSQaMQV6DkzsJjDr2sqTwzruC0emRkdLFyg+OE/KynmTdRODJfeTpxUdTVFTQyb3wWKCaXgdmowf+Xu1EXhfdLCX00zAnZf4jwTAe5YPuPlXccR5XzcaGFuKWiT2JGQlndDS5ldZCU+cdukp0FAUuOWhI2xVuaxeNnIOBKkmOFmU8GPiFd6REVBQD/MafU21HQySwDsKcweCyjihWYVTmo1QQX98l1eBVtCV6N3a765jLipC+1g/Z0W8lydG/qm8a1koCkDAaBwY4cSeThSE2pwjr23nAuAi8jRSaY5vsyhSADOv9+4z5In+1IO8thahpRb9jfp1mr0RPUEQ65KhvLYo97UJsb5LCyE9XUXW+/kYqiEZ7xx1C9eBT+Q3/MfgT0sxRMvqKHJM4YK2JOu61IH3pZPwcc4plGRwBpZarH9n3yiD6kAf2BEkSR+RnUyPFjFvzRcj1Cuhp7fS7GUnid4p3lfr8zeP1tAG4j8Z0NyXMBqU1JILfYroTvKTWguyUqx1pm9p6KBBrRRxnr1IpL+h1JXgnbPwTOhzwz3qw667R8DTOdztzd0ZximX03maExVIp4ikVfnIz6C9tsdq4wS5Div6cm6sbfE5glJyfiE4fpDMBTYcFSF2Cfs2SeNOQHzEtKjSANetbKK942MQFMuPMdGNvqsWYyBiXdlMPj512DbSsanDcXcJkvvg011fs2xlIZSOcXiRiwR04q+5Jc9X+JHtCzfE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEhCWmhXb0Y1VjEvc3RHSUFkT1UyaVAyNWplQXVJK0pxNVJwUUowTUxVZzZU?=
 =?utf-8?B?RWJqc1pjSm5haDZBeERhUTJMZkZSTU1ja2prL0l4RGNvRXo2MjZIWXlmRW9B?=
 =?utf-8?B?ZkZLMkY4aWt2NTNYUTM1TVdMUkY5SzFGZlVoYS9aUHhva2xMZUZwTG0wZUtG?=
 =?utf-8?B?MzVRMHIrYnpRVHZIcXBPWEJ4bWxDUTgydlFYVk14Q1hlOURTM2FWeU5VMTYv?=
 =?utf-8?B?NFljdldFWWRIN2hqWnRjR1NRWG5paXpKUU5ZaDdCUThhMzhxdmVVSnU5cFhB?=
 =?utf-8?B?MDl0a05tWjlHNEVnVEpxYTNvMjVQc2tnTFFaWmtFOHVqc3p4YWMvV1RlZGxi?=
 =?utf-8?B?ZHdhWWdocTU2NENZNmcxcVk3UktDM0hzZG9JZStuU3NrNWpDZHgrWks2eW1U?=
 =?utf-8?B?d3FkMVJvWDFHdHZRa0E2VXpWd2pqU2U2MjJ3dllVSGY3ZDZYazRUbVozZFlE?=
 =?utf-8?B?SGZjY3NaSGpWTlhlVlMzZWtITGdjT05iNytJRTcrRTlFYUlFN3RVZ2RQUjBy?=
 =?utf-8?B?QjF2UzRKMGhqN2ZlRmhVNEpwY3pHR0lrb3oyUXRXVEtCMERWZWtWUUcxeGM1?=
 =?utf-8?B?YlZUMHp3MTFKLzBqUXNiVFUrZDM4RWxCSStsWjNuaVNwd1d3VW5pQmpudTJw?=
 =?utf-8?B?dXppSlpIKzVVTkZQekYwQ2piMjZlaTgwY1VMRHVOVzRDK3Yya3VqYlJaaWt5?=
 =?utf-8?B?bFRKR3lMVm9QaHBjN1gwVmRFSmR5YmlCUmJKRHRGeVdHcjNpVGtMZjlzcFBm?=
 =?utf-8?B?dW54bFgxR1puMXlSbHp1UDlxbW1kS0V2dWhOSFlMM0l4S2xRVW1vcW14Tnl4?=
 =?utf-8?B?bFBFYzh0dnE4Vnd6cEJsWXBkbzFSYTUvVlk3NE9NVmF0Y09UWmV2TlJiTkZD?=
 =?utf-8?B?bnJvdHNzWUVZVWpRcnRublcvbVltNDc0T0ZnT3FkZDdRa2hXNktPVHBqclh5?=
 =?utf-8?B?UW5HcG1wQms1T1BvNGZLZkZxak9MWVhQU2ZYdUFoY1Yzc2dYQlFMbU1Udi91?=
 =?utf-8?B?R01HT3Z0YnBvYnFmR1RYdHZmTXVmZGZtdDNhYVdxRmcrb1E2T2d4Z2dlcnIv?=
 =?utf-8?B?d0tkRFp1VnNSWjNrT2ZiQithU2tpQmd4cG9SL3NsMDNCQXJyWDJBUm9iZWdU?=
 =?utf-8?B?N0Q3VmVOOHhiemFvcUlIUzU0Z2FNR2RZU1R3eWkxZnRtQldkY0FRT2ZZTjQv?=
 =?utf-8?B?c2VVUHoybmpseGxZT2JKWm1SUEFESjY4bGZKdmZreEl3UWJGSXowMUxobkRn?=
 =?utf-8?B?b2lZbWVMUDdrMzhDcjJHcDUrMW03a1dKVGhPRENwN2NyRktFaUkyaWNWMU5N?=
 =?utf-8?B?MGtGZjhldmUvaW5GaDJqZGJoR2VXaVowdU0xZDMzVjU0SCtYSjRMNmZiZktv?=
 =?utf-8?B?WkxJNjB2SHo4ditxWDg0TFFnK3o1UnIzVVZFQ3l1SFJwSnhDYk1MOTJjTlIr?=
 =?utf-8?B?ZWhzaEhhRDZ3bTIwWnhoN2RxZGV5cXBJNmhqWUVLbmxhbndUQS8vRU0vYldU?=
 =?utf-8?B?S1RadTVJMVZ5UmFkZ0l3T2szM0hQM21iRWtMNnZOOFJOeU9IKytDVHJJMzM0?=
 =?utf-8?B?cThQdi9MYU9aSndYdlFyeE5MQ1hkOTR4YTlkL3dpbnlqb0pmV0kxUE1GQ3pM?=
 =?utf-8?B?WWgra2hKUHUxQVVtN0JSTmtxOW9nWnNlMmFtL1lwQ2M2L0R1ZmFmRk14L2dn?=
 =?utf-8?B?bXJBbTYwL0liNFNOclpzQmFXRU9nNnIyRjRLSGtkcFV1U2h5L0FIUkVPN29n?=
 =?utf-8?B?MjUyRFhsZzhveUF5WGxNRUJTZ2tCcGVJUTRVZFpBTEpPZWZFQ1VQaXFoNGZO?=
 =?utf-8?B?UnovZnZCaklVOGNxRnlyZ0pBNkR6bkJCdDlieDl1ZTlLUmdGdHVNajR1bnJ1?=
 =?utf-8?B?MXl5TjdqTG9hWVdRZ3B6VUs5K2wvYW9rRzEzdHNpRTZWbTBFUFZGNm15a2M1?=
 =?utf-8?B?enBxQzgxczZjUXU2dFFTY3NZTlhpaFB5ZFRrWk9nOGUyWm1jVHhFeDhkR0E0?=
 =?utf-8?B?Z21reDY5THhTWW9NNkQzUVo4T1VjT3NZUVdyN3JrRUtUZVVqMW5YL1Z5YU9J?=
 =?utf-8?B?WDNtSC9oYVJjZitvTEM0WjNxRkNSOFRjWUlxS2xnUWxBM285YnpLcHFFMDVh?=
 =?utf-8?B?Ymd6ZzUvTFVFQmZLVnlpUHZvUnlTVmtoOHBYVGV3THZzZDdKZ1NPWkZhMVB5?=
 =?utf-8?B?dkg1eGZFTXltdzYrM1MrS2xnSzZ0VHIrelRSUzhaMjZkRGlVdVFMMmpZSk11?=
 =?utf-8?B?NnBkd1VzZzZDbGtGUUZJZ3gvaFZ6cmtTOTJmOWl6RWpydDRKbHkvRmhHN0Qy?=
 =?utf-8?B?TzBybVBLK29UbVIyZ3c5Y3N2L09yYkwxb3hBRXBDUkhMcFlDUDJuZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Bb4qcS6IFUhtR4lDX9ffNXucFJS3GxMmSbcXf1jdJNJbMjaKFPXM184KNoCBgnnnm7yx5hZznWj8N9pcYx63zvwvypOLz6q6q6MkbgUmI8koUJnG0MGCPuyQzbQN6caizVeWxlfPV+OqhvkHMp+YeFiAQFOA+WuYhZiqdRjZ4qnP0ZSH+IOBbiGddMvvWOy7wOAHSv0+NVXa82BQyCM3TjpiyeTucKrF2gsfvcsNu6O9JzWUsNvZRguVzL0dE6g7iaV/U02Te342wLUGL4MC6gihw91ev/I5hyb+bDTUlKLGhovMTfNjTwsm/NaSd1Zz7+W2ebx5c7dm1Nbvme35hw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e16e62-0f0e-4a41-7049-08de830a9ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 03:17:50.1538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xwqmpf+knddcBM1GzFr8Md4CEP/RzB47d9oh3cMDaHVWJRtk6WXVXeI2mbUrDZ9cCCvUVjrLP3xVZRfAo3UmgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoaSwgS3VuYWwxIDxrdW5h
bDEuam9zaGlAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDksIDIwMjYgNDozNyBQ
TQ0KPiBUbzogTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtpLWctdCwyLzZdIGxpYi9p
Z3RfY29ubmVjdG9yX2hlbHBlcjogQWRkIGdlbmVyaWMgY29ubmVjdG9yIGhlbHBlcnMNCj4gDQo+
IEhlbGxvIEFydW4sDQo+IA0KPiBPbiAwOS0wMy0yMDI2IDE1OjA4LCBNdXJ0aHksIEFydW4gUiB3
cm90ZToNCj4gPiBPbiAyNi0wMi0yMDI2IDAyOjU4LCBLdW5hbCBKb3NoaSB3cm90ZToNCj4gPj4g
QWRkIGEgbGlnaHR3ZWlnaHQgaGVscGVyIGxpYnJhcnkgZm9yIERSTSBjb25uZWN0b3Igb3BlcmF0
aW9ucyB1c2VkIGJ5DQo+ID4+IFVTQjQgc3dpdGNoIGFuZCBvdGhlciBkb2NrL3VuZG9jayB0ZXN0
czoNCj4gPj4NCj4gPj4gwqAgLSBpZ3RfY29ubmVjdG9yX2dldF9jb25uZWN0ZWQoKTogZW51bWVy
YXRlIGNvbm5lY3RlZCBjb25uZWN0b3JzDQo+ID4+IMKgIC0gaWd0X2Nvbm5lY3Rvcl9nZXRfaW5m
bygpOiBxdWVyeSBuYW1lLCBFRElEIHNlcmlhbCwgYW5kIE1TVCBwYXRoDQo+ID4+IMKgIC0gaWd0
X2Nvbm5lY3Rvcl9maW5kX2J5X3BhdGgoKTogUEFUSC1iYXNlZCBjb25uZWN0b3IgbG9va3VwIChN
U1QpDQo+ID4+IMKgIC0gaWd0X2Nvbm5lY3Rvcl9maW5kX2J5X25hbWUoKTogbmFtZS1iYXNlZCBj
b25uZWN0b3IgbG9va3VwDQo+ID4+IMKgIC0gaWd0X2Nvbm5lY3Rvcl9yZXByb2JlX2FsbCgpOiBm
b3JjZSByZXByb2JlIGFsbCBjb25uZWN0b3JzIGJ5DQo+ID4+IMKgwqDCoCBpdGVyYXRpbmcgZWFj
aCBjb25uZWN0b3IgdG8gdHJpZ2dlciBEUk0gY29yZSByZS1kZXRlY3Rpb24NCj4gPj4NCj4gPj4g
VGhlc2UgaGVscGVycyBhYnN0cmFjdCBjb21tb24gRFJNIGNvbm5lY3RvciBwYXR0ZXJucyB0aGF0
IGFyZSBuZWVkZWQNCj4gPj4gYnkgbXVsdGlwbGUgdGVzdCBzdWl0ZXMgZm9yIGRpc3BsYXkgZW51
bWVyYXRpb24gYW5kIHZlcmlmaWNhdGlvbi4NCj4gPiBUaGUgY29udGVudHMgb2YgdGhlc2UgYXJl
IGFscmVhZHkgcHJlc2VudCBpbiBsaWIvaWd0X19rbXMuYw0KPiA+DQo+IFdhc24ndCBhYmxlIHRv
IGZpbmQgc2ltaWxhciBoZWxwZXIgdGhhdCBtYXliZSBhbHJlYWR5IHByZXNlbnQsIENvdWxkIHlv
dSBwbGVhc2UNCj4gcG9pbnQgdG8gdGhvc2UgZnVuY3Rpb24gbmFtZXM/DQprbXN0ZXN0X2dldF9j
b25uZWN0b3JfY29uZmlnKCkNCg0KPiA+IEluc3RlYWQgb2YgYSBuZXcgZmlsZSwgY2FuIHRoZXNl
IGJlIGV4cG9ydGVkIGZyb20gbGliL2lndF9rbXMuYyA/DQo+IEl0IHdhcyBpbnRlbnRpb25hbCwg
c2luY2UgaWd0X2ttcyBpcyBhbHJlYWR5IG92ZXIgOGsgbGluZXMsIHdhbnQgdG8gaGF2ZSBzZXBh
cmF0ZQ0KPiBsaWIncyBncm91cGVkIGJ5IGVudGl0eSwgSW4gdGhpcyBjYXNlIGNyZWF0ZWQgY29u
bmVjdG9yX2hlbHBlciBmb3IgaGF2aW5nIGFsbA0KPiBjb25uZWN0b3IgcmVsYXRlZCBoZWxwZXJz
IGF0IG9uZSBwbGFjZS4NCj4gDQpXaGF0IEkgbWVhbnQgd2FzIGFsbCBvZiB3aGF0IGlzIHJlcXVp
cmVkIGlzIGFscmVhZHkgdGhlcmUgaW4gaWd0X2ttcy5jLCBqdXN0IG5lZWQgdG8gZXhwb3J0IHRo
ZW0uDQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0t
LS0tLS0NCg==

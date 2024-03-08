Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534AFC54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 11:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEABC113884;
	Fri,  8 Mar 2024 11:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8uIy7w+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1201113881
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 11:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709898444; x=1741434444;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YzJ/w5MUu6sI918gc6sXGercoS8KpuL7sIGInOkRuV8=;
 b=m8uIy7w+3RQu0+eqRpgjcxQJ2zBJGrQJNzpyHm4g58MyL/eC8eKh7pog
 9qXwT1gEMofJ9ggIp7AcvxEMaCaLN0p8LjivXM/r4glF9gNYSPIgR8xNh
 ELtS5oP2++HY+MFC9g9fX0swi/KWz0KXh8LC8xzIdMXOT2SWb1NYWjM84
 G/JqVh2raZOkJvRsoEXUIbFq+KELiUUuDy+Txn5UGQ3gKCZJRP6+HrNmD
 HHNUTWOBFjUyvl6JbN0MlhFCyOXJh5Jt0kuNICLgwAO6JjYoq6TvufJSN
 cnoaN/osLj/CiXxhvYpEjNwZiWDyaRXG6VJqZVVSryPoRr3Skg2VgG5GG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15261660"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15261660"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15038248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 03:47:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 03:47:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 03:47:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 03:47:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 03:47:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0134KAKjUKH7xaGg467OpIJFjRYBZfyMNPsqh/ox8dqyud1Tjc81kaI871vI7HL6jnfdHW65rSDlRmRm+MXtk0PjLXbS6XWFP2WGJjlETn5yVl/1rSa7Ea88mLlgHnTnBEHLFr7CCr1yF8VpWobDP6gOZTUT8/o5w1iz+ra/6Ssy2TGFMBe6trCRQPhfowbuu1larqlr5mhJg4mS9f06pMYhpPVh6+UUxW1ZWdeQMcO7nUSwUpTERAonr7jXJIkkj48i4pvvagqH83xBp4BOHcpjJW21BvDxjsPQUEQvRxcxg0l9peSytynrt0s5chxy13XTUd1jFwPyIxhLiKMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzJ/w5MUu6sI918gc6sXGercoS8KpuL7sIGInOkRuV8=;
 b=nhafWX9r+l3f8RAVus35ZWtfglyAMXr5+m8OJnTUOkVl9Prg8AYATs18B9ygOAOE0Scg1X/nnJKoNpT8iBPKxUMGmQWaplf4EEeA0U0AF0GGVlFtoq3J2WQ8Q0v0AqNp+s5QKxFNSOv2vtdsOhfVlhlw9ln8pzK4TyF90EBQsJa96RuzqKw8C42qAzbs1KVKvFto3e+29YsTvvzwMEWZJWkynF/nqyY3pizhOUc36OTbHR5q3gnmzmhXpNxzqjzY9yqXkYQVRADojMGgCp4JiOrcusiUoX89Ycm9N8reF+/bnXW6V2ml9v4mlTrF54TMHqvdZQgLCtq2WTFgzGqRrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Fri, 8 Mar
 2024 11:47:18 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 11:47:18 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 3/3] scripts/xls_to_doc.py: ignore fields filled by
 lists by default
Thread-Topic: [PATCH i-g-t 3/3] scripts/xls_to_doc.py: ignore fields filled by
 lists by default
Thread-Index: AQHacUDDvjg+TDVXIEGqdUjdJmz9bbEtuhFQ
Date: Fri, 8 Mar 2024 11:47:18 +0000
Message-ID: <IA1PR11MB6097A10AC3D30B7D194A664886272@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
 <20240308100933.912014-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20240308100933.912014-4-mauro.chehab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|LV3PR11MB8728:EE_
x-ms-office365-filtering-correlation-id: b9e31e92-64ca-416f-7a80-08dc3f6581d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: avbl9SY9gts5LSrLlIsT/GC5IBLBey0EKNRrlwOsn1OGUCr+RCXEeBlx8i0m23wv1fZfVNdDSgd+f+5NtQXXymWQxtaIBKJF7vsTaBz5aIgGMxO7w2cDgOyDjRJ8liZYYIVALpurDVg2Xnd7nMP17oZxZRfSt9Z1vf4h0K5bjI9N2xLMSo7J3zw6KGJljtihWhv4BHwaJlI0I8FrY4EeV4BmdOSiPGK/E5eo1sC508Rs5imQJBqiXd8Brgcfu9LsvbgCMoqAoshOVQfaD2nTh23Iqy9bnzGmiSM2iH+yon16BbDV41KgSmFfEoRF03H6azIz953QIo99tye6mDNaUmhuQJeaiAZ9vehMhQTan5I2WRy0lWaAPsBKP5FMFXOqVQNHf6ps7co6+9K9o53CKYyJBykB9EuGqtwIc/Sa6UYX6b38YwlpHFR3Cc7k17RfXzW5OUGI3MJEk80B8nZ1HM83ghSuTB4W19pHMoFJC5p4THzbF7snnWz+PHcAigKHwdXPgBgQ5xnwegvrZMtV7pU4RLzAMQxmeVOnRhU6+JyPqW+uLYK0Z7UVYZSr2pgYpcxIytSLodPzFZIXimTrvpzecm3wUDGmMHYP5oarzFJhxEOUkDbagHl6AUPgECvku6PJdN6lU3U9PEDE71kXfnU7g2DSUV7iDqBKt3sqm7xGRM6NqSsKfx5wfIho9yLBVKEQSxCwk0WUqt6ijWOZkoRb3zXiEig0bkW25N3dub4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWtKS3hBalhvbDZDWVl6VTRTUU84SmRKWFBxcEpPSW9YcVFQWG9rdlpRVzB6?=
 =?utf-8?B?bTlPNVBzaW0zRWZPZnhYNU9leTg3VzZsSk1GTUdmOVpPeVNSVUQvV0JhTVVH?=
 =?utf-8?B?REtsZ29PeTkvcmorUldDRjhmdFBqRnY4U1dHU1NrYVFyM1NSNXc3R1FITzhG?=
 =?utf-8?B?ak1VeE1zZ1V0c0dVMUdod0lhVElpY0RldWFVeFdLcVl3aHdBRno0TlorOVRZ?=
 =?utf-8?B?bmtCVUdWczhHTnlHT1l2bDFSaE5oTUozckpZM2JZVVhNNVNXSU1uWENnR0ZL?=
 =?utf-8?B?MDI1MzZXcUl1NytaN05maXJQLzNDdTJ0UTJ6cG9ha00ydmRCY3ozb09XNVYw?=
 =?utf-8?B?RHdhTzI1S04rLzZiN3Bod2RsRzRqaWJ5N3U4VGZBcHd2dWpteE5BU3JXNHBD?=
 =?utf-8?B?dDNVeldSYW9YRHROTmY2enY4NE5VN1YrR0FrZmRoZ2lsLzdwK0s2WHhQcStD?=
 =?utf-8?B?UTVBbWZpUFI1MzU2a2hOWUxobW42elNWR0pTZFVic1N2RE52eEVBR3ZMeVJt?=
 =?utf-8?B?QjFmVWkzbXFIYVdkYlcyQ0psakk0bkFwRUZPUHNmY2IvbVRiY3VyVCtkcFN1?=
 =?utf-8?B?SGJaYmREdDRuUld0NCtvM0o5RDN0V0NzeWI4aG9VQ1NDYjBQRUszK2J0V2w3?=
 =?utf-8?B?Z3dVYzBnVGE4RmxyTlh3cjhnV3NyS0ZYUjhEY2tmdmd6ZEVpbW5taWwyM3hR?=
 =?utf-8?B?bFVzUGgraXl0a3VaY205U0E0MTBMT0JBMXBNRmlZOVRJQzROUjVBZE1WKytp?=
 =?utf-8?B?bHVUV1FJUnM3NUNWU0J6N0hCclZLSU1HT3JXT2FkVXlBUFMwUTVHK1dmeUNB?=
 =?utf-8?B?akx1TzVjeFJJYTJXVXJBaURMdFBoN1VOdE81WldvRXBiOUZMempqb09ya0V5?=
 =?utf-8?B?S1E4MFp6OGpXNWJydnVEUTJKQ1hSMUIyR01Tc1I1TDAwVUV1bFZmd1hQV3NR?=
 =?utf-8?B?S1Z1ZU9YUUs5YWF1YnNyRzIyTnpSOG5OQTBJYU4zSS9FNWhUdHF1aVdKc01G?=
 =?utf-8?B?ZzZBNTFZR0dBand1c2kxSWhtcW0wdm8wUExtY3RCTm1oWTVHS0MrdGd6T3U4?=
 =?utf-8?B?Yi9oRlMyeTdReHhlbFdJRm5uTlRhbU1ZRlllWk9PUzhVTFp5Tjl4Mm9HaWF2?=
 =?utf-8?B?V3FXbEFqeUdyVlNCczRUUWZUTFRua1JLcUQ1SFRoaldwOWFNTzAwaHBzdkF0?=
 =?utf-8?B?cCt0alJWcE1XY3BvQVhmOU0yVm4zT3YxY2M0MERtemNkeEJhQUJYaHlDMHRl?=
 =?utf-8?B?QUNSUGgxVmx4d1NuVHVVTnJrZlNEUGF2RXUrWFljZ1FzV1Y4aUJhU3RCd2pv?=
 =?utf-8?B?ZmJ6OVlKNlhSUzdSVzMveGVNUTkwckQ4NEZLa0VwQ3pIZE8zK0ljUUxrVlly?=
 =?utf-8?B?Wkxyd0p4QmUwanREM1lhRUFCRDQwbkd5UGJ6VkIxMGo5SHhidDNsYVFNNmMz?=
 =?utf-8?B?ZURYTUV1RTdMV0pBeEordmdyRzNaOFlER1pzSVpxNjhBNFJSaFNDUjl0ekx0?=
 =?utf-8?B?VjRwcWF5MUtjZXBxU20xdkRsV1c5bmdZbWg4TEZuMDJ3ZXo1aTNnWVZGY0hJ?=
 =?utf-8?B?am9pbldVZDNJNkhCa3FZbkNKRzY3dng5K2hGVHNVVWZibm04SzRNM216c2c5?=
 =?utf-8?B?cmtDeHg5eW9tb0pISlYvOFRpbXM5SDkyTmtNdHNuMG1OUGU3a3EvM0hxNnFH?=
 =?utf-8?B?OWxYZUNpTVlWSzRxYXpiSXY1Z0VoeS96N09yVzlpemlYSVVJbGk5dTA3OTd0?=
 =?utf-8?B?WU85MkNUUFBYRUROM3ppUHlveUtYTFBsQXVYOHliakRDeDhGUWpIdWF4MHNn?=
 =?utf-8?B?b0Y0MlJnT3ppVy9wK0tubkUxZlduM1BQOFhkR1M2Z0hVR0RiT2o4QXNTSW5j?=
 =?utf-8?B?UW1rd0dhbk9SUThjNlA1NlRjK2J5SVFmVEFwd0Nuc2tGWHB5TkJ0TDF3RlBE?=
 =?utf-8?B?K0E4aVRoZDNTRmc5TE8yblBtY0w2eVhNMWZrd1RkajRwbE82WkFEaTR1aW1p?=
 =?utf-8?B?SVhCcEdCVjRnKzRvUjljUWFJYmFobWd4V1NQRmJxRHV2R3B2QUxDNXZ0OTFC?=
 =?utf-8?B?U25ZUjllM0FVV0xhVGl4a0pkR0YzMEJTNlk0ZHBTdXBtT3VQR3lOV1VHck5v?=
 =?utf-8?B?bmVSU3AzM05Hd09OR2xEQ3dadlpmN3c4RTBlQWhkODAvNVBXeWVOV1NzRGUw?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e31e92-64ca-416f-7a80-08dc3f6581d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 11:47:18.1935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RWA6Sdh399uloVJszoXDMbcpN56sR+jlqzIYnYIwg73JtwgjiEuZ6AqEBXdy27tC+YXrvZlZuoHYcKLyxzI7tlEfKLULuybecCXEyhB/guQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
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

Q3VycmVudGx5LCBzb21lIHBhcm1ldGVycyBsaWtlIFJ1biBUeXBlIGFyZSBpbXBvcnRlZCBmcm9t
IGZpbGVzLg0KRG9uJ3QgYWRkIGRvY3VtZW50YXRpb24gZm9yIHRoZW0gYnkgZGVmYXVsdCwgcHJl
c2VydmluZyB0aGUgd2F5IGl0IHdhcyBvcmlnaW5hbGx5IG1lYW50IHRvIGJlIGZpbGxlZC4NCg0K
U2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+
DQpbS2F0YXJ6eW5hXSANCkxHVE0g8J+Yig0KQWNrZWQtYnk6IEthdGFyenluYSBQaWVjaWVsc2th
IDxrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQotLS0NCiBzY3JpcHRzL3hsc190b19k
b2MucHkgfCAyNyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwg
MjIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3NjcmlwdHMv
eGxzX3RvX2RvYy5weSBiL3NjcmlwdHMveGxzX3RvX2RvYy5weSBpbmRleCA5MTQ0MGFjNjI5MWYu
LjUxMGFiNTQyNzZiYSAxMDA3NTUNCi0tLSBhL3NjcmlwdHMveGxzX3RvX2RvYy5weQ0KKysrIGIv
c2NyaXB0cy94bHNfdG9fZG9jLnB5DQpAQCAtMjQsNiArMjQsNyBAQCBjbGFzcyBGaWxsVGVzdHMo
VGVzdExpc3QpOg0KICAgICBkZWYgX19pbml0X18oc2VsZiwgY29uZmlnX3BhdGgpOg0KICAgICAg
ICAgc2VsZi50ZXN0cyA9IHt9DQogICAgICAgICBzZWxmLnNwcmVhZHNoZWV0X2RhdGEgPSB7fQ0K
KyAgICAgICAgc2VsZi5pZ25vcmVfZmllbGRzID0gW10NCiANCiAgICAgICAgIFRlc3RMaXN0Ll9f
aW5pdF9fKHNlbGYsIGNvbmZpZ19wYXRoKQ0KIA0KQEAgLTYyLDYgKzYzLDEyIEBAIGNsYXNzIEZp
bGxUZXN0cyhUZXN0TGlzdCk6DQogDQogICAgICAgICAgICAgICAgIHNlbGYudGVzdHNbdGVzdG5h
bWVdWyJzdWJ0ZXN0cyJdW3N1YnRlc3RdID0gc3VidGVzdF9kaWN0DQogDQorICAgICAgICBmb3Ig
ZmllbGQsIGl0ZW0gaW4gc2VsZi5wcm9wcy5pdGVtcygpOg0KKyAgICAgICAgICAgIGlmICJzdWJs
ZXZlbCIgaW4gaXRlbVsiX3Byb3BlcnRpZXNfIl06DQorICAgICAgICAgICAgICAgICAgICB1cGRh
dGUgPSBzZWxmLnByb3BzW2ZpZWxkXVsiX3Byb3BlcnRpZXNfIl0uZ2V0KCJ1cGRhdGUtZnJvbS1m
aWxlIikNCisgICAgICAgICAgICAgICAgICAgIGlmIHVwZGF0ZToNCisgICAgICAgICAgICAgICAg
ICAgICAgICBzZWxmLmlnbm9yZV9maWVsZHMuYXBwZW5kKGZpZWxkKQ0KKw0KICAgICBkZWYgYWRk
X2ZpZWxkKHNlbGYsIGRpYywgZmllbGQsIHZhbHVlKToNCiAgICAgICAgIGlmIGZpZWxkIGluIGRp
YyBhbmQgZGljW2ZpZWxkXSAhPSAnJzoNCiAgICAgICAgICAgICBmaWVsZHMgPSBzb3J0ZWQoZGlj
W2ZpZWxkXS5zcGxpdCgiLCAiKSkgQEAgLTE5OCw3ICsyMDUsNyBAQCBjbGFzcyBGaWxsVGVzdHMo
VGVzdExpc3QpOg0KICAgICAgICAgICAgIGZvciBrZXksIHZhbHVlIGluIHJvdy5pdGVtcygpOg0K
ICAgICAgICAgICAgICAgICBzZWxmLnRlc3RzW3Rlc3RuYW1lXVsic3VidGVzdHMiXVtzdWJ0ZXN0
XVtrZXldID0gdmFsdWUNCiANCi0gICAgZGVmIHVwZGF0ZV90ZXN0X2ZpbGUoc2VsZiwgdGVzdG5h
bWUpOg0KKyAgICBkZWYgdXBkYXRlX3Rlc3RfZmlsZShzZWxmLCB0ZXN0bmFtZSwgYXJncyk6DQog
ICAgICAgICB0cnk6DQogIyAgICAgICAgICAgIHByaW50KGYiVXBkYXRpbmcge3Rlc3RuYW1lfSIp
DQogDQpAQCAtMjMwLDYgKzIzNywxMSBAQCBjbGFzcyBGaWxsVGVzdHMoVGVzdExpc3QpOg0KICAg
ICAgICAgICAgICAgICBmb3IgZmllbGQsIHZhbHVlIGluIHNvcnRlZChzdWJ0ZXN0X2NvbnRlbnQu
aXRlbXMoKSk6DQogICAgICAgICAgICAgICAgICAgICBpZiBmaWVsZCBpbiBbICdsaW5lJywgJ3N1
YnRlc3RfbnInIF06DQogICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWUNCisNCisgICAg
ICAgICAgICAgICAgICAgIGlmIGFyZ3MuaWdub3JlX2xpc3RzOg0KKyAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIGZpZWxkIGluICBzZWxmLmlnbm9yZV9maWVsZHM6DQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlDQorDQogICAgICAgICAgICAgICAgICAgICBkb2NfdmFsdWUg
PSBkb2NfY29udGVudC5nZXQoZmllbGQpDQogICAgICAgICAgICAgICAgICAgICBpZiBkb2NfdmFs
dWU6DQogICAgICAgICAgICAgICAgICAgICAgICAgaWYgc2VsZi5rZXlfaGFzX3dpbGRjYXJkLnNl
YXJjaChkb2NfdmFsdWUpOg0KQEAgLTI3MCwxOSArMjgyLDIwIEBAIGNsYXNzIEZpbGxUZXN0cyhU
ZXN0TGlzdCk6DQogICAgICAgICBleGNlcHQgRW52aXJvbm1lbnRFcnJvcjoNCiAgICAgICAgICAg
ICBwcmludChmJ0ZhaWxlZCB0byB3cml0ZSB0byB7c291cmNlbmFtZX0nKQ0KIA0KLSAgICBkZWYg
dXBkYXRlX3Rlc3RfZmlsZXMoc2VsZik6DQorICAgIGRlZiB1cGRhdGVfdGVzdF9maWxlcyhzZWxm
LCBhcmdzKToNCiANCiAgICAgICAgICIiIiBQb3B1bGF0ZSBkb2N1bWVudGF0aW9uICIiIg0KIA0K
ICAgICAgICAgZm9yIHRlc3RuYW1lIGluIHNlbGYudGVzdHM6DQotICAgICAgICAgICAgc2VsZi51
cGRhdGVfdGVzdF9maWxlKHRlc3RuYW1lKQ0KKyAgICAgICAgICAgIHNlbGYudXBkYXRlX3Rlc3Rf
ZmlsZSh0ZXN0bmFtZSwgYXJncykNCiANCiAjIyMjIyMNCiAjIE1haW4NCiAjIyMjIyMNCiANCiBw
YXJzZXIgPSBhcmdwYXJzZS5Bcmd1bWVudFBhcnNlcihkZXNjcmlwdGlvbj1fX2RvY19fLA0KLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvcm1hdHRlcl9jbGFzcyA9IGFyZ3Bh
cnNlLlJhd0Rlc2NyaXB0aW9uSGVscEZvcm1hdHRlciwNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBmb3JtYXR0ZXJfY2xhc3MgPSBhcmdwYXJzZS5Bcmd1bWVudERlZmF1bHRz
SGVscEZvcm1hdHRlciwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmd1
bWVudF9kZWZhdWx0ID0gDQorIGFyZ3BhcnNlLlNVUFBSRVNTLA0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGVwaWxvZyA9IEVQSUxPRykgIHBhcnNlci5hZGRfYXJndW1lbnQo
Ii0tY29uZmlnIiwgcmVxdWlyZWQgPSBUcnVlLA0KICAgICAgICAgICAgICAgICAgICAgaGVscD0i
SlNPTiBmaWxlIGRlc2NyaWJpbmcgdGhlIHRlc3QgcGxhbiB0ZW1wbGF0ZSIpIEBAIC0yOTAsMTEg
KzMwMywxNSBAQCBwYXJzZXIuYWRkX2FyZ3VtZW50KCItLXhscyIsIHJlcXVpcmVkID0gVHJ1ZSwN
CiAgICAgICAgICAgICAgICAgICAgIGhlbHA9IklucHV0IFhMUyBmaWxlLiIpICBwYXJzZXIuYWRk
X2FyZ3VtZW50KCItLXNoZWV0cyIsIG5hcmdzID0gIioiLA0KICAgICAgICAgICAgICAgICAgICAg
aGVscD0iSW5wdXQgb25seSBzb21lIHNwZWNpZmljIHNoZWV0cyBmcm9tIHRoZSBYTFMgZmlsZS4i
KQ0KK3BhcnNlci5hZGRfYXJndW1lbnQoJy0taWdub3JlLWxpc3RzJyxhY3Rpb249J3N0b3JlX2Zh
bHNlJywgDQorZGVmYXVsdD1UcnVlLCBoZWxwPSdJZ25vcmUgZmllbGRzIHRoYXQgYXJlIHVwZGF0
ZWQgdmlhIHRlc3QgbGlzdHMnKQ0KIA0KIHBhcnNlX2FyZ3MgPSBwYXJzZXIucGFyc2VfYXJncygp
DQogDQogZmlsbF90ZXN0ID0gRmlsbFRlc3RzKHBhcnNlX2FyZ3MuY29uZmlnKQ0KIA0KK2lmICJz
aGVldHMiIG5vdCBpbiBwYXJzZV9hcmdzOg0KKyAgICBwYXJzZV9hcmdzLnNoZWV0cyA9IE5vbmUN
CisNCiBmaWxsX3Rlc3QucGFyc2Vfc3ByZWFkc2hlZXQocGFyc2VfYXJncy54bHMsIHBhcnNlX2Fy
Z3Muc2hlZXRzKQ0KIA0KICMjIERFQlVHOiByZW1vdmUgaXQgbGF0ZXIgb24NCkBAIC0zMDQsNCAr
MzIxLDQgQEAgd2l0aCBvcGVuKCJkb2MuanNvbiIsICJ3IiwgZW5jb2Rpbmc9J3V0ZjgnKSBhcyB3
cml0ZV9maWxlOg0KICAgICBqc29uLmR1bXAoZmlsbF90ZXN0LmRvYywgd3JpdGVfZmlsZSwgaW5k
ZW50ID0gNCkNCiANCiANCi1maWxsX3Rlc3QudXBkYXRlX3Rlc3RfZmlsZXMoKQ0KK2ZpbGxfdGVz
dC51cGRhdGVfdGVzdF9maWxlcyhwYXJzZV9hcmdzKQ0KLS0NCjIuNDMuMg0KDQo=

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C8DC5475B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 05:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8377310F60F;
	Thu, 14 Mar 2024 05:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPu6fXHL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F178E10F5B2;
 Thu, 14 Mar 2024 05:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710394848; x=1741930848;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e/tWF5J9A5s8OBR0nV7Lm+9EBRYLSz5Qq6FwuwSmifY=;
 b=HPu6fXHL1BJAQQ+AjLpqBqgQN0nwSzD+uR9/HkP+u6zGYN6WubYkNBn4
 q5cAGabbm5q7oAWyBlQCLJYuaSxTZfuUamivYbhQR81fHKqqezNjmPd9j
 yDHrtu6l5WeyvsqjZLvlJgzmIEJsOZ2SL8s4vtoW2CQO/nIJ/+CFZmvYP
 c2A7BAVc86VDViYM2T8rnGGl7mNiNkFXk48MIXHGchK5gECh8H/JymUT/
 p6IM3SXN0H8nIgBPN6v9oxvQ1PgJwAk4m/Mbl0aDCtMZdq8lf+9YsdMml
 MqTMhMdsTj6La88dOOaB+5E2zcjTBzKbukCW9HtXTdqORseFWV60cBvPB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="9014264"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="9014264"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 22:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="43222001"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 22:40:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 22:40:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 22:40:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 22:40:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 22:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibl0MhJyp2tx5ghD1dB+uOAPerl6cM7gdTZP/Xfx4g2zXaPKC4XWfydyYNc7QroT7yniIGo5Xqo9v+rdTMVPgRlAuIRK7ZqsLxUqJDvlsf+nS2IKOhE/2UX9fuvAdZbdTrgJNuO8Mv8CK2G1O3i2w/bUutXvt8GBPTSyLJtiaQSWP5m4rMsZmTbzRSmGFTUdU7QLEQwQTDPDD3EhMaWI1ZZaxxwFIKCHI08ISbr/cq7dZtlu8+Y2s4iKwF0JhoJB3tOUoMCkCGTKdO2wnZl06QlLkjReadcVtUPXiXvhLNJ8Zo1sc20d68TTNDfQ1zJSZ41LscoflKz/gBe2muKBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/tWF5J9A5s8OBR0nV7Lm+9EBRYLSz5Qq6FwuwSmifY=;
 b=J+IGaTudezjTTN+peeir1JVFvkfwk44qBY48oOqFYE7CLFVZEjD2VZ5ZoAX81sO66ExZdMrdo3cvwmrEX0lz0jLgOpPcWBVC02aNej9hGU3oD4M1NqhJrAd0pvf2Bkg8Wo41Vqvn41m7BoL/hyyUrBLfOUDUAR6zvUWFm6dIdjzCr/K6PJSTybMIZ8nGI+M/3LZmlbzRYLIbQOzcKLYMM/tu88LAztJ9q5xxZk/tGevpumM3ITYneYDTe68B3PNOlfAZgENZ5iURUn5/L1Jvd3OR/wID4yy1f/PhvaBwgG2f500icvrJDHv+ZiWtvxWc+G1QNd8I8658Ifwvn22GgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 05:40:40 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5%6]) with mapi id 15.20.7386.016; Thu, 14 Mar 2024
 05:40:40 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIEZpeCBzY3JpcHRzL3hs?=
 =?utf-8?B?c190b19kb2MucHk=?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRml4IHNjcmlwdHMveGxzX3Rv?=
 =?utf-8?Q?=5Fdoc.py?=
Thread-Index: AQHacVE2YGAdkvMuaUmzuSSJP0XoGLEygtYAgAQ+mxA=
Date: Thu, 14 Mar 2024 05:40:39 +0000
Message-ID: <PH8PR11MB6753C46D7EAC369A60BC6800F2292@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
 <170989963405.612184.446976450908056040@8e613ede5ea5>
 <20240311125046.7ayufj5afns5dhwf@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240311125046.7ayufj5afns5dhwf@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|MN2PR11MB4550:EE_
x-ms-office365-filtering-correlation-id: fe7dbc0e-cda8-4650-9d7c-08dc43e9485a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ERAPnSVUKEwjkSy5PgoDGRbicsuEzxKkx9BiusHIimTqwIlCvpDcOkaB5FI6h/FhZo32HfxilgBLb6KUEoly/hdvqKMc+/6ABqHhuQGmTsCbJvpf9OLbrSuc0Xl19PQz7RTRM9lvL6iXlQAtY8vFhPkvM8yz+EDn5EPShpOrbavNcXb9InTmeGCdQJq54l3bWTPES0iUq2WJuffaqxWtY0Gq6iAbduPlODPPY0Ci9PEuRBQ4msU4a9oUImw4ucrLHUkyNF1QF4RL5Ea1UXCbisOOWCn9frURlaUaVIESSwqonm3L7yKLtEWsW4i/2PpC1Ky07uAmQHa+9rQBpqJDzLLvsqAWI/cJM+6X64RTL5O8m/mEi/7KKT0ldfkxNqCjLnC+Rb2H0FX5U6R9qRFUQuQe2Ya7oad1RtnBObyBuvHV2JKEouCmHF9md2J/cDohbj1zjaVOH0vP3dEK1pqvffwHidIJC4IRznEXAeTWRyhblrVBUHB6yW8sNSNk3OrWPjtq5vCNEaLt8oP7ICyQ8bPcVYuYV4L0uyDjbPHpOHk3VOYI3AxbBycairOjM2FGHr8u5MST5qsiaNYDhLg5vyAI3rq5X2VDXWw9HFidjzBBggtQuMFgiPXQ+YutKA9Y/ZFZPkepTgJ7ze8M7uzq5jyOsM9IoJ9qndbsnTj+CS8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUlCc2RocWVRcFIxZGhHa0lmVTMrRXFucVh2UEtYVlFhbDdDeS9tSWhZTXVB?=
 =?utf-8?B?bkcwZ2ZSY0RjVC9tdmJrK3czQjBTeWtYN2xTMGE4djArN1JzWGNKK2svclB0?=
 =?utf-8?B?QkwzcTJMWnpFdFk2UGs0bnV4Q3Bjcko5T1hadVNDQURZS1N0aGtaUmhzZ3VO?=
 =?utf-8?B?MnM2ditVbTJhSXF2cm0wQmV2UFBXQlNBUFQ0ZlZkcEdScjB2WHZVaWc4RUlz?=
 =?utf-8?B?SThiZDRXRmp4MytOWTZXTjA4djJ5bUlrZjl6WjBMZFp3WmNlY3RoVEJZVFll?=
 =?utf-8?B?NVlwaGVaOWFCZUVUenJYOUlEK3hXcUUybHRTWXc2ZmxJV2tEWlRoSVdGa3Bt?=
 =?utf-8?B?OUpCNzY5enAvTDhoVUlWVnNaakRTZWVIV0xGeUt0UVNzUVZwM00xcktWZjJv?=
 =?utf-8?B?WXZmbnFNRUI1b3RESmJYYjlqQVNGYVlCUTNzbDNvV2xaNjRqdzlHc3NNQUZj?=
 =?utf-8?B?dXoxN2pYY21abVlLdWloekgrUFk0ZmNPN0F2c1ozVDJXaDNnaE9OTDBzVG95?=
 =?utf-8?B?UExpMUtsYklhMDJIb2daNjZqVGpCNUpoeUtLdFNFMURYOUlZT24yZE1PWWlj?=
 =?utf-8?B?K0JHUlpyQUxLNjc0aklOeFM5aFFwdnB5ejd5Wm5DV3RkdmhBSE5JMDBiUUVD?=
 =?utf-8?B?clhRcUhkVW9IZVNvelJlSnlWRnNUcHIyeDllTG1Cdk9nZ3I4eTMyMFN1MEs2?=
 =?utf-8?B?R21XWFRmbzdvTGVNdk5GRmJxYjRXcDlBRlFBREdWcVdZQXV1ZStmODJzMW5T?=
 =?utf-8?B?dWhTQWFsM0xmRjVydWZsbnFDQko2bWJaL0IyeGRGMUNJV3I1c1JvRTZvdFlj?=
 =?utf-8?B?RTNxY3VHMlJpM0lmZnFvMEljL0dta0JIbFhMc01meUpvMzdrTUE2SmR5c0tv?=
 =?utf-8?B?RXYwT2lBOXlqdEYwS1JlUVVyQnVnV2FKdXR5SHZDdTVvVTlhQzZrWlFrQ0pW?=
 =?utf-8?B?SkJDdDhMRG45MWFBM3JvdWhPcUxYYlNVOUM4czAwQVBsVnNtblhSMDV0NlFV?=
 =?utf-8?B?Yy83ODZCQ3M3SGc0SzFKQXRwZUlDcGpYRG15NjBBajROSnYvSlBXRjFRUTZZ?=
 =?utf-8?B?QkYwRUVhNHlZZjI3ZTluVmRvYTQzSlhkOEdFekNjbFZPblNFeDRtY01PUVI5?=
 =?utf-8?B?VVQvVEtYMGF1d21pK0lMVG5qaWZ6VTJFaUNPRXc0L2pVbTY5REJRRWp3Q05V?=
 =?utf-8?B?RGhNbGllaGoyMmhyOEVpbDhDT21yT3J6TjYzS1U0VS9MUTcxMnNsUFZyRjNP?=
 =?utf-8?B?aTJXS2dhYXVBMysvQXVJY3FpNzhxemZ2dm9Ycnc2RXJGdkZtVVZTQ2Juc2cy?=
 =?utf-8?B?aHBQMGZUSXlLMEhNbXlOdFdDYTF2Mm9aTW01Y1RONHlKd095MXB1RE5zTVdP?=
 =?utf-8?B?UWgvNFdxeUpMSUR2RmtVWFdxbEtqYUlnem5wOGVBOWNCb2h6VDNRczU1TEdV?=
 =?utf-8?B?bSs0MkJxWHErS25oaUQ0SzZXVEtBVlcyVDdyRU8vSWd2Z1RuNnBxQTIzRWRm?=
 =?utf-8?B?WlBndzBEdXNnMGV0WTBKbmNOU1FMbHovVzBUTnpzd0VlWnNSOVR4TXNzdEhv?=
 =?utf-8?B?U2hQRVFqYnFtOTViZUNwMnE0MUZBRUxTSk9oa3k5NmkrVWVoUjNEL1o1RjY0?=
 =?utf-8?B?TkxOdFM5STcrWi9SWnBVTEpIb1RaaGljT2JidC93QStjL0lJUFp2YzNqVy91?=
 =?utf-8?B?UjBiUFo0M1cwUFRrcWdKaDM0L2E1c0VMdG1lamNpa1BMM1RSUDVOMXpBSjR2?=
 =?utf-8?B?MjlFTW12SXJ4cXZ6Yk1MUVRYNktKTDFEU3ovUVBHYlpuTEdqQThYdDJWZ05z?=
 =?utf-8?B?RURZcTdjNlVvTzIzcitHd2hOU2Z1U1F5ekFtZDl6SEtUanNtbTBGR1dBY1Qz?=
 =?utf-8?B?YlVkS1RBUEs2YUNaZzNDOU1lM2xIQVBvYjd6UGZnU2xtQUFJZVpXcEpJRHVO?=
 =?utf-8?B?eVdNTGk5dUM5dnU5dzhxalRTbGYrTUtoTHBBRWlZSG9CYlNmSUl3SkVUbmlL?=
 =?utf-8?B?WkszcE9SNU1ncS92UlhKK0dlT2xJbUhxM25Rd21SYmJYbUlLeVFLNDR6Vlg4?=
 =?utf-8?B?L1N2RkVMNFFhWWlWRXJEMkExSWRMMDQ4SlJPd1JORjZrbXgweFF2czZkZjJt?=
 =?utf-8?B?ejhLSENxSnR6VllDa0czMmNyVkR1SHc4M0xQTEptQkdYN0xVYzhxUXFTSkZP?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7dbc0e-cda8-4650-9d7c-08dc43e9485a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 05:40:39.9971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5wXkjsjVqsS3ZxFphehQJNfRt7ShuYWAtFcIfZJvBwKbOwY9c9tXNXKRFVLxkeE3+PvwG1vLM/ZQvHIeUktulhYJOXChOIdqXpw8mx4C8fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMwOTA5LyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50
ZWwuY29tPiANClNlbnQ6IE1vbmRheSwgTWFyY2ggMTEsIDIwMjQgNjoyMSBQTQ0KVG86IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtYXVy
by5jaGVoYWJAbGludXguaW50ZWwuY29tPjsgSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IExHQ0kgQnVnIEZpbGluZyA8bGdjaS5idWcuZmlsaW5nQGludGVsLmNvbT47IElsbGlw
aWxsaSwgVGVqYXNyZWVYIDx0ZWphc3JlZXguaWxsaXBpbGxpQGludGVsLmNvbT4NClN1YmplY3Q6
IFJlOiDinJcgRmkuQ0kuQkFUOiBmYWlsdXJlIGZvciBGaXggc2NyaXB0cy94bHNfdG9fZG9jLnB5
DQoNCkhpIGlndC1kZXYsDQpPbiAyMDI0LTAzLTA4IGF0IDEyOjA3OjE0IC0wMDAwLCBQYXRjaHdv
cmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IEZpeCBzY3Jp
cHRzL3hsc190b19kb2MucHkNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzEzMDkwOS8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5
ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIENJX0RSTV8xNDQxMyAtPiBJR1RQ
V18xMDc5NiANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+
IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEwNzk2IGFi
c29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElm
IHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0
aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdUUFdfMTA3OTYsIHBsZWFzZSBub3RpZnkg
eW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFs
bG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdp
bGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiAN
Cj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDc5Ni9p
bmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICgzOCAtPiA0MCkNCj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEFkZGl0aW9uYWwgKDMpOiBiYXQtZGcx
LTcgYmF0LWtibC0yIGJhdC1tdGxwLTggDQo+ICAgTWlzc2luZyAgICAoMSk6IGZpLXNuYi0yNTIw
bSANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAN
Cj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRy
b2R1Y2VkIGluIElHVFBXXzEwNzk2Og0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4g
IyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGNvcmVfaG90dW5w
bHVnQHVuYmluZC1yZWJpbmQ6DQo+ICAgICAtIGZpLWtibC03NTY3dTogICAgICAgW1BBU1NdWzFd
IC0+IFtETUVTRy1XQVJOXVsyXQ0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9y
Zy90cmVlL2RybS10aXAvQ0lfRFJNXzE0NDEzL2ZpLWtibC03NTY3dS9pZ3RAY29yZV9ob3R1bnBs
dWdAdW5iaW5kLXJlYmluZC5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA3OTYvZmkta2JsLTc1Njd1L2lndEANCj4gY29y
ZV9ob3R1bnBsdWdAdW5iaW5kLXJlYmluZC5odG1sDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRl
c3RAbGl2ZUBhY3RpdmU6DQo+ICAgICAtIGJhdC1hdHNtLTE6ICAgICAgICAgW1BBU1NdWzNdIC0+
IFtJTkNPTVBMRVRFXVs0XQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS10aXAvQ0lfRFJNXzE0NDEzL2JhdC1hdHNtLTEvaWd0QGk5MTVfc2VsZnRlc3RAbGl2
ZUBhY3RpdmUuaHRtbA0KPiAgICBbNF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzEwNzk2L2JhdC1hdHNtLTEvaWd0QGk5DQo+IDE1X3NlbGZ0ZXN0
QGxpdmVAYWN0aXZlLmh0bWwNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGd1YzoN
Cj4gICAgIC0gYmF0LWFybHMtMzogICAgICAgICBOT1RSVU4gLT4gW0RNRVNHLVdBUk5dWzVdDQo+
ICAgIFs1XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTA3OTYvYmF0LWFybHMtMy9pZ3RAaTkNCj4gMTVfc2VsZnRlc3RAbGl2ZUBndWMuaHRtbA0K
PiANCg0KVGhlc2UgYXJlIHVucmVsYXRlZCB0byBzY3JpcHRzIGNoYW5nZSwNCg0KUmVnYXJkcywN
CkthbWlsDQoNCj4gICANCj4gS25vd24gaXNzdWVzDQo+IC0tLS0tLS0tLS0tLQ0KPiANCj4gICBI
ZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiBJR1RQV18xMDc5NiB0aGF0IGNvbWUgZnJvbSBr
bm93biBpc3N1ZXM6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KDQouLi5jdXQuLi4N
Cg0KPiBCdWlsZCBjaGFuZ2VzDQo+IC0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgKiBDSTogQ0ktMjAx
OTA1MjkgLT4gTm9uZQ0KPiAgICogSUdUOiBJR1RfNzc0OSAtPiBJR1RQV18xMDc5Ng0KPiANCj4g
ICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICBDSV9EUk1fMTQ0MTM6IDAyNDMwMWQyOGIwYjJj
ZjQ5MmZmZGIzY2U2ODgwNDRjZDk5MjNmMzggQCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9y
Zy9nZngtY2kvbGludXgNCj4gICBJR1RQV18xMDc5NjogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDc5Ni9pbmRleC5odG1sDQo+ICAgSUdUXzc3NDk6IDJm
ZDkxYjhjM2NmOWFhMmIwYmI3ODUzN2E2YjVlMmJjM2RlNTBlMGUgQCANCj4gaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdpdA0KPiANCj4gPT0gTG9ncyA9
PQ0KPiANCj4gRm9yIG1vcmUgZGV0YWlscyBzZWU6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEwNzk2L2luZGV4Lmh0bWwNCg==

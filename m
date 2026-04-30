Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74581CD13D9
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 07:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BAB10E00F;
	Thu, 30 Apr 2026 07:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l96PDJN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2370D10E00F
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 07:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777533170; x=1809069170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=A6YonwvJ95w/0cY3ph/N3mc5wrJzCOzqQ4cUmZS7ta4=;
 b=l96PDJN9mnW7La8B3F1Erbb7SOma6cqD0ELjQmSL9HVbnPzo9vRwj7TE
 JOl0gsLeRnk3oH3a7iU4RqRfp+HPRO6kANqvgVx7dU5z4qTngGCGQokqG
 dAvrb9Tt7Xn3oH5QDdTukXI8LiLq6BXmXVQLmvqCAyt/MrNCdgKLqgZbq
 qfwwDErg16SOg1INoICVbS1ie0cdNhLY4SLZj6hMWEV1ceECPbFH71TT0
 JtNZ97h+DwAKMA1SO3EicjbZMxP9xWXLQKsAxQruRlKLqst4wDRK66xc3
 0F6hvgpdBQw9QyjZ0eB3RNiw14+mHk00v0bWlbS0MxvexWDQf6i5MCcIR A==;
X-CSE-ConnectionGUID: msytzEGRQK6Rkm2F/a6ztg==
X-CSE-MsgGUID: iMS7yQXASxq+S1JpKYOyNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="101138639"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="101138639"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:12:49 -0700
X-CSE-ConnectionGUID: OZ/DP2liQWqA1oAYow3nQQ==
X-CSE-MsgGUID: rcWJqbzBSgyseiPgHoQNeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="227996665"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:12:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 00:12:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 00:12:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 00:12:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrib0XkqxxANmHCpTV/FHjWoG6qvk10iZtWDQv+P3zApksS5pP+fUlVtFm3XPBzesO7nYcFe0VoEln1QOs+Rvxhp7CgEhCZ8Ag5/YSB1KbauF3rXPk3APdeNPAy09qPCGK+IpzjO9wAcc92O1M4y7rUhWXnHTXU26LVrww7H7M8IWN17dGZp/2Wek9xfG815C9TZg/CCXysI5RfJXwa+YSWEWC8XYhS38YQK234bzMk2SCEV7EFZKi0OeHBXzFTtOuawo+jwZc0HjZCu3OKuC5qfJOc/o8TEsiId5jgy6Xa/LFBzl0V0oBjDkfkiHd8YSQdROuTVTBMBbobQ1vW71g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6YonwvJ95w/0cY3ph/N3mc5wrJzCOzqQ4cUmZS7ta4=;
 b=gnwWFdSpBwTX6ivfM8PbAIGYPJ6X5siTeaQrtV7DvyTOulTAVv6GV7CjvBvJUltmxOMjh4GOAq0Sn5Y1k+Zeu3ojWnVx5UAgIQjCVFms9TZXGu7b0Bu6prxnM/3ZmLboREpLeLjjOVv77ZHWMX+nxW7Co8agMpmUv0zj9R5tTzZpCwZ3rc3CtpKDA73CRb4ai6JUgrBl76XPezVvqK+4Bu4QzdskWfw2WAsQZTC1s3NKATflb/v81gEZEaV8SID5xKR1gHXqBfLjg2jfnWYJVH8w8TaEVixfkQBzlSuPaRjxdhe5FWCdTrLuA+QLtwZ6uuwJNxkHsuPq/NA5S7yulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 07:12:46 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 07:12:46 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v3 04/11] tests/intel/kms_frontbuffer_tracking:
 consolidate fbc tests skip checks
Thread-Topic: [PATCH i-g-t v3 04/11] tests/intel/kms_frontbuffer_tracking:
 consolidate fbc tests skip checks
Thread-Index: AQHczYMfkZ9r20KcZ0SpPZ6arfFiBLX3Gn6AgAAr9gA=
Date: Thu, 30 Apr 2026 07:12:46 +0000
Message-ID: <67ea99330098b311eb4929ff22a245efe04ebc9e.camel@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-5-vinod.govindapillai@intel.com>
 <c8b97fc0-de77-47bb-85a4-984576bfd558@intel.com>
In-Reply-To: <c8b97fc0-de77-47bb-85a4-984576bfd558@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SN7PR11MB7568:EE_
x-ms-office365-filtering-correlation-id: ac3e932d-8bbc-401e-b3c0-08dea687e134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: Q0MYgIJ3wf/yVGDYo+5RjuVGkjwVVoNnGftxZ2VCmmfk0Z4l9TliatxhVwgxfyFrPmWPC4YJJ9BeLlSr0d4AM9AJDlWTO+nKd4Fds5qehpDccpS+9ghWqJvyYhgB5raTO+yyGvPXr9mmOCuU872XVCSh7WXLYIuadt71vI3UzW+RTOkpjKbiEDTIFIVprax9HSFneY6nQeQ1b8nPX2a9u0wpymkgkbTFQBiwlqfw3L0VOlDcIvvXfTSBzAkFqWeC8vUYgzKpnUGYhMpu2jy0ZAZKKbkx1rohx8D9G0geS+W6Z6mFYGawjVF1ZMjodjTBsbQ4OI1yDX6O7OJOb4xJk27YXlhGAtGgMRGYNi6UnQ2xheemrJ+C3KY1B9/fdzdByCITRJ+o83dv8uxsc0zx/ygmRbSr5/hIYKsjiBIfERIl4nRR+ATTpv4wjqAeRvRF88J6EG6ijKQd2V9ZDcRJhTsh7Ol1YTGBTfsyVrxiuPp9Ct8kGHUdJEoc+dGSTMUOC5Caec3kGcYfzdrxXTT7ShSsP1vLOxDSxhiSJ/A+aSz9m59BMeU5d1LF7wbdgrG3BEWic/JWU2JLwukqDuvL5RSsS9hYEJjrCb09SS94THWX8lUAzik8miI4IB4s/szNeua2vS2ZGqignf+c1fQyKDnAYGGxCP0FdWrB1vuEjoI2lsqCSUGE7eG33mS7CFgfHg3dLdH/UrMoHIh1Co0DVlqHGzuJ00I63OBFQ9NjOSCqRIAtsHPA0gGkE6o1dW+YlaJzzAyrkRQMfO0BBmjFimBiO07VU30MgqYSgVIwavg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnBFSWwzSEdZUENwWE1JYkJXOXROc3dPbGNacTMwNmVqZ1VhNEFkQ2ZjVXla?=
 =?utf-8?B?M3M3ZWIrK2NBcFJkOTVnK3h6MEtrVE9CYkZGOSt6K0o2UE9JdSttSzUwOGJO?=
 =?utf-8?B?WVJTYW9KRG5tRGpjVklLb3VpakYrL3dleGJGYnhiYVNsaCt6ZFhTM1BqeXZm?=
 =?utf-8?B?OXpKb1BET1V1aDBQQnNuQ21sRWtyMEV1dEpYRnNBeG9YSWs4bHMzcGVmYmNj?=
 =?utf-8?B?dk40c0xsUWZ4SkR3RjJQVGFlcUtzcmgwNFZaRGg4dkFHdFhVWUFCYmZ6RlJT?=
 =?utf-8?B?eEZWMzI3NkJMY2RHbTFtUlpobXZJRmw0OGZiNFlDS0hTcW9JWlNTbkVhclhM?=
 =?utf-8?B?VCtzQytPekVKUVprWWxNTlRoY2ZqZnZrQldNVXg5blNqaVFNUEpqSTZPWDhm?=
 =?utf-8?B?Q3J0VWVmQWlHdmh4ZlJyVnFnTDdMV1BDSmFjM2VrZUhZQWxMemxNNUVvUXJM?=
 =?utf-8?B?QWh3TEdqK05zWUJDODVoaFJ2VnhCMlZYTUtKRnhpcFYvcFM1NGZKS0NiUElW?=
 =?utf-8?B?dnZtaFBrMm1qYnMyNjZmZmtnQmpQRGxwYkxnV3BxV0dKd1JZS0owZWhZOXg0?=
 =?utf-8?B?MUx3YkN0QXlaK21Mb1FLeDdIR1NOUWZVSkVPUkQrODVqbi9Db3pxTEpQWEVT?=
 =?utf-8?B?ZXRKNFo5SmFCdkNFY0F5aEtMR3R3OU9tNG9INVRBMWNaTUdiV0lLM0U3V04z?=
 =?utf-8?B?Y2JLSkZmMThvUmVVL2psZitZRG1NQ1p6NEgvVDE4VW9oQkM2ZXBaNi9aQk1D?=
 =?utf-8?B?bzlzMmhVd2RHWmpRWnNEZ2QveUNsTk0zRVU3UUkvS0JrZkxjOHJvNk0yaHNK?=
 =?utf-8?B?MzVMM09EYlNISVI0NDB5dTRmSWNjbWVrSjV3dnVOeVVXSjVncHFLRnJCSzln?=
 =?utf-8?B?YVV1ZDVsWG03ZTVRczl3dDYyNnJKYlRPZzJoaUcramZBelpsZ1A4bnY1dTJi?=
 =?utf-8?B?aklOK3JiYXlMMEI3eVpDbkZQZEkwL0RkUEhaTDVXbWZYVEZETzlFaG1yODBH?=
 =?utf-8?B?eU1ZN2lxNHg1aW1pZXhIdk9FU21sN3prWWc2d21kOGxzZlo1eVI5T0tUTlRQ?=
 =?utf-8?B?aU5kaytCSUtqb01nVVlWam5aUkVnQnZrM1h5SSt2bFFUem50ekt4U2tjajIz?=
 =?utf-8?B?dUIvZnBPNTdyVDlZR2ZkQ1plZ0hVbmRzYmttcXhacDlvMklaUGxORHNuM09H?=
 =?utf-8?B?YVBZNlpXMmcwZlhFUVJ6RFM0bEl1ZzNpTHloM29jQWE2RVJjUEUxbFZxWCs4?=
 =?utf-8?B?M1BhNXRDRWkyaXhKanZKWk1lWTI5RlVtTnU2dzJlMUtOYVZPdkcwazhOZStx?=
 =?utf-8?B?V0pldUlrNUN4LzRIQ1FIalVlVGJVK3dkaEh1a3lmdnlTd0xIYzNHSFF5R25M?=
 =?utf-8?B?YjgrWk1sTzRlSUpCRDVUQ2oxdkl6aHl1S3VDdkFYbHg5YkxSNGNyckk0YXV5?=
 =?utf-8?B?bm1ZbVpxUEQ3OER2QTkzUnhUcXRaZEtjcCtNclZhejJvTnVJVmtZdXE3ZUk0?=
 =?utf-8?B?d3dQaFB2cDZ5UlpBY1ZVODJSYUdWTUNxb081UlI0UHA2S2o5T0JOcG83dHpG?=
 =?utf-8?B?eWdMbUwzS1hweVhhc292VkcrZzdlV0x0d0NuSjNDNzZtdWZkOTVKaDlkRzcv?=
 =?utf-8?B?Q1NWQk5ReHJoN3RHSkIvemZpUzBuT1M2cGRjdzE2QXZqZGJsSnpqUkp1K2da?=
 =?utf-8?B?Z0dyVytTemdHNjdVZm1GNDRFMHlwdEFwYW9EWW9NQzhkckdpSStCNDVxWU1M?=
 =?utf-8?B?NC9wSTloY3JvdkNpR0tvb1RUdVdseHhhTVJvTUFPTUlycHcyOTY4WXUzblhX?=
 =?utf-8?B?NFNqSDcyQVFjZmZndnhwa1JCemVHYy8vc2FiY2RBeFhVcU5lcFRkSnpBQXRq?=
 =?utf-8?B?bWZlUDdJTnk1c052WkNEampscE9SMVFXY2h6d1RldkhjTjAzamwwWS93S0RD?=
 =?utf-8?B?ZStkMjJSMmluWEZTSGVFeWFKM1hNSXRhSDFqWXQ3anhCWWNMcUxpOE9MNXd6?=
 =?utf-8?B?NTJSYWIwUGVqQ3p5UFJzd0UzeTNWMzVLNHAwVzBKeTlnejhwQ1owSXp6Smtr?=
 =?utf-8?B?d2E0ckJObDM0UkN1bWFlUU9hWld3em1XYnJGbGZPYUI4Vk0zVHpFNFpIcnlp?=
 =?utf-8?B?NjlNY2NTSEhmWVJ3ZE1uVGpYT29hNm1nRE4xa2hUcHBFWitycWxaeVZZRy9n?=
 =?utf-8?B?REdjUUU3M1ZuMWVFcXVjaVd3akdBbFlVbTFvOFYxa1ErK0FFa2Ftb3d6V2Y0?=
 =?utf-8?B?bnVsU0Q3VUE4dDZ4eGJydW44SytFaFBDYUlBYmN2WkhJd1RxUXprSlJCZEMy?=
 =?utf-8?B?NVFWWVpkYkMvRG9pbEJ2cUE1UXpHdThxS0VvWjBrbG16cktkc09yRUVKOFlN?=
 =?utf-8?Q?XpiviDbRB4IoQvxKRaTVu9OsNW7VRBBO9w1qN/Tx2lPb0?=
x-ms-exchange-antispam-messagedata-1: ibieH/hNSYsYUy2ARhQGxo1QJMZhbIPDo24/rbCp5YCA83NxUdnckQVI
Content-Type: text/plain; charset="utf-8"
Content-ID: <F677E05C1B9A634D9EFA8969B2951487@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AjifsfSdTITqe+fdfCja7Ml7LywAmQxMKihNXynhBhnLHzfOBh3iaIF3Ny0kaQXkyA7JKeVr2pkURrSbO0mHxcvx8A48KBxciidDNvYDC97HaueEToaDwuMOYZp1jbbMhJhJuAjWxkXRCQ+A+drZWm3d2OcDrdUXRZPClahie2S9VoTJosRDd/setaroMZTywxfXoa/smwJxE+8g0dLNy5GXnuouNL89eqTGWydDsCtQER1bWpGkfcd1+/dTBza1aLFNBLNypwxWEIb3dUkNjQb6sieVhdx5mXsjvkDSUfe9LSaAdxnYJ9+L4nw7Sqckb7JYaZbaZaxacH3Wv3bBAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3e932d-8bbc-401e-b3c0-08dea687e134
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 07:12:46.1703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +bIMRHsQ4fV7SZsfZmUUF/Lc5jPyLy1FVukGnuGCKed9fb6RgQ94Pj0U2pwHklZgTGqgTOfRMUQFefu2BOya44U2xjENpyuBwZMSMWUX3WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
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

T24gVGh1LCAyMDI2LTA0LTMwIGF0IDEwOjA1ICswNTMwLCBSZWRkeSBHdWRkYXRpLCBTYW50aG9z
aCB3cm90ZToNCj4gSGkgVmlub2QsDQo+IA0KPiBPbiAxNi0wNC0yMDI2IDE0OjU1LCBWaW5vZCBH
b3ZpbmRhcGlsbGFpIHdyb3RlOg0KPiA+IFdoaWxlIGxvb2tpbmcgZm9yICJubyBmYmMgcmVhc29u
cyIgYW5kIGRlY2lkZSB3aGV0aGVyIHRvIHNraXAgYW55DQo+ID4gc3BlY2lmaWMNCj4gPiBmYmMg
cmVsYXRlZCB0ZXN0LCByZWFkIHRoZSBkZWJ1Z2ZzIGZiYyBzdGF0dXMgb25seSBvbmNlIGFuZCBs
b29rDQo+ID4gZm9yIGFueQ0KPiA+IHNraXAgcmVhc29ucy4gTW92ZSB0aGlzIGFzIGEgbGlicmFy
eSBmdW5jdGlvbiBzbyB0aGF0IG90aGVyIEZCQw0KPiA+IHNwZWNpZmljDQo+ID4gdGVzdHMgY291
bGQgdXNlIHRoZSBzYW1lIGxpYnJhcnkgYW5kIGFsbCB0aGUgc2tpcHMgcmVhc29ucyBjYW4gYmUN
Cj4gPiBtYWludGFpbmVkIGluIGEgc2luZ2xlIHBsYWNlLg0KPiA+IA0KPiA+IFN1Z2dlc3RlZC1i
eTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gPiDCoCBsaWIvaTkxNS9pbnRlbF9mYmMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDM3ICsrKysrKysrKysrKysrKw0KPiA+IMKgIGxpYi9pOTE1L2ludGVs
X2ZiYy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gPiDC
oCB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDYzICsrKystLS0tLS0t
LS0tLS0tLS0tLQ0KPiA+IC0tLS0tDQo+ID4gwqAgMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRp
b25zKCspLCA1NCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbGliL2k5MTUv
aW50ZWxfZmJjLmMgYi9saWIvaTkxNS9pbnRlbF9mYmMuYw0KPiA+IGluZGV4IDQ3ZjBlMmZjMS4u
ZTJmYmUzNjgwIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi9pOTE1L2ludGVsX2ZiYy5jDQo+ID4gKysr
IGIvbGliL2k5MTUvaW50ZWxfZmJjLmMNCj4gPiBAQCAtNjMsNiArNjMsNDMgQEAgdm9pZCBpbnRl
bF9mYmNfZ2V0X2ZiY19zdGF0dXMoaWd0X2NydGNfdCAqY3J0YywNCj4gPiBjaGFyICpmYmNfc3Rh
dHVzLCBpbnQgYnVmX3NpemUpDQo+ID4gwqDCoAkJCQkJwqDCoMKgIGJ1Zl9zaXplKTsNCj4gPiDC
oCB9DQo+ID4gwqAgDQo+ID4gKy8qKg0KPiA+ICsgKiBpbnRlbF9mYmNfZm91bmRfc2tpcF9yZWFz
b24NCj4gPiArICogQGRldmljZTogZmQgb2YgdGhlIGRldmljZQ0KPiA+ICsgKiBAY3J0Y19pbmRl
eDogY3J0YyBpbmRleA0KPiA+ICsgKg0KPiA+ICsgKiBSZWFkIHRoZSBkZWJ1Z2ZzIGVudHJ5IGZv
ciBjdXJyZW50IGZiYyBzdGF0dXMgb2YgYSBjcnRjIGFuZA0KPiA+IGNoZWNrIGZvciBhbnkgcmVh
c29ucw0KPiA+ICsgKiB3aHkgRkJDIGNhbm5vdCBiZSBlbmFibGVkLiBUaGlzIGhlbHBzIGluIHNr
aXBwaW5nIEZCQyB0ZXN0DQo+ID4gY2FzZXMgd2hlcmUgRkJDIGNhbm5vdA0KPiA+ICsgKiBiZSBl
bmFibGVkLiBUaGVzZSBubyBmYmMgcmVhc29ucyBhcmUgZGVmaW5lZCBieSB0aGUgZHJpdmVyLg0K
PiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zOg0KPiA+ICsgKiBUcnVlIGlmIHRoZXJlIGlzIGEgcmVh
c29uIHRoYXQgRkJDIGNhbm5vdCBiZSBlbmFibGVkIG90aGVyd2lzZQ0KPiA+IGZhbHNlLg0KPiA+
ICsgKi8NCj4gPiArYm9vbCBpbnRlbF9mYmNfZm91bmRfc2tpcF9yZWFzb24oaW50IGRldmljZSwg
aW50IGNydGNfaW5kZXgpDQo+ID4gK3sNCj4gPiArCWNvbnN0IGNoYXIgKmNvbnN0IG5vX2ZiY19y
ZWFzb25zW10gPSB7DQo+ID4gKwkJIkZCQyBkaXNhYmxlZDogbm90IGVub3VnaCBzdG9sZW4gbWVt
b3J5IiwNCj4gPiArCQkiRkJDIGRpc2FibGVkOiBzdHJpZGUgbm90IHN1cHBvcnRlZCIsDQo+ID4g
KwkJIkZCQyBkaXNhYmxlZDogcGxhbmUgc2l6ZSB0b28gYmlnIiwNCj4gPiArCQkiRkJDIGRpc2Fi
bGVkOiBzdXJmYWNlIHNpemUgdG9vIGJpZyIsDQo+ID4gKwkJIkZCQyBkaXNhYmxlZDogUFNSMSBl
bmFibGVkIChXYV8xNDAxNjI5MTcxMykiDQo+ID4gKwl9Ow0KPiA+ICsJYm9vbCBmb3VuZF9yZWFz
b24gPSBmYWxzZTsNCj4gPiArCWNoYXIgZmJjX3N0YXR1c1tGQkNfU1RBVFVTX0JVRl9MRU5dOw0K
PiA+ICsJaW50IGk7DQo+ID4gKw0KPiA+ICsJaW50ZWxfZmJjX2dldF9mYmNfc3RhdHVzX2NydGNf
aW5kZXgoZGV2aWNlLCBjcnRjX2luZGV4LA0KPiA+IGZiY19zdGF0dXMsDQo+ID4gKwkJCQkJwqDC
oMKgIHNpemVvZihmYmNfc3RhdHVzKSk7DQo+ID4gKw0KPiA+ICsJaWYgKHN0cnN0cihmYmNfc3Rh
dHVzLCAiRkJDIEVuYWJsZWRcbiIpKQ0KPiANCj4gVGhpcyBzaG91bGQgYmUgIkZCQyBlbmFibGVk
IiBhcyBkZWJ1Z2ZzIHJlcG9ydHMgaXQgYXMgImVuYWJsZWQiLg0KPiANCj4gDQpUaGFua3MgZm9y
IHBvaW50aW5nIHRoaXMgYW5kIG90aGVyIHN1Y2ggaXNzdWVzIGluIG90aGVyIHBhdGNoZXMuDQpX
aWxsIGZpeCB0aGF0LiANCg0KQlINClZpbm9kDQo=

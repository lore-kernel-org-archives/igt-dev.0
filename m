Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1CFC48BEF
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CD610E259;
	Thu, 15 Feb 2024 07:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4PlJCp7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E01E10E20C;
 Thu, 15 Feb 2024 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707980634; x=1739516634;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZEOKsznROypYJ/ekJbIwGV5Fi2HXX/ZJ/dCj94SDaTg=;
 b=g4PlJCp7gia1w4tWN4i0dF8z6LVqLaM/owYzxURc3+yiz7FN1L7yK1Fc
 Y2aX/ad9CfRC3waOuZgE9TCl1U5ruKOQAzg+3dkAcDrh8lAIza3U+dfA1
 pjdLM4iNZEnZdfSKxxB8eybeov4rYAg0uY9t7EzVzqoFwEm7RrQl9XU/9
 tcQRFn3Q4jmliwGVpvrRkyKFdo/izD7jGcNuxgb5mEgJIvX1Om51Y/yCT
 od1Be3HIp+oChFwU/2LgfyQJ8S8AZjlYfCPtDwXWzX/YWKR5ycMxVjiBh
 vT4O34Ey5oYwpvXPnVBPZPYpSCy/C5fk1VJERo3NBvmieQgoIujOjSg6u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="27502086"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="27502086"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 23:03:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="912110544"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="912110544"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 23:03:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 23:03:51 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 23:03:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 23:03:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 23:03:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dt8UyNLpVEUKVMl+Xu/gDBT4kjNUEnlTnV2y4/rdEeDNRddpz6xr6veUXfSGVQm8B1ZN/Uttg6OQiEshbwV6zrbNw7OnRzlcP1XA8BuWYHCMJjTNSQz5bdAy0zHpyDLmH0ykmsgDl2UYFhaKi7N30d1A6AXTNap+zGhjGN7H5CBAUp7aDKwaFhn8mUlI35dOSprp8JFAF3kBC69y7idNmNYedRYGdsTuIu8PVF9YCSCYvHl9DJNE3eo20JdqZFUtvvBuQ4h2nb+h8AlcRnATkrUksSsgv+bEzQBO4wdh/NsFTNSg4esCy1CZduEmoQJUHvFDoifhgwqqRFBfdoptGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEOKsznROypYJ/ekJbIwGV5Fi2HXX/ZJ/dCj94SDaTg=;
 b=goHpa27zMF06RjTVjeY7l9YxNjtF/VrISSsz2Yg4MZYYxIuerOzeF3h1n5fE+Roxf2eoPTdjqDtPx/1Hd9Q+qA0IuNxT92011NaYJgS2NNTzRAq7fC3xk+L2GLEvT/KbT0QEgrpimAlphxYl5WCzr87SAyyjiaCrt6tC3kASY2IuoAhjWfTAwioCJy9e4Som1cj1CQAPB0ca/UOg0KxRL2BykSho0qSuaTppAuMHsMAVyZMe+WO5KSPhlF2D9givmfc8HpmM39ibVzc+3SgrtzHKlCriJpCPFMwjEfgo31e1YktsfefyS++ztxPmi56rQMfyWmfmNxjNPgL2vrJtDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by CYXPR11MB8661.namprd11.prod.outlook.com (2603:10b6:930:e4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40; Thu, 15 Feb
 2024 07:03:43 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae%4]) with mapi id 15.20.7292.027; Thu, 15 Feb 2024
 07:03:43 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Arthur Grillo <arthurgrillo@riseup.net>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIGJlbmNobWFya3M6IEFk?=
 =?utf-8?Q?d_VKMS_benchmark_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYmVuY2htYXJrczogQWRkIFZL?=
 =?utf-8?Q?MS_benchmark_(rev3)?=
Thread-Index: AQHaW+f8PpH/Ciyp60qiJOQAWj95NrEIl3uAgAJqwfA=
Date: Thu, 15 Feb 2024 07:03:42 +0000
Message-ID: <PH8PR11MB67537E8900355772D0C749DBF24D2@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240209-bench-v3-1-24a01f366d3b@riseup.net>
 <170754544126.1129906.8222139670718035516@5338d5abeb45>
 <20240213180829.g64qntiwfsocgr36@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240213180829.g64qntiwfsocgr36@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|CYXPR11MB8661:EE_
x-ms-office365-filtering-correlation-id: bf4600cf-a65b-43f7-4e27-08dc2df43ed9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7gdzZZ8Eef90fmMf4QiWcBE5ozoBiAMKVCMVsafKvXb6tsLrQYLJ7rg8yZuxKIYnXCvdJyjPkpWsoLGORki4UunxQp9cJA1i5ctqGf0UNr0xW5gPUWnDPZpkf7lJ2Sv4Q/V5UVJgfvp45S/aoYY2jgzmRSnpNkwTMmpH4kqbNqKw4xf33riKtmJdQlvydhKJCZt7gaSn8ptzQ3d107B1m6WCtBbfX04cuxEnpp6sOd7Rl30slpSeAYyoob2HJVlibnsZgc2dPl354169rgdkrOxpDJf3tdDpyC+/tIkObEg7+vPsjUNMa3NYGGo5J5DA7wLSXUzMCrvwlCtrKCz7aSCNKztMbLRu8xWpCet2jYADehYtxbnThiqT7AZxVP3jA4SyQ50qqjD919KcfUqAau1utkkEinnIIgZSv2SFNcf4J01EZ9ISXj+1rgNhSCdkqD3AFhanEQ4pozHCv+wilts8fVOR4p4lrapuzNMLg/wZM+yiJftuZQyq1WYu1x2qv5ouxUGlS+2izZen6H10pkzsVSDaICIgzNWjYDo0Q0XRQqhGyCTDJBc3naAtyItvzsOqEFG1xgKa9JaEaNsuOcjetiMulba+n/LrDRQU9MvMo+1bcz4vJj8kR3fo03d8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(230922051799003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(55016003)(2906002)(64756008)(83380400001)(66946007)(41300700001)(966005)(7696005)(66446008)(71200400001)(8936002)(66476007)(4326008)(26005)(53546011)(66556008)(76116006)(5660300002)(33656002)(9686003)(52536014)(38070700009)(86362001)(478600001)(122000001)(6506007)(110136005)(54906003)(316002)(38100700002)(82960400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1c5WElhRDNwaTIvb0ZYZm45SlpaeEJlUzRJcWpFVUx1VzJjTFp5NUNOR1ZO?=
 =?utf-8?B?Mi9jMmNGL3lYTHh4b0RGSkRoZzZRWmRNSDVJWlAxTHZPT3lXV01tT1RqbUky?=
 =?utf-8?B?a2EyODFXOHEyVUswaGkvM0tDOUZnanVER3BsQXU3ZUF1YjN5ZWJGM1llMXpL?=
 =?utf-8?B?NHJmK2JaZGQyMHpYRSs2UFQ2a1J6TG1sUGdNZGd3SXV3UUhFckFvSS9YQ0NH?=
 =?utf-8?B?Wk5TY2ttYXl6d0RVNENQdXlSd2xPWUg1aUNxcnJ2UCtnamVsTTkwSjVQTGdw?=
 =?utf-8?B?Y2oxSzNxUGVCN0ZhN21ObnhCSkMwc2hNUGxlV1BXRENsemhLa09DOXBBeWNo?=
 =?utf-8?B?Ui9DS1dPei8zdWlRLzlYVERwWWR6RFBoV3F0ZmZSYUQvc2U0RHJ0WTdNQi9Y?=
 =?utf-8?B?N1JXY3gxYTBXZjVrTU5Cd3hFY3pReGt0UDZ4dEdBZG1Ya3EzSSsrQmhzbGpm?=
 =?utf-8?B?ak1uQllUYy9WRTZWVGRNcG1yZVRmZVZFL0hkRE42b3ZkRmNiRWRJdkIxSzRa?=
 =?utf-8?B?MUh0a2hBYXo5N0pwZ0VObitNZXdtOHhtTjFkSndYdWwrWlM0VDFzUEE3bTRq?=
 =?utf-8?B?UkFiQmVkWk9qcHpmMlQ3VzUvQ2VnRjB6OWRHcUo1SzVwVlNvbXJsZ1BsSXpt?=
 =?utf-8?B?bTJ1aFY1dE4xc05ublI2dFlyY21NUGFJSnhoS3dNSUc1UE9aV0FxSHZQdFVY?=
 =?utf-8?B?M2JvWGJ0clBJcy9FRHlrdFdQU3ZoaU93bmVYcHpGeWZSMjBWR0gzRkZ4NVpS?=
 =?utf-8?B?RVlmTC8xRUE0U0pYYjZCYmhtUUY0b1dXV01HQ2JUVFhWZFFET3Nsc1JrdFZy?=
 =?utf-8?B?SnJWcFJXZTRiNlp6bHYwOWI4UjA2Z2MvZnlzL1JhTVIvaGtZNjBRSTBWRUtp?=
 =?utf-8?B?b0hoM2VUSHovdThXUENrMkY0cXF6MkhVQmlNT2dqRGlTN3hZd2tNWjBnRjFP?=
 =?utf-8?B?eXZkOEEydWhYc3lsZHJvSUpaU1FRZDlJMTArMWtwUFltZGFGUExnd3U2ZklB?=
 =?utf-8?B?WkQ1RUJSMXVUSE5ZR2xNMGovNEdtQjNlNU1QWkdpb1puanVoOUFCdGlvS0JB?=
 =?utf-8?B?a2RuUUhoWFFSeVl4elIyeHJRSzZkTTdUVDlZdCt1UHR0emwwWEVFTGxiQzM0?=
 =?utf-8?B?UlNYMlI4TWcreUZad0FlMGcvOFJqNjV5aUFwVUdRcXFQQjd6d1VJQnZESzNN?=
 =?utf-8?B?cnJRL3k4clliOHNncE0vbXhmWTZJcHMrZzdsOFhtYWM0c0NtQjUvL2lqbnZx?=
 =?utf-8?B?ZGRDTHBndmI3TXJlUERQSTNSOFovNk56WTlGeTErb09yY2Rpak9BVEhLT2d2?=
 =?utf-8?B?K3hzdjdXcy9jbmRmRjNSZnV2T2o2bmNaQjM3Ni9wQ1NwK0svbDJjT3puV0Zo?=
 =?utf-8?B?UHZTb0pkSUxyRG8zRDN2SGN1NzBQTWplOWpBaGJNMlUydTE5VHgwcWV6ZkF0?=
 =?utf-8?B?TlVZV2hPV2FCdEc5RDErWm5DRXhqNXpOTjZJMlRvVjF3WG9lU0VsUXBSdlBR?=
 =?utf-8?B?Si9GTjZja0dwbnk2ekMrOWhLSUIwOEw4VzRMc2Z4ZTVFUTdFTVdsclBXWDBj?=
 =?utf-8?B?cHZhQkxBZkp6bFJZaEw4MWxrVmZkMm15M2hYeWFyenFJNTdjelM1M1RLSDNv?=
 =?utf-8?B?d1pLc1JtNGxqbnhEWTlWakFneGFsM0NuOGZmZGc2QnpobVFhQTFGVjc0RjRN?=
 =?utf-8?B?MUQwb2JZMlh6STBHU21pQlp0QzZUZ0ZNOUhwdE0vS2hKL2FaUFE4bWgzU3Zu?=
 =?utf-8?B?L2IvVklQVk80dEFQV05oWElsRWd0aUYralh3WnlBa0NuNFZvTWtyWGE2dGNO?=
 =?utf-8?B?cmhwTGtqK0lBRy8wMVI5Y2dGUmRYemJWT05tUXk1RXJDdFBKZkF4Ui9rcHBS?=
 =?utf-8?B?M1RjNTZKOHl3cG9STHpiRU9nZUdsaytkWmhTVnhNVWduSnZXQWxUTGlQbjZT?=
 =?utf-8?B?bytMaVM0cFg1UzNiUllUSW16L3NDd1VrNk96Wk16TjhRa3p6MnZZZHhpRXJE?=
 =?utf-8?B?N254aWhiY0F3Qmthbzg5OVhGM3Z5dVB6OHdSSjE1S3hsQWVYQ0dkUDFEWnhO?=
 =?utf-8?B?NVVidkt5aldRY2RKL1FQRmVPZ0dYcjZHeEdXWnJKMTBZdFVuS3c5NVhIYlZa?=
 =?utf-8?B?Y1ByRzYrYXl1SVFXdlcvczdYYThSdUxTYWJIbnJwV2lIazBSdVU4TWxLVnhv?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4600cf-a65b-43f7-4e27-08dc2df43ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 07:03:42.8937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nhg0D4gjogp3dh+0M4AnvmJYkDpf/m8/kZ0AcydEgpU0xc2cNU0/79YbfXijMwEhcGU0BNRoj9tWQh3jzUpevNAMJxfPE+mgTxr+Et1Bfnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8661
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI5NjQ0LyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50
ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDEzLCAyMDI0IDExOjM4IFBNDQpUbzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBBcnRodXIgR3JpbGxvIDxhcnRodXJn
cmlsbG9AcmlzZXVwLm5ldD47IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBM
R0NJIEJ1ZyBGaWxpbmcgPGxnY2kuYnVnLmZpbGluZ0BpbnRlbC5jb20+OyBJbGxpcGlsbGksIFRl
amFzcmVlWCA8dGVqYXNyZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTog4pyX
IEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYmVuY2htYXJrczogQWRkIFZLTVMgYmVuY2htYXJrIChy
ZXYzKQ0KDQpIaSBpZ3QtZGV2LA0KT24gMjAyNC0wMi0xMCBhdCAwNjoxMDo0MSAtMDAwMCwgUGF0
Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBiZW5j
aG1hcmtzOiBBZGQgVktNUyBiZW5jaG1hcmsgKHJldjMpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjk2NDQvDQo+IFN0YXRlIDogZmFpbHVyZQ0K
PiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBJR1Rf
NzcwOV9mdWxsIC0+IElHVFBXXzEwNjYwX2Z1bGwgDQo+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0K
PiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21p
bmcgd2l0aCBJR1RQV18xMDY2MF9mdWxsIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlm
aWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdl
cyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4g
SUdUUFdfMTA2NjBfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWlu
ZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50
IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVz
IGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEwNjYwL2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lw
YXRpbmcgaG9zdHMgKDggLT4gOCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
IA0KPiAgIE5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0cw0KPiANCj4gUG9zc2libGUg
bmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1
bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTA2
NjBfZnVsbDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUg
cmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfZmxpcEBhYnNvbHV0ZS13Zl92Ymxh
bmstaW50ZXJydXB0aWJsZUBiLWhkbWktYTI6DQo+ICAgICAtIHNoYXJkLXJrbDogICAgICAgICAg
Tk9UUlVOIC0+IFtJTkNPTVBMRVRFXVsxXQ0KPiAgICBbMV06IA0KPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEwNjYwL3NoYXJkLXJrbC0zL2lndEBrDQo+
IG1zX2ZsaXBAYWJzb2x1dGUtd2ZfdmJsYW5rLWludGVycnVwdGlibGVAYi1oZG1pLWEyLmh0bWwN
Cj4gDQo+ICAgDQo+IE5ldyB0ZXN0cw0KPiAtLS0tLS0tLS0NCj4gDQo+ICAgTmV3IHRlc3RzIGhh
dmUgYmVlbiBpbnRyb2R1Y2VkIGJldHdlZW4gSUdUXzc3MDlfZnVsbCBhbmQgSUdUUFdfMTA2NjBf
ZnVsbDoNCj4gDQo+ICMjIyBOZXcgSUdUIHRlc3RzICg3KSAjIyMNCj4gDQo+ICAgKiBpZ3RAa21z
X3BsYW5lX3NjYWxpbmdAaW52YWxpZC1udW0tc2NhbGVyc0BwaXBlLWQtaGRtaS1hLTEtaW52YWxp
ZC1udW0tc2NhbGVyczoNCj4gICAgIC0gU3RhdHVzZXMgOiAxIHBhc3MocykNCj4gICAgIC0gRXhl
YyB0aW1lOiBbMC4wM10gcw0KPiANCj4gICAqIGlndEBrbXNfc2V0bW9kZUBiYXNpY0BwaXBlLWEt
aGRtaS1hLTEtcGlwZS1iLWhkbWktYS0yOg0KPiAgICAgLSBTdGF0dXNlcyA6IDEgcGFzcyhzKQ0K
PiAgICAgLSBFeGVjIHRpbWU6IFsyLjI2XSBzDQo+IA0KPiAgICogaWd0QGttc19zZXRtb2RlQGJh
c2ljQHBpcGUtYi1oZG1pLWEtMS1waXBlLWEtaGRtaS1hLTI6DQo+ICAgICAtIFN0YXR1c2VzIDog
MSBwYXNzKHMpDQo+ICAgICAtIEV4ZWMgdGltZTogWzIuMjddIHMNCj4gDQo+ICAgKiBpZ3RAa21z
X3NldG1vZGVAaW52YWxpZC1jbG9uZS1zaW5nbGUtY3J0Yy1zdGVhbGluZ0BwaXBlLWEtaGRtaS1h
LTEtaGRtaS1hLTI6DQo+ICAgICAtIFN0YXR1c2VzIDogMSBwYXNzKHMpDQo+ICAgICAtIEV4ZWMg
dGltZTogWzAuMzNdIHMNCj4gDQo+ICAgKiBpZ3RAa21zX3NldG1vZGVAaW52YWxpZC1jbG9uZS1z
aW5nbGUtY3J0Yy1zdGVhbGluZ0BwaXBlLWItaGRtaS1hLTEtaGRtaS1hLTI6DQo+ICAgICAtIFN0
YXR1c2VzIDogMSBwYXNzKHMpDQo+ICAgICAtIEV4ZWMgdGltZTogWzAuMzJdIHMNCj4gDQo+ICAg
KiBpZ3RAa21zX3NldG1vZGVAaW52YWxpZC1jbG9uZS1zaW5nbGUtY3J0Y0BwaXBlLWEtaGRtaS1h
LTEtaGRtaS1hLTI6DQo+ICAgICAtIFN0YXR1c2VzIDogMSBwYXNzKHMpDQo+ICAgICAtIEV4ZWMg
dGltZTogWzAuMDRdIHMNCj4gDQo+ICAgKiBpZ3RAa21zX3NldG1vZGVAaW52YWxpZC1jbG9uZS1z
aW5nbGUtY3J0Y0BwaXBlLWItaGRtaS1hLTEtaGRtaS1hLTI6DQo+ICAgICAtIFN0YXR1c2VzIDog
MSBwYXNzKHMpDQo+ICAgICAtIEV4ZWMgdGltZTogWzAuMDRdIHMNCj4gDQo+ICAgDQoNClRoZXNl
IGFyZSB1bnJlbGF0ZWQgdG8gbmV3IGJlbmNobWFyayBhZGVkZCwgbm8gbmVlZCBmb3IgcmVzcGlu
Lg0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPiANCj4gS25vd24gaXNzdWVzDQo+IC0tLS0tLS0tLS0t
LQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiBJR1RQV18xMDY2MF9mdWxs
IHRoYXQgY29tZSBmcm9tIGtub3duIGlzc3VlczoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMN
Cj4gDQo+ICMjIyMgSXNzdWVzIGhpdCAjIyMjDQo+IA0KPiAgICogaWd0QGFwaV9pbnRlbF9iYkBv
YmplY3QtcmVsb2Mta2VlcC1jYWNoZToNCj4gICAgIC0gc2hhcmQtZGcyOiAgICAgICAgICBOT1RS
VU4gLT4gW1NLSVBdWzJdIChbaTkxNSM4NDExXSkNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDY2MC9zaGFyZC1kZzItNi9pZ3RA
YQ0KPiBwaV9pbnRlbF9iYkBvYmplY3QtcmVsb2Mta2VlcC1jYWNoZS5odG1sDQo+IA0KPiANCg0K
Li4uY3V0Li4uDQoNCj4gDQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0KPiANCj4g
ICAqIENJOiBDSS0yMDE5MDUyOSAtPiBOb25lDQo+ICAgKiBJR1Q6IElHVF83NzA5IC0+IElHVFBX
XzEwNjYwDQo+IA0KPiAgIENJLTIwMTkwNTI5OiAyMDE5MDUyOQ0KPiAgIENJX0RSTV8xNDI0ODog
YzdkMjM0ZGQyZDMyOWYyMjNmNTY2OTk2MzYyNDhhNjA5ZGJlMjI2NyBAIGdpdDovL2Fub25naXQu
ZnJlZWRlc2t0b3Aub3JnL2dmeC1jaS9saW51eA0KPiAgIElHVFBXXzEwNjYwOiAxMDY2MA0KPiAg
IElHVF83NzA5OiAxN2E0MWRjZjFlZDU1MWU3YTVmMmNhODhjYWQwNTViM2Y2ZDY3ZTdlIEAgDQo+
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4g
DQo+ID09IExvZ3MgPT0NCj4gDQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDY2MC9pbmRleC5odG1sDQo=

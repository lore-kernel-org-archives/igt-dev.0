Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A38CC6B00
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 04:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FDD10EF44;
	Thu,  2 Apr 2026 04:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpO1rW0Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418C410EF44
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 04:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775105719; x=1806641719;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NG4eVNfZzk10G5TqvU+unj6rJcKwzKQf98LzpaNO10k=;
 b=GpO1rW0QYrOSaCbHtZFNhKkbFLgtmHS2TthKEPnXTGf6jeFwg4uLbw50
 QUvdJBF9KIc7uaBoxFgG6ZBfJGGovR/CcsvdafYyG6t+/xTHZWnbo9+SB
 49Osf4d/DYzI9cf8oQuhlZi5FEt4K0VsKVVBbe3s/ZlKZrLVslPVOqrIN
 iOKN3XKLxhPFVtud6xZrv42wYbXYzFCmHqk5bmDsHYOZtpW9cBcOgZHfL
 GbszAFl7wFNwfq7WRu1VJnsPOR3YpF5PogWJDja/M5QeV63dzCxizL0Hb
 IPTPcJ9AHAI71eg10fnCybUwRaKVlQ1FwmSO3X9xQU0yi2CizxYBuzlQz w==;
X-CSE-ConnectionGUID: 3AYbltgZTFWPglKFj4VA5Q==
X-CSE-MsgGUID: 1IPhF5buQGuEAr9kdytiaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80044534"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="80044534"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:55:19 -0700
X-CSE-ConnectionGUID: yxGOQkccSE+lBbss+9Mm/g==
X-CSE-MsgGUID: DMY48fR2REKGkHUaGAWm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="225866929"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:55:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 21:55:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 21:55:18 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 21:55:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKr3a4xVoiamey9KkMgTD+1OYjHxf13KDnsmGXag//Lg7EZ+1iqGR/GMbnqIetYxJPH48SivdgahBaqf6l+Ip9Affw0CLtA4NVMgw8M63GCaLo1M10tcyBi2W3cWdJirQMLFjM/fWZeS+Pjo6SRe5nsR9Q9+QlKfvo+RYDz9dAFoUMNtfpkZJsuhY9H8VlsLzPWLegs7HLY/R/KEi9FEoiDVlKHyuG9PC/OFHtWiQv3RJgzwuIqWebkxpzq2r5MuQ40xsKnMNJ/Vy6XoYi4qVj4wTQEFSjLnd3VEXylDhiRkC256TIbMyrtjolVbQCnnXrm1Vwh47YyIN71HTs53sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NG4eVNfZzk10G5TqvU+unj6rJcKwzKQf98LzpaNO10k=;
 b=lu7scMB0mLQ3CEt9o7ecm8vgsksiTfHp718HJS5GmNwm1yZwD5OeLUAYl/CIEQEBj5lzwK2B096T3vYwpNXxpYS+fEgzOKzDpDL2lfLIUtHIewI+SfzxX5ASYVmszUxoNmRkipOedwr36nQk8iu8g+pn0fbmoja9cYevyarHmMIBI17hTgtAGlqt7cstuQDPxSvnBdQQ2WA1cnEhABWEcOKVmlXxip7GLLkAcoJes2EZkNKsHeH9Yt8prUZ4Dl0H2fmI/yXiRGPcntRDwI8tLDR9LeAmfhKC0rLDrcV2opPjEt4vwLBGIizeSlVh+C5nAViLW2ltNF8VqhGPLjJAJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 by DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 04:55:09 +0000
Received: from SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0]) by SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0%3]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 04:55:09 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 3/3] tests/xe_compute: Exercise larger buffers
 passed from the user
Thread-Topic: [PATCH i-g-t 3/3] tests/xe_compute: Exercise larger buffers
 passed from the user
Thread-Index: AQHcwbdrkphkiTvbUE+mHGYwnFQWyLXLNjCw
Date: Thu, 2 Apr 2026 04:55:08 +0000
Message-ID: <SA1PR11MB84286D0D2D1B3F595C12433B8D51A@SA1PR11MB8428.namprd11.prod.outlook.com>
References: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
 <20260401091017.2772519-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260401091017.2772519-8-zbigniew.kempczynski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8428:EE_|DS7PR11MB6173:EE_
x-ms-office365-filtering-correlation-id: 1c3b69ae-d24a-44a9-86be-08de907403d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 76CgN1ftlhoImHIhTGDSkBAkPGv5GzPPyp3yZwRsPg/6/s7kLFLIGCnhU+XbwAgxpnfVqHKpqkSDwAbR2zNWP4TVK0DjCS6YdAxSrdWy8USGnk3NmDRwUoKLzYwNuYfHRKhUxC4tulb0unMQLzxwzuHRmAniTwMSTLDyheNS2iHiRbbFcrl9Gm7OCkxV6ps/BwJ3L7WkwkjwJRfrtKFeiNTjKKdENPQxJ9Tcftt/ZpFBPKIdba0F3mtyor7KPAgPLznSPkW7M4KSydbtubepsrEzJ5U4MA0rCJlQF4Z/CJvh5Ri9vKo6bbc7/pzUYgFOXZGHRH4WLgDJ7PWBB1gOwWo8w3qiJKsgktWV3axAnLHvU3Zg9m/blzQEUvHr2cWCDYqBOqct5RlXl1eiG0kmX60NAx1KDDTiYxwyWJ36oOz0nrf4lmMhlLOwdGqtgNUJJMvx6fLQRGXNH4CbrCzWOwTJ111z1CK3V91RIwphGf38yJLW/K7QF6OAWqJ0oHuupWnMZx5F2bKUK/t20I0Xfd3pLOnWTN8v9MS8MPf248h02j7ShoGNMwdfhPZv+E2+7wW9tEzMor5Z0W6F0Tb3XTMzCiSP4QyPViuF31J5z5kt/QdG9unOFYIlPsiyog3Oj4RAPugF+WgPtHYW5GzkyWLD7zw58APTDYR1IQQpGy23cb6eAMe4QgVZxjUfxz5voBT2hrUcnsZZXXErVaGXH1Ryqr9CHYmtHpR+waXGmCunQ/ro45cG7tmHic1hfLP8tVP9iAo2OowtoHPEj0rmqwnvPcnq7/rav5/Vrjyxwg0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8428.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUh1NlFFb3hjN1Y3cTlxOXp6V1dEc0hTWG5OQmhHbk05TmlPVzlveGVTYUE5?=
 =?utf-8?B?R216M0NlZUQxbC80Q0dYRW1OVEY3aHl0RFVsSW8xbmowYUlLOXhlY3U5bXBO?=
 =?utf-8?B?M01wTTNEZzFmWnQxQ01rMk11Qy9VY3FsdnVRTzVDYmpRSmZZZWJNYjRVcXA5?=
 =?utf-8?B?eGZ4OXJiTTdtYk9HdnRZQVVjWGo0NkF4Q3lWd2RLb3ZBUDNsQzBjM3dBaHZv?=
 =?utf-8?B?Nml4RU9yT2JTR0d1YnhGamxieDJ4cGw4aWNOWDJQSTJBT28rYllQT3IzWWR5?=
 =?utf-8?B?TloyZVpWOUtkdUYwUVB1b3B1NEZCNFNQWkRyYnZKZ0ZNMEQyYXBDSnp3ZzNL?=
 =?utf-8?B?VndWZ0NyYS81bUE5Uzk4Y01xblphV2V4NnR5TTdvYVZkb3RMVEUvaTRDVTJv?=
 =?utf-8?B?VFNKM2I5SlJqN0dMNHllZVRuQVRaV0luQ21pT3h0czIwNnU0N3RHcEtxWHVo?=
 =?utf-8?B?VjNMN0lMN0RMRFJkZVgrNXpzMFZCKzh4c2dMYUVlQ0VsbmVqZGMzN1lLekh2?=
 =?utf-8?B?a3kxY01vOERGUDlJUnUwS3lTeWc0TVRQTGFJWndzbWF2bmYxamxDakM4ME1F?=
 =?utf-8?B?WlZWblNidFZ0cFp3VUpiOWpyaERRVTJtc1hFbE5nYVhpSGROK3JZNXFzUGIx?=
 =?utf-8?B?RHg4TitUSmJJUEhVQ3dBdjZ4NnNDeU9UUGdmYzF5SnV0Ym9Xc0NucDM0THJH?=
 =?utf-8?B?MWFvOHZJYmNNcnVmYm5qTDg0eHVaeXJtMGY2Z1RITVVPbmVTK1VZZm5RMHhE?=
 =?utf-8?B?TUZGZzRNbWgxZHFtcXU4SWNVTnhDMHRJQVdRN1BuYVQ4RWtzdjJTV1YwVlNr?=
 =?utf-8?B?WnVNSllhWk9GS2tVQlZFZTBqWlVsWncrTjVxZmpxQWxSVGszZmJTRUlOMTlV?=
 =?utf-8?B?NzFLZnpiRGNKc0xWcVZxdWlHaCtJZ1JzSDJaeW4rLzNHZDRiZVhoY2krNEpW?=
 =?utf-8?B?ck9YZG1IRjZFTWdiT2hra3Rhc1NvWjVxT0phL3U1V1VSZUpZdXo4M0wyQk05?=
 =?utf-8?B?bXR4dUF6TVc1UVMvQkxYMFEvZzNkVThkc1FPTlZjRWlySWdZUUxtK2p1ZlFH?=
 =?utf-8?B?a3J1a3Z1Yy9aSVN5QnpEaDU3cnpQVG10Uk1na1NHMUFPSVBNRFNjWUlYZzZw?=
 =?utf-8?B?RVZ6TmE0YVZXUkNJWFN2TitCY3BSYzc5L3hZM0NvbUYrNHFaWVQxdFRscHQy?=
 =?utf-8?B?QnBUTGlnMGd2MGdwZU1YYzFyd0dpdW1oQW1tSWdrQWlpbVd0T1dEbGFYSkp6?=
 =?utf-8?B?akZnS0FsaDZwQkFqd0dNWW41dXhCZjRrRHJxWkRQTDduRUFvbXJOWXVqazBP?=
 =?utf-8?B?WVcyQnN1bUE4M0tFRU5Ob2Q4aVUvcTV1Y3VvTXJ6MDJFVC91ZC9oTG5SakI1?=
 =?utf-8?B?SzdCY0UyemF5NzVqSlZnTHQ4a2taOXg1dXVSUy94Qzc5cTJKbVRZUEoyME1M?=
 =?utf-8?B?c3hTSXNiNHV6ZERCY205RmcrMGtqZWNaakRlSGhRTmJhWlpzckZKWWJsTldM?=
 =?utf-8?B?Nk9tdEwxNGFaRVNvK1pLRmMwSWtmcHpPbk5YVStpaUhJM1BBVG9NckFIOWcz?=
 =?utf-8?B?VWtiUEFvck83bFdKR0RsQzBsVXVJYnJFa2s5QmxuMDJJVzdjSSs2bkF0YkFh?=
 =?utf-8?B?d09oSEduTlpNY2c1WXV6OHFiQnQ0dHM2ZXhRNzBmaVR4VHNNR3pBMEsrdXRH?=
 =?utf-8?B?MUErSVRzOElXUmt0NEd5dTVEUlh3T2hsa2lSUmFvL2pnbHMyVGtTQTExdkRG?=
 =?utf-8?B?ZUJTcmhBazNvUHlqSkhRbDFPWjQzUlA1VDlDdERoblpzN2ZMaHZTSDJZVWlq?=
 =?utf-8?B?dGkxZHE1RGZzZ3NuWXJodDdDZU9JejFYQ2VNRlhOendKS1VhMHNTbnhLYUZT?=
 =?utf-8?B?VnZUaDgrT2VHVHEvbVEvdGsxTzFhTVcwOHJwN3RDSExmbjZPL2UxMXZjQ2lF?=
 =?utf-8?B?YWdldy9iREpCdG11UndtVFNWUnc2b09pTmNZUGdWRFZnbnkzek9ic1Y3VWxv?=
 =?utf-8?B?VFgvakRRUWdjRjVWNDRYWWdiMUpiV3pST3pEZVJOOFNnRy80SDRWb3lVSnVa?=
 =?utf-8?B?MVphbmd1Qzg2K0Zaa1JnWDNGMzZabVhDRlZlbm5rd3h6VUh5QWduY2liTVhO?=
 =?utf-8?B?REJoV1NXQjMxc3dmTU05VnFLdGlxYmFpVnZYSHptWGtFZkI0Ry9pN2p6UXlQ?=
 =?utf-8?B?TGZDYzgzTmNCek91NEFTOWlrOEpabjYwVnkxVGYwdDMwSzJXRUkvV0ZmdVBl?=
 =?utf-8?B?UTZmQkpza1c1ckthcElQTHZORFBTd2ozdWxXOVZTaXJuY1hGSlEzU3NPS0x1?=
 =?utf-8?B?V0Y3cVVJb3pxdXNvdEVqUUFRYW9mS1hFWnZsMXRNaU0xdHA5aVkvRkxtY0VU?=
 =?utf-8?Q?aJAQUwStY7tzMiYz5PjmdCE9VMdWnNSX2KtuA64ZPjLrK?=
x-ms-exchange-antispam-messagedata-1: P88xRjGQbKYl6KJL2pdDIBgSZLg5SvoeiaU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: os0GdaH9lEprkRKAMQq3fqrrx1/my9Yv8gXhdzhu6H+niq0Put+dzOuVfN3CJydkftjX2kx2N/qeqNElXHfrm0f5g4NzpxgrcdDsOnmvTR4M3MsafssIbI9OSm4j2KnUwi9U9Nacr1HZkL53WTn5lVcf+T9F5if4q6tJXrwBfW4ILYFOENinTIGTCbtlLf7UwLakjzK+0oxSMV2Y6ZdKwnM27OXI93yetfihMxyL9e/DyMSQ1i2J1ACtlwf8pFN/RIENTMsI0A2scqMRZUWXOkhQhTWorJGDEXRszM5/eBephFfUF7Kr8O/6vymUF0Uf8dJrvxLgfTD8OSeV+S9fxw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3b69ae-d24a-44a9-86be-08de907403d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 04:55:08.7826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uiBQVFGGwRdqLDcrTHSPZGiJEh1CHAj6GNS7d03jSysJXZiAVIuDR4aqdY11t+xz0rTG0LLpWvIiMUV8JfRb4GKoY8lQMWcXtnHQBpoPK8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2VtcGN6eW5za2ksIFpi
aWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IDAxIEFwcmls
IDIwMjYgMDI6NDAgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47
IERhbmRhbXVkaSwNCj4gUHJpeWFua2EgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAzLzNdIHRlc3RzL3hlX2NvbXB1dGU6IEV4ZXJjaXNlIGxh
cmdlciBidWZmZXJzIHBhc3NlZA0KPiBmcm9tIHRoZSB1c2VyDQo+IA0KPiBWZXJpZnkgbGFyZ2Vy
IGJ1ZmZlcnMgYXJlIHByb3Blcmx5IGhhbmRsZWQgaW4gaW50ZWwgbGlicmFyeSB3aGVuIHRoZXkg
YXJlDQo+IHBhc3NlZCB2aWEgdXNlcmVudi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3
IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBDYzogUHJp
eWFua2EgRGFuZGFtdWRpIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiAtLS0NCj4g
IHRlc3RzL2ludGVsL3hlX2NvbXB1dGUuYyB8IDIwICsrKysrKysrKysrKysrKysrKystDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUuYyBiL3Rlc3RzL2ludGVsL3hlX2NvbXB1
dGUuYyBpbmRleA0KPiBlZjJkODkxNjY3Li40MDZkNzA4YmNkIDEwMDY0NA0KPiAtLS0gYS90ZXN0
cy9pbnRlbC94ZV9jb21wdXRlLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfY29tcHV0ZS5jDQo+
IEBAIC01MTksNiArNTE5LDE0IEBAIHRlc3RfY29tcHV0ZV9zcXVhcmUoaW50IGZkKQ0KPiAgICoJ
UnVuIGFuIG9wZW5DTCBLZXJuZWwgdGhhdCByZXR1cm5zIG91dHB1dFtpXSA9IGlucHV0W2ldICog
aW5wdXRbaV0sDQo+ICAgKgl0YWtpbmcgYnVmZmVycyBmcm9tIHVzZXJlbnYuDQo+ICAgKg0KPiAr
ICogU1VCVEVTVDogY29tcHV0ZS1zcXVhcmUtdXNlcmVudi1sYXJnZS1idWZmZXINCj4gKyAqIE1l
Z2EgZmVhdHVyZTogQ29tcHV0ZQ0KPiArICogU3ViLWNhdGVnb3J5OiBjb21wdXRlIHRlc3RzDQo+
ICsgKiBGdW5jdGlvbmFsaXR5OiBPcGVuQ0wga2VybmVsDQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4g
KyAqCVJ1biBhbiBvcGVuQ0wgS2VybmVsIHRoYXQgcmV0dXJucyBvdXRwdXRbaV0gPSBpbnB1dFtp
XSAqIGlucHV0W2ldLA0KPiArICoJdGFraW5nIGxhcmdlIGJ1ZmZlcnMgZnJvbSB1c2VyZW52Lg0K
PiArICoNCj4gICAqIFNVQlRFU1Q6IGNvbXB1dGUtc3F1YXJlLXVzZXJlbnYtaXN2bQ0KPiAgICog
TWVnYSBmZWF0dXJlOiBDb21wdXRlDQo+ICAgKiBTdWItY2F0ZWdvcnk6IGNvbXB1dGUgdGVzdHMN
Cj4gQEAgLTU0Niw2ICs1NTQsOCBAQCB0ZXN0X2NvbXB1dGVfc3F1YXJlKGludCBmZCkNCj4gDQo+
ICAjZGVmaW5lIElOUFVUX0lOX1NWTQkJKDEgPDwgMCkNCj4gICNkZWZpbmUgT1VUUFVUX0lOX1NW
TQkJKDEgPDwgMSkNCj4gKyNkZWZpbmUgTEFSR0VfQlVGRkVSCQkoMSA8PCAyKQ0KPiArI2RlZmlu
ZSBMQVJHRV9CVUZGRVJfU0laRQkoU1pfMk0gKyBTWl8xTSkNCj4gICNkZWZpbmUgSU5QVVRfQk9f
QUREUgkJMHgzMDAwMDAwMA0KPiAgI2RlZmluZSBPVVRQVVRfQk9fQUREUgkJMHgzMTAwMDAwMA0K
PiAgI2RlZmluZSBVU0VSX0ZFTkNFX1ZBTFVFCTB4ZGVhZGJlZWZkZWFkYmVlZnVsbA0KPiBAQCAt
NTY4LDYgKzU3OCw4IEBAIHRlc3RfY29tcHV0ZV9zcXVhcmVfdXNlcmVudihpbnQgZmQsIHVpbnQz
Ml90IGZsYWdzKQ0KPiAgCWZsb2F0ICppbnB1dCwgKm91dHB1dDsNCj4gIAlpbnQgaTsNCj4gDQo+
ICsJaWYgKGZsYWdzICYgTEFSR0VfQlVGRkVSKQ0KPiArCQlzaXplID0gTEFSR0VfQlVGRkVSX1NJ
WkU7DQo+ICAJc2l6ZSA9IEFMSUdOKHNpemUsIHhlX2dldF9kZWZhdWx0X2FsaWdubWVudChmZCkp
Ow0KPiAgCWVudi5hcnJheV9zaXplID0gc2l6ZSAvIHNpemVvZihmbG9hdCk7DQo+IA0KPiBAQCAt
NjE2LDcgKzYyOCwxMCBAQCB0ZXN0X2NvbXB1dGVfc3F1YXJlX3VzZXJlbnYoaW50IGZkLCB1aW50
MzJfdCBmbGFncykNCj4gIAkJZW52Lm91dHB1dF9hZGRyID0gT1VUUFVUX0JPX0FERFI7DQo+ICAJ
fQ0KPiANCj4gLQllbnYubG9vcF9jb3VudCA9IGVudi5hcnJheV9zaXplIC8gMjsNCj4gKwlpZiAo
ZmxhZ3MgPT0gTEFSR0VfQlVGRkVSKQ0KPiArCQllbnYubG9vcF9jb3VudCA9IGVudi5hcnJheV9z
aXplOw0KPiArCWVsc2UNCj4gKwkJZW52Lmxvb3BfY291bnQgPSBlbnYuYXJyYXlfc2l6ZSAvIDI7
DQo+IA0KPiAgCS8qIFNraXAgY2hlY2sgaW4gdGhlIGxpYnJhcnkgYW5kIHZlcmlmeSB1c2VyIGNv
bnRyb2xzIGRhdGEgbG9jYWxseSAqLw0KPiAgCWVudi5za2lwX3Jlc3VsdHNfY2hlY2sgPSB0cnVl
Ow0KPiBAQCAtNjcwLDYgKzY4NSw5IEBAIGludCBpZ3RfbWFpbigpDQo+ICAJaWd0X3N1YnRlc3Qo
ImNvbXB1dGUtc3F1YXJlLXVzZXJlbnYiKQ0KPiAgCQl0ZXN0X2NvbXB1dGVfc3F1YXJlX3VzZXJl
bnYoeGUsIDApOw0KPiANCj4gKwlpZ3Rfc3VidGVzdCgiY29tcHV0ZS1zcXVhcmUtdXNlcmVudi1s
YXJnZS1idWZmZXIiKQ0KPiArCQl0ZXN0X2NvbXB1dGVfc3F1YXJlX3VzZXJlbnYoeGUsIExBUkdF
X0JVRkZFUik7DQo+ICsNCkxHVE0sDQpSZXZpZXdlZC1ieTogUHJpeWFua2EgRGFuZGFtdWRpIDxw
cml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiAgCWlndF9zdWJ0ZXN0KCJjb21wdXRlLXNx
dWFyZS11c2VyZW52LWlzdm0iKQ0KPiAgCQl0ZXN0X2NvbXB1dGVfc3F1YXJlX3VzZXJlbnYoeGUs
IElOUFVUX0lOX1NWTSk7DQo+IA0KPiAtLQ0KPiAyLjQzLjANCg0K

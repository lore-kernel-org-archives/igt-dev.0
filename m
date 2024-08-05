Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE4FC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 07:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85BB10E0A6;
	Mon,  5 Aug 2024 07:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ga6c5qjA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B4810E0A6
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722844555; x=1754380555;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Bz77QA4FeHCryzFtYIgm4n+C/TD0kPz4MXpuuSdDdE=;
 b=Ga6c5qjAPwKDwLelqn+OSPWjLzD02fN4yw56bqhOKTAG6Astfc910VXU
 PjqHBOtSJppzC0JRGx4xLgPvIbCs06VP1ErhkiwnjWh38FrMXd91vE80t
 ziwaWSyorls1YpWfW2f2F3GmYQjupymfYtkxdWLafi5cq/MKxLpzwXVLS
 vCMSwRAfP3TKI+0sygaKxPXB+nnzRYgxpq1XvhYREaFjy8OTaKCigqfjA
 hAh0rHDn3Xuhl2yL4FomeOJ82WNvTV+1kMp/rI4f+iUfPOSyMptiZy7ey
 FUrK8iU0SyjT+lGVtHV6/1RCxxlu5o26efop9uMXat8g14cKi5J+/Uv0J Q==;
X-CSE-ConnectionGUID: aDRaqCzSTPudIjj0PfE30w==
X-CSE-MsgGUID: teMsRF0AS8airNKrD+o8AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31370499"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="31370499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 00:55:54 -0700
X-CSE-ConnectionGUID: TdCrZ2dIT7q33dqQJ5BGuA==
X-CSE-MsgGUID: teA+3P+YQIe9JCirIgZolw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="79357055"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 00:55:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 00:55:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 00:55:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 00:55:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 00:55:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDXpnPNJHWBYXV4b8/Bh0wIny5oZFiFSIQLl2CCP7FqfaCZLhTqZKmNFAwNq0AnMgvcvBbysl1X9j49clie/+4xteFPViJXPqeo3vgo+7gUl3Gdu+LKvessmBaW6NxYoBnji9XB4pXfcxMG/aWK2i5odrRJ38Gn67UPQQbGP6g/G8azmm+6GxwP86pSxKy0PBSKgbaIUShY9cWS/s5NgPaszFpvIRKopSR2D6vIRH6B2aIWze0pRZPrJI5szkEcjxUGwMr9W3L2H/W7RHG1flGy1oytO+yN6ShVB38kjvp7oRk+5mpI4kra6egxrwYlJMqcxu+rYPjBi2DQyIQpaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzDN95SAjwctxgj64kw7pdV64KypaHw+Ftunn3aR+GQ=;
 b=Jw1nYzooyauCi6TqxlwGk2ZQ1RncrvJAncp/vxo+HAPpjTWzJ2lX05i6sLYrpG/hCVRxl0Qv/Ayx+GgQ20EnqvgWQEyPb6SM2mwd0p6yeBdDqEgb9TLdFEeKrP8/njRrVDZHOVYANawtutsb7vsU1R4Y5YgIM8+4gFoqo95z5P8j4trKdFkjLprOCgMz3gLvuv/TNTy0twJM3hcryhwRjTZ8Y9v3TJhcuLXzT0O6/HnVGPIbn/1L0DsJu2+JqB1PyXIo5Jxx+8mfnWUrzTZMPmCv+d1+ROebk6ydelc39Z1hRWydkt8Rj9UZqYilEx9QE/ltxnTptMFyQQMyP0wwnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Mon, 5 Aug
 2024 07:55:50 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 07:55:50 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 60/66] tests/xe_eudebug_online: What if user does
 not set debug mode?
Thread-Topic: [PATCH i-g-t v2 60/66] tests/xe_eudebug_online: What if user
 does not set debug mode?
Thread-Index: AQHa4naT6yvSfA/Tk0KrCEnuGvYhHbIYVM0Q
Date: Mon, 5 Aug 2024 07:55:50 +0000
Message-ID: <DS0PR11MB7264A4E739C5E81DAFA78C6ED9BE2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-61-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-61-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MW4PR11MB6840:EE_
x-ms-office365-filtering-correlation-id: 2171b4f6-d12a-4977-d6e6-08dcb52405ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?GE+D2gLSkLOgVFsKBz/+KwfK+CfxxtF5gG5cmpmZmTPVxJS0libYVDQAdt?=
 =?iso-8859-2?Q?dVpfYAw5Xa17CSgReDtamfl0jIPvDVREbq8dgwIVSllvUxlCGjmUkudde3?=
 =?iso-8859-2?Q?Zv0ePngBr1o5KBSuV8nnMOdpcGbl5WOEfwdajw0F4sMxSgVsZj65YjPY99?=
 =?iso-8859-2?Q?vZgU1dxMs3BR2Tdsdml83hRnozC0sfLbEiUlGRznzNPqux68X34v3CrYCk?=
 =?iso-8859-2?Q?JhDdG9RqAKTAqUUOZUv7/f/txbmepzxeMYcfDrZ1k7tKpr1maut0nUsHq7?=
 =?iso-8859-2?Q?L0ModzL2EGafWkqTZWbHLjucq0OOUl0B/pOl/fa2WNFSpVF5C0hF1/V2ff?=
 =?iso-8859-2?Q?v8yJtn+aOiIO+Tk+XHQ5Mxrn7uucfkwlwCH3VjTWCZOXO5BezlqSTKWYD6?=
 =?iso-8859-2?Q?MEj7PlU2jRQ1CddflIpwC/WKQLclIYjm/D6Nf3p+MVy+tH1Gp+A77GeXzM?=
 =?iso-8859-2?Q?Ke0UVLm5+eHae8ILsifEWmuXjPfqtquH5aFCVTO8ot8PoHGoHt62xaxiiQ?=
 =?iso-8859-2?Q?q7HP/qWMiXeoHjGBGLgaOx26P1GJZJK2I6lVo+G6O6ZT1kjG4rSsZ2qaWy?=
 =?iso-8859-2?Q?54o3w38OiGL/Jo6liP5HBpkFN4MWtr5hBJzRwtv+RzyAmivyYC8S2JPNVn?=
 =?iso-8859-2?Q?MZ0OwbxWiigy3kiu6IMtf1HdjynlLNVHLaxG1uTVQkvzIyHopw55uKSdMd?=
 =?iso-8859-2?Q?K981XwfMtnk7NiLZWAeCVudynmJXj9DjFXNaVNIk/sS9PUr7Sg+Qxe5xkq?=
 =?iso-8859-2?Q?zyyQzHwD0P/L0StpAp8GlvP2jHmcfSiUgnGplV8FWfUxewYz4UtqJJBXjf?=
 =?iso-8859-2?Q?FEmHkhv670YKotP7q35oZSXGBTH1/VXFcHESP6ec4eq6k1DsxtWa6sKv7S?=
 =?iso-8859-2?Q?XlSluyBa7Y6A15CX+wlevrtIxyyq0JFL/hXnftSfi7yb52hN14CWxohy19?=
 =?iso-8859-2?Q?jM9w6KIjoGCA6C7hZxMIJnnWk1iE9XwNh81w5XXUSRgp9lzbcEzIxhZl+j?=
 =?iso-8859-2?Q?SftJ17IK63ppzsWKEfG2y/jN6ZuW7MHzILwo8O6l+1n2ldvPEwrizeTtzU?=
 =?iso-8859-2?Q?ie1FlEgQM2uXF1kerpMadsqikE01mt9QY7sHJ9C1jDtWp5zwYp5zWBU13a?=
 =?iso-8859-2?Q?4stzE9by17WImjh88mxl3c5SMAGhcDzR8eJkZrXgi5zhYFZ5WJ87GL/aO+?=
 =?iso-8859-2?Q?/0FtTaLbsDlvjgCB/s9XcYGJ4a9JzmK4u5IbgsDbLBsjIJ1Q9BXDShxUQi?=
 =?iso-8859-2?Q?oJv1Rr1Tv4ZJ5QKVCSjBw9wJCXsuvxaUpjesocPZoD7TjvFD916F/HQtiz?=
 =?iso-8859-2?Q?4x08YroALRbPAqwvFS2ReQn/2dE841MdJGCnJRwVBusJcxHbv+RBi4QP3+?=
 =?iso-8859-2?Q?xUtLJzlFTEpbJCcm/Y5ZM9nPrvFylu0g+sW4oP892USNKRgCFO1UqyOBfu?=
 =?iso-8859-2?Q?TYIQ2+p0lmtuKDvADFOrH0WmpWZa70GpsbIVgg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?jsmWI4lkeAQwhixXlxnryM+Vda/h4KPAb3cEEqeCqBN07FNJ/QZyymLFce?=
 =?iso-8859-2?Q?GV9zgusTStnW47hOhItDYiBDXghvVgdXkC6RJ8lLMyFrOVmqPBSK1PgtCq?=
 =?iso-8859-2?Q?mJLwh6W6uWEhreRz/+Y8aJLgupG5PeSeFf6cXeZ9E//ggufyTPd8qXpfwH?=
 =?iso-8859-2?Q?Cf8RqlnxAq8g7Aob6L8ZbttV4SijFsrjruJwZyqTU3+a/qq5AgeLa9IUR6?=
 =?iso-8859-2?Q?UvXrhj+zwA53+GxApKyEwNgM/oOtUK9CvhhjMWcHnG+INWlpWEAqtBa2Ja?=
 =?iso-8859-2?Q?Vy1X9IgUukTpPXDNKhTlMU+r1oZYBIae/atMZYuT4zrs64UH3jhfIYlNEU?=
 =?iso-8859-2?Q?pcumQaYbdnbR/2S55MevT/Xmj9lEl9hzxqQxNxaVotFsnTierzl8DdFDWJ?=
 =?iso-8859-2?Q?Dg4xP8JPbTLsIiuGsh43qvRO7avuOE4odRpgUYu18NLwWqwCfTjN7ux5D9?=
 =?iso-8859-2?Q?shKh8NikE2XC62pqNrCQTW/DuJHa7G0Oh/wQS7ZHikAgVeC+qN0iIXTyr0?=
 =?iso-8859-2?Q?6N2N2I5hY3TTqWtW9wZbU/Qf8ZryYp+LFXlNDuDkkjUP3vtG4rMtcMSeSk?=
 =?iso-8859-2?Q?YlKwv5/gyTysT5S7kUnwqZo0+A0pa4wFIaQImKCX+Btj17AQB6Ibgzuo/p?=
 =?iso-8859-2?Q?qRenag9VMwqAVbSIextweRyH0C8kAQ5n9dFgP4NsfpIHX3jYdLfaBvhQdV?=
 =?iso-8859-2?Q?9tCWPrlxuO2mouX5JdQHSiFko0rbelrw3cxIidbhYF6lSTKZCHUxa0t2/C?=
 =?iso-8859-2?Q?5+61z4Jna/Cn8gGzaz6OPrBRAM95EaD+Ch+lpR9nAvIRU3ioIb17mC8VKN?=
 =?iso-8859-2?Q?Cv6gvHFPCwVzVsGBrjpv2vD6F3YVYZg304pqCM4pUbTM55hdb4E9dZ65Dm?=
 =?iso-8859-2?Q?X6NUJna7AdVSh4CCp3Zv/tFnu4q+7mfbMXwtJa6QEsH5HviJn16uvZ2AYI?=
 =?iso-8859-2?Q?Ki1sFx4m/XaMW4CeVAwbHumfCzMlvUvPzJX6SKZzMiFmQLwa7DUh7NwEki?=
 =?iso-8859-2?Q?yhsWYTcfdTEqr50gdYMAm/ttssm7tsi0C1ULSp/3J/WkUISzPQCgVdSqDU?=
 =?iso-8859-2?Q?5+B/11/U3Z0+ES3Ah/OPeAUbe2o6+sTYcrC4Z0AW/HP7uKuqD4o1YRZemd?=
 =?iso-8859-2?Q?G9Ztzu7U4++tqAQnoC9CFOMHmOsH7qtbTrjuQd8LZLMKNwcPvW/ZgQ6fB3?=
 =?iso-8859-2?Q?P7Wvw+FeR+mmg2H5bMTWwCR4AgbWUUu39fsHackKjC2TkMBBCdHtFoSb9t?=
 =?iso-8859-2?Q?Nt98J6OToSVBEH25uSzzF1c6QjALoInyXo1bh2Kn9AbSj6r5cmh7QjbFiP?=
 =?iso-8859-2?Q?0i2h/0ikvZs632258MluPavChqygpXi+DNqDn/ebXDZgrOKWVT3/vjXDwf?=
 =?iso-8859-2?Q?08iyn2UfMU6D9UmXIQihhpdi/4ccRfa1yVps/NtNEKlqX/9MMuwDwWWLOm?=
 =?iso-8859-2?Q?t35YDiEfoDm5V5F2Vo0qsaZgu0qpPgyvhWoeH3sk1XrILUI2mmzBaT4F27?=
 =?iso-8859-2?Q?rA1zWFK0Qv3Qc8m5cAQRMvROdkb1FptWN6J871jnA/Q+ejD+8u0BSEvZhL?=
 =?iso-8859-2?Q?USMS1sRGbhHqosEdf8e69A+GXEn1zg900kJb1mhU1UKSOEqiQpf7MKz+CD?=
 =?iso-8859-2?Q?pwqfPKqIN3EAi4Xok5G/gGrTegN4+P5KLEDzakxUXNajYN0qPDHBZk2A?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2171b4f6-d12a-4977-d6e6-08dcb52405ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 07:55:50.2312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5LebBowp2UkUIhyhAkkccKvWEN+JW22VNCYGDXtOo79BSa4371Pee1g2xVW76CQITMo/R87JM0vb6dqxLZbEaG6yt9hEk8PKz+5CB/n+mz28FjgRw3JqVnS9mcaZHHxa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 60/66] tests/xe_eudebug_online: What if user doe=
s
> not set debug mode?
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Implement test proving that workload is terminated if we hit exception
> without having exec queue in debug mode.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index cabe2101e..8361b6db4 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -24,6 +24,7 @@
>  #define SHADER_LOOP			(1 << 1)
>  #define SHADER_SINGLE_STEP		(1 << 2)
>  #define SIP_SINGLE_STEP			(1 << 3)
> +#define DISABLE_DEBUG_MODE		(1 << 4)
>  #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>  #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
>  #define TRIGGER_RECONNECT		(1 << 27)
> @@ -813,7 +814,7 @@ static void run_online_client(struct
> xe_eudebug_client *c)
>  		.instances =3D to_user_pointer(&hwe),
>  		.width =3D 1,
>  		.num_placements =3D 1,
> -		.extensions =3D to_user_pointer(&ext)
> +		.extensions =3D c->flags & DISABLE_DEBUG_MODE ? 0 :
> +to_user_pointer(&ext)
>  	};
>  	struct dim_t w_dim =3D walker_dimensions(threads);
>  	struct dim_t s_dim =3D surface_dimensions(threads); @@ -880,7
> +881,8 @@ static void run_online_client(struct xe_eudebug_client *c)
>  	data->threads_count =3D count_canaries_neq(ptr, w_dim, 0);
>  	igt_assert_f(data->threads_count, "No canaries found, nothing
> executed?\n");
>=20
> -	if (c->flags & SHADER_BREAKPOINT || c->flags &
> TRIGGER_RESUME_SET_BP) {
> +	if ((c->flags & SHADER_BREAKPOINT || c->flags &
> TRIGGER_RESUME_SET_BP) &&
> +	    !(c->flags & DISABLE_DEBUG_MODE)) {
>  		uint32_t aip =3D ptr[0];
>=20
>  		igt_assert_f(aip !=3D SHADER_CANARY, "Workload executed but
> breakpoint not hit!\n"); @@ -1049,6 +1051,7 @@ static void
> online_session_check(struct xe_eudebug_session *s, int flags)
>  	struct drm_xe_eudebug_event_eu_attention *ea =3D NULL;
>  	struct drm_xe_eudebug_event *event =3D NULL;
>  	struct online_debug_data *data =3D s->c->ptr;
> +	bool expect_exception =3D flags & DISABLE_DEBUG_MODE ? false : true;
>  	int sum =3D 0;
>  	int bitmask_size;
>=20
> @@ -1076,7 +1079,10 @@ static void online_session_check(struct
> xe_eudebug_session *s, int flags)
>  	if (flags =3D=3D SHADER_BREAKPOINT)
>  		igt_assert_eq(sum, data->threads_count);
>=20
> -	igt_assert(sum > 0);
> +	if (expect_exception)
> +		igt_assert(sum > 0);
> +	else
> +		igt_assert(sum =3D=3D 0);
>  }
>=20
>  static void ufence_ack_trigger(struct xe_eudebug_debugger *d, @@ -1092,7
> +1098,12 @@ static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
>   * SUBTEST: basic-breakpoint
>   * Description:
>   *	Check whether KMD sends attention events
> - *	for runalone workload stopped on breakpoint.
> + *	for workload in debug mode stopped on breakpoint.
> + *
> + * SUBTEST: breakpoint-not-in-debug-mode
> + * Description:
> + *	Check whether KMD resets the GPU when it spots an attention
> + *	coming from workload not in debug mode.
>   *
>   * SUBTEST: stopped-thread
>   * Description:
> @@ -1540,6 +1551,9 @@ igt_main
>  	test_gt_render_or_compute("basic-breakpoint", fd, hwe)
>  		test_basic_online(fd, hwe, SHADER_BREAKPOINT);
>=20
> +	test_gt_render_or_compute("breakpoint-not-in-debug-mode", fd,
> hwe)
> +		test_basic_online(fd, hwe, SHADER_BREAKPOINT |
> DISABLE_DEBUG_MODE);
> +
>  	test_gt_render_or_compute("stopped-thread", fd, hwe)
>  		test_basic_online(fd, hwe, SHADER_BREAKPOINT |
> TRIGGER_RESUME_DELAYED);
>=20
> --
> 2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609B5CAC592
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 21:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FB510E80D;
	Tue, 16 Sep 2025 21:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aq8b7BTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27E710E80D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 21:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758057079; x=1789593079;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aZoZrVzH/1VrQj3kfgmoWhDkrhyko/Gfh8r+sqTUUqE=;
 b=aq8b7BTP0Lz8SdDhd5nsS1evMjzh+BbN21kn/Q96R1G0dg4l4S/3IS1+
 3t/wtyXnvIgP+obIAMIyPtlp4qUNvzpnlWl4wuCPxhbtl2RarXqv1obNr
 BMJRUbvsUxFfH6P1M83wtcPsozy8no3YbC5IhkciynXgwWfH+0AipUamY
 1Ac/LKYQftBGZLK8RNY7RjAau7PKtwD/l/W5xEFZUWVQXRcdLesX8B7fs
 SzVPODfl9zP821hSvdhBiRu8+lRVlYUypIbydQpOx6lYENAQ9Zx5ZsZY6
 xWyUJOjR5HvdxWRYPXo5lpxfef/G/+7vDjwSaI54N+usy6934gwoSDZkg g==;
X-CSE-ConnectionGUID: PR6rmI90QIe4+oOe3sSKog==
X-CSE-MsgGUID: Iu8nf4trT2moI6XflFSlNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82948615"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="82948615"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:11:19 -0700
X-CSE-ConnectionGUID: xJcl4+OiQ26E/FRm4ufvFw==
X-CSE-MsgGUID: /5q+xstNR4W90Az4BQ0W4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="205836678"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:11:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 14:11:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 14:11:17 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.11)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 14:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaQp+ndIcs37u5A21Mzh7fcFOLJChO+dKbDw9x1uhxkf7d3nNWCf+gpBF5A4uQFq8BIo0MQ7xk/ZITFW84ObpbYDJpGnzzsvuz7DDZUwpT/aL+XaMbK5DOX8TL77RE5OPlAxxDKb9sN9LCBirmxnSAJ3loatGrCbWq6fQj4mxpH3HCSSvjtSO56kWFw44OghAy09prPqeQLvMzpDps//Z+cvAfQvTHram9mTkFuPbpwzJEbL67AB05ZOOkW20uiJh5gQ+RkDdX+0T/LCIcD+gLY0BmqI4kexdLBlJQeze72C71sBSynwakPvftri64aqRcG+gH04dnZ00eFe/ymRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78AtU5/QzUEQkGEBoVuq22z2714PFC/HGWcUJh9TwpA=;
 b=WcC+cmbWRwE0qlaEbfJKuFkg8//yNUIJCA3MG9r6qMutdMhaicHY20QBhtip2QtcimpgTxjxC7TQl0dXBTKV+5nJAZGifFkvncHo4XE24pnDqPLybg6QYzwqRzItfRFLWUCG3Q/KB7As8l7VmbGmi7nwR4Ws/LbnrjiKQwFRn4Nk+gwOJjp4lZTlGr1oN9owKgLTnXpOR5BkWxdsFN8uO4wPtQ/ju2Fzgrt7AQJCNSyE/W71cPX8S2vMlEy4pmsP9kwR60t6k95D7Rq+1wVfYYp2KGnW4TI3uRoMa4WvNPpf5L4eE+EwFpGFHPrpiCoXwo2o3j4oCu6psptQqZ5HIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 21:10:16 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 21:10:16 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v4] test/intel/xe_pmt: Add testing for BMG crashlog
Thread-Topic: [PATCH v4] test/intel/xe_pmt: Add testing for BMG crashlog
Thread-Index: AQHcHcEXiacrUZpyxk2cUAwWCdqpz7SWV/sAgAAIUvA=
Date: Tue, 16 Sep 2025 21:10:16 +0000
Message-ID: <IA1PR11MB64183356D9FD4800030CC2BCC114A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250904172625.1024127-2-michael.j.ruhl@intel.com>
 <aMnKlIjIYJDV3nJo@intel.com>
In-Reply-To: <aMnKlIjIYJDV3nJo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS0PR11MB7880:EE_
x-ms-office365-filtering-correlation-id: dc8724e3-e969-4716-fc7c-08ddf5656f78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/GCIpQHfUHCtWTR1GX3trP8MBGZ1iCrpSz5DKUyN1XjsmJNiqCBl+jtkPhcu?=
 =?us-ascii?Q?pW20CLo2mpupkB16biZ81LVd0JXTPKoW9ntRZ7BxKdgszYxsfx/t3Nbnu8Jr?=
 =?us-ascii?Q?7bY+okgQLDq96/HDqhVAHBJ1SWY15CxAsjQBcJZj9IlKWFuFqRdtJ29IqbK0?=
 =?us-ascii?Q?cDTNNc3nagymOSG1jHJFGvsla5AB6ZIjCok5wvZsIwDniy2GtKXvt2AhyjZ0?=
 =?us-ascii?Q?m7B1fKR/2UUIfTz0ofxEux/Gt13us1YUft7DGf6DGRrIU7TlfuMAQ5/sYeVh?=
 =?us-ascii?Q?TVVT+L01Mzh3JEkCFnrcPmwLCj4z0ZhP6GdncrysembGJxawzCpE1/xIY4lE?=
 =?us-ascii?Q?ngm/GscpFXlfEv8mSV78OcBrC/2tIDmRNNJlC8k8qB2oGMXRuSiq7R/elPBo?=
 =?us-ascii?Q?+RlSxo2i7iD9ft9aoLYJxwJ0/OntV2+kgt3KCkhzyB/0eFkCz3mA9PZGBsxN?=
 =?us-ascii?Q?DWcwiA2N7erm9zUeF0s0mShrDEqNpbC3Zpkwqm3DnGduDcZl5D74Rzl5YclO?=
 =?us-ascii?Q?J1L/ap3EceErUTVr94qa5LmTHv5WEv45XQ3UuhvOcN6/H99oPad/9dwLbDV2?=
 =?us-ascii?Q?tAKMdNuIjKtRTuFydJEKjDadMb60ZIMaeEik5kty82si8qCVVdwD5kcOZu4H?=
 =?us-ascii?Q?zenq6toxT+e8D2e1bym0d4xyUe0gH3bsymDdajT6jJrbt5gHMsIK+i0wqXsl?=
 =?us-ascii?Q?WCw5aEc7zhWmzkwEahCfPT07sdygR5g2D/IvqfiSLTbV4SqP/3toU7Xm2u0f?=
 =?us-ascii?Q?mkftgQLoZB/R3bXdzXy9sJ2ZDZZugK3AI398Xz6J4aCsk4cypOC0H3MgbxX1?=
 =?us-ascii?Q?UrlmrOHVyTUBfaPn8PkVD3nbvL6q6lYZ0LFNKxE7PgyeccrZIkJhjvuCCeYJ?=
 =?us-ascii?Q?hfEJqEE4xCmIgXa/STkIFLpCnL+LJZH/HFys40rKs+A5vE1mMXqPbaqPNYpm?=
 =?us-ascii?Q?6jEeO9Y3/cOMI1QeSIhid63X6fR5HpEiBr5YaMq0JsAzmMpZ2HfYfonL0DWy?=
 =?us-ascii?Q?FFZi3+KD1Ja0sqNQTKOiCMf6gWfzdHZHKOlWWZ3blTjc1M9QR3raySr+BFBj?=
 =?us-ascii?Q?TAKHJz511BhU80RybOfM6j+Py220Vsah6oQ55BVoYS9zx3sYqmTcP/95RpE0?=
 =?us-ascii?Q?mwrZcN4LFzXKbjpJGPQA60113cxbOlhJ6tLK4GdmJwWk0cKwXaluxvu5ELFS?=
 =?us-ascii?Q?vcEG597IpwvM4sm+B/GQDB9jKsk5nKGfEVlh41L67l4V1Q0lo3SqjsbkDNVD?=
 =?us-ascii?Q?ygaPzSnmyQ63QLjOBqcr9C6LetJsIB+nrGJVhUlKz4nwkdBX951lnD4P5wUg?=
 =?us-ascii?Q?I/a4HKJyjbMpuGcqBaw4+wco5q/mF8le8AbHe8UxgCiVzYAvQY51hXjTMb/S?=
 =?us-ascii?Q?9ChknpQv0LghPzUoNQkntjzCC/JGZghCCWymcqQf1aTCzRSWLB1sB0UNkpNV?=
 =?us-ascii?Q?DRBtKgPM4MCS7VwtEf9cDO/QvCgPGQFPIv3xRSFxshhRMIx5owALtYKKZKbn?=
 =?us-ascii?Q?sNaloJrwN6Nbfb4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wzaqQOeu4y6dCzzyVTefFt2imU+uaShN1EyIK9soEmqVD/3lCkX7C9bWrguG?=
 =?us-ascii?Q?KuV7OBp3t4SfVqgwGazpV316zcHbYj1kiEHsUYoIn+yVzNHmQXhdLsWPtb4E?=
 =?us-ascii?Q?tUyE193j9ZJxJXiQXBhfCl7XlYAam6dLZteQ3IrExKxAHZq4q/I2LLMVB/lL?=
 =?us-ascii?Q?+rvHGXPNXexdty/NmI8ctk788m7qzd+9qsZcPlLqfAEPjWgSQZCsYHyFMNvs?=
 =?us-ascii?Q?bpOYrfAXEc/zcVCtzApd1M08c4bcQnce/dzBKMfPRVXLTV6i4mP5yXm7JN6c?=
 =?us-ascii?Q?wRnmoj/KsMMw+cXikNyvkfuDwo63azQ+P3Z7RWeUjUutOv7rEK91suByyg9n?=
 =?us-ascii?Q?9WAq0RBbzacqdmjd78xEKcLfZh1OCOAHlsOhKZJS+/NNu9XdLc2NAxdlV7qx?=
 =?us-ascii?Q?U/HJOGTsLwWBwPQHQvETutpj56k7NeY293wSZ6iF7osPdhfVADo60yM4vw/K?=
 =?us-ascii?Q?QMjGyoastoPyDF0C4gKfSOq1ksERPHQ2OmaISep59vbPx5rqo0vqjoxThjPH?=
 =?us-ascii?Q?c2WvpwXcEPdhUJqNEqMGaoW8DnIgnaXWMQC2aIIcyMvLRetAKHV+Lt4NAjuU?=
 =?us-ascii?Q?GNLVvOei3r9Itt38GWvix87WU4EUFAuPToR590RHnibkA2FFYfny0nLkFULa?=
 =?us-ascii?Q?kyjl9YIU3BsOIyVx565X3/tk/qJnk7IvGMrQzq/lNP51zKet/wouFV/eWkR/?=
 =?us-ascii?Q?jIHTaSDTDq2QTVrdxXRV+zGdODdV3W5mbIyRPxhtt0mC8gBqknUgJBS1SEL/?=
 =?us-ascii?Q?nPst0ks97KIcdxMW4YFtmXUwVP0fNh2SjWpt9UirZilhB5giQmO0eiP4Vv8q?=
 =?us-ascii?Q?4uWRiFttFkLpoKgjLh34xlwHc3TMbX+GF9y62u4G+eMTV/JQ0ZYPws5xFWYH?=
 =?us-ascii?Q?UjcO5HBONDJbVQ6SX1gwYtys5RPswMbcHvIFlVXWGgaVdskRAlHCYY1czDbL?=
 =?us-ascii?Q?BoI+zKc2e0kYfX3t6wmie8i74BXhYXoEpHyE2kxo8v59Ro2Yc+N4jeTZT6nF?=
 =?us-ascii?Q?dtsYkI9XCNsHyF30Sq5yYLMy0tJcHcfyYJu5iM/lO1dIDDBEXh36D6ZqaKfI?=
 =?us-ascii?Q?AH5w3eAf+9+lovJeVJd3UY1UMU1odyk5PhImkV73o8JS8OtBAKo03FWROLn4?=
 =?us-ascii?Q?rieg583DiOMxv9m5KlepwIfB5QUZeBTygfBuuRfM57CamcptBqpEfHBcJ1Z4?=
 =?us-ascii?Q?sa+gL0oG37zR0erecjPB+0KfB6XcWyy5JztgEhrndAIMc3Wg2Ll0rBmXi+XX?=
 =?us-ascii?Q?GCgJmkuQE8zI0bOXoQxEghQlHZx7v3gLnIoFGAD+1P8Lzm+fDjTOdgYfvwpe?=
 =?us-ascii?Q?AkrgWq747LJY2ANdOE8pl+89kP5liP80cl0XbTpstW3vRA7Z+mw+XTLo/bTy?=
 =?us-ascii?Q?H3pD2hZNjNgBGtBwMnShJqoMi5ZvqrbwnvJmBGusw3M8OEk5RwHu0T6gsGv5?=
 =?us-ascii?Q?2DdrGpUjym9JCWmfDtze/DzgCMl6ombAIBR1qlt3R45/MtU0fnydB+0pQGn4?=
 =?us-ascii?Q?dKrYEM59Kb29rcsdgT4abqYwAOj4PQ53Jlu9dCRA7MnwkL40chmL0unXTLws?=
 =?us-ascii?Q?YhYG63kj4KQyRVkGwiR7zay1wWPcE6lKNQ0r9Ttp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8724e3-e969-4716-fc7c-08ddf5656f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 21:10:16.6951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LdZywbVFvc2ewVbO0nEgZrRkG8oMlVsLL7e2LV9cX4Ax2vqC9S6oc6Xdi2rx7piS+s4cZLw2imJkpu+tC2UPCcAR0hMcbiTEZdZHgDu3aPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
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

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Tuesday, September 16, 2025 4:38 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>; Kamil Konieczny
><kamil.konieczny@linux.intel.com>
>Cc: igt-dev@lists.freedesktop.org; De Marchi, Lucas
><lucas.demarchi@intel.com>; kamil.konieczny@linux.intel.com
>Subject: Re: [PATCH v4] test/intel/xe_pmt: Add testing for BMG crashlog
>
>On Thu, Sep 04, 2025 at 01:26:26PM -0400, Michael J. Ruhl wrote:
>> Battlemage (BMG) devices have the Platform Monitoring Technology
>> (PMT) crashlog feature. If the device present is a BMG, test the
>> PMT API.
>>
>> NOTE: the testing order is not flexible and must be done in
>> the currently specified order.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>
>> v4: address review comments
>>
>>  tests/intel/xe_pmt.c | 506
>+++++++++++++++++++++++++++++++++++++++++++
>>  tests/meson.build    |   1 +
>>  2 files changed, 507 insertions(+)
>>  create mode 100644 tests/intel/xe_pmt.c
>>
>> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
>> new file mode 100644
>> index 000000000..fe303b9bb
>> --- /dev/null
>> +++ b/tests/intel/xe_pmt.c
>> @@ -0,0 +1,506 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright (c) 2025 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Verify Platform Monitoring Technology (PMT) files operations
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: sysfs
>> + * Description: Verify that the available PMT files (crashlog and telem=
etry)
>> + *   are created, are accessable, and respond as per design.
>> + */
>> +
>> +#include <unistd.h>
>> +#include <dirent.h>
>> +#include <fcntl.h>
>> +#include <limits.h>
>> +#include <string.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +#include "linux_scaffold.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>> +/* base directory names */
>> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
>> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
>> +#define CRASHLOG_DIR "crashlog"
>> +#define TELEMETRY_DIR "telem"
>> +
>> +/* itemize the available instances for the specific device */
>> +enum bmg_crashlog_instances {
>> +	bmg_crashlog_punit =3D 0,
>> +	bmg_crashlog_oobmsm,
>> +	bmg_crashlog_max
>> +};
>> +
>> +enum bmg_telemety_instances {
>> +	bmg_telemetry_punit =3D 0,
>> +	bmg_telemetry_oobmsm,
>> +	bmg_telemetry_max
>> +};
>> +
>> +static char dev_path[PATH_MAX];
>> +static char work_path[PATH_MAX * 2];
>> +
>> +/*
>> + * In most case there should be a single instance of the crashlog and
>telemetry
>> + * directories. If DVSEC entries are not contiguos the structure will b=
e
>different,
>> + * and the code will need to reflect the structure.
>> + */
>> +static char crashlog_vsec_dir[32];
>> +static char telemetry_vsec_dir[32];
>> +
>> +/* This needs to be specific for each supported device */
>> +static char crashlog_dir[bmg_crashlog_max][32];
>> +static char telemetry_dir[bmg_telemetry_max][32];
>> +
>> +/* telemetry file names */
>> +static const char *telem =3D "telem";
>> +
>> +/* crashlog filenames and descriptors */
>> +static const char *clear =3D "clear";
>> +static const char *consumed =3D "consumed";
>> +static const char *crashlog =3D "crashlog";
>> +static const char *enable =3D "enable";
>> +static const char *error =3D "error";
>> +static const char *dev_guid =3D "guid";
>> +static const char *rearm =3D "rearm";
>> +static const char *trigger =3D "trigger";
>> +
>> +struct crashlog_v2_info {
>> +	int clear_fd;
>> +	int consumed_fd;
>> +	int crashlog_fd;
>> +	int enable_fd;
>> +	int error_fd;
>> +	int guid_fd;
>> +	int rearm_fd;
>> +	int trigger_fd;
>> +	u_int32_t guid;
>> +} bmg_info[bmg_crashlog_max];
>> +
>> +#define DEV_PATH_LEN 80
>> +
>> +/*
>> + * device_sysfs_path:
>> + * @fd: opened device file descriptor
>> + * @path: buffer to store sysfs path to device directory
>> + *
>> + * Returns:
>> + * On successfull path resolution sysfs path to device directory,
>> + * NULL otherwise
>> + */
>> +static char *device_sysfs_path(int fd, char *path)
>> +{
>> +        char sysfs[DEV_PATH_LEN];
>> +
>> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
>> +                return NULL;
>> +
>> +        if (DEV_PATH_LEN <=3D (strlen(sysfs) + strlen("/device")))
>> +                return NULL;
>> +
>> +        strcat(sysfs, "/device");
>> +
>> +        return realpath(sysfs, path);
>> +}
>> +
>> +/*
>> + * Verify the PMT directory structure
>> + *
>> + * BMG PMT directory structure:
>> + *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
>> + *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
>> + *
>> + * Note: different platforms could have a different pattern
>> + */
>> +static void test_pmt_directories(int dev_fd)
>> +{
>> +	struct dirent *ent;
>> +	int index;
>> +	DIR *dir;
>> +
>> +        igt_assert(device_sysfs_path(dev_fd, dev_path));
>> +
>> +	/* verify top level PMT directories */
>> +	dir =3D opendir(dev_path);
>> +	igt_assert_f(dir, "no directories found\n");
>> +
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name,
>sizeof(VSEC_CRASHLOG_DIR) - 1) =3D=3D 0)
>> +			strcpy(crashlog_vsec_dir, ent->d_name);
>> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name,
>sizeof(VSEC_TELEMETRY_DIR) - 1) =3D=3D 0)
>> +			strcpy(telemetry_vsec_dir, ent->d_name);
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n"=
);
>> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry
>directory\n");
>> +
>> +	/* verify crashlog directory structure */
>> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir,
>"intel_pmt");
>> +
>> +	dir =3D opendir(work_path);
>> +	igt_assert_f(dir, "no intel_pmt directories found\n");
>> +
>> +	index =3D 0;
>> +	/* find the crashlog<x> directory instances */
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(CRASHLOG_DIR, ent->d_name,
>sizeof(CRASHLOG_DIR) - 1) =3D=3D 0) {
>> +			if (index < bmg_crashlog_max)
>> +				strcpy(crashlog_dir[index], ent->d_name);
>> +			index++;
>> +		}
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(index =3D=3D bmg_crashlog_max, "too many crashlog entries
>%d\n", index);
>> +	for (int i =3D 0; i < ARRAY_SIZE(crashlog_dir); i++)
>> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d]
>directory\n", i);
>> +
>> +	/* verify telemetry directory structure */
>> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir,
>"intel_pmt");
>> +
>> +	dir =3D opendir(work_path);
>> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
>> +
>> +	index =3D 0;
>> +	while ((ent =3D readdir(dir)) !=3D NULL) {
>> +		if (strncmp(TELEMETRY_DIR, ent->d_name,
>sizeof(TELEMETRY_DIR) - 1) =3D=3D 0) {
>> +			if (index < bmg_telemetry_max)
>> +				strcpy(telemetry_dir[index], ent->d_name);
>> +			index++;
>> +		}
>> +	}
>> +
>> +	closedir(dir);
>> +
>> +	igt_assert_f(index =3D=3D bmg_telemetry_max, "too many telemetry entri=
es
>%d\n", index);
>> +	for (int i =3D 0; i < ARRAY_SIZE(telemetry_dir); i++)
>> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d]
>directory\n", i);
>> +
>> +}
>> +
>> +static void find_pmt_file(const char *path, const char *file)
>> +{
>> +	struct dirent *ent;
>> +	bool found;
>> +	DIR *dir;
>> +
>> +	dir =3D opendir(path);
>> +	igt_assert_f(dir, "no intel_pmt directories found\n");
>> +
>> +	found =3D false;
>> +	while ((ent =3D readdir(dir)) !=3D NULL)
>> +		if (strcmp(file, ent->d_name) =3D=3D 0)
>> +			found =3D true;
>> +	closedir(dir);
>> +
>> +	igt_assert_f(found, "missing %s from %s\n", file, path);
>> +}
>> +
>> +static void open_pmt_file(const char *path, const char *file, int *fd, =
int flags)
>> +{
>> +	char file_path[PATH_MAX * 2 + 1];
>> +
>> +	sprintf(file_path, "%s/%s", path, file);
>> +
>> +	*fd =3D open(file_path, flags);
>> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
>> +}
>> +
>> +/*
>> + * verify that the expected telemetry file(s) are in place
>> + */
>> +static void test_pmt_telemetry_files(int dev_fd)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < bmg_telemetry_max; i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>telemetry_vsec_dir,
>> +			"intel_pmt", telemetry_dir[i]);
>> +		find_pmt_file(work_path, telem);
>> +	}
>> +}
>> +
>> +/*
>> + * verify that the expected crashlog files are in place
>> + */
>> +static void test_pmt_crashlog_files(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	int ret;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>crashlog_vsec_dir, "intel_pmt",
>> +			crashlog_dir[i]);
>> +
>> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, consumed,
>&bmg_info[i].consumed_fd, O_RDWR);
>> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd,
>O_RDWR);
>> +
>> +		ret =3D pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
>> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
>> +		bmg_info[i].guid =3D strtol(buf, NULL, 16);
>> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device
>%d\n", i);
>> +	}
>> +}
>> +
>> +#define ENABLE_MSG "1\n"
>> +#define DISABLE_MSG "0\n"
>> +
>> +static bool send_msg(int fd, const char *msg, const char *file) {
>> +	size_t len =3D strlen(msg);
>> +	int ret;
>> +
>> +	errno =3D 0;
>> +	ret =3D pwrite(fd, msg, len, 0);
>> +	if (ret !=3D len)
>> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
>> +			 errno);
>> +
>> +	return ret =3D=3D len;
>> +}
>> +
>> +static bool verify_msg(int fd, const char *msg, const char *file) {
>> +	size_t len =3D strlen(msg);
>> +	char buf[32] =3D {};
>> +	int ret;
>> +
>> +	errno =3D 0;
>> +	ret =3D pread(fd, buf, sizeof(buf), 0);
>> +	if (ret !=3D len)
>> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
>errno);
>> +
>> +	return ret =3D=3D len && strcmp(buf, msg) =3D=3D 0;
>> +}
>> +
>> +/*
>> + * Set enable enable/disable bit and verify usage
>> + */
>> +static void test_pmt_crashlog_enable(int dev_fd)
>> +{
>> +	u_int32_t guid;
>> +	int fd;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		fd =3D bmg_info[i].enable_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* force enable so we are in a known state */
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send
>enable\n", guid);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x:
>verify enable\n", guid);
>> +
>> +		/* disable */
>> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send
>disable\n", guid);
>> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x:
>verify disable\n", guid);
>> +
>> +		/* re-enable so we can do more testing */
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-
>enable\n", guid);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x:
>verify re-enable\n", guid);
>> +	}
>> +
>> +}
>> +
>> +/*
>> + * Test the clear crashlog bit. After setting the crashlog data buffer =
should be
>> + * set to 0xdeadbeef.
>> + * BMG supports writing "1" to the clear file, but writing "0" (DISABLE=
_MSG)
>to trigger
>> + * file is the "standard" usage, so test that usage.
>> + * This bit cannot be cleared by software (i.e. reboot required).
>> + */
>> +static void test_pmt_crashlog_clear(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t guid;
>> +	int crashlog_fd;
>> +	int trigger_fd;
>> +	int clear_fd;
>> +	int *val;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		clear_fd =3D bmg_info[i].clear_fd;
>> +		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> +		trigger_fd =3D bmg_info[i].trigger_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x:
>verify clear\n", guid);
>> +
>> +		/* set the clear bit (0 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: send enable\n", guid);
>> +
>> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x:
>clear set\n", guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>> +
>> +		val =3D (int *)buf;
>> +		igt_assert_f(*val =3D=3D 0xdeadbeef, "0x%x: invalid clear data value:
>: 0x%x", guid, *val);
>> +	}
>> +}
>> +
>> +/*
>> + * After a crashlog has been "consumed" (read), setting this bit can be=
 done.
>> + * Verify that it is set correctly.
>> + */
>> +static void test_pmt_crashlog_consumed(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int fd;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		fd =3D bmg_info[i].consumed_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* check, set, verify */
>> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x:
>consumed clear\n", guid);
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x:
>set consumed\n", guid);
>> +		/* sleep(1) to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x:
>verify consumed\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * The error bit is set when a crashlog fails in HW.  It is read only s=
o only
>> + * need to verify that it is "0".
>> + */
>> +static void test_pmt_crashlog_error(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		guid =3D bmg_info[i].guid;
>> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG,
>error), "0x%x: error clear\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * The rearm bit is set at cold boot.  It cannot be reset unless are re=
al crashlog
>> + * occurs (i.e. setting trigger will not change its value).  Verify tha=
t it is "1".
>> + */
>> +static void test_pmt_crashlog_rearm(int dev_fd)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		guid =3D bmg_info[i].guid;
>> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG,
>rearm), "0x%x: rearm set\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * Set the manual trigger bit and make sure the data is not 0xdeadbeef
>> + */
>> +static void test_pmt_crashlog_trigger(int dev_fd)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t *val;
>> +	int crashlog_fd;
>> +	int trigger_fd;
>> +	u_int32_t guid;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> +		trigger_fd =3D bmg_info[i].trigger_fd;
>> +		guid =3D bmg_info[i].guid;
>> +
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: trigger clear\n",
>> +			     guid);
>> +		/* set the trigger bit (1 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: set trigger\n", guid);
>> +
>> +		/* sleep to let the HW do its thing */
>> +		sleep(1);
>> +
>> +		/* make sure the bit is set */
>> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: trigger not set\n",
>> +			     guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>> +
>> +		val =3D (u_int32_t *)buf;
>> +
>> +		igt_assert_f(*val !=3D 0xdeadbeef, "0x%x: invalid trigger value: :
>0x%x", guid, *val);
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: pmt-bmg-all
>> + * Description:
>> + *   Because of how the Crashlog Instances behave, these tests are orde=
red.
>Do not use them
>> + *   individually unless you understand the underlying HW behavior.  Be=
cause
>of this behavior,
>> + *   all of the test will be done in order in one step.
>> + *   NOTE:
>> + *     o Testing MUST be done after a cold reset
>> + *     o Once crashlog is triggered the device behavior is undefined an=
d requires a cold reset
>
>hmm I thought a cold reset would be needed if we want another crashlog, no=
t
>to be able to continuously using the machine.

Yeah, I was told that the GPU was be in a undefined state after the crashlo=
g was triggered.  So it was
not clear to me if you could continue using it for GPU purposes after that.=
.

M

>The CI seems clean on BMG where this test was run and passed. But I'm afra=
id
>with this statement.
>
>Perhaps we should get CI team to provide some kind of flag in cases like t=
his
>restart after test?
>
>Cc: Kamil Konieczny  <kamil.konieczny@linux.intel.com>
>
>> + *
>> + *  Test category: functionality test
>> + */
>> +static void test_pmt_bmg(int fd)
>> +{
>> +	test_pmt_directories(fd);
>> +	test_pmt_telemetry_files(fd);
>> +	test_pmt_crashlog_files(fd);
>> +	test_pmt_crashlog_error(fd);
>> +	test_pmt_crashlog_enable(fd);
>> +	test_pmt_crashlog_rearm(fd);
>> +	test_pmt_crashlog_trigger(fd);
>> +	test_pmt_crashlog_consumed(fd);
>> +	test_pmt_crashlog_clear(fd);
>> +}
>> +
>> +igt_main
>> +{
>> +	const struct {
>> +		const char *name;
>> +		void (*func)(int);
>> +	} funcs[] =3D {
>> +		{ "pmt-bmg-all", test_pmt_bmg },
>> +		{ }
>> +	}, *f;
>> +	int dev_fd;
>> +
>> +	igt_fixture {
>> +		uint16_t dev_id;
>> +
>> +		dev_fd =3D drm_open_driver(DRIVER_XE);
>> +		dev_id =3D intel_get_drm_devid(dev_fd);
>> +		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on
>BMG GPU\n");
>> +	}
>> +
>> +	for (f =3D funcs; f->name; f++) {
>> +		igt_subtest_f("%s", f->name)
>> +			f->func(dev_fd);
>> +	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(dev_fd);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 5c01c64e9..46d36962e 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -318,6 +318,7 @@ intel_xe_progs =3D [
>>  	'xe_peer2peer',
>>  	'xe_pm',
>>  	'xe_pm_residency',
>> +	'xe_pmt',
>>  	'xe_pmu',
>>  	'xe_prime_self_import',
>>  	'xe_pxp',
>> --
>> 2.50.1
>>

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E172EC9830B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 13:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2EE10F035;
	Wed, 23 Sep 2026 13:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyAFT1kp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EF510F028
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790169027; x=1821705027;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=evzK6Nx4Co7qR1TqF/SM4p5CZO2RDRBsejQ63mLY3LI=;
 b=fyAFT1kpDkZatZwZMkJG5i1z5j9AZGxq+EPpOLG8QYLwBaty5sADAYkm
 lvLCEMUaW8PNzMEtK8f7ludOvGubklkPk3sy/Q4dAgeNzfd3+qRknMqIH
 tedRXQ99TX9GT7dr7ypYhKhyFhGsuoWUn1gH0Z6nNlFxEz1gfsJeQ1ogB
 qxVm0tFXPMegOmcWI3F+T6bKNYnE9V1qMwkm7oJYZ4Q2C2LvVtFXvmycb
 C5H+/+UT9rHRQVsx5MrRNHMBoNah8jNqrzqyrWvibyAa4U5JkhPXQjBbL
 OSS1COOoZfb0kZ9gtAy19pC4e+Yt8iIvyjnHkrjD5ztirfAui3ALi5+pP w==;
X-CSE-ConnectionGUID: YC44wTdaRO+1ACLLQk3lPQ==
X-CSE-MsgGUID: HlALM25IQNSFBJmztw+ASQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89996061"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="89996061"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:10:27 -0700
X-CSE-ConnectionGUID: ZxxvKArfQ7iNo/4m1pgbHw==
X-CSE-MsgGUID: +nOFmWxrQA6GHBznzDVwVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273801254"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:10:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:10:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 06:10:26 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 06:10:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnzgAoWKo9q/z/C/YPzQWlICxwFhDbmBusBptYgc8DbwMAW73Pg4DOyleJVtg9gEZfD4L7yt/AhoiyVhenFZXTr4CzIJ6AQuO7mFjqg/d1IdZfD2ZrMuQJpXFXe9YOHWc9r13i6xONYlrepNYuW+BtLXUEzEnrWYmP4wrmxIRxqtRiCK1Z6X63vBZU2lb8R+jRENwJPPfwODIDiXkq28q7ccjVa/SiZ3dB8pFm9JgZEOtdJcp73Xcabm0JQtdJI8TCFkXP3gBHmeMtttiwYzJWeMFYUdXW88LeH6lZ9E21c7lA/ny3JxPE4xISDPpE18C5w5jE5VFO2Vi1qJmR5dog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNn9rt80y3Y43vA6k/WtqVJJQKwUOMjFsaxH9JwZR20=;
 b=LkhVdhNE01/HV4O0tusN6vibKJH/9dLJQQASOY23LBlP/Cm8zvEYP62aiDMmzyZbXHrq5vnQES7uHW89PUiojfqMSPEBmGuTMOM9Y73oSme9FtOWKqq4mVKsvueIYdNBEEOBkDaEsD/RJ5CmimBaEWgd2qjFTUpL4OnQkwZVv/4YTPme5Av4K7Iah5RmKskqvnnVlIuqKznOXbg84qtPCQ+J+B6U9nq5cCuvpF3HIc+T3gYC/De2UwY46r1xB12ct/7mieQlGiQQax+LaPIiZxqjC2VxR/j5UnNu8j4R7Yz7GE2la6aYxuW49zl7QVkzBO44z/45bBA9w4XVQDbTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by IA3PR11MB468931.namprd11.prod.outlook.com (2603:10b6:208:548::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 13:10:22 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 13:10:22 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 09/13] tests/intel/kms_dp_link_training: Group the
 outputs into links
Thread-Topic: [PATCH i-g-t 09/13] tests/intel/kms_dp_link_training: Group the
 outputs into links
Thread-Index: AQHdRZTSOYwoTm0Rtki16DTHywQqe7bcLnHQ
Date: Wed, 23 Sep 2026 13:10:22 +0000
Message-ID: <PH7PR11MB679694577C39EB0FB9A678DDE5822@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-10-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-10-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|IA3PR11MB468931:EE_
x-ms-office365-filtering-correlation-id: 856a3733-ae7d-4d05-7c58-08df1974066d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|3023799007|10067099003|6133799003|18002099003|5023799004|56012099006|11063799006|4143699003|22082099003|38070700021;
x-microsoft-antispam-message-info: GmVNd13ZM5cOBY/iq8z0WjzKrirqLHBrUNoFnRTc0kJkO/6TPyj0pqHIAb9+Pl6QGW8menBYYVFuh7PEMhjwAfT0NxnUQmKpSjmF5e+s21h1rdXHGp+tU/faGxX7qrMduIjiqheV3/GKXDcP/QovMt4uqBcAuYIkrYoPNtN5CyLN2O9C5AMqrBosB9bO4fbT89faQDdhKwGtqYoiJWttWEK/U7K+tQHQBUqi+RrUpjaqJKNLi4fggfqzG8akGlIeLyGddpsOfMX/urmoQKC6GEZd/q9WCN6HxWyiYX5NN+Lk/pvNETMn31ncYXBtoLvnvYoVg4gHEK/Wz8yeMhY5NtVe8GgTJ3Em661s+8Zvfbav3OKVD/kbEJoamp6yh6sUM+AIwKrBYZCd4217rpEnIG6nNXOBvQocD3cKbMLgu2cFYDnlkMxyx82GP2SFmGR8GwxDarab3VvNYzBi+M404IiSdVF/J16ZTFmH7opAWfcTcFsCeDb9g60RS37ubHwWpB0fEMQG0v8hF2eYpdDecUq5rno+KVo2KL7WY5u57L6K/uh1Wh0INsAR4oVzTebMiCz1V71kboAc+3W2aTGLbGHVp3wNDmMH6LYPDICyalXWfjXoEqMBEk4vtSiiREew3mPTGhYl/+0rL3cUCSwAGDZd4WwE/otuoKIlCeLd+lYmD2dPLF/0hlc2nGitwiwAJWQhay+47LiuNEeKJMM2ZaDZBuqh5ag1e+1xAX2iEmc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(10067099003)(6133799003)(18002099003)(5023799004)(56012099006)(11063799006)(4143699003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SfurdmNp1JN45CdWJPaAIPnEMJAuv9Le6ZEw1iOwCzTSPkbJKsP8jH1EDxOF?=
 =?us-ascii?Q?6ASirPTGYZD+Xbk/1LLED1ylIqMidvL8SFr3LaxOD4d30olqam/gNwqfF9Ku?=
 =?us-ascii?Q?DUfWZTTm02/o04P5WFGHGtxhT0GXFrWPA+B//sstT8+UW1uuN3qe1UUOj917?=
 =?us-ascii?Q?G7B0bA6c4dBsSOv/BRbvD+F9tTR+g4zsOQJJYmMTzzezFI6u6qOksSkUZ+wy?=
 =?us-ascii?Q?hRwGHd6/OKlbXJB4N+fLE6Q+ieHo9Hi7dZe3bcsivPY7sFC1uVaBp3AjLbRg?=
 =?us-ascii?Q?857TnIwwzTrWGxYAtBCSBYHhZ//hqC7oXp3JqNnQDxmbwTFxADwwoNng6ibZ?=
 =?us-ascii?Q?NwZKxxu5ahfw9huxMcnB3kh5Wj5GFeXA+3K89wi7UgmsddtVBchNAgWjnuRX?=
 =?us-ascii?Q?p9vJT4t30lE/wXvSSQlnVnE2FxJ9YgZe8QV0nXeRqpNimHNtxqWkBmaGa7PV?=
 =?us-ascii?Q?dXVbpFgbSO/+1P/G6nitFIjoNV48eYnlFLG1FLiVGJQq8SR7T6ZGgbC4fz83?=
 =?us-ascii?Q?qI7I9NT2xi1AQF/Cxk044ZRohKEn3wQC1WLQaNsjOUXG90rhcGI973jlOOmQ?=
 =?us-ascii?Q?kZQBkuSRXrHLf3Df+us6XZWxRzboRGLnX2RPsL2u0POJPSbdaWC1omDStnQj?=
 =?us-ascii?Q?JOKsdGkBUL2bhAepF+0MexyQdEw2SHy1uy5mSJsRIWilU8dzQip0OCI4U/78?=
 =?us-ascii?Q?IzA6b5Djx0KtuQIXGvnnZQLa7oCt51EcLmtCKgq+FfdddkchyrOXx49K801s?=
 =?us-ascii?Q?VIuGdR+Ete0QmC/jg/wn4pBGu2EuW8uufoYtRCKe7358Gcf0RsOmWacelwWk?=
 =?us-ascii?Q?ugdhgz4HIXywEG5oHae2gMkEVgsyoV1meXBlnuF4fTf4sg8NOuJo/0MvqQa7?=
 =?us-ascii?Q?MNYcZl/SAq8bOuZYHBlOSSqrnAovYxhB8HLe5hAd3CV/zMsKcjVsbxVBLE9b?=
 =?us-ascii?Q?vF+HvW/HJL0YXpkSQeAkjeEpDjILWfyQGnyzuAPRQuN1KVN2QauOJ5e/vFrf?=
 =?us-ascii?Q?Ij0l42xmTxuV4qtrVtCGAJhq2pEyNdV9HqVP/mF1pWyDy8e7FDnDp7zNrfmG?=
 =?us-ascii?Q?aBOvEyF0NaH9r1CgubSMJNTAdLvN/GJiNIiTXJWVYUW0RnaOoGnw2AFV/el6?=
 =?us-ascii?Q?FeRcklm0RrbOBGsFxIimd4QoOIk4wG7bASy56R+AyJx5Umhl8zBYlUTLLHBN?=
 =?us-ascii?Q?f+HvsYQK5g/Lo70uin5dHk5n6ie+JQO4cIPT435rwdsYLDSElONTKyENjICw?=
 =?us-ascii?Q?6/GTxt0Ljjstf6IhDTAP8333Mqwt6Kk4kEtumXEs/hzl7+Sa/gTlDdkbYKde?=
 =?us-ascii?Q?5S2bIGJEY1Olz7ppqtXbSDOxI5yozZZXlGaNsOfn0hWy2Z+4otYMYLVlj2X5?=
 =?us-ascii?Q?OZOQ7/PLibDr+aJWcb0H+79MuYT5h2+TVoUjWo1I4SjMOI7oBfvrP1ZzNsXA?=
 =?us-ascii?Q?QCXWjnWgmKfeHjpeJxVkWhAllR8MB8dHApdlzW94dVrWz3+pBIcMLHkAHw1p?=
 =?us-ascii?Q?ryUhBKXHESlOW104dNPDO3GIq454ukwMXtMSXZ9hitB1iW/4Cd16TF6fNu2E?=
 =?us-ascii?Q?FoP/u3b20EkHpSS54VCReNNOhDb4GEWebLV1Hug8I+8bTaQLaTf+ypvvGC6E?=
 =?us-ascii?Q?ET+7147djF1r5wv+R0jZmkfEBBbOKyOMoJ0WIaweBpi8qdmfBOcl/apxhNdL?=
 =?us-ascii?Q?frxpmct3MVpPthwfg/c5/x5aruIcuSc+CKl2DLnvKXcnud6e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IAqudidx1p2Dr9YiQBWP4TYoz+1JX3hX6VdRRjLu8rGuYVnBJ9SMJOq6M5QPGjfbT1x9P+4ENBifI/X6Mr9S2ly0f6XtJO8PUjeMq1Wze4zYFSfsdLforsq1pq0aPdVOlWwvB00zRpzneUMxzRWDVAyFQAnaCrUb/S/E93Zc4Q5GwAR+mCuY7ehKpei+ZuYMa32mA0yYzMeApWWyoM3S/IX2xzFghCEnx32OIvJzaxO6Ahsb5mSGhPqKVoIMHsDJ7l0e1TJbRYw/ZWwvwX57itCAodFEABVeTQG42lvzxd80LBbURAKiuFI3y7Y1bzK2jp31aF5bb8Hczf1khTtPgA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856a3733-ae7d-4d05-7c58-08df1974066d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 13:10:22.4565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w26FlYg/LBKSzqJLX9UvDqB0Hddc/QPgDsy1DzXEz/Qm5Tbzwolse+vY6CmP1ex+J3+gwWXRVv4HuIy4QMZKmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB468931
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 09/13] tests/intel/kms_dp_link_training: Group the
> outputs into links
>=20
> The output loop walks connectors and decides SST or MST for each one, so =
an
> MST topology is visited once per stream: the classification is redone eve=
ry time
> and the same link is trained once per stream, since forcing link paramete=
rs on
> one stream affects the whole topology.
>=20
> Collect the connected DP outputs into a list of links, where one link is =
one
> trainable DP link and a whole MST topology is a single entry represented =
by the
> first of its streams, and record the protocol and the connector mode once=
 per
> link.
>=20
> Stop collecting rather than fail when more links are connected than the l=
ist
> holds. Discovery runs in a igt_subtest_with_dynamic() container, where ex=
plicit
> failure is not allowed.
>=20
> An MST topology is now trained once instead of once per stream, so the
> dynamic subtests named after the other streams go away. They were trainin=
g
> the same link at the same configurations.
>=20
> Prep for subtests that select links by connector mode.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 111 +++++++++++++++++++++++------
>  1 file changed, 89 insertions(+), 22 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index 812c4b6bc..e6160cee5 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -39,6 +39,8 @@
>   */
>  #define LINK_RECOVERY_TIMEOUT	5.0
>=20
> +#define MAX_LINKS		16
> +
>  typedef struct {
>  	int drm_fd;
>  	uint32_t devid;
> @@ -46,6 +48,18 @@ typedef struct {
>  	igt_output_t *output;
>  } data_t;
>=20
> +/*
> + * struct dp_link - One trainable DP link.
> + *
> + * @output is the output the link is driven through, which for MST is
> +the first
> + * of the topology's streams. The classification is discovered, never ch=
osen.
> + */
> +struct dp_link {
> +	igt_output_t *output;
> +	bool mst;
> +	enum i915_dp_tc_mode tc_mode;
> +};
> +
>  /*
>   * check_condition_with_timeout - Polls check_fn until it returns 0
>   * or until 'timeout' seconds elapse.
> @@ -532,42 +546,95 @@ static bool run_link_rate_test(data_t *data, bool
> mst, bool uhbr)
>   * early, then calls run_link_rate_test(). Returns true if it ran on at
>   * least one matching output.
>   */
> -static bool test_link_rate(data_t *data, bool mst, bool uhbr)
> +/*
> + * discover_links - Collapse the connected DP outputs into links.
> + *
> + * One link is one trainable DP link, so a whole MST topology becomes a
> +single
> + * entry, represented by the first of its streams. Forcing link
> +parameters on
> + * one stream affects every stream in the topology, so training a
> +topology once
> + * per stream would train the same link repeatedly.
> + */
> +static int discover_links(data_t *data, struct dp_link *links, int
> +max_links)
>  {
> -	bool ran_any_output =3D false, is_mst =3D false;
> -	igt_output_t *tmp_output;
> +	igt_output_t *output;
> +	int num_links =3D 0;
> +	int i;
>=20
> -	igt_skip_on_f(!is_intel_device(data->drm_fd),
> -		      "Test supported only on Intel platforms.\n");
> +	for_each_connected_output(&data->display, output) {
> +		bool mst, seen =3D false;
>=20
> -	for_each_connected_output(&data->display, tmp_output) {
> -		if (tmp_output->config.connector->connector_type !=3D
> +		if (output->config.connector->connector_type !=3D
>  		    DRM_MODE_CONNECTOR_DisplayPort) {
>  			igt_info("Skipping non-DisplayPort output %s\n",
> -					tmp_output->name);
> -			igt_info("----------------------------------------------------\n");
> +				 igt_output_name(output));
>  			continue;
>  		}
>=20
> -		/* Early skip if MST vs. SST does not match. */
> -		is_mst =3D igt_check_output_is_dp_mst(tmp_output);
> -		if (mst && !is_mst) {
> -			igt_info("Skipping %s: MST requested but it's SST.\n",
> -					tmp_output->name);
> -			igt_info("----------------------------------------------------\n");
> +		mst =3D igt_check_output_is_dp_mst(output);
> +
> +		if (mst) {
> +			int root =3D igt_get_dp_mst_connector_id(output);
> +
> +			for (i =3D 0; i < num_links; i++)
> +				if (links[i].mst &&
> +
> igt_get_dp_mst_connector_id(links[i].output) =3D=3D root) {
> +					seen =3D true;
> +					break;
> +				}
> +		}
> +
> +		if (seen) {
> +			igt_info("Skipping %s: same MST topology as %s\n",
> +				 igt_output_name(output),
> +				 igt_output_name(links[i].output));
> +			continue;
> +		}
> +
> +		if (num_links =3D=3D max_links) {
> +			igt_info("Skipping %s: more than %d DP links
> connected\n",
> +				 igt_output_name(output), max_links);
>  			continue;
> -		} else if (!mst && is_mst) {
> -			igt_info("Skipping %s: SST requested but it's MST.\n",
> -					tmp_output->name);
> +		}
> +
> +		links[num_links].output =3D output;
> +		links[num_links].mst =3D mst;
> +		links[num_links].tc_mode =3D i915_dp_get_tc_mode(data-
> >drm_fd,
> +							       output, NULL,
> NULL);
> +		num_links++;
> +	}
> +
> +	return num_links;
> +}
> +
> +static bool test_link_rate(data_t *data, bool mst, bool uhbr) {
> +	struct dp_link links[MAX_LINKS];
> +	bool ran_any_link =3D false;
> +	int num_links;
> +	int i;
> +
> +	igt_skip_on_f(!is_intel_device(data->drm_fd),
> +		      "Test supported only on Intel platforms.\n");
> +
> +	num_links =3D discover_links(data, links, ARRAY_SIZE(links));
> +
> +	for (i =3D 0; i < num_links; i++) {
> +		if (links[i].mst !=3D mst) {
> +			igt_info("Skipping %s: %s requested but it's %s.\n",
> +				 igt_output_name(links[i].output),
> +				 mst ? "MST" : "SST",
> +				 links[i].mst ? "MST" : "SST");
>  			igt_info("----------------------------------------------------\n");
>  			continue;
>  		}
> -		data->output =3D tmp_output;
> +
> +		data->output =3D links[i].output;
>  		igt_info("Running link training test for %s\n",
> -			 data->output->name);
> -		ran_any_output =3D ran_any_output | run_link_rate_test(data,
> mst, uhbr);
> +			 igt_output_name(data->output));
> +		ran_any_link |=3D run_link_rate_test(data, mst, uhbr);
>  	}
> -	return ran_any_output;
> +
> +	return ran_any_link;
>  }
>=20
>  IGT_TEST_DESCRIPTION("Test to validate link training on SST/MST with "
> --
> 2.25.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9509EFB5EAC
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 03:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4AA10E57C;
	Tue, 17 Mar 2026 03:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIxB7N3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A19D10E16B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 03:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773719263; x=1805255263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RzytCc3Z5DLiZE3YwQGi5pLoAiBKXsjA8l652MP335M=;
 b=YIxB7N3oe8wEzLlXjAHqsuQZa/jDAsnSWfym0w6q9PclF40gnjb7/TAN
 WKmij8B1pqf3eAyLVv8R7QSseovbnwUeJVqGefPoEkLQpP82Q0B0fRKMq
 9mJsjrOrdWdMCal5cEYTzUesIo8JCYWNKnpBol2oj/pJfSpJXxHl4Hz7I
 znJh6jw87+uLREgDk7arrdcYpXVN/szWspBN7j72MFpFLz00yuyrTIN2v
 Efqet9omRlVCfUCI2GoaOaldp3bTsH6RDMU5X3kBn8LIhJGJhrg+Qsexo
 DKgYrC3vvwewx3ikTx/COex9xOOP9JEIphlYPTSaCkgmh0eVkPLrb4vCM Q==;
X-CSE-ConnectionGUID: 2FrkRilGSeWD9jqmiaEx/Q==
X-CSE-MsgGUID: 1HDj6Uy4Qpmj4QybEFyaLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="97353263"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="97353263"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 20:47:43 -0700
X-CSE-ConnectionGUID: 6r1S4yvFToO9cmIktw8M+w==
X-CSE-MsgGUID: CKvpG7x2SzGX7ErKHVx7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222343002"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 20:47:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 20:47:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 20:47:41 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 20:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODmGGdNmTAx3WCG6T4ji0D3CMovkwGZ+0ohoyOEmBUstRWRra+7VEccQ6CdDOluPqCGA2bg+2/ugeYj2+h3beou80jItHPZcvBM1ksvOaaap2rOYFCW5cEJyw4i2BWS2qNSABNMdb05AUQTwzWsUXjqp+V7MnXJ0MDaGr4OkxZfHlezOfFGdvVg78IstOs2085eyPQ4VfDkyCqV6b9TjkQLID63jx3EfRybBjiq+RwdaAceEx6JcAQBkNzouhG7ylRC3fH+C6Ia9uX8OFDfA2vIse4s3hzKNB5M68J66Rq/TXRUwOod5DyCY3B9SpGv/hff6OkWfPlwQkHdvtVu2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/ipVBHfBUQVMIsir7O240hkBPwjJ0I1Is8LX1CD4OI=;
 b=ZdZe1phVoMK2CTrfxk42DfqF4TGROtoGSXy1Dg1YwciRm+l4EZuPbSQ+nKrcHlU1R/6s7Ho6WmAU13FHl1P0KS8QllLbDH76MuHy+xeFUCjJKnMn0hUY4CwaTduNPnXAllFaYh6jhSI1luX7wkdp8ejTOKB6vc+pMthv9irORTXrSlLYBtGDp+7JB1mTTxgimH11qp6vOH6jvreA4OJ+WflT4l9nAE/g+3NH0hVoLvhj7O5rSnvQwwqrhBhradOcrCLI5PUh+YmGbSdxmY/4slJ8cwwQwmX0jXOppUrjHzMGxAlKXCAPZKyu5CXKZL9H0v0drh7yPLSgkuY81xpopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 03:47:36 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 03:47:36 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_plane_scaling: Use selective modes for
 scaling checks
Thread-Topic: [PATCH i-g-t v1] tests/kms_plane_scaling: Use selective modes
 for scaling checks
Thread-Index: AQHctXX6xeSKkqXU0kGF4pu14e3XGLWyFeCw
Date: Tue, 17 Mar 2026 03:47:36 +0000
Message-ID: <PH7PR11MB6796C460ED57DD0118464AC1E541A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260316185218.700329-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260316185218.700329-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: ramanaidu.naladala@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SN7PR11MB7065:EE_
x-ms-office365-filtering-correlation-id: f0f98dad-a323-4d3c-3cff-08de83d7edf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: FG1h/l+888DmbqARSATqTECxUuWcc8KXl8RX9M65UdWzp8LXCZyEQaJ+WwbdaUvqzk62MwfLq3hHmQIhtHZEBOCRZXtc2kdSb/UjxdSYd5Ao2A1JhdlHDtnia9QAKWHv6XMnbIjE4ON9rM5oLtWiMM2QVTsFV4fG9EwXe4rm0AcP4T9NU8D5Z6FWb6+GCYBeUhh8WcgERdvxo5AFip6FwgLrhrTh3ylAgRejJyJ1EAPATSZkSJB52H9V6NzAYPZq/7B8Mht4Mi/V1nVgvQWfNu/TMNDdQx2B+v6BYZbn7tDKRE6jnxym/qh01/0rVxrXrK/mZSgy6gOTUdMAYpIBN/03foCHPINiSFJNcDbC0XsFKIiX8j0jfCKCxl53ScvdVDMP76DTK0Knc7afcdbEgNCyW80utGziIY6PCZwG6xZtpE1YNoRqAhvX8mtIwPegxsNtDHgkDhK7kKHBBmgiakMHN6tI0LTrL7yXkUP8Gd7XF722EdQ/43FCMgn63VXeD1p6XL3WtXznaJYAf9uFGhScuVUKvLhCgp4WdRUftqyT8qnrMLjOh+DplSxMSwQDoga7YccZ7k1qli1Csfygy7FhW5VagUCOCCyzE/i7WJ6XfN2iOISTJowj/MtoV/gfgq+Efa8LkU32aUuc1606a81BLZUTo2Cpi1xEThb7+6GbzBmPsk9dxbLCLWzmCjxZs9VlRx4zMG0ttnOLGfj78qqWnZfD8PKAUdpzbv4gsGGWjWQWxae2Jp8rGnPqu1/pfyHmTU+A9BSG/kQs5K5jrWSowPEgYwPXu5XCbjHMZVc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BWg7w//dD/G4s22emEhr1YJgLi5VkgoAJ/AjvE7fOPG/c1VuAIqPx2VZbGGY?=
 =?us-ascii?Q?yQS21gMhmi9byTgUG7bUVffbR+oY8HI75FePiXxdGm7wjGE0DD5y/GPWjRKe?=
 =?us-ascii?Q?syEOoj4ik5azGTqnWlkBWv/APjEhe1P13B13Sl2EEHuueTqd1q38l/+rpxFr?=
 =?us-ascii?Q?NQ2kWeqydE8/kOOwPZRaUP6tNmPPVnzbaq8sWVKYDtFT6fBZiD2IYbWFwXHF?=
 =?us-ascii?Q?T116bDzZ3OlxjbvVk8+zx1HFDEhwF/Ip7D6iilXV/GTA4N/2NP0rLYKeIu22?=
 =?us-ascii?Q?/9N/WXm7rEpAlboVu+1xjAJrKQnaduyOgFwwepZa1wEV5Eke/bzEVgJniroQ?=
 =?us-ascii?Q?K4H53k8TJfIrKR9wjoLjwqakOG+6XSISAmdR0wgae7vcQCv72K7DHMRcWkmo?=
 =?us-ascii?Q?u3XJ+i/Gs66koRCRl3EG1dC6eBTK4dvj8nayiTbJJUP5UnhHv4e/tkXkc0RL?=
 =?us-ascii?Q?NfKUdG2LM1sMq8G2gcIQ5xj2CYt0TNFomeAjdTOoZ2T6hSMDRnCoae4fwSdz?=
 =?us-ascii?Q?5YvdIJ5W/1dsAnFI9KrXR+Uqpu5Eu9h4hf/jTP7QeDRRRhvoAwFFF1+rBvk6?=
 =?us-ascii?Q?7b1emsO1P5f2Dlwc1LN2meXZP3mT5AARQlcSE4q6YZ9gxGtfRz1v4W/ZYHj+?=
 =?us-ascii?Q?tccJNpnhgrOm3LqZgFFzK7k9fedWuBXSrywN6SjuWkWUxjDc8v/kEQN7rav9?=
 =?us-ascii?Q?Q6dMQaSy2n6OT10nUe2TBdMpsKaN35KEFGnesSxgRM/mWXvw76hxnxLmCv9Z?=
 =?us-ascii?Q?Dd4hRQNcMVbHupCb+b4jwrvAV0NuXMkZIEcYpiEmfq9eAjO+zydH+0XJWFO6?=
 =?us-ascii?Q?1qRB8kpO/mX9LcQ21YrC3k+8L8cAMm5LJu0SkDAW8DPwAxPL2uDCmQQgBfpf?=
 =?us-ascii?Q?kF/Q+6jIftLfdtZqhpKUjurCG425NkbTBgslHKDT7p3SicR8boxrY00E/Nbn?=
 =?us-ascii?Q?M7gcR01/nfN1tvClbdJghDyPTQ5zb1qJ4fsQem19XzAH0DkXq/G2IRimsBrD?=
 =?us-ascii?Q?a7y3WXRS8iCNyyu+3UTE9PCbz/mePSNlU5bufKDQZ4plFdSwNtihwi4SaCRH?=
 =?us-ascii?Q?SxE9LfH0/AzjqcOkdOHiwmp8rmUpPz5BOBu37WwWn7YhDI7zUMbn6627dIW4?=
 =?us-ascii?Q?E4TTsWCRNqze8IFJ7oGBaGcW53n9U5AJef9r83xqDDVA0f9aCjzppXAezCzd?=
 =?us-ascii?Q?WYlh2ry1VEYMUW7L8JesbZh0uB/RB7c1SgPlMkDr7djG/OO3OPHRpcj0CHsS?=
 =?us-ascii?Q?LQCJ5/umGCAyQyhT6BWshqVZFu7WmTpDnqgNwVlARXMEU6eab3oUdxWqi6iq?=
 =?us-ascii?Q?H6rH9Rl41vcRfTmEu3KcqgQ9V8sGau5Cx8Q9Cia6x4eJvBly1yrNQG1kn7ep?=
 =?us-ascii?Q?nSDvNuMd6EVBwEdR9xsUovw5sgDJkGGO6yBZb/mhzAfynPFyBcu7zJilDkYN?=
 =?us-ascii?Q?seTXOBz21DzIly/uhKYcLa6wXsirIRn3Aj/TyRNxwZa3qrvQhJlhGoTkZV0w?=
 =?us-ascii?Q?VyKEdBivKNYLPYoAt1tOr2A4cz8kEtjPerw15ly+kUIskSxPLFpwfhjWRGKn?=
 =?us-ascii?Q?4gtvf0wgwANCJIbVJm9rJWbStTaRNN2wwIwicD3hVkKuuhBcVdBOlyCnEl8g?=
 =?us-ascii?Q?VQE1MxMe+jKrx/tKpQNjUZ8Ztqd9SxVfMgnZCVj9OGwlGUiUJf+gZ/bkr71O?=
 =?us-ascii?Q?7VSrb4j8s7sTMMUqDhe3avMDsPWnbm32UOdSXAKs8kenqll5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bYGJbxrGicCw2tRwOyRoW9nO1a6IiWsNfDw9S5FWh1H1i8lxxMkfPhVmsp5MPVT43L5qDqHHA1Z1l0PDc4pSOu2MjYNRpplhDgWFIzfNBrRzW/grR8hPXOON7GS94VdIhwhAKXKvUbvDxhDqLw0srEWO9cfRVbGrKUz1Uc0rQXGH9n0JtQH243XhZ9s1eC/EHXMXXALBiXpXlbNy4Je6gTGXT8t2yMSXrW3YqC2LA/YPUg6PEapVd6nieKndvziVpEgug64mTKGIHYGX+2LwT41gN3qOKWNw/8h/KanTzbBy6+2NE6dxywCIk4ucZtDfYGFkjJg9p4NHy5eUfqwSMA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f98dad-a323-4d3c-3cff-08de83d7edf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 03:47:36.6074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOYQjoK/WliH4XOg1mz+WrxmBPkZ4m9zbblbkjzgm+VWB7sV3prxW/dnNYP89Uo5CNprzRyExoGSlvvdaODang==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
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

Hi @Naladala Ramanaidu,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: 17 March 2026 00:22
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_plane_scaling: Use selective modes fo=
r
> scaling checks
>=20
> Update the scaling test to try only three representative modes:
> the first, one from the middle, and the last. This decreases test runtime=
 while
> maintaining adequate coverage.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane_scaling.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> ab619fb2b..33546d5bf 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -584,9 +584,15 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t
> *plane,
>  	int commit_ret;
>  	int w, h;
>  	int width, height;
> +	uint32_t mod_count =3D output->config.connector->count_modes;
> +	uint32_t index[3] =3D {0, mod_count/2, mod_count - 1};

The patch must check mod_count before computing the index array, otherwise =
mod_count/2 and mod_count-1 cause undefined behavior when mod_count =3D=3D =
0. This may lead to division-by-zero and out-of-bounds array access.
Sometimes the connector appears during enumeration, but the driver fails to=
 retrieve any modes for it, resulting in an empty mode list.
Regards,
Sowmiya
>=20
> -	for_each_connector_mode(output) {
> -		mode =3D &output->config.connector->modes[j__];
> +	for (int j =3D 0; j < 3; j++) {
> +
> +		if ((mod_count <=3D 2) && (j > 1))
> +			break;
> +
> +		mode =3D &output->config.connector->modes[index[j]];
>  		igt_output_override_mode(output, mode);
>  		igt_debug("Trying mode %dx%d\n",
>  			  mode->hdisplay, mode->vdisplay);
> --
> 2.43.0


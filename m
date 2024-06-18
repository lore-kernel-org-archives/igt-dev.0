Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5A1C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0515010E5F4;
	Tue, 18 Jun 2024 08:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1MiCG5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183A210E5DA
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718700393; x=1750236393;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vYkC3mSDwI0sljgywpT0H7hvNqwlJX+XGoaZp00agDI=;
 b=i1MiCG5jIicCWshCmACvx1S3yPCIt9yYmlrt3yme1wfwkjV5AIKMyH2w
 V0bb7bUyT0tLtR6CUYdlj4znIDR8k8D98aSP/0oUa8Zembrpjs+WEw70W
 CvNV0IyQShQFvjUv6fGIF4hozZo3n9ni4wEABBW4Gr60/OBnRxEe5+Po3
 syO+V26OKLjYQdsyi4/vPbxs2GkMe+7qwf23RKET9G++E9Q5HDQGYN8eU
 HXGMsZaAXqtzc+lPYgFZ/ige/Grwh7A4R3hWCuvm362aI1kQlfAlqvnrU
 rri1vUn6p33CWzF6hg1whY4w5hgv81ZWteBVYWTXFMDfY1rgsvUsQvrA0 w==;
X-CSE-ConnectionGUID: lt45ez7rRMOqnDJhjSMSjA==
X-CSE-MsgGUID: ToLdggT3RLiBr/bDbC2Qkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19343030"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="19343030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:46:33 -0700
X-CSE-ConnectionGUID: GHVS+m0TRziBcH5IaVgWDw==
X-CSE-MsgGUID: B0Y4ARVVRiyRCslbslyvlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64701912"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 01:46:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 01:46:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 01:46:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 01:46:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DD6/gy+BHsIhIoPiCHT0/DDtVa4dFf6bnu8PKWIOOsFaEzLuZq9wMqZCZilqaNftvzdSCZBuigkQZDku/+dYJOPz58mHfdjT/cgVrhRAYpR6zy0ZkZn4GBbzbvdgDFAEjvrbI5E6eJPZG1Nf03tAsIEHUb1ClpbaXZ35vpA4E/fa3q0x9WhhAAQJqQVgSCU+QHlRclqX6vCr+pYC0IAhK1w0/qCZW3P3pcYLUoeRDAt4tGmB+H0GyCWSgYItOrxmCKjBf91w3G4O1WkfkAzd3S6wSw2GjvgcO7iqA+FetOaHBPXewXhoH3Gh5pZsP3BOWjKb0znsfO0x8cTDly6Eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jO+9o8Gf2PnnstkWbrA21Zcgw58gS0EcaHKKnHZXPw=;
 b=bfvCQyR9FAbNmOBaM9z4K7iSZJv0SOlFn3QbmldYTGGx97OwXCHWbE7X8Sy0oCOqLPR3j1KQ/qBlBmu+Af2E8FLVxp/YgqsaCIE+HgNpiXcIP4y7c8mpMHwQpjEOQmShBwHtZUAnNDG6wHSdvne1kon1Fer7y7DbbroUEz6CR3gE8gYMqf4AzAzFBymlOwzwRgFSlZ1vQU3sWnH4ePqwQwcMStma/P2DPeS/QZ7ZxULTPqw95HN8FYPeQMLY64THdCwX96ssGZvWsARb6mDDPvHE2FkUuebpwbVI9DALxktOuofZmGVlwUhIPi61WeKZ9XsNZp0OlsZKOvIfq6cluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB6784.namprd11.prod.outlook.com (2603:10b6:806:24c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Tue, 18 Jun 2024 08:46:29 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 08:46:29 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V6 6/6] tests/kms_hdr: Use lib helper to check the
 pipe/output combo validity
Thread-Topic: [i-g-t V6 6/6] tests/kms_hdr: Use lib helper to check the
 pipe/output combo validity
Thread-Index: AQHawUlQAErHAkslk0qIIBLXZu2QorHNNWaA
Date: Tue, 18 Jun 2024 08:46:29 +0000
Message-ID: <DM4PR11MB6312892707EF27F05CFBCDD890CE2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618062405.4004955-1-bhanuprakash.modem@intel.com>
 <20240618062405.4004955-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618062405.4004955-7-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB6784:EE_
x-ms-office365-filtering-correlation-id: 61081a0b-4265-47fc-6aaf-08dc8f7325cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?Jobw5Ul0fSHG+R65hj3zn3PxfqvmwZg5PjGvWAIQ/h+pGlcqO+sxVE9BfvaW?=
 =?us-ascii?Q?yvb+K27qn68ZG1fttqmeDXSfaWuq/ta6Fx6uvYRAFs6FGuFcTbYujr6uYm6l?=
 =?us-ascii?Q?qWXyGmcX8Y5jyQktvisBD7iEnu41OkthSuCDGs7h9d8nd9YnYyDLdSkjZBd0?=
 =?us-ascii?Q?HkVISCzLsyRl/ZU9uUtHebiygeamPTcnttlahBdjOC1dTSE+ONoejbLz8woS?=
 =?us-ascii?Q?ujrqKftqdqljvs4djQBP6m0NaEojrbxBKFCssluHmwGSP4szDZKbYP6Ar0sa?=
 =?us-ascii?Q?cIWGuopRF2zE6Y7EoIOBDj1ZUt2g1oum+QnsJiTGX6zUST2U/ecn04boSpjZ?=
 =?us-ascii?Q?dbha8IhxkubanonjiAswAtDhanEfG5HURbUemOenTDhKsEGntTfGsmDgxvFw?=
 =?us-ascii?Q?l615dOmpOBckoP/p4X9kzfMbzzhIyeyG9m6hWR3G/wyW2cdeD3wHI2gw9bvG?=
 =?us-ascii?Q?5Va7eLQJAJD/4XXZ2p+D5tGldW6tvKxA4pDlg/5fpqhgiksR/QqvyHpVaNsB?=
 =?us-ascii?Q?d3GMRjVYlgVvXYtnBMDsR2C8iMJn+CMkrX6uLyNFzRcUf6HTR+yXnPj9MkZv?=
 =?us-ascii?Q?ln97yeiEWXoWtrR92lIImnMNnn/KmT7Wb9i2G61mqoUFwzgbxCQV3wggER7S?=
 =?us-ascii?Q?9LVhW9lAI1Emfn6MA7MWX5VaE2fy1BeZf/nVnDY7qATA4nkkUiILoeheec/C?=
 =?us-ascii?Q?KCwCFPjMtHEi63pDTGBXsndbGz5XS0mzU9O7p7oGBgHmgj5vVxaeACD6Ey1Q?=
 =?us-ascii?Q?6r++1BOsoorQi3CfWlHnU+ujjzqca9UqMeUiqpAeOqNVKSE7Tvu4BqAb8quQ?=
 =?us-ascii?Q?mE6fC4QfNLJRPae+6Z774HoJPgTB2Y3OzvEkuw6wjBYvZsX4ejqYxw7YYjMx?=
 =?us-ascii?Q?yTr6Qc/wfDoGSmz7sI6U37s9tpjVeYAzXqZlLHK3nhk6A/ohXFyLSnsSVYQ2?=
 =?us-ascii?Q?S0YxIqob5WXDEeMu9uNbS68ZOmX/hKKACX/NXzdcyca32KbPwqy9ZlgHp+Us?=
 =?us-ascii?Q?YbUuXwV8R7Yx2W+y4s1ALFpOkUEhPm9DE+tjVfbfyNgwoEw4dbF3y2Aalpze?=
 =?us-ascii?Q?TWsjQGRAgD75TltZoorAL7Mr9h5LndvFK+kMUYXwv5z8ryQPAkaSI/+UPNnd?=
 =?us-ascii?Q?m+i0facOipgHRAwivkUOEga+I3MiJPWU1jeePTrYcqrWyDzKX+sLB+Ft7Dr3?=
 =?us-ascii?Q?sbDq00KsELwq59wkf/bT0HviAY0eyFaXi06lM9AYELk0qBbY8A33B1CZakta?=
 =?us-ascii?Q?a9hmpMaKg9VFtpAMl2nXlnTH1t26qx+MSksAEFvibbz5u+8xOI49JXUUBq62?=
 =?us-ascii?Q?BNR+MvvBO2nXNhPGUOtpePAz3KQZA3S/UW7hGAzwFMrf+dfrpvNU8nTlME1x?=
 =?us-ascii?Q?Xw2C7PY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uKfO/PQIGG5iJXdmdguBoujCARjtn+JJmavj0lier8BKQyTZr4kkmj91wvlU?=
 =?us-ascii?Q?aWcVjlrZZY7j2UGmfMdGniilrEcgk1CISJrSQZwjjdikGpc8qW+Bl0IE+Ua7?=
 =?us-ascii?Q?EAE/ljwclASbnsbXPN1IIIPLDxFgwrkLcXFMxjNhYnrweY+6TOVSULnJCSL5?=
 =?us-ascii?Q?m21SEDFNIQQJ44q8JJ6grsrA7yyJHe+IjrdvyWPX6UuM84zchnXeagKtZgUL?=
 =?us-ascii?Q?Jg/WGUx95iRCwVBllMDNWptNaqDc492YLGUIjLvyzORbDmtvjp4NK2OShUJv?=
 =?us-ascii?Q?Og01vhJq9UNv37nNKZ/7Uk7HTs2EuBDchvqmPZ5GobJoDanpc5E8tBoehBQw?=
 =?us-ascii?Q?hfq0B3cph5CYA/0Kuar27rD1o824MyNkrLK5PNPYkpLQ/k8YDeRqZM0tkKxz?=
 =?us-ascii?Q?/puIybR/AyGGxxJ+ho/S9GQK9w7CMOT/DhgibUHPihtJs1PcMiWrGy4fdtNc?=
 =?us-ascii?Q?qkryl719slYbbn1gN1T7xIITNbOL3JDdyq4Xe2zLjxLPxOglMevBnsElF7WP?=
 =?us-ascii?Q?UikvEVevbar0dQy3Vs3VJAPnewUHb/dZAY8Ma/sGjLMRuX64dBnBTC6px7zZ?=
 =?us-ascii?Q?G1xA25ozbSY/4TIb2+9B7bLDh1oq6v+IViFoDoysgesCmM1A/5r7wvm+c1l4?=
 =?us-ascii?Q?G6LEBaehkFRE+yTjrLQb1C4ZLEBPcpz3C8Q0QKVu8Zn8lUcdwEKdJjO6z/ft?=
 =?us-ascii?Q?jzQQV3jj50IuEEAfkJFmMoHZ/gTAHwxOmRKJGKlwzdUhj2pPxGci5KBbxpFk?=
 =?us-ascii?Q?yvIu1Ro0GXch9mt/m0+8sBFcb2ihL8nPAzooxdhmZ7r298/0xHLjEUs4Ap7G?=
 =?us-ascii?Q?LgjneKvGeiqNz5LfwCZUiJchVY/LTqddFlwDEaEoq3zdtMTHp890v0xb3HSt?=
 =?us-ascii?Q?WL1HfIePHS8Lw388N+uXuZIL4RNtsflkaEXTSR7tKNG6O+pnM6UVnBgxo/Zx?=
 =?us-ascii?Q?tq6wtDUiTDvmI3WImk2kXZdaAyZO6bTNiiVYKQt2I/lmCstYF75x49fMosRJ?=
 =?us-ascii?Q?8dUCyP/cuwnnSyhw+CIHJPbjBdH9/P58/JdpZP9Y7TjXhkfVWU/lfKKXE8Do?=
 =?us-ascii?Q?CZfEXKHO/6UMkogZQJWhWa12lCUW9iJlvWtCp27qJ2NLS8ajDDun7wt4blTN?=
 =?us-ascii?Q?9QmIAEVb/vyDo4zWzGEt668rLg40hfwXMrMXxfc8VFgUl3Zpkl6511tN9VZI?=
 =?us-ascii?Q?BIfN7riunVy7SPQP6A4L7btZJ9uLLdx7GaplRhf8ZtbhbEROV1iw95YD990w?=
 =?us-ascii?Q?3vpuVjtq1nex54juYrsaJlkOyOS0U0MuXJ5iMidbFPWhz91Zc8vLA3F8R31w?=
 =?us-ascii?Q?cTaHQ9v6He6v/bkYS8fMRzQe2RPp56uKEvwBQ0+G718+gkWrCHrHyH7fmQH5?=
 =?us-ascii?Q?VGe+FBShKea/4/ICuhOn4STZuxQ+XfKDlvqagDOi8v8ZIqbxGrZuREpBxVOQ?=
 =?us-ascii?Q?XzfEjM2LV5SiRYh39IUKu7ZJ6hPKk46MZJj19Sd33WWm77gmsH51+8HIzsJJ?=
 =?us-ascii?Q?8hYv4EQccTzHv1eHJBeBCDExIH0ZaiSYEwv9amE7WESBTQZAz7kPpDInJ9T3?=
 =?us-ascii?Q?zSvrR2PQEqAfNNVUL9Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61081a0b-4265-47fc-6aaf-08dc8f7325cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 08:46:29.7566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2DddCDRP90JA7NfDLt1fGCItnQqyROFRuiXloBCGWggsxv9U1h2jGrWVewRH89uPi7Wxh50ZaaSF/SH/9Ii9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6784
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 18, 2024 11:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [i-g-t V6 6/6] tests/kms_hdr: Use lib helper to check the pipe/o=
utput
> combo validity
>=20
> Use IGT lib helper intel_pipe_output_combo_valid() to make sure the selec=
ted
> pipe/output/mode combo is valid.
>=20
> Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_hdr.c | 90 ++++++++++++++++++++++++++++---------------------
>  1 file changed, 51 insertions(+), 39 deletions(-)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index 99b78f7ef..475463c21
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -261,6 +261,8 @@ static void test_bpc_switch(data_t *data, uint32_t
> flags)
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
>=20
> +	igt_display_reset(display);
> +
>  	for_each_connected_output(display, output) {
>  		enum pipe pipe;
>=20
> @@ -271,26 +273,30 @@ static void test_bpc_switch(data_t *data, uint32_t
> flags)
>  			continue;
>=20
>  		for_each_pipe(display, pipe) {
> -			if (igt_pipe_connector_valid(pipe, output)) {
> -				prepare_test(data, output, pipe);
> -
> -				if (is_intel_device(data->fd) &&
> -				    !igt_max_bpc_constraint(display, pipe,
> output, 10)) {
> -					test_fini(data);
> -					break;
> -				}
> -
> -				data->mode =3D igt_output_get_mode(output);
> -				data->w =3D data->mode->hdisplay;
> -				data->h =3D data->mode->vdisplay;
> +			igt_output_set_pipe(output, pipe);
> +			if (intel_pipe_output_combo_valid(display)) {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
> +			}
>=20
> -				igt_dynamic_f("pipe-%s-%s",
> -					      kmstest_pipe_name(pipe), output-
> >name)
> -					test_bpc_switch_on_output(data,
> pipe, output, flags);
> +			prepare_test(data, output, pipe);
>=20
> -				/* One pipe is enough */
> +			if (is_intel_device(data->fd) &&
> +			    !igt_max_bpc_constraint(display, pipe, output, 10))
> {
> +				test_fini(data);
>  				break;
>  			}
> +
> +			data->mode =3D igt_output_get_mode(output);
> +			data->w =3D data->mode->hdisplay;
> +			data->h =3D data->mode->vdisplay;
> +
> +			igt_dynamic_f("pipe-%s-%s",
> +				      kmstest_pipe_name(pipe), output->name)
> +				test_bpc_switch_on_output(data, pipe,
> output, flags);
> +
> +			/* One pipe is enough */
> +			break;
>  		}
>  	}
>  }
> @@ -614,6 +620,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
>=20
> +	igt_display_reset(display);
> +
>  	for_each_connected_output(display, output) {
>  		enum pipe pipe;
>=20
> @@ -635,32 +643,36 @@ static void test_hdr(data_t *data, uint32_t flags)
>  			continue;
>=20
>  		for_each_pipe(display, pipe) {
> -			if (igt_pipe_connector_valid(pipe, output)) {
> -				prepare_test(data, output, pipe);
> +			igt_output_set_pipe(output, pipe);
> +			if (!intel_pipe_output_combo_valid(display)) {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
> +			}
>=20
> -				if (is_intel_device(data->fd) &&
> -				    !igt_max_bpc_constraint(display, pipe,
> output, 10)) {
> -					test_fini(data);
> -					break;
> -				}
> -
> -				data->mode =3D igt_output_get_mode(output);
> -				data->w =3D data->mode->hdisplay;
> -				data->h =3D data->mode->vdisplay;
> -
> -				igt_dynamic_f("pipe-%s-%s",
> -					      kmstest_pipe_name(pipe), output-
> >name) {
> -					if (flags & (TEST_NONE | TEST_DPMS
> | TEST_SUSPEND | TEST_INVALID_HDR))
> -						test_static_toggle(data, pipe,
> output, flags);
> -					if (flags & TEST_SWAP)
> -						test_static_swap(data, pipe,
> output);
> -					if (flags &
> TEST_INVALID_METADATA_SIZES)
> -
> 	test_invalid_metadata_sizes(data, output);
> -				}
> -
> -				/* One pipe is enough */
> +			prepare_test(data, output, pipe);
> +
> +			if (is_intel_device(data->fd) &&
> +			    !igt_max_bpc_constraint(display, pipe, output, 10))
> {
> +				test_fini(data);
>  				break;
>  			}
> +
> +			data->mode =3D igt_output_get_mode(output);
> +			data->w =3D data->mode->hdisplay;
> +			data->h =3D data->mode->vdisplay;
> +
> +			igt_dynamic_f("pipe-%s-%s",
> +				      kmstest_pipe_name(pipe), output->name)
> {
> +				if (flags & (TEST_NONE | TEST_DPMS |
> TEST_SUSPEND | TEST_INVALID_HDR))
> +					test_static_toggle(data, pipe, output,
> flags);
> +				if (flags & TEST_SWAP)
> +					test_static_swap(data, pipe, output);
> +				if (flags & TEST_INVALID_METADATA_SIZES)
> +					test_invalid_metadata_sizes(data,
> output);
> +			}
> +
> +			/* One pipe is enough */
> +			break;
>  		}
>  	}
>  }
> --
> 2.43.2


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59614C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 05:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D864710E002;
	Thu,  9 Jul 2026 05:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgVUF6sn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9244010E002
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 05:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783575364; x=1815111364;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=a3QW3aDHQoeXfv5QJsVNfyC2kShKBQfw49GgL0Kr9l4=;
 b=BgVUF6sntQvtgqY8uvh3MEUTMs7T39WFGomCAjLNeKkDhUEWvy45ovbZ
 c+hnIMJXi4lgxoKt/CfPlmABdtAjwuJapeKiEHpX6s6pPosUgcmOHqeW3
 3q8irN72I3xxYCNnRTuBYkkRLhyEK97VsMZMI6K8rgWDIapagtnKAkYjx
 qPAtT38ioh9UbPNKshAuOq9kIVe9YxM4AiT4Rmc68XhfDxIcb2SZ5ED+9
 rzuREllkO5Hi0BzI+rMydI+lwT5AHy1qW/+TU1P/d2Le7vvlFjQdTq27h
 Do0fwm1Qlr6u1o57k87jXvLhQkqbJ95yb1ZQFMp3KPSbijPkiLEs7Uj/0 w==;
X-CSE-ConnectionGUID: 8LQBqZtkSAuULQAkVkvT7w==
X-CSE-MsgGUID: olPNyRDJRuCUdXlEvKb9bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84220249"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84220249"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 22:36:03 -0700
X-CSE-ConnectionGUID: fQFajJcYR1Smygk20BDdgw==
X-CSE-MsgGUID: uc82pMEBQO2Jfbi6BTr2GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258350036"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 22:36:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 22:36:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 22:36:02 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 22:36:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7pJmcXZF98PApgc9XEGnJHTVZN+ay92BLw3JuImD8Rh7tux3etpwGhkhiSOs6kCp24pbe0l70pd1TEb33Npuv8+JY5uJ8FwpMgwKWQ/Zt0vQWyfSu32wvl5iJHQgnSZkbJI1umOOUpmlA6A+XGCcrRU6EfOwVzoEQzved7zu9JAMll6WTv+53EziC6ZDpf4lbZ69aqzNY3Iu7GNQjCQj+Fb9JEYW5CbpK4iTBGanP7m1Ez9SIfLXra3W7ns4DGg1C+p8lWEKaqbFl+fVVzvdX4NG73wkYJV7IfxXMtWK0CYzl4WlFIJqsVyy//xYq+y27uoRkrN5uuokn9OrGgtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzWfHPV2VJom6kBNw0pAQfCA+Q0gGb8NR0+4xVURC0s=;
 b=yYAHEpa6yA5Acpw3ti/4OYSoV3lcEimClBk7HgcdVy+xoCn4qZwZCUPHQE6GkXMz/7gVAr2ndL47Bqza/xFaLpshnQsaXAvSWwm0NinkE0qTJ9MKWo0UDhL8pd4nIjldhuDd27W+r3aLk5EH/f0Lfo+T0ZlmhRYAtzZGU/yPJAMv33ej4RzfFzEoehmPIhBUIAWr2yNanJ4jxpbBT0pcxd+T6q3Nliyioi1YTqKEUwIHVfKdepP25ICR0k64RWoHNqGHZm+DzvBAOhVI6Hrqx71PUhLVjKx6ROg3jK0KmwDLVFlXrubIBL5JkFVvXFbcXaSNa1TI/+hWjciR+h88GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 05:35:59 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 05:35:58 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1] lib/igt_debugfs: Add "errno" to debug print
Thread-Topic: [PATCH i-g-t v1] lib/igt_debugfs: Add "errno" to debug print
Thread-Index: AQHdDyxlCE+d23LNVEOrmDqvsUmRHrZkqxzQ
Date: Thu, 9 Jul 2026 05:35:58 +0000
Message-ID: <CH3PR11MB84349AF0CAA00B476F3BD9B48DFE2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260708225223.866079-1-ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20260708225223.866079-1-ngai-mint.kwan@linux.intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW4PR11MB5822:EE_
x-ms-office365-filtering-correlation-id: 78039063-4507-43bb-5cc0-08dedd7bf49f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|18002099003|22082099003|56012099006|11063799006;
x-microsoft-antispam-message-info: JgJ2fMmNd9FLhNPScoFt6wU5O7FtrpJ+S+66hqnQpbc9iAKtRFWrIinWK6l4hOKptdblo8xf8DNNWH28QshOsx+qr+YwSl+9MB1DWUcStrTxdpTwU4zTwxL/6Lh92KqsEjaENw9mgg9bDqnAkRwC7kjL/0E/erh13Gp09Mgz9N1wbe7TqP8OAaxvTUH8TiXn74c0BDsmoLWoAon2NbP8ihLM9B/iPMkS+9kWf4WriK2pFc1/15OJkZTfqoNGdutZe3cL9IqycZxU61kVdsadeAIuCEaprDWq7V6flslZ1I2m3ibpseZkw5xZWPBD0CD11oqE/cb//O166drLUnCE6Oz+6IHTOwfSqHvEZYh2zpokZREtUUO2k2P8FsAg4fYlR/ffQVwn5Y1G1NRaPvsLgyjBWMWApFvkaZGW9ZwcaF2ANdtbMRxiK9TEA7zos5FSNF1TjJ0XsRgFxv8nzGcToHYocWG0K0VVFM4xLCePyl2v+cU0e9Ofc5iOmLFezFxhmcIS7Tp+NIMu/rwQ0rKSc+qXriVAQu7ctGMDd28hU0vV88rF4nEbkkwpR/6fs5jEJPS2+E2MwASAgTSkSMSS7KBH9+2c3RFHXC4UwptRrXKlc+pfy7mXYglERk3SKXorXJptDm9pr5HUMzSs0/+ejMyLDY/HfiPTxOkSN4Lm8h7WlgxdJk1BZjvKJzjI1qJImSE56KR9+YBapoZ6VkkSOwJEGCB41hPdPnmDFV5RCC0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tgzN8CPspqSS46sIOpLcMtAqDE43h8pCjdT/sW/ALZyQsuXi9aVdLyW7zjB3?=
 =?us-ascii?Q?5KWgPBCGgsn32G7UGbRa81mSfBzE611tvgkXY0nSFuy+wQ62LcuE/EzfSCdH?=
 =?us-ascii?Q?u5H0jmGnNEFzG/otYLtVfHlBUUWFmBzlL+LQfyBE0C/H2i9DoW3P25JNuW5p?=
 =?us-ascii?Q?2IHvmuYEtK6EiFJ2SUUo/uSPH5H4G2/0nP7CFe9lCDXf0DrN9kaeXyeV9cwj?=
 =?us-ascii?Q?SzXcAR8LILDHyXNi7XK5jXca5XlANvljizENQyCrlL8LFeLbHdRYGgYCovye?=
 =?us-ascii?Q?MvdbadS9LkHl24AEbQ6bAui7W9Sf8NvFomKarBc5YGCM9lhJK6Bw3Y18to1r?=
 =?us-ascii?Q?Q5yywquULj4snX3dPj9Hl9XRo6s3ElIFsCStvIdILuW9K3Ex6NS9coiOuFYF?=
 =?us-ascii?Q?YhoTPIttQk7XHkgvK9ACtWJjG0QDYlRO12LUnBQ4gLYQagr3/mVJ3h1RJejQ?=
 =?us-ascii?Q?4I5N0jK9NRBvQ+G8AyY+ME57q4AROm71ikWm2x18uhzGsygAtHLLwoycwaq5?=
 =?us-ascii?Q?JbUGnh1p1e/6Z5+sCSKv2K+hGnw1RjgBAvu7vDDEmqBU6qUz2yPB7iIBc9AJ?=
 =?us-ascii?Q?QFXj75yRFT4Sz89RfhCzIGYeRmpzDtVOdDfbw67aAQBoevu2GWDmPUW6dYfa?=
 =?us-ascii?Q?GPyrd8a9ddNeEzRWwP43wIHrwedq+3eNYkl4SKTS02A2+hMGZSTe1+tcZrsX?=
 =?us-ascii?Q?961d5lyIJO4p3bq43WKxL6NK6jIX9Flu8S7NMrLIWNU5Q8u9UumYOKA70Bsk?=
 =?us-ascii?Q?dHnpdL196Gj8j2SeDlrHv/iUe3EcLjDRksiWKNqUElldgNsQOJUP1VNdkRDK?=
 =?us-ascii?Q?N8o491uw6pYXN5w0Bb+azXfpYF6W7v4D9LKwPrUI+Vy1Xv5UJlwEWJWfMjBC?=
 =?us-ascii?Q?qCDTI10K4rlmh+i/7GtOwyPrsf90EAeJrkJffUk72W28jEIDxSPxiFC3fHMo?=
 =?us-ascii?Q?zbJDwK3xZcTKVLyPCvLmeZ1kP8L8MvKPRRw8HwGpy0dx0ppGNmQjJjAk0uDc?=
 =?us-ascii?Q?oNWgysGeBDX839M35difw3qaU+y1wiNl1qI986F+TSDORmOloxJxQCHpem27?=
 =?us-ascii?Q?2jVeLb5Gmjz3sD18LYVzLRmEMz7ENTVPWGsNlB4LDKGCQHXjz5VfX22SRogW?=
 =?us-ascii?Q?erk2UEAzxFLbeUp+yUf+fqECf4YaDdmkYhQ3kcOIrBQ2iYT168R2e02ulAh0?=
 =?us-ascii?Q?XZAN7ZfhU/k+KK3yPLxzhwlgamlAqy5TmV87O89EQjuue8M0mqulHCFsaL+d?=
 =?us-ascii?Q?ftmZ3SmA+Yjiy0DAgO2arOkCkAzYvS4gWqmx/ld8V3kaZU6X76EN4PTnfmEw?=
 =?us-ascii?Q?qAblzJco1GCfn+mhbAA4BW2hqjCHjevsxLzHjb0ADOBKXirCceu9U86PttRV?=
 =?us-ascii?Q?YQKRmHL0Xvi7R7ykeGT5zwf4SM6DnkJvLbPl15A1yX9pBJc55/X5hyIsFOQQ?=
 =?us-ascii?Q?koNHcmeL89gswtgM3VUoMqfAQ5x57rlaEtitjXbbwZcHJyUzsrR4NfWrrpCE?=
 =?us-ascii?Q?Xok7KNMuLshAiKAqnjbG1vYdz4/DDujxxzxm+QvdWin+Pewx7doRcjsElqAv?=
 =?us-ascii?Q?v1Wi7UkV2g76l3GY58bLOuA8QBy8F75XYbp9AhgQ/qt9mmWHyord92QdsMs7?=
 =?us-ascii?Q?gc5KT9h9siwFW/KEBz1B18+bt3h4r+6e4a84jcHNSrprWxA+JbfsgfyEur8n?=
 =?us-ascii?Q?CredFCMu0xsX5+yiUNmhjqF4vZvJsYCcqToI5cVkrxp7wVdnwap5OVNcx6At?=
 =?us-ascii?Q?zuZqML0gWy7LH4+ZwDMhyqghlbZrEWc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mVaj2aob//iEZPoUq59tCZE/5B9v858Xx4vgDXQb0qN6OFE8PEPsoMOyW1sCnB4cytssahDgk3wzfP0nWkzjujWwmmEJSXujo8a0vCzk35EMd0IgUfF4zBtFuLxr2xcHclGbgj7sM6JJR+zus1XMKOOi95vbQZW4TGiwmVtKui3/tEC8aN1yDf5cQ5UxWDM3HlMM4M3lpF73QqpiIuGP+sLoCVnLktvlJexsNXDhinx6yzFtDuK0QqQzRzRvY6mPfCoZdE9Szm742zZ9WkDVWnF6QuYrcnjaIEWM0OBU4+3tMRlvWxJao1PL7MQ2qnOnGTPi0bTpKjjJpPnOAiKNcA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78039063-4507-43bb-5cc0-08dedd7bf49f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 05:35:58.7954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W8OqdfPBDJkt4U8VS+mIQddZFhTkdruvRTP6bUnSbLU+9q0L+u6obVSs0S6Ale7uoB5g1jsYLrlGiQODXy3vrYJrEd6nuw1MyOEGlvSbMw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5822
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Ngai-
> Mint Kwan
> Sent: 09 July 2026 04:22 AM
> To: Sousa, Gustavo <gustavo.sousa@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
> Subject: [PATCH i-g-t v1] lib/igt_debugfs: Add "errno" to debug print
>=20
> When igt_debugfs_path() fails under igt_debugfs_dir(), add "errno" to the
> debug print for additional context of the failure.
>=20
> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
> ---
>  lib/igt_debugfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c index ed0a20773..a8c45=
945c
> 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -187,8 +187,12 @@ int igt_debugfs_dir(int device)
>  	int debugfs_dir_fd;
>  	char path[200];
>=20
> -	if (igt_debug_on(!igt_debugfs_path(device, path, sizeof(path))))
> +	errno =3D 0;
> +	if (igt_debug_on(!igt_debugfs_path(device, path, sizeof(path)))) {
> +		igt_debug("Last errno: %i, %s\n", errno, strerror(errno));
> +
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  		return -1;
> +	}
>=20
>  	debugfs_dir_fd =3D open(path, O_RDONLY);
>  	igt_debug_on_f(debugfs_dir_fd < 0, "path: %s\n", path);
> --
> 2.43.0


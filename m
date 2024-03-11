Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDB7C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 06:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD35D10E0C9;
	Mon, 11 Mar 2024 06:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuZoL+zQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F0810E0C9
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710137057; x=1741673057;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Itief2D6gWWQcQ1fa9q5NPxLGoQSCLj04gmNizuztVY=;
 b=kuZoL+zQU7G1Rcj8HjDhX2vDNtKUN5WJZlAot8P0HJ9KE+R8MBncTSWL
 IbwRV6tDjeD5sUoZ2qXM/8HMJ/1wXJhoUT2rsLl0ylw4BQRUe2G1LK4gS
 TM+bgjNlboABKijvMUUDb86/01/NKyBanK8ZhzEXRs9OCDhcwGxZpGcqc
 0CiVZ+458S9+hWhVuO5zEPHfMy/OdZJijmkNRzIIgNFjxyc1Xklrx8WR6
 OWd+tBYyiXBg/tGWL4Zs6x4U8uu/3WfwoTZgjkCKnJ7zIQbdSw08sygea
 Hc26Okx6WBCX9v8qqtdGfnOLckPTOabKoTb5Ma8wa0mSJvO2RjycyyvJ9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="27254087"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="27254087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 23:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="15759415"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2024 23:04:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 23:04:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 23:04:14 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 23:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLDmFC4H6MWxI0KamGTyLWpoAbdEXLPUYZT18lxgrjLuLJ1JBLFGlQWoFddOd1C2fpMF1DtEE9cb1MOgEoppU8F/LqgieON3Gr/JFzyCGFhCPai2ugrzdOHSzOguLWs5cS4Ev1F0dgodMYvppwcuknQHLELfR7F4mJMTxWJXsxYwVamsZKYOzTH5q9iel4F4gfotd6g7QjZHELttlDTHDnX0BQ++TP/h9aBGmvRlm0WLESKbnqTZs3sg1J5o719+nDK4ODofR6Sx9p0+opJ5ItViDwjp34RUN6d3Roy2surw99ei/uEhPQ7zqnna9SXmtjXX5hVa/HS6rMQcoDTnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5UrTOPNrmT7E6U85M5hte/nDBZlSfEW0brP5D2x0vg=;
 b=L4NypxXzx2jC0KDusJZok6MRWZtFTMrEkdjerhefSMi0jccBWvO53n1aadeGsK9ilX0FjatlUZGTeIKT9e0DaUeUyuU8CRH610kdCOz3loXvDUd5/a4HD1g/MmW0HKX/j0whura3HAQXHKxKoJM75Q42JoPYfZYP9k6taIIIZqlHX04rGuUvLUd5YelR0HXaSDTBgQMIcMbEEM8EgNAOxKZ3oxPiRfP6g5q7uNHSCv6YxiwN3Odx6n9bpSyMBmYpc7h93qYcZbrq76p0il/Wgp7LHrmDtTvF1WR+zRFVMDHiuqse1K3VaIB/Vqle67e/R9Jh292XkLZ7uCHoHnO90w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY8PR11MB7748.namprd11.prod.outlook.com (2603:10b6:930:87::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.15; Mon, 11 Mar 2024 06:04:12 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553%5]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 06:04:12 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B S,
 Karthik" <karthik.b.s@intel.com>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel-ci/xe: Block pc8-residency tests on XE
Thread-Topic: [PATCH i-g-t] tests/intel-ci/xe: Block pc8-residency tests on XE
Thread-Index: AQHac29I9DuGRFhrZECbFDGe7zPq8LEyCuCw
Date: Mon, 11 Mar 2024 06:04:12 +0000
Message-ID: <DM4PR11MB6312086889E50B53378FC8DD90242@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240311044115.3665980-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240311044115.3665980-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY8PR11MB7748:EE_
x-ms-office365-filtering-correlation-id: 3c1e087a-d1d4-457a-9dab-08dc41911306
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GoywRpHzBDX2dNfjERsiF6OtRUUrqfG7riQhWrM62liMlgD8DqJKnEysovqqlfZVZI5R/t0wG5slkLBzczU1+3zfkVjvRWZASbOWon5e5UT3T2f1MfOQCKfYDDv7Q586hJitBjxV/NYs3/NOxgQvZi61fbxG1s69AqnTpM9DXpsvtGnMk3pg4bpT64tsnqmVZc86kJK5hCNRKPACA+tv05uR9vdT0MJHUZfv2ZkYLPRX8ECLM5ngCXBF6YQNAzYV3Nj74XtQb/drgIiHODcB6OeoMMIulydvmtXo9XWi1GDxjsecyEL984a/k0C8FYY6POqlLNovrztOvg2q4/+rFZfDa1uf9Daa3ir6jaOQ3JkN7KkzDn0oI/ON3LcoEICYXzh1fwxHK6bluuXm9jM1EayRsDy79bwLmGNiqcODvwCjQGFgxLG1APUEMXuIeZ+BDAMfWpkSAxXsTAHCYgNSytolNA2hXnFuwxx/QqmEgGo5u2CkJa5qKCchOWUzwYut9c/xuf/y/0S8ihHOFgYe+drCPEjZdvsDvA9xwwk6RAPtlljKAycxGU2XL7hq/qhXkkp33Q+ZNxoSj+9XUqE8q7FjssJ+Uy+r+1wen2LwyL7H00e9XUsnu4d3MClzjE5OEWIo8K/2/imrJUlnLU+4HTBelOgi44EIwN4N1f5JFh+MwUQPJ/qq8UAhbCuPK/UnAp1fpTB6SgUuNBLI/ldueoxKn2okpiKoAn/LIba/XKU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VRNqqSvuaFqaEHQGoBmzbBWHUS+0LYoxX1KaptGZl44b9czVEeVOo7NQOIHL?=
 =?us-ascii?Q?Q+cQz4pD8LgdvKeQV/B5tcBUoejIUUof4AKlbf849H0s7oWwWTfMsHfC8p9G?=
 =?us-ascii?Q?XmER8v+9w7EbPF4jAMShvqITUFSCrRU4lVKa0KDevrpooG6yOyVgStBIREKd?=
 =?us-ascii?Q?hq0lotTfixycKxeBi8cJPsl+RSU0hXLWyBd8w4rnIA+YvYmzMBFuW+w/k2z9?=
 =?us-ascii?Q?UWnMBuCdLsqZs47ocJSE7C17kmLb4n+NxmrJy7gfFeoygQBvNUjrIzGyFRIP?=
 =?us-ascii?Q?CcZl8dZOw+KfZOjslv1/WFw+eggc6YO4Lv57FUW+yP7owFxUWvLzkhBI9iBj?=
 =?us-ascii?Q?8X0E4hqSikjAMobi5UaS+nFvqgHaCqWC9gzPIq4/u/dp9USYmFtErbklpOuq?=
 =?us-ascii?Q?RTbjNG1pLzuA0J4yPgHsJ/EUSyXXOFJWVtXPHyavCy45Iv5EhM35w6kbD6FW?=
 =?us-ascii?Q?ne51AKU73QM/Hl1lHEtnEZWgpXbxeAeF0e3JwGmxyY6g7Uwu4lkaZWc+Aveg?=
 =?us-ascii?Q?Km4EX0/vIn/tqWwxP7Nk4Hl1KeqGRyt6jNPAX5tLVY5daUplQi39O2LOJPoQ?=
 =?us-ascii?Q?nEZGkzok0Fg2m+FsiB+HTpNSN3oqp4JYk3QHmOlQ2AhxMIJ/SO26dS/l8xvc?=
 =?us-ascii?Q?0jNJzFkjN5ynLhJrBxZ0A4OwXtfUbq0dixU174rfec0+Oks4KIFmtXIXtOdw?=
 =?us-ascii?Q?WmT5MOvSbiNkM8uNdm49GHDP1oKcKWFE2NankQVtDsgKwKVvmIE5YwzsPKL1?=
 =?us-ascii?Q?CGoLM6qLTn1Ht2HFMJwFbG70hX4RDZn/3qRIC/IDFL1k/rFNX2fEnmAuDBMt?=
 =?us-ascii?Q?kMzxbFipck+XSlY0lNC+fa/26PO04dEZ3GroODKwEx+La1ubWiKdq4KYZzn5?=
 =?us-ascii?Q?Flp3GEo3moJh1l3mwrrzD1Z4MJ33obcNz56jkUVNzmFzU/TxGokamvfn+Ton?=
 =?us-ascii?Q?7+2p7oaw5/ZQXKmZRSa+NBskiwH9SV915K+G69STdjnIjxPkh3Y64FJhSbLw?=
 =?us-ascii?Q?R94TZ0TrsN1gGkSrVlr2LvCaiNKfJLoT4y+XA8GeFslGCR7HG3niPkNPP0AH?=
 =?us-ascii?Q?VRM1yAhnsRtSUeeoj25oasZs9jFkVNjgQ1YYqLBL+u4U5ZstVzlaGatmxdyk?=
 =?us-ascii?Q?hLXGx+lNLvrd7nCGrW6aSKefqFr4hl0gHAHsmMzu8CWOm7LSwP43PgggNFCP?=
 =?us-ascii?Q?W/VgLg40WkipayEXAR75gU2L9bxpahnu3+uCzv1R5g1ueERyUsFvJRMzapax?=
 =?us-ascii?Q?wQTWHhILiu8aWtp3eyZtnKQTdSTbuJVJN7v3Nx0a+/NrRvRkHZ9/ULPTGKvG?=
 =?us-ascii?Q?7xaJ9sj979zAIRT88WBCFa+F55j9k/cw09q6+qbY5m3lZyNOHsOX84RIJINW?=
 =?us-ascii?Q?q3/dqr8gAT3uRz8MwqrUgnmAHEyNwKEo+MCuLNvk+GYCrzxXpgJrLJVf0KSi?=
 =?us-ascii?Q?LP8QTKKqQvTax7G5C/oKwi+PNB7KHbfk4tWJB9fKiVNDa7wEeeLXh80TT/RL?=
 =?us-ascii?Q?ffTetCVposVQbWFMGqKGn0YaFrr9eousdS+ZxNDZys09Cj0hbgo7wOvxeoVf?=
 =?us-ascii?Q?MCm2FDQjNKQtZ175luM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1e087a-d1d4-457a-9dab-08dc41911306
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 06:04:12.4996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2TybwwZyuPis2YznK6nPVM727IAEsVdZMpxK1DCXX6Ai43DO90SdX2nS1BiGJmEWeVQ2MTijfaJpjzWJIKzSrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7748
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

Reviewed-by: Jeevan B <jeevan.b@intel.com>=20

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Monday, March 11, 2024 10:11 AM
> To: igt-dev@lists.freedesktop.org; B S, Karthik <karthik.b.s@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t] tests/intel-ci/xe: Block pc8-residency tests on XE
>=20
> As pc8-residency tests are not valid for XE, block these tests to not run=
 on CI.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> bc1325bae..f414017eb 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -71,6 +71,7 @@ igt@kms_pwrite_crc
>  igt@kms_rotation_crc@exhaust-fences
>  igt@kms_pm_lpsp@screens-disabled
>  igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
> +igt@kms_pm_rpm@.*pc8-residency.*
>  ##################################################################
>  # KMS: Invalid combo:- PSR + DRRS can't be tested together
> ##################################################################
> --
> 2.43.2


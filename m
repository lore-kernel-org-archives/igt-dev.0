Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC602D2505C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 09:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADCD10E06D;
	Mon, 12 Jan 2026 09:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="By3yr+jo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE3B10E06D
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768209687; x=1799745687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a6z8jT/321IHxZwxGZFEL95CvXBpdiN9rVopBCFJaoc=;
 b=By3yr+joKcMgE7s1t8Qw2hLVNh6EfiLgej0+vHWXICnwIyrRjA01yEQX
 ZsYESiHHQfAgDVT4cZF9pdDoV50SlZkpm/HFB/uGjayvMGomuihtWLXqs
 DcUEpnR0WJeJVpRmBLWXNP+Xh9FSZ1PdzGizsNsvwN+drG0Z2h3iwZl1r
 VYyn+6NASWvlAZgz9svDPUJ4VxD8NlF8n5mM1lDyopRl3B6jZ9jsc/3r6
 UOIO00jYYN7Rf2CvoElBFP/Ri35fpmttMNaYZcwrcbsWRSyGDroYoRo/Y
 FRTOvC+9L7rQrFNDow/DxAashKoWOp5EHVCHUkE9jpoGa3U/Jlt7wkpJD w==;
X-CSE-ConnectionGUID: M7jRNLDVRcWxJxRGniwrow==
X-CSE-MsgGUID: CAeYajIIQjy/y1GCDlAlag==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69380521"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69380521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 01:21:26 -0800
X-CSE-ConnectionGUID: JLnx8LuMS96z0YvJxFc6fQ==
X-CSE-MsgGUID: hDIXFy65RH+B3O2vMZ18AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208567215"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 01:21:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 01:21:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 01:21:25 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 01:21:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRcqt8oK1dPehIMy1ZMwpDavjMHMMJxH//M/r1btrhecwmCEdr0DfHGOT8ii/2Y1Uu8grSyWDuOjtyxJUOkqbFmgIQskWcZ5+8abubbbVMXdzuByfE8w1MSMKQ99xlqVZwTQc4xoWu6JonnXTT5IbrW331IRrJD+Gls2AXthHqMqpu/uxI9BK71ri02AL2/LheUco7UclxgmqWT103XIwU5dgn78B5NQyABEkzR7U3wpWBBpL9gXLlDhweZi5ih/zElwCqNYTkJySXA8FhqLICnLLND7xAH7wtlH6eY3hXHFDU17HtEIq4AE3bpckj43R5bgYi9Pi6JGICF+cTrEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1BZ4ME9Rd3wSA2zVEQMDs3tFHt8NneyUcCYaoyjPwE=;
 b=iaVbZi0LA76ColDuipv/WGzUHpWxznK5Ys6vjlYbrSZYp3cv0D/H2GtQCHrC6YYMHJ011DTtihWtdyTHLwpuqlZhdWJ7rQcy0XCtjD4SEYcD3nGsYgp6da6bkrYG9C8J+TdVdqTvDjAcmm4Fetpb9+qSbhBGOi/pQOLKKcdsQKg1VfH17hS79w1zDwKiEjLtWTqKxIl3MauZ6XySNYaCLcuZP2D5Ovb0nivNSD95+dIdf2FSHvQ1bPNAOdxOGaLNU7KC9GrQu9wwtXDEwW96DKwnNBbgAypJycwDHkNYX0/ciUXpNk9K61CFrfS1GaN9cyiFa+UI/YM+fBtOItJ8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 09:21:23 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 09:21:23 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/kms_joiner: Add check to validate mode
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_joiner: Add check to validate mode
Thread-Index: AQHcg6BXdYGTvIPno0e1KFDOEo5e17VOQjMA
Date: Mon, 12 Jan 2026 09:21:23 +0000
Message-ID: <DM4PR11MB6312F0FD241D3B1FB36404559081A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260112084455.157949-1-karthik.b.s@intel.com>
 <20260112084455.157949-3-karthik.b.s@intel.com>
In-Reply-To: <20260112084455.157949-3-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM4PR11MB7280:EE_
x-ms-office365-filtering-correlation-id: 36a4a5cb-514e-4a2c-3509-08de51bbf48d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pTeVrMc1zTcmSRRJPafRm1NfzLprPbFat7q7BaLfLCCXvtVYta3q0mqBz/am?=
 =?us-ascii?Q?pQTdhlW9yPIKZzBZa5oFe9x5oSsIyt/Q4oJUy8FPRyMRyvVxsrinzKWEHx1D?=
 =?us-ascii?Q?rs8he8Wi1JhdcK0M34SpqFHG5iAYXQWS7QfiZpwJMzT3zZK9vKjwZOyGcPga?=
 =?us-ascii?Q?ue8z7ws51TC/ZC6BdkQmtZ8DNzq6dsO0QdimflWSa7+i+DGK7qHeTr87xtzB?=
 =?us-ascii?Q?GT4hx0Ky7aXczNiJVhbo1Yz70Y8pLS+NE/NYgmrvceUb6hCt8aVR4FaAJn+T?=
 =?us-ascii?Q?CkJwqs6ZiM8Z96fk9XKl79yWnJSyDUVFflzxlXiwT4VYiM+j1fH4em9lNe3C?=
 =?us-ascii?Q?cBX1rvE01chl7jGU/q0OyLW+a/KKXpqXwkeO+nY5f3Mv842NYCk8pFtCLE8x?=
 =?us-ascii?Q?keuI4qx2SHyFIC1SC1ZYH8cK+eCgYaxalNd75Xo8crOBtczVfpQCyCq7Q4A/?=
 =?us-ascii?Q?0ZodUuEcLJrt7hSc3enGM3e7K/sSUj6jnzo11UHwv5jVj92O6gGY+xRp0TO3?=
 =?us-ascii?Q?5MG1fR/WiFTpuxxbLybrqs4dj7S4dMOpMJ0Ku3DSM6uNG1kqsL8J72T1WMqY?=
 =?us-ascii?Q?pL7oYGG29pU4aYIYEt5TZgQ45GWZBu+U+5wYU4XAYEoSKAIASaQaadYQ3zqD?=
 =?us-ascii?Q?1jRkZ46incosK/aZflKybJ5MAOPanXpGDgKdOOZh6yF/oTcjp2I97cBE4VXI?=
 =?us-ascii?Q?4bgDrUsTE7djjD+lsHiRE9jK33sBdG5Mdc9S+5xgrfFJ8u00PLCk8a+cQcBn?=
 =?us-ascii?Q?J2K+DTOT25XQmZTIy5uBObOVGecYBgg2kZLeoojj1LzZRupoFNC7UhTnpn5+?=
 =?us-ascii?Q?3JeGhFNZRSNToqmMqjA8ueSL4janAqOq4QzFpYBtrTMZGC/afAp02MIBHF1x?=
 =?us-ascii?Q?bv4EgG+J9JPfUPCaGpjIoxWk76c4IISt5rN4DipfwovQA4CsTxKKFRh59sbV?=
 =?us-ascii?Q?v8n9htkeNU3XDn41lxWiouG4+4ufWbzxlbe87Bi7kk3hioG1SZ5NpdDD3IPI?=
 =?us-ascii?Q?s4RcLFsGHcxOE/Diw4lAFBHOTj54MFKetYQCBfH3rqcWrQOkVcu/KVIR8+bS?=
 =?us-ascii?Q?rXQE4MYmEG0csqhgFY3QRIgRswlBAplFD+d47bg/sE3q2uWJ8J8rvsJBX9VN?=
 =?us-ascii?Q?ABEoyXSwZqlQMdu3AePMic3lXN1k4ax7ySip7IcBvYxJ0e1dy4RZvSF4bvex?=
 =?us-ascii?Q?znoyF8d3nyq1GC3P/2gSCNfwfQ9OvFS0Xdl9bRMiIArbTLtUd/URP2p0VVaz?=
 =?us-ascii?Q?ZNUhzb8ZlHO1h3+PHOAYglnoZKHqYABSrt8F3l/VaqyCKqao3sj0czamJPo8?=
 =?us-ascii?Q?56dzpMi65ItGsrkkqUmPmSLSIz0tCHt8Eil4Xna2DhF0/pu0km25pIaesYdx?=
 =?us-ascii?Q?G4RLVWdftmLjclMBqCY20LfI3PdQEmWwJWia48msACOiNIVP/Ug/+jwb7vvi?=
 =?us-ascii?Q?6IdSqy6G09iQaxy3Fwitk9U4L/cloOIa+8DIUTotHpy2Z/TMbLnfHQxAt59j?=
 =?us-ascii?Q?YeKqH0++3qYFa/xp+dt5qvUH2xXdVDLIqSHS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0rU9JmKZnmeoW670+SEd23gNNJGncEMJkTkdKYCD4OPnA3aaiCp8B7ZZwSop?=
 =?us-ascii?Q?t5LWExuX2At8VpujPIwN2CDCclYCCImZfjlMH8CU4KA1gbZ2uNCg82gOqjVZ?=
 =?us-ascii?Q?rmghtiLKET/gyPex+3lWuk1006H9AFt06Sbyuvfd+HiA5BqyH+FBy/yCP//N?=
 =?us-ascii?Q?sKBcbLQhDRgkf3c5xAKtjijoDfaq1sk57q9UGW49ikiOLnE2eUvOaUioNqcL?=
 =?us-ascii?Q?gQec6keGViYOoTdPNH+7aEQfuG6Cuj9NKqDvpthI3pyejYah8BXDh4B/5orw?=
 =?us-ascii?Q?lQUNSauvlHj8vK5xdRYd0CDmPYTDq/gZI40At5epNxPhe9URynB2XN/za3XN?=
 =?us-ascii?Q?qTSIY51RZeMsFtzDGGuTDa3Viqhug4z5iob3V+R49VK8i06eecQyrGW4N73y?=
 =?us-ascii?Q?Ujm55YzZOXGGakfZkgFoD8+5pzfIldNSk91tpK5tFEZBigOzAsp4xMQfUKVB?=
 =?us-ascii?Q?cZH7DvADZ/QhWccPJVH6JbGVv+HZdIzBvvXWGjPaoaxQKexxKYqkJ8Fvvsq9?=
 =?us-ascii?Q?x50KmZs9KqFxMVGx1KzHCNXhc/uuPHVHzk1ZGQmGmf5v0cxy9zFtmcSgKYPd?=
 =?us-ascii?Q?lnOndj3/KcH4v0zx3bIvx1tPOIIeWJpJPP+Q9BZbkblESZErBlZ1SmygDDGH?=
 =?us-ascii?Q?Eb9zf/WZFGm2l+VVDgWrpnnEm7aKUwxoYBOJShvht4MsxTsCzUwWugy3H2Rq?=
 =?us-ascii?Q?HClo8zUVyzn3NYLFrgsGrbx0eb1xttQYPhE2C6LZiHaJ/NyU8HpkZVu9iT76?=
 =?us-ascii?Q?LAhEMHyLBIvDEmE8Ipu6iVVhchZQHOx8Vmmo2bcrViXlRpYiSMbduKuvA3xc?=
 =?us-ascii?Q?aqp1A+d9TGCHJnRstu0S45ALjnXrg4HAoo8JTBruxt6lsW8zGS7zjdO9ULaD?=
 =?us-ascii?Q?pxui4G0pN3XEfIfj61cc36KaoB9uJU6uEx70BpVwSDYWR+giO6l2jW8lQtgt?=
 =?us-ascii?Q?kj1/mBkJtJDS5J7M8RAanoTMdCJcpUYxe83/FAnZCH4mXpWO0spEe3Oykntt?=
 =?us-ascii?Q?pkwFsT3Vly5/t1vaBgaM6YQ9mmkzrbVfLcM92ZlgmfeGgEjKZJ331AArq2dh?=
 =?us-ascii?Q?enQKhZe4iQbEuIhA1xc1L1G1KuBDP1q/qhfhlaX5kWpjtly9naRJokqZC8FN?=
 =?us-ascii?Q?y/UCWYGpi6dA0s4oRB+oq1arxidzxvy9O4Xq5xs0j5XbITF87cWZLm5hs6KU?=
 =?us-ascii?Q?SdCZmyNUrOlk5BiR7guKxjD3xdfhXRZHX1W5vMs7CGl+Ymsa/B1MGoriUy6L?=
 =?us-ascii?Q?4K3z79RNsIDcPEK8w4W89A5xx3rT7Toovs3Z2BN0dVJ4DsRbSndKMcRqnKiP?=
 =?us-ascii?Q?zU6tmehpwAwRhZGtnz8DxebZYhRt/BnGlPc2sLhO/Pi5+hmtbgSQQwNw+MEb?=
 =?us-ascii?Q?EkSd+2E73IVB7OkkxJFDqVY6wYRMVdP/tNNWaQW5KKjQyb6qMXiC1VRfgrYK?=
 =?us-ascii?Q?UjDra7wr/zEwzEz0lPGIHkNG3ndeaZEStNKo74c4nALHAeGZWY54aWnBuk7r?=
 =?us-ascii?Q?URy+89zaC3R9TS8zmIAxGoqGjWj4GdeJKlN6zN77knAKbosBKXyLmROJmZ1L?=
 =?us-ascii?Q?CSpiFIO51H+rEsSiMJIh7qBdo3aMdkO0wx8PXLljkOFyrOmkE7sU6LbcdRqB?=
 =?us-ascii?Q?BiKVenpPoW3e9+6IkSMBcY1pz8bra3Mj1vlxZUAsE8sCWeQYQ7QkzLfXZdQD?=
 =?us-ascii?Q?AYh1Y578C3sidaw3+o9kWQ0JEVAWkve6PXBuk30/Vo2upWCg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a4a5cb-514e-4a2c-3509-08de51bbf48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 09:21:23.6272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q4CDmqoTD3STL2NJd7e9pLiH8eu8Nij9DCTlXpRJczxg9MSBhogcuK6R1r4osYUc6ocURQqNwBSsXowhOf+Pvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Monday, January 12, 2026 2:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; Sharma, Swati2
> <swati2.sharma@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/kms_joiner: Add check to validate mode
>=20
> Add check to validate mode to ensure that invalid paramerters are not sen=
t to
> create fb call.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
LGTM=20
Reviewed-by: Jeevan B <jeevan.b@intel.com>=20

> ---
>  tests/intel/kms_joiner.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
> 2aa43e474..bf817a453 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -378,6 +378,7 @@ static void test_invalid_modeset_two_joiner(data_t
> *data,
>  			} else {
>  				mode =3D *igt_output_get_mode(output);
>  			}
> +			igt_assert(kmstest_mode_is_valid(&mode));
>=20
>  			igt_output_set_crtc(output,
>  					    igt_crtc_for_pipe(output->display,
> data->pipe_seq[i + j]));
> --
> 2.43.0

